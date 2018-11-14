create trigger media on vendedores
for insert, update
as
	if ((select salario from inserted) > (select 2*avg(v.salario) from  vendedores v inner join inserted i on i.codfil = v.codfil
											group by v.codfil))
	begin 
	raiserror('Salario duas vezes maior que a media salarial', 16, 1)
	rollback transaction
	end

	select codfil, 2*avg(v.salario) media
	from  vendedores v 
	inner join filiais f
	on v.codfil = f.cod
	group by v.codfil


	--select * from vendedores;

	insert into vendedores (matr, nome, salario, codfil, cpf) values (1511, 'teste', 9999, 2, 133)
