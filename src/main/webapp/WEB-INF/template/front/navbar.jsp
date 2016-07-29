<header class="navbar navbar-inverse navbar-fixed-top wet-asphalt" role="banner">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href='<spring:url value="/" />'><img src='<spring:url value="/assets/front/images/logo.png" />' alt="IT Solution Hardware"></a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-left center-block">
				<li>
					<form action='<spring:url value="/search_submit" />' class="navbar-form" role="search" method="post">
						<div class="input-group" id="search_form">
							<input type="text" class="form-control" placeholder="Pencarian Produk" id="search-bar" name="search-result">
							<span class="input-group-btn">
								<button class="btn btn-danger" type="submit">&nbsp;<span class="fa fa-search"></span></button>
							</span>
						</div>
					</form>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li id="cart">
					<a class="button" href='<spring:url value="/keranjang" /> '>
						<span class="fa fa-shopping-cart fa-2x"></span>
						<span id="product_total" class="label label-primary">0</span>
					</a>
				</li>
				<li id="guide"><a href='<spring:url value="/guide" /> '>Bantuan</a></li>

				<security:authorize access="!isAuthenticated()">
				<li id="member" class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Sudah jadi Member? <span class="fa fa-caret-down"></span></a>
					<ul class="dropdown-menu">
						<li><a href='<spring:url value="/login" />'>Login</a></li>
						<li><a href='<spring:url value="/registration" />'>Registrasi</a></li>
					</ul>
				</li>
				</security:authorize>

				<security:authorize access="isAuthenticated() AND hasRole('ROLE_MEMBER')">
				<li id="setting" class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						Profile&nbsp;<span class="fa fa-caret-down"></span></a>
					<ul class="dropdown-menu">
						<li><a href='<spring:url value="/setting" />'>Setting</a></li>
						<li><a href='<spring:url value="/logout" />'>Logout</a></li>
					</ul>
				</li>
				</security:authorize>
				<!-- <li id="contact"><a href='<spring:url value="/contact" />'>Hubungi Kami</a></li> -->
			</ul>
		</div> <!-- .collapse -->
	</div> <!-- .container -->
</header> <!--.header-->