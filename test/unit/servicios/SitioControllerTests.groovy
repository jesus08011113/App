package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(SitioController)
@Mock(Sitio)
class SitioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sitio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sitioInstanceList.size() == 0
        assert model.sitioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.sitioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sitioInstance != null
        assert view == '/sitio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sitio/show/1'
        assert controller.flash.message != null
        assert Sitio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sitio/list'

        populateValidParams(params)
        def sitio = new Sitio(params)

        assert sitio.save() != null

        params.id = sitio.id

        def model = controller.show()

        assert model.sitioInstance == sitio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sitio/list'

        populateValidParams(params)
        def sitio = new Sitio(params)

        assert sitio.save() != null

        params.id = sitio.id

        def model = controller.edit()

        assert model.sitioInstance == sitio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sitio/list'

        response.reset()

        populateValidParams(params)
        def sitio = new Sitio(params)

        assert sitio.save() != null

        // test invalid parameters in update
        params.id = sitio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sitio/edit"
        assert model.sitioInstance != null

        sitio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sitio/show/$sitio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sitio.clearErrors()

        populateValidParams(params)
        params.id = sitio.id
        params.version = -1
        controller.update()

        assert view == "/sitio/edit"
        assert model.sitioInstance != null
        assert model.sitioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sitio/list'

        response.reset()

        populateValidParams(params)
        def sitio = new Sitio(params)

        assert sitio.save() != null
        assert Sitio.count() == 1

        params.id = sitio.id

        controller.delete()

        assert Sitio.count() == 0
        assert Sitio.get(sitio.id) == null
        assert response.redirectedUrl == '/sitio/list'
    }
}
