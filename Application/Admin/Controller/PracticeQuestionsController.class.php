<?php
namespace Admin\Controller;

use Think\Controller;

class PracticeQuestionsController extends Controller
{

    /**
     * 题目列表
     * author: lying
     * Date: 2018/10/16
     * param where
     * return array
     */
    function Lists()
    {
        $map = array();
        $map['Status'] = 1;
        $keywords = I('keywords','', 'trim');
        if($keywords!=NULL && $keywords!=""){
            $map['Title'] = array('like','%'.$keywords.'%');
        }
        $Type = I('Type','', 'trim');
        if($Type!=NULL && $Type!="" && in_array($Type, array(1, 2, 3,4,5,6))){
            $map['Type'] = $Type;
        }
        $Questions = M('PracticeQuestions');
        $list = $Questions->where($map)
            ->page($_GET['p'].',15')
            ->field('ID,Title,Type,CreateDate')
            ->select();
        $this->assign('list',$list);
        $count      = $Questions->where($map)->count();
        $Page       = new \Think\Page($count,15);
        foreach($map as $key=>$val) {
            $Page->parameter[$key]   =   urlencode($val);
        }
        $Subject = M('Subject');
        $slist = $Subject->select();
        $count = count($list);
        for($i=0;$i<$count;$i++){
            if($slist[$i]['Grade']!=null && $slist[$i]['Grade']!='')
                $slist[$i]['Grades'] = explode(',',$slist[$i]['Grade']);
        }
        $show  = $Page->show();
        $this->assign('slist',$slist);// 赋值数据集
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->display(); // 输出模板
    }
    /**
     * 导入试卷题目
     * author: lying
     * Date: 2018/10/15
     */
    public function ImportExamer(){
        $this->display();
    }
    /**
     * 读取excel文件
     * author lying
     * Date: 2018/10/15
     * param  string $file
     * return  array
     */
    function ReadExcel($file,$info){
        header('Content-type: text/html; charset=utf-8');
        vendor('PHPExcel.PHPExcel');
        $Excel = new \PHPExcel();
        // 如果excel文件后缀名为.xls
        vendor("PHPExcel.PHPExcel.Reader.Excel5");
        // 如果excel文件后缀名为.xlsx
        // vendor("PHPExcel.PHPExcel.Reader.Excel2007");
        $PHPReader = new \PHPExcel_Reader_Excel5();
        $Excel = $PHPReader -> load($file);
        $currentSheet = $Excel -> getSheet(0);
        $allColumn = $currentSheet -> getHighestColumn();
        $allRow = $currentSheet -> getHighestRow();
        for($currentRow = 2,$i=1; $currentRow <= $allRow; $currentRow++,$i++) {
            for($currentColumn = 'A'; $currentColumn <= $allColumn; $currentColumn++) {
                $address = $currentColumn.$currentRow;
                $arr[$i][$currentColumn] = $currentSheet
                    -> getCell($address)
                    -> getValue();
            }
            $arr[$i]['GradeID'] = $info['GradeID'];
            $arr[$i]['SubjectID'] = $info['SubjectID'];
            $arr[$i]['Type'] = $info['Type'];
        }

        return $arr;
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
        $base['Type'] = I('Type', '', 'trim');
        $base['SubjectID'] = I('SubjectID', '', 'trim');
        $base['GradeID'] = I('GradeID', '', 'trim');
        $returnStr['status'] = 0;
        header("Content-Type:text/html;charset = utf-8");
        $upload = new \Think\Upload();
        $upload->maxSize = $_FILES['excelData']['size'];
        $upload->exts = array('xls', 'xlsx');
        $upload->rootPath = 'Public/Upload/Questions/';
        $info = $upload->uploadOne($_FILES['excelData']);
        $filepath = $upload->rootPath . $info['savepath'] . $info['savename'];
        $exts = $info['ext'];
        if (!$info) {
            $this->error($upload->getError());
        } else {
            if (in_array($base['Type'],array(1, 2, 3, 4, 5, 6))) {
                $data['Path'] = $upload->rootPath . $info['savepath'] . $info['savename'];
                $data['Tip'] = '题目上传';
                $data['CreateDate'] = time();
                $Uploadfile = M('Uploadfile');
                $result = $Uploadfile->add($data);
                if ($result !== false) {
                    //  $this->success('上传成功！');
                    //导出excel数据
                    $arr = $this->ReadExcel($filepath,$base);
                    //导入数据库
                    $res = $this->Arr2ImportQuestions($arr);
                    if ($res['sussess']) {
                        $this->success('上传成功！一共：' . $res['num'] . '条记录,成功：' . $res['sussess'] . '条记录。重复：' . $res['repeat'] . '条记录');
                    } else {
                        $this->success('上传成功！一共：' . $res['num'] . '条记录,成功：' . $res['sussess'] . '条记录。重复：' . $res['repeat'] . '条记录');
                    }
                } else {
                    $this->error('上传失败！');
                }
            } else {
                $this->error('非法题型！');
            }
        }
    }
    /**
     * 二维数组存入试题数据
     * author: lying
     * Date: 2018/10/16
     * param arr array
     * return bool
     */
    function Arr2ImportQuestions($arr){
        $count = count($arr);
        $Questions = M('OldQuestions');
        $returnStr = array();
        $i=1;
        $returnStr['sussess']=0;
        $returnStr['repeat'] = 0;
        for(;$i<=$count;$i++) {
            $data['Type'] = $arr[$i]['Type'];
            $data['Title'] = $arr[$i]['A'];
            $arr1 = array();
            if($arr[$i]['Type']==3){
                $arr1[] = $arr[$i]['B'];
                $arr1[] = $arr[$i]['C'];
                $data['Answer'] = $arr[$i]['D'];
            }elseif($arr[$i]['Type'] == 2){
                $arr1[] = $arr[$i]['B'];
                $arr1[] = $arr[$i]['C'];
                $arr1[] = $arr[$i]['D'];
                $arr1[] = $arr[$i]['E'];
                $arr1[] = $arr[$i]['F'];
                $data['Answer'] = $arr[$i]['G'];
            }elseif($arr[$i]['Type'] == 1){
                $arr1[] = $arr[$i]['B'];
                $arr1[] = $arr[$i]['C'];
                $arr1[] = $arr[$i]['D'];
                $arr1[] = $arr[$i]['E'];
                $data['Answer'] = $arr[$i]['F'];
            }else{
                $data['Answer'] = $arr[$i]['B'];
            }
            $data['Options'] = json_encode($arr1);
            $data['Status'] = 1;
            $data['Mode'] = 0;
            $data['CreateDate'] = time();
            $where = array(
                'Type'=> $data['Type'],
                'Title'=> $data['Title'],
                'Options'=> $data['Options'],
                'Answer'=> $data['Answer']
               // 'Mode'=> 0
            );
            if(!$this->HaveQuestions($where) && $data['Answer']!=null) {
                $res = $Questions->add($data);
                if ($res)
                    $returnStr['sussess'] = $returnStr['sussess'] + 1;
            }else{
                $returnStr['repeat'] = $returnStr['repeat']+1;
            }

        }
        $returnStr['num'] = $count;
        return $returnStr;
    }

