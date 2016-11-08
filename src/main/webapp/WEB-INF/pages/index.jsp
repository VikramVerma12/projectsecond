
<%@ include file="header.jsp"%>
<style>
p {
    font-family: "Times New Roman", Times, serif;
}
</style>

<div>
<div id="notBar">
	
</div>
<script type="text/javascript">
	$(function() {
		setTimeout(function() {
			return $(".bar").animate({
				height : "toggle"
			}, "slow")
		}, 450);
		return $("#ok").on("click", function() {
			$("#barwrap").css("margin-bottom", "0px");
			$(".bar").animate({
				height : "toggle"
			}, "slow");
			return !1
		})
	});
</script>
<section id="about-us">
	<div class="container">

		<!-- about us slider -->
		<br>
		<br>
		<div id="about-slider">
			<div id="carousel-slider" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators visible-xs">
					<li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-slider" data-slide-to="1"></li>
					<li data-target="#carousel-slider" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner">
					<div class="item active">
						<img src="resources/images/niit1.jpg" class="img-responsive"
							alt="">
					</div>
					<div class="item">
						<img src="resources/images/niit2.jpg" class="img-responsive"
							alt="">
					</div>
					<div class="item">
						<img src="resources/images/niit3.jpg" class="img-responsive"
							alt="">
					</div>
				</div>

				<a class="left carousel-control hidden-xs" href="#carousel-slider" role="button" aria-hidden="true"
					data-slide="prev"> <i class="fa fa-angle-left"></i>
				</a> <a class=" right carousel-control hidden-xs" role="button" aria-hidden="true"
					href="#carousel-slider" data-slide="next"> <i
					class="fa fa-angle-right"></i>
				</a>
			</div>
			<!--/#carousel-slider-->
		</div>
		<!--/#about-slider-->


		<!-- Our Skill -->
		<div class="skill-wrap clearfix" >

			<div class="center wow fadeInDown">
				<h2>Our Learning Domains</h2>
				<p class="lead">Corporate Learning Group (CLG), Skills and
					Careers Group (SCG), School Learning Group (SLG), NIIT Imperia
					collaborated with KPMG India , IFBI</p>
			</div>

			<div class="row">

				<div class="col-sm-3">
					<div class="sinlge-skill wow fadeInDown" data-wow-duration="1000ms"
						data-wow-delay="300ms">
						<div class="joomla-skill">
							<p>
								<em>85%</em>
							</p>
							<p>Corporate Learning</p>
						</div>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="sinlge-skill wow fadeInDown" data-wow-duration="1000ms"
						data-wow-delay="600ms">
						<div class="html-skill">
							<p>
								<em>95%</em>
							</p>
							<p>Skills and Careers</p>
						</div>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="sinlge-skill wow fadeInDown" data-wow-duration="1000ms"
						data-wow-delay="900ms">
						<div class="css-skill">
							<p>
								<em>80%</em>
							</p>
							<p>School Learning</p>
						</div>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="sinlge-skill wow fadeInDown" data-wow-duration="1000ms"
						data-wow-delay="1200ms">
						<div class="wp-skill">
							<p>
								<em>90%</em>
							</p>
							<p>NIIT Imperia</p>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!--/.our-skill-->


		<!-- our-team -->
		<div class="team">
			<div class="center wow fadeInDown">
				<h2>Detail Description of Courses</h2>
				<p class="lead">The Detaild description of our courses is given
					below with details</p>
			</div>

			<div class="row clearfix">
				<div class="col-md-4 col-sm-6">
					<div class="single-profile-top wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="300ms">
						<div class="media">
							<div class="pull-left">
								<a href="#"><img class="media-object"
									src="resources/images/diginext.jpg" alt=""></a>
							</div>
							<div class="media-body">
								<h4>DigiNext</h4>
								<h5>Skills and Career Group</h5>

							</div>
						</div>
						<!--/.media -->

						<ol>
							<li>Understand and implement object-oriented concepts using
								Java technology programs</li>
							<li>Write SQL queries to retrieve, manage and manipulate
								data</li>
							<li>Design responsive web/enterprise apps using HTML5, CSS3
								and various JavaScript frameworks such as Bootstrap & AngularJS</li>
							<li>Build persistent and loosely coupled web apps using
								Hibernate and Spring technologies</li>
							<li>Build RESTFull web services</li>
							<li>Build high quality web/enterprise apps using DevOps
								platform</li>
						</ol>

					</div>
				</div>
				<!--/.col-lg-4 -->


				<div class="col-md-4 col-sm-6 col-md-offset-2">
					<div class="single-profile-top wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="300ms">
						<div class="media">
							<div class="pull-left">
								<a href="#"><img class="media-object"
									src="resources/images/gniit.jpg" alt=""></a>
							</div>
							<div class="media-body">
								<h4>GNIIT Program</h4>
								<h5>Skill and Career Group</h5>

							</div>
						</div>
						<!--/.media -->
						<p style="color:blue;">NIIT a global leader in skills and talent development
							announced the launch of GNIIT Digital Transformation (DT) - a
							path-breaking GNIIT program that equips college students to ride
							the wave of digital transformation - the process of shifting from
							a traditional approach to new ways of working and thinking using
							digital, social, mobile and emerging technologies. The new
							GNIIT?DT is exclusively available for Cloud and Mobile Software
							Engineering ? Java Specialization and will be offered across all
							Synchronized Learning Technology enabled centres of NIIT.</p>
					</div>
				</div>
				<!--/.col-lg-4 -->
			</div>
			<!--/.row -->
			<div class="row team-bar">
				<div class="first-one-arrow hidden-xs">
					<hr>
				</div>
				<div class="first-arrow hidden-xs">
					<hr>
					<i class="fa fa-angle-up"></i>
				</div>
				<div class="second-arrow hidden-xs">
					<hr>
					<i class="fa fa-angle-down"></i>
				</div>
				<div class="third-arrow hidden-xs">
					<hr>
					<i class="fa fa-angle-up"></i>
				</div>
				<div class="fourth-arrow hidden-xs">
					<hr>
					<i class="fa fa-angle-down"></i>
				</div>
			</div>
			<!--skill_border-->

			<div class="row clearfix">
				<div class="col-md-4 col-sm-6 col-md-offset-2">
					<div class="single-profile-bottom wow fadeInUp"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="media">
							<div class="pull-left">
								<a href="#"><img class="media-object"
									src="resources/images/imperia.png" alt=""></a>
							</div>

							<div class="media-body">
								<h4>NIIT Imperia</h4>
								<h5>Skill And Talent Development</h5>

							</div>
						</div>
						<!--/.media -->
						<p>NIIT Imperia Centre for Advanced Learning focuses on
							professional and educational needs of working professionals. It
							offers long-term Executive Management Programs (4 to 12 months),
							Management Development Programs (3 to 10 days) and Customized
							Programs for corporate organizations. NIIT Imperia has tied-up
							with the best institutes and organizations to provide top-notch
							education.The course you are referring to is run by NIIT Imperia
							where the award is conferred by IIM Lucknow (Noida campus).If
							you're thinking of taking the admission, the only person who can
							help you is YOU!</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 col-md-offset-2">
					<div class="single-profile-bottom wow fadeInUp"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="media">
							<div class="pull-left">
								<a href="#"><img class="media-object"
									src="resources/images/ifbi.jpg" alt=""></a>
							</div>
							<div class="media-body">
								<h4>IFBF</h4>
								<h5>Finance And Banking</h5>

							</div>
						</div>
						<!--/.media -->
						<p>The PGDBO is a six month program with three months of full
							time class work, followed by three months of internship session.
							The program is unique in both its content as well as its
							methodology. PGDBO program comes with a powerful paid internship.
							It is for three months, and follows the class-work session.
							Internship facility is extended to all students on successful
							completion of class work session. Students who undergo internship
							and "on the job" internship in ICICI Bank, upon successful
							completion, qualify for employment in ICICI Bank. More than 23000
							IFBI students have made this journey.
					</div>
				</div>
			</div>
			<!--/.row-->
		</div>
		<!--section-->
	</div>
	<!--/.container-->
