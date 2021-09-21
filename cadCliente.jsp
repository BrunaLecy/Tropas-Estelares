<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich" %>

<a4j:form id="formCliente">

<rich:panel header="Adicionar Cliente" style="width:400px">
	<table width="100%" cellspacing="6">
		<tr>
			<td width="40px" style="text-align:right"><label for="cpf" >CPF*: </label></td>
			<td style="text-align:left" colspan="3">
				<h:inputText id="cpf" styleClass="input-text" value="#{usuario.cpf}" required="true"
							 requiredMessage="Especifique o CPF do Cliente.">
				</h:inputText>
			</td>
		</tr>
		<tr>
			<td colspan="4">(*) A senha inicial será igual ao CPF.</td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="cpf" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td style="text-align:right"><label for="nome" >Nome: </label></td>
			<td style="text-align:left" colspan="3">
				<h:inputText id="nome" styleClass="input-text" value="#{usuario.nome}" required="true"
							 requiredMessage="Especifique o nome do Cliente.">
				</h:inputText>
			</td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="nome" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td style="text-align:right"><label for="nascimento" >Nascimento: </label></td>
			<td style="text-align:left">
				<rich:calendar id="nascimento" inputSize="12" value="#{usuario.nascimento}"
							   datePattern="dd/MM/yyyy" enableManualInput="true" 
							   required="true" requiredMessage="Especifique a data de nascimento do Cliente."
							   converterMessage="Especifique a data no formato dd/MM/yyyy (exemplo: 15/07/1993).">
					<f:convertDateTime pattern="dd/MM/yyyy HH:mm" />
				</rich:calendar>
			</td>
			<td width="40px" style="text-align:right"><label for="email" >E-mail: </label></td>
			<td width="120px" style="text-align:left">
				<h:inputText id="email" styleClass="input-text" value="#{usuario.email}" required="true"
							 requiredMessage="Especifique o e-mail do Cliente.">
				</h:inputText>
			</td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="nascimento" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="email" ajaxRendered="true" style="color:red;"/></td>
		</tr>
	</table>
	<rich:spacer height="10" width="1"/>
	<a4j:commandButton styleClass="button" type="submit" action="#{usuario.cadastrarCliente}" value="Adicionar" reRender="formCliente" />
</rich:panel>

<rich:spacer height="10" width="1"/>

<rich:extendedDataTable height="346px" width="100%" align="center" value="#{usuario.listaClientes}"
						var="clienteItem" id="tableCliente"	sortMode="single" selectionMode="none">
	<rich:column id="colNome" width="400px" label="Nome" sortable="true" sortBy="#{clienteItem.nome}" sortOrder="ASCENDING">
		<f:facet name="header"><h:outputText value="Nome"/></f:facet>
		<h:outputText value="#{clienteItem.nome}"/>
	</rich:column>
	<rich:column id="colCPF" width="200px" label="CPF" sortable="true" sortBy="#{clienteItem.cpf}">
		<f:facet name="header"><h:outputText value="CPF"/></f:facet>
		<h:outputText value="#{clienteItem.cpf}"/>
	</rich:column>
	<rich:column id="colNascimento" width="100px" label="Nascimento" sortable="true" sortBy="#{clienteItem.nascimento}">
		<f:facet name="header"><h:outputText value="Nascimento"/></f:facet>
		<h:outputText value="#{clienteItem.nascimento}"><f:convertDateTime pattern="dd/MM/yyyy" /></h:outputText>
	</rich:column>
	<rich:column id="colEmail" width="200px" label="E-mail" sortable="true" sortBy="#{clienteItem.email}">
		<f:facet name="header"><h:outputText value="E-mail"/></f:facet>
		<h:outputText value="#{clienteItem.email}"></h:outputText>
	</rich:column>
	<rich:column width="60px" label="Remover" sortable="false">
		<f:facet name="header"><h:outputText value="Remover" /></f:facet>
		<h:outputLink value="javascript:confirmaRemover('#{clienteItem.cpf}','#{clienteItem.nome}')" >
			<f:verbatim>[X]</f:verbatim>
		</h:outputLink>
	</rich:column>
</rich:extendedDataTable>

</a4j:form>

<script language="JavaScript">        
function confirmaRemover(cpf,nome) {        
	if (confirm("Tem certeza que deseja remover o cliente \"" + nome + "\"?")) {
		removerCliente(cpf);
    }        
}
</script>

<a4j:form>
	<a4j:jsFunction name="removerCliente" reRender="tableCliente" action="#{usuario.removerCliente}">
		<a4j:actionparam name="cpf" assignTo="#{usuario.cpf}"  />                  
	</a4j:jsFunction>
</a4j:form>
