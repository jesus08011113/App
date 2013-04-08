
<%@ page import="servicios.Os" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'os.label', default: 'Os')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                  <g:javascript library="jquery" plugin="jquery"/>
                 <g:javascript plugin="prototype" library="scriptaculous"/>
                   <g:javascript library="application" /> 
                  <modalbox:modalIncludes />
	</head>
	<body>
		<a href="#show-os" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">Lista de servicios</g:link></li>
				<li><g:link class="create" action="busqueda" controller="cliente">Busqueda y alta</g:link></li>
			</ul>
		</div>
		<div id="show-os" class="content scaffold-show" role="main">
			<h1>Tecnología y Calidad</h1>
			<fieldset class="form">
					<g:render template="orden"/>
				</fieldset>
                  
              
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${osInstance?.id}" />
					<g:link class="edit" action="edit" id="${osInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                        <modalbox:createLink controller="os" action="accion" width="1000" linkname="Agregar Acciones" title="Acciones tomadas " id="${osInstance?.id}" />
                                        <modalbox:createLink controller="acciones" action="launchLightbox" width="1000" linkname="Agregar Anticipo" title="Anticipo" id="${osInstance?.id}" params="[osInstance : osInstance.id]" />
                                        <modalbox:createLink controller="observacionesOS" action="launchLightbox" width="900" linkname="Agregar Observación" title="Observación" id="${osInstance?.id}" params="[osInstance : osInstance.id]"/>
                                     
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
