<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<title>Cadastrar Page</title>

    <!-- Adicionando Javascript e JQuery CEP -->
    <script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" >
        $(document).ready(function() {

            function limpa_formul�rio_cep() {
                // Limpa valores do formul�rio de cep.
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
                $("#uf").val("");
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova vari�vel "cep" somente com d�gitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Express�o regular para validar o CEP.
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
                                //CEP pesquisado n�o foi encontrado.
                                limpa_formul�rio_cep();
                                alert("CEP n�o encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep � inv�lido.
                        limpa_formul�rio_cep();
                        alert("Formato de CEP inv�lido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formul�rio.
                    limpa_formul�rio_cep();
                }
            });
        });

    </script>
    
<s:head />
<style type="text/css">
@import url(style.css);
</style>

<!-- #################### BootsTrap #################### -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/i18n/defaults-*.min.js"></script>
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/scriptCep.js"></script>
</head>

</head>
<body>
<s:bean name="es.com.indra.domain.Estabelecimento" var="estabelecimento"/>

<form class="form-horizontal" action="saveOrUpdateEstabelecimento" >
<fieldset>

<!-- Form Name -->
<legend>Cadastro de Estabelecimento</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="">C�digo:</label>  
  <div class="col-md-4">
  <input id="" name="codigo" type="text" placeholder="C�digo" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <input id="" name="codigo" type="hidden" value="Ativo" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="">Descri��o:</label>  
  <div class="col-md-4">
  <input id="" name="descricao" type="text" placeholder="Descri��o" class="form-control input-md">
    
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
  <input id="uf" name="uf" type="text" placeholder="UF" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="rua">Rua:</label>  
  <div class="col-md-4">
  <input id="rua" name="rua" type="text" placeholder="Rua" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="bairro">Bairro:</label>  
  <div class="col-md-4">
  <input id="bairro" name="bairro" type="text" placeholder="Bairro" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="cidade">Cidade:</label>  
  <div class="col-md-4">
  <input id="cidade" name="cidade" type="text" placeholder="Cidade" class="form-control input-md">
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="button1id"></label>
  <div class="col-md-8">
    <button id="button1id" name="button1id" class="btn btn-success">Cadastrar</button>
  </div>
</div>

</fieldset>
</form>

</body>
</html>