package board.vo;

import java.sql.Timestamp;
import java.sql.Date;

public class JdbcBoardVO {
	
	int boardNo;
	String boardTitle;
	String boardWriter;
	Date boardDate;
	int boardCnt;
	String boardContent;
	
	public JdbcBoardVO() {
		// TODO Auto-generated constructor stub
	}	
	

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardCnt() {
		return boardCnt;
	}

	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	@Override
	public String toString() {
		return "JdbcBoard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardWriter=" + boardWriter
				+ ", boardDate=" + boardDate + ", boardCnt=" + boardCnt + ", boardContent=" + boardContent + "]";
	}
	
}
