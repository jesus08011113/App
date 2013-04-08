package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(TServicioController)
@Mock(TServicio)
class TServicioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/TServicio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.TServicioInstanceList.size() == 0
        assert model.TServicioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.TServicioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.TServicioInstance != null
        assert view == '/TServicio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/TServicio/show/1'
        assert controller.flash.message != null
        assert TServicio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/TServicio/list'

        populateValidParams(params)
        def TServicio = new TServicio(params)

        assert TServicio.save() != null

        params.id = TServicio.id

        def model = controller.show()

        assert model.TServicioInstance == TServicio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/TServicio/list'

        populateValidParams(params)
        def TServicio = new TServicio(params)

        assert TServicio.save() != null

        params.id = TServicio.id

        def model = controller.edit()

        assert model.TServicioInstance == TServicio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/TServicio/list'

        response.reset()

        populateValidParams(params)
        def TServicio = new TServicio(params)

        assert TServicio.save() != null

        // test invalid parameters in update
        params.id = TServicio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/TServicio/edit"
        assert model.TServicioInstance != null

        TServicio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/TServicio/show/$TServicio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        TServicio.clearErrors()

        populateValidParams(params)
        params.id = TServicio.id
        params.version = -1
        controller.update()

        assert view == "/TServicio/edit"
        assert model.TServicioInstance != null
        assert model.TServicioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/TServicio/list'

        response.reset()

        populateValidParams(params)
        def TServicio = new TServicio(params)

        assert TServicio.save() != null
        assert TServicio.count() == 1

        params.id = TServicio.id

        controller.delete()

        assert TServicio.count() == 0
        assert TServicio.get(TServicio.id) == null
        assert response.redirectedUrl == '/TServicio/list'
    }
}
