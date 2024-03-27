<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.List"  %>

<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.model2.mvc.service.domain.User" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<html>
<head>
<title>ȸ�� ��� ��ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
	}
	
	function fncGetUser(event) {
		self.location = "/user/getUser/"+$(event.target).text()+"?option=list&currentPage=${resultPage.currentPage}";
	}
	
	$(function() {
		
		//alert($('.ct_list_b[width=150]').html().trim());
		$($('.ct_list_b[width=150]')[0]).css('color', 'red');
		
		//alert($('tr.ct_list_pop:nth-child(3n)').html());
		$('tr.ct_list_pop:nth-child(4n+2)').css('background-color', 'whitesmoke');
		$('tr.ct_list_pop td[id=userId]').parent(':nth-child(even)').children('td.ct_line02').css('background-color', 'whitesmoke');
		//$('tr.ct_list_pop:nth-child(4n+2)').css('background-color', 'whitesmoke');
		
		//alert( $($('.ct_list_pop td')[2]).html() );
		$($('.ct_list_pop td[id=userId]')).on('click', function(event){
			 //$($('.ct_list_pop td')[2]).attr('href', '/user/getUser/${vo.userId }?option=list');
			 //self.location = "/user/getUser/"+$(event.target).text()+"?option=list&currentPage=${resultPage.currentPage}";
			 fncGetUser(event);
		 });
		$($('.ct_list_pop td[id=userId]')).css('color', 'red');
		
		//alert($('td.ct_btn01:contains("�˻�")').text().trime());
		$('td.ct_btn01:contains("�˻�")').on('click', function() {
			
			fncGetUserList('1');
			
		});
		
		$('td.btn_extend').css('color', 'red');
		$('td.btn_extend').on('click', function(event) {
			
			if($(this).text().trim() == '�ݱ�') {
				
				$(this).html('��ġ��<img width="12px" height="12px" src="/images/up_and_down.jpg">');
				$('h3').remove();
				return;
				
			}
			
			var userId = $(this).parent().children('#userId').text().trim();
			var url = "/app/user/getUser/"+userId;
			//alert(url);
			$.get(url, function(JSONData, status) {
				
				var displayValue = "<h3>"
					+"���̵� : "+JSONData.userId+"<br/>"
					+"��  �� : "+JSONData.userName+"<br/>"
					+"�̸��� : "+JSONData.email+"<br/>"
					+"ROLE : "+JSONData.role+"<br/>"
					+"����� : "+JSONData.regDateString+"<br/>"
					+"</h3>";
					//Debug...									
					//alert(displayValue);
					//$('td.btn_extend').html('��ġ��<img width="12px" height="12px" src="/images/up_and_down.jpg">');
					//$(this).html('�ݱ�<img width="12px" height="12px" src="/images/up_and_down.jpg">');
					for(var i = 0; i < $('.btn_extend').size(); i++)
					{
						if($($('td.btn_extend')[i]).text().trim() == '�ݱ�')
						{
							$($('td.btn_extend')[i]).html('��ġ��<img width="12px" height="12px" src="/images/up_and_down.jpg">');
						}
					}
					$(event.target).html('�ݱ�<img width="12px" height="12px" src="/images/up_and_down.jpg">');
					$('h3').remove();
					//alert($('#append_'+userId).text());
					//alert($(event.target).parents().children('#append_'+userId).html());
					$('#append_'+userId).html(displayValue);
				
			}, "json");
			
		});
	});
	
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/user/listUser" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">ȸ�� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<%-- <option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>ȸ��ID</option> --%>
				<option value="0" ${search.searchCondition eq "0" ? "selected" : "" }>ȸ��ID</option>
				<option value="1" ${search.searchCondition eq "1" ? "selected" : "" }>ȸ����</option>
				<%-- option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>ȸ����</option>--%>
			</select>														<%-- <%= searchKeyword %> --%>
			<input 	type="text" name="searchKeyword" value="${search.searchKeyword }"  class="ct_input_g" 
							style="width:200px; height:20px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			��ü  ${resultPage.totalCount } �Ǽ�,	���� ${resultPage.currentPage }<%-- resultPage.getCurrentPage() --%> ������ 
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID<br>
			<h7 >(id click:������)</h7></td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�̸���</td>
		<td class="ct_list_b"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<f:set var="i" value="1" />
	<f:forEach var="vo" items="${list }">
	
	<tr class="ct_list_pop">
		<td align="center">${i}</td>
		<f:set var="i" value="${i+1 }" />
		<td class="ct_line02"></td>
		<td id="userId" align="center">
			<!-- <a href="/user/getUser/${vo.userId }?option=list">${vo.userId }</a> -->
			${vo.userId }
		</td>
		<td class="ct_line02"></td>
		<td align="center">${vo.userName }</td>
		<td class="ct_line02"></td>
		<td align="center">${vo.email }<span></span>
		</td>
		<td align="right" class="btn_extend" >��ġ��<img width="12px" height="12px" src="/images/up_and_down.jpg">
		</td>		
	</tr>
	<tr>
		<td id="append_${vo.userId }" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</f:forEach>
	<%-- } --%>
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""${resultPage.currentPage }/>
			<%-- if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ --%>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
			
			<!--<f:choose>
			<f:when test="${resultPage.beginUnitPage <= resultPage.pageUnit }">
					�� ����
			</f:when>
			<%-- }else{ --%>
			<f:otherwise>
					<a href="javascript:fncGetUserList('${resultPage.beginUnitPage - 1 }<%--resultPage.getBeginUnitPage()-1--%>')">�� ����</a>
			</f:otherwise>
			</f:choose>
			<%-- } --%>

			<%--	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	--%>
			<f:forEach var="i" begin="${resultPage.beginUnitPage }" end="${resultPage.endUnitPage }" step="1" >
					<a href="javascript:fncGetUserList('${i }');">${i }</a>
			</f:forEach>
			<%-- 	}  --%>
	
			<%-- if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){
					System.out.println(resultPage.getMaxPage());--%>
			<f:choose>
				<f:when test="${resultPage.endUnitPage >= resultPage.maxPage }">
					���� ��
				</f:when>
			<%-- }else{ --%>
				<f:otherwise>
					<a href="javascript:fncGetUserList('${resultPage.endUnitPage + 1 }<%--resultPage.getEndUnitPage()+1--%>')">���� ��</a>
			<%-- } --%>
				</f:otherwise>
			</f:choose>-->
		
    	</td> 
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>