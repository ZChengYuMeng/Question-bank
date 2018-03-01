package www.cloudquestionbank.com.entity;

/**
 * ½×¶Î±í:(±àºÅ,½×¶ÎÃû)
 * @author ( ÈË )
 *
 */

public class Stage implements java.io.Serializable {

	// Fields

	private Integer id;
	private String stageName;

	// Constructors

	/** default constructor */
	public Stage() {
	}

	/** full constructor */
	public Stage(String stageName) {
		this.stageName = stageName;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStageName() {
		return this.stageName;
	}

	public void setStageName(String stageName) {
		this.stageName = stageName;
	}

}