<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>真题列表</title>
<link href="/Public/mobile/css/mui.min.css" rel="stylesheet"/>
<link href="/Public/mobile/css/iconfont.css" rel="stylesheet"/>
<link href="/Public/mobile/css/common.css" rel="stylesheet"/>
<script src="/Public/mobile/js/mui.min.js"></script>
</head>
<body>
<header class="mui-bar mui-bar-nav bg-theme " style="z-index: 99;box-shadow: none;"> 
	
	
<button class="mui-action-back mui-btn mui-btn-link mui-btn-nav mui-pull-left" style="color: #fff;"><span class="mui-icon mui-icon-left-nav"></span>返回</button>
  <h1 class="mui-title colorF">真题列表</h1>
  <a class="mui-icon mui-action-menu mui-icon-chat mui-pull-right colorF"></a> </header>

<div class="mui-content mui-scroll-wrapper" style="z-index: auto" >
  <div class="mui-scroll" style="z-index: 10">
	 <ul class="mui-table-view">
		 <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a href="/mobile/Practice/ShowExam/ExamID/<?php echo ($vo["ID"]); ?>"><li class="mui-table-view-cell" style="border-bottom: 1px solid #efefef;"><?php echo ($vo["Name"]); ?></li></a><?php endforeach; endif; else: echo "" ;endif; ?>
		

	</ul>
	  
</div>
</div>

	


</body>
	<script>
	mui.init();
	(function($){
		$(".mui-scroll-wrapper").scroll({
			//bounce: false,//滚动条是否有弹力默认是true
			indicators: false, //是否显示滚动条,默认是true
		}); 
	})(mui);
	 mui('body').on('tap','a',function(){
        window.top.location.href=this.href;
    });

	</script>
</html>