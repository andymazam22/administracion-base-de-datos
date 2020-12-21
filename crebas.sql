/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     20/12/2020 2:12:43                           */
/*==============================================================*/


drop index CL_VISITA_FK;

drop index ASISTENCIA_PK;

drop table ASISTENCIA;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index ESPEC_EMPLE_FK;

drop index EMPLEADO_PK;

drop table EMPLEADO;

drop index ESPECIALIDAD_PK;

drop table ESPECIALIDAD;

drop index PLAN_ALIMENTICIO_PK;

drop table PLAN_ALIMENTICIO;

drop index PRODUCTO_PK;

drop table PRODUCTO;

drop index TIENE_FK;

drop index RUTINA_CLIENTE_FK;

drop index DA_FK;

drop index RUTINA_PK;

drop table RUTINA;

drop index PRODUCTO_VENTA_FK;

drop index CLIENTE_VENTA_FK;

drop index EMPLEADO_VENTA_FK;

drop index VENTA_PK;

drop table VENTA;

/*==============================================================*/
/* Table: ASISTENCIA                                            */
/*==============================================================*/
create table ASISTENCIA (
   ID_ASISTENCIA        INT4                 not null,
   CEDULA_CLIENTE       NUMERIC(10)          null,
   FECHA_VISITA         DATE                 null,
   constraint PK_ASISTENCIA primary key (ID_ASISTENCIA)
);

/*==============================================================*/
/* Index: ASISTENCIA_PK                                         */
/*==============================================================*/
create unique index ASISTENCIA_PK on ASISTENCIA (
ID_ASISTENCIA
);

