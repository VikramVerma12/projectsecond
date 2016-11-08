<%@ include file="header.jsp" %>
<script type="text/javascript">
noty('<a href="http://www.jqueryscript.net/tags.php?/Notification/">Notification</a> Title','Message Body');
</script>

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
              <li><a href="newforum">Spring New Forum</a></li>
               <li><a href="newPost">Spring New Post</a></li>
              <li><a href="angularform">Spring All Forum</a></li>
               	<li><a href="post">Spring All Posts</a></li>
             <!--   <li><a href="angularsearch">All Forum with angular js</a></li>-->
                <li><a href="angularformwithlist">Angular Forum</a></li>
                 <li><a href="angularpostwithlist">Angular Post</a></li>
                <li><a href="editUser">Spring Update Profile</a></li>
                <li><a href="AngularUserEdit">Angular Update Profile</a></li>
             
               <!-- 	<li><a href="angularpostsearch">All Posts with angular js</a></li> -->
             	
             	 <li><a href="Chat">Spring Chat</a></li>
             	 <li><a href="Chatt">Angular Chat</a></li>
            </ul>
			<br><br>
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
         
          <!--Product Listing Pane Begin-->
          <div class="ProduListingPane">
            <h1>Welcome: ${pageContext.request.userPrincipal.name}</h1>
            <!--Procuct Box Begin-->
            <div class="ProductBoxWrapper">
 
           
            </div>
            <!--Procuct Box End-->
          </div>
		  
          <!--Product Listing Pane End-->
        </div>
        <!--Middle Pane end-->
        <div class="RightPane"><h2 style align="center;">About NIIT</h2><object style="height:200px; width:196px"><param name="movie" value="http://www.youtube.com/v/OdMDdeoJmHM?version=3"><param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always"><embed src="http://www.youtube.com/v/OdMDdeoJmHM?version=3" type="application/x-shockwave-flash" allowfullscreen="true" allowScriptAccess="always" width="196" height="200"></object></div>
        
             </div>
    </div>
    
</div>
<div class="ContentFooter">
<%@ include file="footer.jsp" %>
</div>