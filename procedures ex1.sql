use exercicio1;

-- ADICIONAR PERMISSAO --
delimiter //
create procedure add_permissao(descricao varchar(100), nivel int)
begin
	insert into permissao values(default, descricao, nivel);
end
// 

delimiter ;
-- ADICIONAR PERMISSAO --


-- ADICIONAR FUNCIONARIO --
delimiter //
create procedure add_func(mynome varchar(100), mycpf varchar(50), perm int)
begin
	declare duo varchar(50);
    DECLARE myfunc INT;
    
    select cpf into duo
    from funcionario
    where cpf = mycpf;
    
    if duo is null then
		insert into funcionario values(default, mynome, mycpf, perm);
        
        SET myfunc = LAST_INSERT_ID();
        
        insert into acesso values(default, myfunc, false);
	else
		insert into log values(default, " não foi possível inserir ");
    end if;
    
end
// 

delimiter ;
-- ADICIONAR FUNCIONARIO --


-- ADICIONAR PRODUTO --
delimiter //
create procedure add_produto(myfunc int, mynome varchar(100))
begin
	insert into produtos values(default, mynome, "disponivel", myfunc);
end
// 

delimiter ;
-- ADICIONAR PRODUTO --

-- ADICIONAR VENDA --
delimiter //
create procedure add_venda(myfunc int, produto int, qtd int)
begin
	insert into vendas values(default, produto, myfunc, qtd);
end
// 

delimiter ;
-- ADICIONAR VENDA --


-- ALTERAR DISPONIBILIDADE --
DELIMITER //
create procedure change_disp(func int, disp varchar(50), produto int)
begin
	
    declare mynivel int;
    declare thename varchar(100);
    
    select P.nivel into mynivel
    from permissao P
    INNER JOIN funcionario F ON F.permissao = P.id
    WHERE F.id = func;
    
    select nome into thename
    from funcionario 
    where id = func;
    
    if mynivel > 2 then
		update produtos 
		set disponivel = disp
		where id = produto;
	else
		insert into log values(default, concat(thename, " não tem permissao para fazer isso"));
	end if;
end
// DELIMITER ;
-- ALTERAR DISPONIBILIDADE --


-- ALTERAR VENDAS -- 
DELIMITER //
create procedure change_vendas(func int, myproduto int, myvendedor int, myqtd int, venda int)
begin
	
    declare theacesso boolean;
    declare mynivel int;
    declare thename varchar(100);
    
	select P.nivel into mynivel
	from permissao P
	INNER JOIN funcionario F ON F.permissao = P.id
	WHERE F.id = func;
    
    select nome into thename
    from funcionario 
    where id = func;
    
    select stat into theacesso
    from acesso 
    where idfunc = func;
    
    if mynivel = 5 or theacesso = true then
		update vendas 
		set produto_vendido = myproduto, quem_vendeu = myvendedor, qtd_vendida = myqtd
		where id = venda;
	else
		insert into log values(default, concat(thename, " esta pedindo acesso"));
	end if;
end
// 

DELIMITER;
-- ALTERAR VENDAS -- 


-- ENTREGAR ACESSO --
delimiter //
create procedure give_acesso(myfunc int, quer_acesso int)
BEGIN

    declare mynivel int;

    select P.nivel into mynivel
	from permissao P
	INNER JOIN funcionario F ON F.permissao = P.id
	WHERE F.id = myfunc;
    
    if mynivel = 5 then
		update acesso 
		set stat = true
		where idfunc = quer_acesso;
	else
		insert into log values(default, "Você não pode etregar acesso, não tem o nivel necessario");
	end if;
    
END
//

delimiter ;
-- ENTREGAR ACESSO -- 


