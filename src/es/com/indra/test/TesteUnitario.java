package es.com.indra.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.security.sasl.SaslException;

import org.apache.log4j.BasicConfigurator;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import org.junit.Before;
import org.junit.Test;

import es.com.indra.dao.EstabelecimentoDAOImpl;
import es.com.indra.domain.Estabelecimento;

public class TesteUnitario {
	
    SessionFactory sessionFactory;
    EstabelecimentoDAOImpl banco;
    Estabelecimento estabelecimento;
    List<Estabelecimento> listEstabelecimento = new ArrayList<Estabelecimento>();

    @Before
    public void init() {
        BasicConfigurator.configure();
        banco = new EstabelecimentoDAOImpl();
        estabelecimento = new Estabelecimento();
        AnnotationConfiguration config = new AnnotationConfiguration();
        config.setProperty("hibernate.connection.url", "jdbc:oracle:thin:@localhost:1521:XE");
        config.setProperty("hibernate.connection.username", "ROOT");
        config.setProperty("connection.password", "root");
        config.setProperty("hibernate.dialect", "org.hibernate.dialect.OracleDialect");
        config.setProperty("hibernate.connection.driver_class", "oracle.jdbc.driver.OracleDriver");
        config.setProperty("hibernate.current_session_context_class", "thread");
        config.setProperty("hibernate.show_sql", "false");
        config.setProperty("hibernate.temp.use_jdbc_metadata_defaults", "false");
        config.setProperty("hbm2ddl.auto", "update");
        config.setProperty("connection.autocommit", "true");
        config.addAnnotatedClass(Estabelecimento.class);

        sessionFactory = config.configure().buildSessionFactory();

    }

    @Test
    public void testListar() throws SaslException {

        initSession();
        listEstabelecimento = (ArrayList<Estabelecimento>) banco.listEstabelecimento();
        assertNotNull(listEstabelecimento);
    }
    
    @Test
    public void testListarSituacao() throws SaslException {

        initSession();
        listEstabelecimento = (ArrayList<Estabelecimento>) banco.listEstabelecimentoBySituacao("Ativo");
        assertNotNull(listEstabelecimento);
    }
    
    @Test
    public void testInsert() throws SaslException {

        initSession();
        estabelecimento.setCodigo("222");
        estabelecimento.setSituacao("listarteste");
        estabelecimento.setDescricao("listarteste");
        estabelecimento.setUf("LI");
        estabelecimento.setCep("00000000");
        estabelecimento.setRua("listarteste");
        estabelecimento.setBairro("listarteste");
        estabelecimento.setCidade("listarteste");
        banco.saveOrUpdateEstabelecimento(estabelecimento);
        commitTransaction();
        initSession();
        listEstabelecimento = (ArrayList<Estabelecimento>) banco.listEstabelecimento();
        assertNull(banco.listEstabelecimentoByCodigo("222"));
    }
    
    
    @Test
    public void testDelete() throws SaslException {

    	boolean achouNoBanco = false;
        Long id = null;
        initSession();
        estabelecimento.setCodigo("666666");
  
        banco.saveOrUpdateEstabelecimento(estabelecimento);
        commitTransaction();
        initSession();
        
        getSession().delete(estabelecimento);
        commitTransaction();
        initSession();
        listEstabelecimento = (ArrayList<Estabelecimento>) banco.listEstabelecimento();
        for (int i = 0; i < listEstabelecimento.size(); i++) {
            if (listEstabelecimento.get(i).getCodigo().equals("deletarteste")) {
                achouNoBanco = true;
            }
        }
        commitTransaction();
        assertFalse(achouNoBanco);
    }
    
    @Test
    public void testBusca() throws SaslException {

        initSession();
        assertNull(banco.listEstabelecimentoById((long)444));
    }
    
    @Test
    public void testBuscaCodigo() throws SaslException {

        initSession();
        assertNull(banco.listEstabelecimentoByCodigo("444"));
    }
    
    
    
public void initSession() throws SaslException {
        banco.setSession(getSession());
        banco.setTransaction(getSession().beginTransaction());
    }

    public void commitTransaction() throws HibernateException, SaslException {
        getSession().getTransaction().commit();
    }

    public Session getSession() throws SaslException {
        Session session;

        session = sessionFactory.getCurrentSession();

        return session;
    }
}