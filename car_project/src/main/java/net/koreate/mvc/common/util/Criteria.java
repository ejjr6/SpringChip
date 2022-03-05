package net.koreate.mvc.common.util;

public class Criteria {

	private int page; // 요청(현재) 페이지 정보
	private int perPageNum;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}

	// 게시글 검색 시 limit 시작 인덱스 번호
	public int getStartRow() {
		return (this.page - 1) * this.perPageNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + " startRow=" + getStartRow() + " ]";
	}

}
