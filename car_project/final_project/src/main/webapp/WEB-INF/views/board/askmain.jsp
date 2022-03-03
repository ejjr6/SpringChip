<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<style>
.col-md-5{

margin:10px;
margin-left: 130px;
margin-right: 10px;
height: 500px;

}

.col-md-5:nth-child(2){
margin-left: 10px;


}
.row{

margin: 10px;
}
.col-xs-9{
height: 85px;
}

.col-lg-12{

height: 50px;}

</style>





<!-- <div id="page-wrapper"> </div>-->

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">고객센터</h1>
		</div>
		
		<div class="col-lg-12">
		</div>
		<div class="col-lg-12">
		</div>

	<div class="row">
		<div class=".col-md-5 col-md-5">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-question fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">FAQ</div>
							<div>고객센터 FAQ는 고객님들께서 궁금해하시는 답변을 모았습니다.</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">FAQ로 이동하기</span> <span class="pull-right"><i
							class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class=".col-md-5 col-md-5">
			<div class="panel panel-green">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-comments fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">온라인상담</div>
							<div>온라인 상담은 차량 구입 고객님들께서 온라인으로 상담을 요청할 수 있습니다.</div>
						</div>
					</div>
				</div>
				<a href="${path}/board/asklist">
					<div class="panel-footer">
						<span class="pull-left">온라인상담 신청하기</span> <span class="pull-right">
							<i class="fa fa-arrow-circle-right"></i>

						</span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<!-- <div class="col-lg-3 col-md-6">
			<div class="panel panel-yellow">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-thumbs-o-up fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">칭찬 알림방</div>
							<div>고객님의 소중한 칭찬이 큰 힘이 됩니다.
						
							</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View Details</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div> -->
		<!-- <div class="col-lg-3 col-md-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-wrench fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">하자 재발통보</div>
							<div>
</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View Details</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div> -->
	</div>
</div>
<!-- /#wrapper -->
<%@ include file="../common/footer.jsp" %>