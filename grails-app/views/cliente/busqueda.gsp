


<%@ page import="servicios.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
                 <g:javascript library="jquery" plugin="jquery"/>
                 <g:javascript plugin="prototype" library="scriptaculous"/>
                  <modalbox:modalIncludes />
                   
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'main_2.css')}" type="text/css">
                 <g:javascript library="application" /> 
                 
                 
		<title>Busqueda</title>
	</head>
	<body>
		<a href="#list-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Registrar Cliente</g:link></li>
                        <li><g:link class="list" action="list">Clientes Registrados</g:link></li>
                <li><g:link class="list" controller="os" >Ordenes de Servicio</g:link></li>
			</ul>
		</div>
                <div id="list-cliente" class="content scaffold-list" role="main">
			<h1>Busqueda de clientes y servicios</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
                        </g:if>
        <center>
		<table>
                      <tr>
                         <td >
                        <h3 >
      
                        <g:message code="orden.ticket.label" default="Nombre del Cliente:" />

                         </h3>
                        <g:remoteField name="cliente"  
                     action="busquedaCliente"
                     update="listado" paramName="nombre"
                    size="30px"
                     />
                       
                      </td>
                      
                      <td >
                        
                    
                        <g:formRemote name="ticket" update="listado"
              url="[controller: 'cliente', action: 'busquedaTicket',
                    paramName: 'ticket']">
  <h3 >Busqueda por Ticket: </h3> <input name="ticket" type="text" />
</g:formRemote>
                       
                      </td>
                      
                      </tr>
                      
                </table>
        </center>
                
                 <div id="listado">
                    
                          
                      </div>
                
                      
      
    
	</body>
</html>
