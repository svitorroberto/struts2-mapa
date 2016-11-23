package es.com.indra.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ESTABELECIMENTO")
public class Estabelecimento {

	private Long id;
	private String codigo;
	private String situacao;
	private String descricao;
	private String uf;
	private String cep;
	private String rua;
	private String bairro;
	private String cidade;
	
	@Id
	@GeneratedValue
	@Column(name="ID")	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="ESTABELECIMENTO_CODIGO")
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	@Column(name="ESTABELECIMENTO_SITUACAO")
	public String getSituacao() {
		return situacao;
	}
	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}
	
	@Column(name="ESTABELECIMENTO_DESCRICAO")
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	@Column(name="ESTABELECIMENTO_UF")
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	@Column(name="ESTABELECIMENTO_CEP")
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	@Column(name="ESTABELECIMENTO_RUA")
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	@Column(name="ESTABELECIMENTO_BAIRRO")
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	@Column(name="ESTABELECIMENTO_CIDADE")
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	
}
