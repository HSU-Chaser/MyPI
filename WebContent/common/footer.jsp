<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<footer id="footer">
	<!--
				     Social Icons
				     
				     Use anything from here: http://fortawesome.github.io/Font-Awesome/cheatsheet/)
	-->
	<!--
	<ul class="actions">
		<li><a href="#" class="fa solo fa-twitter"><span>Twitter</span></a></li>
		<li><a href="#" class="fa solo fa-facebook"><span>Facebook</span></a></li>
		<li><a href="#" class="fa solo fa-google-plus"><span>Google+</span></a></li>
		<li><a href="#" class="fa solo fa-dribbble"><span>Dribbble</span></a></li>
		<li><a href="#" class="fa solo fa-pinterest"><span>Pinterest</span></a></li>
		<li><a href="#" class="fa solo fa-instagram"><span>Instagram</span></a></li>
	</ul>
	-->
	<!-- Menu -->
	
	<!-- effecter1_start -->
		<div class="md-modal md-effect-12" id="mailMd">
			<div class="md-content">
				<h3>Mail_Modal</h3>
				<div>
					<p>This is a modal to mail session</p>
					<!--
					<ul>
						<li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to read what they say.</li>
						<li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and appreciate its presence.</li>
						<li><strong>Close:</strong> click on the button below to close the modal.</li>
					</ul>
					-->
					<button class="button addButton font_GODOM md-close">Close me!</button>
				</div>
			</div>
		</div>
	<!-- effecter1_end -->
	<ul class="menu">
		<li>&copy; Copyright Team Chaser</li>
		<li>Cooperation:<a href="https://www.facebook.com/ihateflyingbugs"
			style="text-decoration: blink;">I Hate Flying Bugs</a></li>
		<li>Design: J, Develop: s, s, y, o</li>
		<li>Contact: <a class="md-trigger" data-modal="mailMd">hsuteamchaser@gmail.com</a></li>
	</ul>
	<!-- effecter2_start -->
		<div class="md-overlay"></div><!-- the overlay element -->
	
		<!-- classie.js by @desandro: https://github.com/desandro/classie -->
		<script src="js/effecter/classie.js"></script>
		<script src="js/effecter/modalEffects.js"></script>
	
		<!-- for the blur effect -->
		<!-- by @derSchepp https://github.com/Schepp/CSS-Filters-Polyfill -->
		<script>
			// this is important for IEs
			var polyfilter_scriptpath = '/js/';
		</script>
		<script src="js/effecter/cssParser.js"></script>
		<script src="js/effecter/css-filters-polyfill.js"></script>
	<!-- effecter2_end -->
</footer>