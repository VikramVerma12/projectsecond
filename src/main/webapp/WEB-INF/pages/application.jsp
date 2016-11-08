<%@ include file="header.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cometd.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cometd/AckExtension.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cometd/TimeStampExtension.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cometd/TimeSyncExtension.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cometd/ReloadExtension.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery.cometd.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery.cometd-reload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/chat.window.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comet.chat.js"></script>
<script type="text/javascript">
    
    var chatWindowArray = [];    
    var config = {
        contextPath: '${pageContext.request.contextPath}'
    };
	function getChatWindowByUserPair(loginUserName, peerUserName) {
		var chatWindow;		
		for(var i = 0; i < chatWindowArray.length; i++) {
			var windowInfo = chatWindowArray[i];
			if (windowInfo.loginUserName == loginUserName && windowInfo.peerUserName == peerUserName) {
				chatWindow =  windowInfo.windowObj;
			}
		}		
		return chatWindow;
	}	
	function createWindow(loginUserName, peerUserName) {		
	var chatWindow = getChatWindowByUserPair(loginUserName, peerUserName);		
		if (chatWindow == null) { //Not chat window created before for this user pair.
			chatWindow = new ChatWindow(); //Create new chat window.
			chatWindow.initWindow({
				loginUserName:loginUserName, 
				peerUserName:peerUserName,
				windowArray:chatWindowArray});			
			//collect all chat windows opended so far.
			var chatWindowInfo = { peerUserName:peerUserName, 
					               loginUserName:loginUserName,
					               windowObj:chatWindow 
					             };			
			chatWindowArray.push(chatWindowInfo);
    	}		
		chatWindow.show();		
		return chatWindow;
	}
	function join(userName){
		$.cometChat.join(userName);
	}
</script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/comet.chat.css"/>
</head>
<body>
<script type="text/javascript">
	var userName = '<%=request.getParameter("username")%>';
	$(document).ready(function(){ 
		$.cometChat.onLoad({memberListContainerID:'members'});
		join(userName);
	});
</script>
<div class="StoreCataloge" style="padding-left: 100px;" >
            <h2>Online Users</h2>
			<div  id="members" style="width:150px;color: navy;background-color:lightblue;border: 2px solid darkblue;padding: 5px;text-align: center"></div>
</div>	
</body>
