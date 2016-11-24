<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Index Page</title>
<s:head />
<style type="text/css">
@import url(style.css);
</style>
</head>
<body>
<s:set name="situacao" value=""/>
<s:bean name="es.com.indra.domain.Estabelecimento" var="estabelecimento"/>
<s:form action="listEstabelecimento">
	<s:push value="estabelecimento">
		<s:hidden name="id" />
		<s:textfield name="codigo" label="Código: " />
		<s:select name="situacao" list="{'Ativo','Inativo'}" headerKey="" headerValue="::Selecione::" label="Situação: " />
		<s:textarea name="descricao" label="Descrição: " />
		<s:submit name="Submit" value="Consultar"/>
	</s:push>
</s:form>
		<a href="cadastrar.jsp">Cadastrar</a>

<s:if test="estabelecimentoList.size() > 0">
	<div class="content">
	<table class="estabelecimentoTable" cellpadding="5px">
		<tr class="even">
			<th>Código</th>
			<th>Situação</th>
			<th>Descrição</th>
			<th>CEP</th>
			<th>UF</th>
			<th>Rua</th>
			<th>Bairro</th>
			<th>Cidade</th>
			<th>Editar</th>
			<th>Deletar</th>
		</tr>
		<s:iterator value="estabelecimentoList" status="estabelecimentoStatus">
			<tr
				class="<s:if test="#estabelecimentoStatus.odd == true ">odd</s:if><s:else>even</s:else>">
				<td><s:property value="codigo" /></td>
				<td><s:property value="situacao" /></td>
				<td><s:property value="descricao" /></td>
				<td><s:property value="cep" /></td>
				<td><s:property value="uf" /></td>
				<td><s:property value="rua" /></td>
				<td><s:property value="bairro" /></td>
				<td><s:property value="cidade" /></td>
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