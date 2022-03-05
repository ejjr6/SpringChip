<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<style>
	.row{
		margin : 100px;
		height: 700px;
	}
	
	footer{
		bottom : 0px;
	}
</style>


<div class="row1">
	
</div>
<div class="row">
	<div class="col-lg-12">
		<h1 class='page header'>Board Read</h1>
	</div>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read page</div>
			<div class="panel-body">

				<form role="form" action="${path}/board/modify" method="post">
				
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name='bno'
							value='<c:out value="${board.bno}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'
							value='<c:out value="${board.title}"/>'>
					</div>
					<div class="form-group">
						<label>Text Area</label>
						<textarea class="form-control" rows="3" name='content'><c:out
								value="${board.content}" /></textarea>
					</div>

					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'
							value='<c:out value="${board.writer}"/>' readonly="readonly" />
					</div>

					<div class="form-group">
						<input type="hidden" class="form-control" name='regdate'
							value='<f:formatDate pattern ="yyyy/MM/dd" value="${board.regdate}"/>'
							readonly="readonly">
					</div>

					<div class="form-group">
						<input type="hidden" class="form-control" name='updatedate'
							value='<f:formatDate pattern ="yyyy/MM/dd" value="${board.updatedate}"/>'
							readonly="readonly">
					</div>
					
					

					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>

					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>

					<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");
		$('button').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log(operation)
			if (operation === 'remove') {
				formObj.attr("action", "${path}/board/remove");
			} else if (operation === 'list') {
				formObj.attr("action","${path}/board/asklist").attr("method","get");
				formObj.empty();

			}                  
			formObj.submit();

		});

	});
</script>
<%@include file="../common/footer.jsp"%>