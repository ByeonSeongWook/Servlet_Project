package boarder;

public class Paging {

		private int pageNumber; 	// 현재 페이지 번호
		private int count;				// 전체 게시물 개수
		private int minPage;			// 페이징 최소값
		private int maxPage;			// 페이징 최대값
		private boolean next;		// 다음 섹션이 존재 하는지 여부
		private int before;				// 이전 버튼을 눌렀을때 이동할 페이지 번호
		private int forward;			// 다음 버튼을 눌렀을때 이동할 페이지 번호
		
		public Paging() {}
		
		public Paging(int pageNumber, int count) {
		
			// 한 페이지에 보여줄 게시물의 수
			final int BOARD_CNT = 10;
			
			// 한 section에 보여줄 페이지의 수
			final int PAGING_CNT = 5;
			
			this.pageNumber	= pageNumber;
			this.count 				= count;
			
			int section;
			
			// section 번호 구하기(몇 번째 section 인지)
			if(pageNumber % PAGING_CNT == 0)	section = pageNumber	/ PAGING_CNT;
																else 	section = pageNumber	/ PAGING_CNT + 1;
		
			// 다음 페이지 여부
			next = count > section * (PAGING_CNT * BOARD_CNT);
			
			// 페이징 최소값 구하기
			minPage 	= 1 + (section - 1) * PAGING_CNT;

			// 페이징 최대값 구하기
			if(next) maxPage = section * PAGING_CNT;
			else {
				if(count % BOARD_CNT == 0) 	maxPage = count / BOARD_CNT; 		// 나누어 떨어지면 해당 페이지 번호를 나눴을때 몫으로 사용
														else 	maxPage = count / BOARD_CNT + 1;	// 안나누어 떨어지면 해당 페이지 번호에 + 1;
			}
			
			// 다음 페이지 구하기
			forward	= 1 + section * PAGING_CNT;
			
			// 이전 페이지 구하기
			before 	= (section - 1) * PAGING_CNT;
			
		}

		public int getPageNumber() {
			return pageNumber;
		}

		public void setPageNumber(int pageNumber) {
			this.pageNumber = pageNumber;
		}

		public int getCount() {
			return count;
		}

		public void setCount(int count) {
			this.count = count;
		}

		public int getMinPage() {
			return minPage;
		}

		public void setMinPage(int minPage) {
			this.minPage = minPage;
		}

		public int getMaxPage() {
			return maxPage;
		}

		public void setMaxPage(int maxPage) {
			this.maxPage = maxPage;
		}

		public boolean getNext() {
			return next;
		}

		public void setNext(boolean next) {
			this.next = next;
		}

		public int getBefore() {
			return before;
		}

		public void setBefore(int before) {
			this.before = before;
		}

		public int getForward() {
			return forward;
		}

		public void setForward(int forward) {
			this.forward = forward;
		}
		
}
