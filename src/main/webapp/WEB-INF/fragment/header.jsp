<%@ page import="fa.training.constants.AppConstant" %>
<ul class="nav justify-content-between border-start border-bottom border-muted bg-light row" id="header">
    <li class="nav-item w-25 d-flex justify-content-start">
        <!-- aria-current="page"  -->
        <span class="d-flex nav-link text-muted align-items-center pe-1 ps-1"><i
                class="fa-solid fa-users"></i></span>
        <a class="nav-link active text-muted ps-1" href="${pageContext.request.contextPath}/employees">
            Employee</a>
    </li>
    <li class="nav-item w-75 d-flex justify-content-end">
        <div class="nav-link">
            <%String account = (String) request.getSession().getAttribute(AppConstant.ACCOUNT_LOGIN);%>
            <span class="text-muted">Welcome <%=account %></span>
        </div>
        <div class="nav-link">
            <a href="${pageContext.request.contextPath}/auth/logout" class="text-muted text-decoration-none"><i
                    class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>
    </li>
</ul>