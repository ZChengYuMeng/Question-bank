package www.cloudquestionbank.com.servicesImpl;

import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DIClassState;
import www.cloudquestionbank.com.daoImpl.DClassStateImpl;
import www.cloudquestionbank.com.services.SIClassState;

public class SClassStateImpl implements SIClassState{
	DIClassState DIs;
	Gson gson=new Gson();
	@Override
	public String GetClassStatelist() {
		String sql="select classStateId,classStateName from classstate";
		return gson.toJson(DIs.getlist(sql));
	}
	
	public void setDIs(DIClassState dIs) {
		DIs = dIs;
	}
	
	
}
