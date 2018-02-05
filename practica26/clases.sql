CREATE table empresas(
  cif CHAR(9)  constraint empresas_pk primary key,
  nombre VARCHAR2(25) CONSTRAINT empresas_uk UNIQUE
                     CONSTRAINT empresas_nn NOT NULL,
  telefono CHAR(9),
  direccion VARCHAR2(50)
);
CREATE table  alumnos (
  dni CHAR(9) CONSTRAINT alumnos_pk PRIMARY KEY ,
  nombre VARCHAR2(50) CONSTRAINT alumnos_nn1 NOT NULL ,
  apellido1 VARCHAR2(50) CONSTRAINT alumnos_nn2 NOT NULL ,
  apellido2 VARCHAR2(50) CONSTRAINT alumnos_nn3 NOT NULL ,
  direccion VARCHAR2(50),
  telefono CHAR(9),
  edad NUMBER(2),
  cif CHAR(9) CONSTRAINT alumnos_fk REFERENCES alumnos
);

CREATE  table tipos_cursos(
  cod_curso CHAR(8) CONSTRAINT tipos_cursos_pk PRIMARY KEY ,
  titulo VARCHAR2(50) CONSTRAINT tipos_cursos_uk UNIQUE ,
  duracion NUMBER(3),
  termario CLOB
);
CREATE table  profesores(
  dni CHAR(9) CONSTRAINT profesores_pk PRIMARY KEY ,
  nombre VARCHAR2(50) CONSTRAINT profesores_nn1 NOT NULL ,
  apellido1 VARCHAR2(50) CONSTRAINT profesores_nn2 NOT NULL ,
  apellido2 VARCHAR2(50) CONSTRAINT profesores_nn3 NOT NULL ,
  direccion VARCHAR2(50),
  telefono CHAR(9)
);
CREATE table cursos(
  n_curso NUMBER(3) CONSTRAINT cursos_pk PRIMARY KEY ,
  fecha_inicio TIMESTAMP,
  fecha_fin TIMESTAMP,
  cod_curso CHAR(8) CONSTRAINT cursos_fk1 REFERENCES tipos_cursos,
  dni_profesor CHAR(9)CONSTRAINT cursos_fk2 REFERENCES profesores
);
CREATE table asistir (
  dni CHAR(9)CONSTRAINT asistir_fk1 REFERENCES alumnos,
  n_curso NUMBER(3)CONSTRAINT asistir_fk2 REFERENCES cursos,
  nota NUMBER(4,2),
  CONSTRAINT asistir_pk PRIMARY KEY (dni,n_curso)
);

drop table alumnos CASCADE CONSTRAINTS ;
drop table cursos CASCADE CONSTRAINTS ;
drop table asistir CASCADE CONSTRAINTS ;
DROP TABLE tipos_cursos CASCADE CONSTRAINTS ;
drop TABLE empresas CASCADE CONSTRAINTS ;
DROP TABLE profesores CASCADE CONSTRAINTS ;

purge RECYCLEBIN ;
