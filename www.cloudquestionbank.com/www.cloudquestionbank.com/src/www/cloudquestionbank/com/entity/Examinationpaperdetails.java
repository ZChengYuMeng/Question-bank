package www.cloudquestionbank.com.entity;

/**
 * �Ծ������:(���,��Ŀ���,��Ӧ����Ŀ���,��Ӧ�Ծ���)
 * @author ( �� )
 *
 */

public class Examinationpaperdetails implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer number;
	private Integer subjectId;
	private Integer itemAnalysisId;

	// Constructors

	/** default constructor */
	public Examinationpaperdetails() {
	}

	/** full constructor */
	public Examinationpaperdetails(Integer number, Integer subjectId,
			Integer itemAnalysisId) {
		this.number = number;
		this.subjectId = subjectId;
		this.itemAnalysisId = itemAnalysisId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public Integer getItemAnalysisId() {
		return this.itemAnalysisId;
	}

	public void setItemAnalysisId(Integer itemAnalysisId) {
		this.itemAnalysisId = itemAnalysisId;
	}

}