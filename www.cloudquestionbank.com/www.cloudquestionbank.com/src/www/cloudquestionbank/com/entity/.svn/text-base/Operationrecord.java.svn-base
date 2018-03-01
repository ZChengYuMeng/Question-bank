package www.cloudquestionbank.com.entity;

import java.sql.Timestamp;

/**
 * 【操作记录表】:(编号,操作类型,操作时间,操作人员类型,
 * 				   操作人员的编号,操作是否成功,操作的表名)
 * @author ( 人 )
 *
 */

public class Operationrecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer operationType;
	private Timestamp operationTime;
	private Integer operatorType;
	private String operatorId;
	private Integer operatorState;
	private String tableName;

	// Constructors

	/** default constructor */
	public Operationrecord() {
	}

	/** full constructor */
	public Operationrecord(Integer operationType, Timestamp operationTime,
			Integer operatorType, String operatorId, Integer operatorState,
			String tableName) {
		this.operationType = operationType;
		this.operationTime = operationTime;
		this.operatorType = operatorType;
		this.operatorId = operatorId;
		this.operatorState = operatorState;
		this.tableName = tableName;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOperationType() {
		return this.operationType;
	}

	public void setOperationType(Integer operationType) {
		this.operationType = operationType;
	}

	public Timestamp getOperationTime() {
		return this.operationTime;
	}

	public void setOperationTime(Timestamp operationTime) {
		this.operationTime = operationTime;
	}

	public Integer getOperatorType() {
		return this.operatorType;
	}

	public void setOperatorType(Integer operatorType) {
		this.operatorType = operatorType;
	}

	public String getOperatorId() {
		return this.operatorId;
	}

	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}

	public Integer getOperatorState() {
		return this.operatorState;
	}

	public void setOperatorState(Integer operatorState) {
		this.operatorState = operatorState;
	}

	public String getTableName() {
		return this.tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

}