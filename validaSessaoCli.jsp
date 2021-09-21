<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich" %>

<c:choose>
	<c:when test="${usuarioLogado.cpf != null && usuarioLogado.nivelAsInt != 0}">
		<a4j:form id="titleForm">
		<table class="table-title">
			<tr>
				<th class="th-title" colspan="3"><h1>Sistema Venda de Bilhetes</h1></th>
			</tr>
			<tr>	
				<td width="150"><h:commandLink action="menuCli" value="Menu Principal" /></td>
				<td style="text-align:left">
					<c:out value="${usuarioLogado.nome}: " /><h:commandLink action="#{usuarioLogado.invalidar}" value="logoff" />
				</td>
				<td width="250" style="text-align:right">by Robson Martins (16SCJ/RM:42055)</td>
			</tr>
		</table>
		</a4j:form>
		<rich:spacer height="10" width="1"/>
	</c:when>
	<c:otherwise>
		<c:redirect url="login.faces" />
	</c:otherwise>
</c:choose>
