create trigger q1 on vendedores
	for insert, update
	as
		if((select sum(v.salario) from vendedores v, inserted i where v.codfil = i.codfil and v.matr != i.matr group by v.codfil)+
		(select salario from inserted) > 15000)
		begin
		raiserror('Salarios de uma filial maior que 15000', 16,1)
		rollback transaction
		end

--select cod, sum(v.salario) from filiais f, vendedores v where f.cod = v.codfil group by f.cod having sum(v.salario) >15000;


insert into vendedores (matr, nome, salario, codfil) values (127, 'jose', 3000, 2)
insert into vendedores (matr, nome, salario, codfil) values (127, 'jose', 1000, 2)


--duvida ao fazer update de muitas tabelas, executar codigos abaixo para teste

--delete from vendedores where salario=9999
--update vendedores set salario=salario+3000
