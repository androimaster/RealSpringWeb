<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="/resources/js/common.js"></script>
</head>
<script>
function getMessage(no) {
    util.requestSync("<c:url value='/study/getMessage" + no + "'/>", null, "GET", result);
}

function result(data) {
    alert(data.name);
}

window.onload = function() {
    util.initSelectBox('type', 'master', '', 'Y');

    $('#menu1').click(function(){
        showLoad("<c:url value="/study/exception404"/>");
    });

    $('#menu2').click(function(){
        showLoad("<c:url value="/study/exceptionByZero"/>");
    });

    $('#menu3').click(function(){
        showLoad("<c:url value="/study/registForm"/>");
    });
}

function showLoad(url) {
    $('#frame').load(url, function(response, status) {
        if(status =='error') {
            $(this).html(response);
        }
    });
}
</script>
<body>
<div style="border:1px solid;width:100%;height:50px;text-align:right;">${ServerInfo}</div>
<div id="leftFrame" style ="float:left; width: 200px; height:500px;">
    <h2>${combo}</h2>
    1. 클래스를 이용한 JSON 반환<input type="button" value="getMessage1" onClick="javascript:getMessage(1)" /><br>
    2. Map을 이용한 JSON 반환  <input type="button" value="getMessage2" onClick="javascript:getMessage(2)" /><br>
     <select id="type" style="width:140px"></select><br>
    3. <a href="<c:url value="/study/exception404"/>">404 Error</a> <br>
    4. <a href="<c:url value="/study/exceptionByZero"/>">By Zero Error</a> <br>
    5. <a href="<c:url value="/study/registForm" />">회원가입</a><br/>
    <hr>
    1. <span id="menu1" style="cursor:pointer;">404 Error</span><br>
    2. <span id="menu2" style="cursor:pointer;">By Zero Error</span><br>
    3. <span id="menu3" style="cursor:pointer;">회원가입</span><br>
</div>
<div id="frame" style="width:calc(100% - 202px);width:-moz-calc(100% - 202px);width:-webkit-calc(100% - 202px);overflow:overflow-y;height:400px; border:solid 1px;float:left;">
</div>
</body>
</html>
