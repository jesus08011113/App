package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(SeguimientoCatController)
@Mock(SeguimientoCat)
class SeguimientoCatControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/seguimientoCat/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.seguimientoCatInstanceList.size() == 0
        assert model.seguimientoCatInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.seguimientoCatInstance != null
    }

    void testSave() {
        controller.save()

        assert model.seguimientoCatInstance != null
        assert view == '/seguimientoCat/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/seguimientoCat/show/1'
        assert controller.flash.message != null
        assert SeguimientoCat.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/seguimientoCat/list'

        populateValidParams(params)
        def seguimientoCat = new SeguimientoCat(params)

        assert seguimientoCat.save() != null

        params.id = seguimientoCat.id

        def model = controller.show()

        assert model.seguimientoCatInstance == seguimientoCat
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/seguimientoCat/list'

        populateValidParams(params)
        def seguimientoCat = new SeguimientoCat(params)

        assert seguimientoCat.save() != null

        params.id = seguimientoCat.id

        def model = controller.edit()

        assert model.seguimientoCatInstance == seguimientoCat
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/seguimientoCat/list'

        response.reset()

        populateValidParams(params)
        def seguimientoCat = new SeguimientoCat(params)

        assert seguimientoCat.save() != null

        // test invalid parameters in update
        params.id = seguimientoCat.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/seguimientoCat/edit"
        assert model.seguimientoCatInstance != null

        seguimientoCat.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/seguimientoCat/show/$seguimientoCat.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        seguimientoCat.clearErrors()

        populateValidParams(params)
        params.id = seguimientoCat.id
        params.version = -1
        controller.update()

        assert view == "/seguimientoCat/edit"
        assert model.seguimientoCatInstance != null
        assert model.seguimientoCatInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/seguimientoCat/list'

        response.reset()

        populateValidParams(params)
        def seguimientoCat = new SeguimientoCat(params)

        assert seguimientoCat.save() != null
        assert SeguimientoCat.count() == 1

        params.id = seguimientoCat.id

        controller.delete()

        assert SeguimientoCat.count() == 0
        assert SeguimientoCat.get(seguimientoCat.id) == null
        assert response.redirectedUrl == '/seguimientoCat/list'
    }
}
