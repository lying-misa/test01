$(document).ready(function () {
	"use strict";
	//全选
	$("#checkall").click(function () {
		var all = $(this).is(':checked');
		$("input[name='ID[]']").each(function () {
			if (all) {
				this.checked = true;
			} else {
				this.checked = false;
			}
		});
	});
	//全选-单选
	$("input[name='ID[]']").on('click', function () {
		var check = $("input[name='ID[]']");
		var chknum = check.length;
		var chk = 0;
		check.each(function () {
			if ($(this).is(':checked')) {
				chk++;
			}
		});
		if (chk === chknum) { //全选
			$("#checkall").prop("checked", true);
		} else { //不全选
			$("#checkall").prop("checked", false);
		}
	});


	//搜索
	$("#changesearch").click(function () {

	});
	
	

	//单个删除
	$(".delsingle").on("click",function(){
        var t = confirm("您确认要删除选中的内容吗？");
        if (t === false) {
            return false;
        }
        else{
			var form=$("#listform");
			var url=form.attr("action");
			var delid=[];
			delid[0]=$(this).data("id");
			$.ajax({
				type: 'POST',
				data: {ID:delid},
				url: url,
				success: function(result){
					if(result.status) {
                        alert(result.errormsg);
                        window.location.reload();
                    }
					else{
                        alert(result.errormsg);
					}
					window.location.reload();
				},
			});
		}
	});
	//批量删除
	$("#DelSelect").click(function () {
		var Checkbox = false;
		$("input[name='ID[]']").each(function () {
			if (this.checked === true) {
				Checkbox = true;
			}
		});
		if (Checkbox) {
			var t = confirm("您确认要删除选中的内容吗？");
			if (t === false) {
				return false;
			}
			delexam();
		} else {
			alert("请选择您要删除的内容!");
			return false;
		}
	});
	function delexam(){
		$("#listform").ajaxSubmit(function(){
			var form=$("#listform");
			var url=form.attr("action");
			$.ajax({
				type: 'POST', 
				data: form.serialize(), 
				url: url,
				success: function(result){
					if(result.status){
						window.location.reload();
					}
					alert(result.errormsg);
					
				},
			});
		});
	}
	
	
	//批量排序
	$("#sorts").click(function () {
		var Checkbox = false;
		$("input[name='id[]']").each(function () {
			if (this.checked === true) {
				Checkbox = true;
			}
		});
		if (Checkbox) {

			$("#listform").submit();
		} else {
			alert("请选择要操作的内容!");
			return false;
		}
	});
	
	$(".importstudent").on("click",function(){
		var ID = $(this).data("id");
		$("input[name='ExamID']").val(ID);
		//alert($("input[name='ExamID']").val());
		$("#hidebox").show();
	});
	$("#hide_close").click(function(){
		$("#hidebox").hide();
	});






});
