<?php
return array(
    //数据库配置信息
    'DB_TYPE'   => 'mysql', // 数据库类型
    'DB_HOST'   => '172.16.9.15', // 服务器地址
    'DB_NAME'   => 'OnlineExam', // 数据库名
    'DB_USER'   => 'root', // 用户名
    'DB_PWD'    => '123456', // 密码
    'DB_PORT'   => 3306, // 端口
    'DB_PREFIX' => '', // 数据库表前缀
    'DB_CHARSET'=> 'utf8', // 字符集
    'DB_DEBUG'  =>  TRUE, // 数据库调试模式 开启后可以记录SQL日志 3.2.3新增
    'URL_MODEL'=> '2', //URL模式 即pathinfo
	'URL_CASE_INSENSITIVE' => true,
    'DEFAULT_MODULE' => 'Home',
    'DB_PARAMS' => array(PDO::ATTR_CASE => PDO::CASE_NATURAL)
    //session(array('use_trans_sid'=>1,'expire'=>3600));
);