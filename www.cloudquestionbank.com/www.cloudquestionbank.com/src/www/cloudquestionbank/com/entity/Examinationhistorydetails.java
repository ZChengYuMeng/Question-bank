package www.cloudquestionbank.com.entity;

/**
 * ������ʷ�����:(���,������ʷ���,���,�Ƿ���ȷ)
 * @author ( �� )
 *
 */

public class Examinationhistorydetails implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer examinationHistoryId;
	private Integer topicNumber;
	private Integer correct;
	private String guestChoice;

	// Constructors

	/** default constructor */
	public Examinationhistorydetails() {
	}

	/** full constructor */
	public Examinationhistorydetails(Integer id, Integer examinationHistoryId,
			Integer topicNumber, Integer correct, String guestChoice) {
		this.id = id;
		this.examinationHistoryId = examinationHistoryId;
		this.topicNumber = topicNumber;
		this.correct = correct;
		this.guestChoice = guestChoice;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getExaminationHistoryId() {
		return this.examinationHistoryId;
	}

	public void setExaminationHistoryId(Integer examinationHistoryId) {
		this.examinationHistoryId = examinationHistoryId;
	}

	public Integer getTopicNumber() {
		return this.topicNumber;
	}

	public void setTopicNumber(Integer topicNumber) {
		this.topicNumber = topicNumber;
	}

	public Integer getCorrect() {
		return this.correct;
	}

	public void setCorrect(Integer correct) {
		this.correct = correct;
	}

	public String getGuestChoice() {
		return this.guestChoice;
	}

	public void setGuestChoice(String guestChoice) {
		this.guestChoice = guestChoice;
	}

}