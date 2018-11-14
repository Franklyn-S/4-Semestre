create procedure relatorio
as
select v1.nome 'Funcionario', f.nome, isnull(premio, v1.salario) premio
from vendedores v1 left join (select v2.matr, count(*)*100 premio
							from vendedores v2 left join
							historico h on matrvend = v2.matr
							where 3< v2.salario
							group by matr) bonus on v1.matr = bonus.matr
							inner join filiais f on codfil = cod;
go


exec relatorio;