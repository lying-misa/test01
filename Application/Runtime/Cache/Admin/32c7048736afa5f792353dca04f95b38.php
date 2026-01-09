<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="/Public/css/pintuer.css">
<link rel="stylesheet" href="/Public/css/admin.css">
<script src="/Public/js/jquery.js"></script>
<script src="/Public/js/pintuer.js"></script>
</head>
<body>

  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 刷题管理</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" style="padding:5px 15px;" href="EditSubject.html">添加科目</a> </li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="Name" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" style="padding:5px 15px;" id="changesearch" > 搜索</a></li>
      </ul>
    </div>
	  	
	  
	  
	  
	  
	  
	  
	  
    <form method="post" action="/admin/Subject/DelSubject" id="listform">
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">ID</th>
        <th>科目名称</th>
		<th width="150">考试等级</th>
        <th width="150">科目状态</th>
        <th width="150">创建时间</th>
        <th width="320">操作</th>
      </tr>
		<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><tr>
          <td style="text-align:left; padding-left:20px;">
			  <?php if($list["Grades"] != null): ?><span class="icon icon-plus-square-o margin-right"></span><?php endif; ?>
			  <input type="checkbox" name="ID[]" value="<?php echo ($list["ID"]); ?>" /><?php echo ($list["ID"]); ?>
		  </td>
          <td><?php echo ($list["Name"]); ?></td>
			<td>考试等级</td>
		<td><?php if($list["Status"] == 1): ?><span class="text-green">发布阶段</span><?php else: ?><span class="text-yellow">测试阶段</span><?php endif; ?></td>
          	<td><?php echo (date('Y-m-d',$list["CreateDate"])); ?></td>
			<td>

					<div class="button-group">
						<a class="button button-little border-main" href="/admin/Subject/EditSubject/SubjectID/<?php echo ($list["ID"]); ?>"><span class="icon-edit"></span>修改</a>
						<?php if($list["Grades"] == null): ?><a class="button button-little border-blue" href="/admin/Subject/Knowledge/SubjectID/<?php echo ($list["ID"]); ?>"><span class="icon-file-text-o"></span>设置提醒</a><?php endif; ?>
						<a class="button button-little border-red delsingle" href="javascript:void(0)" data-id="<?php echo ($list["ID"]); ?>" ><span class="icon-trash-o"></span>删除</a>
						<a class="button button-little border-blue" href="/admin/Subject/GradeIndex/SubjectID/<?php echo ($list["ID"]); ?>" ><span class="icon-plus-square-o"></span>添加等级</a>
						<!--<a class="button button-little border-main" href="/admin/PracticeQuestions/Lists/SubjectID/<?php echo ($list["ID"]); ?>" data-id="<?php echo ($list["ID"]); ?>" ><span class="icon-setting"></span>考题管理</a>-->
			</td>
        </tr>
		<tr class="children" style="display: none;">
			<td colspan="6" style="border: none;padding: 0;">
			<table class="table table-hover text-center">
				<?php if(is_array($list["Grades"])): $i = 0; $__LIST__ = $list["Grades"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$grade): $mod = ($i % 2 );++$i;?><tr>
					  <td style="text-align:left; padding-left:20px;" width="100">
						  <span class="padding-large-left"></span>
						  <!--<input type="checkbox" name="ID[]" value="<?php echo ($list["ID"]); ?>" /><?php echo ($list["ID"]); ?>-->
						  ----|
					  </td>
						<td><?php echo ($list["Name"]); ?></td>
						<td width="150"><?php echo ($grade); ?>级</td>
						<td width="150"><?php if($list["Status"] == 1): ?><span class="text-green">发布阶段</span><?php else: ?><span class="text-yellow">测试阶段</span><?php endif; ?></td>
					  <td width="150"><?php echo (date('Y-m-d',$list["CreateDate"])); ?></td>
					  <td width="320">
						<div class="button-group">
						<a class="button button-little border-blue importstudent" href="javascript:void(0)"><span class="icon-file-text-o"></span>导入考题</a>
							<a class="button button-little border-red delsingle" href="javascript:void(0)" data-id="<?php echo ($list["ID"]); ?>" ><span class="icon-trash-o"></span>删除</a>
							<a class="button button-little border-main" href="/admin/PracticeQuestions/Lists" data-id="<?php echo ($list["ID"]); ?>" ><span class="icon-setting"></span>考题管理</a>
						</div>
					  </td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
			</table>
				</td>
		</tr><?php endforeach; endif; else: echo "" ;endif; ?>





      <tr>
        <td colspan="10"><div class="pagelist"><?php echo ($page); ?></div></td>
      </tr>
    </table>
    </form>
  </div>



<form id="importbox" name="FormData" action="/admin/PracticeQuestions/UploadExcel"  enctype="multipart/form-data" method="post">
	<div class="hidebox" id="hidebox">
		<div class="dialog open dialog_hidebox">
			<div class="dialog-head">
				<span class="dialog-close close" id="hide_close"></span><strong>导入考题</strong>
			</div>
			<div class="dialog-body">
				<div class="importline"><input type="file" name="excelData" ></div>
				<div class="importline">
					<select class="input w50" name="Type" data-validate="required:请选择分类">
						<option value="">请选择导入题型</option>
						<option value="1">单选题</option>
						<option value="2">多选题</option>
						<option value="3">判断题</option>
						<option value="4">简答题</option>
						<option value="5">理论分析题</option>
						<option value="6">论文</option>
				  </select>
				</div>

				 <div class="importline">
				 	<input type="submit" value="导入" class="button border-blue">
				 </div>

			</div>

		</div>
	</div>
</form>


</body>
<script src="/Public/js/admin_common.js"></script>
<script>
	$(".J_code").on("click",function(){
		var id=$(this).data("id");
		var url="/admin/Exam/MakeIdentifier";
		
		$.ajax({
			type: 'POST', 
			data: {ExamID:id}, 
			url: url,
			success: function(result){
				alert("随机码为："+result.Identifier);
			},
		});

	});
	
	
	$("table .icon").on("click",function(){
		var nexthide=$(this).parent().parent("tr").next("tr.children");
		if(nexthide.is(':visible')){
			nexthide.hide();
			$(this).removeClass("icon-minus-square-o").addClass("icon-plus-square-o");
		}else{
			nexthide.show();
			$(this).removeClass("icon-plus-square-o").addClass("icon-minus-square-o");
		}
	})
</script>
</html>