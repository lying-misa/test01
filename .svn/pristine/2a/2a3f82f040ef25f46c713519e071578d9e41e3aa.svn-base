<?php
namespace Admin\Controller;

use Think\Controller;

class IndexController extends Controller
{

    function index()
    {
        if($this->IsLogined()){
            $this->display();
        }
        else{
            $this->error("请登录!","Admin/Index/Login");
        }


    }

    /**
     * 提交登录表单
     * author: lying
     * Date: 2018/10/18
     * param id int
     * return json
     */
    public function LoginForm(){
        $time = time();
        $Admin = M("Admin");
        $data['Name'] = I('name','', 'trim');
        $Password = I('password','', 'trim');
        if(!$data['Name'] )  {$this->error('参数丢失：用户名为空！');}
        if(!$Password)  {$this->error('参数丢失：密码为空！');}
        $res = $this->HaveAdmin($data);
        if(!$res) $this->error('用户名不存在！');
        else{
            if($res['Password']!=null && $res['Password']) {

                if ($res['Password'] == md5($Password)) {
                    session('AdminID', $res['ID']);
                    session('AdminName', $res['Name']);
                    $this->success("登录成功!","Index");
                } else {
                    $this->error("密码错误!","Login");
                }
            }
            else{
                $this->error("用户名密码错误,请联系工作人员!","Admin/Index/Login");
            }
        }
    }

    /**
     * 检查管理员是否存在
     * author: lying
     * Date: 2018/10/22
     * param id int identity string
     * return bool
     */
    function HaveAdmin($where)
    {
        $Admin = M('Admin');
        if (!$where) return false;
        else {
            $res = $Admin->where($where)->find();
            if (!$res['ID']) return false;
            else return $res;
        }
    }

    /**
     * 退出管理员账号
     * author: lying
     * Date: 2018/10/22
     * param
     * return bool
     */
    function Loginout(){
        session('AdminName',null);
        session('AdminID',null);
        $this->success("退出成功！", 'Admin/Index/Login');
    }
    /**
     * 管理员登录
     * author: lying
     * Date: 2018/10/22
     * param
     * return bool
     */
    function Login(){
        if(isset($_SESSION['AdminName']) && $_SESSION['AdminName']!=NULL &&
            isset($_SESSION['AdminID']) && $_SESSION['AdminID']!=NULL){
            $this->error("您已经登录过，请勿重复登录", 'Index');
            exit();
        }else {
            $this->display();
        }
    }

    /**
     * 判断管理员是否登录
     * author: lying
     * Date: 2018/10/22
     * param
     * return bool
     */
    function IsLogined(){
        if(isset($_SESSION['AdminName']) && $_SESSION['AdminName']!=NULL &&
            isset($_SESSION['AdminID']) && $_SESSION['AdminID']!=NULL){
            return true;
        }else {
            $this->error("请登录","Admin/Index/Login");
        }
    }

    /**
     * 清除缓存
     * author: lying
     * Date: 2018/10/23
     * param
     * return bool
     */
    function DelCache() {
        $dir = '../Runtime';
        if(file_exists($dir)){
            $ret['status'] = 1;
        }else{
            $ret['status'] = 0;
        }
        $dh = opendir($dir);
        var_dump($dh);
        while ($file = readdir($dh)) {
            echo $file;
            if ($file != "." && $file != "..") {
                $fullpath = $dir . "/" . $file;
                if (!is_dir($fullpath)) {
                    unlink($fullpath);
                }else {
                    deldir($fullpath);
                }
            }
        }
        $this->ajaxReturn($ret);
    }
}