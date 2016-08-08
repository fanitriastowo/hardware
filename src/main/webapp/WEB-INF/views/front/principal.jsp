<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/front/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/front/css.jsp"%>
<title>Profile Member | Hardware IT Solution</title>

</head>
<body>

	<%@ include file="/WEB-INF/template/front/navbar.jsp"%>
	<section>
		<div class="container">
			<div class="row">
				<h2>Settings</h2>
				<p><c:out value="${principal.username }" /> </p>
				<p><c:out value="${principal.nama }" /> </p>
				<p><c:out value="${principal.phone }" /> </p>
			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/template/front/footer.jsp"%>
	<%@ include file="/WEB-INF/template/front/js.jsp"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#setting").addClass("active");
		});
	</script>
	
</body>
</html>