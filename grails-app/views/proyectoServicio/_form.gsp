<%@ page import="servicios.ProyectoServicio" %>



<div class="fieldcontain ${hasErrors(bean: proyectoServicioInstance, field: 'proyecto', 'error')} required">
	<label for="proyecto">
		<g:message code="proyectoServicio.proyecto.label" default="Proyecto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proyecto" name="proyecto.id" from="${servicios.Proyecto.list()}" optionKey="id" required="" value="${proyectoServicioInstance?.proyecto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proyectoServicioInstance, field: 'servicio', 'error')} required">
	<label for="servicio">
		<g:message code="proyectoServicio.servicio.label" default="Servicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="servicio" name="servicio.id" from="${servicios.TServicio.list()}" optionKey="id" required="" value="${proyectoServicioInstance?.servicio?.id}" class="many-to-one"/>
</div>

