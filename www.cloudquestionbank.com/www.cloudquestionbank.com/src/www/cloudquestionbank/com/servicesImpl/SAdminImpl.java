package www.cloudquestionbank.com.servicesImpl;

import java.util.HashMap;
import java.util.List;

import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DIAdmin;
import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.services.SIAdmin;

/**
 * ServicesImpl【管理员】
 * @author ( 人 )
 *
 */
public class SAdminImpl implements SIAdmin{
		DIAdmin dia;
		String JsonStr="";//传值JSonString
		Gson gson=new Gson();//JOSN装换对象
		public void setDia(DIAdmin dia) {
			this.dia = dia;
		}
		HashMap<String, Object> hmp=new HashMap<String, Object>();//传值
		@Override
		public List loginDl(String... str) {
			return dia.loginDl("select admin_ID,admin_name,imgUrl,status,adminTypeID,realName,schoolID "+
					            "from Admin  where email=? and pwd=? ", str);
		}
	
		@Override
		public List adminfindid( String... str) {
			return dia.adminfindid("select admin_name,imgUrl,b.typeName,a.adminTypeID from admin a,AdminType b where a.adminTypeID=b.id and admin_ID=?", str);
		}

		@Override
		public String FindAdminStatus(Admin admin) {
			String sql="select status from admin where admin_ID= ?";
			return dia.findAdminStatus(sql, admin.getAdminId());
		}

		@Override
		public boolean findAdminIsExistence(Admin admin) {
			String sql="select id  from Admin  where 1=1 ";
			sql+=admin.getEmail()!=null?" and email='"+admin.getEmail()+"'":""; 
			sql+=admin.getPwd()!=null?" and pwd='"+admin.getPwd()+"'":""; 
			//System.out.println("sql_: "+sql);
			int ret=Integer.parseInt(dia.findAdminIsExistence(sql));
			return (ret>0);
			//return dia.adminfindid("select * from admin  where id=? ", str);
		}

		@Override
		public boolean Addadmin(Admin admin) {
			String adminID=admin.getCardNo()+admin.getAdminPhone().substring(admin.getAdminPhone().length()-4, admin.getAdminPhone().length());
			//System.out.println(adminID);
			admin.setAdminId(adminID);//生成管理员编号
			String sql="insert into Admin(admin_ID,admin_name,admin_phone,imgUrl,lastLoginTime,status,adminTypeID,email,pwd,createTime,updateTime,address,realName,cardNo,schoolID)"+
					   "VALUES('"+admin.getAdminId()+"','"+admin.getAdminName()+"','"+admin.getAdminPhone()+"','"+admin.getImgUrl()+"',now(),3,"+admin.getAdminTypeId()+",'"+admin.getEmail()+"'"+
					   ",'"+admin.getPwd()+"',now(),now(),'"+admin.getAddress()+"','"+admin.getRealName()+"','"+admin.getCardNo()+"',"+admin.getSchoolId()+")";
			//System.out.println(sql);
			return dia.OptionAdmin(sql);
		}

		@Override
		public boolean AdminIsEmail(Admin admin) {
			//System.out.println(admin);
			String sql="select email from Admin where email='"+admin.getEmail()+"'";	
			//System.out.println(sql);
			return dia.GetList(sql).size()>0?true:false;
		}

		@Override
		public boolean AdminIsCardNo(Admin admin) {
			//System.out.println(admin.getCardNo());
			String sql="select cardNo from Admin where cardNo='"+admin.getCardNo()+"'";
			//System.out.println(sql);
			return dia.GetList(sql).size()>0?true:false;
		}

		@Override
		public String GetJsonObject(Admin admin) {
			List list;//管理员集合
			//System.out.println(admin);
			String hql="select a.admin_ID,a.admin_name,a.admin_phone,a.lastLoginTime,a.status,a.adminTypeID,a.email,a.pwd,a.createTime,a.updateTime,a.address,a.realName,a.cardNo,a.schoolID,b.typeName,c.adminStatusName,d.name "+
						" from  Admin as a ,AdminType b,AdminStatus c,School d where a.adminTypeID=b.Id and a.status=c.id and a.schoolID=d.id "+
						" and a.adminTypeId>"+admin.getAdminTypeId();
					hql+=admin.getSchoolId()==0?"":" and a.schoolId="+admin.getSchoolId();	
					//System.out.println(hql);
			list=dia.adminfindid(hql);
			JsonStr="[";int i=0;
			for (Object o : list) {
				Object []obj=(Object[]) o;
				JsonStr+="{\"adminId\":\""+obj[0]+"\",\"adminName\":\""+obj[1]+"\",\"adminPhone\":\""+obj[2]+"\",\"lastLoginTime\":\""+obj[3]+"\",\"status\":\""+obj[4]+"\",\"adminTypeId\":\""+obj[5]+"\",\"email\":\""+obj[6]+"\",\"pwd\":\""+obj[7]+"\",\"createTime\":\""+obj[8]+"\",\"updateTime\":\""+obj[9]+"\",\"address\":\""+obj[10]+"\",\"realName\":\""+obj[11]+"\",\"cardNo\":\""+obj[12]+"\",\"schoolID\":\""+obj[13]+"\",\"AdminTypeName\":\""+obj[14]+"\",\"statusName\":\""+obj[15]+"\",\"SchoolName\":\""+obj[16]+"\"}";
				JsonStr+=i==list.size()-1?"":",";
				i++;
			}
			JsonStr+="]";
			// System.out.println(JsonStr);
			return JsonStr;
		}

		@Override
		public boolean UpdAdmin(Admin admin) {
			String  sql="update Admin set status="+admin.getStatus()+" ,adminTypeID="+admin.getAdminTypeId()+" ,address='"+admin.getAddress()+"' where admin_ID='"+admin.getAdminId()+"'";
			System.out.println(sql);
			return dia.OptionAdmin(sql);
		}

		@Override
		public String GetJSonTeacher(Admin admin) {
			String sql="select admin_id,realName from admin where adminTypeID=4 ";
			 		sql+=admin.getSchoolId()!=0?" and schoolID="+admin.getSchoolId():"  and schoolID=1";//为超级管理员时默认查询出第一个校区的教员信息
			hmp.put("Teacher", dia.GetList(sql));
			JsonStr=gson.toJson(hmp);
			return JsonStr;
		}

		
		
}
