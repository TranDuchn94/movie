<%@ page import="org.hibernate.internal.util.StringHelper" %><%--  Created by IntelliJ IDEA.  User: ADMINS  Date: 2/2/2023  Time: 10:18 AM  To change this template use File | Settings | File Templates.--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <jsp:include page="../fragment/head-import.jsp" />
</head><body><div class="container-fluid">
    <div class="row justify-content-center align-items-center vh-100">
        <div class="col-11 col-sm-6 col-lg-4">
            <div class="border border-1 rounded">
                <h1 class="fs-5 fw-normal p-3 bg-light">Please sign in</h1>
                <%  String email = (String) request.getAttribute("email");
                    String password = (String) request.getAttribute("password");%>
                <form class="px-3" action="${pageContext.request.contextPath}/auth/login" method="post">
                    <div class="mb-3">
                        <input type="email" class="form-control" name="email" id="example" placeholder="Email" value="<%=(email != null) ? email : ""%>">
                    </div>
                    <div class="mb-3">
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" value="<%=(password != null) ? password : ""%>">
                    </div>
                    <div class="mb-3">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">Remember me</label>
                    </div>
                    <div class="mb-3">
                        <%
                            String errorMsg = (String) request.getAttribute("invalidAccountMsg");
                            if(errorMsg != null){ %>
                        <div> <%=errorMsg%></div>
                            <% } %>
                        <button type="submit" class="btn btn-success w-100">Login</button>
                    </div>
                </form>
                <div class="mb-3 px-3">
                    <a href="#" class="text-decoration-none">Click here to register</a>
                </div>
            </div>
        </div>
    </div>
</div><
script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
</script>
<script>

</script>
</body>
</html>