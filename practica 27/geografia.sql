CREATE  TABLE  localidades(
  id_localidad NUMBER(5) CONSTRAINT localidades_pk PRIMARY KEY ,
  nombre VARCHAR2(50) CONSTRAINT localidades_nn1 NOT NULL ,
  poblacion NUMBER(8),
  n_provincia NUMBER(2) CONSTRAINT localidades_nn2 NOT NULL

);

CREATE table comunidades (
  id_comunidad NUMBER(2) CONSTRAINT comunidades_pk PRIMARY KEY ,
  nombre VARCHAR2(25) CONSTRAINT comunidades_uk1 UNIQUE
                       CONSTRAINT  comunidades_nn1 NOT NULL ,
  id_capital NUMBER(5) CONSTRAINT  comunidades_uk2 UNIQUE
                       CONSTRAINT comunidades_nn2 NOT NULL
                       CONSTRAINT  comunidades_fk1 REFERENCES localidades,
  max_provincia NUMBER(1)
);
CREATE table provincias(
  n_provincia NUMBER(2) CONSTRAINT provincias_pk PRIMARY KEY ,
  nombre VARCHAR2(25) CONSTRAINT provincias_uk1 UNIQUE
                      CONSTRAINT provincias_nn1 NOT NULL ,
  superficie NUMBER(5),
  id_capital NUMBER(5) CONSTRAINT provincias_uk2 UNIQUE
                       CONSTRAINT  provincias_nn2 NOT NULL
                       CONSTRAINT  provincias_fk1 REFERENCES  localidades,
  id_comunidad NUMBER(2) CONSTRAINT provincias_nn3 NOT NULL

);

ALTER TABLE provincias ADD CONSTRAINT provincias_fk2  FOREIGN KEY(id_comunidad) REFERENCES  comunidades;
ALTER table localidades ADD CONSTRAINT localidades_fk   FOREIGN KEY (n_provincia) references provincias;

DROP TABLE  localidades CASCADE CONSTRAINTS ;
DROP TABLE  comunidades CASCADE CONSTRAINTS ;
DROP TABLE  provincias CASCADE CONSTRAINTS ;