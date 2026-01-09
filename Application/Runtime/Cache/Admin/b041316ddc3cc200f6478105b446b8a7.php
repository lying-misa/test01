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
<?php echo ($xs["Name"]); ?>
  <div class="panel admin-panel">
    <?php if(is_array($res["Questions"])): $key = 0; $__LIST__ = $res["Questions"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$result): $mod = ($key % 2 );++$key; if($key == 1): ?><h2>一、单选题</h2>
        <?php elseif($key == 2): ?>
          <h2>二、多选题</h2>
        <?php elseif($key == 3): ?>
          <h2>二、判断题</h2>
        <?php elseif($key == 4): ?>
          <h2>二、简答题</h2>
        <?php elseif($key == 5): ?>
          <h2>二、理论分析题</h2>
        <?php elseif($key == 6): ?>
          <h2>二、论文题</h2><?php endif; ?>
      <?php if(is_array($result)): $fkey = 0; $__LIST__ = $result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$queslist): $mod = ($fkey % 2 );++$fkey;?><div class="que_line">
          <div class="que_tit">(<?php echo ($key+1); ?>)&nbsp;<?php echo ($queslist["Title"]); ?></div>
          <?php if($queslist["TW"] == 2): ?><div class="que_val"><img src="/<?php echo ($queslist["TWPic"]); ?>" alt="" height="180"></div><?php endif; ?>
          <div class="que_val">
            <ul class="list-unstyle height">
              <?php if(is_array($queslist["Options"])): $i = 0; $__LIST__ = $queslist["Options"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$answer): $mod = ($i % 2 );++$i; if($answer != NULL ): if($queslist["Type"] == 1): ?><li><?php echo ($zm["$key"]); ?>.&nbsp;&nbsp;<input type="radio" name="Reply[<?php echo ($fkey-1); ?>]" value="<?php echo ($key+1); ?>"><?php echo ($answer); ?></li>
                    <?php elseif($queslist["Type"] == 2): ?>
                    <li><?php echo ($zm["$key"]); ?>.&nbsp;&nbsp;<input type="checkbox" name="Reply[<?php echo ($fkey-1); ?>][]" value="<?php echo ($key+1); ?>"><?php echo ($answer); ?></li>
                    <?php else: ?>
                    <li><?php echo ($zm["$key"]); ?>.&nbsp;&nbsp;<input type="radio" name="Reply[<?php echo ($fkey-1); ?>]" value="<?php echo ($key+1); ?>"><?php echo ($answer); ?></li><?php endif; endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>
          </div>
        </div><?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
  </div>




</body>
<script src="/Public/js/admin_common.js"></script>
<script>

</script>
</html>