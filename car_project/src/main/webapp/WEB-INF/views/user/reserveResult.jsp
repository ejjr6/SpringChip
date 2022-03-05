<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script>

	
	var result = '${result}';
	
	if(result != ''){
		if(result){
			var go = confirm("예약정보를 확인하시겠습니까?");
			if(go){
				location.href="${path}/user/myPage"
			}else{
				location.href="${path}"
			}
		}else{
			location.href="${path}";
		}
	}
</script>	


<!-- 화면 전환 페이지 / 디자인 적용 필요없는 페이지 -->
