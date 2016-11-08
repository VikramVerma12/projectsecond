<%@ include file="header.jsp" %>
	<section>
	
     <section id="contact-page">
        <div class="container">
            <div class="center">        
                <h2>Drop Your Message</h2>  
            </div> 
            <div class="row contact-wrap"> 
                
                <form:form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="addContact" commandName="contact">
                    <div class="col-sm-5 col-sm-offset-1">
                   
                        <div class="form-group">
                            <label>Name *</label>
                            <form:input path="name" name="name" class="form-control" />
                             <form:errors cssStyle="color:ff0000" path="name"></form:errors>
                        </div>
                        <div class="form-group">
                            <label>Email *</label>
                            <form:input path="email" name="email" class="form-control" required="required" />
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <form:input path="address" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>Telephone</label>
                            <form:input path="telephone" class="form-control" />
                        </div>                        
                 
                                          
                        <div class="form-group">
                            <button type="submit" name="submit" class="btn btn-primary btn-lg">Submit Message</button>
                        </div>
                           </div>
                   
                </form:form> 
            </div><!--/.row-->
        </div><!--/.container-->
    </section>

	</section>
	<%@ include file="footer.jsp" %>