<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar Page</title>
<s:head />
<style type="text/css">
@import url(style.css);
</style>
</head>
<body>
<s:bean name="es.com.indra.domain.Estabelecimento" var="estabelecimento"/>
<s:form action="saveOrUpdateEstabelecimento">
	<s:push value="estabelecimento">
		<s:hidden name="id" value="%{id}"/>
		<s:textfield name="codigo" label="Código: " />
		<s:select name="situacao" list="{'Ativo','Inativo'}" label="Situação: " />
		<s:textarea name="descricao" label="Descrição: " />
		<s:hidden name="cep" value="%{cep}" />
		<s:hidden name="uf" value="%{uf}" />
		<s:hidden name="rua" value="%{rua}" />
		<s:hidden name="bairro" value="%{bairro}" />
		<s:hidden name="cidade" value="%{cidade}" />
		<s:submit name="Alterar">
			<s:param name="situacao" value="Ativo"></s:param>
		</s:submit>
	</s:push>
</s:form>
</body>
</html>