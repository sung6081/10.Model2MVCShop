
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>



<%--
Purchase purchaseVO = (Purchase)request.getAttribute("purchaseVO");
--%>



<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchaseView?tranNo=${purchase.tranNo }<%-- purchaseVO.getTranNo() --%>" method="post">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${purchase.purchaseProd.prodNo }<%-- purchaseVO.getPurchaseProd().getProdNo() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${purchase.buyer.userId }<%-- purchaseVO.getBuyer().getUserId() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
		
			<%-- purchaseVO.getPaymentOption() --%>
		<x:if test="${purchase.paymentOption eq '1' }">
			���ݱ���
		</x:if>
		<x:if test="${purchase.paymentOption eq '2' }">
			�ſ뱸��
		</x:if>
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purchase.receiverName }<%-- purchaseVO.getReceiverName() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purchase.receiverPhone }<%-- purchaseVO.getReceiverPhone() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purchase.divyAddr }<%-- purchaseVO.getDivyAddr() --%></td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purchase.divyRequest }<%-- purchaseVO.getDivyRequest() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${purchase.divyDate }<%-- purchaseVO.getDivyDate() --%></td>
		<td></td>
	</tr>
</table>
<!--  <input type="submit" value="Ȯ��" > -->
</form>

</body>
</html>