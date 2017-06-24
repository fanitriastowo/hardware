<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/template/front/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

   <%@ include file="/WEB-INF/template/front/css.jsp" %>
   <title>Forbidden | Hardware IT Solution</title>

</head>
<body>
<%@ include file="/WEB-INF/template/front/navbar.jsp" %>

<section id="error" class="container">
   <h1>Ooppss, Suatu kesalahan terjadi.</h1>
   <p>Mohon maaf atas ketidaknyamanan Anda. Kami akan segera memperbaiki kesalahan tersebut.</p>
   <a class="btn btn-success" href='<spring:url value="/" />'>BERANDA</a>
</section> <!--/#error-->

<%@ include file="/WEB-INF/template/front/footer.jsp" %>
<%@ include file="/WEB-INF/template/front/js.jsp" %>

</body>
</html>