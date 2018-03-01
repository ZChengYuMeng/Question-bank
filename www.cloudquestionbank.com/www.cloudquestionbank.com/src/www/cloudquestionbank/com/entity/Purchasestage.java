package www.cloudquestionbank.com.entity;

import java.sql.Timestamp;

/**
 * 用户购买阶段表:(编号,用户的编号,阶段编号,购买时间,到期时间)
 * @author ( 人 )
 *
 */

public class Purchasestage implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer guestId;
	private Integer stageId;
	private Timestamp purchaseTime;
	private Timestamp expirationDate;

	// Constructors

	/** default constructor */
	public Purchasestage() {
	}

	/** full constructor */
	public Purchasestage(Integer guestId, Integer stageId,
			Timestamp purchaseTime, Timestamp expirationDate) {
		this.guestId = guestId;
		this.stageId = stageId;
		this.purchaseTime = purchaseTime;
		this.expirationDate = expirationDate;
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

	public Integer getStageId() {
		return this.stageId;
	}

	public void setStageId(Integer stageId) {
		this.stageId = stageId;
	}

	public Timestamp getPurchaseTime() {
		return this.purchaseTime;
	}

	public void setPurchaseTime(Timestamp purchaseTime) {
		this.purchaseTime = purchaseTime;
	}

	public Timestamp getExpirationDate() {
		return this.expirationDate;
	}

	public void setExpirationDate(Timestamp expirationDate) {
		this.expirationDate = expirationDate;
	}

}