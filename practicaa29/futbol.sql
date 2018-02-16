

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
  CONSTRAINT partidos_ck CHECK (id_equipo_fuera != id_equipo_fuera)
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

