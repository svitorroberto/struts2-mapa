<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar Page</title>


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
		<s:textfield name="codigo" label="Código: " />
		<s:hidden name="situacao" value="Ativo" />
		<s:textarea name="descricao" label="Descrição: " />
		<s:textarea name="cep" label="Cep: " />
		<s:textarea name="uf" label="UF: " />
		<s:textarea name="rua" label="Rua: " />
		<s:textarea name="bairro" label="Bairro: " />
		<s:textarea name="cidade" label="Cidade: " />
		<s:submit name="Gravar">
			<s:param name="situacao" value="%{situacao}"></s:param>
		</s:submit>
	</s:push>
</s:form>

</body>
</html>