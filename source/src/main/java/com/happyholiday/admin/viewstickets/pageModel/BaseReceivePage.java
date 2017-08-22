package com.happyholiday.admin.viewstickets.pageModel;

public class BaseReceivePage {
	//基本接受参数
		private Integer total ;
		private Integer page ;
		private Integer rows ;
		private String sort = "id";
		private String order = "desc";
		private String searchId = "";
		private String deleteIds = "";
		public Integer getTotal() {
			return total;
		}
		public void setTotal(Integer total) {
			this.total = total;
		}
		public Integer getPage() {
			return page;
		}
		public void setPage(Integer page) {
			this.page = page;
		}
		public Integer getRows() {
			return rows;
		}
		public void setRows(Integer rows) {
			this.rows = rows;
		}
		public String getSort() {
			return sort;
		}
		public void setSort(String sort) {
			this.sort = sort;
		}
		public String getOrder() {
			return order;
		}
		public void setOrder(String order) {
			this.order = order;
		}
		public String getSearchId() {
			return searchId;
		}
		public void setSearchId(String searchId) {
			this.searchId = searchId;
		}
		public String getDeleteIds() {
			return deleteIds;
		}
		public void setDeleteIds(String deleteIds) {
			this.deleteIds = deleteIds;
		}
		
		
}
