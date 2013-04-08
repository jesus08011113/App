package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(OsAccionesController)
@Mock(OsAcciones)
class OsAccionesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/osAcciones/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.osAccionesInstanceList.size() == 0
        assert model.osAccionesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.osAccionesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.osAccionesInstance != null
        assert view == '/osAcciones/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/osAcciones/show/1'
        assert controller.flash.message != null
        assert OsAcciones.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/osAcciones/list'

        populateValidParams(params)
        def osAcciones = new OsAcciones(params)

        assert osAcciones.save() != null

        params.id = osAcciones.id

        def model = controller.show()

        assert model.osAccionesInstance == osAcciones
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/osAcciones/list'

        populateValidParams(params)
        def osAcciones = new OsAcciones(params)

        assert osAcciones.save() != null

        params.id = osAcciones.id

        def model = controller.edit()

        assert model.osAccionesInstance == osAcciones
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/osAcciones/list'

        response.reset()

        populateValidParams(params)
        def osAcciones = new OsAcciones(params)

        assert osAcciones.save() != null

        // test invalid parameters in update
        params.id = osAcciones.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/osAcciones/edit"
        assert model.osAccionesInstance != null

        osAcciones.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/osAcciones/show/$osAcciones.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        osAcciones.clearErrors()

        populateValidParams(params)
        params.id = osAcciones.id
        params.version = -1
        controller.update()

        assert view == "/osAcciones/edit"
        assert model.osAccionesInstance != null
        assert model.osAccionesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/osAcciones/list'

        response.reset()

        populateValidParams(params)
        def osAcciones = new OsAcciones(params)

        assert osAcciones.save() != null
        assert OsAcciones.count() == 1

        params.id = osAcciones.id

        controller.delete()

        assert OsAcciones.count() == 0
        assert OsAcciones.get(osAcciones.id) == null
        assert response.redirectedUrl == '/osAcciones/list'
    }
}
