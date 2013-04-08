package servicios

import org.springframework.dao.DataIntegrityViolationException

class OsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def launchLightbox (Long id) { 
        System.out.println("id :" + id)
        def cliente = Cliente.get(id)
        def tamaño = Os.list().size()
        def noticket = tamaño + 1
        def statusLista = Status.executeQuery(" from Status s " +
                     "where s.tipo = 'Orden Servicio'")
       /* def status = Status.executeQuery(" from Status s " +
                     "where s.nombre = 'Nueva Admicion'")*/
        def ingenierosLista = Idc.executeQuery(" from Idc i " +
                     "where i.tipo = 'IDS'")
                     def status = Status.get(7)
       
      def osInstance = new Os() 
       osInstance.cliente = cliente
       osInstance.status = status
       osInstance.ticket = noticket
          
        render(template: "modalform", model:  [osInstance: osInstance, statusLista : statusLista, ingenierosLista:ingenierosLista ]) 
  
  
}
    
    
 
    
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [osInstanceList: Os.list(params), osInstanceTotal: Os.count()]
    }

    def create( Long id) {
          def cliente = Cliente.get(id)
        def tamaño = Os.list().size()
        def noticket = tamaño + 1
        def statusLista = Status.executeQuery(" from Status s " +
                     "where s.tipo = 'Orden Servicio'")
         def ingenierosLista = Idc.executeQuery(" from Idc i " +
                     "where i.tipo = 'IDS'")
        def status = Status.get(7)
         def osInstance = new Os()
         osInstance.ticket = noticket
         osInstance.cliente = cliente
         osInstance.status = status
        [osInstance: osInstance, statusLista:statusLista, ingenierosLista :ingenierosLista ]
    }

    def save() {
        def osInstance = new Os(params)
        if (!osInstance.save(flush: true)) {
            render(view: "create", model: [osInstance: osInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'os.label', default: 'Os'), osInstance.id])
        redirect(action: "show", id: osInstance.id)
    }

    def show(Long id) {
        def osInstance = Os.get(id)
        def cliente = osInstance.cliente
         System.out.println("icliente " + osInstance.cliente.id)
         def clienteDatos = Cliente.get(osInstance.cliente.id)
         System.out.println("cliente datos " + clienteDatos )
         
        
         
        if (!osInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'os.label', default: 'Os'), id])
            redirect(action: "list")
            return
        }
  
     System.out.println("acciones precio " + osInstance.acciones.precio )   
     System.out.println("acciones precio total " + osInstance.acciones.precio.sum() ) 
     
      
        [osInstance: osInstance, clienteDatos:clienteDatos]
    }
    

    def edit(Long id) {
        def osInstance = Os.get(id)
          def statusLista = Status.executeQuery(" from Status s " +
                     "where s.tipo = 'Orden Servicio'")
        if (!osInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'os.label', default: 'Os'), id])
            redirect(action: "list")
            return
        }
         def ingenierosLista = Idc.executeQuery(" from Idc i " +
                     "where i.tipo = 'IDS'")

        [osInstance: osInstance, statusLista:statusLista, ingenierosLista:ingenierosLista ]
    }
    def accion(Long id) {
        def osInstance = Os.get(id)
          def statusLista = Status.executeQuery(" from Status s " +
                     "where s.tipo = 'Orden Servicio'")
        if (!osInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'os.label', default: 'Os'), id])
            redirect(action: "list")
            return
        }
   render(template: "acciones", model:  [osInstance: osInstance ]) 
        
    }

    def update(Long id, Long version) {
        def osInstance = Os.get(id)
        if (!osInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'os.label', default: 'Os'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (osInstance.version > version) {
                osInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'os.label', default: 'Os')] as Object[],
                          "Another user has updated this Os while you were editing")
                render(view: "edit", model: [osInstance: osInstance])
                return
            }
        }

        osInstance.properties = params

        if (!osInstance.save(flush: true)) {
            render(view: "edit", model: [osInstance: osInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'os.label', default: 'Os'), osInstance.id])
        redirect(action: "show", id: osInstance.id)
    }

    def delete(Long id) {
        def osInstance = Os.get(id)
        if (!osInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'os.label', default: 'Os'), id])
            redirect(action: "list")
            return
        }

        try {
            osInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'os.label', default: 'Os'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'os.label', default: 'Os'), id])
            redirect(action: "show", id: id)
        }
    }
}
