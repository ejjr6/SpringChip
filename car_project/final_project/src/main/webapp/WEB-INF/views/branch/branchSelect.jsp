<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>

<style>
	
	.form_sch{
		display : inline-block;
	}

	.br_List{
		margin : 0;
		padding : 0;
	}


	.br_List li{
		width: 900px;
		height:100px;
		list-style:none;
		padding:10px;
		border:1px solid #ccc;
		margin:5px 0;
	}
	
	.br_pagination li{
		list-style:none;
		float:left;
		padding: 3px;
		margin : 3px;
	}
	
	.br_pagination li a{
		text-decoration:none;
		color:black;
	}
	
	.car_img img{
		width: 480px;
	}
	
	.br_pagination{
		
	}
	
	.box{
	
		margin: 60px;
		height: 1000px;
	}
	
	footer{
		bottom : 0px;
	}
	
	
	
</style>
</head>
<body>

<div class="box">
	<div class="car_viewer">
		<div class="car_preview">
			<div class="car_name">
				<span class="name">▶${carVO.cname}</span>
			</div>
			<div class="car_img">
				<img src="${path}/resources/car/${carVO.cno}.png"/>
			</div>
		</div>
	</div>

	<!-- 영업점 선택 -->
	<div class="con_search">
		<div class="search_in">
			<strong class="search_tit">SEARCH</strong>
			<div class="search_box">
				<div class="form_area">
					
					<!-- 시/도 선택(selectBox) -->
					<span class="sidogubun1">
						<span class="sel_box">
							<select class="form_select" title="시/도 선택" id="city" name="city" onChange="guGun(this.value)">
								<option value="">시/도를 선택하세요</option>
									<c:forEach var="siDo" items="${siDoList}">
										<option value="${siDo.nsi}"
											<c:if test="${siDo.nsi eq pm.cri.nsi}">selected='selected'</c:if>>
											${siDo.si}
										</option>
									</c:forEach>						
							</select>
						</span>
						<span class="space"></span>
					</span>
					
					<!-- 구/군 선택(selectBox) -->
					<span class="sidogubun2">
						<span class="sel_box">
							<select class="form_select" title="시/군/구 선택" id="district" name="district">
								<option value="">구/군을 선택하세요</option>
								
<%-- 								
									<c:forEach var="guGun" items="${guGunList}">
										<option value="${guGun.ngu}"
											<c:if test="${guGun.ngu eq pm.cri.ngu}">selected='selected'</c:if>>
											${guGun.gu}
										</option>
									</c:forEach>						
 --%>							
							</select>
						</span>
					</span>
					<span class="space"></span>
					
					<!-- 검색어(keyword) 검색 -->
					<div class="form_sch">
						<div class="sch_box">
							<input type="text" class="sch_in" placeholder="검색어를 입력해주세요."/>
							<button type="submit" class="sch_btn" onclick="search()">
								<span class="r_search">검색</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 지점 리스트 -->
	<ul class="br_List"></ul>
	
	<!-- 지점 리스트 페이징 처리 -->
	<ul class="br_pagination"></ul>
	
	<div class="btn_area">
		<a href="${path}/user/userIfm">
			<span class="userWBtn">
				내용 작성
			</span>
		</a>
	</div>

