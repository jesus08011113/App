<%@ page import="servicios.Sitio" %>



<div class="fieldcontain ${hasErrors(bean: sitioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="sitio.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${sitioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sitioInstance, field: 'central', 'error')} required">
	<label for="central">
		<g:message code="sitio.central.label" default="Central" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="central" name="central.id" from="${servicios.Central.list()}" optionKey="id" required="" value="${sitioInstance?.central?.id}" class="many-to-one"/>
</div>

