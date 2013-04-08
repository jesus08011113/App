package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(ProyectoServicioController)
@Mock(ProyectoServicio)
class ProyectoServicioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/proyectoServicio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.proyectoServicioInstanceList.size() == 0
        assert model.proyectoServicioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.proyectoServicioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.proyectoServicioInstance != null
        assert view == '/proyectoServicio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/proyectoServicio/show/1'
        assert controller.flash.message != null
        assert ProyectoServicio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/proyectoServicio/list'

        populateValidParams(params)
        def proyectoServicio = new ProyectoServicio(params)

        assert proyectoServicio.save() != null

        params.id = proyectoServicio.id

        def model = controller.show()

        assert model.proyectoServicioInstance == proyectoServicio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/proyectoServicio/list'

        populateValidParams(params)
        def proyectoServicio = new ProyectoServicio(params)

        assert proyectoServicio.save() != null

        params.id = proyectoServicio.id

        def model = controller.edit()

        assert model.proyectoServicioInstance == proyectoServicio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/proyectoServicio/list'

        response.reset()

        populateValidParams(params)
        def proyectoServicio = new ProyectoServicio(params)

        assert proyectoServicio.save() != null

        // test invalid parameters in update
        params.id = proyectoServicio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/proyectoServicio/edit"
        assert model.proyectoServicioInstance != null

        proyectoServicio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/proyectoServicio/show/$proyectoServicio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        proyectoServicio.clearErrors()

        populateValidParams(params)
        params.id = proyectoServicio.id
        params.version = -1
        controller.update()

        assert view == "/proyectoServicio/edit"
        assert model.proyectoServicioInstance != null
        assert model.proyectoServicioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/proyectoServicio/list'

        response.reset()

        populateValidParams(params)
        def proyectoServicio = new ProyectoServicio(params)

        assert proyectoServicio.save() != null
        assert ProyectoServicio.count() == 1

        params.id = proyectoServicio.id

        controller.delete()

        assert ProyectoServicio.count() == 0
        assert ProyectoServicio.get(proyectoServicio.id) == null
        assert response.redirectedUrl == '/proyectoServicio/list'
    }
}
