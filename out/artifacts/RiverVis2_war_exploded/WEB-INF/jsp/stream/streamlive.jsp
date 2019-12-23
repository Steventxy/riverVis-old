<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	response.setHeader("Access-Control-Allow-Origin", "*"); 
	response.setHeader("Access-Control-Allow-Methods","GET,POST");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<script type="text/javascript" src="static/stream/swfobject.min.js"></script>
<script type="text/javascript">
		swfobject.embedSWF("static/stream/RtmpStreamer.swf", "rtmp-streamer", "270", "190", "9", "static/stream/src/expressInstall.swf",{},{bgcolor:"#e5eaf1",wmode:"opaque"},{});
		//wmode,tranparent:透明，opaque:不透明,表示将Flash置于最底层
		</script>
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck.js"></script>
</head>
<body class="no-skin" onbeforeunload="return onbeforeunload()">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12" >
							<div class="alert alert-block alert-success" style="margin-top:10px;margin-bottom:10px;">
								<button type="button" class="close" data-dismiss="alert">
									<i class="ace-icon fa fa-times"></i>
								</button>
								<strong>流媒体直播：</strong>选择直播终端->开始直播
							</div>	
							<div class="page-content col-xs-4" style="margin-top:15px;">
								<div class="page-header" style="padding-bottom:10px;">
									<h1> <small> <i class="ace-icon fa fa-angle-double-right"></i> 流媒体直播 </small>  </h1>
								</div>
								<div style="margin-left:12px">
									<blockquote  style="padding:5px 20px;font-size:14px">
										<div id="livestatus" style="overflow:hidden;height:21px;">
											<p class="text-primary" >未直播</p>
										</div></blockquote>
									<div id="rtmp-streamer" >
											<h3>请先安装flash插件</h3>
											<p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="下载 Adobe Flash player 插件" /></a></p>
									</div>
									<div >
									<button id="selectter" class="btn btn-success btn-xs" onclick="selectter(this);" style="margin-right:12px;margin-bottom:10px;"  title="选择终端">
										<i  class="ace-icon fa fa-check bigger-110 "></i>&nbsp;选择终端</button>
									<button id="start" class="btn btn-primary btn-xs" style="margin-bottom:10px;"  onclick="startlive(this);"  >
										<i  class="ace-icon fa fa-play bigger-110 "></i>&nbsp;开启直播</button>
									<button id="end" class="btn btn-danger btn-xs" style="margin-bottom:10px;" disabled onclick="endlive();"   >
										<i  class="ace-icon fa fa-stop bigger-110 " ></i>&nbsp;关闭直播</button>
									</div>
									<div style="font-size:12px;margin-top:20px;">
										<p  class="text-warning" >直播终端：<span id="liveternum">0</span> 个，开启直播：<span id="startternum">0</span> 个</p></div>
								</div>
							</div>
							<div class="page-content col-xs-8" style="margin-top:15px;" >
								<div class="page-header" style="padding-bottom:10px;">
									<h1> <small> <i class="ace-icon fa fa-angle-double-right"></i> 终端直播状态 </small>  </h1>
								</div>
<!-- 								<div class="row"> -->
									<form action="" method="post" name="Form" id="Form">
										<table id="simple-table"  class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
											<thead>
												<tr>
													<th class="center">终端IMEI</th>
													<th class="center">终端名称</th>
													<th class="center">所属分组</th>
													<th class="center">所属用户</th>
													<th class="center">直播状态</th>
												</tr>
											</thead>
																	
											<tbody id="tbody">
														
											</tbody>
										</table>
										<div class="page-header position-relative"> </div>
									</form>
