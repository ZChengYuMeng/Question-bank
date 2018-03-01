package www.cloudquestionbank.com.action;

import java.util.List;
import java.util.Set;

import www.cloudquestionbank.com.entity.Class;
import www.cloudquestionbank.com.entity.Guest;
import www.cloudquestionbank.com.entity.School;
import www.cloudquestionbank.com.services.SIcourse;
import www.cloudquestionbank.com.services.SIsubject;

import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{
	SIsubject sisubject;
	SIcourse sicourse;
	List list;
	List ListTwo;
	Guest guest;
	List listRank;
	List listThree;
	School school;
	Class class1;
	
	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	public Class getClass1() {
		return class1;
	}
	public void setClass1(Class class1) {
		this.class1 = class1;
	}
	public String tuxing(){
		//折线统计报表
		list=sisubject.find_avgToDay(guest.getGuestId().toString());
		//环形统计报表
		ListTwo=sisubject.find_questions(guest.getGuestId().toString());
		return "tuxing";
	}
	public String Ranking(){
		//System.out.println("hi");
		listRank=sicourse.find_Ranking();
		return "Ranking";
	}
	public String Ranking1(){
		//System.out.println("hi");
		//System.out.println(school.getId());
		//System.out.println(class1.getId());
		listRank=sicourse.find_Ranking1(school.getId().toString(),class1.getId().toString());
		//System.out.println("!!!"+listRank.size());
		return "Ranking";
	}
	public String Ranking2(){
		//System.out.println("hi");
		//System.out.println(school.getId());
		listRank=sicourse.find_Ranking2(school.getId().toString());
		return "Ranking";
	}
	public String cuoTi(){
		listThree=sicourse.find_cuoTi(guest.getGuestId().toString());
		return "cuoTi";
	}
	
	public List getListThree() {
		return listThree;
	}
	public void setListThree(List listThree) {
		this.listThree = listThree;
	}
	public Guest getGuest() {
		return guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public void setSisubject(SIsubject sisubject) {
		this.sisubject = sisubject;
	}

	public List getListTwo() {
		return ListTwo;
	}

	public List getListRank() {
		return listRank;
	}
	public void setListRank(List listRank) {
		this.listRank = listRank;
	}
	public void setListTwo(List listTwo) {
		ListTwo = listTwo;
	}
	public void setSicourse(SIcourse sicourse) {
		this.sicourse = sicourse;
	}


	

}
