<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/front/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/front/css.jsp"%>
<title>Guide | Hardware IT Solution</title>

</head>
<body>

	<%@ include file="/WEB-INF/template/front/navbar.jsp"%>
	<section>
		<div class="container">
			<div class="row">
				<h1>This is Contact Page</h1>
			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/template/front/footer.jsp"%>
	<%@ include file="/WEB-INF/template/front/js.jsp"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#contact').addClass('active');
		});
	</script>
	
</body>
</html>