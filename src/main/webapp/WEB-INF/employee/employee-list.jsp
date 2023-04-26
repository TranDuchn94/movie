<%@ page import="java.util.List" %>
<%@ page import="fa.training.modal.entities.Employee" %>
<%@ page import="fa.training.modal.entities.Account" %>
<%@ page import="fa.training.constants.AppConstant" %><%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 2/3/2023
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Long totalRecord = (Long) request.getAttribute(AppConstant.TOTAL_RECORD);
    Long totalPage = (Long) request.getAttribute(AppConstant.PAGE_TOTAL);
    Long pageNumber = (Long) request.getAttribute(AppConstant.PAGE_NUMBER);
%>
<html>
<head>
    <title>Employees</title>
    <jsp:include page="../fragment/head-import.jsp"/>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../fragment/header.jsp"/>
    <div class="row vh-100">

<%--        <jsp:include page="../fragment/aside-left.jsp"/>--%>

    <div id="side-menu"
         class="col-sm-4 col-md-3 col-xl-2 border-start border-end border-muted bg-light overflow-hidden">
        <ul class="list-group row">
            <a class="border-start-0 border-end-0 border-top-0 rounded-0 list-group-item list-group-item-action
                                text-primary text-left d-block bg-light pt-2 pb-2 text-nowrap text-decoration-none btn-hover"
               href="${pageContext.request.contextPath}/employees"><i class="fa fa-dashboard"></i> Dashboard</a>
            <li class="border-start-0 border-end-0 border-top-0 rounded-0 p-0 dropdown list-group-item d-flex">
                <button
                        class="btn btn-light border-0 dropdown-toggle w-100 h-100 rounded-0 text-primary text-start"
                        type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="ps-1 fa-sharp fa-solid fa-chart-column"></i> Employee Managing
                </button>
                <ul class="dropdown-menu shadow border-0 w-100 bottom-100 p-0 m-0"
                    aria-labelledby="dropdownMenuButton1">
                    <li><a class="d-block dropdown-item border-bottom border-muted bg-light btn-hover text-primary"
                           href="${pageContext.request.contextPath}/employees">
                        <i class="ps-2 fa-solid fa-list-ul"></i>
                        Employee List</a></li>
                    <li><a class="d-block dropdown-item border-bottom border-muted bg-light btn-hover text-primary"
                           href="${pageContext.request.contextPath}/employees/add?pageNumber=<%=pageNumber%>&totalRecord=<%=totalRecord%>"><i class="ps-2 fa-solid fa-plus"></i>
                        Add Employee</a></li>
                </ul>
            </li>
        </ul>
    </div>
        <div class="col-sm-8 col-md-9 col-xl-10 bg-white pb-3">
            <div class="p-2">
                <h1 class="pt-3 pb-3 border-bottom border-muted mb-3">Employee List</h1>
                <jsp:include page="../fragment/search.jsp"/>
                <div id="total-employee">
                    <p><i>Total employee: <%= totalRecord ==null ? 0 : totalRecord%> </i></p>
                    <% if(totalPage != null) {%>
                    <p><i>Page: <%= pageNumber%>/<%= totalPage.longValue()%> </i></p>
                    <% } %>
                    <form method="GET" action="${pageContext.request.contextPath}/employees">
                        <label for="pageNumber">Page:</label>
                        <input id="pageNumber" name="pageNumber" type="number" min="1" max="<%= totalPage%>">
                        <input type="submit" value="GO">
                    </form>
                </div>
                <table id="employee-table" class="table table-striped table-bordered">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Date of birth</th>
                        <th>Address</th>
                        <th>Phone number</th>
                        <th>Department</th>
                        <th>Account</th>
                        <th>Action</th>
                    </tr>
                    <% List<Employee> employees = (List<Employee>) request.getAttribute("employees");
                        for (int i = 0; i < employees.size(); i++) {
                            Employee employee = employees.get(i);
                    %>
                    <tr>
                        <td><%=i +1+ (pageNumber-1)*5 %></td>
                        <td><a href="${pageContext.request.contextPath}/employees/view?id=<%=employee.getId()%>"><%=employee.getFirstName() + " " + employee.getLastName()%></a></td>
                        <td><%=employee.getDateOfBirth()%></td>
                        <td><%=employee.getAddress()%></td>
                        <td><%=employee.getPhone()%></td>
                        <td><%=employee.getDepartmentName()%></td>
                        <td><%=employee.getAccount().getAccount()%></td>
                        <td>
                            <a class="text-primary text-decoration-none" href="${pageContext.request.contextPath}/employees/view?id=<%=employee.getId()%>&pageNumber=<%=pageNumber%>"><i class="fa-solid fa-eye"></i>
                                View</a> |
                            <a class="text-warning text-decoration-none"
                               href="${pageContext.request.contextPath}/employees/update?id=<%=employee.getId()%>&pageNumber=<%=pageNumber%>"><i
                                    class="fas fa-edit"></i> Update</a> |
                            <a class="text-danger text-decoration-none"
                               href="${pageContext.request.contextPath}/employees/delete?id=<%=employee.getId()%>&pageNumber=<%=pageNumber%>&totalRecord=<%=totalRecord%>"><i
                                    class="fa-solid fa-trash-can"></i> Delete</a>
                        </td>
                    </tr>
                    <% } %>
                </table>
<%--                paging without keyword search , display all employee--%>

                <nav id="pagination" aria-label="Page navigation">
                    <ul class="pagination">
<%--                        check appear previous button--%>
                        <% if(pageNumber > 1){ %>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=pageNumber-1%>">Previous</a></li>
                        <% } %>

                        <% if(totalPage <= 5){
                            for(int i = 1; i<=totalPage; i++){
                                if(i == pageNumber){%>
                                    <li class="page-item"><a style="background-color: dodgerblue;color: white" class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=i%>"><%=i%></a></li>
                            <%} else{%>
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=i%>"><%=i%></a></li>
                            <%}
                            }
                        } else if (totalPage > 5 && pageNumber <3) {
                            for(int i = 1; i<=5; i++){
                                if(i == pageNumber){%>
                                    <li class="page-item"><a style="background-color: dodgerblue;color: white" class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=i%>"><%=i%></a></li>
                            <%}else{%>
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=i%>"><%=i%></a></li>
                            <%}
                            }
                        } else if (totalPage > 5 && pageNumber >=3 && pageNumber < totalPage -1){
                            for(int i = 0; i<5; i++){
                                if(i == 2){%>
                                    <li class="page-item"><a style="background-color: dodgerblue;color: white" class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=pageNumber-2+i%>"><%=pageNumber-2+i%></a></li>
                            <%} else{%>
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=pageNumber-2+i%>"><%=pageNumber-2+i%></a></li>
                            <%}
                            }
                        }else{
                            for(long i = totalPage-4; i<=totalPage; i++){
                                if(i == pageNumber){%>
                                    <li class="page-item"><a style="background-color: dodgerblue;color: white" class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=i%>"><%=i%></a></li>
                            <%}else{%>
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=i%>"><%=i%></a></li>
                            <%}
                            }
                        }%>

                        <% if(pageNumber < totalPage){%>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees?pageNumber=<%=pageNumber+1%>">Next</a></li>
                        <% }%>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">
</script>
</body>
</html>
