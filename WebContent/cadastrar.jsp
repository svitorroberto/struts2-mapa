<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar Page</title>

<!-- Adicionando JQuery -->
    <script src="//code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- Adicionando Javascript -->
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
</head>
<body>
<s:bean name="es.com.indra.domain.Estabelecimento" var="estabelecimento"/>
<s:form action="saveOrUpdateEstabelecimento">
	<s:push value="estabelecimento">
		<s:hidden name="id" />
		<s:textfield name="codigo" label="C�digo: " />
		<s:hidden name="situacao" value="Ativo" />
		<s:textarea name="descricao" label="Descri��o: " />
		<s:textarea id="cep" name="cep" label="Cep: " />
		<s:textarea id="uf" name="uf" label="UF: " />
		<s:textarea id="rua" name="rua" label="Rua: " />
		<s:textarea id="bairro" name="bairro" label="Bairro: " />
		<s:textarea id="cidade" name="cidade" label="Cidade: " />
		<s:submit name="Gravar">
			<s:param name="situacao" value="%{situacao}"></s:param>
		</s:submit>
	</s:push>
</s:form>

</body>
</html>