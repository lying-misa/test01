<?php
namespace Home\Controller;

use Think\Controller;

class CommonController extends Controller
{
    public function _initialize(){
        if(isset($_SESSION['User']['UserID']) && $_SESSION['User']['UserID']!=NULL &&
            isset($_SESSION['User']['Username']) && $_SESSION['User']['Username']!=NULL &&
            isset($_SESSION['User']['ZKZH']) && $_SESSION['User']['ZKZH']!=NULL){
            return true;
        }
        else{
            $this->error('对不起,您还没有登录,请先登录!','/Admin/Index/Login');
        }
    }
}