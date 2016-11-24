<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ver Page</title>
<s:head />
<style type="text/css">
@import url(style.css);
</style>
</head>
<body>
<script>
document.getElementById("map").src = document.getElementById("teste");
document.alert("ola");
</script>
<s:bean name="es.com.indra.domain.Estabelecimento" var="estabelecimento"/>
<s:form action="listEnderecos">
	<s:push value="estabelecimento">
		<s:hidden name="id" value="%{id}"/>
		<s:textfield name="codigo" label="Código: " readonly="true"/>
		<s:textfield name="situacao" label="Situação: "readonly="true"/>
		<s:textarea id="teste" name="descricao" label="Descrição: " readonly="true"/>
	</s:push>
</s:form>


<s:if test="estabelecimentoList.size() > 0">
	<div class="content">
	<table class="estabelecimentoTable" cellpadding="5px">
		<tr class="even">
			<th>Código</th>
			<th>CEP</th>
			<th>UF</th>
			<th>Rua</th>
			<th>Bairro</th>
			<th>Cidade</th>
		</tr>
		<s:iterator value="estabelecimentoList" status="estabelecimentoStatus">
			<tr
				class="<s:if test="#estabelecimentoStatus.odd == true ">odd</s:if><s:else>even</s:else>">
				<td><s:property value="codigo" /></td>
				<td><s:property value="cep" /></td>
				<td><s:property value="uf" /></td>
				<td><s:property value="rua" /></td>
				<td><s:property value="bairro" /></td>
				<td><s:property value="cidade" /></td>
			</tr>
		</s:iterator>
	</table>
	</div>
</s:if>

<iframe id="map" src="https://www.google.com/maps?q=74690500&output=embed" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
</body>
</html>