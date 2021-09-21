<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Sistema Venda de Bilhetes - Página de Login</title>
	<link rel="stylesheet" type="text/css" href="style/style.css" />
	<link rel="shortcut icon" href="favicon.ico" /> 
</head>

<body>
<f:view>
	<table class="table-title" >
		<tr>
			<th class="th-title"><h1>Sistema Venda de Bilhetes</h1></th>
		</tr>
		<tr>	
			<td style="text-align:right">by Robson Martins (16SCJ/RM:42055)</td>
		</tr>
	</table>
	<rich:spacer height="10" width="1"/>
	<a4j:form id="formLogin">
		<rich:panel header="Login" style="width:300px">
		<table width="100%">
			<tr>
				<td style="border:0px" width="30px">CPF:</td>
				<td style="border:0px;text-align:left"><h:inputText styleClass="input-text" value="#{usuarioLogado.cpf}" /></td>
			</tr>
			<tr>
				<td style="border:0px">Senha:</td>
				<td style="border:0px;text-align:left"><h:inputSecret styleClass="input-text" value="#{usuarioLogado.senha}" /></td>
			</tr>
			<tr>
				<td colspan="2" style="border:0px">
					<h:commandButton type="submit" value="Login" action="#{usuarioLogado.validar}" />&nbsp;
					<h:commandButton type="reset" value="Limpar" action="#{usuarioLogado.limpar}" />
				</td>
			</tr>		
		</table>
		</rich:panel>
	</a4j:form>
	<rich:spacer height="20" width="1"/>
	<a4j:outputPanel>  
		<rich:messages ajaxRendered="true" style="color:red;" />  
	</a4j:outputPanel>
</f:view>
</body>
</html>