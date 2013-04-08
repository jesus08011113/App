<%@ page import="servicios.Cliente" %>


  <g:form method="post" url="[action:'update',controller:'cliente']" >
    ${orden}
				<g:hiddenField name="id" value="${clienteInstance?.id}" />
				<g:hiddenField name="version" value="${clienteInstance?.version}" />
				<g:hiddenField name="os" value=" ${orden.id}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="actualiza" class="save" action="update"  controller="cliente" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					
				</fieldset>
			</g:form>