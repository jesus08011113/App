package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(AccionesController)
@Mock(Acciones)
class AccionesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/acciones/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.accionesInstanceList.size() == 0
        assert model.accionesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.accionesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.accionesInstance != null
        assert view == '/acciones/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/acciones/show/1'
        assert controller.flash.message != null
        assert Acciones.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/acciones/list'

        populateValidParams(params)
        def acciones = new Acciones(params)

        assert acciones.save() != null

        params.id = acciones.id

        def model = controller.show()

        assert model.accionesInstance == acciones
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/acciones/list'

        populateValidParams(params)
        def acciones = new Acciones(params)

        assert acciones.save() != null

        params.id = acciones.id

        def model = controller.edit()

        assert model.accionesInstance == acciones
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/acciones/list'

        response.reset()

        populateValidParams(params)
        def acciones = new Acciones(params)

        assert acciones.save() != null

        // test invalid parameters in update
        params.id = acciones.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/acciones/edit"
        assert model.accionesInstance != null

        acciones.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/acciones/show/$acciones.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        acciones.clearErrors()

        populateValidParams(params)
        params.id = acciones.id
        params.version = -1
        controller.update()

        assert view == "/acciones/edit"
        assert model.accionesInstance != null
        assert model.accionesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/acciones/list'

        response.reset()

        populateValidParams(params)
        def acciones = new Acciones(params)

        assert acciones.save() != null
        assert Acciones.count() == 1

        params.id = acciones.id

        controller.delete()

        assert Acciones.count() == 0
        assert Acciones.get(acciones.id) == null
        assert response.redirectedUrl == '/acciones/list'
    }
}
