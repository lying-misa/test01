<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/16 0016
 * Time: 10:32
 */

/**
 * 检查考试ID是否存在
 * author: lying
 * Date: 2018/10/15
 * param id int
 * return bool
 */
/*function HaveExam($ID){
    $Exam = M('Exam');
    if(!$ID) return false;
    else{
        $res = $Exam->where('id='.$ID)->find();
        if(!$res) return false;
        else return true;
    }
}*/

/**
 * 判断是否登录
 * author: lying
 * Date: 2018/10/18
 * param session
 * return bool
 */
function IsLogined(){
    if(isset($_SESSION['AdminName']) && $_SESSION['AdminName']!=NULL &&
        isset($_SESSION['AdminID']) && $_SESSION['AdminID']!=NULL){
        return true;
    }else {
        $this->error("请登录","/Admin/Index/Login");
    }
}