<%@ page import="servicios.Central" %>



<div class="fieldcontain ${hasErrors(bean: centralInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="central.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${centralInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: centralInstance, field: 'sitios', 'error')} ">
	<label for="sitios">
		<g:message code="central.sitios.label" default="Sitios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${centralInstance?.sitios?}" var="s">
    <li><g:link controller="sitio" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sitio" action="create" params="['central.id': centralInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sitio.label', default: 'Sitio')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: centralInstance, field: 'zona', 'error')} ">
	<label for="zona">
		<g:message code="central.zona.label" default="Zona" />
		
	</label>
	<g:textField name="zona" value="${centralInstance?.zona}"/>
</div>

