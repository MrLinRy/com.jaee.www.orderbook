<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/view/admin/nav.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div>
            <h1 class="page-header">添加课程</h1>
        </div>
        <div class="panel-heading">
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        课程信息
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <form action="${pageContext.request.contextPath}/course.do/add" method="get">
                                <label>课程名</label>
                                <input class="form-control" name="courseTitle">
                                <label>学分</label>
                                <input type="number" class="form-control" name="credits">
                                <label>所属专业</label>
                                <select class="form-control" name="speciality">
                                    <c:forEach var="specName" items="${specNameList}">
                                        <option>${specName}</option>
                                    </c:forEach>
                                </select>
                                <label>课程类型</label>
                                <select class="form-control" name="type">
                                    <option>必修课/公共课</option>
                                    <option>选修课/公共课</option>
                                    <option>限选课/专业课</option>
                                    <option>选修课/专业课</option>
                                </select>
                                <label></label>
                                <button type="submit"
                                        class="btn btn-primary form-control">添加
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

<script language="JavaScript" type="text/javascript">
    
</script>

<!-- /#wrapper -->
<jsp:include page="/bottom.jsp"></jsp:include>
