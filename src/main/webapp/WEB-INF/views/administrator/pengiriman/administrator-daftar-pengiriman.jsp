<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/administrator/administrator-taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/administrator/administrator-css.jsp"%>
<title>Daftar Pengiriman | Hardware IT Solution</title>

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
				<li class="active">Daftar Pengiriman</li>
			</ul> <!-- .breadcrumb -->

			<!-- content title -->
			<div class="page-title">                    
				<h2><span class="fa fa-arrow-circle-o-left"></span> Daftar Pengiriman</h2>
			</div> <!-- .page-title -->

			<!-- content -->
			<div class="page-content-wrap">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Pengiriman hari ini</h3>
							</div>
							<div class="panel-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th width="3%">#</th>
											<th>Tanggal</th>
											<th>JNE ID</th>
											<th>Nama Lengkap</th>
											<th>Email</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${pengirimanList }" var="pengiriman" varStatus="index">
										<tr>
											<td><c:out value="${index.count }" /></td>
											<td><c:out value="${pengiriman.tanggalPengiriman }" /></td>
											<td><c:out value="${pengiriman.jneId }" /></td>
											<td><c:out value="${pengiriman.pemesananEntity.namaPenerima }" /></td>
											<td><c:out value="${pengiriman.userEntity.username }" /></td>
											<td>
												<c:choose>
													<c:when test="${pengiriman.statusPengiriman eq 'PROSES_PENGIRIMAN' }">
														<label class="label label-success"><c:out value="${pengiriman.statusPengiriman }" /></label>
													</c:when>
													<c:otherwise>													
														<label class="label label-danger"><c:out value="${pengiriman.statusPengiriman }" /></label>
													</c:otherwise>
												</c:choose>
											<td>
												<a href='<spring:url value="/administrator/pengiriman/cetak_detail/${pengiriman.id}" />' title="Lihat Detail Pengiriman" class="btn btn-info btn-rounded btn-sm"><span class="fa fa-search"></span></a>
											</td>
										</tr>
										</c:forEach>

									</tbody>
								</table>
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
			$('#sidebar-pengiriman').addClass('active');
			$('#sidebar-daftar-pengiriman').addClass('active');
		});
	</script>
</body>
</html>