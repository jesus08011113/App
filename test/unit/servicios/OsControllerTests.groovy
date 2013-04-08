package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(OsController)
@Mock(Os)
class OsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/os/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.osInstanceList.size() == 0
        assert model.osInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.osInstance != null
    }

    void testSave() {
        controller.save()

        assert model.osInstance != null
        assert view == '/os/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/os/show/1'
        assert controller.flash.message != null
        assert Os.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/os/list'

        populateValidParams(params)
        def os = new Os(params)

        assert os.save() != null

        params.id = os.id

        def model = controller.show()

        assert model.osInstance == os
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/os/list'

        populateValidParams(params)
        def os = new Os(params)

        assert os.save() != null

        params.id = os.id

        def model = controller.edit()

        assert model.osInstance == os
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/os/list'

        response.reset()

        populateValidParams(params)
        def os = new Os(params)

        assert os.save() != null

        // test invalid parameters in update
        params.id = os.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/os/edit"
        assert model.osInstance != null

        os.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/os/show/$os.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        os.clearErrors()

        populateValidParams(params)
        params.id = os.id
        params.version = -1
        controller.update()

        assert view == "/os/edit"
        assert model.osInstance != null
        assert model.osInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/os/list'

        response.reset()

        populateValidParams(params)
        def os = new Os(params)

        assert os.save() != null
        assert Os.count() == 1

        params.id = os.id

        controller.delete()

        assert Os.count() == 0
        assert Os.get(os.id) == null
        assert response.redirectedUrl == '/os/list'
    }
}
