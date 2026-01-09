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
<header class="mui-bar mui-bar-nav bg-theme ">
	<a class="mui-icon mui-action-menu mui-icon-bars mui-pull-left colorF" href="#asideBar"></a>
  <h1 class="mui-title colorF"><?php echo ($title); ?></h1>
  <a class="mui-icon mui-action-menu mui-icon-chat mui-pull-right colorF" href="/mobile/member/message.html"></a> </header>
<div class="practive_top">
  <div class="bg-theme top_bg" ></div>
  <div class="mui-card top_card">
    <div class="mui-card-content mui-row top_card_content" >
      
      <div class="mui-col-xs-12 mui-col-sm-12">
        <div class="top_card_toptxt" id="num"><?php echo ($num); ?></div>
        <div class="top_card_bottomtxt">剩余</div>
      </div>
<!--
      <div class="mui-col-xs-6 mui-col-sm-6 pause_btn">
        <div class="top_card_toptxt" id="time_run">2:00:00</div>
        <div class="top_card_bottomtxt">暂停</div>
      </div>
-->
    </div>
  </div>
</div>
	  
<div class="mui-content mui-scroll-wrapper" style="margin-top:2rem; ">
  <div class="mui-scroll">
      <?php if($practice == null): ?>该科目等级下暂无考题
      <?php else: ?>
        <!--	  单选-->
          <?php if(is_array($practice)): $i = 0; $__LIST__ = $practice;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if($vo["Type"] == 1): ?><div class="mui-card">
                  <div class="mui-card-header" style="font-size: 14px;">
                      (<?php if($vo["Type"] == 1): ?>单选<?php elseif($vo["Type"] == 2): ?>多选<?php elseif($vo["Type"] == 3): ?>判断<?php else: ?>简答<?php endif; ?>)<?php echo ($vo["Title"]); ?>
                  </div>
                    <div class="mui-card-content color6">
                        <ul class="tit_list radio" data-id="<?php echo ($vo["ID"]); ?>">
                            <?php if(is_array($vo["Options"])): $key = 0; $__LIST__ = $vo["Options"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$op): $mod = ($key % 2 );++$key;?><li>
                                  <div class="option_tab" data-option="<?php echo ($key); ?>"><?php echo ($zm["$key"]); ?></div>
                                  <div class="option_content"><?php echo ($op); ?></div>
                                <div class="mui-clearfix"></div>
                              </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                    </div>
                    <div class="mui-card-footer">

                        <div class="mui-col-xs-4 mui-col-sm-4 J_collect" data-tid="<?php echo ($vo["ID"]); ?>">
                            <i class="iconfont <?php if($vo[Iscollect]): ?>icon-shoucangshixin<?php else: ?>icon-shoucang1<?php endif; ?> "></i>
                            收藏
                        </div>
                        <div class="mui-col-xs-4 mui-col-sm-4">
                            正确率：<?php echo ($vo["rigntrate"]); ?>%
                          </div>
                        <div class="mui-col-xs-4 mui-col-sm-4 color3" style="text-align: right;">
                            已选择<span class="answer" style="color: #4768f3;font-weight: bold;"></span>
                        </div>
                        <input class="s_answer" type="hidden" name="s_answer[]" value="0" data-tid="<?php echo ($vo["ID"]); ?>">
                    </div>

                </div>
              <?php elseif($vo["Type"] == 2): ?>
                <!--	  多选-->
                <div class="mui-card">
                  <div class="mui-card-header" style="font-size: 14px;">
                       (<?php if($vo["Type"] == 1): ?>单选<?php elseif($vo["Type"] == 2): ?>多选<?php elseif($vo["Type"] == 3): ?>判断<?php else: ?>简答<?php endif; ?>)<?php echo ($vo["Title"]); ?>
                  </div>
                  <div class="mui-card-content color6">
                    <ul class="tit_list checkbox" data-id="<?php echo ($vo["ID"]); ?>">
                            <?php if(is_array($vo["Options"])): $key = 0; $__LIST__ = $vo["Options"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$op): $mod = ($key % 2 );++$key;?><li >
                                    <div class="option_tab" data-option="<?php echo ($key); ?>"><?php echo ($zm["$key"]); ?></div>
                                    <div class="option_content"><?php echo ($op); ?></div>
                                    <div class="mui-clearfix"></div>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>

                  </div>
                    <div class="mui-card-footer">

                        <div class="mui-col-xs-4 mui-col-sm-4 J_collect" data-tid="<?php echo ($vo["ID"]); ?>">
                            <i class="iconfont <?php if($vo[Iscollect]): ?>icon-shoucangshixin<?php else: ?>icon-shoucang1<?php endif; ?>"></i>
                            收藏
                        </div>
                        <div class="mui-col-xs-4 mui-col-sm-4">
                            正确率：<?php echo ($vo["rigntrate"]); ?>%
                        </div>
                        <div class="mui-col-xs-4 mui-col-sm-4 color3" style="text-align: right;">
                            已选择<span class="answer" style="color: #4768f3;font-weight: bold;"></span>
                        </div>
                        <input class="s_answer" type="hidden" name="s_answer[]" value="0" data-tid="<?php echo ($vo["ID"]); ?>">
                    </div>
                </div><?php endif; endforeach; endif; else: echo "" ;endif; endif; ?>
	  <div class="margin-b-5">
          <input type = 'hidden' name="SubjectID" value="<?php echo ($SubjectID); ?>" id="SubjectID"/>
          <input type = 'hidden' name="GradeID" value="<?php echo ($GradeID); ?>" id="GradeID"/>

	     <button id="J_submit" type="button" class="mui-btn mui-btn-blue" style="width: 70%; background: linear-gradient(to bottom right, #4981ed , #475ee9);border: none;padding: 0.2rem;border-radius: 0.4rem;margin: 0 15%;">提交</button>
	  </div>

  </div>
