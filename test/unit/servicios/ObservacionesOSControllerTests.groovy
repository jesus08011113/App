package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(ObservacionesOSController)
@Mock(ObservacionesOS)
class ObservacionesOSControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/observacionesOS/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.observacionesOSInstanceList.size() == 0
        assert model.observacionesOSInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.observacionesOSInstance != null
    }

    void testSave() {
        controller.save()

        assert model.observacionesOSInstance != null
        assert view == '/observacionesOS/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/observacionesOS/show/1'
        assert controller.flash.message != null
        assert ObservacionesOS.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/observacionesOS/list'

        populateValidParams(params)
        def observacionesOS = new ObservacionesOS(params)

        assert observacionesOS.save() != null

        params.id = observacionesOS.id

        def model = controller.show()

        assert model.observacionesOSInstance == observacionesOS
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/observacionesOS/list'

        populateValidParams(params)
        def observacionesOS = new ObservacionesOS(params)

        assert observacionesOS.save() != null

        params.id = observacionesOS.id

        def model = controller.edit()

        assert model.observacionesOSInstance == observacionesOS
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/observacionesOS/list'

        response.reset()

        populateValidParams(params)
        def observacionesOS = new ObservacionesOS(params)

        assert observacionesOS.save() != null

        // test invalid parameters in update
        params.id = observacionesOS.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/observacionesOS/edit"
        assert model.observacionesOSInstance != null

        observacionesOS.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/observacionesOS/show/$observacionesOS.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        observacionesOS.clearErrors()

        populateValidParams(params)
        params.id = observacionesOS.id
        params.version = -1
        controller.update()

        assert view == "/observacionesOS/edit"
        assert model.observacionesOSInstance != null
        assert model.observacionesOSInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/observacionesOS/list'

        response.reset()

        populateValidParams(params)
        def observacionesOS = new ObservacionesOS(params)

        assert observacionesOS.save() != null
        assert ObservacionesOS.count() == 1

        params.id = observacionesOS.id

        controller.delete()

        assert ObservacionesOS.count() == 0
        assert ObservacionesOS.get(observacionesOS.id) == null
        assert response.redirectedUrl == '/observacionesOS/list'
    }
}
