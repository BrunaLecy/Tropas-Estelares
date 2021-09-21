<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich" %>

<a4j:form id="formBilhete">

<rich:extendedDataTable height="346px" width="100%" align="center" value="#{bilhete.eventoManaged.listaCorrente}"
						var="eventoItem" id="tableEvento"	sortMode="single" selectionMode="none">
	<rich:column id="colCategoria" width="200px" label="Categoria" sortable="true" sortBy="#{eventoItem.categoria.descricao}">
		<f:facet name="header"><h:outputText value="Categoria"/></f:facet>
		<h:outputText value="#{eventoItem.categoria.descricao}"/>
	</rich:column>
	<rich:column id="colDescricao" width="320px" label="Evento" sortable="true" sortBy="#{eventoItem.descricao}" sortOrder="ASCENDING">
		<f:facet name="header"><h:outputText value="Evento"/></f:facet>
		<h:outputText value="#{eventoItem.descricao}"/>
	</rich:column>
	<rich:column id="colData" width="100px" label="Data/Hora" sortable="true" sortBy="#{eventoItem.data}">
		<f:facet name="header"><h:outputText value="Data/Hora"/></f:facet>
		<h:outputText value="#{eventoItem.data}"><f:convertDateTime pattern="dd/MM/yyyy HH:mm" /></h:outputText>
	</rich:column>
	<rich:column id="colDispon" width="100px" label="Disponibilidade" sortable="true" sortBy="#{eventoItem.disponibilidade}">
		<f:facet name="header"><h:outputText value="Disponibilidade"/></f:facet>
		<h:outputText value="#{eventoItem.disponibilidade}"></h:outputText>
	</rich:column>
	<rich:column id="colValor" width="80px" label="Valor" sortable="true" sortBy="#{eventoItem.valor}">
		<f:facet name="header"><h:outputText value="Valor"/></f:facet>
		<h:outputText value="#{eventoItem.valor}"><f:convertNumber type="currency" /></h:outputText>
	</rich:column>
	<rich:column id="colEtaria" width="60px" label="Classificação Etária" sortable="true" sortBy="#{eventoItem.classificacaoEtaria}">
		<f:facet name="header"><h:outputText value="C.Etária"/></f:facet>
		<h:outputText value="#{(eventoItem.classificacaoEtaria != 0)?eventoItem.classificacaoEtaria:'Livre'}"></h:outputText>
	</rich:column>
	<rich:column id="colComprar" width="100px" label="Comprar" sortable="false">
		<f:facet name="header"><h:outputText value="Comprar"/></f:facet>
		<a4j:commandButton value="Comprar" styleClass="button"
						   disabled="#{(eventoItem.disponibilidade > 0 && usuarioLogado.idade >= eventoItem.classificacaoEtaria)?'false':'true'}"
						   onclick="javascript:comprarBilhete('#{eventoItem.id}')" />
	</rich:column>
</rich:extendedDataTable>

</a4j:form>

<a4j:form>
	<a4j:jsFunction name="comprarBilhete" reRender="tableEvento" action="#{bilhete.comprar}">
		<a4j:actionparam name="evento" assignTo="#{bilhete.evento.id}"  />                  
	</a4j:jsFunction>
</a4j:form>
