<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/administrator/administrator-taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/administrator/administrator-css.jsp"%>
<title>Daftar Member | Hardware IT Solution</title>

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
				<li><a href="#">Member</a></li>                    
				<li class="active">Daftar Member</li>
			</ul> <!-- .breadcrumb -->
			
			<!-- content title -->
			<div class="page-title">                    
				<h2><span class="fa fa-arrow-circle-o-left"></span> Daftar Member</h2>
			</div> <!-- .page-title -->
			
			<!-- content -->
			<div class="page-content-wrap">
				<div class="row">
					<div class="col-md-12">
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Daftar Member</h3>
							</div>
							<div class="panel-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th width="3%">#</th>
											<th>Nama Lengkap</th>
											<th width="5%">L/P</th>
											<th>No Telepon</th>
											<th>email</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1.</td>
											<td>Fani Triastowo</td>
											<td>L</td>
											<td>0857-4750-5359</td>
											<td>fani.triastowo@gmail.com</td>
											<td>
												<a class="btn btn-default btn-rounded btn-sm" href="#"><span class="fa fa-pencil"></span></a>
												<a class="btn btn-danger btn-rounded btn-sm" href="#"><span class="fa fa-times"></span></a>
											</td>
										</tr>
										<tr>
											<td>2.</td>
											<td>Angga Rokasiwi</td>
											<td>L</td>
											<td>0857-4568-3245</td>
											<td>angga.rokasiwi@gmail.com</td>
											<td>
												<a class="btn btn-default btn-rounded btn-sm" href="#"><span class="fa fa-pencil"></span></a>
												<a class="btn btn-danger btn-rounded btn-sm" href="#"><span class="fa fa-times"></span></a>
											</td>
										</tr>
										<tr>
											<td>3.</td>
											<td>Katy Perry</td>
											<td>P</td>
											<td>089-789-544</td>
											<td>katy.perry@gmail.com</td>
											<td>
												<a class="btn btn-default btn-rounded btn-sm" href="#"><span class="fa fa-pencil"></span></a>
												<a class="btn btn-danger btn-rounded btn-sm" href="#"><span class="fa fa-times"></span></a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>

				</div>
			</div> <!-- .page-content-wrap -->
		</div>
	
	</div>

	<%@ include file="/WEB-INF/template/administrator/administrator-js.jsp"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebar-member').addClass('active');
			$('#sidebar-daftar-member').addClass('active');
		});
	</script>
</body>
</html>