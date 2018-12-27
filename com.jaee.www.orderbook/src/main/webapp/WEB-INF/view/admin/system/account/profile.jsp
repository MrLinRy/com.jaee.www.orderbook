<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String s = (String)session.getAttribute("username");
	if(s.equals("supplier")){
		%>
		<jsp:include page="/WEB-INF/view/supplier/nav.jsp" ></jsp:include>
		<% 
	}else if(s.equals("student")){
		%>
		<jsp:include page="/WEB-INF/view/student/nav.jsp" ></jsp:include>
		<% 
	}else if(s.equals("admin")){
		%>
		<jsp:include page="/WEB-INF/view/admin/nav.jsp" ></jsp:include>
		<% 
	}else{
		%>
		<jsp:include page="/WEB-INF/view/teacher/nav.jsp" ></jsp:include>
		<%
	}
%>
<!-- Page Content -->

<div id="page-wrapper">
    <div class="container-fluid">
        <div>
            <h1 class="page-header">个人信息</h1>
        </div>
        <div class="panel-heading">
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        个人信息
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <form action="${pageContext.request.contextPath}/account.do/update" method="get">
                                
                                <label>用户名</label>
                                <input class="form-control" name="userId">
                                <label>邮箱</label>
                                 <input class="form-control" name="email">
                                <label>新密码</label>
                                <input class="form-control" name="password">
                                <label></label>
                                
                                <button type="submit"
                                        class="btn btn-primary form-control">修改
                                </button>
                            </form>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>

    <!-- /.container-fluid -->
</div>
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<jsp:include page="/bottom.jsp"></jsp:include>
