package servicios

import org.springframework.dao.DataIntegrityViolationException

class ClienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    def busqueda(){}
    
    
    
    def busquedaCliente() {
        
       def clienteInstanceList = Cliente.findAllByNombreLike('%' + params.nombre + '%' ,[max: 10, sort: "nombre", order: "asc",])
       def clienteInstanceTotal = Cliente.findAllByNombreLike('%' + params.nombre + '%',[max: 10, sort: "nombre", order: "asc", offset: 100] ).size()
   
        
        
        
        
        if (clienteInstanceList){
            
         
            
           
            render(template: "lista", model: [clienteInstanceList:clienteInstanceList, clienteInstanceTotal:clienteInstanceTotal])
           // render "Si existe"
        }
        else {
            
            // render(template: "noencontrado")
             render(template: "formulario", model: [clienteInstance: new Cliente(params)])
        }
    }
    def busquedaTicket() {
        
     
       def osInstance = Os.findByTicket(params.ticket)
       
       
       
   
       //def osInstanceTotal = Os.findAllByTicketLike('%' + params.ticket + '%',[max: 5, sort: "ticket", order: "asc", offset: 100] ).size()
       
     System.out.println("busqueda " + osInstance) 
        if (osInstance){
             def cliente = osInstance.cliente
         System.out.println("icliente " + osInstance.cliente.id)
         def clienteDatos = Cliente.get(osInstance.cliente.id)
         System.out.println("cliente datos " + clienteDatos )
            
           // render(template: "Ticket", model: [osInstance:osInstance])
            render(template: "/os/orden", model: [osInstance:osInstance, clienteDatos:clienteDatos])
           // render "Si existe"
        }
        else {
             render(template: "ordennoencontrado")
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [clienteInstanceList: Cliente.list(params), clienteInstanceTotal: Cliente.count()]
    }

    def create() {
        [clienteInstance: new Cliente(params)]
    }
    
   
    
    

    def save() {
        def clienteInstance = new Cliente(params)
        if (!clienteInstance.save(flush: true)) {
            render(view: "create", model: [clienteInstance: clienteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
        redirect(action: "show", id: clienteInstance.id)
    }
    def saveD(Long id) {
       
       def clienteInstance = new Cliente(params)
       
        if (!clienteInstance.save(flush: true)) {
            render(template: "formulario", model: [clienteInstance: clienteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
      
        
         //def cliente = Cliente.get(id)
            System.out.println(" cliente id " + clienteInstance.id) 
        def tamaño = Os.list().size()
        def noticket = tamaño + 1
        def statusLista = Status.executeQuery(" from Status s " +
                     "where s.tipo = 'Orden Servicio'")
        def ingenierosLista = Idc.executeQuery(" from Idc i " +
                     "where i.tipo = 'IDS'")
        def status = Status.get(7)
        def cliente = Cliente.get(clienteInstance.id)
        def osInstance = new Os(params)
         osInstance.ticket = noticket
         osInstance.cliente = cliente
         osInstance.status = status
        
      render(template: "formularioOS", model: [osInstance: osInstance, statusLista:statusLista, ingenierosLista:ingenierosLista ])
      // redirect( controller:"os", action: "create", id: clienteInstance.id)

       
  
    }

    def show(Long id) {
        def clienteInstance = Cliente.get(id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        [clienteInstance: clienteInstance]
    }

    def edit(Long id) {
        def clienteInstance = Cliente.get(id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        [clienteInstance: clienteInstance]
    }

    def launchbox(Long id) {
        def clienteInstance = Cliente.get(id)
        def orden = Os.get(params.osInstance)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
             
        }
         System.out.println("orden de servicio " + params.osInstance) 
         render(template: "modalform", model:  [clienteInstance: clienteInstance, orden:orden]) 
       
    }

    def update(Long id, Long version, Long os) {

   
    
        def clienteInstance = Cliente.get(id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (clienteInstance.version > version) {
                clienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cliente.label', default: 'Cliente')] as Object[],
                          "Another user has updated this Cliente while you were editing")
                render(view: "edit", model: [clienteInstance: clienteInstance])
                return
            }
        }


        clienteInstance.properties = params
     
        if (!clienteInstance.save(flush: true)) {
            render(view: "edit", model: [clienteInstance: clienteInstance])
            return
        }
              
    
          flash.message = message(code: 'default.updated.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
           if(params.os){
            def orden = Os.get(params.os)
        redirect(controller: "os", action: "show", id: orden.id)
       
          
      }   
         if(!params.os){
       
        redirect(action: "show", id: clienteInstance.id)
      }
    }

    def delete(Long id) {
        def clienteInstance = Cliente.get(id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        try {
            clienteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "show", id: id)
            
        }
    }
    
    
}
