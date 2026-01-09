<?php
namespace Admin\Controller;

use Think\Controller;

class ExamController extends Controller
{
    /**
     * 考试列表
     * author: lying
     * Date: 2018/10/18
     * param where
     * return array
     */
    function index()
    {
        $map = array();
        //$map['Status'] = 1;
    /*  if($ZKZH!=NULL && $ZKZH!=""){
            $map['ZKZH'] = $ZKZH;
        }
        if($Identity!=NULL && $Identity!=""){
            $map['Identity'] = $Identity;
        }
    */
        $Name = I('Name','', 'trim');
        if($Name!=NULL && $Name!=""){
            $map['Name'] = array('like','%'.$Name.'%');
        }
        $p = $_GET['p']?$_GET['p']:1;
        $Exam = M('Exam');
        $list = $Exam->where($map)
            ->page($_GET['p'].',15')
            ->field('ID,Name,Start,End,Status,CreateDate')
            ->select();
        //$this->assign('list',$list);
        $count      = $Exam->where($map)->count();
        $Page       = new \Think\Page($count,15);
        foreach($map as $key=>$val) {
            $Page->parameter[$key]   =   urlencode($val);
        }
        $show  = $Page->show();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->assign('map',$map);// 赋值分页输出
        $this->display(); // 输出模板
    }
    /**
     * 保存考试
     * author: lying
     * Date: 2018/10/15
     * param data array
     * return json
     */
    public function SaveExam(){
        $time = time();
        $Exam=M("Exam");
        $ID = I('ExamID','', 'trim');
        $returnStr['status'] = 0;
        $data['Name'] = I('Name','', 'trim');
        $data['Tel'] = I('Tel','', 'trim');
        $data['Start'] = I('Start','', 'trim');
        $data['End'] = I('End','', 'trim');
        $data['Org'] = I('Org','', 'trim');
        $data['Description'] = I('Description','', 'trim');
        $data['Status'] = I('Status','', 'trim')?I('Status','', 'trim'):0;
        $data['Type'] = I('Type','', 'trim')?I('Type','', 'trim'):0;
        $data['Option'] = I('Option','', 'trim')?I('Option','', 'trim'):60;
        $data['Multiple'] = I('Multiple','', 'trim')?I('Multiple','', 'trim'):20;
        $data['Judge'] = I('Judge','', 'trim')?I('Judge','', 'trim'):20;
        $data['CreateDate'] = $time;
        if(!$data['Name'])  {$returnStr['errormsg'] = '参数丢失：考试标题为空';$this->error($returnStr['errormsg']);}
        if(!$data['Tel'])  {$returnStr['errormsg'] = '参数丢失：联系电话为空！';$this->error($returnStr['errormsg']);}
        if(!$data['Start'])  {$returnStr['errormsg'] = '参数丢失：未选择考试开始时间！';$this->error($returnStr['errormsg']);}
        if(!$data['End'])  {$returnStr['errormsg'] = '参数丢失：未选择考试结束时间！';$this->error($returnStr['errormsg']);}
        if($data['End'] < $data['Start']) {$returnStr['errormsg'] = '参数丢失：考试结束时间不能大于开始时间！';$this->error($returnStr['errormsg']);}
        if(!$data['Org'])  {$returnStr['errormsg'] = '参数丢失：举办机构为空！';$this->error($returnStr['errormsg']);}
        if(!$data['Description'])  {$returnStr['errormsg'] = '参数丢失：考试描述为空！';$this->error($returnStr['errormsg']);}
        if(!$data['Option'])  {$returnStr['errormsg'] = '参数丢失：选择题题目数为空！';$this->error($returnStr['errormsg']);}
        if(!$data['Multiple'])  {$returnStr['errormsg'] = '参数丢失：多选题题目数为空！';$this->error($returnStr['errormsg']);}
        if(!$data['Judge'])  {$returnStr['errormsg'] = '参数丢失：判断题题目数为空！';$this->error($returnStr['errormsg']);}
        $data['Start'] =  strtotime($data['Start']);
        $data['End'] =  strtotime($data['End']);
        if($ID!=null && $ID >0){
            if ($this->HaveExam($ID)) {
                $result = $Exam->where(array('ID' => $ID))->save($data);
                if (false !== $result || 0 !== $result) {
                    //$returnStr['status'] = 1;
                    $returnStr['errormsg'] = '修改成功';
                    $this->success($returnStr['errormsg']);
                } else {
                    $returnStr['errormsg'] = '修改失败!';
                    $this->error($returnStr['errormsg']);
                }
            }else{
                $returnStr['errormsg'] = '非法考试或者考试不存在!';
              //  $this->ajaxReturn($returnStr);
                $this->error($returnStr['errormsg']);
            }

        }
        else{
            $result = $Exam->add($data);

            if ($result){
                $returnStr['status'] = 1;
                $returnStr['errormsg'] = '提交成功';
                //$this->ajaxReturn($returnStr);
                $this->success($returnStr['errormsg']);
            }else{
                $returnStr['errormsg'] = '提交失败!';
               // $this->ajaxReturn($returnStr);
                $this->error($returnStr['errormsg']);
            }
        }
    }
    /**
     * 检查考试ID是否存在
     * author: lying
     * Date: 2018/10/15
     * param id int
     * return bool
     */
    public function HaveExam($ID){
        $Exam = M('Exam');
        if(!$ID) return false;
        else{
            $res = $Exam->where('ID='.$ID)->find();
            if(!$res['ID']) return false;
            else return $res;
        }
    }

