<%@ page import="servicios.TServicio" %>



<div class="fieldcontain ${hasErrors(bean: TServicioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="TServicio.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${TServicioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: TServicioInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="TServicio.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${TServicioInstance?.codigo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: TServicioInstance, field: 'documentos', 'error')} ">
	<label for="documentos">
		<g:message code="TServicio.documentos.label" default="Documentos" />
		
	</label>
	<g:textArea name="documentos" value="${TServicioInstance?.documentos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: TServicioInstance, field: 'herramienta', 'error')} ">
	<label for="herramienta">
		<g:message code="TServicio.herramienta.label" default="Herramienta" />
		
	</label>
	<g:textArea name="herramienta" value="${TServicioInstance?.herramienta}"/>
</div>

