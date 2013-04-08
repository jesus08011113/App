<%@ page import="servicios.Conceptos" %>



<div class="fieldcontain ${hasErrors(bean: conceptosInstance, field: 'concepto', 'error')} ">
	<label for="concepto">
		<g:message code="conceptos.concepto.label" default="Concepto" />
		
	</label>
	<g:textField name="concepto" value="${conceptosInstance?.concepto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conceptosInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="conceptos.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" value="${fieldValue(bean: conceptosInstance, field: 'precio')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: conceptosInstance, field: 'ticket', 'error')} required">
	<label for="ticket">
		<g:message code="conceptos.ticket.label" default="Ticket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticket" name="ticket.id" from="${servicios.Tickets.list()}" optionKey="id" required="" value="${conceptosInstance?.ticket?.id}" class="many-to-one"/>
</div>

