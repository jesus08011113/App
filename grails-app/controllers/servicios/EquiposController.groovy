package servicios

import org.springframework.dao.DataIntegrityViolationException

class EquiposController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [equiposInstanceList: Equipos.list(params), equiposInstanceTotal: Equipos.count()]
    }

    def create() {
        [equiposInstance: new Equipos(params)]
    }

    def save() {
        def equiposInstance = new Equipos(params)
        if (!equiposInstance.save(flush: true)) {
            render(view: "create", model: [equiposInstance: equiposInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'equipos.label', default: 'Equipos'), equiposInstance.id])
        redirect(action: "show", id: equiposInstance.id)
    }

    def show(Long id) {
        def equiposInstance = Equipos.get(id)
        if (!equiposInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipos.label', default: 'Equipos'), id])
            redirect(action: "list")
            return
        }

        [equiposInstance: equiposInstance]
    }

    def edit(Long id) {
        def equiposInstance = Equipos.get(id)
        if (!equiposInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipos.label', default: 'Equipos'), id])
            redirect(action: "list")
            return
        }

        [equiposInstance: equiposInstance]
    }

    def update(Long id, Long version) {
        def equiposInstance = Equipos.get(id)
        if (!equiposInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipos.label', default: 'Equipos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (equiposInstance.version > version) {
                equiposInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'equipos.label', default: 'Equipos')] as Object[],
                          "Another user has updated this Equipos while you were editing")
                render(view: "edit", model: [equiposInstance: equiposInstance])
                return
            }
        }

        equiposInstance.properties = params

        if (!equiposInstance.save(flush: true)) {
            render(view: "edit", model: [equiposInstance: equiposInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'equipos.label', default: 'Equipos'), equiposInstance.id])
        redirect(action: "show", id: equiposInstance.id)
    }

    def delete(Long id) {
        def equiposInstance = Equipos.get(id)
        if (!equiposInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipos.label', default: 'Equipos'), id])
            redirect(action: "list")
            return
        }

        try {
            equiposInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipos.label', default: 'Equipos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipos.label', default: 'Equipos'), id])
            redirect(action: "show", id: id)
        }
    }
}
