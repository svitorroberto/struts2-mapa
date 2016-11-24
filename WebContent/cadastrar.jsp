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

<s:form action="saveOrUpdateEstabelecimento">
	<s:push value="estabelecimento">
		<s:hidden name="id" />
		<s:textfield name="codigo" label="Código: " />
		<s:hidden name="situacao" value="Ativo" />
		<s:textarea name="descricao" label="Descrição: " />
		<s:textarea id="cep" name="cep" label="Cep: " />
		<s:textarea id="uf" name="uf" label="UF: " />
		<s:textarea id="rua" name="rua" label="Rua: " />
		<s:textarea id="bairro" name="bairro" label="Bairro: " />
		<s:textarea id="cidade" name="cidade" label="Cidade: " />
		<s:submit name="Gravar" value="Cadastrar">
			
		</s:submit>
	</s:push>
</s:form>

</body>
</html>