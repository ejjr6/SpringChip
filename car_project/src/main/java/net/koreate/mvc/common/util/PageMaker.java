package net.koreate.mvc.common.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;		// 전체 게시물의 수
	private int startPage;		// 게시물의 화면에 보여질 시작페이지 번호
	private int endPage;		// 게시물의 화면에 보여질 마지막페이지 번호
	private int displayPageNum;	// 보여줄 페이지 개수
	private int maxPage;		// 전체 페이지 개수
	private boolean first;		// 첫페이지 버튼 활성화 여부
	private boolean last;		// 마지막페이지 버튼 활성화 여부
	private boolean prev;		// 이전 페이지 버튼 활성화 여부
	private boolean next;		// 다음 페이지 버튼 활성화 여부
	
	protected Criteria cri;		// 요청 페이지 정보
	
	public PageMaker() {
		this(0);
	}

	public PageMaker(int totalCount) {
		this(totalCount,new Criteria());
	}

	public PageMaker(int totalCount, Criteria cri) {
		this(totalCount, 5, cri);
	}

	public PageMaker(int totalCount, int displayPageNum, Criteria cri) {
		this.totalCount = totalCount;
		this.displayPageNum = displayPageNum;
		this.cri = cri;
		calcPaging();
	}

	private void calcPaging() {
		// displayPageNum = 5
		// 1 ~ 5 == [1][2][3][4][5]
		// 6 ~ 10 ==[6][7][8][9][10]
		endPage = (int)Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum;
		startPage = (endPage - displayPageNum)+1;
		// totalCount = 138 , perPageNum = 10
		// 138/10.0 == 13.8 == 14
		maxPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		// [11][12][13][14][15]
		// endPage = 15; 
		if(endPage > maxPage) endPage = maxPage;
		// endPage = 14;
		first = cri.getPage() != 1 ? true : false;
		last = cri.getPage() < maxPage ? true : false;
		// [1][2][3][4][5] = false
		// [6][7][8][9][10] = true
		prev = (startPage != 1) ? true : false;
		// [11][12][13][14] == false
		// [6][7][8][9][10] == true
		next = (endPage == maxPage) ? false : true;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPaging();
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
		calcPaging();
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
		calcPaging();
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public boolean isFirst() {
		return first;
	}

	public boolean isLast() {
		return last;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", displayPageNum=" + displayPageNum + ", maxPage=" + maxPage + ", first=" + first + ", last=" + last
				+ ", prev=" + prev + ", next=" + next + ", cri=" + cri + "]";
	}
	
	public String query(int page) {
		// listPage
		// readPage?page=1&perPageNum=10
		/*
		String query = "?";
		query += "page="+page;
		query += "&perPageNum="+cri.getPerPageNum();
		return query;
		*/
		UriComponents uriComponents
			= UriComponentsBuilder.newInstance()
			  .queryParam("page", page)
			  .queryParam("perPageNum", cri.getPerPageNum())
			  .build();
		String query = uriComponents.toUriString();
		System.out.println(query);
		return query;
	}
	
}











