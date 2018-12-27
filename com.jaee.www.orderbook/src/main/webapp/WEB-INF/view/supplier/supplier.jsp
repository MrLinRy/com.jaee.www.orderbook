<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String s = (String)session.getAttribute("username");
	if(s.equals("supplier")){
		%>
		<jsp:include page="/WEB-INF/view/supplier/nav.jsp" ></jsp:include>
		<% 
	}else{
		%>
		<jsp:include page="/WEB-INF/view/student/nav.jsp" ></jsp:include>
		<% 
	}
%>


<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">审批公告</h1>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            审批公告
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <form method="post" action="/">
                                    <table class="table table-hover"
                                           id="dataTables-example">
                                        <thead>
                                        <tr>
                                            <th>书名</th>
                                            <th>ISBN</th>
                                            <th>印刷日期</th>
                                            <th>作者</th>
                                            <th>出版社</th>
                                            <th>数量</th>
                                            <th>状态</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="reviewedBook" items="${reviewedBookList}">
                                            <tr>
                                                <td>${reviewedBook.bookTitle}</td>
                                                <td>${reviewedBook.isbn}</td>
                                                <td>${reviewedBook.dateOfPrinting}</td>
                                                <td>${reviewedBook.author}</td>
                                                <td>${reviewedBook.press}</td>
                                                <td>${reviewedBook.count}</td>
                                                <td>${reviewedBook.count}</td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                    <a href="${pageContext.request.contextPath}/supplier.do/office.view" class="btn btn-primary" role="button" onclick="return confirm('是否要导出为表格到桌面')">导出表格</a>
                                
                                </form>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row-->
        </div>

    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
</div>
<!-- /#wrapper -->
<jsp:include page="/bottom.jsp"></jsp:include>

