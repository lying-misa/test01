<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/12 0012
 * Time: 15:06
 */
namespace Admin\Controller;

use Think\Controller;

class AreaController extends Controller
{
    /**
     * 地域列表
     * author: lying
     * Date: 2018/10/12
     * param ID int
     * return json array
     */
    public function Index()
    {
        if (IS_POST) {
            $data['pid'] = I('ID','', 'trim');
            $Area = M('Area')->where($data)->select();

            if(!$Area) {
                $returnStr['status'] = 0;
                $returnStr['errormsg'] = '参数有误！';

            }
            else{
                $returnStr['status'] = 1;
                $returnStr['data'] = $Area;
            }
        } else {
            $pid['pid'] = 0;
            $Area = M('Area')->where($pid)->select();
            $returnStr['status'] = 1;
            $returnStr['data'] = $Area;
        }
        $this->ajaxReturn($returnStr);
    }
}