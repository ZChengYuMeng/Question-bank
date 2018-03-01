package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import www.cloudquestionbank.com.dao.DIClassState;

public class DClassStateImpl implements DIClassState{
	DI_Impl_Util Du;
	
	@Override
	public List getlist(String sql, String... Strs) {
		return Du.GetList(sql, Strs);
	}


	public void setDu(DI_Impl_Util du) {
		Du = du;
	}
	
}
