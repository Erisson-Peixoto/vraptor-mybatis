package br.com.caelum.goodbuy.controller;

import java.util.List;

import br.com.caelum.goodbuy.dao.ProdutoDao;
import br.com.caelum.goodbuy.modelo.Produto;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
//import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.caelum.vraptor.validator.Validations;

@Resource
public class ProdutosController {
	
	private final ProdutoDao dao;
	private	final Result result;
	
	private final Validator validator;
	
	public ProdutosController(ProdutoDao dao, Result result, Validator validator){
		this.dao = dao;
		this.result = result;
		this.validator = validator;	
	}
	
	@Path("/produtos/novo")
	@Get
	public void formulario(){}
	
	@Path("/produtos")
	@Get
	public List<Produto> lista(){
		return dao.listaTudo();
	}
	
	@Path("/produtos")
	@Post
	public void adiciona(final Produto produto){
		/*if (produto.getNome() == null || produto.getNome().length() < 3){
			validator.add(new ValidationMessage(
					"Nome é obrigatório e precisa ter mais de 3 letras", "produto.nome"));
		}
		if (produto.getDescricao() == null || produto.getDescricao().length() > 40){
			validator.add(new ValidationMessage("Descrição é obrigatória e não pode ter mais" +
					" que 40 letras", "produto.descricao"));
		}
		if (produto.getPreco() <= 0){
			validator.add(new ValidationMessage("Preço precisa ser positivo", "produto.preco"));
		}*/
		validator.checking(new Validations() {   //este forma envia a menssagem de erro para messages.properties
			{
				that(produto.getNome() != null && produto.getNome().length() >= 3, "produto.nome", "nome.obrigatorio");
				that(produto.getDescricao() != null && produto.getDescricao().length() <= 40,"produto.descricao", "descricao.obrigatoria");
				that(produto.getPreco() != null && produto.getPreco() > 0.0, "produto.preco", "preco.positivo");
			}
		});
		
		validator.onErrorUsePageOf(ProdutosController.class).formulario();
		
		this.dao.salva(produto);
		result.include("mensagemCadastrar", "Livro cadastrado com sucesso!!!");
		result.redirectTo(this).lista();
		
	}
	
	@Path("/produtos/pesquisa")
	@Get
	public List<Produto> pesquisa(String nomeBusca){
		result.include("nomeDigitado", nomeBusca);
		result.include("buscaLista", dao.buscaNome(nomeBusca));
		result.redirectTo(this).lista();
		return dao.buscaNome(nomeBusca);
		
	}
	
	@Path("/produtos/{id}")
	@Get
	public Produto edita(Long id) {
		return dao.carrega(id);
	}
	
	@Path("/produtos/{produto.id}")
	@Put
	public void altera(Produto produto) {
		dao.atualiza(produto);
		result.include("mensagemAlterar", "Livro alterado com sucesso!!!");
		result.redirectTo(this).lista();
	}
	
	@Path("/produtos/{id}")
	@Delete
	public void remove(Long id) {
		//Produto produto = dao.carrega(id);
		dao.remove(id);
		result.redirectTo(this).lista();
	}
}

/* 
 sobre Redirecionamentos:
 
 result.redirectTo(ProdutosController.class).lista();   e   result.redirectTo(this).lista();   é o mesmo, apenas 
 o primeiro especifica qual o controle a ser usado. Executa o método indicado até o final e usa o seu resultado no redirecionamento
 para a página da lógica.
 
 result.of(this).lista(); 
 redireciona para a página da lógica especificada, sem executar a lógica
 
 */