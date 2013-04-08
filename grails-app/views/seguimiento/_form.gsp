<%@ page import="servicios.Seguimiento" %>


<table>
  <tr collspan="2"><li>Datos generales del proyecto</li></tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'asitio', 'error')} ">
    <label for="asitio">
		<g:message code="seguimiento.asitio.label" default="Sitio" />
		
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'bservicio', 'error')} ">
    <label for="bservicio">
		<g:message code="seguimiento.bservicio.label" default="Servicio" />
		
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'cso', 'error')} ">
    <label for="cso">
		<g:message code="seguimiento.cso.label" default="Cso" />
		
	</label>
    </td>
    
    
  </tr>
  
  
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'sitio', 'error')} ">
     <g:textField id="asitio" name="asitio"   required="" value="${seguimientoInstance?.asitio}" disabled="disabled" />
     <g:hiddenField id="sitio" name="asitio"   required="" value="${seguimientoInstance?.asitio}"  />
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'bservicio', 'error')} " >
    <g:textField id="bservicio" name="bservicio" value="${seguimientoInstance?.bservicio}" disabled="disabled"/>
    <g:hiddenField id="bservicio" name="bservicio" value="${seguimientoInstance?.bservicio}" />
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'cso', 'error')} ">
    <g:textField id="cso" name="cso" value="${seguimientoInstance?.cso}"disabled="disabled"/>
    <g:hiddenField id="cso" name="cso" value="${seguimientoInstance?.cso}"/>
    </td>
    
 
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'dcontratista', 'error')} required">
      <label for="dcontratista">
		<g:message code="seguimiento.dcontratista.label" default="Contratista" />
		
	</label>
    </td>
    <td></td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'epo', 'error')} ">
      <label for="epo">
		<g:message code="seguimiento.epo.label" default="Po" />
		
	</label>
    </td>
  </tr>
   <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'dcontratista', 'error')} required">
      <g:select id="dcontratista" name="dcontratista.id" from="${servicios.Provedores.list()}" optionKey="id" required="" value="${seguimientoInstance?.dcontratista?.id}" class="many-to-one"/>
    </td>
    <td></td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'epo', 'error')} ">
     <g:textField id="epo" name="epo" value="${seguimientoInstance?.epo}" disabled="disabled"/> 
     <g:hiddenField id="epo" name="epo" value="${seguimientoInstance?.epo}"/> 
    </td>
  </tr>
</table>

<table>
   <tr collspan="2"><li>Materiales Delibery e Insumos ALU</li></tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'fdeliberycompleto', 'error')} required">
      <label for="fdeliberycompleto">
		<g:message code="seguimiento.fdeliberycompleto.label" default="Delivery completo" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'gdeliberyincompleto', 'error')} required">
      <label for="gdeliberyincompleto">
		<g:message code="seguimiento.gdeliberyincompleto.label" default="Deliveryincompleto" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'hot', 'error')} required">
      <label for="hot">
		<g:message code="seguimiento.hot.label" default="Ot" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'isurvey', 'error')} required">
      <label for="isurvey">
		<g:message code="seguimiento.isurvey.label" default="Survey" />
		<span class="required-indicator">*</span>
	</label>
    </td>
  </tr>
  
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'dfeliberycompleto', 'error')} required">
      <g:select name="fdeliberycompleto" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.fdeliberycompleto}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'gdeliberyincompleto', 'error')} required">
      <g:select name="gdeliberyincompleto" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.gdeliberyincompleto}" noSelection="['':' ']"/>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'hot', 'error')} required">
       <g:select name="hot" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.hot}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'isurvey', 'error')} required">
      <g:select name="isurvey" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.isurvey}" noSelection="['':' ']"/>
    </td>
  </tr>
</table>



