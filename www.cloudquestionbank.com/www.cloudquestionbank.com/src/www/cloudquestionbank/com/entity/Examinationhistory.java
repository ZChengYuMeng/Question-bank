package www.cloudquestionbank.com.entity;

import java.sql.Timestamp;

/**
 * 考试历史表:(编号,用户编号,试卷编号,答题数量,
 * 			   正确数量,得分,交卷时间,考试所用时间)
 * @author ( 人 )
 *
 */

public class Examinationhistory implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer guestId;
	private Integer itemAnalysisId;
	private Integer answerCount;
	private Integer whenreally;
	private Double score;
	private Timestamp assignmentTime;
	private Integer whenUsed;

	// Constructors

	/** default constructor */
	public Examinationhistory() {
	}

	/** full constructor */
	public Examinationhistory(Integer guestId, Integer itemAnalysisId,
			Integer answerCount, Integer whenreally, Double score,
			Timestamp assignmentTime, Integer whenUsed) {
		this.guestId = guestId;
		this.itemAnalysisId = itemAnalysisId;
		this.answerCount = answerCount;
		this.whenreally = whenreally;
		this.score = score;
		this.assignmentTime = assignmentTime;
		this.whenUsed = whenUsed;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGuestId() {
		return this.guestId;
	}

	public void setGuestId(Integer guestId) {
		this.guestId = guestId;
	}

	public Integer getItemAnalysisId() {
		return this.itemAnalysisId;
	}

	public void setItemAnalysisId(Integer itemAnalysisId) {
		this.itemAnalysisId = itemAnalysisId;
	}

	public Integer getAnswerCount() {
		return this.answerCount;
	}

	public void setAnswerCount(Integer answerCount) {
		this.answerCount = answerCount;
	}

	public Integer getWhenreally() {
		return this.whenreally;
	}

	public void setWhenreally(Integer whenreally) {
		this.whenreally = whenreally;
	}

	public Double getScore() {
		return this.score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Timestamp getAssignmentTime() {
		return this.assignmentTime;
	}

	public void setAssignmentTime(Timestamp assignmentTime) {
		this.assignmentTime = assignmentTime;
	}

	public Integer getWhenUsed() {
		return this.whenUsed;
	}

	public void setWhenUsed(Integer whenUsed) {
		this.whenUsed = whenUsed;
	}

}