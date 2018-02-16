--1
 CREATE TABLE ARTICULOS(
   cod_art CHAR(7) CONSTRAINT articulos_pk PRIMARY KEY ,
   nombre VARCHAR2(40) CONSTRAINT articulos_nn1 NOT NULL ,
   marcha VARCHAR2(15) CONSTRAINT  articulos_nn3 NOT NULL
 );

 CREATE table  precios(
   fecha_inicio DATE,
   fecha_fin DATE,
   cod_art CHAR(7) CONSTRAINT precios_fk1 REFERENCES articulos on DELETE CASCADE CONSTRAINT ,
   precio NUMBER(7,2) CONSTRAINT precio_ck CHECK (precio>0),
   CONSTRAINT precios_pk PRIMARY KEY (fecha_inicio,fecha_fin),
   CONSTRAINT  precios_ck CHECK (fecha_fin>fecha_inicio)
 );
 create table pertenecer (
   cod_art CHAR(7) CONSTRAINT  pertenecer_FK1 REFERENCES  articulos on DELETE CASCADE CONSTRAINT ,
   id_sec NUMBER(3) CONSTRAINT  pertenecer_fk2 REFERENCES  secciones on DELETE  CASCADE constraint,
   CONSTRAINT  pertenecer_pk PRIMARY KEY (cod_art,id_sec)
 );

 CREATE TABLE secciones(
   id_sec NUMBER(3) CONSTRAINT secciones_pk  PRIMARY KEY ,
   id_supersec NUMBER(3) CONSTRAINT secciones_fk1  REFERENCES secciones (id_sec) ON DELETE CASCADE CONSTRAINT ,
   nombre VARCHAR2(40) CONSTRAINT  secciones_uk1
                       constraint secciones_nn1 not null

 );

 --2
  alter table secciones MODIFY (id_sec !=id_supersec);
  ALTER TABLE
  