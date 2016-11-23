<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<s:head />
<style type="text/css">
@import url(style.css);
</style>
</head>
<body>
<s:form action="saveOrUpdateEstabelecimento">
	<s:push value="estabelecimento">
		<s:hidden name="id" />
		<s:textfield name="codigo" label="Código: " />
		<s:select name="situacao" list="{'Ativo','Desativado'}" headerKey="" headerValue="::Selecione::" label="Situação: " />
		<s:textarea name="descricao" label="Descrição: " />
		<s:submit name="Gravar"/>
	</s:push>
</s:form>

<s:if test="estabelecimentoList.size() > 0">
	<div class="content">
	<table class="estabelecimentoTable" cellpadding="5px">
		<tr class="even">
			<th>Código</th>
			<th>Situação</th>
			<th>Descrição</th>
			<th>Editar</th>
			<th>Deletar</th>
		</tr>
		<s:iterator value="estabelecimentoList" status="estabelecimentoStatus">
			<tr
				class="<s:if test="#estabelecimentoStatus.odd == true ">odd</s:if><s:else>even</s:else>">
				<td><s:property value="codigo" /></td>
				<td><s:property value="situacao" /></td>
				<td><s:property value="descricao" /></td>
				<td><s:url id="editURL" action="editEstabelecimento">
					<s:param name="id" value="%{id}"></s:param>
				</s:url> <s:a href="%{editURL}">Editar</s:a></td>
				<td><s:url id="deleteURL" action="deleteEstabelecimento">
					<s:param name="id" value="%{id}"></s:param>
				</s:url> <s:a href="%{deleteURL}">Deletar</s:a></td>
			</tr>
		</s:iterator>
	</table>
	</div>
</s:if>
</body>
</html>