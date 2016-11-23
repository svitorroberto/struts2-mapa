package es.com.indra.test;

import java.io.File;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import es.com.indra.dao.EstabelecimentoDAOImpl;
import es.com.indra.domain.Estabelecimento;

public class TesteUnitario {
	
	private static Configuration config;
    private static SessionFactory factory;
    private static Session hibernateSession;

    
	 @BeforeClass
	    public void init() {
	        config = new AnnotationConfiguration();
	        config.configure(new File("hibernate.cfg.xml"));
	            factory = config.buildSessionFactory();
	            hibernateSession = factory.openSession();
	            System.out.println(hibernateSession.isConnected());
	        }
	 
	@Test
	public static void testaCadastrar(){
		Estabelecimento e = new Estabelecimento();
		e.setBairro("testeBairro");
		e.setCep("99999999");
		e.setCidade("TesteCidade");
		e.setCodigo("123");
		e.setDescricao("testeDescricao");
		e.setRua("testerua");
		e.setSituacao("Ativo");
		e.setUf("TE");
		EstabelecimentoDAOImpl edi = new EstabelecimentoDAOImpl();
		edi.saveOrUpdateEstabelecimento(e);
		
		Assert.assertEquals("123", edi.listEstabelecimento().get(edi.listEstabelecimento().size()-1).getCodigo());
		
		
	}
	

	


}
