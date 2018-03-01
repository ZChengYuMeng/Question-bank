package www.cloudquestionbank.com.entity;

import java.sql.Timestamp;

/**
 * 班级表:(编号,班级名称,学校编号,状态,班级人数
 * 		   ,管理员编号,创建时间,修改时间)
 * @author ( 人 )
 *
 */

public class Class implements java.io.Serializable {

	// Fields

	private Integer id;
	private String cname;
	private Integer schoolId;
	private Integer state;
	private Integer classSize;
	private String adminId;
	private Timestamp createTime;
	private Timestamp updateTime;

	// Constructors

	/** default constructor */
	public Class() {
	}

	/** full constructor */
	public Class(String cname, Integer schoolId, Integer state,
			Integer classSize, String adminId, Timestamp createTime,
			Timestamp updateTime) {
		this.cname = cname;
		this.schoolId = schoolId;
		this.state = state;
		this.classSize = classSize;
		this.adminId = adminId;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Integer getSchoolId() {
		return this.schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getClassSize() {
		return this.classSize;
	}

	public void setClassSize(Integer classSize) {
		this.classSize = classSize;
	}

	public String getAdminId() {
		return this.adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

}