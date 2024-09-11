insert into funcionarios values(default, "joao", "chefe", 30, "mma", curdate());
insert into funcionarios values(default, "carlos", "lutador", 40, "mma", curdate());
insert into funcionarios values(default, "oliver", "mestre", 40, "rpg", curdate());

update funcionarios
set salario = 70, cargo = "lutador"
where id = 1;

delete from funcionarios where id = 2;

select * from funcionarios;
select * from aumento_salario_audit;
select * from historico_cargos;
select * from departamentos_estatisticas;
-- -----------------------------------------------------------------------