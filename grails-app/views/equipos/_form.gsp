<%@ page import="servicios.Equipos" %>



<div class="fieldcontain ${hasErrors(bean: equiposInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="equipos.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipo" required="" value="${equiposInstance?.tipo}"/>
</div>

