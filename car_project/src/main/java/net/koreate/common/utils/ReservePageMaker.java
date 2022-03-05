package net.koreate.common.utils;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReservePageMaker {
	
	private ReserveCriteria cri;
	private int displayPageNum;
	private int totalCount;
	
	private int startPage;
	private int endPage;
	private int maxPage;
	private boolean prev;
	private boolean next;
	
	
	private void calc() {
		endPage = (int)Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum;
		startPage = (endPage - displayPageNum) + 1;
		maxPage = (int)Math.ceil(totalCount/(double)cri.getPerPageNum());
		if(endPage > maxPage) endPage = maxPage;
		prev = endPage > displayPageNum ? true : false;
		next = (endPage == maxPage) ? false : true;
	}


	public void setCri(ReserveCriteria cri) {
		this.cri = cri;
		calc();
	}


	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
		calc();
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calc();
	} 
	
	public String search(int page) {
		UriComponents uri
		= UriComponentsBuilder.newInstance()
		.queryParam("page", page)
		.queryParam("perPageNum", cri.getPerPageNum())
		.queryParam("nsi", cri.getNsi())
		.queryParam("ngu", cri.getNgu())
		.queryParam("keyword", cri.getKeyword())
		.build();
		String queryString = uri.toString();
		System.out.println(queryString);
		return queryString;
	}
	
}
