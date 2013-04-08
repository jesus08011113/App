<%@ page import="servicios.UserRole" %>



<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="userRole.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
  <sec:ifAllGranted roles="ROLE_ADMIN">
	<g:select id="role" name="role.id" from="${servicios.Role.list()}" optionKey="id" required="" value="${userRoleInstance?.role?.id}" class="many-to-one"/>
        </sec:ifAllGranted>
  <sec:ifAllGranted roles="ROLE_SUPERVISOR">
	<g:select id="role" name="role.id" from="${servicios.Role.get(2)}" optionKey="id" required="" value="${userRoleInstance?.role?.id}" class="many-to-one"/>
        </sec:ifAllGranted>
</div>

<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userRole.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${usuariosSinRol}" optionKey="id" required="" value="${userRoleInstance?.user?.id}" class="many-to-one"/>
</div>

