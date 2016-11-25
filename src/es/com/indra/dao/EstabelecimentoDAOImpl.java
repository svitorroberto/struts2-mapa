package es.com.indra.dao;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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

	private static final Logger LOGGER = Logger.getLogger( EstabelecimentoDAOImpl.class.getName() );
	/**
	 * Used to save or update a estabelecimento.
	 */
	@Override
	public void saveOrUpdateEstabelecimento(Estabelecimento estabelecimento) {
		try {
			estabelecimento.setId(null);
			session.saveOrUpdate(estabelecimento);
		} catch (Exception e) {
			transaction.rollback();
			LOGGER.log(Level.SEVERE,e.toString());
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
			LOGGER.log(Level.SEVERE,e.toString());
		} 
	}
	/**
	 * Used to delete a estabelecimento.
	 */
	@Override
	public void deleteEstabelecimentoCodigo(String codigo) {
		try {
			session.createQuery("delete Estabelecimento where e.codigo = :cod").setParameter("cod", codigo).list();
		} catch (Exception e) {
			transaction.rollback();
			LOGGER.log(Level.SEVERE,e.toString());
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
			courses = session.createQuery("from Estabelecimento e order by e.codigo, e.id").list();
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE,e.toString());
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
			LOGGER.log(Level.SEVERE,e.toString());
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
			estabelecimentos = session.createQuery("from Estabelecimento e where e.situacao = :sit order by e.codigo").setParameter("sit", situacao).list();
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE,e.toString());
		}
		}
		else{
			estabelecimentos = listEstabelecimento();
		}
		return estabelecimentos;
	}
	/**
	 * Used to list a single estabelecimento by Codigo.
	 */
	@Override
	public Estabelecimento listEstabelecimentoByCodigo(String codigo) {
		Estabelecimento estabelecimento = null;
		if(!codigo.isEmpty()){
		try {
			estabelecimento = (Estabelecimento) session.createQuery("from Estabelecimento e where e.codigo = :sit order by e.codigo").setParameter("sit", codigo);
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE,e.toString());
		}
		}
		return estabelecimento;
	}

	public void setSession(Session session2) {
		this.session = session2;
	}


	public void setTransaction(Transaction beginTransaction) {
		this.transaction = beginTransaction;
		
	}
	
	
	
	
	
	

}
