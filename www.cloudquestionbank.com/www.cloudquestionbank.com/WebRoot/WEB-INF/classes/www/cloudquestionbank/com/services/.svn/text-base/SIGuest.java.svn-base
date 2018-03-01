package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Guest;
import www.cloudquestionbank.com.entity.Stage;

/**
 * Services【用户表业务接口】
 * @author ( 人 )
 *
 */
public interface SIGuest {
	
	/**
	 * 前台主页登录成功 ;
	 * @author隶属业务层逻辑
	 * 参数类型:String []str(参数数组)
	 * @author用到原生sql语句进行多表连接
	 * @author所需三表purchasestage·Guest·stage 
	 */
	public List loginfind(int uid);
	public List loginDl(String...str);
	/*
	 * 用户名查询
	 */
	public List loginname(String name);
	
	/**
	 * 添加用户
	 * @param guest
	 * @return
	 */
	public boolean AddGuest(Guest guest);
	
	/**
	 * 查询邮箱是否存在
	 * @param guest
	 * @return
	 */
	public boolean EmailIsExistence(Guest guest);
	/**
	 * 查询身份证号是否存在
	 * @param guest
	 * @return
	 */
	public boolean CardNoIsExistence(Guest guest);
	/**
	 * 获取一个JSon格式的list集合
	 * @param guest
	 * @return
	 */
	public String GetJsonList(Guest guest); 
	/**
	 * 管理员修改用户基本信息
	 * @param guest
	 * @return
	 */
	public String AdminUpdGuest(Guest guest,Admin admin);
	
	/**
	 * 功能:获取同一学校同一班级的用户
	 * @param guest
	 * @param stage
	 * @return
	 */
	public String GetGuestCommonSchoolAndClass(Guest guest,Stage stage);
	
}