</div>

		</div>
		</div>
<!--	弹出层-->
	<div id="popover_div"></div>
	<div id="popover" class="mui-popover bg-white">
		<div class="dialog ">
			<div class="dialog_group_line text_center">
				<img class="img" src="/Public/mobile/images/tp-4@2x.png" alt="">
			</div>
			<div class="dialog_group_line text_center font_big">
					剩余用时:<span class="count_time">2:00:00</span>
			</div>
			<div class="dialog_group_line text_center" style="margin-top: 0.5rem;margin-bottom: 0.5rem;">
				<button id="contiue_btn" type="button" class="mui-btn mui-btn-blue" style="width: 70%; background: linear-gradient(to bottom right, #4981ed , #475ee9);border: none;padding: 0.2rem;border-radius: 0.4rem;">继续答题</button>
			</div>


			<div class="mui-clearfix"></div>
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
	//单选
	mui(".radio").on("tap",".option_tab",function(){
		var answerid=this.dataset['option'];
		var answer=this.innerText;
        var qsid = this.parentNode.parentNode.getAttribute("data-id");
		var lastActiveElem = this.parentNode.parentNode.querySelector('.radio .option_tab.active');
		lastActiveElem&&lastActiveElem.classList.remove('active');
		this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("answer")[0].innerHTML=answer;
		this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("s_answer")[0].value=answerid;
		this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("s_answer")[0].setAttribute('data-id',qsid);
		this.classList.add('active');
		var that=this;
		numchange(that);
	});
	//多选
	mui(".checkbox").on("tap",".option_tab",function(){
		this.classList.toggle('active');
		var rdsObj=this.parentNode.parentNode.getElementsByTagName("li");
        var qsid = this.parentNode.parentNode.getAttribute("data-id");
		if(rdsObj.length){
			var checkVal = new Array();
			var checkValId = new Array();
			var k= 0;
			for(i = 0; i < rdsObj.length; i++){
				if(rdsObj[i].getElementsByClassName("active").length){
					checkValId[k] = rdsObj[i].getElementsByClassName("option_tab")[0].dataset['option'];
					checkVal[k] = rdsObj[i].getElementsByClassName("option_tab")[0].innerText;
					k++;
				}
			}
		}
		this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("answer")[0].innerHTML=checkVal;
		this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("s_answer")[0].value=checkValId;
        this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("s_answer")[0].setAttribute('data-id',qsid);
		var that=this;
		numchange(that);
	});
	
	function numchange(that){
		var num=document.getElementById("num").innerText;
		if(num){
			var length=document.getElementsByClassName("s_answer").length;
			var arr=[];
			var selectednum=0;
			mui(".s_answer").each(function(e){
				if(this.value!="" && this.value!=0 ){
					selectednum++;
				}
			});
			num=length-selectednum;
			document.getElementById("num").innerText=num;
		}
		
	}
	
	
	//暂停弹窗
	mui(".practive_top").on("tap",".pause_btn",function(){
		clearTimeout(t);
		var stoptime = parseInt(localStorage.getItem("time_run"));
	  	document.getElementsByClassName("count_time")[0].innerHTML=timestampToTime(stoptime);
		mui("#popover").popover('toggle',document.getElementById("popover_div"));
	});
	//继续答题
	mui("#popover").on("tap","#contiue_btn",function(){
		mui("#popover").popover("hide");
		t=setInterval(function() {
			pq();
		}, 1000);
	});
	

	mui('body').on('tap','a',function(){
		window.top.location.href=this.href;
	});
	//提交
	submit();
	function submit(){
		mui("body").on("tap","#J_submit",function(){
			var length=document.getElementsByClassName("mui-card").length;
			var answerArr=[];
			
			var answers = '[';
			mui(".s_answer").each(function(e){
				
				answerArr[e] = this.value?this.value:0;
				if(e == length-2) {
					answers += '[' + this.value + ',' + this.getAttribute("data-tid") + ']';
				}else{
					answers += '[' + this.value + ',' + this.getAttribute("data-tid") + '],';
				}
			})
			answers += ']';
			if(answerArr<length){mui.toast('题目未做完！',{ duration:'long', type:'div' });return false;}

			//if('<?php echo ($_GET["action"]); ?>'=="RandPractice"){
			  // var url='/mobile/Practice/AnswerSheet/action/<?php echo ($_GET["action"]); ?>';
			//}else{
			   var url='/mobile/Practice/MakeScore';
			//}
			mui.ajax(url,{
				data:{
					//answerArr:answerArr,
					answers:answers,
					SubjectID:document.getElementById('SubjectID').value,
					GradeID:document.getElementById('GradeID').value
				},
				dataType:'json',//服务器返回json格式数据
				type:'post',//HTTP请求类型
				headers:{'Content-Type':'application/x-www-form-urlencoded'},
				success:function(data){
					//服务器返回响应，根据响应结果，分析是否登录成功；
					if(data.status==1){
						mui.openWindow({  
							url: '/mobile/practice/AnswerSheet/action/<?php echo ($_GET["action"]); ?>',
						});
					}else{
					   alert(data.errormsg);
					  }


				},
				error:function(xhr,type,errorThrown){
					//异常处理；
					console.log(type);
				},
			});

		});
	}
	//收藏

	mui("body").on('tap','.J_collect',function(){
		var ID=this.dataset['tid'];
		var that=this;
		if(!ID){mui.toast('缺少题目ID，操作失败！',{ duration:'long', type:'div' });return false;}
		mui.ajax('/mobile/Member/setCollect',{
			data:{
				ID:ID,
			},
			dataType:'json',//服务器返回json格式数据
			type:'post',//HTTP请求类型
			timeout:10000,//超时时间设置为10秒；
			//headers:{'Content-Type':'application/json'},	              
			success:function(data){
				//服务器返回响应，根据响应结果，分析是否登录成功；
				if(data.status==1){
				   	that.getElementsByTagName('i')[0].classList.remove('icon-shoucang1');
					that.getElementsByTagName('i')[0].classList.add('icon-shoucangshixin');
					mui.toast(data.errormsg,{ duration:'long', type:'div' });
			   	}else if(data.status==2){
				   	that.getElementsByTagName('i')[0].classList.add('icon-shoucang1');
					that.getElementsByTagName('i')[0].classList.remove('icon-shoucangshixin');
					mui.toast(data.errormsg,{ duration:'long', type:'div' });
			   	}else{
					mui.toast(data.errormsg,{ duration:'long', type:'div' });
			   	}
			},
			error:function(xhr,type,errorThrown){
				//异常处理；
				console.log(type);

			},
			 
			
		});
		
	});

//倒计时
//	localStorage.setItem("time_run",7200);
//	var t;
//	var zxlmweb = parseInt(localStorage.getItem("time_run"));
//	function pq(){
//	  	document.getElementById("time_run").innerHTML=timestampToTime(zxlmweb);
//		localStorage.setItem("time_run",zxlmweb);
//		zxlmweb=zxlmweb-1;     
//		if(zxlmweb=='-1'){
//			submit();
//			clearTimeout(t);
//			
//		}
//		
//	}
//	t=setInterval(function() {
//		pq();
//	}, 1000);
//	function timestampToTime(timestamp) {
//        var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
//        var h = date.getHours()-8;
//        var m = date.getMinutes();
//        var s = date.getSeconds();
//		if(m.toString().length==1){m='0'+m};
//		if(s.toString().length==1){s='0'+s};
//        return h+":"+m+":"+s;
//    }
	
	
	</script>
</html>