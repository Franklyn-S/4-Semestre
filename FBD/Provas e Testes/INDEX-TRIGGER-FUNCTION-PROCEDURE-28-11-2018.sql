USE lojas;
DROP INDEX vendedores.i_cod_fil;

-- FILLFACTOR: Determina a taxa de prenchimento dos nós de 1% (mínimo ceil(n/2)) a 100% (máximo n)
-- PAD_INDEX = on A taxa de preenchimento se aplica a todos os nós
-- PAD_INDEX = off A taxa de preenchimento se aplica aos nós folhas
CREATE CLUSTERED INDEX i_cod_fill
ON vendedores (codfil)
WITH (fillfactor = 100, pad_index = on);

CREATE INDEX vendedores_CPF
ON vendedores (CPF)
WITH (fillfactor = 100, pad_index = off);


--TRIGGER
GO
CREATE TRIGGER sal_Maior_2_med 
ON [dbo].vendedores for
INSERT, UPDATE
AS IF UPDATE(salario)
begin
	declare @filial smallint
	declare @novo_salario dec(6,2)
	declare @media_salario_filial dec(9,2)
	declare @soma_salario_filial dec(9,2)
	declare @num_vend int
	declare @str_invalido char(46)
	select @filial = codfil, @novo_salario = salario from inserted
	select @soma_salario_filial= sum(v.salario),
	@num_vend = count(*) from vendedores as v, inserted as i
	where v.codfil = i.codfil and v.matr <> i.matr
	set @num_vend = @num_vend+1
	set @soma_salario_filial = @soma_salario_filial+@novo_salario
	set @media_salario_filial= @soma_salario_filial/@num_vend
	set @str_invalido = 'SALARIO MAIOR QUE OS ADFSASDF'+CAST(@FILIAL AS varchar(10))
	if (@novo_salario > 2*(@media_salario_filial))
	begin
	raiserror(@str_invalido, 16, 1)
	rollback transaction
	end
end

GO

CREATE PROCEDURE calc_comissao as
DECLARE cursor_lojas CURSOR SCROLL FOR
select matr, v.nome, count(*)
from vendedores v left outer join historico h
on matr = matrvend
group by  matr, v.nome
order by 3 asc
DECLARE @matricula, @nome_vend, @qtde_vendas int,
@nome_vend char(20), @valor_comissao dec(10,2),
@sal_vend dec(8,2)
OPEN cursor_lojas
FETCH last FROM cursor_lojas
INTO @matricula, @nome_vend, @qtde_vendas
WHILE(@@FETCH_STATUS = 0)
BEGIN
SET @valor_comissao = @qtde_vendas*100
SET @sal_vend = (select salario from vendedores where matr = @matricula) 
if(@valor_comissao > @salv_end)
set @valor_comissao=@sal_vend
--incompleto
print 'matri'
fetch prior from cursis_vendas
end
deallocate cursor_lojas

--FUNCTIONS
CREATE function f_item_vend_vendedor
(@coditem+ent smallint, @matr_ent smallint)
returns @tab_reult table
(Nome_Item varchar(40),
Nome_Vend varchar(40),
qtde_vendida int)
as
begin
--parâmetro nulo vira ''
if @coditem_ent = ''
	set @coditem_ent = 1
insert into @tab_result
select ref, nome, sum(h.qtde)
from estoque e left outer join historico h
inner join vendedores on matr=matrvend on coditem = cod
where cod=@coditem_ent and matrvend = @matr_ent
group by cod, ref, matr, nome
return
end