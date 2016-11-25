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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="navbar.html" %>
<s:set name="situacao" value=""/>
<s:bean name="es.com.indra.domain.Estabelecimento" var="estabelecimento"/>
<form action="listEstabelecimento" class="form-horizontal">
	<s:push value="estabelecimento">
		<s:hidden name="id" />
		<!-- Text input-->
<div class="form-group col-md-3">
  <label class="col-md-3 control-label" for="">Código:</label>  
  <div class="col-md-7">
  <input id="codigo" name="codigo" type="text" placeholder="Código" class="form-control input-md" >
    
  </div>
</div>

<!-- Select Basic -->
<div class="form-group col-md-3">
  <label class="col-md-3 control-label" for="situacao">Selecione</label>
  <div class="col-md-7">
    <select id="situacao" name="situacao" class="form-control">
      <option value="">Selecione</option>
      <option value="Ativo">Ativo</option>
      <option value="Inativo">Inativo</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group col-md-3">
  <label class="col-md-3 control-label" for="">Descrição:</label>  
  <div class="col-md-7">
  <input id="" name="descricao" type="text" placeholder="Descrição" class="form-control input-md">
    
  </div>
</div>
		<!-- Button (Double) -->
<div class="form-group col-md-3">
  <label class="col-md-4 control-label" for="button1id"></label>
  <div class="col-md-8">
    <button id="button1id" name="button1id" class="btn btn-success">Pesquisar</button>
  </div>
</div>
	</s:push>
</form>

<s:if test="estabelecimentoList.size() > 0">
	<div class="container">
	<div class="row">
  
        <div class="col-md-12">
        <h4>Lista de Estabelecimentos</h4>
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
                   
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
                      <th>Ver</th>
                   </thead>
         <tbody>
         
		<s:iterator value="estabelecimentoList" status="estabelecimentoStatus">
			<tr	class="<s:if test="#estabelecimentoStatus.odd == true ">odd</s:if><s:else>even</s:else>">
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
				<td><s:url id="verURL" action="verEstabelecimento">
					<s:param name="id" value="%{id}"></s:param>
				</s:url> <s:a href="%{verURL}">Ver</s:a></td>
			</tr>
		</s:iterator>
		
		    </tbody>
        
	</table>
	</div>
</s:if>
</body>
</html>