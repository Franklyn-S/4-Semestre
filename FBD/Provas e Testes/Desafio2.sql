create function mediaSalarial (@codfil_input smallint)
returns dec(10,2)
as 
begin
declare @media dec(10,2)
select @media = avg(salario) from  vendedores v
where v.codfil = @codfil_input
return (@media)
end

declare @media dec(10,2)
exec @media = dbo.mediaSalarial(select cod from filiais where cod = 1);
select 

