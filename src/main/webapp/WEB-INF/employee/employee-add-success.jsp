<%--
  Created by IntelliJ IDEA.
  User: knigh
  Date: 05/02/2023
  Time: 4:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% String pageNumber = (String) request.getAttribute("pageNumber");
        String keyword = (String) request.getAttribute("keyword");
        String filter = (String) request.getAttribute("filter");
        String success = (String) request.getAttribute("success");
    %>
    <title><%=success%>success</title>

    <jsp:include page="../fragment/head-import.jsp"/>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../fragment/header.jsp"/>
    <div class="modal" tabindex="-1" role="dialog" style="display: block">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><%=success%> Success !!!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <%if(keyword == null || keyword.length() == 0 || "added".equalsIgnoreCase(success)) { %>
                            <span aria-hidden="true"><a href="${pageContext.request.contextPath}/employees?pageNumber=<%=pageNumber%>">x</a></span>
                        <% } else {%>
                                <span aria-hidden="true"><a href="${pageContext.request.contextPath}/employees/search?pageNumber=<%=pageNumber%>&keyword=<%=keyword%>&filter=<%=filter%>">x</a></span>
                        <% } %>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Your account has been <%=request.getAttribute("success")%> :)</p>
                </div>
                <div class="modal-footer">
                    <%String id = (String) request.getAttribute("id");%>
                    <%if(keyword == null || keyword.length() == 0 || "added".equalsIgnoreCase(success)) { %>
                        <button type="submit" class="btn btn-secondary" data-dismiss="modal"><a
                                href="${pageContext.request.contextPath}/employees?pageNumber=<%=pageNumber%>" style="text-decoration: none">Close</a></button>
                    <% } else {%>
                            <button type="submit" class="btn btn-secondary" data-dismiss="modal"><a
                            href="${pageContext.request.contextPath}/employees/search?pageNumber=<%=pageNumber%>&keyword=<%=keyword%>&filter=<%=filter%>" style="text-decoration: none">Close</a></button>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
<%--    <div class="container-fluid">--%>
<%--        <jsp:include page="../fragment/header.jsp"/>--%>
<%--        <div class="modal-body">--%>
<%--            <p class="text-danger">Your account has been deleted !!!.</p>--%>
<%--        </div>--%>
<%--        <div class="modal-footer">--%>
<%--            <%String id = (String) request.getAttribute("id");%>--%>
<%--            <form method="GET" action="${pageContext.request.contextPath}/employees">--%>
<%--                <button type="submit" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">

</script>
</body>
</html>
