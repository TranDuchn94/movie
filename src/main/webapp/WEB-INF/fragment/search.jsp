<%--
  Created by IntelliJ IDEA.
  User: knigh
  Date: 04/02/2023
  Time: 3:33 CH
  To change this template use File | Settings | File Templates.
--%>
<% String filter =(String) request.getAttribute("filter");
    String keyword =(String) request.getAttribute("keyword");
%>
<form class="mt-1 mb-3 d-flex justify-content-end align-items-center" id="user-search"
       method="GET" action="${pageContext.request.contextPath}/employees/search">
    <div class="input-group me-2 w-25">
        <div class="input-group-prepend ">
            <label class="bg-light rounded-0 rounded-start h-100 input-group-text"
                   for="search-content"><i class="fa fa-magnifying-glass"></i></label>
        </div>
        <input type="search" name="keyword" id="search-content" class="form-control ps-2"
               placeholder="User Search" aria-label="search" aria-describedby="user-search"
               value="<%=keyword != null ? keyword : ""%>">
    </div>
    <div style="width: 18%" class="input-group p-0 me-2 dropdown d-flex">
        <div class="input-group-prepend w-50 border rounded-start border-end-0">
            <label for="search-filter" class="bg-light border-0 h-100 input-group-text">
                <i class="fa-solid fa-filter"></i> &nbsp;Filter By</label>
        </div>
        <select id="search-filter" name="filter" class="form-select w-50 rounded-start-0">
            <option value="name" <%=filter != null ? "name".equalsIgnoreCase(filter) ? "selected" :"" : ""%>>Name</option>
            <option value="account" <%=filter != null ? "account".equalsIgnoreCase(filter) ? "selected" :"" : ""%>>Account</option>
            <option value="email" <%=filter != null ? "email".equalsIgnoreCase(filter) ? "selected" :"" : ""%>>email</option>
            <option value="phone" <%=filter != null ? "phone".equalsIgnoreCase(filter) ? "selected" :"" : ""%>>phone</option>
        </select>
    </div>
    <button style="width: 8%" type="submit" class="btn btn-primary">Search</button>
</form>