    /**
     * 检查试题是否存在
     * author: lying
     * Date: 2018/10/15
     * param data array
     * return bool
     */
    function HaveQuestions($where)
    {
        $Questions = M('OldQuestions');
        if (!$where) return false;
        else {
            $res = $Questions->where($where)->find();
            if (!$res) return false;
            else return true;
        }
    }

    /**
     * 修改题目
     * author: lying
     * Date: 2018/10/17
     * param id int
     * return string
     */
    function EditQuestions()
    {
        $Questions = M('OldQuestions');
        $ID = I('ID', '', 'trim');
        if(!$this->HaveQuestions(array('ID'=>$ID))) {
            $returnStr['errormsg'] = '非法考试或者考试不存在!';
            $this->error($returnStr['errormsg']);
        }
        else {
            $Questions = M('OldQuestions');
            $res = $Questions->where('id='.$ID)->find();
            //拆分题目
			$res['options'] = json_decode($res['options'],true);
			$this->assign('data',$res);
            $this->display();
        }
    }
    /**
     * 保存题目
     * author: lying
     * Date: 2018/10/17
     * param post array
     * return string
     */
    function SaveQuestions()
    {
        $time = time();
        $Questions = M('OldQuestions');
        $ID = I('ID', '', 'trim');
        $data['Type'] = I('Type','', 'trim');
        $data['Title'] = I('Title','', 'trim');
        $data['Options'] = I('Options','', 'trim');
        $data['Answer'] = I('Answer','', 'trim');
        $data['Status'] = 1;
        $data['Mode'] = 0;
        $data['CreateDate'] = $time;
        if(!$data['Type'])  {$returnStr['errormsg'] = '参数丢失：题目类型为空';$this->error($returnStr['errormsg']);}
        if(!$data['Title'])  {$returnStr['errormsg'] = '参数丢失：题目名称为空！';$this->error($returnStr['errormsg']);}
        if(!$data['Options'])  {$returnStr['errormsg'] = '参数丢失：题目选项为空！';$this->error($returnStr['errormsg']);}
        if(!$data['Answer'])  {$returnStr['errormsg'] = '参数丢失：题目答案为空！';$this->error($returnStr['errormsg']);}
        if($ID!=null && $ID >0){
            if ($this->HaveQuestions($ID)) {
                $result = $Questions->where(array('ID' => $ID))->save($data);
                if (false !== $result || 0 !== $result) {
                    $returnStr['errormsg'] = '修改成功';
                    $this->success($returnStr['errormsg']);
                } else{
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
            $where = array(
                'Type'=> $data['Type'],
                'Title'=> $data['Title'],
                'Options'=> $data['Options'],
                'Answer'=> $data['Answer']
               // 'Mode'=> 0
            );
            if(!$this->HaveQuestions($where)) {
                $result = $Questions->add($data);
                $data['Options'] = json_encode( $data['Options']);
                if ($result){
                    $returnStr['status'] = 1;
                    $returnStr['errormsg'] = '提交成功';
                    $this->success($returnStr['errormsg']);
                }else{
                    $returnStr['errormsg'] = '提交失败!';
                    $this->error($returnStr['errormsg']);
                }
            }else{
                $returnStr['errormsg'] = '题目重复：题目已存在!';
                $this->error($returnStr['errormsg']);
            }

        }
    }

    /**
     * 生成试卷
     * author: lying
     * Date: 2018/10/17
     * param id int
     * return array
     */
    function MakePages(){
        $ExamID = I('ExamID', '', 'trim');
        $Exam = M('OldExam');
        $Questions = array();
        $Answers = array();
        if(!$ExamID) $this->error('非法入口！');
        else{
            if(!$this->HaveExam($ExamID)) {
                $returnStr['errormsg'] = '非法考试或者考试不存在!';
                $this->error($returnStr['errormsg']);
            }else{
                $arr = $Exam->where('ID='.$ExamID)
                    ->field('ID,Option,Multiple,Judge')
                    ->find();
                if ($arr['Option'] > 0 && $arr['Multiple'] > 0 && $arr['Judge'] > 0) {
                    //选择题
                    $field_questions = 'ID,Title,Options,Type';
                    $field_answers = 'ID,Answer,Type';
                    $where['type'] = 1;
                    $Questions['Options'] = $this->RandQuestion($where, $field_questions, $arr['Option']);
                    $Answers['Options'] = $this->RandQuestion($where, $field_answers, $arr['Option']);
                    //多选题
                    $where['type'] = 2;
                    $Questions['Multiple'] = $this->RandQuestion($where, $field_questions, $arr['Multiple']);
                    $Answers['Multiple'] = $this->RandQuestion($where, $field_answers, $arr['Multiple']);
                    //判断题
                    $where['type'] = 3;
                    $Questions['Judge'] = $this->RandQuestion($where, $field_questions, $arr['Judge']);
                    $Answers['Judge'] = $this->RandQuestion($where, $field_answers, $arr['Judge']);
                    //汇总
                    $QuestionArr = $this->HuiZong($Questions);
                    $AnswersArr = $this->HuiZong($Answers);
                }else
                    $this->error("考试选择题或多选题或判断题数目为空，请重新设置这场考试！");
                //生成试卷
                $pager['ExamID'] = $ExamID;
                $pager['Questions'] = json_encode($QuestionArr);
                $pager['Answers'] = json_encode($AnswersArr);
                $pager['Status'] = 1;
                $pager['CreateDate'] = time();
                $this->MakeExam($pager);
            }
        }
    }
    /**
     * 随机取出题目
     * author: lying
     * Date: 2018/10/17
     * param where array
     * return data array
     */
    function RandQuestion($where,$field,$num){
        $where['mode'] = 0;
        $where['status'] = 1;
        $Questions = M('OldQuestions');
        $arr = $Questions->where($where)
            ->field($field)
            ->limit($num)
            ->select();
        return $arr;
    }
    /**
 * 检查考试ID是否存在
 * author: lying
 * Date: 2018/10/15
 * param id int
 * return bool
 */
    public function HaveExam($ID){
        $Exam = M('OldExam');
        if(!$ID) return false;
        else{
            $res = $Exam->where('id='.$ID)->find();
            if(!$res) return false;
            else return true;
        }
    }
    /**
     * 生成试卷考试
     * author: lying
     * Date: 2018/10/17
     * param data array
     * return bool
     */
    public function MakeExam($data){
        $ID = I('ExamID', '', 'trim');
        $ExaminationPager = M('OldExaminationPager');
        if(!$this->HaveExamPager($ID)) {
            $result = $ExaminationPager->add($data);
            if ($result) {
                $this->success('生成成功！');
            } else {
                $this->error("生成失败！");
            }
        }
        else{
            $this->error("此场考试已经生成了试卷，如要覆盖请联系管理员！");
        }
    }

    /**
     * 检查这场考试是否已经生成试卷
     * author: lying
     * Date: 2018/10/15
     * param id int
     * return bool
     */
    public function HaveExamPager($ID){
        $ExaminationPager = M('OldExaminationPager');
        if(!$ID) return false;
        else{
            $res = $ExaminationPager->where('ExamID='.$ID)->find();
            if(!$res) return false;
            else return true;
        }
    }

    /**
     * 删除考题
     * author: lying
     * Date: 2018/10/18
     * param id int
     * return json
     */
    public function DelQuestions(){
        $returnStr['status'] = 0;
        $QuestionsArr = implode(",",I('ID','','trim'));
        $Questions = M('OldQuestions');
        if(!$QuestionsArr) return false;
        else{
            $res = $Questions->where('ID in('.$QuestionsArr.')')->delete();
            if ($res) {
                $returnStr['status'] = 1;
                $returnStr['errormsg'] = '删除成功!';
            }
            else{
                $returnStr['errormsg'] = '删除失败!';
            }
        }
        $this->ajaxReturn($returnStr);
    }

    /**
     * 三维数组转化为二维数组
     * author: lying
     * Date: 2018/10/18
     * param id int
     * return json
     */
    function HuiZong($arr){
        //汇总
        $count1 = count( $arr['Options'] );
        $count2 = count( $arr['Multiple'] );
        $count3 = count( $arr['Judge'] );
        for($i=0;$i<$count1;$i++){
            $array[$i] = $arr['Options'][$i];
        }
        for($k=$count1,$i=0;$i<$count2;$i++,$k++){
            $array[$k] = $arr['Multiple'][$i];
        }
        for($k=($count1+$count2),$i=0;$i<$count3;$i++,$k++){
            $array[$k] = $arr['Judge'][$i];
        }
        return $array;
    }

}
?>