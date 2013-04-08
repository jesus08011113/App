package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(ProvedoresController)
@Mock(Provedores)
class ProvedoresControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/provedores/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.provedoresInstanceList.size() == 0
        assert model.provedoresInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.provedoresInstance != null
    }

    void testSave() {
        controller.save()

        assert model.provedoresInstance != null
        assert view == '/provedores/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/provedores/show/1'
        assert controller.flash.message != null
        assert Provedores.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/provedores/list'

        populateValidParams(params)
        def provedores = new Provedores(params)

        assert provedores.save() != null

        params.id = provedores.id

        def model = controller.show()

        assert model.provedoresInstance == provedores
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/provedores/list'

        populateValidParams(params)
        def provedores = new Provedores(params)

        assert provedores.save() != null

        params.id = provedores.id

        def model = controller.edit()

        assert model.provedoresInstance == provedores
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/provedores/list'

        response.reset()

        populateValidParams(params)
        def provedores = new Provedores(params)

        assert provedores.save() != null

        // test invalid parameters in update
        params.id = provedores.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/provedores/edit"
        assert model.provedoresInstance != null

        provedores.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/provedores/show/$provedores.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        provedores.clearErrors()

        populateValidParams(params)
        params.id = provedores.id
        params.version = -1
        controller.update()

        assert view == "/provedores/edit"
        assert model.provedoresInstance != null
        assert model.provedoresInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/provedores/list'

        response.reset()

        populateValidParams(params)
        def provedores = new Provedores(params)

        assert provedores.save() != null
        assert Provedores.count() == 1

        params.id = provedores.id

        controller.delete()

        assert Provedores.count() == 0
        assert Provedores.get(provedores.id) == null
        assert response.redirectedUrl == '/provedores/list'
    }
}
