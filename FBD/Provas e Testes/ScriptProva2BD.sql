alter function Disc_aproved(@matr smallint)
returns @disciplinas table(nome varchar(60), cod_disc smallint, cred int)
as
begin
if (@matr ='' or @matr is null)
	begin
		insert into @disciplinas
		select distinct d.nome, d.cod_disc, d.cred
		from alu_disc ad inner join disciplina d 
		on ad.cod_disc = d.cod_disc
		inner join aluno a on a.mat_aluno = ad.mat_aluno 
		where (((ap1+ap2)/2 >= 7) or (af >= 5))
		return
	end
else
insert into @disciplinas
select distinct  d.nome, d.cod_disc, d.cred
from alu_disc ad inner join disciplina d 
on ad.cod_disc = d.cod_disc
where ad.mat_aluno = @matr
and (((ap1+ap2)/2 >= 7) or (af >= 5))
return
end
go
select * from Disc_aproved(null);
drop view aluno_disc_aproved
CREATE VIEW aluno_disc_aproved
AS
	SELECT a.nome 'aluno', c.nome 'curso', count(d.cod_disc) 'QTD_disc', sum(d.cred) 'sum_creditos'
	FROM aluno a 
	inner join alu_disc ad on a.mat_aluno = ad.mat_aluno
	inner join Disc_aproved(null) d on ad.cod_disc = d.cod_disc
	inner join curso_disc cd on cd.cod_disc = d.cod_disc
	inner join curso c on c.cod_curso = cd.cod_curso
	group by a.nome, c.nome
	
	
	select * from aluno_disc_aproved
	
create procedure relatorio_alunos_aprovados 
as
	select a.nome, d.nome, isnull((af+((ap1+ap2))/2)/2, (ap1+ap2)/2) media
	FROM aluno a inner join alu_disc ad 
	on a.mat_aluno = ad.mat_aluno
	inner join Disc_aproved(null) d on ad.cod_disc = d.cod_disc

	
	--select * from alu_disc where mat_aluno = 22134 and cod_disc = 5113