<%@ page import="fa.training.modal.entities.Employee" %>
<%@ page import="fa.training.modal.entities.Account" %>
<%@ page import="fa.training.constants.AppConstant" %><%--
  Created by IntelliJ IDEA.
  User: knigh
  Date: 04/02/2023
  Time: 4:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm Deleted</title>
    <jsp:include page="../fragment/head-import.jsp"/>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../fragment/header.jsp"/>
    <div class="modal" tabindex="-1" role="dialog" style="display: block">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <% Employee employee = (Employee) request.getAttribute("employeeDelete");
                        Account account = (Account) request.getAttribute("accountDelete");
                        String totalRecord = (String) request.getAttribute(AppConstant.TOTAL_RECORD);
                        String pageNumber = (String) request.getAttribute(AppConstant.PAGE_NUMBER);
                        String keyword = (String) request.getAttribute("keyword");
                        String filter = (String) request.getAttribute("filter");
                        String id = (String) request.getAttribute("id");
                        System.out.println(pageNumber+ " in confirm");
                    %>
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <% if(keyword == null || keyword.length() == 0) { %>
                            <span aria-hidden="true"><a href="${pageContext.request.contextPath}/employees?pageNumber=<%=pageNumber%>">x</a></span>
                        <% } else { %>
                            <span aria-hidden="true"><a href="${pageContext.request.contextPath}/employees/search?pageNumber=<%=pageNumber%>&keyword=<%=keyword == null ? "" : keyword%>&filter=<%=filter == null ? "" : filter%>">x</a></span>
                        <% } %>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Information of account to delete:</p>

                    <p><%=employee !=null ? employee.getFirstName() : ""%> <%=employee !=null ? employee.getLastName() : ""%></p>
                    <p><%=account !=null ? account.getAccount() : ""%> </p>
                </div>
                <div class="modal-footer">
                    <% if(keyword == null || keyword.length() == 0) { %>
                            <button type="submit" class="btn btn-secondary" data-dismiss="modal"><a style="text-decoration: none;color: white"
                            href="${pageContext.request.contextPath}/employees?pageNumber=<%=pageNumber%>">Close</a></button>
                    <% } else { %>
                            <button type="submit" class="btn btn-secondary" data-dismiss="modal"><a style="text-decoration: none;color: white"
                            href="${pageContext.request.contextPath}/employees/search?pageNumber=<%=pageNumber%>&keyword=<%=keyword%>&filter=<%=filter%>">Close</a></button>
                    <% } %>

                    <% if(employee !=null) { %>
                        <form method="POST" action="${pageContext.request.contextPath}/employees/delete">
                                                <input type="text" hidden name="id" value="<%=id%>">
                                                <input type="text" hidden name="confirm" value="confirm">
                                                <input type="text" hidden name="pageNumber" value="<%=pageNumber%>">
                                                <input type="text" hidden name="totalRecord" value="<%=totalRecord%>">
                                                <input type="text" hidden name="keyword" value="<%=keyword == null ? "" : keyword%>">
                                                <input type="text" hidden name="filter" value="<%=filter == null ? "" : filter%>">
                            <button type="submit" class="btn btn-primary" value="success">Confirm delete</button>
                        </form>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div id="id01" class="modal">--%>
<%--    <span><a>×</a></span>--%>
<%--    <div class="modal-content">--%>
<%--        <div class="container">--%>
<%--            <h1>Delete Account</h1>--%>
<%--            <p>Are you sure you want to delete your account?</p>--%>
<%--            <div class="clearfix">--%>

<%--                <button type="button"  class="cancelbtn"><a href="${pageContext.request.contextPath}/employees">Cancel</a></button>--%>
<%--                <form method="POST" action="/action_page.php">--%>
<%--                    <input type="text" hidden name="id" value="<%=id%>">--%>
<%--                    <input type="text" hidden name="confirm" value="success">--%>
<%--                <button type="submit"  class="deletebtn"><a href="${pageContext.request.contextPath}/employees/delete">Delete</a></button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
