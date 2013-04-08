
<%@ page import="servicios.Seguimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seguimiento.label', default: 'Seguimiento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-seguimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-seguimiento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list seguimiento">
			
				<g:if test="${seguimientoInstance?.asitio}">
				<li class="fieldcontain">
					<span id="asitio-label" class="property-label"><g:message code="seguimiento.asitio.label" default="Asitio" /></span>
					
						<span class="property-value" aria-labelledby="asitio-label"><g:fieldValue bean="${seguimientoInstance}" field="asitio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.bservicio}">
				<li class="fieldcontain">
					<span id="bservicio-label" class="property-label"><g:message code="seguimiento.bservicio.label" default="Bservicio" /></span>
					
						<span class="property-value" aria-labelledby="bservicio-label"><g:fieldValue bean="${seguimientoInstance}" field="bservicio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.cso}">
				<li class="fieldcontain">
					<span id="cso-label" class="property-label"><g:message code="seguimiento.cso.label" default="Cso" /></span>
					
						<span class="property-value" aria-labelledby="cso-label"><g:fieldValue bean="${seguimientoInstance}" field="cso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.dcontratista}">
				<li class="fieldcontain">
					<span id="dcontratista-label" class="property-label"><g:message code="seguimiento.dcontratista.label" default="Dcontratista" /></span>
					
						<span class="property-value" aria-labelledby="dcontratista-label"><g:link controller="provedores" action="show" id="${seguimientoInstance?.dcontratista?.id}">${seguimientoInstance?.dcontratista?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.epo}">
				<li class="fieldcontain">
					<span id="epo-label" class="property-label"><g:message code="seguimiento.epo.label" default="Epo" /></span>
					
						<span class="property-value" aria-labelledby="epo-label"><g:fieldValue bean="${seguimientoInstance}" field="epo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.fdeliberycompleto}">
				<li class="fieldcontain">
					<span id="fdeliberycompleto-label" class="property-label"><g:message code="seguimiento.fdeliberycompleto.label" default="Fdeliberycompleto" /></span>
					
						<span class="property-value" aria-labelledby="fdeliberycompleto-label"><g:fieldValue bean="${seguimientoInstance}" field="fdeliberycompleto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.gdeliberyincompleto}">
				<li class="fieldcontain">
					<span id="gdeliberyincompleto-label" class="property-label"><g:message code="seguimiento.gdeliberyincompleto.label" default="Gdeliberyincompleto" /></span>
					
						<span class="property-value" aria-labelledby="gdeliberyincompleto-label"><g:fieldValue bean="${seguimientoInstance}" field="gdeliberyincompleto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.hot}">
				<li class="fieldcontain">
					<span id="hot-label" class="property-label"><g:message code="seguimiento.hot.label" default="Hot" /></span>
					
						<span class="property-value" aria-labelledby="hot-label"><g:fieldValue bean="${seguimientoInstance}" field="hot"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.isurvey}">
				<li class="fieldcontain">
					<span id="isurvey-label" class="property-label"><g:message code="seguimiento.isurvey.label" default="Isurvey" /></span>
					
						<span class="property-value" aria-labelledby="isurvey-label"><g:fieldValue bean="${seguimientoInstance}" field="isurvey"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.jtierras}">
				<li class="fieldcontain">
					<span id="jtierras-label" class="property-label"><g:message code="seguimiento.jtierras.label" default="Jtierras" /></span>
					
						<span class="property-value" aria-labelledby="jtierras-label"><g:fieldValue bean="${seguimientoInstance}" field="jtierras"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.kcfe}">
				<li class="fieldcontain">
					<span id="kcfe-label" class="property-label"><g:message code="seguimiento.kcfe.label" default="Kcfe" /></span>
					
						<span class="property-value" aria-labelledby="kcfe-label"><g:fieldValue bean="${seguimientoInstance}" field="kcfe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.lglt}">
				<li class="fieldcontain">
					<span id="lglt-label" class="property-label"><g:message code="seguimiento.lglt.label" default="Lglt" /></span>
					
						<span class="property-value" aria-labelledby="lglt-label"><g:fieldValue bean="${seguimientoInstance}" field="lglt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.mfuerza}">
				<li class="fieldcontain">
					<span id="mfuerza-label" class="property-label"><g:message code="seguimiento.mfuerza.label" default="Mfuerza" /></span>
					
						<span class="property-value" aria-labelledby="mfuerza-label"><g:fieldValue bean="${seguimientoInstance}" field="mfuerza"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.oarnes}">
				<li class="fieldcontain">
					<span id="oarnes-label" class="property-label"><g:message code="seguimiento.oarnes.label" default="Oarnes" /></span>
					
						<span class="property-value" aria-labelledby="oarnes-label"><g:fieldValue bean="${seguimientoInstance}" field="oarnes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.pdfo}">
				<li class="fieldcontain">
					<span id="pdfo-label" class="property-label"><g:message code="seguimiento.pdfo.label" default="Pdfo" /></span>
					
						<span class="property-value" aria-labelledby="pdfo-label"><g:fieldValue bean="${seguimientoInstance}" field="pdfo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.qpasosCable}">
				<li class="fieldcontain">
					<span id="qpasosCable-label" class="property-label"><g:message code="seguimiento.qpasosCable.label" default="Qpasos Cable" /></span>
					
						<span class="property-value" aria-labelledby="qpasosCable-label"><g:fieldValue bean="${seguimientoInstance}" field="qpasosCable"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.rdg}">
				<li class="fieldcontain">
					<span id="rdg-label" class="property-label"><g:message code="seguimiento.rdg.label" default="Rdg" /></span>
					
						<span class="property-value" aria-labelledby="rdg-label"><g:fieldValue bean="${seguimientoInstance}" field="rdg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.sbajadasFibra}">
				<li class="fieldcontain">
					<span id="sbajadasFibra-label" class="property-label"><g:message code="seguimiento.sbajadasFibra.label" default="Sbajadas Fibra" /></span>
					
						<span class="property-value" aria-labelledby="sbajadasFibra-label"><g:fieldValue bean="${seguimientoInstance}" field="sbajadasFibra"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.tfijacion}">
				<li class="fieldcontain">
					<span id="tfijacion-label" class="property-label"><g:message code="seguimiento.tfijacion.label" default="Tfijacion" /></span>
					
						<span class="property-value" aria-labelledby="tfijacion-label"><g:fieldValue bean="${seguimientoInstance}" field="tfijacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.uinterconexion}">
				<li class="fieldcontain">
					<span id="uinterconexion-label" class="property-label"><g:message code="seguimiento.uinterconexion.label" default="Uinterconexion" /></span>
					
						<span class="property-value" aria-labelledby="uinterconexion-label"><g:fieldValue bean="${seguimientoInstance}" field="uinterconexion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.vempalme}">
				<li class="fieldcontain">
					<span id="vempalme-label" class="property-label"><g:message code="seguimiento.vempalme.label" default="Vempalme" /></span>
					
						<span class="property-value" aria-labelledby="vempalme-label"><g:fieldValue bean="${seguimientoInstance}" field="vempalme"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.wbdfo}">
				<li class="fieldcontain">
					<span id="wbdfo-label" class="property-label"><g:message code="seguimiento.wbdfo.label" default="Wbdfo" /></span>
					
						<span class="property-value" aria-labelledby="wbdfo-label"><g:fieldValue bean="${seguimientoInstance}" field="wbdfo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.xenergizacion}">
				<li class="fieldcontain">
					<span id="xenergizacion-label" class="property-label"><g:message code="seguimiento.xenergizacion.label" default="Xenergizacion" /></span>
					
						<span class="property-value" aria-labelledby="xenergizacion-label"><g:fieldValue bean="${seguimientoInstance}" field="xenergizacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.yaterrizaje}">
				<li class="fieldcontain">
					<span id="yaterrizaje-label" class="property-label"><g:message code="seguimiento.yaterrizaje.label" default="Yaterrizaje" /></span>
					
						<span class="property-value" aria-labelledby="yaterrizaje-label"><g:fieldValue bean="${seguimientoInstance}" field="yaterrizaje"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.ztimbrado}">
				<li class="fieldcontain">
					<span id="ztimbrado-label" class="property-label"><g:message code="seguimiento.ztimbrado.label" default="Ztimbrado" /></span>
					
						<span class="property-value" aria-labelledby="ztimbrado-label"><g:fieldValue bean="${seguimientoInstance}" field="ztimbrado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zaapotencia}">
				<li class="fieldcontain">
					<span id="zaapotencia-label" class="property-label"><g:message code="seguimiento.zaapotencia.label" default="Zaapotencia" /></span>
					
						<span class="property-value" aria-labelledby="zaapotencia-label"><g:fieldValue bean="${seguimientoInstance}" field="zaapotencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zbetiquetado}">
				<li class="fieldcontain">
					<span id="zbetiquetado-label" class="property-label"><g:message code="seguimiento.zbetiquetado.label" default="Zbetiquetado" /></span>
					
						<span class="property-value" aria-labelledby="zbetiquetado-label"><g:fieldValue bean="${seguimientoInstance}" field="zbetiquetado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zcrcdt}">
				<li class="fieldcontain">
					<span id="zcrcdt-label" class="property-label"><g:message code="seguimiento.zcrcdt.label" default="Zcrcdt" /></span>
					
						<span class="property-value" aria-labelledby="zcrcdt-label"><g:fieldValue bean="${seguimientoInstance}" field="zcrcdt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zdconfiguracion}">
				<li class="fieldcontain">
					<span id="zdconfiguracion-label" class="property-label"><g:message code="seguimiento.zdconfiguracion.label" default="Zdconfiguracion" /></span>
					
						<span class="property-value" aria-labelledby="zdconfiguracion-label"><g:fieldValue bean="${seguimientoInstance}" field="zdconfiguracion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zeactsw}">
				<li class="fieldcontain">
					<span id="zeactsw-label" class="property-label"><g:message code="seguimiento.zeactsw.label" default="Zeactsw" /></span>
					
						<span class="property-value" aria-labelledby="zeactsw-label"><g:fieldValue bean="${seguimientoInstance}" field="zeactsw"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zfpuertos}">
				<li class="fieldcontain">
					<span id="zfpuertos-label" class="property-label"><g:message code="seguimiento.zfpuertos.label" default="Zfpuertos" /></span>
					
						<span class="property-value" aria-labelledby="zfpuertos-label"><g:fieldValue bean="${seguimientoInstance}" field="zfpuertos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zgcontroladora}">
				<li class="fieldcontain">
					<span id="zgcontroladora-label" class="property-label"><g:message code="seguimiento.zgcontroladora.label" default="Zgcontroladora" /></span>
					
						<span class="property-value" aria-labelledby="zgcontroladora-label"><g:fieldValue bean="${seguimientoInstance}" field="zgcontroladora"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zhsfp}">
				<li class="fieldcontain">
					<span id="zhsfp-label" class="property-label"><g:message code="seguimiento.zhsfp.label" default="Zhsfp" /></span>
					
						<span class="property-value" aria-labelledby="zhsfp-label"><g:fieldValue bean="${seguimientoInstance}" field="zhsfp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zifo}">
				<li class="fieldcontain">
					<span id="zifo-label" class="property-label"><g:message code="seguimiento.zifo.label" default="Zifo" /></span>
					
						<span class="property-value" aria-labelledby="zifo-label"><g:fieldValue bean="${seguimientoInstance}" field="zifo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zjbaterias}">
				<li class="fieldcontain">
					<span id="zjbaterias-label" class="property-label"><g:message code="seguimiento.zjbaterias.label" default="Zjbaterias" /></span>
					
						<span class="property-value" aria-labelledby="zjbaterias-label"><g:fieldValue bean="${seguimientoInstance}" field="zjbaterias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zkgabinete}">
				<li class="fieldcontain">
					<span id="zkgabinete-label" class="property-label"><g:message code="seguimiento.zkgabinete.label" default="Zkgabinete" /></span>
					
						<span class="property-value" aria-labelledby="zkgabinete-label"><g:fieldValue bean="${seguimientoInstance}" field="zkgabinete"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zlreprogramacion}">
				<li class="fieldcontain">
					<span id="zlreprogramacion-label" class="property-label"><g:message code="seguimiento.zlreprogramacion.label" default="Zlreprogramacion" /></span>
					
						<span class="property-value" aria-labelledby="zlreprogramacion-label"><g:fieldValue bean="${seguimientoInstance}" field="zlreprogramacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zncns}">
				<li class="fieldcontain">
					<span id="zncns-label" class="property-label"><g:message code="seguimiento.zncns.label" default="Zncns" /></span>
					
						<span class="property-value" aria-labelledby="zncns-label"><g:fieldValue bean="${seguimientoInstance}" field="zncns"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zoreporteFotografico}">
				<li class="fieldcontain">
					<span id="zoreporteFotografico-label" class="property-label"><g:message code="seguimiento.zoreporteFotografico.label" default="Zoreporte Fotografico" /></span>
					
						<span class="property-value" aria-labelledby="zoreporteFotografico-label"><g:fieldValue bean="${seguimientoInstance}" field="zoreporteFotografico"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zprotocolo}">
				<li class="fieldcontain">
					<span id="zprotocolo-label" class="property-label"><g:message code="seguimiento.zprotocolo.label" default="Zprotocolo" /></span>
					
						<span class="property-value" aria-labelledby="zprotocolo-label"><g:fieldValue bean="${seguimientoInstance}" field="zprotocolo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zmcomentario}">
				<li class="fieldcontain">
					<span id="zmcomentario-label" class="property-label"><g:message code="seguimiento.zmcomentario.label" default="Zmcomentario" /></span>
					
						<span class="property-value" aria-labelledby="zmcomentario-label"><g:fieldValue bean="${seguimientoInstance}" field="zmcomentario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="seguimiento.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${seguimientoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="seguimiento.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${seguimientoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zzusuario}">
				<li class="fieldcontain">
					<span id="zzusuario-label" class="property-label"><g:message code="seguimiento.zzusuario.label" default="Zzusuario" /></span>
					
						<span class="property-value" aria-labelledby="zzusuario-label"><g:link controller="user" action="show" id="${seguimientoInstance?.zzusuario?.id}">${seguimientoInstance?.zzusuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${seguimientoInstance?.zzzorden}">
				<li class="fieldcontain">
					<span id="zzzorden-label" class="property-label"><g:message code="seguimiento.zzzorden.label" default="Zzzorden" /></span>
					
						<span class="property-value" aria-labelledby="zzzorden-label"><g:link controller="orden" action="show" id="${seguimientoInstance?.zzzorden?.id}">${seguimientoInstance?.zzzorden?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${seguimientoInstance?.id}" />
					<g:link class="edit" action="edit" id="${seguimientoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
