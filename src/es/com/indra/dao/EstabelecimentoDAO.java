package es.com.indra.dao;

import java.util.List;

import es.com.indra.domain.Estabelecimento;


public interface EstabelecimentoDAO {

	public void saveOrUpdateEstabelecimento(Estabelecimento estabelecimento);
	public List<Estabelecimento> listEstabelecimento();
	public Estabelecimento listEstabelecimentoById(Long estabelecimentoId);
	public void deleteEstabelecimento(Long estabelecimentoId);
}
