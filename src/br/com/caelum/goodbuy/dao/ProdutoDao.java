package br.com.caelum.goodbuy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import br.com.caelum.goodbuy.modelo.Produto;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ProdutoDao {

	private SqlSessionFactory sqlSessionFactory;

	public ProdutoDao() {
		sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
	}

	public List<Produto> listaTudo() {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			List<Produto> list = session.selectList("Produto.getAll");
			return list;
		} finally {
			session.close();
		}
	}

	public void salva(Produto produto) {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.insert("Produto.insert", produto);
			session.commit();
		} finally {
			session.close();
		}
	}

	public Produto carrega(Long id) {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			Produto contact = (Produto) session
					.selectOne("Produto.getById", id);
			return contact;
		} finally {
			session.close();
		}
	}

	public void atualiza(Produto produto) {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.update("Produto.update", produto);
			session.commit();
		} finally {
			session.close();
		}
	}

	public void remove(Long id) {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.delete("Produto.deleteById", id);
			session.commit();
		} finally {
			session.close();
		}
	}

	public List<Produto> buscaNome(String nome) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			List<Produto> list = session.selectList("Produto.buscaNome", nome);
			return list;
		}finally{
			session.close();
		}
		
	}

}
