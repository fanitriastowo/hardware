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
				<h2>Profile: <c:out value="${principal.nama }" /></h2>
				<p><strong>Username:</strong> <c:out value="${principal.username }" /> </p>
				<p><strong>Telepon:</strong> <c:out value="${principal.phone }" /> </p>
				<a href="#" class="btn btn-sm btn-default" disabled>
					<span class="fa fa-gear"></span>&nbsp;Ubah Profile</a>

				<hr />

				<h3>Pemesanan</h3>
				<table class="table table-hover table-striped table-condensed">
					<thead>
						<tr>
							<th width="5%">#</th>
							<th>Tanggal Pesan</th>
							<th>Pemesanan ID</th>
							<th>Nama Barang</th>
							<th>Jumlah Items</th>
							<th>Total</th>
							<th>Transfer?</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${pemesanans }" var="pemesanan" varStatus="index">
						<tr class="${pemesanan.transfer ? 'success' : 'error'  }">
							<td><c:out value="${index.count }" /> </td>
							<td><c:out value="${pemesanan.tanggalPemesanan }" /> </td>
							<td><c:out value="${pemesanan.pemesananId }" /> </td>
							<td><c:out value="${pemesanan.namaItem }" /> </td>
							<td><c:out value="${pemesanan.jumlahItems }" /> </td>
							<td><c:out value="${pemesanan.totalHarga }" /> </td>
							<td><strong><c:out value="${pemesanan.transfer ? 'Sudah' : 'Belum' }" /> </strong></td>
						</tr>
						</c:forEach>

					</tbody>
				</table>

				<hr />

				<h3>Pengiriman</h3>
				<table class="table table-hover table-striped table-condensed">
					<thead>
						<tr>
							<th width="5%">#</th>
							<th>Tanggal Pengiriman</th>
							<th>JNE ID</th>
							<th>Pemesanan ID</th>
							<th>Status Pengiriman</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${pengirimans }" var="pengiriman" varStatus="index">
						<tr class="${pengiriman.statusPengiriman == 'PROSES_PENGIRIMAN' ? 'success' : 'error'  }">
							<td><c:out value="${index.count }" /> </td>
							<td><c:out value="${pengiriman.tanggalPengiriman }" /> </td>
							<td><c:out value="${pengiriman.jneId }" /> </td>
							<td><c:out value="${pengiriman.pemesananEntity.pemesananId }" /> </td>
							<td><c:out value="${pengiriman.statusPengiriman }" /> </td>
						</tr>
						</c:forEach>

					</tbody>
				</table>
				<hr />

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