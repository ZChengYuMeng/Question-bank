package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Class;

/**
 * Services���༶��ҵ��ӿڡ�
 * @author ( �� )
 *
 */
public interface SIClass {
	/**
	 * ��ѯ�༶����
	 * @param Strs
	 * @return
	 */
	List GetList(String...Strs);
	/**
	 * ����:��������Ա
	 * @param admin
	 * @return
	 */
	String AddClass(Class Cs);
	/**
	 * ��ѯ��У���Ƿ���ڸð༶����
	 * @param CS
	 * @return
	 */
	boolean ISSchoolClassname(Class CS);
	/**
	 * ��ȡһ��༶����
	 * @param IDArr
	 * @return
	 */
	List GetClassArr(String IDArr);
	
	/**
	 * ��ȡ�༶һ�����
	 * @param Cs
	 * @return
	 */
	String GetClassArrObject(Class Cs);
	
	
}