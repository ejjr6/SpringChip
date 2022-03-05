<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<style>

	.car_box{
		width:250px;
		height: 200px;
		margin:10px;
		border : 1px solid gray;
		float : left;
	}
	
	.car_list{
/* 		display : none; */
		margin:10px;
		float : left;
		width: 900px;
		height: 500px;
	}
	
	.car_u{
		list-style:none;
	}
	
	.car_img img{
		width:240px;
		float:left;
	}
	
	a{
		text-decoration :none;
	}
	
	.car_selector{
		position:relative;
	}
	
	.car_selector{
		margin : 100px;
	}
	
	.btn_area{
		position:absolute;
		bottom: 5;
		right: 5;
	}
	
	.car_box.change{
		background-color: gray;
	}
	
	.box{
		height: 700px;
	}
	
	footer{
		bottom: 0;
	}
	
	
</style>
</head>
<body>
<div class="box">
	<div class="car_selector">	
		<!-- 차종선택 카테고리  -->
		<div class="car_category">
			<span class="title">Category :</span>
			<div class="category">
				<span class="form_chk">
					<input type="radio" id="All" name="check01" checked="checked"/>
					<label for="All" class="form_car">
						<span class="car_category1">전체</span>
					</label>
				</span>
				<span class="form_chk">
					<input type="radio" id="truck" name="check01" value="트럭"/>
					<label for="truck" class="form_car">
						<span class="car_category2">트럭</span>
					</label>
				</span>
				<span class="form_chk">
					<input type="radio" id="bus" name="check01" value="버스"/>
					<label for="bus" class="form_car">
						<span class="car_category3">버스</span>
					</label>
				</span>
			</div>
		</div>
		
		<!-- 선택한 차종 목록 -->
		<div class="car_list">
			<ul class="car_u">
				<li class="car_scope">
					<!-- ajax data list -->
				
				</li>
			</ul>
		</div>
		
		<div class="btn_area">
			<a href="${path}/branch/branchSelect">
				<span class="branchBtn">
					영업점 선택
				</span>
			</a>
		</div>
		
	</div>
</div>	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	/* carSelect 첫페이지 차종 목록 전체 출력 */
	all();
	  
	
	/* 차종 전체 목록 호출 함수 */
	function all(){
		
		/* 차종 목록(All) */
		$.getJSON('${path}/car/carAllList',function(data){
			// data == list
			console.log(data);
			
			var str = "";
			$(data).each(function(i){
				// this == carVO / cno, ctype, cname
				str += "<div class='car_box' data-cno='"+this.cno+"' data-ctype='"+this.ctype+"' data-cname='"+this.cname+"' onclick=check("+i+")>";
				str += "<a href='#' class='car_a' id='"+this.ctype+"'>";
				str += "<strong class='car_name'>"+this.cname+"</strong>";
				str += "<span class='car_img'>";
				str += "<img src='${path}/resources/car/"+this.cno+".png' name='all' alt='"+this.cname+"' />";
				str += "</span>";
				str += "</a>";
				str += "</div>";
			});
			$(".car_scope").html(str);
		});
		
	}
	
	/* 차종선택 카테고리 클릭 이벤트 */
	
	/* 전체 카테고리 클릭 */
	$("#All").click(function(){
		all();
	});
	
	
	/* 트럭 카테고리 클릭 */
	$("#truck").click(function(){
		
		var ctype = $("#truck").val();
		console.log(ctype);
		
		getList(ctype);
	});
	
	
	/* 버스 카테고리 클릭 */
	$("#bus").click(function(){
		
		var ctype = $("#bus").val();
		console.log(ctype);
		
		getList(ctype);
	});
	
	
	/* 트럭 or 버스 - 차종 선택(클릭) 시  */
	$(".car_scope").on("click",".car_box",function(){
		
		
		var cno = $(this).attr("data-cno");
		var ctype = $(this).attr("data-ctype");
		var cname = $(this).attr("data-cname");
		
		console.log(cno);
		
//		location.href="carSelect?cno="+cno+"&carType="+carType+"&car="+car;
		
		// post로 넘겨서 CarVO 객체에 선택 값 저장 // 세션에 저장함. - 이미지 클릭 시 선택한 정보로 저장 / 영업점 선택 버튼 눌렀을 시가 아님!
		$.ajax({
			type : "POST",
			url : "${path}/car/carSelect",
			dataType : "json",
			data : {
				cno : cno,
				ctype : ctype,
				cname : cname
			},
			success : function(data){
				console.log(data);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
	});
	
	
	/* 트럭, 버스 각각 목록 불러오는 함수 */
	function getList(ctype){
		
		$.ajax({
			type : "GET",
			url : "${path}/car/eachList",
			dataType : "json",
			data :{
				ctype : ctype				
			},
			success : function(data){
				console.log(data);
				var str = "";
				$(data).each(function(i){
					// this == carVO / cno, carType, car
					str += "<div class='car_box' data-cno='"+this.cno+"' data-carType='"+this.ctype+"' data-car='"+this.cname+"'  data-cno='"+this.cno+"' onclick=check("+i+")>";
					str += "<a href='#' class='car_a' id='"+this.ctype+"'>";
					str += "<strong class='car_name'>"+this.cname+"</strong>";
					str += "<span class='car_img'>";
					str += "<img src='${path}/resources/car/"+this.cno+".png' alt='"+this.cname+"'>";
					str += "</span>";
					str += "</a>";
					str += "</div>";
				});
				$(".car_scope").html(str);
			},
			error : function(res){
				console.log(res.resonseText);
			}
		});
//		$(".car_list:eq(0)").show();
//		$(".car_list:not(:eq(0))").hide();
	}
	
	// a 태그 기능 막기
	$(".car_scope").on("click",".car_a",function(e){
		e.preventDefault();
	});
	
	
	/* 차종 img check (for css)  */
 	
	var checkNum;
	
	function check(num){
		var obj = $(".car_box");
		
		if(checkNum == num){
			obj.eq(num).addClass("change");
			checkNum = null;
		}else{
			obj.removeClass("change");
			checkNum = num;
		}
	}

	
</script>	
	
<jsp:include page="../common/footer.jsp"/>