/*==============================================================*/
/* Index: CL_VISITA_FK                                          */
/*==============================================================*/
create  index CL_VISITA_FK on ASISTENCIA (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CEDULA_CLIENTE       NUMERIC(10)          not null,
   NOMBRES_CLIENTE      CHAR(256)            not null,
   APELLIDOS_CLIENTE    CHAR(256)            not null,
   DIRECCION_CLIENTE    CHAR(256)            null,
   FECHANACIMIENTO_CLIENTE DATE                 not null,
   CORREO_CLIENTE       CHAR(256)            null,
   PESODEINGRESO_CLIENTE CHAR(256)            not null,
   TELEFONO_CLIENTE     NUMERIC(10)          null,
   ALTURA_CLIENTE       CHAR(256)            not null,
   constraint PK_CLIENTE primary key (CEDULA_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   CEDULA_EMPLEADO      NUMERIC(10)          not null,
   ID_ESPECIALIDAD      INT4                 null,
   NOMBRES_EMPLEADO     CHAR(256)            not null,
   APELLIDOS_EMPLEADO   CHAR(256)            not null,
   DIRECION_EMPLEADO    CHAR(256)            not null,
   TELEFONO_EMPLEADO    NUMERIC(10)          not null,
   CORREO_EMPLEADO      CHAR(256)            not null,
   TIPO_EMPLEADO        CHAR(256)            not null,
   FECHANACIEMIENTO_EMPLEADO DATE                 not null,
   constraint PK_EMPLEADO primary key (CEDULA_EMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
CEDULA_EMPLEADO
);

/*==============================================================*/
/* Index: ESPEC_EMPLE_FK                                        */
/*==============================================================*/
create  index ESPEC_EMPLE_FK on EMPLEADO (
ID_ESPECIALIDAD
);

/*==============================================================*/
/* Table: ESPECIALIDAD                                          */
/*==============================================================*/
create table ESPECIALIDAD (
   ID_ESPECIALIDAD      INT4                 not null,
   DESCRIPCION          CHAR(256)            not null,
   constraint PK_ESPECIALIDAD primary key (ID_ESPECIALIDAD)
);

/*==============================================================*/
/* Index: ESPECIALIDAD_PK                                       */
/*==============================================================*/
create unique index ESPECIALIDAD_PK on ESPECIALIDAD (
ID_ESPECIALIDAD
);

/*==============================================================*/
/* Table: PLAN_ALIMENTICIO                                      */
/*==============================================================*/
create table PLAN_ALIMENTICIO (
   ID_PLAN              INT4                 not null,
   DESCRIPCION_PLAN     CHAR(256)            not null,
   constraint PK_PLAN_ALIMENTICIO primary key (ID_PLAN)
);

/*==============================================================*/
/* Index: PLAN_ALIMENTICIO_PK                                   */
/*==============================================================*/
create unique index PLAN_ALIMENTICIO_PK on PLAN_ALIMENTICIO (
ID_PLAN
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   CODIGO_PRODUCTO      INT4                 not null,
   TIPO_PRODUCTO        CHAR(256)            not null,
   NOMBRE_PRODUCTO      CHAR(256)            not null,
   DESCRIPCION_PRODUCTO CHAR(256)            not null,
   FECHACADUCIDAD_PRODUCTO DATE                 not null,
   PRECIO_PRODUCTO      DECIMAL              not null,
   constraint PK_PRODUCTO primary key (CODIGO_PRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
CODIGO_PRODUCTO
);

/*==============================================================*/
/* Table: RUTINA                                                */
/*==============================================================*/
create table RUTINA (
   ID_RUTINA            INT4                 not null,
   CEDULA_CLIENTE       NUMERIC(10)          null,
   CEDULA_EMPLEADO      NUMERIC(10)          null,
   ID_PLAN              INT4                 not null,
   NUMERO_RUTINA        INT4                 null,
   NOMBRE_EJERCICIOS    CHAR(256)            null,
   TIEMPO_RUTINA        CHAR(256)            null,
   FECHAINICIO_RUTINA   DATE                 null,
   FECHAFIN_RUTINA      DATE                 null,
   constraint PK_RUTINA primary key (ID_RUTINA)
);

/*==============================================================*/
/* Index: RUTINA_PK                                             */
/*==============================================================*/
create unique index RUTINA_PK on RUTINA (
ID_RUTINA
);

/*==============================================================*/
/* Index: DA_FK                                                 */
/*==============================================================*/
create  index DA_FK on RUTINA (
CEDULA_EMPLEADO
);

/*==============================================================*/
/* Index: RUTINA_CLIENTE_FK                                     */
/*==============================================================*/
create  index RUTINA_CLIENTE_FK on RUTINA (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on RUTINA (
ID_PLAN
);

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA (
   ID_VENTA             INT4                 not null,
   CODIGO_PRODUCTO      INT4                 null,
   CEDULA_CLIENTE       NUMERIC(10)          null,
   CEDULA_EMPLEADO      NUMERIC(10)          null,
   FECHA_VENTA          DATE                 not null,
   DESCRIPCION_VENTA    CHAR(256)            not null,
   PRECIOFINAL_VENTA    DECIMAL              not null,
   constraint PK_VENTA primary key (ID_VENTA)
);

/*==============================================================*/
/* Index: VENTA_PK                                              */
/*==============================================================*/
create unique index VENTA_PK on VENTA (
ID_VENTA
);

/*==============================================================*/
/* Index: EMPLEADO_VENTA_FK                                     */
/*==============================================================*/
create  index EMPLEADO_VENTA_FK on VENTA (
CEDULA_EMPLEADO
);

/*==============================================================*/
/* Index: CLIENTE_VENTA_FK                                      */
/*==============================================================*/
create  index CLIENTE_VENTA_FK on VENTA (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Index: PRODUCTO_VENTA_FK                                     */
/*==============================================================*/
create  index PRODUCTO_VENTA_FK on VENTA (
CODIGO_PRODUCTO
);

alter table ASISTENCIA
   add constraint FK_ASISTENC_CL_VISITA_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_ESPEC_EMP_ESPECIAL foreign key (ID_ESPECIALIDAD)
      references ESPECIALIDAD (ID_ESPECIALIDAD)
      on delete restrict on update restrict;

alter table RUTINA
   add constraint FK_RUTINA_DA_EMPLEADO foreign key (CEDULA_EMPLEADO)
      references EMPLEADO (CEDULA_EMPLEADO)
      on delete restrict on update restrict;

alter table RUTINA
   add constraint FK_RUTINA_RUTINA_CL_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table RUTINA
   add constraint FK_RUTINA_TIENE_PLAN_ALI foreign key (ID_PLAN)
      references PLAN_ALIMENTICIO (ID_PLAN)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_CLIENTE_V_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_EMPLEADO__EMPLEADO foreign key (CEDULA_EMPLEADO)
      references EMPLEADO (CEDULA_EMPLEADO)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_PRODUCTO__PRODUCTO foreign key (CODIGO_PRODUCTO)
      references PRODUCTO (CODIGO_PRODUCTO)
      on delete restrict on update restrict;

