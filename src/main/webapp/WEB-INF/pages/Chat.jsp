<%@ include file="header.jsp"%>
<div class="ContentWrapper">
	<div class="contenttopCurve"></div>
	<div class="ContentMiddleTile">
		<div class="ContentInnerWrapper">
			<!--Left Pane Begin-->
			<div class="LeftPane">
				<!--Store Catalog Begin-->
				<div class="StoreCataloge">
					<h2>Quick Links</h2>
					<ul>		
              <li><a href="newforum">New Forum</a></li>
              <li><a href="angularform">All Forum</a></li>
              <li><a href="#">Services</a></li>
              <li><a href="editUser">Update Profile</a></li>
              <li><a href="post">All Posts</a></li>
              <li><a href="newPost">New Posts</a></li>
              <li><a href="Chat">Chat</a></li>
         	   </ul>
					
					<br>
					<br>
					<div class="StoreCataloge">
            <h2>Current News</h2>
			<div style="height: 150px;width: 179px; border:1px solid blue; ">
			<marquee  scrollamount="2" direction="up" loop="true" onmouseover="stop()" onmouseout="start()">
			<p>Your test has been scheduled</p>
			<p>Get In touch with friends</p>
			<p>Check your Test Score</p>
			<p>Manage your Performance</p>
			<p>Participate in Quizes</p>
			<p>Earn with referals</p>
			<p>NITET on 25th January</p>
			<p>Bhavishya Jyoti Schollarship</p>
			</marquee>
			</div>
			</div>
				</div>
				<!--Store Catalog End-->


			</div>
			<!--Left Pane End-->
			<!--Middle Pane Begin-->
			<div class="MiddlePane">

				<form:form action="application" method="POST">
					<input type="text" name="username" value="${myName}">
					<input type="submit" value="Join Chat">
				</form:form>
			</div>

		</div>

	</div>
	</div>