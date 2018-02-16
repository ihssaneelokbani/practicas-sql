CREATE table puestos(
  cod_puesto NUMBER(2) CONSTRAINT puestos_pk PRIMARY KEY ,
  titulo_puesto VARCHAR2(25) CONSTRAINT puestos_uk1 UNIQUE
                            CONSTRAINT  puestos_nn1 NOT NULL ,
  salario_min NUMBER(11,2),
  salario_max NUMBER(11,2)
);

CREATE table localizaciones(
  cod_localizacion NUMBER(3) CONSTRAINT localizaciones_pk primary KEY ,
  localidad VARCHAR2(50) CONSTRAINT localizaciones_nn1 NOT NULL ,

);