package www.cloudquestionbank.com.servicesImpl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.jaxen.function.SumFunction;



import javax.security.auth.x500.X500Principal;

import www.cloudquestionbank.com.dao.DIsubject;
import www.cloudquestionbank.com.daoImpl.DsubjectImpl;
import www.cloudquestionbank.com.entity.Subject;
import www.cloudquestionbank.com.entity.Topicselftesthistory;
import www.cloudquestionbank.com.entity.Topicselftesthistorydetails;
import www.cloudquestionbank.com.services.SIsubject;

/**
 * ServicesImpl【题目表】
 * 
 * @author ( 人 )
 * 
 */
public class SsubjectImpl implements SIsubject {
	DIsubject dis;

	public void setDis(DIsubject dis) {
		this.dis = dis;
	}

	@Override
	public boolean insertsb(Subject sbj) {
		// TODO Auto-generated method stub
		try {
			dis.insertsb(sbj);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List findkc() {
		// TODO Auto-generated method stub
		return dis
				.findkc(" select  * from  course where attribute_ID not in(select id from  course where attribute_ID=0) and attribute_ID!=0");
	}

	@Override
	public List findkc_couse(String... str) {
		List<Object[]> objs = dis
				.findkc_couse(
						"select * from subject where aourse_id =(select id from course where course_name=? and stageID=?)",
						str);
		List ids = new ArrayList();
		for (Object[] objects : objs) {
			ids.add(objects[0]);
		}
		// from Subject
		List<String> parameters = new ArrayList<String>();
		String where = "";
		int[] random = null;
		if (ids.size() > 10) {
			random = randomCommon(10, ids.size());
		} else {
			random = randomCommon(ids.size(), ids.size());
		}
		for (int i = 0; i < random.length; i++) {
			where += "aourse_id =(select id from course where course_name=? and stageID=?) and id =? or ";
			parameters.add(str[0]);
			parameters.add(str[1]);
			parameters.add(ids.get(random[i]) + "");
		}
		str = new String[parameters.size()];
		for (int i = 0; i < parameters.size(); i++) {
			str[i] = parameters.get(i);
		}
		where = where.substring(0, where.lastIndexOf(" or "));
		return dis.findkc_couse("select * from subject where " + where, str);
	}

	public int[] randomCommon(int n, int max) {
		final int num = n;
		int Random[] = new int[num];
		for (int i = 0; i < num; i++) {
			while (true) {
				int ran = (int) (Math.random() * max);
				for (int j = 0; j < i; j++) {
					if (Random[j] == ran) {
						ran = -1;
						break;
					}
				}
				if (ran != -1) {
					Random[i] = ran;
					break;
				}

			}

		}
		return Random;
	}

	
	
	
	@Override
	public boolean insert_tsy(Topicselftesthistory tsy) {
		try {
			dis.insert_tsy(tsy);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 题目自测历史详情表 功能:添加
	 * 
	 * @param tsy
	 */
	public boolean insert_tsyDetails(Topicselftesthistorydetails tsyd) {
		try {
			dis.insert_tsyDetails(tsyd);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List find_tsyDetails(String... str) {
		return dis
				.find_tsyDetails(
						"select  * from TopicSelfTestHistory where guestID=? and coursed=? GROUP BY id desc  limit ?;",
						str);
	}

	@Override
	public List find_tsy(String... str) {
		return dis
				.find_tsyDetails(
						"select  * from TopicSelfTestHistory where guestID=? and coursed=? GROUP BY id desc  limit 1;",
						str);
	}

	@Override
	public List find_timu(String... str) {
		String sql = "select t.id ,s.stem,s.a,s.b,s.c,s.d "
				+ ",y.guestID,t.topicSelfTestHistoryid from subject as s,Topicselftesthistorydetails as t,topicselftesthistory as y where "
				+ "t.subjecteID=s.id  and  t.topicSelfTestHistoryid=y.id and y.endTime is null  and "
				+ "s.aourse_id =(select id from course where "
				+ " course_name=? and stageID=?) ";
		//System.out.println(sql);
		return dis.find_timu(sql, str);
	}

	@Override
	public List find_all() {
		return dis.find_all();
	}

	@Override
	public boolean update_paper(String... str) {
		//System.out.println("TMD");
		try {
			//System.out.println("？？？？");
			dis.update_paper(
					"update Topicselftesthistorydetails set guestChoice=? WHERE ID= ?",
					str);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List FindID(String... Strs) {
		String sql = "select topicSelfTestHistoryid from TopicSelfTestHistoryDetails where id=? ";
		return dis.FindID(sql, Strs);
	}

	@Override
	public boolean update_tsyDetails(String... str) {
		try {
			System.out.println("==========>>>>>>");
			dis.update_tsyDetails(
					"update TopicSelfTestHistory set endTime=now() where id=?",
					str);
			;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<Subject> find_Subject(int cid) {
		return dis.find_Subject(cid);
	}

	@Override
	public boolean find_Assignment(String... str) {
		// TODO Auto-generated method stub
		try {
			List objlist = dis
					.FindID("select topicSelfTestHistoryid from TopicSelfTestHistoryDetails where id=? ",
							str);
			//System.out.println("交卷功能>>>>>>" + str[0]);
			List boollsit = dis
					.find_bool(
							"select * from TopicSelfTestHistoryDetails a,subject b where  b.id=a.subjecteID and a.guestChoice in(select answer from  subject  where  id=subjecteID )and a.topicSelfTestHistoryid=?",
							objlist.get(0).toString());
		//	System.out.println("---------" + boollsit.size());
			// list size()的 大小>0 用户作答正确:<0用户作答错误
			System.out.println("==-=--=-=-=-=-=-=-");
			if (boollsit.size()>0) {
				dis.update_answer(
						"update TopicSelfTestHistoryDetails set correct=1 where id=?",
						str);
				// List
				// listSize=dis.FindID("select * from TopicSelfTestHistoryDetails where topicSelfTestHistoryid=? and correct=1",
				// objlist.get(0).toString());
				List listCount = dis.FindID(
						"select * from TopicSelfTestHistory where id=?",
						objlist.get(0).toString());

				//System.out.println(">>>>>>>>>>>>>");
				for (Object object : listCount) {
					Object[] ob = (Object[]) object;
					// System.out.println(ob[2]+">--->"+listSize.size());
					int size = boollsit.size();
					int count = (Integer) ob[2];
					DecimalFormat df = new DecimalFormat("0.00");
					//System.out.println("===>>" + count + "-=-=" + size);
					String[] str1 = { Integer.toString(size),
							df.format((double) size / (double) count * 100),
							objlist.get(0).toString() };
					dis.update_tsyDetails(
							"update TopicSelfTestHistory set endTime=now(),whenreally=?,obtainScore=? where id=?",
							str1);

				}
				//System.out.println("----------if修改得分----------");
				// dis.update_tsyDetails("update TopicSelfTestHistory set endTime=now() where id=?",objlist.get(0).toString());
				//System.out.println("修改成功！！！");
			} else {
				dis.update_answer(
						"update TopicSelfTestHistoryDetails set correct=0 where id=?",
						str);
				//System.out.println(objlist.get(0));
				// List
				// listSize=dis.FindID("select * from TopicSelfTestHistoryDetails where topicSelfTestHistoryid=? and correct=0",
				// objlist.get(0).toString());
				List listCount = dis.FindID(
						"select * from TopicSelfTestHistory where id=?",
						objlist.get(0).toString());
				// if(listSize.size()>0){
				//System.out.println(">>>>>>>>>>>>>");
				for (Object object : listCount) {
					Object[] ob = (Object[]) object;
					// System.out.println(ob[2]+">--->"+listSize.size());
					int size = boollsit.size();
					int count = (Integer) ob[2];
					DecimalFormat df = new DecimalFormat("0.00");
					//System.out.println("===>>" + count + "-=-=" + size);
					String[] str1 = {
							Integer.toString(size),
							df.format(0), objlist.get(0).toString() };
					dis.update_tsyDetails(
							"update TopicSelfTestHistory set endTime=now(),whenreally=?,obtainScore=? where id=?",
							str1);
				}
				// }

				//System.out.println("---------else-----------");
				//
				//System.out.println("修改成功！！！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List FindAourseCourse(String...Strs) {
		String  sql="select id from subject where aourse_id in("+Strs[0]+")";
		return dis.Getlist(sql);
	}
	public List find_avgToDay(String... str) {
		List list = new ArrayList();
		// 依次是 当天 /前..天
		list.add(dis
				.find_avgToDay(
						"select * from topicselftesthistory where guestID=? and to_days(endTime) = to_days(now())",
						str));
		list.add(dis
				.find_avgToDay(
						"select * from topicselftesthistory where guestID=? and to_days(endTime) = to_days(now())-1",
						str));
		list.add(dis
				.find_avgToDay(
						"select * from topicselftesthistory where  guestID=? and to_days(endTime) = to_days(now())-2",
						str));
		list.add(dis
				.find_avgToDay(
						"select * from topicselftesthistory where guestID=? and to_days(endTime) = to_days(now())-3",
						str));
		list.add(dis
				.find_avgToDay(
						"select * from topicselftesthistory where guestID=? and to_days(endTime) = to_days(now())-4",
						str));
		list.add(dis
				.find_avgToDay(
						"select * from topicselftesthistory where  guestID=? and to_days(endTime) = to_days(now())-5",
						str));
		list.add(dis
				.find_avgToDay(
						"select * from topicselftesthistory where guestID=? and to_days(endTime) = to_days(now())-6",
						str));
		//System.out.println(list.size() + "====>>>");
		//System.out.println(list.get(0).toString());
		return list;
	}

	@Override
	public boolean find_guestID(String... str) {
		// TODO Auto-generated method stub
		// 用于查询所做的 题目属于哪级课程
		List listculum = dis
				.FindID("select completedQuantity from completeCurriculum  where guestID =2 and "
						+ "courseID=(select id from course where id=(select attribute_ID from course where id=( "
						+ "select attribute_ID from course where id=(select id from course where "
						+ "course_name=? and stageID=?))))", str[0].toString(),
						str[1].toString());
		List objlist1 = dis
				.FindID("select topicSelfTestHistoryid from TopicSelfTestHistoryDetails where id=? ",
						str[2]);
		//System.out.println("::::" + objlist1.get(0).toString());
		List findList = dis.FindID(
				"select answerCount from topicselftesthistory where id=?",
				objlist1.get(0).toString());
		int Count = (Integer) findList.get(0) + (Integer) listculum.get(0);
		dis.update_answer(
				"update completeCurriculum set completedQuantity =? where courseID=(select id from course where id=(select attribute_ID from course where id=( "
						+ " select attribute_ID from course where id=(select id from course where "
						+ " course_name=? and stageID=?)))) and guestID=?",
				Integer.toString(Count), str[0].toString(), str[1].toString(),
				str[3].toString());

		return true;
	}

	@Override
	public List find_questions(String... str) {
		// TODO Auto-generated method stub
		List list=dis.find_bool("select * from completeCurriculum where guestID=?", str);
		return list;
	}

	@Override
	public List Thewrongquestion(String... str) {
		// TODO Auto-generated method stub
			
		List list = dis.find_bool("select  distinct s.id ,s.stem,s.a,s.b,s.c,s.d ,s.answer, "
				+ " t.guestChoice from subject  s,Topicselftesthistorydetails  t "
				+ " where  s.id=t.subjecteID	 and "
				+ " t.topicselftesthistoryid =((select id from  topicselftesthistory "
				+ " where answerCount!=whenreally and "
				+ " coursed= ( select id from course where "
				+ " course_name=? and stageID=?) "
				+ " and  guestID=? GROUP BY startTime desc  limit 1))", str);
		//System.out.println(list.size());
		return list;
	}

	@Override
	public List find_Thewrong(String... str) {
		// TODO Auto-generated method stub
		List  list = dis.find_bool("select id,aourse_id from subject where id "
				+ " in(select subjecteID from topicselftesthistorydetails "
				+ " where topicselftesthistoryid "
				+ " in(select id from  topicselftesthistory "
				+ " where answerCount!=whenreally and "
				+ " coursed= ( select id from course where "
				+ " course_name=? and stageID=?) "
				+ " and  guestID=?))", str);
		return list;
	}
	
}
