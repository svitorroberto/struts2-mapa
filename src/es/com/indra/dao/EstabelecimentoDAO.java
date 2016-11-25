package es.com.indra.dao;

import java.util.List;

import es.com.indra.domain.Estabelecimento;


public interface EstabelecimentoDAO {
	public Estabelecimento listEstabelecimentoByCodigo(String situacao);
	public void deleteEstabelecimentoCodigo(String codigo);
	public void saveOrUpdateEstabelecimento(Estabelecimento estabelecimento);
	public List<Estabelecimento> listEstabelecimento();
	public Estabelecimento listEstabelecimentoById(Long estabelecimentoId);
	public List<Estabelecimento> listEstabelecimentoBySituacao(String situacao);
	public void deleteEstabelecimento(Long estabelecimentoId);
}
