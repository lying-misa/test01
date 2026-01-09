<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>答题卡</title>
<link href="/Public/mobile/css/mui.min.css" rel="stylesheet"/>
<link href="/Public/mobile/css/iconfont.css" rel="stylesheet"/>
<link href="/Public/mobile/css/common.css" rel="stylesheet"/>
<script src="/Public/mobile/js/mui.min.js"></script>
</head>
<body>
<header class="mui-bar mui-bar-nav bg-theme " style="z-index: 99;box-shadow: none;">
  <button class="mui-action-back mui-btn mui-btn-link mui-btn-nav mui-pull-left" style="color: #fff;"><span class="mui-icon mui-icon-left-nav"></span>返回</button>
  <h1 class="mui-title colorF">答题卡</h1>
  <a class="mui-icon mui-action-menu mui-icon-chat mui-pull-right colorF"></a> </header>
<div class="mui-content mui-scroll-wrapper ">
  <div class="mui-scroll">
	  
	  <div class="bg-white">
	  	<div class="color3 font_big" style="padding: 0.2rem 0.4rem;">得分：<?php echo ($fenshu); ?></div>

	  </div>
	  <div class="bg-white">
	  	<div class="color3 font_big" style="padding: 0.2rem 0.4rem;">我的答案</div>
		  

    	<ul class="mui-table-view bg-white grid_list">
			<?php if(is_array($list)): $key = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?><li class="mui-table-view-cell  mui-col-xs-2 mui-col-sm-2 <?php if($vo["IsTrue"] == 0): ?>error<?php endif; ?>"
					<?php if($vo["Type"] == 4): ?>style="color:green;"
					<?php elseif($vo["Type"] == 5): ?>
			  			style="color:green;"
					<?php elseif($vo["Type"] == 6): ?>
			  			style="color:green;"<?php endif; ?>
					>
					<a href="/mobile/Practice/Analysis/action/<?php echo ($_GET['action']); ?>/ID/<?php echo ($vo["QID"]); ?>/key/<?php echo ($key); ?>"><div class=""><?php echo ($key); ?></div></a>
				</li><?php endforeach; endif; else: echo "" ;endif; ?>
    	</ul>
	  </div>
	  <div class="color3 font_big bg-white" style="padding: 0.2rem 0.4rem;margin-top: 0.2rem;">正确答案</div>
    <ul class="mui-table-view bg-white grid_list" >
		<?php if(is_array($list)): $key = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?><li class="mui-table-view-cell  mui-col-xs-3 mui-col-sm-3">
				<a href="#">
					<div class=""><?php echo ($key); ?></div>
					<span>(<?php echo ($vo["TrueAnswer"]); ?>)</span>
				</a>
			</li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
  </div>
</div>
</body>
	<script>
		mui.init();
	//再加入这段代码
	(function($){
		$(".mui-scroll-wrapper").scroll({
			//bounce: false,//滚动条是否有弹力默认是true
			indicators: false, //是否显示滚动条,默认是true
		});
	})(mui);
		
	</script>
</html>