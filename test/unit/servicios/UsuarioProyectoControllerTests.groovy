package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(UsuarioProyectoController)
@Mock(UsuarioProyecto)
class UsuarioProyectoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/usuarioProyecto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.usuarioProyectoInstanceList.size() == 0
        assert model.usuarioProyectoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.usuarioProyectoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.usuarioProyectoInstance != null
        assert view == '/usuarioProyecto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/usuarioProyecto/show/1'
        assert controller.flash.message != null
        assert UsuarioProyecto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/usuarioProyecto/list'

        populateValidParams(params)
        def usuarioProyecto = new UsuarioProyecto(params)

        assert usuarioProyecto.save() != null

        params.id = usuarioProyecto.id

        def model = controller.show()

        assert model.usuarioProyectoInstance == usuarioProyecto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/usuarioProyecto/list'

        populateValidParams(params)
        def usuarioProyecto = new UsuarioProyecto(params)

        assert usuarioProyecto.save() != null

        params.id = usuarioProyecto.id

        def model = controller.edit()

        assert model.usuarioProyectoInstance == usuarioProyecto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/usuarioProyecto/list'

        response.reset()

        populateValidParams(params)
        def usuarioProyecto = new UsuarioProyecto(params)

        assert usuarioProyecto.save() != null

        // test invalid parameters in update
        params.id = usuarioProyecto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/usuarioProyecto/edit"
        assert model.usuarioProyectoInstance != null

        usuarioProyecto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/usuarioProyecto/show/$usuarioProyecto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        usuarioProyecto.clearErrors()

        populateValidParams(params)
        params.id = usuarioProyecto.id
        params.version = -1
        controller.update()

        assert view == "/usuarioProyecto/edit"
        assert model.usuarioProyectoInstance != null
        assert model.usuarioProyectoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/usuarioProyecto/list'

        response.reset()

        populateValidParams(params)
        def usuarioProyecto = new UsuarioProyecto(params)

        assert usuarioProyecto.save() != null
        assert UsuarioProyecto.count() == 1

        params.id = usuarioProyecto.id

        controller.delete()

        assert UsuarioProyecto.count() == 0
        assert UsuarioProyecto.get(usuarioProyecto.id) == null
        assert response.redirectedUrl == '/usuarioProyecto/list'
    }
}
