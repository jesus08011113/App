<%@ page import="servicios.Provedores" %>



<div class="fieldcontain ${hasErrors(bean: provedoresInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="provedores.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${provedoresInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: provedoresInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="provedores.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estatus" from="${provedoresInstance.constraints.estatus.inList}" required="" value="${provedoresInstance?.estatus}" valueMessagePrefix="provedores.estatus"/>
</div>

<div class="fieldcontain ${hasErrors(bean: provedoresInstance, field: 'telefono1', 'error')} ">
	<label for="telefono1">
		<g:message code="provedores.telefono1.label" default="Telefono1" />
		
	</label>
	<g:textField name="telefono1" maxlength="10" pattern="${provedoresInstance.constraints.telefono1.matches}" value="${provedoresInstance?.telefono1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: provedoresInstance, field: 'telefono2', 'error')} ">
	<label for="telefono2">
		<g:message code="provedores.telefono2.label" default="Telefono2" />
		
	</label>
	<g:textField name="telefono2" maxlength="10" pattern="${provedoresInstance.constraints.telefono2.matches}" value="${provedoresInstance?.telefono2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: provedoresInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="provedores.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" value="${provedoresInstance?.direccion}"/>
</div>

