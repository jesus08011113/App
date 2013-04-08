<%@ page import="servicios.Observacion" %>



<div class="fieldcontain ${hasErrors(bean: observacionInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="observacion.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${observacionInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observacionInstance, field: 'orden', 'error')} required">
	
	<g:hiddenField id="orden" name="orden.id" from="${servicios.Orden.list()}" optionKey="id" required="" value="${observacionInstance?.orden?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observacionInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="observacion.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${servicios.TipoObservacion.list()}" optionKey="id" required="" value="${observacionInstance?.tipo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observacionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="observacion.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" value="${observacionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observacionInstance, field: 'usuario', 'error')} required">
	
	<g:hiddenField id="usuario" name="usuario.id" from="${servicios.User.list()}" optionKey="id" required="" value="${observacionInstance?.usuario?.id}" class="many-to-one"/>
</div>

