

<a4j:form id="formEvento">

<rich:panel header="Adicionar Evento" style="width:400px">
	<table width="100%" cellspacing="6">
		<tr>
			<td width="50px" style="text-align:right"><label for="categoria" >Categoria: </label></td>
			<td style="text-align:left" colspan="3">
				<rich:comboBox id="categoria" width="300px" value="#{evento.categoria.descricao}" enableManualInput="false"
				               defaultLabel="Selecione..." suggestionValues="#{evento.categoriaManaged.listaDescricao}"
				               required="true" requiredMessage="Escolha uma Categoria.">
				</rich:comboBox>
			</td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="categoria" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td style="text-align:right"><label for="descricao" >Descrição: </label></td>
			<td style="text-align:left" colspan="3">
				<h:inputText id="descricao" styleClass="input-text" value="#{evento.descricao}" required="true"
							 requiredMessage="Especifique uma descrição para o Evento.">
				</h:inputText>
			</td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="descricao" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td style="text-align:right"><label for="data" >Data/Hora: </label></td>
			<td style="text-align:left">
				<rich:calendar id="data" inputSize="14" value="#{evento.data}"
							   datePattern="dd/MM/yyyy HH:mm" showApplyButton="true" enableManualInput="true" 
							   required="true" requiredMessage="Especifique a data/hora do Evento."
							   converterMessage="Especifique a data/hora no formato dd/MM/yyyy HH:mm (exemplo: 15/07/1993 20:35).">
					<f:convertDateTime pattern="dd/MM/yyyy HH:mm" />
				</rich:calendar>
			</td>
			<td width="70px" style="text-align:right"><label for="valor" >Valor: </label></td>
			<td width="80px" style="text-align:left">
				<h:inputText id="valor" styleClass="input-text" value="#{evento.valor}" required="true"
							 requiredMessage="Especifique o valor individual do Bilhete para o Evento."
							 validatorMessage="Especifique um valor válido (exemplo: 50,33)."
							 converterMessage="Especifique um valor válido (exemplo: 50,33).">
					<f:convertNumber type="number" />
					<f:validateDoubleRange minimum="0.0" />
				</h:inputText>
			</td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="data" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="valor" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td style="text-align:right"><label for="capacidade" >Capacidade: </label></td>
			<td style="text-align:left">
				<h:inputText id="capacidade" styleClass="input-text" value="#{evento.capacidade}" required="true"
							 requiredMessage="Especifique a capacidade (lotação) máxima para o Evento."
							 validatorMessage="Especifique uma capacidade válida (exemplo: 150)."
							 converterMessage="Especifique uma capacidade válida (exemplo: 150).">
					<f:convertNumber integerOnly="true" />
					<f:validateLongRange minimum="0" />
				</h:inputText>
			</td>
			<td style="text-align:right"><label for="etaria" >Class. Etária: </label></td>
			<td style="text-align:left">
				<h:inputText id="etaria" styleClass="input-text" value="#{evento.classificacaoEtaria}" required="true"
							 requiredMessage="Especifique a classificação etária (0 = livre)."
							 validatorMessage='Especifique uma class. etária válida (exemplo: 18, ou 0 para "livre").'
							 converterMessage='Especifique uma class. etária válida (exemplo: 18, ou 0 para "livre").'>
					<f:convertNumber integerOnly="true" />
					<f:validateLongRange minimum="0" />
				</h:inputText>
			</td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="capacidade" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td colspan="4"><rich:message for="etaria" ajaxRendered="true" style="color:red;"/></td>
		</tr>
	</table>
	<rich:spacer height="10" width="1"/>
	<a4j:commandButton styleClass="button" type="submit" action="#{evento.cadastrar}" value="Adicionar" reRender="formEvento" />
</rich:panel>

<rich:spacer height="10" width="1"/>

<rich:extendedDataTable height="346px" width="100%" align="center" value="#{evento.lista}"
						var="eventoItem" id="tableEvento"	sortMode="single" selectionMode="none">
	<rich:column id="colCategoria" width="200px" label="Categoria" sortable="true" sortBy="#{eventoItem.categoria.descricao}">
		<f:facet name="header"><h:outputText value="Categoria"/></f:facet>
		<h:outputText value="#{eventoItem.categoria.descricao}"/>
	</rich:column>
	<rich:column id="colDescricao" width="380px" label="Evento" sortable="true" sortBy="#{eventoItem.descricao}" sortOrder="ASCENDING">
		<f:facet name="header"><h:outputText value="Evento"/></f:facet>
		<h:outputText value="#{eventoItem.descricao}"/>
	</rich:column>
	<rich:column id="colData" width="100px" label="Data/Hora" sortable="true" sortBy="#{eventoItem.data}">
		<f:facet name="header"><h:outputText value="Data/Hora"/></f:facet>
		<h:outputText value="#{eventoItem.data}"><f:convertDateTime pattern="dd/MM/yyyy HH:mm" /></h:outputText>
	</rich:column>
	<rich:column id="colCapacidade" width="80px" label="Capacidade" sortable="true" sortBy="#{eventoItem.capacidade}">
		<f:facet name="header"><h:outputText value="Capacidade"/></f:facet>
		<h:outputText value="#{eventoItem.capacidade}"></h:outputText>
	</rich:column>
	<rich:column id="colValor" width="80px" label="Valor" sortable="true" sortBy="#{eventoItem.valor}">
		<f:facet name="header"><h:outputText value="Valor"/></f:facet>
		<h:outputText value="#{eventoItem.valor}"><f:convertNumber type="currency" /></h:outputText>
	</rich:column>
	<rich:column id="colEtaria" width="60px" label="Classificação Etária" sortable="true" sortBy="#{eventoItem.classificacaoEtaria}">
		<f:facet name="header"><h:outputText value="C.Etária"/></f:facet>
		<h:outputText value="#{(eventoItem.classificacaoEtaria != 0)?eventoItem.classificacaoEtaria:'Livre'}"></h:outputText>
	</rich:column>
	<rich:column width="60px" label="Remover" sortable="false">
		<f:facet name="header"><h:outputText value="Remover" /></f:facet>
		<h:outputLink value="javascript:confirmaRemover('#{eventoItem.id}','#{eventoItem.descricao}')" >
			<f:verbatim>[X]</f:verbatim>
		</h:outputLink>
	</rich:column>
</rich:extendedDataTable>

</a4j:form>

<script language="JavaScript">        
function confirmaRemover(id,descricao) {        
	if (confirm("Tem certeza que deseja remover o evento \"" + descricao + "\"?")) {
		removerEvento(id);
    }        
}
</script>

<a4j:form>
	<a4j:jsFunction name="removerEvento" reRender="tableEvento" action="#{evento.remover}">
		<a4j:actionparam name="id" assignTo="#{evento.id}"  />                  
	</a4j:jsFunction>
</a4j:form>
