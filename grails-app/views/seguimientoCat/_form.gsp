<%@ page import="servicios.SeguimientoCat" %>



<div class="fieldcontain ${hasErrors(bean: seguimientoCatInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="seguimientoCat.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${seguimientoCatInstance?.nombre}"/>
</div>

