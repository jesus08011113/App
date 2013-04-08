package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoObservacionController)
@Mock(TipoObservacion)
class TipoObservacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoObservacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoObservacionInstanceList.size() == 0
        assert model.tipoObservacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoObservacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoObservacionInstance != null
        assert view == '/tipoObservacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoObservacion/show/1'
        assert controller.flash.message != null
        assert TipoObservacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoObservacion/list'

        populateValidParams(params)
        def tipoObservacion = new TipoObservacion(params)

        assert tipoObservacion.save() != null

        params.id = tipoObservacion.id

        def model = controller.show()

        assert model.tipoObservacionInstance == tipoObservacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoObservacion/list'

        populateValidParams(params)
        def tipoObservacion = new TipoObservacion(params)

        assert tipoObservacion.save() != null

        params.id = tipoObservacion.id

        def model = controller.edit()

        assert model.tipoObservacionInstance == tipoObservacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoObservacion/list'

        response.reset()

        populateValidParams(params)
        def tipoObservacion = new TipoObservacion(params)

        assert tipoObservacion.save() != null

        // test invalid parameters in update
        params.id = tipoObservacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoObservacion/edit"
        assert model.tipoObservacionInstance != null

        tipoObservacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoObservacion/show/$tipoObservacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoObservacion.clearErrors()

        populateValidParams(params)
        params.id = tipoObservacion.id
        params.version = -1
        controller.update()

        assert view == "/tipoObservacion/edit"
        assert model.tipoObservacionInstance != null
        assert model.tipoObservacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoObservacion/list'

        response.reset()

        populateValidParams(params)
        def tipoObservacion = new TipoObservacion(params)

        assert tipoObservacion.save() != null
        assert TipoObservacion.count() == 1

        params.id = tipoObservacion.id

        controller.delete()

        assert TipoObservacion.count() == 0
        assert TipoObservacion.get(tipoObservacion.id) == null
        assert response.redirectedUrl == '/tipoObservacion/list'
    }
}
