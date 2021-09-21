<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema Venda de Bilhetes - Menu do Administrador</title>
	<link rel="stylesheet" type="text/css" href="style/style.css" />
	<link rel="shortcut icon" href="favicon.ico" /> 
</head>

<body>
<f:view>
	<%@ include file="validaSessaoAdm.jsp" %>
	    
	<rich:tabPanel switchType="ajax">
        <rich:tab label="Categorias">
        	<%@ include file="cadCategoria.jsp" %>
       	</rich:tab>
        <rich:tab label="Eventos">
        	<%@ include file="cadEvento.jsp" %>
       	</rich:tab>
        <rich:tab label="Clientes">
        	<%@ include file="cadCliente.jsp" %>
       	</rich:tab>
        <rich:tab label="Bilhetes Vendidos">
        	<%@ include file="consultaBilhete.jsp" %>
       	</rich:tab>
        <rich:tab label="Alterar Senha">
        	<%@ include file="alteraSenha.jsp" %>
       	</rich:tab>
	</rich:tabPanel>
	
	<a4j:outputPanel style="text-align:left" ajaxRendered="true">  
		<h:messages />  
	</a4j:outputPanel>
</f:view>
</body>
</html>
