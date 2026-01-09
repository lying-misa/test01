<?php
namespace Admin\Controller;

use Think\Controller;

class CommonController extends Controller
{
    public function _initialize(){
        if(isset($_SESSION['AdminName']) && $_SESSION['AdminName']!=NULL &&
            isset($_SESSION['AdminID']) && $_SESSION['AdminID']!=NULL) {

        }
        else{
            $this->error('对不起,您还没有登录,请先登录!','/Admin/Index/Login');
        }
    }
}