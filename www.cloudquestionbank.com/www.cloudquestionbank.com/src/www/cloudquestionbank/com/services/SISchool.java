package www.cloudquestionbank.com.services;

import java.util.HashMap;
import java.util.List;

import www.cloudquestionbank.com.entity.School;

/**
 * Services【学校业务接口】
 * @author ( 人 )
 *
 */
public interface SISchool {
	/**
	 * 功能：获取校区和所属下的班级
	 * @param school
	 * @return
	 */
	HashMap<String, Object> GetList(School school);
	
	/**
	 * 功能:获取校区集合
	 * @param school
	 * @return
	 */
	HashMap<String, Object>GetSchoolList(School school);
	
	/**
	 * 功能：获取学校信息
	 * @param school
	 * @return
	 */
	List GetSchool(School school);
	/**
	 * 功能:新增校区
	 * @param school
	 * @return
	 */
	boolean AddSchool(School school);
	/**
	 * 查询校区名称是否存在
	 * @param school
	 * @return
	 */
	boolean ISSchoolName(School school);
	/**
	 * 获取校区JsonStr集合
	 * @param school
	 * @return
	 */
	String GetOBJECtchoolList(School school);
	/**
	 * 获取单个学校信息
	 * @param school
	 * @return
	 */
	public List GetOneSchool(String id);
	
	/**
	 * 修改该学校信息
	 * @param school
	 * @return
	 */
	boolean UpdSchool(School school);
	
}
