package vn.devpro.javaweb26.dto;


public class SearchModel {
	private int categoryId;
	private String keyword;
	private int status;
	private int statusQuantity;
	private String beginDate;
	private String endDate;
	private int price;
	private int priceSort;
	
	private int sizeOfPage;
	private int currentPage;
	private int totalItems;
	
	public SearchModel() {
		super();
	}
	public SearchModel(int categoryId, String keyword, int status, int statusQuantity) {
		super();
		this.categoryId = categoryId;
		this.keyword = keyword;
		this.status = status;
		this.statusQuantity = statusQuantity;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getStatusQuantity() {
		return statusQuantity;
	}
	public void setStatusQuantity(int statusQuantity) {
		this.statusQuantity = statusQuantity;
	}
	public int getSizeOfPage() {
		return sizeOfPage;
	}
	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalItems() {
		return totalItems;
	}
	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPriceSort() {
		return priceSort;
	}
	public void setPriceSort(int priceSort) {
		this.priceSort = priceSort;
	}
	
}
