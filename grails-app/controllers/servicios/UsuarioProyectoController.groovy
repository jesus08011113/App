package servicios

import org.springframework.dao.DataIntegrityViolationException

class UsuarioProyectoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usuarioProyectoInstanceList: UsuarioProyecto.list(params), usuarioProyectoInstanceTotal: UsuarioProyecto.count()]
    }

    def create() {
     
      
        [usuarioProyectoInstance: new UsuarioProyecto(params)]
    }

    def save() {
        def usuarioProyectoInstance = new UsuarioProyecto(params)
        if (!usuarioProyectoInstance.save(flush: true)) {
            render(view: "create", model: [usuarioProyectoInstance: usuarioProyectoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto'), usuarioProyectoInstance.id])
        redirect(action: "show", id: usuarioProyectoInstance.id)
    }

    def show(Long id) {
        def usuarioProyectoInstance = UsuarioProyecto.get(id)
        if (!usuarioProyectoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto'), id])
            redirect(action: "list")
            return
        }

        [usuarioProyectoInstance: usuarioProyectoInstance]
    }

    def edit(Long id) {
        def usuarioProyectoInstance = UsuarioProyecto.get(id)
        if (!usuarioProyectoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto'), id])
            redirect(action: "list")
            return
        }

        [usuarioProyectoInstance: usuarioProyectoInstance]
    }

    def update(Long id, Long version) {
        def usuarioProyectoInstance = UsuarioProyecto.get(id)
        if (!usuarioProyectoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (usuarioProyectoInstance.version > version) {
                usuarioProyectoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto')] as Object[],
                          "Another user has updated this UsuarioProyecto while you were editing")
                render(view: "edit", model: [usuarioProyectoInstance: usuarioProyectoInstance])
                return
            }
        }

        usuarioProyectoInstance.properties = params

        if (!usuarioProyectoInstance.save(flush: true)) {
            render(view: "edit", model: [usuarioProyectoInstance: usuarioProyectoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto'), usuarioProyectoInstance.id])
        redirect(action: "show", id: usuarioProyectoInstance.id)
    }

    def delete(Long id) {
        def usuarioProyectoInstance = UsuarioProyecto.get(id)
        if (!usuarioProyectoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto'), id])
            redirect(action: "list")
            return
        }

        try {
            usuarioProyectoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuarioProyecto.label', default: 'UsuarioProyecto'), id])
            redirect(action: "show", id: id)
        }
    }
}
