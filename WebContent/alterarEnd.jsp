<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cadastrar Page</title>

<!-- Adicionando JQuery -->
    <script src="//code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- Adicionando Javascript -->
    <script type="text/javascript" >

        $(document).ready(function() {

            function limpa_formulário_cep() {
                // Limpa valores do formulário de cep.
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
                $("#uf").val("");
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#rua").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#uf").val("...");

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("//viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#rua").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#uf").val(dados.uf);
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        });

    </script>
    
<s:head />
<style type="text/css">
@import url(style.css);
</style>
</head>
<body>
<%@include file="navbar.html" %>
<s:bean name="es.com.indra.domain.Estabelecimento" var="estabelecimento"/>
<form action="">
<s:push value="estabelecimento">
  <s:hidden id="codigo2" name="codigo" value="%{codigo}"/>
  <s:hidden id="situacao2" name="situacao" value="%{situacao}"/>
  <s:hidden id="descricao2" name="descricao" value="%{descricao}"/>
  <s:hidden id="cep2" name="cep" value="%{cep}"/>
  <s:hidden id="uf2" name="uf" value="%{uf}"/>
  <s:hidden id="rua2" name="rua" value="%{rua}"/>
  <s:hidden id="bairro2" name="bairro" value="%{bairro}"/>
  <s:hidden id="cidade2" name="cidade" value="%{cidade}"/>
  <s:hidden id="estado2" name="estado" value="%{estado}"/>
  </s:push>
</form>
<form class="form-horizontal" action="saveOrUpdateEstabelecimento" >

<fieldset>
<!-- Form Name -->
<legend>Alteração de Estabelecimento</legend>
<!-- Text input-->
<div class="form-group">
  
  </div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="">Código:</label>  
  <div class="col-md-4">
  <input id="codigo" name="codigo" type="text" placeholder="Código" readonly="true" class="form-control input-md" >
</div>
</div>
<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="situacao">Selecione</label>
  <div class="col-md-4">
    <select id="situacao" name="situacao" class="form-control">
      <option value="Ativo">Ativo</option>
      <option value="Inativo">Inativo</option>
    </select>
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="">Descrição:</label>  
  <div class="col-md-4">
  <input id="descricao" name="descricao" type="text" placeholder="Descrição" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="cep">CEP:</label>  
  <div class="col-md-4">
  <input id="cep" name="cep" type="text" placeholder="CEP" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="uf">UF:</label>  
  <div class="col-md-4">
  <input id="uf" name="uf" type="text" placeholder="UF" class="form-control input-md" maxlength=2>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="rua">Rua:</label>  
  <div class="col-md-4">
  <input id="rua" name="rua" type="text" placeholder="Rua" class="form-control input-md" maxlength=50>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="bairro">Bairro:</label>  
  <div class="col-md-4">
  <input id="bairro" name="bairro" type="text" placeholder="Bairro" class="form-control input-md" maxlength=50>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="cidade">Cidade:</label>  
  <div class="col-md-4">
  <input id="cidade" name="cidade" type="text" placeholder="Cidade" class="form-control input-md" maxlength=50>
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="button1id"></label>
  <div class="col-md-8">
    <button id="button1id" name="button1id" class="btn btn-success">Alterar</button>
    <a href="index.jsp" class="btn btn-danger" role="button" aria-pressed="true">Voltar</a>
  </div>
</div>

</fieldset>
</form>
<script>
var codigo		= document.getElementById('codigo2').value;
document.getElementById('codigo').value = codigo;
var situacao	= document.getElementById('situacao2').value;
document.getElementById('situacao').value = situacao;
var descricao	= document.getElementById('descricao2').value;
document.getElementById('descricao').value = descricao;
var cep			= document.getElementById('cep2').value;
document.getElementById('cep').value = cep;
var uf			= document.getElementById('uf2').value;
document.getElementById('uf').value = uf;
var rua			= document.getElementById('rua2').value;
document.getElementById('rua').value = rua;
var bairro		= document.getElementById('bairro2').value;
document.getElementById('bairro').value = bairro;
var cidade		= document.getElementById('cidade2').value;
document.getElementById('cidade').value = cidade;
var estado		= document.getElementById('estado2').value;
document.getElementById('estado').value = estado;
</script>
</body>
</html>