</section>
<!--/about-us-->

<section id="bottom">
	<div class="container wow fadeInDown" data-wow-duration="1000ms"
		data-wow-delay="600ms">
		<div style="width: 100%; height: 30px; background-color: lightblue;">

			<h2 style="color: blue; font-size: 20px;text-align: center;">Student Blog Posts</h2>
			</div>
			<marquee  scrollamount="2" direction="up" loop="true" onmouseover="stop()" onmouseout="start()"> 
			<div class="row">




				<div style="padding-left: 100px;height: 300px;">

					<c:if test="${not empty posts}">
						<c:forEach var="post" items="${posts}">
							<p>Post Title:
								${post.title}</p>
							<P>Message
								:${post.content}</P>
							<p>By :${post.postUser} at &nbsp;${post.date}</p>
                           <hr>
						</c:forEach>
					</c:if>
					
				</div>
			</div>
			</marquee>
			<c:if test="${pageContext.request.userPrincipal.name == null}">
						<p>
							Please <a href="<c:url value="/login" />">Sign in</a> to post
							comment
						</p>
					</c:if>
		</div>
</section>
</div>

<script  type="text/javascript" src="js/jquery.js"></script>
<script  type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	//$('.carousel').carousel()
	 $(document).ready(function(){
    $('.carousel').carousel({
      interval: 2000
    })
  });    
</script>

<%@ include file="footer.jsp"%>
