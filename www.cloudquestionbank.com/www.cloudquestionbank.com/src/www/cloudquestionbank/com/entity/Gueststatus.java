package www.cloudquestionbank.com.entity;

/**
 * �û�״̬��:(���,�û�״̬��)
 * @author ( �� )
 *
 */

public class Gueststatus implements java.io.Serializable {

	// Fields

	private Integer id;
	private String statusName;

	// Constructors

	/** default constructor */
	public Gueststatus() {
	}

	/** full constructor */
	public Gueststatus(String statusName) {
		this.statusName = statusName;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStatusName() {
		return this.statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

}