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
<header class="mui-bar mui-bar-nav bg-theme " style="z-index: 99;box-shadow: none;"> 
	
	
<button class="mui-action-back mui-btn mui-btn-link mui-btn-nav mui-pull-left" style="color: #fff;"><span class="mui-icon mui-icon-left-nav"></span>返回</button>
  <h1 class="mui-title colorF">真题列表</h1>
  <a class="mui-icon mui-action-menu mui-icon-chat mui-pull-right colorF"></a> </header>  
	
	<div class="practive_top">
  <div class="bg-theme top_bg" ></div>
  <div class="mui-card top_card">
    <div class="mui-card-content mui-row top_card_content" >
      
      <div class="mui-col-xs-12 mui-col-sm-12">
        <div class="top_card_toptxt"><?php echo ($res["Name"]); ?></div>
      </div>
    </div>
  </div>
</div>
<div class="mui-content mui-scroll-wrapper" style="margin-top:2rem; ">
  <div class="mui-scroll">
      <div class="mui-slider">
  		<div class="mui-slider-group" id="examlist">
			
			
<?php if(is_array($res["Questions"])): $key = 0; $__LIST__ = $res["Questions"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$result): $mod = ($key % 2 );++$key; if($key == 1): ?><div class="mui-slider-item"><div class="mui-card"><div class="mui-card-header"> <h2>一、单选题</h2></div></div></div>
    <?php elseif($key == 2): ?>
      <div class="mui-slider-item"><div class="mui-card"><div class="mui-card-header"><h2>二、多选题</h2></div></div></div>
    <?php elseif($key == 3): ?>
      <div class="mui-slider-item"><div class="mui-card"><div class="mui-card-header"><h2>二、判断题</h2></div></div></div>
    <?php elseif($key == 4): ?>
      <div class="mui-slider-item"><div class="mui-card"><div class="mui-card-header"><h2>二、简答题</h2></div></div></div>
    <?php elseif($key == 5): ?>
      <div class="mui-slider-item"><div class="mui-card"><div class="mui-card-header"><h2>二、理论分析题</h2></div></div></div>
    <?php elseif($key == 6): ?>
      <div class="mui-slider-item"><div class="mui-card"><div class="mui-card-header"><h2>二、论文题</h2></div></div></div><?php endif; ?>
  <?php if(is_array($result)): $fkey = 0; $__LIST__ = $result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$queslist): $mod = ($fkey % 2 );++$fkey;?><div class="mui-slider-item">

		  <?php if($queslist["Type"] == 1 or $queslist["Type"] == 3): ?><div class="mui-card tit1">
                  <div class="mui-card-header" style="font-size: 14px;">
                      (<?php echo ($key+1); ?>)&nbsp;<?php echo ($queslist["Title"]); ?>
					  <?php if($queslist["TW"] == 2): ?><div class="que_val">< img src="/<?php echo ($queslist["TWPic"]); ?>" alt="" height="180"></div><?php endif; ?>
                  </div>
                    <div class="mui-card-content color6">
                        <ul class="tit_list radio" data-id="<?php echo ($vo["ID"]); ?>">
                            <?php if(is_array($queslist["Options"])): $i = 0; $__LIST__ = $queslist["Options"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$answer): $mod = ($i % 2 );++$i; if($answer != NULL ): ?><li>
                                  <div class="option_tab" data-option="<?php echo ($zm1["$key"]); ?>"><?php echo ($zm1["$key"]); ?></div>
                                  <div class="option_content"><?php echo ($answer); ?></div>
                                <div class="mui-clearfix"></div>
                              </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                    </div>
					
					<div class="mui-card-footer" style="display: none">
                        <input class="s_answer" type="hidden" name="s_answer[]" value="0" data-tid="<?php echo ($queslist["QID"]); ?>">
                    </div>

                </div>
              <?php elseif($queslist["Type"] == 2): ?>
                <!--	  多选-->
                <div class="mui-card tit1">
                  <div class="mui-card-header" style="font-size: 14px;">
                       (<?php echo ($key+1); ?>)&nbsp;<?php echo ($queslist["Title"]); ?>
					  <?php if($queslist["TW"] == 2): ?><div class="que_val">< img src="/<?php echo ($queslist["TWPic"]); ?>" alt="" height="180"></div><?php endif; ?>
                  </div>
                  <div class="mui-card-content color6">
                    <ul class="tit_list checkbox" data-id="<?php echo ($vo["ID"]); ?>">
						<?php if(is_array($queslist["Options"])): $i = 0; $__LIST__ = $queslist["Options"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$answer): $mod = ($i % 2 );++$i; if($answer != NULL ): ?><li>
								<div class="option_tab" data-option="<?php echo ($zm1["$key"]); ?>"><?php echo ($zm1["$key"]); ?></div>
								<div class="option_content"><?php echo ($answer); ?></div>
								<div class="mui-clearfix"></div>
							</li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                  </div>
					<div class="mui-card-footer" style="display: none">
                        <input class="s_answer" type="hidden" name="s_answer[]" value="0" data-tid="<?php echo ($queslist["QID"]); ?>">
                    </div>
                </div>
              
			  <?php elseif($queslist["Type"] == 4 or $queslist["Type"] == 5 or $queslist["Type"] == 6): ?>
                <!--	  -->
                <div class="mui-card tit1">
                  <div class="mui-card-header" style="font-size: 14px;">
                       (<?php echo ($key+1); ?>)&nbsp;<?php echo ($queslist["Title"]); ?>
					  <?php if($queslist["TW"] == 2): ?><div class="que_val">< img src="/<?php echo ($queslist["TWPic"]); ?>" alt="" height="180"></div><?php endif; ?>
                  </div>
                  <div class="mui-card-content color6">
                    <ul class="tit_list checkbox" data-id="<?php echo ($vo["ID"]); ?>">
						<?php if(is_array($queslist["Options"])): $i = 0; $__LIST__ = $queslist["Options"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$answer): $mod = ($i % 2 );++$i;?><li>
								<div class="option_tab" data-option="<?php echo ($key); ?>"><?php echo ($key); ?></div>
								<div class="option_content"><?php echo ($answer); ?></div>
								<div class="mui-clearfix"></div>
							</li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                  </div>
					<div class="mui-card-footer" style="display: none">
                        <input class="s_answer" type="hidden" name="s_answer[]" value="XX" data-tid="<?php echo ($queslist["QID"]); ?>">
                    </div>
                </div><?php endif; ?>
		  
		  </div><?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
			<!--第一个内容区容器-->
			
			<div class="mui-slider-item"><div class="mui-card">
				<div class="mui-card-header">
          			是否要提交答卷？
				</div>
				 <div class="mui-card-content color6">
					 <input type = 'hidden' name="ExamID" value="<?php echo ($_GET['ExamID']); ?>" id="ExamID"/>
	     			<button id="J_submit" type="button" class="mui-btn mui-btn-blue" style="width: 70%; background: linear-gradient(to bottom right, #4981ed , #475ee9);border: none;padding: 0.2rem;border-radius: 0.4rem;margin: 0 15%;">提交</button>
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
		//var answer=this.innerText;
        var qsid = this.parentNode.parentNode.getAttribute("data-id");
		var lastActiveElem = this.parentNode.parentNode.querySelector('.radio .option_tab.active');
		lastActiveElem&&lastActiveElem.classList.remove('active');
		//this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("answer")[0].innerHTML=answer;
		this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("s_answer")[0].value=answerid;
		this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("s_answer")[0].setAttribute('data-id',qsid);
		this.classList.add('active');
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
		//this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("answer")[0].innerHTML=checkVal;
		this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("s_answer")[0].value=checkValId;
        this.parentNode.parentNode.parentNode.nextElementSibling.getElementsByClassName("s_answer")[0].setAttribute('data-id',qsid);


	});
	

	
	
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
			var length=document.getElementsByClassName("tit1").length;
			var answerArr=[];

			var answers = '[';
			mui(".s_answer").each(function(e){
				answerArr[e] = this.value?this.value:0;
				if(e == length-1) {
					answers += '["' + this.value + '",' + this.getAttribute("data-tid") + ']';
				}else{
					answers += '["' + this.value + '",' + this.getAttribute("data-tid") + '],';
				}
			})
			answers += ']';
			if(answerArr<length){mui.toast('题目未做完！',{ duration:'long', type:'div' });return false;}

			//if('<?php echo ($_GET["action"]); ?>'=="RandPractice"){
			  // var url='/mobile/Practice/AnswerSheet/action/<?php echo ($_GET["action"]); ?>';
			//}else{
			   var url='/mobile/Practice/MakeOldScore';
			//}
			mui.ajax(url,{
				data:{
					//answerArr:answerArr,
					Reply:answers,
					ExamID:document.getElementById('ExamID').value
				},
				dataType:'json',//服务器返回json格式数据
				type:'post',//HTTP请求类型
				success:function(data){
					//服务器返回响应，根据响应结果，分析是否登录成功；
					if(data.status==1){
						mui.openWindow({
							url: '/mobile/practice/OldExamSheet/ExamID/<?php echo ($_GET["ExamID"]); ?>',
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

	
	
	</script>
</html>