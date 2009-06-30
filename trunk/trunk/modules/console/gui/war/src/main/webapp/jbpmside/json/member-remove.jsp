<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.*"%>
<%@page import="org.jbpm.api.*"%>
<%@page import="org.jbpm.api.task.*"%>
<%@page import="org.jbpm.pvm.internal.identity.spi.IdentitySession"%>
<%@page import="org.jbpm.api.identity.*"%>
<%@page import="org.jbpm.pvm.internal.identity.impl.MembershipImpl"%>
<%@page import="org.jbpm.pvm.internal.identity.spi.*"%>

<%
    ApplicationContext ctx = null;
    ctx = WebApplicationContextUtils.getWebApplicationContext(application);
    ProcessEngine processEngine = (ProcessEngine) ctx.getBean("jbpmConfiguration");
    RepositoryService repositoryService = processEngine.getRepositoryService();
    ExecutionService executionService = processEngine.getExecutionService();
    TaskService taskService = processEngine.getTaskService();
    IdentityService identityService = processEngine.getIdentityService();

    String userId = request.getParameter("userId");
    String groupId = request.getParameter("groupId");
    String role = request.getParameter("role");
    identityService.deleteMembership(userId, groupId, role);
%>
{success: true}
