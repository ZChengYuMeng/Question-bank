package www.cloudquestionbank.com.entity;

/**
 * �û�����ɿγ�:(���,�û��ı��,�γ̱��,�������)
 * @author ( �� )
 *
 */

public class Completecurriculum implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer guestId;
	private Integer courseId;
	private Integer completedQuantity;

	// Constructors

	/** default constructor */
	public Completecurriculum() {
	}

	/** full constructor */
	public Completecurriculum(Integer guestId, Integer courseId,
			Integer completedQuantity) {
		this.guestId = guestId;
		this.courseId = courseId;
		this.completedQuantity = completedQuantity;
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

	public Integer getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getCompletedQuantity() {
		return this.completedQuantity;
	}

	public void setCompletedQuantity(Integer completedQuantity) {
		this.completedQuantity = completedQuantity;
	}

}