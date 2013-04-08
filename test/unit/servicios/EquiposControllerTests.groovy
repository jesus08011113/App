package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(EquiposController)
@Mock(Equipos)
class EquiposControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/equipos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.equiposInstanceList.size() == 0
        assert model.equiposInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.equiposInstance != null
    }

    void testSave() {
        controller.save()

        assert model.equiposInstance != null
        assert view == '/equipos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/equipos/show/1'
        assert controller.flash.message != null
        assert Equipos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/equipos/list'

        populateValidParams(params)
        def equipos = new Equipos(params)

        assert equipos.save() != null

        params.id = equipos.id

        def model = controller.show()

        assert model.equiposInstance == equipos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/equipos/list'

        populateValidParams(params)
        def equipos = new Equipos(params)

        assert equipos.save() != null

        params.id = equipos.id

        def model = controller.edit()

        assert model.equiposInstance == equipos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/equipos/list'

        response.reset()

        populateValidParams(params)
        def equipos = new Equipos(params)

        assert equipos.save() != null

        // test invalid parameters in update
        params.id = equipos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/equipos/edit"
        assert model.equiposInstance != null

        equipos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/equipos/show/$equipos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        equipos.clearErrors()

        populateValidParams(params)
        params.id = equipos.id
        params.version = -1
        controller.update()

        assert view == "/equipos/edit"
        assert model.equiposInstance != null
        assert model.equiposInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/equipos/list'

        response.reset()

        populateValidParams(params)
        def equipos = new Equipos(params)

        assert equipos.save() != null
        assert Equipos.count() == 1

        params.id = equipos.id

        controller.delete()

        assert Equipos.count() == 0
        assert Equipos.get(equipos.id) == null
        assert response.redirectedUrl == '/equipos/list'
    }
}
