package com.blog.core.tag;

import java.io.Serializable;
import java.util.Arrays;

public class PagingDto implements Serializable {

	private static final long serialVersionUID = 1365041689938996297L;

	public static final int DEFAULT_PAGE_SIZE = 10;
	private static final int DEFALUT_PAGES_SHOW = 5;

	/** 总记录数 */
	private int totalRows;

	/**
	 * 数据开始位置
	 */
	private int startRowIndex;
	/**
	 * 数据结束位置
	 */
	private int endRowIndex;

	/**
	 * 页码位置
	 */
	private int curPageNum;

	/**
	 * 总页数
	 */
	private int totalPageNum;

	/** 页码大小 */
	private int pageSize = DEFAULT_PAGE_SIZE;

	/** 页码展示 */
	private int[] pageNumArray = new int[DEFALUT_PAGES_SHOW];
	/** 是否最后一页 */
	private boolean isLast = false;
	/** 是否第一页 */
	private boolean isFirst = false;

	public PagingDto() {
	}

	public PagingDto(int pageSize, int curPageNum) {
		this.pageSize = pageSize;
		this.curPageNum = curPageNum;

	}

	public PagingDto(int pageSize, String curPageNum) {
		this.pageSize = pageSize;
		if (curPageNum == null || curPageNum.isEmpty()) {
			this.curPageNum = 1;
		} else {
			this.curPageNum = Integer.parseInt(curPageNum);
		}
	}

	public PagingDto(int curPageNum) {
		this.pageSize = DEFAULT_PAGE_SIZE;
		this.curPageNum = curPageNum;
	}

	public PagingDto(String curPageNum) {
		this.pageSize = DEFAULT_PAGE_SIZE;
		if (curPageNum == null || curPageNum.isEmpty()) {
			this.curPageNum = 1;
		} else {
			this.curPageNum = Integer.parseInt(curPageNum);
		}

	}

	public PagingDto(int totalRows, int pageSize, int curPageNum) {
		this.totalRows = totalRows;
		this.pageSize = pageSize;
		this.curPageNum = curPageNum;
		clacPaging(this.totalRows, this.pageSize, this.curPageNum);
	}

	/**
	 * 分页算法
	 * 
	 * @param totalRows
	 * @param pageSize
	 * @param curPageNum
	 */
	private void clacPaging(int totalRows, int pageSize, int curPageNum) {
		if (totalRows <= 0) {
			this.pageSize = DEFAULT_PAGE_SIZE;
			this.curPageNum = 1;
		}
		int length = pageNumArray.length;
		this.totalPageNum = (totalRows + pageSize - 1) / pageSize;
		if (curPageNum <= 1) {
			curPageNum = 1;
			this.isFirst = true;
		} else {
			this.isFirst = false;
		}
		if (curPageNum >= totalPageNum) {
			this.isLast = true;
			if (totalPageNum > 0) {
				curPageNum = totalPageNum;
			} else {
				curPageNum = 1;
			}

		} else {
			this.isLast = false;
		}
		this.startRowIndex = (curPageNum - 1) * pageSize;
		this.endRowIndex = this.startRowIndex + pageSize;
		if (totalPageNum <= length) {
			pageNumArray = new int[totalPageNum];
			for (int i = 0; i < totalPageNum; i++) {
				pageNumArray[i] = (i + 1);
			}
		} else {
			int afterPageNum = (length / 2) + 1;// 设置当前页之前显示的页数
			int beforePageNum = length - afterPageNum;
			if (beforePageNum >= curPageNum) {
				for (int i = 0; i < length; i++) {
					pageNumArray[i] = (i + 1);
				}
			} else {
				if ((curPageNum + afterPageNum) > totalPageNum) {
					for (int i = 0; i < length; i++) {
						pageNumArray[(length - i - 1)] = totalPageNum - i;
					}
				} else {
					int k = 0;
					for (int i = 0; i < beforePageNum; i++) {
						pageNumArray[k] = curPageNum - beforePageNum + i;
						k++;
					}
					int i = 0;
					for (; k < length; k++) {
						pageNumArray[k] = curPageNum + i;
						i++;
					}
				}
			}
		}
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
		clacPaging(this.totalRows, this.pageSize, this.curPageNum);
	}

	public int getStartRowIndex() {
		return startRowIndex;
	}

	public void setStartRowIndex(int startRowIndex) {
		this.startRowIndex = startRowIndex;
	}

	public int getEndRowIndex() {
		return endRowIndex;
	}

	public void setEndRowIndex(int endRowIndex) {
		this.endRowIndex = endRowIndex;
	}

	public int getCurPageNum() {
		return curPageNum;
	}

	public void setCurPageNum(int curPageNum) {
		this.curPageNum = curPageNum;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int[] getPageNumArray() {
		return pageNumArray;
	}

	public void setPageNumArray(int[] pageNumArray) {
		this.pageNumArray = pageNumArray;
	}

	public boolean isLast() {
		return isLast;
	}

	public void setLast(boolean isLast) {
		this.isLast = isLast;
	}

	public boolean isFirst() {
		return isFirst;
	}

	public void setFirst(boolean isFirst) {
		this.isFirst = isFirst;
	}

	@Override
	public String toString() {
		return "PagingDto [totalRows=" + totalRows + ", startRowIndex=" + startRowIndex + ", endRowIndex=" + endRowIndex + ", curPageNum=" + curPageNum + ", totalPageNum=" + totalPageNum
				+ ", pageSize=" + pageSize + ", pageNumArray=" + Arrays.toString(pageNumArray) + ", isLast=" + isLast + ", isFirst=" + isFirst + "]";
	}
}
