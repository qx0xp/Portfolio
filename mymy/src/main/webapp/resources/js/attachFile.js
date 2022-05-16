// 확장자 제한 : exe, sh, zip, alz 제한
var exReg=/(.*?)\.(exe|sh|zip|alz)$/;
// 크기 제한(5mb)
var maxSize=5242880;

// 업로드 파일 제한 함수
function checkFile(fileName, fileSize){
	if(exReg.test(fileName)){
		alert("해당 타입의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	if(fileSize>=maxSize){
		alert("업로드 가능한 사이즈를 초과하였습니다.");
		return false;
	}
	
	return true;
}

$(document).ready(function(){
	$("#uploadBtn").on("click", function(){
		// FormData객체 생성
		var formData=new FormData();
		var inputFile=$("#uploadFile");
		var files=inputFile[0].files;
		console.log(files); // 확인
		
		for(var i=0; i<files.length; i++){
			if(!checkFile(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			type:"post",
			url:"/upload",
			data:formData, // formData자체 전송
			processData:false, // 일반적으로 서버에 전달되는 데이터 형태는 query String
			contentType:false, // multipart/form-data 전송 목적
			success:function(result){
				console.log("success 확인" + result); // 결과 확인용
				var str="";
				$(result).each(function(i, obj){
					str+="<li>"+obj.fileName+"</li>";
				})
				$("#test").html(str);
			}
		})
		
		$(".mainForm").submit();
	})
})