    /**
     * 删除考试
     * author: lying
     * Date: 2018/10/15
     * param id int
     * return json
     */
    public function DelExam(){
        $returnStr['Status'] = 0;
        //$ID = I('ExamID','', 'trim');
        $ID = implode(",",I('ID','','trim'));
        $Exam = M('Exam');
        if(!$ID) {
            //$this->error('非法考试或者考试不存在!');
            $returnStr['errormsg'] = '非法考试或者考试不存在!';
            $this->ajaxReturn($returnStr);
        }
        else{
            //if(!$this->HaveExam($ID)) {
              //  $this->error('非法考试或者考试不存在!');
           // }else {
                $res = $Exam->where('id in ('.$ID.')')->delete();
                if ($res) {
                    //$this->success('删除成功!');
                    $returnStr['Status'] = 1;
                    $returnStr['errormsg'] = '删除成功!';
                    $this->ajaxReturn($returnStr);
                }
                else {
                    //$this->error('删除失败!');
                    $returnStr['errormsg'] = '删除失败!';
                    $this->ajaxReturn($returnStr);
                }
            //}
        }
    }

    /**
     * 修改考试
     * author: lying
     * Date: 2018/10/15
     * param id int
     * return json
     */
    function EditExam()
    {
        $ID = I('ExamID','', 'trim');
        if(!$this->HaveExam($ID)) {
           // $returnStr['errormsg'] = '非法考试或者考试不存在!';
           // $this->ajaxReturn($returnStr);
            //return false;
           // $this->error($returnStr['errormsg']);
            $this->display();
        }
        else {
            $Exam = M('Exam');
            $res = $Exam->where('id='.$ID)->find();
            //var_dump($res);
            $this->assign('data',$res);
            $this->display();
        }
    }


    /**
     * 生成验证码--作为考生密码
     * author: lying
     * Date: 2018/10/20
     * param id int
     * return json
     */
    function MakeIdentifier(){
        $ID = I('ExamID','', 'trim');
        $returnStr['status'] = 0;
        $res = $this->HaveExam($ID);
        if(!$res) {
            $returnStr['errormsg'] = '非法考试或者考试不存在!';
            $this->error($returnStr['errormsg']);
        }
        else {
            if($res['Identifier']){
                $returnStr['Identifier'] = $res['Identifier'];
                $returnStr['errormsg'] = '随机码已生成过，请勿重复生成！';
            } else {
                $Exam = M('Exam');
                $returnStr['status'] = 1;
                $data['Identifier'] = $this->getCode(8,6);
                $result = $Exam->where(array('ID' => $ID))->save($data);
                $Examinee = M('Examinee');
                $result1 = $Examinee->where(array('ExamID' => $ID,'Status'=>1))->save(array("Password"=>$data['Identifier']));
                if($result && $result1) {
                    $returnStr['Identifier'] = $data['Identifier'];
                    $returnStr['errormsg'] = '随机码生成成功！';
                }else{
                    $returnStr['status'] = 0;
                    $returnStr['Identifier'] = $data['Identifier'];
                    $returnStr['errormsg'] = '随机码生成失败，请联系工作人员！';
                }
            }
        }
        $this->ajaxReturn($returnStr);
    }
    /*
     * 取得随机字符串
     * author: lying
     * Date: 2018/10/20
     * param length int mode int
     * return string
     */
    function getCode($length=32,$mode=0)//获取随机验证码函数
    {
        switch ($mode)
        {
            case '1':
                $str='123456789';
                break;
            case '2':
                $str='abcdefghijklmnopqrstuvwxyz';
                break;
            case '3':
                $str='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                break;
            case '4':
                $str='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
                break;
            case '5':
                $str='ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
                break;
            case '6':
                $str='abcdefghijklmnopqrstuvwxyz1234567890';
                break;
            default:
                $str='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
                break;
        }
        $checkstr='';
        $len=strlen($str)-1;
        for ($i=0;$i<$length;$i++)
        {
            //$num=rand(0,$len);//产生一个0到$len之间的随机数
            $num=mt_rand(0,$len);//产生一个0到$len之间的随机数
            $checkstr.=$str[$num];
        }
        return $checkstr;
    }
    function IsLogined(){
        if(isset($_SESSION['Name']) && $_SESSION['Name']!=NULL &&
            isset($_SESSION['UserID']) && $_SESSION['UserID']!=NULL){
            return true;
        }else {
            $this->error("请登录","Login");
        }
    }

}
?>