<!-- 									</div> -->
								</div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!--引入弹窗组件start-->
		<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
			
		$(top.hangge());//关闭加载状态
	var ws = null;
	var streamid=null;
	var imeilist=null;
	var isstreamliving=2;//0:正在开启，1:已经开启直播，2:未直播或已经关闭直播，3:正在关闭
	function onbeforeunload(){
		if(isstreamliving==0||isstreamliving==1){
	    	endlive();
		}
	}
	function setLiveButton(isliving){
		isstreamliving = isliving;
		if(isliving==1){//已经开启直播，可以关闭直播
			$("#start").attr("disabled","disabled");
			$("#end").removeAttr("disabled");
			$("#selectter").attr("disabled","disabled");
		}else if(isliving==2){//已经关闭直播，可以开启直播
			$("#end").attr("disabled","disabled");
			$("#start").removeAttr("disabled");
			$("#selectter").removeAttr("disabled");
		}else{//正在开启或关闭，不可以操作
			$("#end").attr("disabled","disabled");
			$("#start").attr("disabled","disabled");
			$("#selectter").attr("disabled","disabled");
		}
	}
	 function connectWS() {
	 		var path = window.location.pathname;
	 		var hostaddress = window.location.host + path.substring(0,path.substr(1).indexOf('/')+1);
            var target = "/stream";
            if (window.location.protocol == 'http:') {
                target = 'ws://' + hostaddress + target;
            } else {
                target = 'wss://' + hostaddress + target;
            }
	            if ('WebSocket' in window) {
	                ws = new WebSocket(target);
	            } else if ('MozWebSocket' in window) {
	                ws = new MozWebSocket(target);
	            } else {
	                Dialog.alert('您的浏览器不支持 WebSocket！');
	                return;
	            }
            if(ws==null){
            	setLiveButton(2);
            }
            ws.onopen = function () {
            	scrollStatus("text-info","正在开启直播...");
            	startsent();//向后台发送开始直播命令
                console.log('Info: WebSocket connection opened.');
            };
            ws.onmessage = function (event) {                
                if(event.data.charAt(0)=="2"){//终端直播状态
					scrollStatus("text-success","正在直播...");
					setLiveButton(1);
                	//终端状态刷新
                	refreshTerStatus(event.data.substring(2,event.data.length));
                }else{
                	console.log('WS Received: ' + event.data);
	                switch(event.data){
	                	case "start:success"://开始直播成功
	                		scrollStatus("text-info","开始直播...");
	                		break;
	                	case "end:success":
	                		scrollStatus("text-warning","关闭直播...");
	                		break;
	                	case "error:socketconnect":
	                		scrollStatus("text-danger","开启失败");
	                		Dialog.alert('服务器 StreamSocket 连接失败，请联系管理员！');
	                		setLiveButton(2);
	                		streamerDisconnect();
	                		closeWS();
	                		setShowCloseStatus();
	                		break;
	                	case "1:success":
	                		scrollStatus("text-info","开始直播...");
	                		break;
	                	case "0:success":
	                		setLiveButton(2);
							closeWS();
							setShowCloseStatus();
	                		scrollStatus("text-danger","直播结束");
	                		break;
	                }
                }
                
            };
            ws.onclose = function (event) {
            	if(event.code==1006){
            		Dialog.alert('服务器 WebSocket 连接失败！');
            		setLiveButton(2);
            		streamerDisconnect();
//             		setShowCloseStatus();
	               scrollStatus("text-danger","直播结束");
            	}
                console.log('Info: WebSocket connection closed, Code: ' + event.code + (event.reason == "" ? "" : ", Reason: " + event.reason));
            };
        }

	function startlive(obj){
		if(imeilist==null || imeilist==""){
			$(obj).tips({
						side:3,
			            msg:'请选择直播终端',
			            bg:'#AE81FF',
			            time:2
			        });
					return false;
		}else{
			streamid = getCurTime();
			setLiveButton(0);
			publishRtmp();
		}
	}
	//向后台发送开始直播命令
	function startsent(){
		if (ws != null) {
                var message = "start:"+streamid+":"+imeilist;
                console.log('Sent Start ');
                ws.send(message);
            } else {
                Dialog.alert('WebSocket 连接建立失败，请重新连接');
                setLiveButton(2);
            }
            if(streamid!=null)
          addlog("open",streamid);
	}
	function endlive(){
		setLiveButton(3);
		scrollStatus("text-info","正在关闭直播...");
		addlog("close",streamid);
		if(isOpen) streamerDisconnect();
		if (ws != null) {
                var message = "end:"+streamid;
                console.log('Sent End');
                ws.send(message);
            } else {
                setLiveButton(2);
            }
            
	}
	function selectter(obj){
		top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择直播终端";
			 if(imeilist==null)
				 diag.URL = "<%=basePath%>stream/setStreamTer.do";
			 else
				 diag.URL = "<%=basePath%>stream/setStreamTer.do?selecttid="+imeilist;
			 diag.Width = 300;
			 diag.Height = 450;
			 diag.CancelEvent = function(){ 
			 	if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 		scrollStatus("text-primary","未直播");
// 			 		if(imeilist!=null){
			 			$("#tbody").empty();
// 			 		}
			 		imeilist = diag.innerFrame.contentWindow.document.getElementById('selectter').value;
			 		$.post("stream/getTerByTid.do",{tids:imeilist},function(data){
			 			if(data.terlistarr!=null){
			 				var terjson = eval(data.terlistarr);
			 				$("#liveternum").text(terjson.length);
			 				$.each(terjson,function(i,item){
					 			$("#tbody").append("<tr><td class='center'>"+item.tid+"</td> <td class='center'>"+item.tname+"</td>"+
														"<td class='center'>"+item.aname+"</td> <td class='center'>"+item.username+"</td>"+
														"<td class='center blue'>未直播</td>"+
														"</tr>");
			 				});
			 			}
			 		});
				}
				diag.close();
			 };
			 diag.show();
	
	}
	function getCurTime(){
		var myDate = new Date();
		var hour = myDate.getHours();       //获取当前小时数(0-23)
		var minu = myDate.getMinutes();     //获取当前分钟数(0-59)
		var sec = myDate.getSeconds();     //获取当前秒数(0-59)
		if(hour<10) hour = "0"+hour; 
		if(minu<10) minu = "0"+minu; 
		if(sec<10) sec = "0"+sec;
		return hour+""+minu+""+sec;
	}
	
	function refreshTerStatus(tidlist){
// 		var tidlength = tidlist.split(",");
		var startternum=0;
		var trs = $("#tbody").find("tr");
		for(var i=0;i<trs.length;i++){
			var tid = trs[i].children[0].innerText;
				var terstatus = trs[i].children[4];
			if(tidlist.indexOf(tid)!=-1){
				terstatus.innerText = "正在直播...";
				$(terstatus).attr("class","center green");
				startternum++;
			}else if(terstatus.innerText=="正在直播..."){
				terstatus.innerText = "直播结束";
				$(terstatus).attr("class","center red");
			}
		}
		$("#startternum").text(startternum);
	}
	function closeWS(){
		if (ws != null) {
			ws.close();
			ws = null;
		}
		
	}
	function setShowCloseStatus(){
		streamid=null;
		imeilist=null;
		$("#startternum").text(0);
		var trs = $("#tbody").find("tr");
		for(var i=0;i<trs.length;i++){
			var terstatus = trs[i].children[4].innerText;
			if(terstatus=="正在直播..."){
				var terstatus = trs[i].children[4];
				terstatus.innerText = "直播结束";
				$(terstatus).attr("class","center red");
			}
		}
	}
