
<%@ page import="servicios.Idc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'idc.label', default: 'Idc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-idc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                 <sec:ifLoggedIn>
                                	
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
			</ul>
		</div>
		<div id="show-idc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list idc">
			
				<g:if test="${idcInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="idc.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${idcInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.paterno}">
				<li class="fieldcontain">
					<span id="paterno-label" class="property-label"><g:message code="idc.paterno.label" default="Paterno" /></span>
					
						<span class="property-value" aria-labelledby="paterno-label"><g:fieldValue bean="${idcInstance}" field="paterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.materno}">
				<li class="fieldcontain">
					<span id="materno-label" class="property-label"><g:message code="idc.materno.label" default="Materno" /></span>
					
						<span class="property-value" aria-labelledby="materno-label"><g:fieldValue bean="${idcInstance}" field="materno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.direccion1}">
				<li class="fieldcontain">
					<span id="direccion1-label" class="property-label"><g:message code="idc.direccion1.label" default="Direccion1" /></span>
					
						<span class="property-value" aria-labelledby="direccion1-label"><g:fieldValue bean="${idcInstance}" field="direccion1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="idc.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${idcInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.celular}">
				<li class="fieldcontain">
					<span id="celular-label" class="property-label"><g:message code="idc.celular.label" default="Celular" /></span>
					
						<span class="property-value" aria-labelledby="celular-label"><g:fieldValue bean="${idcInstance}" field="celular"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="idc.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${idcInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="idc.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:fieldValue bean="${idcInstance}" field="estatus"/></span>
					
				</li>
				</g:if>
				<g:if test="${idcInstance?.tipo}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="idc.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${idcInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.curp}">
				<li class="fieldcontain">
					<span id="curp-label" class="property-label"><g:message code="idc.curp.label" default="Curp" /></span>
					
						<span class="property-value" aria-labelledby="curp-label"><g:fieldValue bean="${idcInstance}" field="curp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="idc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${idcInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.direccion2}">
				<li class="fieldcontain">
					<span id="direccion2-label" class="property-label"><g:message code="idc.direccion2.label" default="Direccion2" /></span>
					
						<span class="property-value" aria-labelledby="direccion2-label"><g:fieldValue bean="${idcInstance}" field="direccion2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="idc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${idcInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.nss}">
				<li class="fieldcontain">
					<span id="nss-label" class="property-label"><g:message code="idc.nss.label" default="Nss" /></span>
					
						<span class="property-value" aria-labelledby="nss-label"><g:fieldValue bean="${idcInstance}" field="nss"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.provedor}">
				<li class="fieldcontain">
					<span id="provedor-label" class="property-label"><g:message code="idc.provedor.label" default="Provedor" /></span>
					
						<span class="property-value" aria-labelledby="provedor-label"><g:link controller="provedores" action="show" id="${idcInstance?.provedor?.id}">${idcInstance?.provedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.puesto}">
				<li class="fieldcontain">
					<span id="puesto-label" class="property-label"><g:message code="idc.puesto.label" default="Puesto" /></span>
					
						<span class="property-value" aria-labelledby="puesto-label"><g:fieldValue bean="${idcInstance}" field="puesto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.rfc}">
				<li class="fieldcontain">
					<span id="rfc-label" class="property-label"><g:message code="idc.rfc.label" default="Rfc" /></span>
					
						<span class="property-value" aria-labelledby="rfc-label"><g:fieldValue bean="${idcInstance}" field="rfc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${idcInstance?.telefono2}">
				<li class="fieldcontain">
					<span id="telefono2-label" class="property-label"><g:message code="idc.telefono2.label" default="Telefono2" /></span>
					
						<span class="property-value" aria-labelledby="telefono2-label"><g:fieldValue bean="${idcInstance}" field="telefono2"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${idcInstance?.id}" />
					<g:link class="edit" action="edit" id="${idcInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
