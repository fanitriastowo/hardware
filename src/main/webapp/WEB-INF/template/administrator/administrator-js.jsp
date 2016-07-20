<div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
	<div class="mb-container">
		<div class="mb-middle">
			<div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
			<div class="mb-content">
				<p>Are you sure you want to log out?</p>
				<p>Press No if youwant to continue work. Press Yes to logout current user.</p>
			</div>
			<div class="mb-footer">
				<div class="pull-right">
					<a href="<spring:url value="/logout" />" class="btn btn-success btn-lg">Yes</a>
					<button class="btn btn-default btn-lg mb-control-close">No</button>
				</div>
			</div>
		</div>
	</div>
</div>

<audio id="audio-alert" src='<spring:url value="/assets/administrator/audio/alert.mp3" />' preload="auto"></audio>
<audio id="audio-fail" src='<spring:url value="/assets/administrator/audio/fail.mp3" />' preload="auto"></audio>

<script type="text/javascript" src='<spring:url value="/assets/administrator/js/plugins/jquery/jquery.min.js" />'></script>
<script type="text/javascript" src='<spring:url value="/assets/administrator/js/plugins/jquery/jquery-ui.min.js" />'></script>
<script type="text/javascript" src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap.min.js" />'></script>

<script type='text/javascript' src='<spring:url value="/assets/administrator/js/plugins/icheck/icheck.min.js" />'></script>
<script type="text/javascript" src='<spring:url value="/assets/administrator/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js" />'></script>

<script type="text/javascript" src='<spring:url value="/assets/administrator/js/settings.js" />'></script>
<script type="text/javascript" src='<spring:url value="/assets/administrator/js/plugins.js" />'></script>
<script type="text/javascript" src='<spring:url value="/assets/administrator/js/actions.js" />'></script> 

<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-70128165-2', 'auto');
	ga('send', 'pageview');

</script>