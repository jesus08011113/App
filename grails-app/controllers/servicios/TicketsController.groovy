package servicios

import org.springframework.dao.DataIntegrityViolationException

class TicketsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ticketsInstanceList: Tickets.list(params), ticketsInstanceTotal: Tickets.count()]
    }

    def create() {
        [ticketsInstance: new Tickets(params)]
    }

    def save() {
        def ticketsInstance = new Tickets(params)
        if (!ticketsInstance.save(flush: true)) {
            render(view: "create", model: [ticketsInstance: ticketsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tickets.label', default: 'Tickets'), ticketsInstance.id])
        redirect(action: "show", id: ticketsInstance.id)
    }

    def show(Long id) {
        def ticketsInstance = Tickets.get(id)
        if (!ticketsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tickets.label', default: 'Tickets'), id])
            redirect(action: "list")
            return
        }

        [ticketsInstance: ticketsInstance]
    }

    def edit(Long id) {
        def ticketsInstance = Tickets.get(id)
        if (!ticketsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tickets.label', default: 'Tickets'), id])
            redirect(action: "list")
            return
        }

        [ticketsInstance: ticketsInstance]
    }

    def update(Long id, Long version) {
        def ticketsInstance = Tickets.get(id)
        if (!ticketsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tickets.label', default: 'Tickets'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ticketsInstance.version > version) {
                ticketsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tickets.label', default: 'Tickets')] as Object[],
                          "Another user has updated this Tickets while you were editing")
                render(view: "edit", model: [ticketsInstance: ticketsInstance])
                return
            }
        }

        ticketsInstance.properties = params

        if (!ticketsInstance.save(flush: true)) {
            render(view: "edit", model: [ticketsInstance: ticketsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tickets.label', default: 'Tickets'), ticketsInstance.id])
        redirect(action: "show", id: ticketsInstance.id)
    }

    def delete(Long id) {
        def ticketsInstance = Tickets.get(id)
        if (!ticketsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tickets.label', default: 'Tickets'), id])
            redirect(action: "list")
            return
        }

        try {
            ticketsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tickets.label', default: 'Tickets'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tickets.label', default: 'Tickets'), id])
            redirect(action: "show", id: id)
        }
    }
}
