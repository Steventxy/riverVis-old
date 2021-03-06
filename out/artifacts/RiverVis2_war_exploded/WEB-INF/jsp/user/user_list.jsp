<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							
						<!-- 检索  -->
						<form action="users/listAllUsers.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" style="vertical-align:top;width: 120px; height: 30px" name="unamekey" value="${pd.unamekey }" placeholder="这里输入姓名" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="isusekey" id="isusekey" data-placeholder="账号状态" style="vertical-align:top;width: 120px; height: 30px">
									<option value=""></option>
									<option value="">全部</option>
									<option value="1" <c:if test="${pd.isusekey=='1'}">selected</c:if>>正常</option>
									<option value="0" <c:if test="${pd.isusekey=='0'}">selected</c:if>>停用</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td>
								<td style="vertical-align:top; padding-left:12px">
										<a class="btn btn-sm btn-success" onclick="addUser();" style="vertical-align:top;height: 30px;">新增</a>
									</td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
								<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">用户姓名</th>
									<th class="center">用户类型</th>
									<th class="center">登录账号</th>
									<th class="center">所属区域</th>
									<th class="center">用户角色</th>
									<th class="center">联系电话</th>
									<th class="center">联系地址</th>
									<th class="center">账号状态</th>
									<th class="center">备注</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty userlist}">
									<c:forEach items="${userlist}" var="user" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${user.roleid}" id="${user.userid }"  class="ace"/><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${user.username}</td>
											<td class='center'>${user.usertypes}</td>
											<td class='center'>${user.loginid}</td>
											<td class='center'>${user.aname} </td>
											<td class='center'>${user.rname} </td>
											<td class='center'>${user.linktel}</td>
											<td class='center'>${user.linkaddr}</td>
											<td class='center'>
												<label id="isuse">
														<input name="switch-field-1"  onclick="setenable('${user.userid}','${user.username}','${user.isuse }')" class="ace ace-switch ace-switch-3" type="checkbox" <c:if test="${user.isuse }">checked="checked"</c:if> >
														<span class="lbl"></span>
													</label>
											</td>
											<td class='center'>${user.note}</td>
											
										<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
													<a class="btn btn-xs btn-success" title="修改" onclick="editUser('${user.userid}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="修改"></i>
													</a>
													<a class="btn btn-xs btn-danger" onclick="delUser('${user.userid }','${user.username }');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<li>
																<a style="cursor:pointer;" onclick="editUser('${user.userid}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															<li>
																<a style="cursor:pointer;" onclick="delUser('${user.userid }','${user.username }');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
											</td>
											</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
						</tr>
					</table>
					</div>
						</form>
					
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
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
	
		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
			//下拉框
	if(!ace.vars['touch']) {
		$('.chosen-select').chosen({allow_single_deselect:true}); 
		$(window)
		.off('resize.chosen')
		.on('resize.chosen', function() {
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			});
		}).trigger('resize.chosen');
		$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
			if(event_name != 'sidebar_collapsed') return;
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			});
		});
	}

	
	//复选框全选控制
	var active_class = 'active';
	$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if($(row).attr("disabled")!="disabled"){
				if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
				else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
			}
		});
	});
		});
		//删除
function delUser(userId,msg){
	bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "<%=basePath%>users/deleteU.do?userid="+userId+"&uname="+msg;
			$.get(url,function(data){
				nextPage(${page.currentPage});
			});
		};
	});
}
//修改用户
function editUser(userid){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改";
	 diag.URL = "<%=basePath%>users/editUser.do?userid="+userid+"&from=list";
	 diag.Width = 500;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
	 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			nextPage(${page.currentPage});
		}
		diag.close();
	 };
	 diag.show();
}
//添加
function addUser(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="添加";
	 diag.URL = "<%=basePath%>users/addUser.do";
	 diag.Width = 500;
	 diag.Height = 550;
	 diag.CancelEvent = function(){ //关闭事件
	 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			nextPage(${page.currentPage});
		}
		diag.close();
	 };
	 diag.show();
}
//导出excel
function toExcel(){
var checkedidlist =[];
	var i=0;
		var checkedidlist = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++) {
				  if(document.getElementsByName('ids')[i].checked){
				  	if(checkedidlist=='') checkedidlist += document.getElementsByName('ids')[i].id;
				  	else checkedidlist += ',' + document.getElementsByName('ids')[i].id;
				  }
			}
			if(checkedidlist==''){
				$(object).tips({
					side:3,
		            msg:'您没有选择任何内容',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#zcheckbox").tips({
					side:2,
		            msg:'点这里全选',
		            bg:'#AE81FF',
		            time:8
		        });
				$("#zcheckbox").focus();
				return;
			}else{
			window.location.href='<%=basePath%>users/excel.do?checkedidlist='+checkedidlist;
	}
}

		//处理按钮点击,用户状态
		function setenable(userid,uname,isenabled ){
			$.ajax({
				type: "POST",
				url: "<%=basePath%>users/upEnable.do?userid="+userid+"&uname="+uname+"&isuse="+isenabled,
				dataType:'json',
				success: function(data){
					var str = '修改出错';
					if(data.result=="success"){
						var str = '修改成功';
					}
						
						$("#isuse").tips({
							side : 3,
							msg : str,
							bg : '#AE81FF',
							time : 8
						});
						$("#isuse").focus();
				}
			});
		}
	</script>
</body>
</html>