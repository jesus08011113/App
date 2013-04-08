package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(ProyectoCentralController)
@Mock(ProyectoCentral)
class ProyectoCentralControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/proyectoCentral/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.proyectoCentralInstanceList.size() == 0
        assert model.proyectoCentralInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.proyectoCentralInstance != null
    }

    void testSave() {
        controller.save()

        assert model.proyectoCentralInstance != null
        assert view == '/proyectoCentral/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/proyectoCentral/show/1'
        assert controller.flash.message != null
        assert ProyectoCentral.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/proyectoCentral/list'

        populateValidParams(params)
        def proyectoCentral = new ProyectoCentral(params)

        assert proyectoCentral.save() != null

        params.id = proyectoCentral.id

        def model = controller.show()

        assert model.proyectoCentralInstance == proyectoCentral
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/proyectoCentral/list'

        populateValidParams(params)
        def proyectoCentral = new ProyectoCentral(params)

        assert proyectoCentral.save() != null

        params.id = proyectoCentral.id

        def model = controller.edit()

        assert model.proyectoCentralInstance == proyectoCentral
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/proyectoCentral/list'

        response.reset()

        populateValidParams(params)
        def proyectoCentral = new ProyectoCentral(params)

        assert proyectoCentral.save() != null

        // test invalid parameters in update
        params.id = proyectoCentral.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/proyectoCentral/edit"
        assert model.proyectoCentralInstance != null

        proyectoCentral.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/proyectoCentral/show/$proyectoCentral.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        proyectoCentral.clearErrors()

        populateValidParams(params)
        params.id = proyectoCentral.id
        params.version = -1
        controller.update()

        assert view == "/proyectoCentral/edit"
        assert model.proyectoCentralInstance != null
        assert model.proyectoCentralInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/proyectoCentral/list'

        response.reset()

        populateValidParams(params)
        def proyectoCentral = new ProyectoCentral(params)

        assert proyectoCentral.save() != null
        assert ProyectoCentral.count() == 1

        params.id = proyectoCentral.id

        controller.delete()

        assert ProyectoCentral.count() == 0
        assert ProyectoCentral.get(proyectoCentral.id) == null
        assert response.redirectedUrl == '/proyectoCentral/list'
    }
}
