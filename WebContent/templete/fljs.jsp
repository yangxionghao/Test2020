<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
   <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<ul class="nav nav-tabs">
  <li role="presentation" ><a href="${pageContext.request.contextPath}/templete/tongji.jsp">综合检索</a></li>
  <li role="presentation" class="active"><a href="fljs.jsp">分类检索</a></li>
  <li role="presentation" ><a href="${pageContext.request.contextPath}/templete/tubiao.jsp">图表显示</a></li>
</ul>
  <label>————————请选择检索条件——————————</label>
   <%--分类检索--%>
                    <div class="tab-pane active" id="panel-169507">
                        <form  action="${pageContext.request.contextPath}/fljsServlet" method="post">
                            <div class="row-fluid">
                                <div class="span12">
                                    <h4 align="left" >分类检索条件
                                        <select id="jstj" class="form-control" style="height: 40px;display: inline;width:200px;" name="jstj">
                                            <option value ="0">--请选择--</option>
                                            <option value="jgmc">机构全称</option>
                                            <option value="gkglbm">归口管理单位</option>
                                            <option value="szdy">所在地域</option>
                                            <option value="frdb">法人代表</option>
                                            <option value="lxr">联系人</option>
                                            <option value="jgsx">机构属性</option>
                                            <option value="jsxqmc">技术需求名称</option>
                                            <option value="gjz">关键字</option>
                                            <option value="ntrzjze">拟投入资金总额</option>
                                            <option value="jsxqjjfs">技术需求解决方式</option>
                                            <option value="kjhdlx">科技活动类型</option>
                                            <option value="xkfl">学科分类</option>
                                            <option value="xqjsssly">需求技术所属领域</option>
                                            <option value="xqjsyyhy">需求技术应用行业</option>
                                        </select>
                                        <input type="text" class="form-control" name="value" id="value" style="width:250px;height: 40px;display: inline" value="${value}">
                                    </h4>
                                    <h4>
                                        检索要求
                                        <select id="jsyq" class="form-control" style="width: 200px;height: 40px;display: inline" name="jsyq" >
                                            <option value = "0">模糊查询</option>
                                            <option value = "1">精确查询</option>
                                        </select>

     
                                        <input type="submit" class="btn btn-success" style="width: 200px;height:30px;position: relative;left: 100px" value="查询">
                                    </h4>
                                </div>

                            </div>
                        </form>
                        <div class="row-fluid">
                            <div class="span12">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>需求名称</th>
                                        <th>学科分类</th>
                                        <th>归口管理单位</th>
                                        <th>机构全称</th>
                                        <th>机构属性</th>
                                        <th>法人代表</th>
                                        <th>联系人</th>
                                        <th>所在地域</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="m" items="${list}">
                                        <tr>
                                            <td>${m.jsxqmc}</td>
                                            <td>${m.xkfl}</td>
                                            <td>${m.gkglbm}</td>
                                            <td>${m.jgmc}</td>
                                            <td>${m.jgsx}</td>
                                            <td>${m.frdb}</td>
                                            <td>${m.lxr}</td>
                                            <td>${m.szdy}</td>
                                            <td><a href="${pageContext.request.contextPath}/xssh1_Servlet?wjid=${m.wjid}&sy=fljs"><button class="btn btn-success">查看</button></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                       
                    </div>
</body>
</html>