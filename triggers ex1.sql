use exercicio1;

-- REMOVER PRODUTO INDISPONIVEL -- 
delimiter // 
create trigger remove_produto
before update on produtos
for each row
begin

	if new.disponivel != "disponivel" then
		delete from vendas where produto_vendido = old.id;
	end if;
end
// delimiter ;
-- REMOVER PRODUTO INDISPONIVEL -- 