<table>
 <tr collspan="2"><li>Insumos Telmex</li></tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'jtierras', 'error')} required">
      <label for="jtierras">
		<g:message code="seguimiento.jtierras.label" default="Tierras" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'kcfe', 'error')} required">
      <label for="kcfe">
		<g:message code="seguimiento.kcfe.label" default="Cfe" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'lglt', 'error')} required">
      <label for="lglt">
		<g:message code="seguimiento.lglt.label" default="Glt" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'mfuerza', 'error')} required">
      <label for="mfuerza">
		<g:message code="seguimiento.mfuerza.label" default="Fuerza" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'oarnes', 'error')} required">
      <label for="oarnes">
		<g:message code="seguimiento.oarnes.label" default="Arnes" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'pdfo', 'error')} required">
      <label for="pdfo">
		<g:message code="seguimiento.pdfo.label" default="Dfo" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'qpasosCable', 'error')} required">
      <label for="qpasosCable">
		<g:message code="seguimiento.qpasosCable.label" default="Pasos Cable" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'rdg', 'error')} required">
      <label for="rdg">
		<g:message code="seguimiento.rdg.label" default="Dg" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'sbajadasFibra', 'error')} required">
      <label for="sbajadasFibra">
		<g:message code="seguimiento.sbajadasFibra.label" default="Bajadas Fibra" />
		<span class="required-indicator">*</span>
	</label>
    </td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'jtierras', 'error')} required">
      <g:select name="jtierras" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.jtierras}" noSelection="['':' ']"/>
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'kcfe', 'error')} required">
      <g:select name="kcfe" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.kcfe}" noSelection="['':' ']"/>

      
    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'lglt', 'error')} required">
      <g:select name="lglt" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.lglt}" noSelection="['':' ']"/>

    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'mfuerza', 'error')} required">
      <g:select name="mfuerza" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.mfuerza}" noSelection="['':' ']"/>

    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'oarnes', 'error')} required">
      <g:select name="oarnes" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.oarnes}" noSelection="['':' ']"/>

    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'pdfo', 'error')} required">
      <g:select name="pdfo" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.pdfo}" noSelection="['':' ']"/>

    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'qpasosCable', 'error')} required">
      	<g:select name="qpasosCable" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.qpasosCable}" noSelection="['':' ']"/>

    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'rdg', 'error')} required">
      	<g:select name="rdg" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.rdg}" noSelection="['':' ']"/>

    </td>
    
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'sbajadasFibra', 'error')} required">
      	<g:select name="sbajadasFibra" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.sbajadasFibra}" noSelection="['':' ']"/>

    </td>
  </tr>
</table>




<table>
   <tr collspan="2"><li>Estatus de Instalacion</li></tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'tfijacion', 'error')} required">
      <label for="tfijacion">
		<g:message code="seguimiento.tfijacion.label" default="Fijacion" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'uinterconexion', 'error')} required">
      <label for="uinterconexion">
		<g:message code="seguimiento.uinterconexion.label" default="Interconexion" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'vempalme', 'error')} required">
      <label for="vempalme">
		<g:message code="seguimiento.vempalme.label" default="Interconexion" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'wbdfo', 'error')} required">
      <label for="wbdfo">
		<g:message code="seguimiento.wbdfo.label" default="Bdfo" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'xenergizacion', 'error')} required">
      <label for="xenergizacion">
		<g:message code="seguimiento.xenergizacion.label" default="Energizacion" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'yaterrizaje', 'error')} required">
      <label for="yaterrizaje">
		<g:message code="seguimiento.yaterrizaje.label" default="Aterrizaje" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'ztimbrado', 'error')} required">
      <label for="ztimbrado">
		<g:message code="seguimiento.ztimbrado.label" default="Timbrado" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zaapotencia', 'error')} required">
      <label for="zaapotencia">
		<g:message code="seguimiento.zaapotencia.label" default="Potencia" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zbetiquetado', 'error')} required">
      <label for="zbetiquetado">
		<g:message code="seguimiento.zbetiquetado.label" default="Etiquetado" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zcrcdt', 'error')} required">
      <label for="rcdt">
		<g:message code="seguimiento.zcrcdt.label" default="Rcdt" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zdconfiguracion', 'error')} required">
      <label for="zdconfiguracion">
		<g:message code="seguimiento.zdconfiguracion.label" default="Configuracion" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zeactsw', 'error')} required">
      <label for="zeactsw">
		<g:message code="seguimiento.zeactsw.label" default="Act sw" />
		<span class="required-indicator">*</span>
	</label>
    </td>
  </tr>
  
   <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'tfijacion', 'error')} required">
      	<g:select name="tfijacion" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.tfijacion}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'uinterconexion', 'error')} required">
      	<g:select name="uinterconexion" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.uinterconexion}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'vemplame', 'error')} required">
      	<g:select name="vempalme" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.vempalme}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'wbdfo', 'error')} required">
      	<g:select name="wbdfo" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.wbdfo}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'xenergizacion', 'error')} required">
      	<g:select name="xenergizacion" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.xenergizacion}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'yaterrizaje', 'error')} required"> 
      	<g:select name="yaterrizaje" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.yaterrizaje}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'ztimbrado', 'error')} required">
      	<g:select name="ztimbrado" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.ztimbrado}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zaapotencia', 'error')} required">
      	<g:select name="zaapotencia" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zaapotencia}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zbetiquetado', 'error')} required">
      	<g:select name="zbetiquetado" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zbetiquetado}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zcrcdt', 'error')} required">
      	<g:select name="zcrcdt" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zcrcdt}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zdconfiguracion', 'error')} required">
      	<g:select name="zdconfiguracion" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zdconfiguracion}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zeactsw', 'error')} required">
      	<g:select name="zeactsw" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zeactsw}" noSelection="['':' ']"/>

    </td>
  </tr>
