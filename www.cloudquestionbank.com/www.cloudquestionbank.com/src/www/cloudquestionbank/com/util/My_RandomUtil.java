package www.cloudquestionbank.com.util;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;  
/**
 *	�����������
 * @author ( �� )
 *
 */
public class My_RandomUtil {  
    public static final String ALLCHAR = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";  
    public static final String LETTERCHAR = "abcdefghijkllmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";  
    public static final String NUMBERCHAR = "0123456789";  

    /** 
     * ����һ������������ַ���(ֻ������Сд��ĸ������) 
     *  
     * @param length 
     *            ����ַ������� 
     * @return ����ַ��� 
     */  
    public static String generateString(int length) {  
        StringBuffer sb = new StringBuffer();  
        Random random = new Random();  
        for (int i = 0; i < length; i++) {  
            sb.append(ALLCHAR.charAt(random.nextInt(ALLCHAR.length())));  
        }  
        return sb.toString();  
    }  

    /** 
     * ����һ���������������ĸ�ַ���(ֻ������Сд��ĸ) 
     *  
     * @param length 
     *            ����ַ������� 
     * @return ����ַ��� 
     */  
    public static String generateMixString(int length) {  
        StringBuffer sb = new StringBuffer();  
        Random random = new Random();  
        for (int i = 0; i < length; i++) {  
            sb.append(ALLCHAR.charAt(random.nextInt(LETTERCHAR.length())));  
        }  
        return sb.toString();  
    }  

    /** 
     * ����һ���������������д��ĸ�ַ���(ֻ������Сд��ĸ) 
     *  
     * @param length 
     *            ����ַ������� 
     * @return ����ַ��� 
     */  
    public static String generateLowerString(int length) {  
        return generateMixString(length).toLowerCase();  
    }  

    /** 
     * ����һ�������������Сд��ĸ�ַ���(ֻ������Сд��ĸ) 
     *  
     * @param length 
     *            ����ַ������� 
     * @return ����ַ��� 
     */  
    public static String generateUpperString(int length) {  
        return generateMixString(length).toUpperCase();  
    }  

    /** 
     * ����һ�������Ĵ�0�ַ��� 
     *  
     * @param length 
     *            �ַ������� 
     * @return ��0�ַ��� 
     */  
    public static String generateZeroString(int length) {  
        StringBuffer sb = new StringBuffer();  
        for (int i = 0; i < length; i++) {  
            sb.append('0');  
        }  
        return sb.toString();  
    }  

    /** 
     * ������������һ���������ַ��������Ȳ���ǰ�油0 
     *  
     * @param num 
     *            ���� 
     * @param fixdlenth 
     *            �ַ������� 
     * @return �������ַ��� 
     */  
    public static String toFixdLengthString(long num, int fixdlenth) {  
        StringBuffer sb = new StringBuffer();  
        String strNum = String.valueOf(num);  
        if (fixdlenth - strNum.length() >= 0) {  
            sb.append(generateZeroString(fixdlenth - strNum.length()));  
        } else {  
            throw new RuntimeException("������" + num + "ת��Ϊ����Ϊ" + fixdlenth  
                    + "���ַ��������쳣��");  
        }  
        sb.append(strNum);  
        return sb.toString();  
    }  

    /** 
     * ÿ�����ɵ�lenλ��������ͬ 
     *  
     * @param param 
     * @return ���������� 
     */  
    public static int getNotSimple(int[] param, int len) {  
        Random rand = new Random();  
        for (int i = param.length; i > 1; i--) {  
            int index = rand.nextInt(i);  
            int tmp = param[index];  
            param[index] = param[i - 1];  
            param[i - 1] = tmp;  
        }  
        int result = 0;  
        for (int i = 0; i < len; i++) {  
            result = result * 10 + param[i];  
        }  
        return result;  
    }  
    /**
     * ��ȡ��ǰʱ���ַ���
     * @return
     */
    public static String  getDate(){
    	Date d = new Date();  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");  
        String dateNowStr = sdf.format(d); 
    	return dateNowStr;
    }
    /**
     * ���������ȡ�����ٸ���(�Ӵ��������л�ȡһ�鴫��ָ�����Ȳ��ظ���List<Integer>����)
     * @param datas
     * @param max
     * @return
     */
    public static List<Integer> GetNoRepeat(int[] datas,int max){
    	List<Integer> redoms=new ArrayList();
    	while(true){
    		if(redoms.size()==max){break;}
    		else{
    			//ѭ���������飬�жϼ������Ƿ���ڴ���������е�ֵ
    			int Smax=datas.length;
    	        int min=0;
    	        Random random = new Random();
    	        int s = random.nextInt(Smax)%(Smax-min+1) + min;
    	        //System.out.println("�������"+s);
    			if(IsExistence(redoms,datas[s])==false){
    					redoms.add(datas[s]);
    					//System.out.println(datas[s]);
    			}
				
    		}
    	}
    	return redoms;
    }
    /**
     * �жϼ������Ƿ����i
     * @param list
     * @param i
     * @return
     */
    public static boolean IsExistence(List<Integer> list,int i){
    	boolean bool=false;
    	for (Integer o : list) {
			if(o==i){
				bool=true;
			}
			if(bool){break;}
		}
    	return bool;
    }
    
    

    public static void main(String[] args) {  
       /* System.out.println("����һ������������ַ���(ֻ������Сд��ĸ������):" + generateString(10));  
        System.out  
                .println("����һ���������������ĸ�ַ���(ֻ������Сд��ĸ):" + generateMixString(10));  
        System.out.println("����һ���������������д��ĸ�ַ���(ֻ������Сд��ĸ):"  
                + generateLowerString(10));  
        System.out.println("����һ�������������Сд��ĸ�ַ���(ֻ������Сд��ĸ):"  
                + generateUpperString(10));  
        System.out.println("����һ�������Ĵ�0�ַ���:" + generateZeroString(10));  
        System.out.println("������������һ���������ַ��������Ȳ���ǰ�油0:"  
                + toFixdLengthString(123, 10));  
        int[] in = { 1, 2, 3, 4, 5, 6, 7 };  
        System.out.println("ÿ�����ɵ�lenλ��������ͬ:" + getNotSimple(in, 3));  
        System.out.println(getDate());*/
        System.out.println(">>>");
    	int datas[]={1,1,1,1,1,1,1,1,1,1,1,1,1,32,12,40,4,3,5,8,9,100};
        List<Integer> result=GetNoRepeat(datas,10);
        for (Integer i : result) {
			System.out.print(i+"_ ");
		}
    }  
}  