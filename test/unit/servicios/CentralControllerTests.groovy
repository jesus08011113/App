package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(CentralController)
@Mock(Central)
class CentralControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/central/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.centralInstanceList.size() == 0
        assert model.centralInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.centralInstance != null
    }

    void testSave() {
        controller.save()

        assert model.centralInstance != null
        assert view == '/central/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/central/show/1'
        assert controller.flash.message != null
        assert Central.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/central/list'

        populateValidParams(params)
        def central = new Central(params)

        assert central.save() != null

        params.id = central.id

        def model = controller.show()

        assert model.centralInstance == central
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/central/list'

        populateValidParams(params)
        def central = new Central(params)

        assert central.save() != null

        params.id = central.id

        def model = controller.edit()

        assert model.centralInstance == central
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/central/list'

        response.reset()

        populateValidParams(params)
        def central = new Central(params)

        assert central.save() != null

        // test invalid parameters in update
        params.id = central.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/central/edit"
        assert model.centralInstance != null

        central.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/central/show/$central.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        central.clearErrors()

        populateValidParams(params)
        params.id = central.id
        params.version = -1
        controller.update()

        assert view == "/central/edit"
        assert model.centralInstance != null
        assert model.centralInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/central/list'

        response.reset()

        populateValidParams(params)
        def central = new Central(params)

        assert central.save() != null
        assert Central.count() == 1

        params.id = central.id

        controller.delete()

        assert Central.count() == 0
        assert Central.get(central.id) == null
        assert response.redirectedUrl == '/central/list'
    }
}
