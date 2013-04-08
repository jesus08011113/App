package servicios

import org.springframework.dao.DataIntegrityViolationException

class TipoObservacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoObservacionInstanceList: TipoObservacion.list(params), tipoObservacionInstanceTotal: TipoObservacion.count()]
    }

    def create() {
        [tipoObservacionInstance: new TipoObservacion(params)]
    }

    def save() {
        def tipoObservacionInstance = new TipoObservacion(params)
        if (!tipoObservacionInstance.save(flush: true)) {
            render(view: "create", model: [tipoObservacionInstance: tipoObservacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoObservacion.label', default: 'TipoObservacion'), tipoObservacionInstance.id])
        redirect(action: "show", id: tipoObservacionInstance.id)
    }

    def show(Long id) {
        def tipoObservacionInstance = TipoObservacion.get(id)
        if (!tipoObservacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoObservacion.label', default: 'TipoObservacion'), id])
            redirect(action: "list")
            return
        }

        [tipoObservacionInstance: tipoObservacionInstance]
    }

    def edit(Long id) {
        def tipoObservacionInstance = TipoObservacion.get(id)
        if (!tipoObservacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoObservacion.label', default: 'TipoObservacion'), id])
            redirect(action: "list")
            return
        }

        [tipoObservacionInstance: tipoObservacionInstance]
    }

    def update(Long id, Long version) {
        def tipoObservacionInstance = TipoObservacion.get(id)
        if (!tipoObservacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoObservacion.label', default: 'TipoObservacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoObservacionInstance.version > version) {
                tipoObservacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoObservacion.label', default: 'TipoObservacion')] as Object[],
                          "Another user has updated this TipoObservacion while you were editing")
                render(view: "edit", model: [tipoObservacionInstance: tipoObservacionInstance])
                return
            }
        }

        tipoObservacionInstance.properties = params

        if (!tipoObservacionInstance.save(flush: true)) {
            render(view: "edit", model: [tipoObservacionInstance: tipoObservacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoObservacion.label', default: 'TipoObservacion'), tipoObservacionInstance.id])
        redirect(action: "show", id: tipoObservacionInstance.id)
    }

    def delete(Long id) {
        def tipoObservacionInstance = TipoObservacion.get(id)
        if (!tipoObservacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoObservacion.label', default: 'TipoObservacion'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoObservacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoObservacion.label', default: 'TipoObservacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoObservacion.label', default: 'TipoObservacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