</table>

<table>
   <tr collspan="2"><li>Entrega</li></tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zlreprogramacion', 'error')} required">
      <label for="zlreprogramacion">
		<g:message code="seguimiento.zlreprogramacion.label" default="Reprogramacion" />
		<span class="required-indicator">*</span>
	</label>
    </td>
     <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zncns', 'error')} required">
	<label for="zncns">
		<g:message code="seguimiento.zncns.label" default="Cns" />
		<span class="required-indicator">*</span>
	</label>
    </td>
     <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zoreporteFotografico', 'error')} required">
	<label for="zoreporteFotografico">
		<g:message code="seguimiento.zoreporteFotografico.label" default="Reporte Fotografico" />
		<span class="required-indicator">*</span>
	</label>
    </td>
     <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zprotocolo', 'error')} required">
	<label for="zprotocolo">
		<g:message code="seguimiento.zprotocolo.label" default="Protocolo" />
		<span class="required-indicator">*</span>
	</label>
    </td>
  </tr>
   <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zlreprogramacion', 'error')} required">
      	<g:select name="zlreprogramacion" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zlreprogramacion}" noSelection="['':' ']"/>

    </td>
     <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zncns', 'error')} required">
       	<g:select name="zncns" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zncns}" noSelection="['':' ']"/>

    </td>
     <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zoreporteFotografico', 'error')} required">
       	<g:select name="zoreporteFotografico" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zoreporteFotografico}" noSelection="['':' ']"/>

    </td>
     <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zprotocolo', 'error')} required">
       	<g:select name="zprotocolo" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zprotocolo}" noSelection="['':' ']"/>

    </td>
  </tr>
</table>



<table>
   <tr collspan="2"><li>Equipamiento</li></tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zfpuertos', 'error')} ">
	<label for="zfpuertos">
		<g:message code="seguimiento.zfpuertos.label" default="Puertos" />
		
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zgcontroladora', 'error')} ">
	<label for="zgcontroladora">
		<g:message code="seguimiento.zgcontroladora.label" default="Controladora" />
		
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zhsfp', 'error')} ">
	<label for="zhsfp">
		<g:message code="seguimiento.zhsfp.label" default="Sfp" />
		
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zifo', 'error')} required">
	<label for="zifo">
		<g:message code="seguimiento.zifo.label" default="Fo" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zjbaterias', 'error')} required">
	<label for="zjbaterias">
		<g:message code="seguimiento.zjbaterias.label" default="Baterias" />
		<span class="required-indicator">*</span>
	</label>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zkgabinete', 'error')} ">
	<label for="zkgabinete">
		<g:message code="seguimiento.gabinete.label" default="Gabinete" />
		
	</label>
    </td>
  </tr>
  <tr>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zfpuertos', 'error')} ">
      <g:textField name="zfpuertos" value="${seguimientoInstance?.zfpuertos}"/>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zgcontroladora', 'error')} ">
         <g:select name="zgcontroladora" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zgcontroladora}" noSelection="['':' ']"/>
    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zhsfp', 'error')} ">
    <g:select name="zhsfp" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zhsfp}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zifo', 'error')} required">
      	<g:select name="zifo" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zifo}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zjbaterias', 'error')} required">
      	<g:select name="zjbaterias" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zjbaterias}" noSelection="['':' ']"/>

    </td>
    <td class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zkgabinete', 'error')} ">
    <g:select name="zkgabinete" from="${servicios.SeguimientoCat.list()}" optionKey="nombre"  required="" value="${seguimientoInstance?.zkgabinete}" noSelection="['':' ']"/>
    </td>
  </tr>
</table>

<div class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zzusuario', 'error')} required">
	
	<g:hiddenField id="zzusuario" name="zzusuario.id" from="${servicios.User.list()}" optionKey="id" required="" value="${seguimientoInstance?.zzusuario?.id}" class="many-to-one"/>
</div>
<div class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zzzorden', 'error')} required">
	
	<g:hiddenField id="zzzorden" name="zzzorden.id" from="${servicios.Orden.list()}" optionKey="id" required="" value="${seguimientoInstance?.zzzorden?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seguimientoInstance, field: 'zmcomentario', 'error')} required">
	
	<g:hiddenField id="zmcomentario" name="zmcomentario" from="${servicios.Observacion.list()}" optionKey="id" required="" value="${seguimientoInstance?.zmcomentario}" class="many-to-one"/>
</div>