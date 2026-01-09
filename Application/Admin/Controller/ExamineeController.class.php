<?php
namespace Admin\Controller;

use Think\Controller;

class ExamineeController extends Controller
{
    /**
     * 考生列表
     * author: lying
     * Date: 2018/10/16
     * param where
     * return array
     */
    function index()
    {
        $ZKZH = I('ZKZH', '', 'trim');
        $Identity = I('Identity', '', 'trim');
        $map = array();
        $map['Status'] = 1;
        if($ZKZH!=NULL && $ZKZH!=""){
            $map['ZKZH'] = $ZKZH;
        }
        if($Identity!=NULL && $Identity!=""){
            $map['Identity'] = $Identity;
        }

        $Examinee = M('Examinee');
        $list = $Examinee->where($map)
            ->page($_GET['p'].',15')
            ->field('ID,ExamID,Username,Sex,Brithday,Identity,Tel,ZKZH,Status,CreateDate')
            ->select();
        $this->assign('list',$list);
        $count      = $Examinee->where($map)->count();
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
     * 导入考生准考证号
     * author: lying
     * Date: 2018/10/15
     */
    public function ImportExamer(){
        $this->display();
    }

    /**
     * 上传excel文件
     * author lying
     * Date: 2018/10/15
     * param  string $file
     * return  array
     */
    function UploadExcel()
    {
        $ID = I('ExamID', '', 'trim');
        //$ID = $_REQUEST['ExamID'];
        $returnStr['status'] = 0;
        if ($this->HaveExam($ID)) {
            header("Content-Type:text/html;charset = utf-8");
            $upload = new \Think\Upload();
            $upload->maxSize = $_FILES['excelData']['size'];
            $upload->exts = array('xls', 'xlsx');
            $upload->rootPath = 'Public/Upload/';
            $info = $upload->uploadOne($_FILES['excelData']);
            $filepath = $upload->rootPath . $info['savepath'] . $info['savename'];
            $exts = $info['ext'];
            if (!$info) {
                $this->error($upload->getError());
            } else {
                $data['UploadExcel'] = $upload->rootPath.$info['savepath'] . $info['savename'];
                $Exam = M('Exam');
                $result = $Exam->where('ID='.$ID)->save($data);
                if($result !== false){
                  //  $this->success('上传成功！');
                    //导出excel数据
                   $arr = $this->ReadExcel($filepath,$ID);
                   //导入数据库
                    $res = $this->Arr2ImportExamer($arr);
                    if($res['sussess']){
                        $this->success('上传成功！，一共：'.$res['num'].'条记录,上传成功：'.$res['sussess'].'条记录,身份证重复：'.$res['repeat'].'条记录');
                    }
                    else{
                        $this->success('上传成功！，一共：'.$res['num'].'条记录,上传成功：'.$res['sussess'].'条记录,身份证重复：'.$res['repeat'].'条记录');
                    }
                }else{
                    $this->error('上传失败！');
                }

            }
        } else {
            $this->error('非法上传！');

        }
    }
    /**
     * 二维数组存入学生数据
     * author: lying
     * Date: 2018/10/16
     * param arr array
     * return bool
     */
    function Arr2ImportExamer($arr){
        $count = count($arr);
        $Examinee = M('Examinee');
        $returnStr = array();
        $i=1;
        $returnStr['sussess']=0;
        $returnStr['repeat'] = 0;
        for(;$i<=$count;$i++){
            $data['ExamID'] = $arr[$i]['ExamID'];
            $data['ClassID'] = $arr[$i]['A'];
            $data['Agency'] = $arr[$i]['B'];
            $data['ZKDW'] = $arr[$i]['D'];
            $data['Username'] = $arr[$i]['E'];
            $data['Password'] = '';
            $data['Sex'] = $arr[$i]['F'];
            $data['Brithday'] = $arr[$i]['G'];
            $data['Photo'] = $arr[$i]['H'];
            $data['Identity'] = $arr[$i]['I'];
            $data['Tel'] = $arr[$i]['J'];
            $data['ZKZH'] = $arr[$i]['K'];
            $data['KCH'] = $arr[$i]['L'];
            $data['ZWH'] = $arr[$i]['M'];
            $data['KDMC'] = $arr[$i]['N'];
            $data['KDDZ'] = $arr[$i]['O'];
            $data['KSRQ'] = $arr[$i]['P'];
            $data['KSQZSJ'] = $arr[$i]['Q'];
            $data['KSKM'] = $arr[$i]['R'];
            $data['Status'] = 1;
            $data['CreateDate'] = time();
            if($data['Identity'] && $data['ExamID'] && !$this->HaveExaminee(array('ExamID'=> $data['ExamID'],'Identity'=> $data['Identity']))){
               $res = $Examinee->add($data);
                if($res)
                   $returnStr['sussess'] = $returnStr['sussess']+1;
            }
            else{
                $returnStr['repeat'] = $returnStr['repeat']+1;
            }
        }
        $returnStr['num'] = $count;
        return $returnStr;
    }

    /**
     * 检查考试ID是否存在
     * author: lying
     * Date: 2018/10/15
     * param id int
     * return bool
     */
    function HaveExam($ID)
    {
        $Exam = M('Exam');
        if (!$ID) return false;
        else {
            $res = $Exam->where('id=' . $ID)->find();
            if (!$res) return false;
            else return true;
        }
    }

    /**
     * 检查考生是否存在
     * author: lying
     * Date: 2018/10/15
     * param id int identity string
     * return bool
     */
    function HaveExaminee($where)
    {
        $Examinee = M('Examinee');
        if (!$where) return false;
        else {
            $res = $Examinee->where($where)->find();
            if (!$res) return false;
            else return true;
        }
    }



    /**
     * 删除考生
     * author: lying
     * Date: 2018/10/15
     * param id int
     * return json
     */
    public function DelExaminees(){
       // $Examers = I('Examers','', 'trim');
        $returnStr['Status'] = 0;
		$Examers = implode(",",I('ID','','trim'));
        $Examinee = M('Examinee');
        if(!$Examers) return false;
        else{
            $res = $Examinee->where('id in('.$Examers.')')->delete();
            if ($res) {
                $returnStr['Status'] = 1;
                $returnStr['errormsg'] = '删除成功!';
                $this->ajaxReturn($returnStr);
               // $this->success('删除成功!');
            }else{
                //$this->error('删除失败!');
                $returnStr['errormsg'] = '删除失败!';
                $this->ajaxReturn($returnStr);
            }
        }
    }

    /**
     * 修改考生信息
     * author: lying
     * Date: 2018/10/16
     * param post array
     * return bool
     */
    function UpdateExaminee(){;
        $Examinee = M('Examinee');
        $ExamineeID = I('ExamineeID','', 'trim');
        $data['ExamID'] =  I('ExamID','', 'trim');
        $data['ClassID'] =I('ClassID','', 'trim');
        $data['Agency'] = I('Agency','', 'trim');
        $data['ZKDW'] = I('ZKDW','', 'trim');
        $data['Username'] = I('Username','', 'trim');
        $data['Password'] = md5('xy197585');
        $data['Sex'] = I('Sex','', 'trim');
        $data['Brithday'] = I('Brithday','', 'trim');
        $data['Photo'] = I('Photo','', 'trim');
        $data['Identity'] = I('Identity','', 'trim');
        $data['Tel'] = I('Tel','', 'trim');
        $data['ZKZH'] = I('ZKZH','', 'trim');
        $data['KCH'] = I('KCH','', 'trim');
        $data['ZWH'] = I('ZWH','', 'trim');
        $data['KDMC'] = I('KDMC','', 'trim');
        $data['KDDZ'] = I('KDDZ','', 'trim');
        $data['KSRQ'] = I('KSRQ','', 'trim');
        $data['KSQZSJ'] = I('KSQZSJ','', 'trim');
        $data['KSKM'] = I('KSKM','', 'trim');
        $data['Status'] = 1;
        $data['CreateDate'] = time();
        if(!$data['ExamID'])  {$returnStr = '参数丢失：考试ID为空'; $this->error($returnStr);}
        if(!$data['ClassID'])  {$returnStr= '参数丢失：岗位代码为空';$this->error($returnStr);}
        if(!$data['Agency'])  {$returnStr = '参数丢失：岗位名称为空'; $this->error($returnStr);}
        if(!$data['ZKDW'])  {$returnStr = '参数丢失：招考单位为空'; $this->error($returnStr);}
        if(!$data['Username'])  {$returnStr= '参数丢失：用户名为空'; $this->error($returnStr);}
        if(!$data['Sex'])  {$returnStr = '参数丢失：性别为空'; $this->error($returnStr);}
        if(!$data['Brithday'])  {$returnStr = '参数丢失：生日为空'; $this->error($returnStr);}
        if(!$data['Photo'])  {$returnStr = '参数丢失：个人照片为空'; $this->error($returnStr);}
        if(!$data['Identity'])  {$returnStr = '参数丢失：身份证号为空'; $this->error($returnStr);}
        if(!$data['Tel'])  {$returnStr = '参数丢失：联系电话为空！';$this->error($returnStr);}
        if(!$data['ZKZH'])  {$returnStr = '参数丢失：准考证号为空！'; $this->error($returnStr);}
        if(!$data['KCH'])  {$returnStr = '参数丢失：考场号为空！'; $this->error($returnStr);}
        if(!$data['ZWH'])  {$returnStr = '参数丢失：座位号为空！'; $this->error($returnStr);}
        if(!$data['KDMC'])  {$returnStr = '参数丢失：考点名称为空！'; $this->error($returnStr);}
        if(!$data['KDDZ'])  {$returnStr = '参数丢失：考点地址为空！'; $this->error($returnStr);}
        if(!$data['KSRQ'])  {$returnStr = '参数丢失：考试科目为空！'; $this->error($returnStr);}
        if(!$data['KSQZSJ'])  {$returnStr = '参数丢失：考试起止时间为空！'; $this->error($returnStr);}
        if(!$data['KSKM'])  {$returnStr = '参数丢失：考试科目为空！'; $this->error($returnStr);}
        if($ExamineeID!=null && $ExamineeID >0){
            if ($this->HaveExaminee($ExamineeID)) {
                $result = $Examinee->where(array('ID' => $ExamineeID))->save($data);
                if (false !== $result || 0 !== $result) {
                    $returnStr = '修改成功！'; $this->success($returnStr);
                } else {
                    $returnStr = '修改失败！'; $this->error($returnStr);
                }
            }else{
                $returnStr = '非法考生或者考生不存在！'; $this->error($returnStr);
            }

        }
        else{
            $returnStr = '非法考生或者考生不存在！'; $this->error($returnStr);
        }
        /* else{
           * $result = $Examinee->add($data);

             if ($result){
                 $returnStr['status'] = 1;
                 $returnStr['errormsg'] = '提交成功';
                 $this->ajaxReturn($returnStr);
             }else{
                 $returnStr['errormsg'] = '提交失败!';
                 $this->ajaxReturn($returnStr);
             }
         }*/
    }

    /**
     * 修改考生--展示
     * author: lying
     * Date: 2018/10/15
     * param id int
     * return json
     */
    function EditExaminee()
    {
        $ID = I('ID','', 'trim');
        if(!$this->HaveExaminee($ID)) {
            $returnStr['errormsg'] = '非法考生或者考生不存在!';
            $this->error($returnStr['errormsg']);
        }
        else {
            $Examinee = M('Examinee');
            $res = $Examinee->where('id='.$ID)->find();
            $this->assign('data',$res);
            $this->display();
        }
    }

}