function addlog(type,streamid){
	var data ;
	if(type=="open"){
		data= {streamid:streamid,type:type,imeilist:imeilist};
	}else{
		data= {streamid:streamid,type:type};
	}
	$.post("stream/addLog.do",data,function(data){
			 			if(data.terlistarr!=null){
			 				var terjson = eval(data.terlistarr);
			 				$("#liveternum").text(terjson.length);
			 				$.each(terjson,function(i,item){
					 			$("#tbody").append("<tr><td class='center'>"+item.tid+"</td> <td class='center'>"+item.tname+"</td>"+
														"<td class='center'>"+item.aname+"</td> <td class='center'>"+item.username+"</td>"+
														"<td class='center blue'>未直播</td>"+
														"</tr>");
			 				});
			 			}
			 		});
}
/**
* 字符滚动效果
*/
		var Mar = null; 
		var picH = 21;//移动高度 
		var scrollstep = 3;//移动步幅,越大越快 
		var scrolltime = 30;//移动频度(毫秒)越大越慢 
		var tmpH = 0;
		$(document).ready(function(){
			Mar = document.getElementById("livestatus");
			picH =Mar.offsetHeight; 

		});
		//字符向上滚动
		function scrollStatus(textclass,text) {
			$(Mar).append("<p class='"+textclass+"'>"+text+"</p>")
			Marqueeh();
		}
   
		function Marqueeh() {
			if (tmpH < picH) {
				tmpH += scrollstep;
				if (tmpH > picH)
					tmpH = picH;
				Mar.scrollTop = tmpH;
				setTimeout(Marqueeh, scrolltime);
			} else {
				tmpH = 0;
				var child_div=Mar.getElementsByTagName("p"); 
// 				$(child_div[0]).remove();
				Mar.removeChild(child_div[0]);
				Mar.scrollTop = 0;
			}
		}
		
		
/**
 * 使用flash 方法二，AS3与JS交互通信(使用swfObject插入Flash)
 * swfobject.js使用方法
 * http://www.cnblogs.com/snowinmay/p/3373892.html
 */

var isReady = false;
var isOpen = false;

// Global method for ActionScript
function setSWFIsReady() {
    if (!isReady) {
        console.log('swf is ready!');
        isReady = true;
        thisMovie("rtmp-streamer").setShowText("录音未开始");
    }
}
function mrophoneIsOpen() {
    if (!isOpen) {
        console.log('mrophone is open!');
        isOpen = true;
    }
        //麦克风打开之后向后台发送直播请求
        connectWS();//打开ws连接
}
function streamError(infocode){
	if (infocode != "NetConnection.Connect.Closed") {
    	 var msg="连接流媒体服务器出错！\n"+infocode;
		 Dialog.alert(msg);
	}
}
function publishRtmp() {
	setMicQuality(10);
	//console.log('MicQuality:'+10);
	thisMovie("rtmp-streamer").publish("${rtmpAddress}", streamid,"正在使用麦克风...");
	setLiveButton(1);
};

function streamerDisconnect() {
	thisMovie("rtmp-streamer").disconnect("麦克风使用结束。");
	isOpen = false;
};
function setMicQuality(quality) {
	thisMovie("rtmp-streamer").setMicQuality(quality);
};
function setMicRate (rate) {
	thisMovie("rtmp-streamer").setMicRate(rate);
};

//搭建js与flash互通的环境
function thisMovie(movieName) {
 if (navigator.appName.indexOf("Microsoft") != -1) {
   
  return window[movieName];
 } else {
   
  return document[movieName];
 }
}
	</script>
</body>
</html>