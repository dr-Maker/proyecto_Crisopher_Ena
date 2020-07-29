--create database db_RequerimientoEna;
--use db_db_RequerimientoEna
go
drop table requerimiento;
drop table tb_asignar;
drop table tb_encargado;
drop table tb_dpto;
drop table tb_gerencia;
drop table tb_user;
go

truncate table tb_dpto;
select * from tb_dpto
select * from tb_gerencia

create table tb_user(
num int identity(1,1),
usuario varchar(100),
clave varchar(100),
primary key(num),
unique(usuario));
go

create table tb_gerencia(
num int identity(1,1),
nombre varchar(100),
primary key(num));
go

create table tb_dpto(
num int identity(1,1),
nombre varchar(100),
numgerencia int,
primary key(num),
foreign key (numgerencia) references tb_gerencia(num));
go

create table tb_encargado(
num int identity(1,1),
nombre varchar(100),
email varchar(100),
fono varchar(20),
primary key(num));
go
create table tb_asignar(
num int identity(1,1),
nombre varchar(100),
horas int,
cupos int,
primary key(num));
go
create table requerimiento(
num int identity(1,1),
numgerencia int,
numdpto int,
numasignar int,
numencargado int,
requerimiento varchar(200),
primary key(num),
foreign key (numgerencia) references tb_gerencia(num),
foreign key (numdpto) references tb_dpto(num),
foreign key (numasignar) references tb_asignar(num),
foreign key (numencargado) references tb_encargado(num));
go

insert into tb_user (usuario, clave) values('admin', '12345');
insert into tb_gerencia (nombre) values('gerencia A'); 
insert into tb_gerencia (nombre) values('gerencia B'); 
insert into tb_gerencia (nombre) values('gerencia C'); 

insert into tb_dpto (nombre, numgerencia) values('Contabilidad', 1); 
insert into tb_dpto (nombre, numgerencia) values('Remuneraciones', 1); 
insert into tb_dpto (nombre, numgerencia) values('Personal', 1); 

insert into tb_dpto (nombre, numgerencia) values('Publicidad', 2); 
insert into tb_dpto (nombre, numgerencia) values('Marketing', 2); 

insert into tb_dpto (nombre, numgerencia) values('Ofimática', 3); 
insert into tb_dpto (nombre, numgerencia) values('Internet', 3); 
insert into tb_dpto (nombre, numgerencia) values('Base de datos', 3); 
insert into tb_dpto (nombre, numgerencia) values('Programación', 3); 

insert into tb_asignar (nombre, horas, cupos) values('Almacenamiento Tic', 35, 20);
insert into tb_asignar (nombre, horas, cupos) values('Almacenamiento A', 35, 30);
insert into tb_asignar (nombre, horas, cupos) values('Almacenamiento B', 40, 15);
insert into tb_asignar (nombre, horas, cupos) values('Almacenamiento C', 25, 20);
insert into tb_asignar (nombre, horas, cupos) values('Almacenamiento D', 60, 25);
insert into tb_asignar (nombre, horas, cupos) values('Almacenamiento E', 70, 25);
insert into tb_asignar (nombre, horas, cupos) values('Almacenamiento F', 90, 35);
insert into tb_asignar (nombre, horas, cupos) values('Almacenamiento G', 120, 35);

insert into tb_encargado (nombre, email, fono) values('Salvador Ponce', 'salva@correo.cl', '987654321');
insert into tb_encargado (nombre, email, fono) values('Sophia Pavez', 'pavez@correo.cl', '876543219');
insert into tb_encargado (nombre, email, fono) values('Elena Olivares', 'eolivares@correo.cl', '765432198');
insert into tb_encargado (nombre, email, fono) values('Angela Marrou', 'amorrou@correo.cl', '654321987');
insert into tb_encargado (nombre, email, fono) values('Taro Ling', 'talinga@correo.cl', '741852963');

insert into requerimiento (numdpto, numasignar, numencargado, requerimiento) 
values(1,1,1,'');

insert into requerimiento (numdpto, numasignar, numencargado, requerimiento)  
values(2,2,2,'');

insert into requerimiento (numdpto, numasignar, numencargado, requerimiento) 
values(3,3,1,'');
insert into requerimiento (numdpto, numasignar, numencargado, requerimiento)  
values(4,2,2,'');

insert into requerimiento (numdpto, numasignar, numencargado, requerimiento)  
values(5,1,3,'');

insert into requerimiento (numdpto, numasignar, numencargado, requerimiento)  
values(6,5,1,'');

insert into requerimiento (numdpto, numasignar, numencargado, requerimiento)  
values(7,6,4,'');

insert into requerimiento (numdpto, numasignar, numencargado, requerimiento)  
values(8,7,5,'');

insert into requerimiento (numdpto, numasignar, numencargado, requerimiento)  
values(9,8,5,'');


select * from tb_user;




drop procedure sp_delete_Requerimiento;
go
create procedure sp_delete_Requerimiento
@p_num int
as
	delete from Requerimiento
	where num = @p_num;
go

go
drop procedure sp_buscar_Requerimiento;
go
create procedure sp_buscar_Requerimiento
@r_num int
as
	select r.*, g.num as numgerencia,
	g.nombre as nomgerencia,
	d.nombre as nomdpto, 
	asi.nombre as nomasignar,
	en.nombre as nomencargado
	from Requerimiento as r
	join tb_dpto as d on d.num = r.numdpto
	join tb_gerencia as g on g.num = d.numgerencia
	join tb_asignar as asi on asi.num = r.numasignar
	join tb_encargado as en on en.num = r.numencargado
	where r.num = @r_num; 
go



drop procedure sp_validar_usuario;
go
create procedure sp_validar_usuario
@r_usuario varchar(100),
@r_clave varchar(100)
as
     
	select num, usuario from tb_user
    where usuario = @r_usuario
	and clave = @r_clave;

go

exec sp_validar_usuario 'admin' , '12345';

select * from Requerimiento

drop procedure sp_listar_Requerimiento
go

create procedure sp_listar_Requerimiento
as
	select r.*, g.num as numgerencia,
	g.nombre as nomgerencia,
	d.nombre as nomdpto, 
	asi.nombre as nomasignar,
	en.nombre as nomencargado
	from Requerimiento as r
	join tb_dpto as d on d.num = r.numdpto
	join tb_gerencia as g on g.num = d.numgerencia
	join tb_asignar as asi on asi.num = r.numasignar
	join tb_encargado as en on en.num = r.numencargado
	
go

exec sp_listar_Requerimiento


use db_RequerimientoEna

drop procedure sp_insert_Requerimiento;
go
create procedure sp_insert_Requerimiento
@p_numgerencia int,
@p_numdpto int,
@p_numasignar int,
@p_numencargado int
as
	insert into requerimiento(numgerencia, numdpto, numasignar, numencargado)
	values(@p_numgerencia, @p_numdpto, @p_numasignar, @p_numencargado);
go

select * from requerimiento

