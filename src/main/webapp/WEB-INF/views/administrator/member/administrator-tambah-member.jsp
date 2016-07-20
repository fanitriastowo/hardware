<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/administrator/administrator-taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/administrator/administrator-css.jsp"%>
<title>Tambah Member | Hardware IT Solution</title>

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
				<li class="active">Tambah Member</li>
			</ul> <!-- .breadcrumb -->

			<!-- content title -->
			<div class="page-title">                    
				<h2><span class="fa fa-arrow-circle-o-left"></span> Tambah Member</h2>
			</div> <!-- .page-title -->

			<!-- content -->
			<div class="page-content-wrap">
				<div class="row">
					<div class="col-md-12">
						
						<!-- form -->
						<form action="" class="form-horizontal">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Tambah Member</h3>
							</div>
							<div class="panel-body">

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Nama Lengkap</label>
									<div class="col-md-6 col-xs-12">                                            
										<div class="input-group">
											<span class="input-group-addon"><span class="fa fa-pencil"></span></span>
											<input type="text" class="form-control" placeholder="Inputkan nama lengkap member"/>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Tanggal Lahir</label>
									<div class="col-md-6 col-xs-12">                                            
										<div class="input-group">
											<span class="input-group-addon"><span class="fa fa-calendar"></span></span>
											<input type="text" class="form-control datepicker" placeholder="Inputkan tanggal lahir member">
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Jenis Kelamin</label>
									<div class="col-md-6 col-xs-12">
										<div class="radio">
											<label>
												<input type="radio" name="jenis_kelamin" id="laki-laki" value="L" checked/>
												Laki-Laki
											</label>
										</div>
										<div class="radio">
											<label>
												<input type="radio" name="jenis_kelamin" id="perempuan" value="P"/>
												Perempuan
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">No. Telepon</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"><span class="fa fa-phone"></span></span>
											<input type="text" class="form-control" placeholder="Inputkan no. telepon member"/>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Email</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"><span class="fa fa-envelope"></span></span>
											<input type="text" class="form-control" placeholder="Inputkan email member"/>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Password</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"><span class="fa fa-lock"></span></span>
											<input type="password" class="form-control" placeholder="Inputkan password baru member"/>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Confirm Password</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"><span class="fa fa-lock"></span></span>
											<input type="password" class="form-control" placeholder="Inputkan konfirmasi password member"/>
										</div>
									</div>
								</div>
									
							</div>
							<div class="panel-footer">
								<button class="btn btn-default">Clear Form</button>
								<button type="submit" class="btn btn-primary pull-right">Simpan</button>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div> <!-- .page-content-wrap -->

		</div> <!-- .page-content -->

	</div> <!-- .page-container -->

	<%@ include file="/WEB-INF/template/administrator/administrator-js.jsp"%>
	<script type="text/javascript" src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap-datepicker.js" />'></script>
	<script type="text/javascript" src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap-file-input.js" />'></script>
	<script type="text/javascript" src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap-select.js" />'></script>
	<script type="text/javascript" src='<spring:url value="/assets/administrator/js/plugins/tagsinput/jquery.tagsinput.min.js" />'></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebar-member').addClass('active');
			$('#sidebar-tambah-member').addClass('active');
		});
	</script>
</body>
</html>