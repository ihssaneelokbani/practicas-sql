
CREATE table tipos_pieza(
  tipo CHAR(2) CONSTRAINT  tipos_pieza_pk  primary key,
  descripcion  VARCHAR2(25) CONSTRAINT tipos_piezas_nn NOT NULL
);

CREATE table piezas(
  tipo char(2) CONSTRAINT piezas_fk REFERENCES tipos_pieza,
  modelo number(2),
  pieza_venta NUMBER(11,4),
  CONSTRAINT piezas_pk PRIMARY KEY (tipo,modelo)
);


CREATE table empresas(
  cif CHAR(9) CONSTRAINT empresas_pk PRIMARY KEY ,
  nombre VARCHAR2(50) CONSTRAINT empresas_uk UNIQUE
                      CONSTRAINT empresas_nn NOT NULL ,
  telefono CHAR(9),
  direccion VARCHAR2(50),
  localidad VARCHAR2(50),
  provincia VARCHAR2(30)
);
CREATE table suministros(
  tipo CHAR(2) ,
  modelo NUMBER(2),
  cif CHAR(9) CONSTRAINT suministros_fk2 REFERENCES empresas,
  precio_compra NUMBER(11,4)CONSTRAINT suministros_nn NOT NULL
                            CONSTRAINT suministros_ck CHECK(precio_compra>0),
  CONSTRAINT suministros_pk PRIMARY KEY (tipo,modelo,cif),
  CONSTRAINT suministros_fk1 FOREIGN KEY (tipo,modelo) REFERENCES piezas
);
CREATE TABLE pedidos(
  n_pedido NUMBER(4) CONSTRAINT pedidos_pk PRIMARY KEY ,
  cif CHAR(9) CONSTRAINT pedido_nn1 NOT NULL
              CONSTRAINT  pedido_fk REFERENCES empresas,
  fecha DATE CONSTRAINT pedidos_nn2 NOT NULL
);
CREATE table almacenes (
  n_almacen NUMBER(2) CONSTRAINT almacenes_pk PRIMARY KEY ,
  descripcion VARCHAR2(1000) CONSTRAINT almacenes_nn NOT NULL ,
  direccion VARCHAR2(100)
);
CREATE table lineas_pedido(
  tipo CHAR(2) CONSTRAINT lineas_pedido_nn1 NOT NULL ,
  modelo NUMBER(2) CONSTRAINT lineas_pedido_nn2 NOT NULL ,
  n_pedido NUMBER(4) CONSTRAINT lineas_pedido_fk1 REFERENCES pedidos,
  n_linea number(2),
  cantidad NUMBER(5),
  precio NUMBER(11,4),
  CONSTRAINT lineas_pedido_pk PRIMARY KEY (n_pedido,n_linea),
  CONSTRAINT lineas_pedido_fk2 FOREIGN KEY (tipo,modelo) REFERENCES piezas
);
CREATE table existencias(
  tipo char(2),
  modelo NUMBER(2) ,
  n_almacen NUMBER(2)CONSTRAINT existencias_fk2 REFERENCES almacenes,
  cantidad NUMBER(9) CONSTRAINT existencias_nn NOT NULL
                     CONSTRAINT  existencias_ck CHECK (cantidad>0),
  CONSTRAINT existencias_pk PRIMARY KEY (tipo,modelo,n_almacen),
  CONSTRAINT existencias_fk1 FOREIGN KEY (tipo,modelo) REFERENCES piezas
);

drop TABLE  empresas CASCADE CONSTRAINTS ;
drop TABLE  tipos_pieza CASCADE CONSTRAINTS ;
drop table piezas CASCADE CONSTRAINTS ;
drop TABLE  suministros CASCADE CONSTRAINTS ;
DROP TABLE pedidos CASCADE CONSTRAINTS ;
DROP TABLE almacenes CASCADE CONSTRAINTS ;
DROP TABLE  lineas_pedido CASCADE CONSTRAINTS ;
DROP table existencias CASCADE CONSTRAINTS ;