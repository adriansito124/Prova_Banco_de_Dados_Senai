-- ADICIONAR PERMISSAO --
Call add_permissao("descricao", 3);
select * from permissao;
select * from log;
-- ADICIONAR PERMISSAO --

-- ADICIONAR PERMISSAO --
Call add_permissao("descricao", 5);
select * from permissao;
select * from log;
-- ADICIONAR PERMISSAO --

-- ADICIONAR FUNCIONARIO --
Call add_func("Joaquim Silva", "123456789", 1);
select * from funcionario;
select * from log;
-- ADICIONAR FUNCIONARIO --

-- ADICIONAR FUNCIONARIO --
Call add_func("Pedro Pereira", "987654321", 2);
select * from funcionario;
select * from log;
-- ADICIONAR FUNCIONARIO --

-- ADICIONAR PRODUTO --
Call add_produto(1, "banana");
select * from produtos;
select * from log;
-- ADICIONAR PRODUTO --

-- ADICIONAR VENDA --
Call add_venda(1, 1, 5);
select * from vendas;
select * from log;
-- ADICIONAR VENDA --

-- ADICIONAR PRODUTO --
Call add_produto(1, "macarrão");
select * from produtos;
select * from log;
-- ADICIONAR PRODUTO --

-- ALTERAR DISPONIBILIDADE --
Call change_disp(1, "indisponivel", 1);
select * from produtos;
select * from log;
-- ALTERAR DISPONIBILIDADE --

-- ALTERAR VENDAS -- 
Call change_vendas(1, 2, 2, 1, 1);
select * from vendas;
select * from log;
-- ALTERAR VENDAS -- 

-- ALTERAR VENDAS -- 
Call change_vendas(2, 2, 2, 1, 1);
select * from vendas;
select * from log;
-- ALTERAR VENDAS -- 

-- ENTREGAR ACESSO --
Call give_acesso(2, 1);
select * from acesso;
select * from log;
-- ENTREGAR ACESSO --