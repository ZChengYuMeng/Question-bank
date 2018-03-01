package www.cloudquestionbank.com.servicesImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DISchool;
import www.cloudquestionbank.com.entity.School;
import www.cloudquestionbank.com.services.SIClass;
import www.cloudquestionbank.com.services.SISchool;

/**
 * ServicesImpl【学校表】
 * @author ( 人 )
 *
 */
public class SSchoolImpl implements SISchool {
	DISchool dis;
	Gson gson=new Gson();//jOSN转换对象
	public void setDis(DISchool dis) {
		this.dis = dis;
	}
	SIClass sic;
	public void setSic(SIClass sic) {
		this.sic = sic;
	}
	List list;
	@Override
	public HashMap<String, Object> GetList(School school) {
		HashMap<String, Object> hmp=new HashMap<String, Object>();//传递数据
		String id="";//接收校区编号
		String sql="select id,name from School  where 1=1 ";
		sql+=school.getId()!=0?" and id="+school.getId():"";
		sql+=" ORDER BY id ";
		//System.out.println(sql);
		list=dis.GetList(sql);
		hmp.put("School", list);
		int i=0;
		for (Object ob : list) {
			Object []o=(Object[])ob;
			id=o[0].toString();
			list=i==0?sic.GetList(id):list;
			i++;
		}
		hmp.put("Class", list);
		return hmp;
	}
	@Override
	public List GetSchool(School school) {
		String sql="select id,name,address,icon from School where id="+school.getId();
		//System.out.println("查询学校信息"+sql);
		return dis.GetList(sql);
	}
	@Override
	public boolean AddSchool(School school) {
		String sql="insert into School(name,address,state,PostalCode,Icon)"+
				    " VALUES('"+school.getName()+"','"+school.getAddress()+"',1,"+school.getPostalCode()+",'"+school.getIcon()+"')";
		return dis.OptionSchool(sql);
	}
	@Override
	public HashMap<String, Object> GetSchoolList(School school) {
		HashMap<String, Object> hmp=new HashMap<String, Object>();//传递数据
		String id="";//接收校区编号
		String sql="select id,name from School  where 1=1 ";
		sql+=school.getId()!=0?" and id="+school.getId():"";
		sql+=" ORDER BY id ";
		//System.out.println(sql);
		list=dis.GetList(sql);
		hmp.put("School", list);
		return hmp;
	}
	@Override
	public boolean ISSchoolName(School school) {
		String sql="select name from School where name='"+school.getName()+"'";
		return dis.IsSchoolName(sql);
	}
	@Override
	public String GetOBJECtchoolList(School school) {
		List list;//接收校区集合
		String sql="select a.id,a.name,address,b.sname ,PostalCode,Icon,a.state from School as a,SchoolStatus as b WHERE 1=1 and a.state=b.id ";
		       sql+=school.getId()!=0?" and  a.id ="+school.getId():"";
		list=dis.GetList(sql);
		String jsonStr="[";int i=0;
		for (Object o : list) {
			Object []obj=(Object[]) o;
			jsonStr+="{\"id\":\""+obj[0]+"\",\"name\":\""+obj[1]+"\",\"address\":\""+obj[2]+"\",\"StateName\":\""+obj[3]+"\",\"PostalCode\":\""+obj[4]+"\",\"Icon\":\""+obj[5]+"\",\"statID\":\""+obj[6]+"\"}";
			jsonStr+=i==list.size()-1?"":",";
			i++;
		}
		jsonStr+="]";
		return jsonStr;
	}
	@Override
	public List GetOneSchool(String id) {
		String sql="select  name from school where id="+id;
		return dis.GetList(sql);
	}
	@Override
	public boolean UpdSchool(School school) {
		String sql="update school set address='"+school.getAddress()+"',state="+school.getState()+",PostalCode="+school.getPostalCode()+" where id="+school.getId();
		return dis.OptionSchool(sql);
	}
	
	
	
}
