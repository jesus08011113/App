<%@ page import="servicios.ProyectoCentral" %>



<div class="fieldcontain ${hasErrors(bean: proyectoCentralInstance, field: 'proyecto', 'error')} required">
	<label for="proyecto">
		<g:message code="proyectoCentral.proyecto.label" default="Proyecto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proyecto" name="proyecto.id" from="${servicios.Proyecto.list()}" optionKey="id" required="" value="${proyectoCentralInstance?.proyecto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proyectoCentralInstance, field: 'central', 'error')} required">
	<label for="central">
		<g:message code="proyectoCentral.central.label" default="Central" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="central" name="central.id" multiple="true" from="${servicios.Central.list()}" optionKey="id" required="" value="${proyectoCentralInstance?.central?.collect{it.id}}" class="many-to-one"/>
</div>


