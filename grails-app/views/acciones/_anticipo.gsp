<%@ page import="servicios.Acciones" %>

<div class="fieldcontain ${hasErrors(bean: accionesInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="acciones.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${accionesInstance?.nombre}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: accionesInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="acciones.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" value="${fieldValue(bean: accionesInstance, field: 'precio')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: accionesInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="acciones.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${accionesInstance?.descripcion}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: accionesInstance, field: 'orden', 'error')} ">
	<label for="orden">
		<g:message code="acciones.orden.label" default="Orden" />
		
	</label>
	<g:select name="orden" from="${accionesInstance?.orden?.id}" optionKey="id" size="5" value="${accionesInstance?.orden?.id}" class="many-to-many"/>
</div>






