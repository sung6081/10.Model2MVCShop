
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

다음과 같이 구매가 되었습니다.

<table border=1>
	<tr>
		<td>물품번호</td>
		<td>${purchase.purchaseProd.prodNo }<%-- purchaseVO.getPurchaseProd().getProdNo() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>구매자아이디</td>
		<td>${purchase.buyer.userId }<%-- purchaseVO.getBuyer().getUserId() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>구매방법</td>
		<td>
		
			<%-- purchaseVO.getPaymentOption() --%>
		<x:if test="${purchase.paymentOption eq '1' }">
			현금구매
		</x:if>
		<x:if test="${purchase.paymentOption eq '2' }">
			신용구매
		</x:if>
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자이름</td>
		<td>${purchase.receiverName }<%-- purchaseVO.getReceiverName() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>구매자연락처</td>
		<td>${purchase.receiverPhone }<%-- purchaseVO.getReceiverPhone() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>구매자주소</td>
		<td>${purchase.divyAddr }<%-- purchaseVO.getDivyAddr() --%></td>
		<td></td>
	</tr>
		<tr>
		<td>구매요청사항</td>
		<td>${purchase.divyRequest }<%-- purchaseVO.getDivyRequest() --%></td>
		<td></td>
	</tr>
	<tr>
		<td>배송희망일자</td>
		<td>${purchase.divyDate }<%-- purchaseVO.getDivyDate() --%></td>
		<td></td>
	</tr>
</table>
<!--  <input type="submit" value="확인" > -->
</form>

</body>
</html>