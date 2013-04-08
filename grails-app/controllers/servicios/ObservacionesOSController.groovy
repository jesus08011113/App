package servicios

import org.springframework.dao.DataIntegrityViolationException

class ObservacionesOSController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    
     def launchLightbox (Long id) { 
        System.out.println("id :" + id)
        def orden = Os.get(id)
      
       
      def observacionesOSInstance = new ObservacionesOS(params) 
      observacionesOSInstance.orden = orden
      
       def tipoLista = TipoObservacion.executeQuery(" from TipoObservacion t " +
                     "where t.tipo = 'Orden Servicio'")
    
          
        render(template: "form", model:  [observacionesOSInstance: observacionesOSInstance, tipoLista : tipoLista]) 
  
  
}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [observacionesOSInstanceList: ObservacionesOS.list(params), observacionesOSInstanceTotal: ObservacionesOS.count()]
    }

    def create() {
        def tipoLista = TipoObservacion.executeQuery(" from TipoObservacion t " +
                     "where t.tipo = 'Orden Servicio'")
        [observacionesOSInstance: new ObservacionesOS(params), tipoLista : tipoLista]
    }

    def save() {
        def observacionesOSInstance = new ObservacionesOS(params)
        if (!observacionesOSInstance.save(flush: true)) {
            render(view: "create", model: [observacionesOSInstance: observacionesOSInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'observacionesOS.label', default: 'ObservacionesOS'), observacionesOSInstance.id])
        //redirect(action: "show", id: observacionesOSInstance.id)
                redirect(controller:"os", action: "show", id:observacionesOSInstance.orden.id)
    }

    def show(Long id) {
        def observacionesOSInstance = ObservacionesOS.get(id)
        if (!observacionesOSInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacionesOS.label', default: 'ObservacionesOS'), id])
            redirect(action: "list")
            return
        }

        [observacionesOSInstance: observacionesOSInstance]
    }

    def edit(Long id) {
        def observacionesOSInstance = ObservacionesOS.get(id)
        if (!observacionesOSInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacionesOS.label', default: 'ObservacionesOS'), id])
            redirect(action: "list")
            return
        }
               def tipoLista = TipoObservacion.executeQuery(" from TipoObservacion t " +
                     "where t.tipo = 'Orden Servicio'")

        [observacionesOSInstance: observacionesOSInstance, tipoLista : tipoLista]
    }

    def update(Long id, Long version) {
        def observacionesOSInstance = ObservacionesOS.get(id)
        if (!observacionesOSInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacionesOS.label', default: 'ObservacionesOS'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (observacionesOSInstance.version > version) {
                observacionesOSInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'observacionesOS.label', default: 'ObservacionesOS')] as Object[],
                          "Another user has updated this ObservacionesOS while you were editing")
                render(view: "edit", model: [observacionesOSInstance: observacionesOSInstance])
                return
            }
        }

        observacionesOSInstance.properties = params

        if (!observacionesOSInstance.save(flush: true)) {
            render(view: "edit", model: [observacionesOSInstance: observacionesOSInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'observacionesOS.label', default: 'ObservacionesOS'), observacionesOSInstance.id])
        redirect(action: "show", id: observacionesOSInstance.id)
    }

    def delete(Long id) {
        def observacionesOSInstance = ObservacionesOS.get(id)
        if (!observacionesOSInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacionesOS.label', default: 'ObservacionesOS'), id])
            redirect(action: "list")
            return
        }

        try {
            observacionesOSInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'observacionesOS.label', default: 'ObservacionesOS'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'observacionesOS.label', default: 'ObservacionesOS'), id])
            redirect(action: "show", id: id)
        }
    }
}
