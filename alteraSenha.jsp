<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j" %>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich" %>

<a4j:form id="formAlterarSenha">
	<rich:panel header="Alterar Senha" style="width:300px">
	<table id="tableAlterarSenha" width="100%">
		<tr>
			<td style="border:0px">Nova Senha:</td>
			<td style="border:0px;text-align:left">
				<h:inputSecret id="inputNovaSenha" styleClass="input-text" required="true"
							   requiredMessage="Especifique a nova senha."
							   validatorMessage="A senha deve ter no mínimo 6 caracteres.">
					<f:validateLength minimum="6"/> 
				</h:inputSecret>
			</td>
		</tr>
		<tr>
			<td colspan="2"><rich:message for="inputNovaSenha" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td style="border:0px">Confirmar Senha:</td>
			<td style="border:0px;text-align:left">
				<h:inputSecret id="inputConfirmaSenha" styleClass="input-text" required="true"
				               requiredMessage="Repita a nova senha para confirmação." />
			</td>
		</tr>
		<tr>
			<td colspan="2"><rich:message for="inputConfirmaSenha" ajaxRendered="true" style="color:red;"/></td>
		</tr>
		<tr>
			<td colspan="2" style="border:0px">
				<a4j:commandButton type="submit" value="Alterar Senha" onclick="javascript:confereSenha()" />
			</td>
		</tr>		
	</table>
	</rich:panel>
</a4j:form>

<a4j:form>
	<a4j:jsFunction name="alterarSenha" action="#{usuarioLogado.alterarSenha}" oncomplete="javascript:limpaCampos();">
		<a4j:actionparam name="senha" assignTo="#{usuarioLogado.novaSenha}"  />                  
	</a4j:jsFunction>
</a4j:form>

<script language="JavaScript">        
function confereSenha() {
	var senha1 = document.getElementById('formAlterarSenha:inputNovaSenha').value;
	var senha2 = document.getElementById('formAlterarSenha:inputConfirmaSenha').value;
	if (senha1 != senha2){
		alert("Senhas não conferem. Por favor, tente novamente.");
	} else { 	
		alterarSenha(senha1);
	}
}
function limpaCampos() {
	document.getElementById('formAlterarSenha:inputNovaSenha').value = '';
	document.getElementById('formAlterarSenha:inputConfirmaSenha').value = '';
}
</script>
