<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <title>Donation</title>
    <link rel="stylesheet" href="../css/common.css">
    <!-- model에서 받아온 INPUT values -->
    <input type="hidden" id="userId" name="userId" value=${param.userId} />
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/statistics.js"></script>
    <script type="text/javascript" src="../js/ui.js"></script>
    <script type="text/javascript" src="../js/Chart.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
    <!-- header -->
    <header class="fixed">
        <h1>통계내역</h1>
        <button type="button"><span class="blind">뒤로가기</span></button>
    </header>
</body>
</html>
