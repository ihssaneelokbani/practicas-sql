

CREATE table  equipos(
  id_equipo number(2) constraint equipos_pk PRIMARY KEY ,
  nombre VARCHAR2(50) CONSTRAINT equipos_uk1 unique
                      CONSTRAINT equipos_nn1 NOT NULL ,
  estadio VARCHAR2(50) CONSTRAINT equipos_uk2 UNIQUE ,
  aforo number(6),
  ano_fundacion number(4),
  cuidad VARCHAR2(50) CONSTRAINT equipos_nn2 not NULL
);



CREATE table jugadores(
  id_jugador number(3) CONSTRAINT jugadores_pk PRIMARY KEY ,
  nombre VARCHAR2(50) CONSTRAINT jugadores_nn NOT NULL ,
  fecha_nac date,
  id_equipo NUMBER(2) CONSTRAINT jugadores_fk REFERENCES equipos on delete set null
);

CREATE table partidos (
  id_equipo_casa NUMBER(2) CONSTRAINT partidos_fk1  REFERENCES equipos on delete cascade,
  id_equipo_fuera NUMBER(2) CONSTRAINT partidos_fk2 REFERENCES equipos on delete cascade,
  fecha TIMESTAMP,
  goles_casa NUMBER(2),
  goles_fuera NUMBER(2),
  observaciones VARCHAR2(1000),
  CONSTRAINT partidos_pk PRIMARY KEY (id_equipo_casa,id_equipo_fuera),
  CONSTRAINT partidos_ck CHECK (id_equipo_casa != id_equipo_fuera)
);

CREATE table goles(
  id_equipo_casa NUMBER(2) ,
  id_equipo_fuera NUMBER(2) ,
  minuto INTERVAL day TO SECOND,
  descripcion VARCHAR2(2000),
  id_jugador NUMBER(3) CONSTRAINT constraint_fk2 REFERENCES jugadores on delete cascade,
  CONSTRAINT goles_pk PRIMARY KEY(id_equipo_casa,id_equipo_fuera),
  CONSTRAINT goles_fk1 FOREIGN KEY (id_equipo_casa,id_equipo_fuera) REFERENCES partidos (id_equipo_casa,id_equipo_fuera) on delete cascade

);

purge RECYCLEBIN ;

--2
alter table equipos MODIFY (
  aforo CONSTRAINT equipos_nn3 NOT NULL,
  estadio CONSTRAINT equipos_nn4 NOT NULL
  );
--
ALTER TABLE equipos drop  (ano_fundacion);

alter table equipos add(
 ano_fundacion  DATE
  );

--
alter table jugadores drop constraint jugadores_nn ;

--3

INSERT into equipos(id_equipo,NOMBRE,CUIDAD,aforo,ano_fundacion,ESTADIO) VALUES (1,'Cascorro F.C.','Cascorro de Arriba',4000,to_date('1/1/1961','dd/mm/yyyy'),'La Arenera');
INSERT INTO equipos (id_equipo,NOMBRE,CUIDAD,aforo,ano_fundacion,ESTADIO) VALUES (2,'Matalasleñas','Cerro galvez',1200,to_date('12/03/1970','dd/mm/yyyy'),'Matalasleñas');

INSERT INTO jugadores (id_jugador, nombre, fecha_nac, id_equipo) VALUES (1,'Amoribia',to_date( '20/1/1990','dd/mm/yyyy'),1);
INSERT INTO jugadores (id_jugador, nombre, fecha_nac, id_equipo) VALUES (2,'Garcia',NULL ,2);
INSERT INTO jugadores (id_jugador, nombre, fecha_nac, id_equipo) VALUES (3,'Pedrosa',to_date('12/10/1993','dd/mm/yyyy'),1);



INSERT INTO partidos (id_equipo_casa, id_equipo_fuera, fecha, goles_casa, goles_fuera, observaciones) VALUES (1,2,to_date('5/11/2016','dd/mm/yyyy'),2,1,NULL );

INSERT INTO goles VALUES (1,2,INTERVAL '40' minute,'falta directa',1);
INSERT INTO goles VALUES (1,1,INTERVAl '20' MINUTE ,'penalti',2);
INSERT INTO goles VALUES (2,1,INTERVAL '70' MINUTE ,'gran jugada',3);
SELECT *from jugadores;

SELECT *FROM goles;



---4
--
UPDATE equipos set nombre='Real Cascorro' WHERE nombre='Cascorro F.C.';
--
UPDATE equipos SET aforo=aforo+500;
--
COMMIT ;
---
DELETE equipos;
select * from partidos;
select * from goles;
--
ROLLBACK ;
---
ALTER TABLE  equipos add (
 provincia VARCHAR2(40)
  );

update equipos SET  nombre='Cascorro' WHERE nombre in('Zamora','Matalasleñas');




