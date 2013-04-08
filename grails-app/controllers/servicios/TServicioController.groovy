package servicios

import org.springframework.dao.DataIntegrityViolationException

class TServicioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 40, 100)
        [TServicioInstanceList: TServicio.list(params), TServicioInstanceTotal: TServicio.count()]
    }

    def create() {
        [TServicioInstance: new TServicio(params)]
    }

    def save() {
        def TServicioInstance = new TServicio(params)
        if (!TServicioInstance.save(flush: true)) {
            render(view: "create", model: [TServicioInstance: TServicioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'TServicio.label', default: 'TServicio'), TServicioInstance.id])
        redirect(action: "show", id: TServicioInstance.id)
    }

    def show(Long id) {
        def TServicioInstance = TServicio.get(id)
        if (!TServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TServicio.label', default: 'TServicio'), id])
            redirect(action: "list")
            return
        }

        [TServicioInstance: TServicioInstance]
    }

    def edit(Long id) {
        def TServicioInstance = TServicio.get(id)
        if (!TServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TServicio.label', default: 'TServicio'), id])
            redirect(action: "list")
            return
        }

        [TServicioInstance: TServicioInstance]
    }

    def update(Long id, Long version) {
        def TServicioInstance = TServicio.get(id)
        if (!TServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TServicio.label', default: 'TServicio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (TServicioInstance.version > version) {
                TServicioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'TServicio.label', default: 'TServicio')] as Object[],
                          "Another user has updated this TServicio while you were editing")
                render(view: "edit", model: [TServicioInstance: TServicioInstance])
                return
            }
        }

        TServicioInstance.properties = params

        if (!TServicioInstance.save(flush: true)) {
            render(view: "edit", model: [TServicioInstance: TServicioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'TServicio.label', default: 'TServicio'), TServicioInstance.id])
        redirect(action: "show", id: TServicioInstance.id)
    }

    def delete(Long id) {
        def TServicioInstance = TServicio.get(id)
        if (!TServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TServicio.label', default: 'TServicio'), id])
            redirect(action: "list")
            return
        }

        try {
            TServicioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'TServicio.label', default: 'TServicio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'TServicio.label', default: 'TServicio'), id])
            redirect(action: "show", id: id)
        }
    }
    
      def scaffold = true

    def getServicios = {
     //se obtiene proyecto
     def proyectoInstance = Proyecto.findById(params.id) 
        //Se la lista de servicios
      
     def serviciosList = proyectoInstance ? ProyectoServicio.findAllByProyecto(proyectoInstance) : []
     def centralesList = proyectoInstance ? ProyectoCentral.findAllByProyecto(proyectoInstance) : []
      
       //Se hace el render del template '_selectSitios.gsp' con la lista de sitios obtenida.
        render(template: "selectServicio", model: [serviciosList:serviciosList])
        render(template: "selectCentral", model: [centralesList:centralesList])
         }
         
     def buscaServicio = {
   
    def bs =  params.servicio// obtiene el parametro en bruto de la relacion proyecto central (nombre de la central y lo manda a una variable reconocible para el query)
    def servicioIns = TServicio.findByNombre(bs) // Busca la central por nombre dentro de centrales 
  
  //outputs en consola que hice para seguir el rastro 
    
      System.out.println("objeto inicial " + bs)   
     System.out.println("objeto fquery ins " + servicioIns)   
      System.out.println("objeto fqueryid " + servicioIns.id)   
   
       render(template: "hidenServicio", model: [servicioIns:servicioIns]) // renderisa mi tamplate hiddencentral y le manda mi query
        
    }
}
