<div class="page-sidebar">
	<ul class="x-navigation">

		<li class="xn-logo">
			<a href='<spring:url value="/" />'>HARDWARE</a>
			<a href="#" class="x-navigation-control"></a>
		</li>

		<!-- Dashboard -->
		<li class="xn-title">Dashboard</li>
		<li id="sidebar-dashboard"><a href='<spring:url value="/administrator/dashboard" />'><span class="fa fa-desktop"></span> <span class="xn-text">Summary</span></a></li>

		<!-- Transaksi -->
		<li class="xn-title">Transaksi</li>
		<li id="sidebar-pemesanan">
			<a href='<spring:url value="/administrator/pemesanan" />'>
				<span class="fa fa-shopping-cart"></span> <span class="xn-text">Pemesanan</span></a>
		</li>
		<li id="sidebar-pengiriman" class="xn-openable">
			<a href="#"><span class="fa fa-truck"></span> <span class="xn-text">Pengiriman</span></a>
			<ul>
				<li id="sidebar-daftar-pengiriman">
					<a href='<spring:url value="/administrator/pengiriman" />'>
						<span class="fa fa-align-justify"></span> <span class="xn-text">Daftar Pengiriman</span></a>
				</li>
				<li id="sidebar-tambah-pengiriman">
					<a href='<spring:url value="/administrator/pengiriman/tambah" />'>
						<span class="fa fa-plus-square-o"></span> <span class="xn-text">Input Pengiriman</span></a>
				</li>
			</ul>
		</li>

		<!-- Master -->
		<li class="xn-title">Master</li>
		<li id="sidebar-produk" class="xn-openable">
			<a href="#"><span class="fa fa-th-large"></span> <span class="xn-text">Produk</span></a>
			<ul>
				<li id="sidebar-daftar-produk"><a href='<spring:url value="/administrator/produk" />'><span class="fa fa-align-justify"></span> Daftar Produk</a></li>
				<li id="sidebar-tambah-produk"><a href='<spring:url value="/administrator/produk/tambah" />'><span class="fa fa-plus-square-o"></span> Tambah Produk</a></li>
			</ul>
		</li>
		<li id="sidebar-kategori" class="xn-openable">
			<a href="#"><span class="fa fa-archive"></span> <span class="xn-text">Kategori</span></a>
			<ul>
				<li id="sidebar-daftar-kategori"><a href='<spring:url value="/administrator/kategori" />'><span class="fa fa-align-justify"></span> Daftar Kategori</a></li>
				<li id="sidebar-tambah-kategori"><a href='<spring:url value="/administrator/kategori/tambah" />'><span class="fa fa-plus-square-o"></span> Tambah Kategori</a></li>
			</ul>
		</li>
		<li id="sidebar-brand" class="xn-openable">
			<a href="#"><span class="fa fa-linux"></span> <span class="xn-text">Brands</span></a>
			<ul>
				<li id="sidebar-daftar-brand"><a href='<spring:url value="/administrator/brand" />'><span class="fa fa-align-justify"></span> Daftar Brands</a></li>
				<li id="sidebar-tambah-brand"><a href='<spring:url value="/administrator/brand/tambah" />'><span class="fa fa-plus-square-o"></span> Tambah Brands</a></li>
			</ul>
		</li>
		<li id="sidebar-member" class="xn-openable">
			<a href="#"><span class="fa fa-users"></span> <span class="xn-text">Member</span></a>
			<ul>
				<li id="sidebar-daftar-member"><a href='<spring:url value="/administrator/member" />'><span class="fa fa-align-justify"></span> Daftar Member</a></li>
				<li id="sidebar-tambah-member"><a href='<spring:url value="/administrator/member/tambah" />'><span class="fa fa-plus-square-o"></span> Tambah Member</a></li>
			</ul>
		</li>

		<!-- Setting -->
		<!-- 
		<li class="xn-title">Setting</li>
		<li id="sidebar-setting"><a href='<spring:url value="/administrator/setting" />'><span class="fa fa-gear"></span><span class="xn-text">Setting</span></a></li>
		-->
	</ul>
</div> <!-- .page-sidebar -->