package www.cloudquestionbank.com.entity;

/**
 * 后台管理导航条(编号,跳转地址,图标,名称,所属分类)
 * @author ( 人 )
 *
 */

public class Backgroundmanagementnavigationbar implements java.io.Serializable {

	
	private Integer id;
	private String url;
	private String icon;
	private String name;
	private Integer belongToId;


	public Backgroundmanagementnavigationbar() {
	}

	public Backgroundmanagementnavigationbar(String url, String icon,
			String name, Integer belongToId) {
		this.url = url;
		this.icon = icon;
		this.name = name;
		this.belongToId = belongToId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getBelongToId() {
		return this.belongToId;
	}

	public void setBelongToId(Integer belongToId) {
		this.belongToId = belongToId;
	}

}