package www.cloudquestionbank.com.servicesImpl;

import www.cloudquestionbank.com.dao.DIOperationRecord;
import www.cloudquestionbank.com.services.SIOperationRecord;

/**
 * ServicesImpl【[操作记录表]】
 * @author ( 人 )
 *
 */
public class SOperationRecordImpl implements SIOperationRecord{
	DIOperationRecord dio;

	public void setDio(DIOperationRecord dio) {
		this.dio = dio;
	}
	
}
