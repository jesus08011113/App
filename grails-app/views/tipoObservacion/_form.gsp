<%@ page import="servicios.TipoObservacion" %>



<div class="fieldcontain ${hasErrors(bean: tipoObservacionInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="tipoObservacion.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tipoObservacionInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoObservacionInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="tipoObservacion.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${tipoObservacionInstance.constraints.tipo.inList}" required="" value="${tipoObservacionInstance?.tipo}" valueMessagePrefix="tipoObservacion.tipo"/>
</div>

