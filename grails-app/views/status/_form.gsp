<%@ page import="servicios.Status" %>



<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="status.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${statusInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="status.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${statusInstance.constraints.tipo.inList}" required="" value="${statusInstance?.tipo}" valueMessagePrefix="status.tipo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="status.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${statusInstance?.descripcion}"/>
</div>

