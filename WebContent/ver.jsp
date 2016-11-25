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
<%@include file="navbar.html" %>
<s:bean name="es.com.indra.domain.Estabelecimento" var="estabelecimento"/>
<form action="">
<s:push value="estabelecimento">
  <s:hidden id="codigo2" name="codigo" value="%{codigo}"/>
  <s:hidden id="situacao2" name="situacao" value="%{situacao}"/>
  <s:hidden id="descricao2" name="descricao" value="%{descricao}"/>
		<s:hidden id="teste" name="cep" value="%{cep}"/>
  </s:push>
</form>
<form class="form-horizontal" action="listEnderecos" >

<fieldset>
<!-- Form Name -->
<legend>Visualização do Histórico</legend>
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
  <label class="col-md-4 control-label" for="situacao">Situação</label>
  <div class="col-md-4">
  <input id="situacao" name=""situacao"" type="text" placeholder="Código" readonly="true" class="form-control input-md" >
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="">Descrição:</label>  
  <div class="col-md-4">
  <input id="descricao" name="descricao" type="text" readonly="true" placeholder="Descrição" class="form-control input-md">
    
  </div>
</div>

</fieldset>
</form>



<s:if test="estabelecimentoList.size() > 0">
<div class="container">
	<div class="row">
  
        <div class="col-md-12">
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <th>CEP</th>
                     <th>UF</th>
                      <th>Rua</th>
                      <th>Bairro</th>
                      <th>Cidade</th>
                   </thead>
         <tbody>
         
		<s:iterator value="estabelecimentoList" status="estabelecimentoStatus">
			<tr	class="<s:if test="#estabelecimentoStatus.odd == true ">odd</s:if><s:else>even</s:else>">
				<td><s:property value="cep" /></td>
				<td><s:property value="uf" /></td>
				<td><s:property value="rua" /></td>
				<td><s:property value="bairro" /></td>
				<td><s:property value="cidade" /></td>
			</tr>
		</s:iterator>
		
		    </tbody>
        
	</table>
	</div>
	</div></div></div>
</s:if>
<div class="container">
	<div class="row">
	<div class="col-md-12">
<iframe id="mapa" src="https://www.google.com/maps?q=74690500&output=embed" width="1140" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
</div>
</div>
</div>
<script>
var inicio = "https://www.google.com/maps?q=";
var meio = document.getElementById('teste').value;
var fim ="&output=embed";
var texto = inicio+meio+fim;
document.getElementById('mapa').src = texto;


var codigo		= document.getElementById('codigo2').value;
document.getElementById('codigo').value = codigo;
var situacao	= document.getElementById('situacao2').value;
document.getElementById('situacao').value = situacao;
var descricao	= document.getElementById('descricao2').value;
document.getElementById('descricao').value = descricao;


</script>
</body>
</html>