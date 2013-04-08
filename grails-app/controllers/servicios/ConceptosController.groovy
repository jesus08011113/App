package servicios

import org.springframework.dao.DataIntegrityViolationException

class ConceptosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [conceptosInstanceList: Conceptos.list(params), conceptosInstanceTotal: Conceptos.count()]
    }

    def create() {
        [conceptosInstance: new Conceptos(params)]
    }

    def save() {
        def conceptosInstance = new Conceptos(params)
        if (!conceptosInstance.save(flush: true)) {
            render(view: "create", model: [conceptosInstance: conceptosInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'conceptos.label', default: 'Conceptos'), conceptosInstance.id])
        redirect(action: "show", id: conceptosInstance.id)
    }

    def show(Long id) {
        def conceptosInstance = Conceptos.get(id)
        if (!conceptosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptos.label', default: 'Conceptos'), id])
            redirect(action: "list")
            return
        }

        [conceptosInstance: conceptosInstance]
    }

    def edit(Long id) {
        def conceptosInstance = Conceptos.get(id)
        if (!conceptosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptos.label', default: 'Conceptos'), id])
            redirect(action: "list")
            return
        }

        [conceptosInstance: conceptosInstance]
    }

    def update(Long id, Long version) {
        def conceptosInstance = Conceptos.get(id)
        if (!conceptosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptos.label', default: 'Conceptos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (conceptosInstance.version > version) {
                conceptosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'conceptos.label', default: 'Conceptos')] as Object[],
                          "Another user has updated this Conceptos while you were editing")
                render(view: "edit", model: [conceptosInstance: conceptosInstance])
                return
            }
        }

        conceptosInstance.properties = params

        if (!conceptosInstance.save(flush: true)) {
            render(view: "edit", model: [conceptosInstance: conceptosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'conceptos.label', default: 'Conceptos'), conceptosInstance.id])
        redirect(action: "show", id: conceptosInstance.id)
    }

    def delete(Long id) {
        def conceptosInstance = Conceptos.get(id)
        if (!conceptosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptos.label', default: 'Conceptos'), id])
            redirect(action: "list")
            return
        }

        try {
            conceptosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'conceptos.label', default: 'Conceptos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'conceptos.label', default: 'Conceptos'), id])
            redirect(action: "show", id: id)
        }
    }
}
