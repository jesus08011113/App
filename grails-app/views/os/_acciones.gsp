

<g:form url="[action:'update',controller:'os']" >
				<g:hiddenField name="id" value="${osInstance?.id}" />
				<g:hiddenField name="version" value="${osInstance?.version}" />
				<div class="fieldcontain ${hasErrors(bean: osInstance, field: 'acciones', 'error')} ">
	<label for="acciones">
		<g:message code="os.acciones.label" default="Acciones" />
		
	</label>
	<g:select name="acciones" from="${servicios.Acciones.list()}" multiple="multiple" optionKey="id" size="5" value="${osInstance?.acciones*.id}" class="many-to-many"/>
                                </div>
                                
                                
                                
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					
				</fieldset>
</g:form>