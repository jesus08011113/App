package servicios



import org.junit.*
import grails.test.mixin.*

@TestFor(IdcController)
@Mock(Idc)
class IdcControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/idc/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.idcInstanceList.size() == 0
        assert model.idcInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.idcInstance != null
    }

    void testSave() {
        controller.save()

        assert model.idcInstance != null
        assert view == '/idc/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/idc/show/1'
        assert controller.flash.message != null
        assert Idc.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/idc/list'

        populateValidParams(params)
        def idc = new Idc(params)

        assert idc.save() != null

        params.id = idc.id

        def model = controller.show()

        assert model.idcInstance == idc
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/idc/list'

        populateValidParams(params)
        def idc = new Idc(params)

        assert idc.save() != null

        params.id = idc.id

        def model = controller.edit()

        assert model.idcInstance == idc
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/idc/list'

        response.reset()

        populateValidParams(params)
        def idc = new Idc(params)

        assert idc.save() != null

        // test invalid parameters in update
        params.id = idc.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/idc/edit"
        assert model.idcInstance != null

        idc.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/idc/show/$idc.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        idc.clearErrors()

        populateValidParams(params)
        params.id = idc.id
        params.version = -1
        controller.update()

        assert view == "/idc/edit"
        assert model.idcInstance != null
        assert model.idcInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/idc/list'

        response.reset()

        populateValidParams(params)
        def idc = new Idc(params)

        assert idc.save() != null
        assert Idc.count() == 1

        params.id = idc.id

        controller.delete()

        assert Idc.count() == 0
        assert Idc.get(idc.id) == null
        assert response.redirectedUrl == '/idc/list'
    }
}
