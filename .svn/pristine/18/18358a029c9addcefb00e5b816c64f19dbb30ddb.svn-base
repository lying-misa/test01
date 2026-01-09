<?php
namespace Admin\Controller;

use Think\Controller;

class ScoreController extends CommonController
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
        $map['Status'] = 1;
        /*  if($ZKZH!=NULL && $ZKZH!=""){
                $map['ZKZH'] = $ZKZH;
            }
            if($Identity!=NULL && $Identity!=""){
                $map['Identity'] = $Identity;
            }
        */
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
        $this->display(); // 输出模板
    }

    /**
     * 分数列表
     * author: lying
     * Date: 2018/10/18
     * param where
     * return array
     */
    function ScoreList()
    {
        $ID = I('ExamID','', 'trim')?I('ExamID','', 'trim'):1;
        $map = array();
        $map['Status'] = 1;
        if($ZKZH!=NULL && $ZKZH!=""){
            $map['ZKZH'] = $ZKZH;
        }
        if($Identity!=NULL && $Identity!=""){
            $map['Identity'] = $Identity;
        }
        $p = $_GET['p']?$_GET['p']:1;
        $Examinee = M('Examinee');
        $Exam = M('Exam');
        $list = $Examinee->where($map)
            ->page($_GET['p'].',15')
            ->field('ID,ExamID,Username,Sex,Brithday,Identity,Tel,ZKZH,Status,Score,CreateDate')
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
        $this->display(); // 输出模板
    }
    /**
     * 导出分数
     * author: lying
     * Date: 2018/10/19
     * param where
     * return array
     */
    function ExportExcel(){
        $ID = I('ExamID','', 'trim')?I('ExamID','', 'trim'):1;
        if($ID && $this->HaveExam($ID)) {
            $map['Status'] = 1;
            $Examinee = M('Examinee');
            $list = $Examinee->where($map)
                ->field('ID,Username,Identity,ZKZH,KCH,ZWH,Score')
                ->select();
            header('Content-type: text/html; charset=utf-8');
            vendor('PHPExcel.PHPExcel');
            $objPHPExcel = new \PHPExcel();
            // 如果excel文件后缀名为.xls
            vendor("PHPExcel.PHPExcel.Writer.Excel5");
            //设置宽度
            $objPHPExcel->getActiveSheet()->getColumnDimension('W')->setWidth(25);
            $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(15);
            $filename = '考生考试成绩.xlsx';
            //Excel表格式
            $letter = array('A', 'B', 'C', 'D', 'E', 'F', 'G');
            //表头数组
            $tableheader = array('ID', '考场号', '座位号', '姓名', '身份证号', '准考证号', '分数');
            $count_header = count($tableheader);
            //设置sheet的列名称
            for($k = 0; $k <$count_header; $k++) {
                $objPHPExcel->getActiveSheet()->setCellValue($letter[$k].'1',$tableheader[$k]);//第一行数据
            }
            $count = count($list);
            //填充表格信息
            for ($i = 2,$s=0; $s <$count; $i++,$s++) {
                $objPHPExcel->getActiveSheet()->setCellValue($letter[0].$i, $list[$s]['ID']);
                $objPHPExcel->getActiveSheet()->setCellValue($letter[1].$i, $list[$s]['KCH']);
                $objPHPExcel->getActiveSheet()->setCellValue($letter[2].$i, $list[$s]['ZWH']);
                $objPHPExcel->getActiveSheet()->setCellValue($letter[3].$i, $list[$s]['Username']);
                $objPHPExcel->getActiveSheet()->setCellValue($letter[4].$i, "'".$list[$s]['Identity']);
                $objPHPExcel->getActiveSheet()->setCellValue($letter[5].$i,"'".$list[$s]['ZKZH']);
                $objPHPExcel->getActiveSheet()->setCellValue($letter[6].$i, $list[$s]['Score']);
            }
            header("Pragma: public");
            header("Expires: 0");
            header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
            header("Content-Type:application/force-download");
            header("Content-Type:application/vnd.ms-execl");
            header("Content-Type:application/octet-stream");
            header("Content-Type:application/download");;
            header('Content-Disposition:attachment;filename='.$filename.'');
            header("Content-Transfer-Encoding:binary");
            $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
            $objWriter->save('php://output');
        }
        else{
            $returnStr['errormsg'] = '非法考试或者考试不存在!';
            //  $this->ajaxReturn($returnStr);
            $this->error($returnStr['errormsg']);
        }
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
}
?>