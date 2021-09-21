<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema Venda de Bilhetes - Menu do Cliente</title>
	<link rel="stylesheet" type="text/css" href="style/style.css" />
	<link rel="shortcut icon" href="favicon.ico" /> 
</head>

<body>
<f:view>
	<%@ include file="validaSessaoCli.jsp" %>    

	<rich:tabPanel switchType="ajax">
        <rich:tab label="Comprar Bilhetes">
        	<%@ include file="compraBilhete.jsp" %>
       	</rich:tab>
        <rich:tab label="Devolver Bilhetes">
        	<%@ include file="devolveBilhete.jsp" %>
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