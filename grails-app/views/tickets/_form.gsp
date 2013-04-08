<%@ page import="servicios.Tickets" %>



<div class="fieldcontain ${hasErrors(bean: ticketsInstance, field: 'conceptos', 'error')} ">
	<label for="conceptos">
		<g:message code="tickets.conceptos.label" default="Conceptos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ticketsInstance?.conceptos?}" var="c">
    <li><g:link controller="conceptos" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="conceptos" action="create" params="['tickets.id': ticketsInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'conceptos.label', default: 'Conceptos')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketsInstance, field: 'estatus', 'error')} ">
	<label for="estatus">
		<g:message code="tickets.estatus.label" default="Estatus" />
		
	</label>
	<g:textField name="estatus" value="${ticketsInstance?.estatus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketsInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="tickets.orden.label" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orden" name="orden.id" from="${servicios.Os.list()}" optionKey="id" required="" value="${ticketsInstance?.orden?.id}" class="many-to-one"/>
</div>

