package www.cloudquestionbank.com.entity;

import java.sql.Timestamp;

/**
 * �Ծ��:(���,�׶α��,�γ̱��,������,�Ծ���,
 * 		    �ܷ���,�Ծ�涨ʱ��,�����Ծ����,������Ա�ı��,
 * 		    ����ʱ��,�Ծ�ʼʱ��,�Ծ����ʱ��,ѧУ���,�༶���)
 * @author ( �� )
 *
 */

public class Itemanalysis implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer stageId;
	private String courseId;
	private Integer count;
	private String name;
	private Double fraction;
	private Integer minute;
	private Integer createAuthorType;
	private String createAuthorId;
	private String creaTeime;
	private String startTime;
	private String endTime;
	private Integer schoolId;
	private String classId;

	// Constructors

	/** default constructor */
	public Itemanalysis() {
	}

	

	



	






	@Override
	public String toString() {
		return "Itemanalysis [id=" + id + ", stageId=" + stageId
				+ ", courseId=" + courseId + ", count=" + count + ", name="
				+ name + ", fraction=" + fraction + ", minute=" + minute
				+ ", createAuthorType=" + createAuthorType
				+ ", createAuthorId=" + createAuthorId + ", creaTeime="
				+ creaTeime + ", startTime=" + startTime + ", endTime="
				+ endTime + ", schoolId=" + schoolId + ", classId=" + classId
				+ "]";
	}



























	public Itemanalysis(Integer id, Integer stageId, String courseId,
			Integer count, String name, Double fraction, Integer minute,
			Integer createAuthorType, String createAuthorId, String creaTeime,
			String startTime, String endTime, Integer schoolId, String classId) {
		super();
		this.id = id;
		this.stageId = stageId;
		this.courseId = courseId;
		this.count = count;
		this.name = name;
		this.fraction = fraction;
		this.minute = minute;
		this.createAuthorType = createAuthorType;
		this.createAuthorId = createAuthorId;
		this.creaTeime = creaTeime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.schoolId = schoolId;
		this.classId = classId;
	}














	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStageId() {
		return this.stageId;
	}

	public void setStageId(Integer stageId) {
		this.stageId = stageId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}














	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getFraction() {
		return this.fraction;
	}

	public void setFraction(Double fraction) {
		this.fraction = fraction;
	}

	public Integer getMinute() {
		return this.minute;
	}

	public void setMinute(Integer minute) {
		this.minute = minute;
	}

	public Integer getCreateAuthorType() {
		return this.createAuthorType;
	}

	public void setCreateAuthorType(Integer createAuthorType) {
		this.createAuthorType = createAuthorType;
	}

	public String getCreateAuthorId() {
		return this.createAuthorId;
	}

	public void setCreateAuthorId(String createAuthorId) {
		this.createAuthorId = createAuthorId;
	}


	public String getCreaTeime() {
		return creaTeime;
	}














	public void setCreaTeime(String creaTeime) {
		this.creaTeime = creaTeime;
	}














	public String getStartTime() {
		return startTime;
	}














	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}














	public String getEndTime() {
		return endTime;
	}














	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}














	public Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}

	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}



}