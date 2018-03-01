package www.cloudquestionbank.com.entity;

/**
 * °à¼¶×´Ì¬±í
 * @author ( ÈË )
 *
 */

public class Classstate implements java.io.Serializable {

	// Fields

	private Integer classStateId;
	private String classStateName;

	// Constructors

	/** default constructor */
	public Classstate() {
	}

	/** full constructor */
	public Classstate(String classStateName) {
		this.classStateName = classStateName;
	}

	// Property accessors

	public Integer getClassStateId() {
		return this.classStateId;
	}

	public void setClassStateId(Integer classStateId) {
		this.classStateId = classStateId;
	}

	public String getClassStateName() {
		return this.classStateName;
	}

	public void setClassStateName(String classStateName) {
		this.classStateName = classStateName;
	}

}