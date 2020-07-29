
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
