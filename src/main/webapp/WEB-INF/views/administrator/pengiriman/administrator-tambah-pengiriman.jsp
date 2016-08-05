<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/administrator/administrator-taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/administrator/administrator-css.jsp"%>
<title>Tambah Pengiriman | Hardware IT Solution</title>

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
				<li><a href="#">Pengiriman</a></li>
				<li class="active">Tambah Pengiriman</li>
			</ul> <!-- .breadcrumb -->

			<!-- content title -->
			<div class="page-title">                    
				<h2><span class="fa fa-arrow-circle-o-left"></span> Tambah Pengiriman</h2>
			</div> <!-- .page-title -->

			<!-- content -->
			<div class="page-content-wrap">
				<div class="row">
					<div class="col-md-12">

						<form:form commandName="pengiriman" action="${pageContext.request.contextPath }/administrator/pengiriman/tambah_post" method="post" 
								   cssClass="form-horizontal" enctype="multipart/form-data" >
							
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Silahkan tambahkan data pengiriman ke member</h3>
							</div>
							<div class="panel-body">
							
								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Pemesanan ID</label>
									<div class="col-md-6 col-xs-12">
										<form:select path="pemesananId" cssClass="form-control select" data-live-search="true">
											<form:options items="${pemesananList }" itemValue="pemesananId" itemLabel="pemesananId" />
										</form:select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Email</label>
									<div class="col-md-6 col-xs-12">
										<form:select path="email" cssClass="form-control select" data-live-search="true">
											<form:options items="${userList }" itemValue="username" itemLabel="username" />
										</form:select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">No. Resi JNE</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"><span class="fa fa-sort-numeric-asc"></span></span>
											<form:input path="jneId" cssClass="form-control" placeholder="Inputkan Nomor Resi JNE"/>
										</div>
									</div>
								</div>								
								
								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Alamat</label>
									<div class="col-md-6 col-xs-12">
										<form:textarea path="alamatPengiriman" cssClass="form-control" cols="5" placeholder="Inputkan Alamat"/>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Kabupaten</label>
									<div class="col-md-6 col-xs-12">
										<form:select path="kabupaten" cssClass="form-control select" data-live-search="true">
											<form:option value="banyumas">Banyumas</form:option>
											<form:option value="banjarnegara">Banjarnegara</form:option>
											<form:option value="purbalingga">Purbalingga</form:option>
										</form:select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Tgl Pengiriman</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"><span class="fa fa-pencil"></span></span>
											<form:input path="tanggalPengiriman" cssClass="form-control datepicker" placeholder="Inputkan Tanggal Pengiriman"/>
										</div>
									</div>
								</div>								
								
								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">Status Pengiriman</label>
									<div class="col-md-6 col-xs-12">
										<form:select path="statusPengiriman" cssClass="form-control select">
											<form:option value="PROSES_PENGIRIMAN">Proses Pengiriman</form:option>
											<form:option value="BATAL_PENGIRIMAN">Pengiriman Dibatalkan</form:option>
										</form:select>
									</div>
								</div>
								
							</div>
							<div class="panel-footer">
								<button class="btn btn-default">Clear Form</button>                                    
								<button type="submit" class="btn btn-primary pull-right">Simpan</button>
							</div>
						</div>
						</form:form>
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
			$('#sidebar-pengiriman').addClass('active');
			$('#sidebar-tambah-pengiriman').addClass('active');
		});
	</script>
</body>
</html>