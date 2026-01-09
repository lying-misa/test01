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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改考试</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" id="save_examform" action="/admin/Exam/SaveExam">
      <div class="form-group">
        <div class="label">
          <label>考试名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo ($data["Name"]); ?>" name="Name" data-validate="required:请输入考试名称" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>考试类型：</label>
        </div>
        <div class="field">
          <select class="input w50" name="Type" data-validate="required:请选择分类">
            <option value="">请选择分类</option>
            <option value="0" <?php if($data["Type"] == 0): ?>selected="selected"<?php endif; ?>>公共考试</option>

          </select>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo ($data["Tel"]); ?>" name="Tel" data-validate="required:请输入联系电话" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>开始时间：</label>
        </div>
        <div class="field">
          <input type="text" class="laydate-icon input w50 date_input" name="Start"  value="<?php if(($data["Start"] == 0)): echo ($data["Start"]); else: echo (date('Y-m-d H:i',$data["Start"])); endif; ?>""data-validate="required:开始时间不能为空" />
            <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>结束时间：</label>
        </div>
        <div class="field">
          <input type="text" class="laydate-icon input w50 date_input" name="End"  value="<?php if(($data["End"] == 0)): echo ($data["End"]); else: echo (date('Y-m-d H:i',$data["End"])); endif; ?>""data-validate="required:结束时间不能为空" />
            <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>主办方：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="Org" value="<?php echo ($data["Org"]); ?>"  data-validate="required:请输入主办方"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>相关描述：</label>
        </div>
        <div class="field">
          <textarea class="input w50" name="Description" style=" height:150px;" data-validate="required:请输入相关描述"><?php echo ($data["Description"]); ?></textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>考试状态：</label>
        </div>
        <div class="field">
          <div class="button-group radio">
            <label class="button <?php if($data["Status"] == 0): ?>active<?php endif; ?>"> <span class="icon icon-check"></span>
              <input name="Status" value="0"  type="radio" <?php if($data["Status"] == 0): ?>checked="checked"<?php endif; ?>>
              测试阶段 </label>
            <label class="button <?php if($data["Status"] == 1): ?>active<?php endif; ?>"> <span class="icon icon-check"></span>
              <input name="Status" value="1" type="radio" <?php if($data["Status"] == 1): ?>checked="checked"<?php endif; ?>>
              发布阶段 </label>
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>单选题数目：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="Option" value="<?php echo ($data["Option"]); ?>"   data-validate="required:请输入单选题数目,number:必须为数字" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>多选题数目：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="Multiple" value="<?php echo ($data["Multiple"]); ?>"  data-validate="required:请输入多选题数目,number:必须为数字"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>判断题数目：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="Judge" value="<?php echo ($data["Judge"]); ?>"  data-validate="required:请输入判断题数目,number:必须为数字"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
         <input type="hidden" value="<?php echo ($_GET['ExamID']); ?>" name="ExamID">
          <button class="button bg-main icon-check-square-o" type="button" id="J_SaveExam"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
<link rel="stylesheet" href="/Public/css/jquery.datetimepicker.min.css">
<script src="/Public/js/jquery.datetimepicker.full.min.js"></script>
<script>
//时间选择器
$(".date_input").datetimepicker({
	format: 'Y-m-d H:i',
	step:10,
});
$.datetimepicker.setLocale('zh');

$("#J_SaveExam").click(function(){
	$("#save_examform").ajaxSubmit(function(){
		var form=$("#save_examform");
		var url=form.attr("action");
		$.ajax({
			type: 'POST', 
			data: form.serialize(), 
			url: url,
			success: function(result){
				alert(result.info);
				if(result.status){
					$(location).attr('href', '/admin/Exam');
				}
			},
		});
	});
});



</script>
</html>