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
        config.setProperty("hibernate.connection.url", "jdbc:postgresql://localhost:5432/struts");
        config.setProperty("hibernate.connection.username", "postgres");
        config.setProperty("connection.password", "root");
        config.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        config.setProperty("hibernate.connection.driver_class", "org.postgresql.Driver");
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
        estabelecimento.setCodigo("listarteste");
        estabelecimento.setSituacao("listarteste");
        estabelecimento.setDescricao("listarteste");
        estabelecimento.setUf("LI");
        estabelecimento.setCep("00000000");
        estabelecimento.setRua("listarteste");
        estabelecimento.setBairro("listarteste");
        estabelecimento.setCidade("listarteste");
        banco.saveOrUpdateEstabelecimento(estabelecimento);
        listEstabelecimento = (ArrayList<Estabelecimento>) banco.listEstabelecimento();
        commitTransaction();
        assertNotNull(listEstabelecimento);
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