</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script>
	
	// 시/구 selectBox 클릭 시 변화하는 구/군 값 
	
	function guGun(value){
		
		
		$("#district").children().remove();
		
		$("#district").append("<option value=>구/군을 선택하세요</option>");
		
		//$("#district").html("");
		
		$.ajax({
			type: "GET",
			url : "${path}/guGun",
			dataType : "json",
			data : {
				nsi : value
			},
			success : function(data){
				
				console.log(data);
				var html = "";
				if(data.length > 0){
					$(data).each(function(i){
						html = "<option value="+data[i].ngu+">"+data[i].gu+"</option>";
						$("#district").append(html);
					});
				}
			},
			error : function(res){
				alert(res.responseText);
			}
		});
	}
	
	// 검색 버튼 클릭 - 시/도 , 구/군, keyword
	function search() {
		
		var siDo = $("#city").val();
		var guGun = $("#district").val();
		var keyword = $(".sch_in").val();		
		
		// 리스트 함수 호출
		listPage(page,siDo,guGun,keyword);
		
	}

	
	/* 지점 리스트  / 페이징 처리 */
	
	// 초기값
	var page = 1;
	
	// 리스트 함수 호출
	listPage(page);
 	
	// 페이징 처리된 리스트
	function listPage(page,siDo,guGun,keyword){
		
		console.log(page);
		console.log(siDo);
		console.log(guGun);
		console.log(keyword);
		
		$.ajax({
			type : "POST",
			url : "branchSelect",
			dataType : "json",
			data : {
				page : page,
				nsi : siDo,
				ngu : guGun,
				keyword : keyword
			},
			success : function(data){
//				console.log(data);
				console.log(data.pm);
				// 리스트 출력 함수 호출
				printList(data.list);
				// 블럭 정보/page 가져오기
				printPage(data.pm);
			}
		});
	}

 	
	/* 수정 요망!! 페이징 블럭 클릭 시 - 검색 값이 반영 안됨. / 검색 결과 없을 시 - 결과없다 출력안됨. */
	
 	/* 페이징 */
 	function printPage(pm){
		var str = "";
		// 이전
		if(pm.prev){
			str += "<li><a href='"+(pm.startPage-1)+"'> << </a></li>";
		}
		 
		// 페이지 블럭
		for(var i = pm.startPage; i<=pm.endPage; i++){
			str += "<li><a href='"+i+"'> "+i+" </a></li>";
		}
		 
		// 다음
		if(pm.next){
		 	str += "<li><a href='"+(pm.endPage+1)+"'> >> </a></li>";
		}
		$(".br_pagination").html(str);
	}
 
	 /* page 가지고 오기 */
	
	$(".br_pagination").on("click","li a",function(event){
		event.preventDefault();
		var branchPage = $(this).attr("href");
		page = branchPage;
		console.log(page);
//		listPage(page);

		var siDo = $("#city").val();
		var guGun = $("#district").val();
		var keyword = $(".sch_in").val();
		
		
		listPage(page,siDo,guGun,keyword);

	});
 	
	
	// 리스트 출력
	function printList(list){
		var str = "";
		
		$(list).each(function(){
			// BranchVO == this   / bno,bName,bPhone,bAddr 
			var bno = this.bno;
			var bName = this.bname;
			var bPhone = this.bphone;
			var bAddr = this.baddr;
			
				str += "<li class='br_head'>";
//				console.log(bName+":"+bPhone+":"+bAddr);
				
				str += "<div class='branch_info'>";
				str += "<label>";
				str += "<input type='radio' id='brSelectBtn' name='branch' value="+bName+"  data-bno="+bno+" data-bname="+bName+" data-bphone="+bPhone+" data-baddr="+bAddr+"/>";
				str += bName;
				str += "</label>";
//				str += bName+" ☎"+bPhone+"<br/><hr/>"+bAddr;
				str += "<span class='tel'>";
				str += "&nbsp;&nbsp;&nbsp;☎"+bPhone;
				str += "</span>";
				str += "<hr/>";
				str += "<br/>";
				str += "<div class='address'>";
				str += "<span class='addr'>"+bAddr+"</span>";
				str += "</div>";
				str += "</div>";
				str += "</li>";
				
//				str += "<h3>검색 결과가 존재하지 않습니다.</h3>";

		});
		$(".br_List").html(str);
	}
	
	// 지점(radio 버튼) 선택 시
	$(".br_List").on("click","#brSelectBtn",function(){
		
		// div 태그에 사용자 정의 값 들고와서 session에 저장하기
		var bno = $(this).attr("data-bno");
		var bName = $(this).attr("data-bname");
		var bphone = $(this).attr("data-bphone");
		/* var baddr = $(this).attr("data-baddr"); */
		var baddr = $(".addr").html();
		console.log(bName);
		console.log(baddr);
	
		$.ajax({
			type: "Get",
			url : "${path}/branchVal",
			dataType : "json",
			data : {
				bno : bno,
				bname : bName,
				bphone : bphone,
				baddr : baddr
			},
			success : function(data){
				console.log(data);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
	});
	
	
</script>	
<jsp:include page="../common/footer.jsp"/>