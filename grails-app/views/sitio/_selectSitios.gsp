<%--<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'sitio', 'error')} required">
    <label for="sitio">
        <g:message code="orden.sitio.label" default="Sitio"/>
      <span class="required-indicator">*</span> 
    </label>
    <g:if test="${sitiosList}">
        <g:select id="sitio" name="sitio.id" from="${sitiosList}" optionKey="id" required="" noSelection="['':' ']"
                  value="${ordenInstance?.sitio?.id}" class="many-to-one"/>
    </g:if>
    <g:else>
        No existen sitios para esta central
    </g:else>
</div>--%>

 <label for="sitio">
        <g:message code="orden.sitio.label" default="Sitio"/>
      <span class="required-indicator">*</span> 
    </label>
    <g:if test="${sitiosList}">
        <g:select id="sitio" name="sitio.id" from="${sitiosList}" optionKey="id" required="" noSelection="['':' ']"
                  value="${ordenInstance?.sitio?.id}" class="many-to-one"/>
    </g:if>
    <g:else>
        No existen sitios para esta central
    </g:else>