<%@ page import="servicios.ObservacionesOS" %>



<div class="fieldcontain ${hasErrors(bean: observacionesOSInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="observacionesOS.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${observacionesOSInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observacionesOSInstance, field: 'orden', 'error')} required">
	
	<g:hiddenField id="orden" name="orden.id" from="${servicios.Os.list()}" optionKey="id" required="" value="${observacionesOSInstance?.orden?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observacionesOSInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="observacionesOS.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${tipoLista}" noSelection="['':'Selecciona un tipo']" optionKey="id" required="" value="${observacionesOSInstance?.tipo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observacionesOSInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="observacionesOS.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" value="${observacionesOSInstance?.descripcion}"/>
</div>

