<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/administrator/administrator-taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/administrator/administrator-css.jsp"%>
<title>Dashboard | Hardware IT Solution</title>

</head>
<body>

	<div class="page-container">

		<!-- sidebar -->
		<%@ include file="/WEB-INF/template/administrator/administrator-sidebar.jsp"%>

		<div class="page-content">
			
			<!-- horizontal navigation -->
			<%@ include file="/WEB-INF/template/administrator/administrator-horizontal-nav.jsp"%>

			<!-- breadcrumb -->
			<ul class="breadcrumb">
				<li class="active">Dashboard</li>
			</ul> <!-- .breadcrumb -->

			<!-- content title -->
			<div class="page-title">                    
				<h2><span class="fa fa-arrow-circle-o-left"></span> Dashboard</h2>
			</div> <!-- .page-title -->

			<!-- content -->
			<div class="page-content-wrap">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Panel Title</h3>
							</div>
							<div class="panel-body">
								<p>Dashboard Content</p>
							</div>
						</div>
					</div>
				</div>
			</div> <!-- .page-content-wrap -->

		</div> <!-- .page-content -->

	</div> <!-- .page-container -->

	<%@ include file="/WEB-INF/template/administrator/administrator-js.jsp"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebar-dashboard').addClass('active');
		});
	</script>
</body>
</html>