<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>题库练习</title>
	<link href="/Public/mobile/css/mui.min.css" rel="stylesheet"/>
	<link href="/Public/mobile/css/iconfont.css" rel="stylesheet"/>
	<link href="/Public/mobile/css/common.css" rel="stylesheet"/>
    <script src="/Public/mobile/js/mui.min.js"></script>
    

</head>
<body>
	<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
  <!-- 菜单容器 -->
	<aside class="mui-off-canvas-left cmui-aside" id="asideBar">
    <div class="mui-scroll-wrapper ">
      <div class="mui-scroll">
        	<div class="cmui-text-white bg-theme aside-padding">
				<div class="userpic"><img src="/Public/mobile/images/tp-1.png"></div>
				<div class="username">
					<div class="username-aside-big"><?php echo ($User["Tel"]); ?></div>
					<div class="username-aside">账户ID：NCZK<?php echo ($User["UserID"]); ?></div>
				</div>
				<div class="aside_bgt_box">
					<div class="bg-theme aside_bgt_c"></div>
				</div>
				<div class="clear"></div>
		  	</div>
		  	<div class="aside-list">
				<a href="/mobile/Index/Index.html"><div class="aside-list-tab"><i class="iconfont icon-shouye icon4"></i>首页</div></a>
		  		<a href="/mobile/member/Collect.html"><div class="aside-list-tab"><i class="iconfont icon-shoucang2 icon1"></i>我的收藏</div></a>
				<a href="/mobile/practice/Index/action/AllWrongQsPractice.html"><div class="aside-list-tab"><i class="iconfont icon-cuowu icon2"></i>我的错题</div></a>
				<a href="/mobile/member/findpwd.html"><div class="aside-list-tab"><i class="iconfont icon-icon_set_up icon3"></i>账户设置</div></a>
		  	</div>
		  
		  	
      </div>
    </div>
  </aside>

  <!-- 主页面容器 -->
  <div class="mui-inner-wrap">
    <!-- 主页面标题 -->
    <header class="mui-bar mui-bar-nav">
      <a class="mui-icon mui-action-menu mui-icon-bars mui-pull-left" href="#asideBar"></a>
      <h1 class="mui-title">题库练习</h1>
		<a class="mui-icon mui-action-menu mui-icon-chat mui-pull-right" href="/mobile/member/message.html"></a>
    </header>
    <div class="mui-content mui-scroll-wrapper">
        <div class="mui-scroll">
		  	<div class="mui-slider">
			  <div class="mui-slider-group mui-slider-loop">
				<!--支持循环，需要重复图片节点-->
				<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/Public/mobile/images/banner.png"/></a></div>
				<div class="mui-slider-item"><a href="#"><img src="/Public/mobile/images/banner.png"/></a></div>
				  <div class="mui-slider-item"><a href="#"><img src="/Public/mobile/images/banner.png" /></a></div>
				  <div class="mui-slider-item"><a href="#"><img src="/Public/mobile/images/banner.png" /></a></div>
				  <div class="mui-slider-item"><a href="#"><img src="/Public/mobile/images/banner.png" /></a></div>
				  <div class="mui-slider-item"><a href="#"><img src="/Public/mobile/images/cebian.png" /></a></div>
				<!--支持循环，需要重复图片节点-->
				<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/Public/mobile/images/banner.png"/></a></div>
			  </div>
			</div>
		<div class="mui-content">
			<div class="mui-row index_tab">
				<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="mui-col-2">
						<div class="tab_link">
							<img src="/Public/mobile/images/img1.png">
						</div>
						<div class="tab_txt"><a href="Practice/Index/action/KnowledgePractice/KnowledgeID/<?php echo ($vo["ID"]); ?>"><?php echo ($vo["Name"]); ?></a></div>
					</div><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>
			<div class="split-block"></div>
				<div class="line_box">
			  		<div class="mui-ellipsis line_title">随机练习</div>
		            <div class="mui-table">
		                <div class="mui-table-cell mui-col-xs-10">
		                    
							<div class="mui-row line color6">
								<div class="mui-col-6 mui-col-xs-6"><i class="iconfont icon-liebiao icon_yellow"></i>题目数量:<?php echo ($rec["CountRand"]); ?></div>
								<div class="mui-col-6 mui-col-xs-6"><i class="iconfont icon-zan icon_purple"></i>正确率:<?php echo ($rec["RandRate"]); ?>%</div>
							</div>
							<div class="mui-row line color6">
								<div class="mui-col-4 mui-col-xs-4"><i class="iconfont icon-fabu icon_blue"></i>已做:<?php echo ($rec["CountDid"]); ?></div>
								<div class="mui-col-4 mui-col-xs-4">正确:<?php echo ($rec["CountRight"]); ?></div>
								<div class="mui-col-4 mui-col-xs-4">错误:<?php echo ($rec["CountWrong"]); ?></div>
							</div>
		                </div>
		                <div class="mui-table-cell mui-col-xs-2 mui-text-right">
							<a href="/mobile/Practice/Index/action/RandPractice/SubjectID/<?php echo ($SubjectID); ?>/GradeID/<?php echo ($GradeID); ?>"><div class="lint_btn yellow">使用</div></a>
		                </div>
		            </div>
				</div>
			    <div class="split-block"></div>
			    <div class="line_box">
			  		<div class="mui-ellipsis line_title">错题练习</div>
		            <div class="mui-table">
		                <div class="mui-table-cell mui-col-xs-10">
							<div class="mui-row line color6">
								<div class="mui-col-6 mui-col-xs-6"><i class="iconfont icon-liebiao icon_yellow"></i>题目数量:<?php echo ($rec["CountWrong"]); ?></div>
								<div class="mui-col-6 mui-col-xs-6"><i class="iconfont icon-zan icon_purple"></i>正确率:<?php echo ($rec["recondRandRate"]); ?>%</div>
							</div>
							<div class="mui-row line color6">
								<div class="mui-col-4 mui-col-xs-4"><i class="iconfont icon-fabu icon_blue"></i>已做:<?php echo ($rec["recondCountWrong"]); ?></div>
								<div class="mui-col-4 mui-col-xs-4">正确:<?php echo ($rec["recondCountWrongRight"]); ?></div>
								<div class="mui-col-4 mui-col-xs-4">错误:<?php echo ($rec["recondCountRight"]); ?></div>
							</div>
		                </div>
		                <div class="mui-table-cell mui-col-xs-2 mui-text-right">
		                    <a href="/mobile/Practice/Index.html"><div class="lint_btn blue">使用</div></a>
		                </div>
		            </div>
				</div>
			   <div class="split-block"></div>
				<div class="line_box">
			  		<div class="mui-ellipsis line_title">在线模考</div>
		            <div class="mui-table">
						
		                <div class="mui-table-cell mui-col-xs-10">
		                    
							<div class="mui-row line color6">
								<div class="mui-col-6 mui-col-xs-6"><i class="iconfont icon-liebiao icon_yellow"></i>题目数量:0</div>
								<div class="mui-col-6 mui-col-xs-6"><i class="iconfont icon-zan icon_purple"></i>正确率:100%</div>
							</div>
							<div class="mui-row line color6">
								<div class="mui-col-4 mui-col-xs-4"><i class="iconfont icon-fabu icon_blue"></i>已做:0</div>
								<div class="mui-col-4 mui-col-xs-4">正确:0</div>
								<div class="mui-col-4 mui-col-xs-4">错误:0</div>
							</div>
						</div>
							<div class="mui-table-cell mui-col-xs-2 mui-text-right">
								<a href="/mobile/practice/ExamList"><div class="lint_btn purple">使用</div></a>
							</div>
						
					</div>
				</div>
			
			
			
			
		</div>
        
    </div>  
  </div>
</div>
</div>


	
</body>
<script>
mui.init();
//获得slider插件对象
var gallery = mui('.mui-slider');
gallery.slider({
  interval:5000//自动轮播周期，若为0则不自动播放，默认为0；
});
//再加入这段代码
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