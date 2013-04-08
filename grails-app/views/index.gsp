<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Solución Empresarial</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
         
	<body>
           <div class="nav" role="navigation" align="center">
			
             <ul >
			<sec:ifLoggedIn>
           
                          <li><g:link controller="logout">Cerrar Sesión </g:link></li><li><sec:username /></li> 
        </sec:ifLoggedIn>
             <sec:ifNotLoggedIn>
               <li><g:link  controller='user' href="/Servicos/user/create" action='create'>Crear Cuenta </g:link> </li>
          
                  
             <li> <g:link  controller='login' href="/Servicos/login/index" action='auth'>Iniciar Sesión</g:link></li> 
      
             </sec:ifNotLoggedIn>
               
              
			</ul>
		</div>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
                   
                               <h1>Ordenes </h1>
			<ul>
                           <li><a href="/Servicios/orden/create" class="list">Nueva Orden</a></li>
                           
                           
                           
                          <li><a href="/Servicios/orden/list" class="list">Listado de Ordenes</a></li>
                          <li><a href="/Servicios/observacion/list" class="list">Listado de Observaciónes</a></li>
                          <li><a href="/Servicios/seguimiento/list" class="list">Listado de Check List</a></li>
                          <li><a href="/Servicios/cliente/busqueda" >Ordenes de Servicio</a></li>
                          <li><a href="/Servicios/searchable" >Buscar</a></li>
                          
                               
                              
			</ul>
			<h1>Gestión  de Usuarios</h1>
			<ul>
                          <li><g:link  controller='user' href="/Servicios/user/create" action='create'>Crear Cuenta </g:link> </li>
                        <sec:ifNotLoggedIn>   <li> <g:link  controller='login' href="/Servicios/login/index" action='auth'>Iniciar Sesión</g:link></li> </sec:ifNotLoggedIn> 
                        <li><a href="/Servicios/user/index">Usuarios </a></li>
                        <li><a href="/Servicios/userRole/index">Rol de Usuarios</a></li>
                      
                      
				
			</ul>
                        
                        <h1>Catalogos</h1>
			<ul>
                         
                        <li><a href="/Servicios/status/index">Status</a></li>
                        <li><a href="/Servicios/TServicio/index">Tipo de servicios</a></li>
                        <li><a href="/Servicios/proyectoServicio/index">Servicios por Proyecto</a></li>
                        <li><a href="/Servicios/proyecto/index">Proyectos</a></li>
                        <li><a href="/Servicios/proyectoCentral/index">Centrales por Proyecto</a></li>
                        <li><a href="/Servicios/UsuarioProyecto/index">Proyectos por Usuario</a></li>
                        <li><a href="/Servicios/central/index">Centrales y Zonas</a></li>
                        <li><a href="/Servicios/sitio/index">Sitios</a></li>
                        <li><a href="/Servicios/idc/index">Ingenieros</a></li>
                        <li><a href="/Servicios/provedores/index">Provedores</a></li>
                     
                      
				
			</ul>
			
		</div>
		<div id="page-body" role="main">
                  <center><h1>Solución Empresarial</h1>
                  <center><h2>Nuestra Misión</h2></center>
			<p>
                          Establecer relaciones a largo plazo con nuestros clientes facilitándoles el logro de sus objetivos a través de servicios de integración, innovación y transformación de sistemas de tecnología de la información y comunicación. 

                        </p>
                        
              
                  <h2>Nuestra Visión</h2>
			<p>
                         Ser líder en ofrecer soluciones de outsourcing que generen amplio valor a nuestros clientes y los ayuden a ser mas competitivos.

                        </p>       
</center> 
    
			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
                                        
				</ul>
			</div>--%>
		</div>
	</body>
</html>
