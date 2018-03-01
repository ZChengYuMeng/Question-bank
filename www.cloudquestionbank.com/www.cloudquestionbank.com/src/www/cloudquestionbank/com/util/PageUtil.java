package www.cloudquestionbank.com.util;

public class PageUtil {
		private int pageSize;//ҳ����ʾ������
		private int rowCount;//������
		private int pageCount;//��ҳ��
		private int nextPage;//��һҳ
		private int prePage;//��һҳ
		private int firstPage=1;//��һҳ
		private int lastPage;//���һҳ
		private int currenPage;//��ǰ�ǵڼ�ҳ
		private int starRow;//��ʼ����
		private int endRow;//��������
		
		
		
		
		
		
		
		
		
		
		
		//��ҳ�Ĺ��캯��
		public PageUtil(int rowCount, int curren,int PageSize) {
			this.pageSize=PageSize;
			this.rowCount = rowCount;
			this.currenPage = curren;
			
			//(����ҳ����ֵ) �ж��������ǲ���ÿҳ��ʾ�ı���
			if(rowCount % pageSize==0){
				//����ҳ����ֵ ������/��Ҫ��ҳ������
				pageCount=rowCount/pageSize;
			}else{
				//���� ��ҳ����ֵ ������/��Ҫ��ҳ������+1
				pageCount=rowCount/pageSize+1;
			}
			//(��������ҳ����ֵ)�����ǰҳС�ڻ������ ����ǰҳ��ֵΪ1
			if(currenPage<=0){
				//����ǰҳ��һ��ֵ1
				currenPage=1;
			}else{
				currenPage=curren;
			}
			
			// (������һҳ����)�����ǰҳ����1����С�ڻ������ҳ�� ����һҳ���Լ�1
			if(currenPage>1 && currenPage<=pageCount){
				//�����һҳʱ �µĵ�ǰҳ��=��ǰҳ��-1
				prePage=currenPage-1;
			}else{
				//��������һҳʱ���ǵ�һҳ
				prePage=firstPage;
			}
			// ��ֵ��ҳ��
			lastPage=pageCount;
			//(����һҳ��ֵ) �����ǰҳ����0����С����ҳ�� ����һҳ���Լ�1
			if(curren>0 && currenPage<pageCount){
				//��һҳ���ڵ�ǰҳ-1
				nextPage=currenPage+1;
			}else{
				nextPage=lastPage;
			}
			// ��ʼ�� (��ǰҳ-1)*ҳ����ʾ������С   
			starRow=(currenPage-1)*pageSize;
			// ������ (��ǰҳ)*ҳ����ʾ������С
			endRow=currenPage*pageSize;
			
			
		}
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public int getRowCount() {
			return rowCount;
		}
		public void setRowCount(int rowCount) {
			this.rowCount = rowCount;
		}
		public int getPageCount() {
			return pageCount;
		}
		public void setPageCount(int pageCount) {
			this.pageCount = pageCount;
		}
		public int getNextPage() {
			return nextPage;
		}
		public void setNextPage(int nextPage) {
			this.nextPage = nextPage;
		}
		public int getPrePage() {
			return prePage;
		}
		public void setPrePage(int prePage) {
			this.prePage = prePage;
		}
		public int getFirstPage() {
			return firstPage;
		}
		public void setFirstPage(int firstPage) {
			this.firstPage = firstPage;
		}
		public int getLastPage() {
			return lastPage;
		}
		public void setLastPage(int lastPage) {
			this.lastPage = lastPage;
		}
		public int getCurrenPage() {
			return currenPage;
		}
		public void setCurrenPage(int currenPage) {
			this.currenPage = currenPage;
		}
		public int getStarRow() {
			return starRow;
		}
		public void setStarRow(int starRow) {
			this.starRow = starRow;
		}
		public int getEndRow() {
			return endRow;
		}
		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}
		
		
		
		
		
		
}
