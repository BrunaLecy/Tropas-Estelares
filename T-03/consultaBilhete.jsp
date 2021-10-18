<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich" %>

<a4j:form id="formConsultaBilhete">
<table width="700px" cellspacing="6">
	<tr>
		<td width="50px" style="text-align:right"><label for="selCategoria" >Categoria: </label></td>
		<td style="text-align:left" colspan="3">
			<rich:comboBox id="selCategoria" width="300px" value="#{bilhete.categoriaDescricao}" enableManualInput="false"
			               defaultLabel="Selecione..." suggestionValues="#{bilhete.listaCategoriasDescricao}">
				<a4j:support event="onselect" reRender="selEvento" />
			</rich:comboBox>
		</td>
		<td style="text-align:right"><label for="selEvento" >Evento: </label></td>
		<td style="text-align:left" colspan="3">
			<rich:comboBox id="selEvento" width="300px" value="#{bilhete.eventoDescricao}" enableManualInput="false"
			               defaultLabel="Selecione..." suggestionValues="#{bilhete.listaEventosDescricao}">
				<a4j:support event="onselect" reRender="qtdTotal,valorTotal,tableBilhete" />
			</rich:comboBox>
		</td>
	</tr>
</table>
<rich:spacer height="10" width="1"/>

<rich:extendedDataTable height="346px" width="100%" align="center" value="#{bilhete.listaPorEvento}"
						var="bilheteItem" id="tableBilhete"	sortMode="single" selectionMode="none">
	<rich:column id="colNumero" width="80px" label="Numero" sortable="true" sortBy="#{bilheteItem.numero}" sortOrder="ASCENDING">
		<f:facet name="header"><h:outputText value="Numero"/></f:facet>
		<h:outputText value="#{bilheteItem.numero}"/>
	</rich:column>
	<rich:column id="colCategoria" width="200px" label="Categoria" sortable="true" sortBy="#{bilheteItem.evento.categoria.descricao}">
		<f:facet name="header"><h:outputText value="Categoria"/></f:facet>
		<h:outputText value="#{bilheteItem.evento.categoria.descricao}"/>
	</rich:column>
	<rich:column id="colDescricao" width="400px" label="Evento" sortable="true" sortBy="#{bilheteItem.evento.descricao}">
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
</rich:extendedDataTable>

<rich:spacer height="10" width="1"/>
<table>
	<tr>
		<td>
			<h:outputText value="Total de Bilhetes vendidos para este Evento:"/>
		</td>
		<td>
			<h:outputText id="qtdTotal" value="#{bilhete.quantidadeTotalPorEvento}"></h:outputText>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td>
			<h:outputText value="Valor total para este Evento:"/>
		</td>
		<td>
			<h:outputText id="valorTotal" value="#{bilhete.valorTotalPorEvento}"><f:convertNumber type="currency" /></h:outputText>
		</td>
	</tr>
</table>


</a4j:form>
