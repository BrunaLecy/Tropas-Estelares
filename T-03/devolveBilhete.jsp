<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich" %>

<a4j:form id="formDevolveBilhete">
<rich:extendedDataTable height="346px" width="100%" align="center" value="#{bilhete.listaCorrente}"
						var="bilheteItem" id="tableBilhete"	sortMode="single" selectionMode="none">
	<rich:column id="colNumero" width="80px" label="Numero" sortable="true" sortBy="#{bilheteItem.numero}" sortOrder="ASCENDING">
		<f:facet name="header"><h:outputText value="Numero"/></f:facet>
		<h:outputText value="#{bilheteItem.numero}"/>
	</rich:column>
	<rich:column id="colCategoria" width="200px" label="Categoria" sortable="true" sortBy="#{bilheteItem.evento.categoria.descricao}">
		<f:facet name="header"><h:outputText value="Categoria"/></f:facet>
		<h:outputText value="#{bilheteItem.evento.categoria.descricao}"/>
	</rich:column>
	<rich:column id="colDescricao" width="300px" label="Evento" sortable="true" sortBy="#{bilheteItem.evento.descricao}">
		<f:facet name="header"><h:outputText value="Evento"/></f:facet>
		<h:outputText value="#{bilheteItem.evento.descricao}"/>
	</rich:column>
	<rich:column id="colDataEvento" width="100px" label="Data/Hora" sortable="true" sortBy="#{bilheteItem.evento.data}">
		<f:facet name="header"><h:outputText value="Data/Hora"/></f:facet>
		<h:outputText value="#{bilheteItem.evento.data}"><f:convertDateTime pattern="dd/MM/yyyy HH:mm" /></h:outputText>
	</rich:column>
	<rich:column id="colData" width="100px" label="Data Compra" sortable="true" sortBy="#{bilheteItem.dataCompra}">
		<f:facet name="header"><h:outputText value="Data Compra"/></f:facet>
		<h:outputText value="#{bilheteItem.dataCompra}"><f:convertDateTime pattern="dd/MM/yyyy" /></h:outputText>
	</rich:column>
	<rich:column id="colValor" width="80px" label="Valor" sortable="true" sortBy="#{bilheteItem.evento.valor}">
		<f:facet name="header"><h:outputText value="Valor"/></f:facet>
		<h:outputText value="#{bilheteItem.evento.valor}"><f:convertNumber type="currency" /></h:outputText>
	</rich:column>
	<rich:column id="colDevolver" width="100px" label="Devolver" sortable="false">
		<f:facet name="header"><h:outputText value="Devolver"/></f:facet>
		<a4j:commandButton value="Devolver" styleClass="button"
						   disabled="#{(bilheteItem.liberadoDevolucao)?'false':'true'}"
						   onclick="javascript:devolverBilhete('#{bilheteItem.numero}')" />
	</rich:column>
</rich:extendedDataTable>

</a4j:form>

<a4j:form>
	<a4j:jsFunction name="devolverBilhete" reRender="tableBilhete" action="#{bilhete.devolver}">
		<a4j:actionparam name="numero" assignTo="#{bilhete.numero}"  />                  
	</a4j:jsFunction>
</a4j:form>
