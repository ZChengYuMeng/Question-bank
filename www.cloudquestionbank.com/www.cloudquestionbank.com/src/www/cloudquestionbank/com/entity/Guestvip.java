package www.cloudquestionbank.com.entity;

/**
 * VIP��(�û�):(���,Vip����)
 * @author ( �� )
 *
 */

public class Guestvip implements java.io.Serializable {

	// Fields

	private Integer id;
	private String vipName;

	// Constructors

	/** default constructor */
	public Guestvip() {
	}

	/** full constructor */
	public Guestvip(String vipName) {
		this.vipName = vipName;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVipName() {
		return this.vipName;
	}

	public void setVipName(String vipName) {
		this.vipName = vipName;
	}

}