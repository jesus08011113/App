<%@ page import="servicios.UsuarioProyecto" %>



<div class="fieldcontain ${hasErrors(bean: usuarioProyectoInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="usuarioProyecto.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${servicios.User.list()}" optionKey="id" required="" value="${usuarioProyectoInstance?.usuario?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioProyectoInstance, field: 'proyecto', 'error')} required">
	<label for="proyecto">
		<g:message code="usuarioProyecto.proyecto.label" default="Proyecto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proyecto" name="proyecto.id" from="${servicios.Proyecto.list()}" optionKey="id" required="" value="${usuarioProyectoInstance?.proyecto?.id}" class="many-to-one"/>
</div>

