<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
#doc {
	width:1370px;
	clear: both;
	/* margin: 0 auto; */
    border: 0 none;
    background: #ffffff none repeat scroll 0 0;
    outline: 0 none;
    padding: 0;
}

#dropzone {
    border:2px dotted #3292A2;
    width:90%;
    height:50px;
    color:#92AAB0;
    text-align:center;
    font-size:24px;
    padding-top:12px;
    margin-top:10px;
}
</style>
<script>
$(function () {
    var obj = $("#dropzone");

    obj.on('dragenter', function (e) {
         e.stopPropagation();  //상위 노드로 가는 이벤트를 멈춘다.
         e.preventDefault();  //현재 객체에 있는 모든 실행요소를 멈춘다.
         $(this).css('border', '2px solid #5272A0');
    });

    obj.on('dragleave', function (e) {
         e.stopPropagation();
         e.preventDefault();
         $(this).css('border', '2px dotted #8296C2');
    });

    obj.on('dragover', function (e) {
         e.stopPropagation();
         e.preventDefault();
    });

    obj.on('drop', function (e) {
         e.preventDefault();
         $(this).css('border', '2px dotted #8296C2');

         var files = e.originalEvent.dataTransfer.files;
         if(files.length < 1)
              return;
                  
         for(var i = 0; i < files.length; i++) {
        	 var file = files[i];
	        $("#downloadzone").append("<a href='<c:url value='/common/getFileDownload.html'/>?filename="+file.name+"'>"+file.name+"</a>\n");
        	 
         }
         F_FileMultiUpload(files, obj);
    });
  //파일 멀티 업로드
    function F_FileMultiUpload(files, obj) {
         if(confirm(files.length + "개의 파일을 업로드 하시겠습니까?") ) {
             var data = new FormData();
             for (var i = 0; i < files.length; i++) {
                data.append('files', files[i]);
             }

             var url = "<c:url value='/common/upload2.html'/>";
             $.ajax({
                url: url,
                method: 'POST',
                data: data,
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function(res) {
                    F_FileMultiUpload_Callback(res.files);
                }
             });
         }
    }

    // 파일 멀티 업로드 Callback
    function F_FileMultiUpload_Callback(files) {
         for(var i=0; i < files.length; i++)
             console.log(files[i].file_nm + " - " + files[i].file_size);
    }
    function fnAlert(e, msg) {
    	e.stopPropagation();
    	alert(msg);
    }
});

function fnDown() {
	getFileDownload.html
}
</script>
</head>
<body>
	<div id="dropzone">Drag & Drop Files Here</div>
	<div id="downloadzone"></div>
</body>
</html>