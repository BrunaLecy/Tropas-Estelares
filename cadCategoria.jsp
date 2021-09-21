<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich" %>

<a4j:form id="formCategoria">

<rich:panel header="Adicionar Categoria" style="width:400px">
	<table width="100%" cellspacing="6">
		<tr>
			<td width="60px" style="text-align:right"><label for="descricao" >Descrição: </label></td>
			<td style="text-align:left">
				<h:inputText id="descricao" styleClass="input-text" value="#{categoria.descricao}" required="true"
							 requiredMessage="Especifique uma descrição para a Categoria.">
				</h:inputText>
			</td>
		</tr>
		<tr>
			<td colspan="2"><rich:message for="descricao" ajaxRendered="true" style="color:red;"/></td>
		</tr>
	</table>
	<rich:spacer height="10" width="1"/>
	<a4j:commandButton styleClass="button" type="submit" action="#{categoria.cadastrar}" value="Adicionar" reRender="formCategoria" />
</rich:panel>

<rich:spacer height="10" width="1"/>

<rich:extendedDataTable height="346px" width="100%" align="center" value="#{categoria.lista}"
						var="categoriaItem" id="tableCategoria"	sortMode="single" selectionMode="none">
	<rich:column id="colDescricao" width="900px" label="Categoria" sortable="true" sortBy="#{categoriaItem.descricao}" sortOrder="ASCENDING">
		<f:facet name="header"><h:outputText value="Categoria"/></f:facet>
		<h:outputText value="#{categoriaItem.descricao}"/>
	</rich:column>
	<rich:column width="80px" label="Remover" sortable="false">
		<f:facet name="header"><h:outputText value="Remover" /></f:facet>
		<h:outputLink value="javascript:confirmaRemover('#{categoriaItem.id}','#{categoriaItem.descricao}')" >
			<f:verbatim>[X]</f:verbatim>
		</h:outputLink>
	</rich:column>
</rich:extendedDataTable>

</a4j:form>

<script language="JavaScript">        
function confirmaRemover(id,descricao) {        
	if (confirm("Tem certeza que deseja remover a categoria \"" + descricao + "\"?")) {
		removerCategoria(id);
    }        
}
</script>

<a4j:form>
	<a4j:jsFunction name="removerCategoria" reRender="tableCategoria" action="#{categoria.remover}">
		<a4j:actionparam name="id" assignTo="#{categoria.id}"  />                  
	</a4j:jsFunction>
</a4j:form>
