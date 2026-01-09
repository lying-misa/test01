<?php
namespace Admin\Controller;

use Think\Controller;

class MessageController extends Controller
{

    function index()
    {
       $this->lists();
    }
    function lists(){
        $Message = M('Message');
        $where['Status'] = 1;
        $Message = M('Message');
        $res = $Message->where($where)->select();
        $this->assign('list',$res);
        $this->display();
    }
    function Save(){
        $returnStr['Status'] = 0;
        $data['Title'] = I('Title','', 'trim');
        $data['Content'] = I('Content','', 'trim');
        $data['Status'] = I('Status','', 'trim')?I('Status','', 'trim'):1;
        $data['CreateDate'] = time();
        if(!$data['Title'])  {$returnStr['errormsg'] = '参数丢失：Title为空';$this->ajaxReturn($returnStr);}
        if(!$data['Content'])  {$returnStr['errormsg'] = '参数丢失：Content为空';$this->ajaxReturn($returnStr);}
        $Message = M('Message');
        $res = $Message->add($data);
        if($res){
            $returnStr['Status'] = 1;
            $returnStr['errormsg'] = '添加成功！';
        }else{
            $returnStr['errormsg'] = '添加失敗！';
        }
        $this->ajaxReturn($returnStr);
    }
	function add(){
		$this->display();
	}
    function del(){
        $Message = M('Message');
        $where['Status'] = 1;
        $data['ID'] = I('ID','', 'trim');
        if(!$data['ID']){
            $this->error('ID为空！');
        }
        $Message = M('Message');
        $res = $Message->where($where)->delete();
        if($res){
            $this->success('删除成功！');
        }else{
            $this->error('删除失败！');
        }
    }

}