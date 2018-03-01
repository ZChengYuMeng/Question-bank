package www.cloudquestionbank.com.entity;

import java.sql.Timestamp;

/**
 * 题目表:(编号,题干,选项A,选项B,选项C,选项D,标准答案,
 * 		   所属课程,解析,创建时间,修改时间,上传题目的人员类型,
 * 		   上传题目的人员的编号,修改题目人员的编号,
 * 		    修改题目的人员类型,是否多选)
 * @author ( 人 )
 *
 */

public class Subject implements java.io.Serializable {

	// Fields

	private Integer id; //题目编号
	private String stem;	//提干
	private String a;		
	private String b;
	private String c;
	private String d;
	private String answer;   //标准答案
	private Integer aourseId;	//所属课程
	private String analysis;		//解析
	private Timestamp createtime;	//时间
	private Timestamp updateTime;	//修改时间
	private Integer uploadAuthorType;
	private String uploadAuthorId;
	private String updateAuthorId;
	private Integer updateAuthorType;
	private Integer isMultiselect;

	// Constructors

	/** default constructor */
	public Subject() {
	}

	/** full constructor */
	public Subject(String stem, String a, String b, String c, String d,
			String answer, Integer aourseId, String analysis,
			Timestamp createtime, Timestamp updateTime,
			Integer uploadAuthorType, String uploadAuthorId,
			String updateAuthorId, Integer updateAuthorType,
			Integer isMultiselect) {
		this.stem = stem;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.answer = answer;
		this.aourseId = aourseId;
		this.analysis = analysis;
		this.createtime = createtime;
		this.updateTime = updateTime;
		this.uploadAuthorType = uploadAuthorType;
		this.uploadAuthorId = uploadAuthorId;
		this.updateAuthorId = updateAuthorId;
		this.updateAuthorType = updateAuthorType;
		this.isMultiselect = isMultiselect;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStem() {
		return this.stem;
	}

	public void setStem(String stem) {
		this.stem = stem;
	}

	public String getA() {
		return this.a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public String getB() {
		return this.b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return this.c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public String getD() {
		return this.d;
	}

	public void setD(String d) {
		this.d = d;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getAourseId() {
		return this.aourseId;
	}

	public void setAourseId(Integer aourseId) {
		this.aourseId = aourseId;
	}

	public String getAnalysis() {
		return this.analysis;
	}

	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	@Override
	public String toString() {
		return "Subject [id=" + id + ", stem=" + stem + ", a=" + a + ", b=" + b
				+ ", c=" + c + ", d=" + d + ", answer=" + answer
				+ ", aourseId=" + aourseId + ", analysis=" + analysis
				+ ", createtime=" + createtime + ", updateTime=" + updateTime
				+ ", uploadAuthorType=" + uploadAuthorType
				+ ", uploadAuthorId=" + uploadAuthorId + ", updateAuthorId="
				+ updateAuthorId + ", updateAuthorType=" + updateAuthorType
				+ ", isMultiselect=" + isMultiselect + "]";
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getUploadAuthorType() {
		return this.uploadAuthorType;
	}

	public void setUploadAuthorType(Integer uploadAuthorType) {
		this.uploadAuthorType = uploadAuthorType;
	}

	public String getUploadAuthorId() {
		return this.uploadAuthorId;
	}

	public void setUploadAuthorId(String uploadAuthorId) {
		this.uploadAuthorId = uploadAuthorId;
	}

	public String getUpdateAuthorId() {
		return this.updateAuthorId;
	}

	public void setUpdateAuthorId(String updateAuthorId) {
		this.updateAuthorId = updateAuthorId;
	}

	public Integer getUpdateAuthorType() {
		return this.updateAuthorType;
	}

	public void setUpdateAuthorType(Integer updateAuthorType) {
		this.updateAuthorType = updateAuthorType;
	}

	public Integer getIsMultiselect() {
		return this.isMultiselect;
	}

	public void setIsMultiselect(Integer isMultiselect) {
		this.isMultiselect = isMultiselect;
	}

}