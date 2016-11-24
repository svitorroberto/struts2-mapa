package es.com.indra.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;

import es.com.indra.domain.Estabelecimento;


public class EstabelecimentoDAOImpl implements EstabelecimentoDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a estabelecimento.
	 */
	@Override
	public void saveOrUpdateEstabelecimento(Estabelecimento estabelecimento) {
		try {
			session.saveOrUpdate(estabelecimento);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	
	/**
	 * Used to delete a estabelecimento.
	 */
	@Override
	public void deleteEstabelecimento(Long estabelecimentoId) {
		try {
			Estabelecimento estabelecimento = (Estabelecimento) session.get(Estabelecimento.class, estabelecimentoId);
			session.delete(estabelecimento);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list all the estabelecimentos.
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Estabelecimento> listEstabelecimento() {
		List<Estabelecimento> courses = null;
		try {
			courses = session.createQuery("from Estabelecimento").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	/**
	 * Used to list a single estabelecimento by Id.
	 */
	@Override
	public Estabelecimento listEstabelecimentoById(Long estabelecimentoId) {
		Estabelecimento estabelecimento = null;
		try {
			estabelecimento = (Estabelecimento) session.get(Estabelecimento.class, estabelecimentoId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return estabelecimento;
	}
	/**
	 * Used to list a single estabelecimento by Id.
	 */
	@Override
	public List<Estabelecimento> listEstabelecimentoBySituacao(String situacao) {
		List<Estabelecimento> estabelecimentos = null;
		if(!situacao.isEmpty()){
		try {
			System.out.println("Executou");
			estabelecimentos = session.createQuery("from Estabelecimento e where e.situacao = :sit").setParameter("sit", situacao).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		else{
			estabelecimentos = listEstabelecimento();
		}
		return estabelecimentos;
	}


	public void setSession(Session session2) {
		this.session = session2;
	}


	public void setTransaction(Transaction beginTransaction) {
		this.transaction = beginTransaction;
		
	}
	
	
	
	
	
	

}
