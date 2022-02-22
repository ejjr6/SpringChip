<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>





<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">문의글 목록</div>

			<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
				New Board</button>
		</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>조회수</th>
					</tr>
				</thead>
			
				<c:choose>
					<c:when test="${!empty userInfo}">
				
					
						<c:forEach items="${list}" var="ask">
							<tr>
								<td><c:out value="${ask.bno}" /></td>
								<td><a href='/board/get?bno=<c:out value="${ask.bno}"/>'><c:out
											value="${ask.title}" /></a></td>
								<td><c:out value="${ask.writer}" /></td>
								<td><f:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${ask.regdate}" /></td>
								<td><f:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${ask.updatedate}" /></td>
								<td><c:out value="${ask.viewcnt}" /></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">로그인후 이용가능합니다.</td>
						</tr>
					</c:otherwise>



				</c:choose>
			</table>
			<div class='pull-right'>
				<ul class="pagination">

					<c:if test="${pm.last}">
						<li class="paginate_button previous"><a href=asklist?page=1>FIRST</a></li>
					</c:if>


					<c:if test="${pm.prev}">
						<li class="paginate_button previous"><a
							href=asklist?page=${pm.startPage-1}>Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
						<li class="paginate_button"><a href=asklist?page=${num}>${num}</a>
						</li>


					</c:forEach>
					<c:if test="${pm.next}">
						<li class="paginate_button next"><a
							href=asklist?page=${pm.endPage+1}>NEXT</a></li>
					</c:if>
					<c:if test="${pm.last}">
						<li class="paginate_button previous"><a
							href=asklist?page=${pm.maxPage}>LAST</a></li>
					</c:if>


				</ul>

			</div>

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">게시글 작성 결과</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								Changes</button>

						</div>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-6 -->


<!-- /.row -->
<form action="/board/asklist" method="get" id="actionForm">
	<input type="hidden" name="perPageNum" value="${pm.cri.perPageNum} " />
	<input type="hidden" name="page" value="${pm.cri.page }" />

</form>

<script>
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				checkModal(result);
				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글" + parseInt(result) + "번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}
				$("#regBtn").on("click", function() {
					self.location = "/board/register";
				});

				/* 		var actionForm = $("#actionForm");
						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault();
									console.log('clcik');
									actionForm.find("input[name='perPageNum']").val(
											$(this).attr("href"));
									actionForm.submit;
								}); */

				// a tag의 기본 이벤트 (hyperlink) 이벤트 무시
				//event.preventDefault();
				var targetPage = $(this).attr("href");
				// alert(targetPage);
				var listForm = $("#ActionForm");
				listForm.find("[name='page']").val(targetPage);
				listForm.attr("action", "listPage");
				listForm.submit();
			});
</script>

<%@include file="../includes/footer.jsp"%>