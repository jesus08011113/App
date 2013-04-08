<%@ page import="servicios.OsAcciones" %>



<div class="fieldcontain ${hasErrors(bean: osAccionesInstance, field: 'acciones', 'error')} required">
	<label for="acciones">
		<g:message code="osAcciones.acciones.label" default="Acciones" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="acciones" name="acciones.id" from="${servicios.Acciones.list()}" optionKey="id" required="" value="${osAccionesInstance?.acciones?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: osAccionesInstance, field: 'os', 'error')} required">
	<label for="os">
		<g:message code="osAcciones.os.label" default="Os" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="os" name="os.id" from="${servicios.Os.list()}" optionKey="id" required="" value="${osAccionesInstance?.os?.id}" class="many-to-one"/>
</div>

