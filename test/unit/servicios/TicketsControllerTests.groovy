package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(TicketsController)
@Mock(Tickets)
class TicketsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tickets/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ticketsInstanceList.size() == 0
        assert model.ticketsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ticketsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ticketsInstance != null
        assert view == '/tickets/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tickets/show/1'
        assert controller.flash.message != null
        assert Tickets.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tickets/list'

        populateValidParams(params)
        def tickets = new Tickets(params)

        assert tickets.save() != null

        params.id = tickets.id

        def model = controller.show()

        assert model.ticketsInstance == tickets
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tickets/list'

        populateValidParams(params)
        def tickets = new Tickets(params)

        assert tickets.save() != null

        params.id = tickets.id

        def model = controller.edit()

        assert model.ticketsInstance == tickets
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tickets/list'

        response.reset()

        populateValidParams(params)
        def tickets = new Tickets(params)

        assert tickets.save() != null

        // test invalid parameters in update
        params.id = tickets.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tickets/edit"
        assert model.ticketsInstance != null

        tickets.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tickets/show/$tickets.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tickets.clearErrors()

        populateValidParams(params)
        params.id = tickets.id
        params.version = -1
        controller.update()

        assert view == "/tickets/edit"
        assert model.ticketsInstance != null
        assert model.ticketsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tickets/list'

        response.reset()

        populateValidParams(params)
        def tickets = new Tickets(params)

        assert tickets.save() != null
        assert Tickets.count() == 1

        params.id = tickets.id

        controller.delete()

        assert Tickets.count() == 0
        assert Tickets.get(tickets.id) == null
        assert response.redirectedUrl == '/tickets/list'
    }
}
