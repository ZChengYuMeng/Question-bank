package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Class;

/**
 * Services【班级表业务接口】
 * @author ( 人 )
 *
 */
public interface SIClass {
	/**
	 * 查询班级集合
	 * @param Strs
	 * @return
	 */
	List GetList(String...Strs);
	/**
	 * 功能:新增管理员
	 * @param admin
	 * @return
	 */
	String AddClass(Class Cs);
	/**
	 * 查询该校区是否存在该班级名称
	 * @param CS
	 * @return
	 */
	boolean ISSchoolClassname(Class CS);
	/**
	 * 获取一组班级集合
	 * @param IDArr
	 * @return
	 */
	List GetClassArr(String IDArr);
	
	/**
	 * 获取班级一组对象
	 * @param Cs
	 * @return
	 */
	String GetClassArrObject(Class Cs);
	
	
}
