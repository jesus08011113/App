package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(ObservacionController)
@Mock(Observacion)
class ObservacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/observacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.observacionInstanceList.size() == 0
        assert model.observacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.observacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.observacionInstance != null
        assert view == '/observacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/observacion/show/1'
        assert controller.flash.message != null
        assert Observacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/observacion/list'

        populateValidParams(params)
        def observacion = new Observacion(params)

        assert observacion.save() != null

        params.id = observacion.id

        def model = controller.show()

        assert model.observacionInstance == observacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/observacion/list'

        populateValidParams(params)
        def observacion = new Observacion(params)

        assert observacion.save() != null

        params.id = observacion.id

        def model = controller.edit()

        assert model.observacionInstance == observacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/observacion/list'

        response.reset()

        populateValidParams(params)
        def observacion = new Observacion(params)

        assert observacion.save() != null

        // test invalid parameters in update
        params.id = observacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/observacion/edit"
        assert model.observacionInstance != null

        observacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/observacion/show/$observacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        observacion.clearErrors()

        populateValidParams(params)
        params.id = observacion.id
        params.version = -1
        controller.update()

        assert view == "/observacion/edit"
        assert model.observacionInstance != null
        assert model.observacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/observacion/list'

        response.reset()

        populateValidParams(params)
        def observacion = new Observacion(params)

        assert observacion.save() != null
        assert Observacion.count() == 1

        params.id = observacion.id

        controller.delete()

        assert Observacion.count() == 0
        assert Observacion.get(observacion.id) == null
        assert response.redirectedUrl == '/observacion/list'
    }
}
