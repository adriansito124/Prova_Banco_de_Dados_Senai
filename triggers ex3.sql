-- AUMENTO SALARIO -- 
delimiter // 
create trigger aumento_salario
before update on funcionarios
for each row
begin

	if old.salario != new.salario then
		insert into aumento_salario_audit
		values(default, NEW.id, OLD.salario, NEW.salario, now());
	end if;
end
// delimiter ;
-- AUMENTO SALARIO -- 


-- NOVO CARGO -- 
delimiter // 
create trigger novo_cargo
before update on funcionarios
for each row
begin

	if old.cargo != new.cargo then
		insert into historico_cargos
		values(default, NEW.id, OLD.cargo, NEW.cargo, OLD.salario, NEW.salario, now());
	end if;
end
// delimiter ;
-- NOVO CARGO -- 


-- NOVO FUNCIONARIO -- 
delimiter // 
create trigger novo_funcionario
after insert on funcionarios 
for each row
begin
	declare mydep varchar(50);
    
	select departamento into mydep
    from departamentos_estatisticas
    where departamento = new.departamento;

	if mydep is null then
		insert into departamentos_estatisticas
		values(new.departamento, 1);
	else
		update departamentos_estatisticas
        set total_funcionarios = total_funcionarios+1
        where departamento = new.departamento;
	end if;
end
// delimiter ;
-- NOVO FUNCIONARIO -- 


-- FUNCIONARIO DELETADO -- 
delimiter // 
create trigger old_funcionario
before delete on funcionarios
for each row
begin

	update departamentos_estatisticas
	set total_funcionarios = total_funcionarios-1
	where departamento = old.departamento;

end
// delimiter ;
-- FUNCIONARIO DELETADO -- 