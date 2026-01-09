//+---------------------------------------------------  
//| 日期合法性验证  
//| 格式为：YYYY-MM-DD或YYYY/MM/DD  
//+---------------------------------------------------  
function IsValidDate(DateStr)   
{   
    var sDate=DateStr.replace(/(^\s+|\s+$)/g,''); //去两边空格;   
    if(sDate=='') return true;   
    //如果格式满足YYYY-(/)MM-(/)DD或YYYY-(/)M-(/)DD或YYYY-(/)M-(/)D或YYYY-(/)MM-(/)D就替换为''   
    //数据库中，合法日期可以是:YYYY-MM/DD(2003-3/21),数据库会自动转换为YYYY-MM-DD格式   
    var s = sDate.replace(/[\d]{ 4,4 }[\-/]{ 1 }[\d]{ 1,2 }[\-/]{ 1 }[\d]{ 1,2 }/g,'');   
	if (s!='') //说明格式满足YYYY-MM-DD或YYYY-M-DD或YYYY-M-D或YYYY-MM-D   
    {   
        var t=new Date(sDate.replace(/\-/g,'/'));   
        var ar = sDate.split(/[-/:]/);   
        
		if(ar[0] != t.getFullYear() || ar[1] != t.getMonth()+1 || ar[2] != t.getDate())   
        {   
            alert('错误的日期格式！格式为：YYYY-MM-DD或YYYY/MM/DD。注意闰年。');   
            return false;   
        }   
    }   
    else   
    {   
        alert('错误的日期格式！格式为：YYYY-MM-DD或YYYY/MM/DD。注意闰年。');   
        return false;   
    }   
    return true;   
}   
  
//+---------------------------------------------------  
//| 日期时间检查  
//| 格式为：YYYY-MM-DD HH:MM:SS  
//+---------------------------------------------------  
function CheckDateTime(str)  
{   
    var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;   
    var r = str.match(reg);   
    if(r==null)
	{
		alert('错误的日期格式！格式为：YYYY-MM-DD HH:MM:SS。');   
        return false;
	 }   
    r[3]=r[3]-1;   
    var d= new Date(r[1],r[3],r[4],r[5],r[6],r[7]);   
    
	if(d.getFullYear()!=r[1])
	{
		alert('错误的日期格式！格式为：YYYY-MM-DD HH:MM:SS。');   
        return false;
	 }   
    if(d.getMonth()!=r[3])
	{
		alert('错误的日期格式！格式为：YYYY-MM-DD HH:MM:SS。');   
        return false;
	 }   
    if(d.getDate()!=r[4])
	{
		alert('错误的日期格式！格式为：YYYY-MM-DD HH:MM:SS。');   
        return false;
	 }   
    if(d.getHours()!=r[5])
	{
		alert('错误的日期格式！格式为：YYYY-MM-DD HH:MM:SS。');   
        return false;
	 }   
    if(d.getMinutes()!=r[6])
	{
		alert('错误的日期格式！格式为：YYYY-MM-DD HH:MM:SS。');   
        return false;
	 }   
    if(d.getSeconds()!=r[7])
	{
		alert('错误的日期格式！格式为：YYYY-MM-DD HH:MM:SS。');   
        return false;
	 }   
    return true;   
}   
