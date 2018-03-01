package www.cloudquestionbank.com.entity;

/**
 * 学校状态表
 * @author ( 人 )
 *
 */

public class Schoolstatus implements java.io.Serializable {

	// Fields

	private Integer id;
	private String sname;

	// Constructors

	/** default constructor */
	public Schoolstatus() {
	}


	// Property accessors

	public Schoolstatus(Integer id, String sname) {
		super();
		this.id = id;
		this.sname = sname;
	}


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getSname() {
		return sname;
	}


	public void setSname(String sname) {
		this.sname = sname;
	}

}