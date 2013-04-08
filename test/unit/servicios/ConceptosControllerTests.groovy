package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(ConceptosController)
@Mock(Conceptos)
class ConceptosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/conceptos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.conceptosInstanceList.size() == 0
        assert model.conceptosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.conceptosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.conceptosInstance != null
        assert view == '/conceptos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/conceptos/show/1'
        assert controller.flash.message != null
        assert Conceptos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/conceptos/list'

        populateValidParams(params)
        def conceptos = new Conceptos(params)

        assert conceptos.save() != null

        params.id = conceptos.id

        def model = controller.show()

        assert model.conceptosInstance == conceptos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/conceptos/list'

        populateValidParams(params)
        def conceptos = new Conceptos(params)

        assert conceptos.save() != null

        params.id = conceptos.id

        def model = controller.edit()

        assert model.conceptosInstance == conceptos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/conceptos/list'

        response.reset()

        populateValidParams(params)
        def conceptos = new Conceptos(params)

        assert conceptos.save() != null

        // test invalid parameters in update
        params.id = conceptos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/conceptos/edit"
        assert model.conceptosInstance != null

        conceptos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/conceptos/show/$conceptos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        conceptos.clearErrors()

        populateValidParams(params)
        params.id = conceptos.id
        params.version = -1
        controller.update()

        assert view == "/conceptos/edit"
        assert model.conceptosInstance != null
        assert model.conceptosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/conceptos/list'

        response.reset()

        populateValidParams(params)
        def conceptos = new Conceptos(params)

        assert conceptos.save() != null
        assert Conceptos.count() == 1

        params.id = conceptos.id

        controller.delete()

        assert Conceptos.count() == 0
        assert Conceptos.get(conceptos.id) == null
        assert response.redirectedUrl == '/conceptos/list'
    }
}
