package www.cloudquestionbank.com.util;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;  
/**
 *	随机数生成器
 * @author ( 人 )
 *
 */
public class My_RandomUtil {  
    public static final String ALLCHAR = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";  
    public static final String LETTERCHAR = "abcdefghijkllmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";  
    public static final String NUMBERCHAR = "0123456789";  

    /** 
     * 返回一个定长的随机字符串(只包含大小写字母、数字) 
     *  
     * @param length 
     *            随机字符串长度 
     * @return 随机字符串 
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
     * 返回一个定长的随机纯字母字符串(只包含大小写字母) 
     *  
     * @param length 
     *            随机字符串长度 
     * @return 随机字符串 
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
     * 返回一个定长的随机纯大写字母字符串(只包含大小写字母) 
     *  
     * @param length 
     *            随机字符串长度 
     * @return 随机字符串 
     */  
    public static String generateLowerString(int length) {  
        return generateMixString(length).toLowerCase();  
    }  

    /** 
     * 返回一个定长的随机纯小写字母字符串(只包含大小写字母) 
     *  
     * @param length 
     *            随机字符串长度 
     * @return 随机字符串 
     */  
    public static String generateUpperString(int length) {  
        return generateMixString(length).toUpperCase();  
    }  

    /** 
     * 生成一个定长的纯0字符串 
     *  
     * @param length 
     *            字符串长度 
     * @return 纯0字符串 
     */  
    public static String generateZeroString(int length) {  
        StringBuffer sb = new StringBuffer();  
        for (int i = 0; i < length; i++) {  
            sb.append('0');  
        }  
        return sb.toString();  
    }  

    /** 
     * 根据数字生成一个定长的字符串，长度不够前面补0 
     *  
     * @param num 
     *            数字 
     * @param fixdlenth 
     *            字符串长度 
     * @return 定长的字符串 
     */  
    public static String toFixdLengthString(long num, int fixdlenth) {  
        StringBuffer sb = new StringBuffer();  
        String strNum = String.valueOf(num);  
        if (fixdlenth - strNum.length() >= 0) {  
            sb.append(generateZeroString(fixdlenth - strNum.length()));  
        } else {  
            throw new RuntimeException("将数字" + num + "转化为长度为" + fixdlenth  
                    + "的字符串发生异常！");  
        }  
        sb.append(strNum);  
        return sb.toString();  
    }  

    /** 
     * 每次生成的len位数都不相同 
     *  
     * @param param 
     * @return 定长的数字 
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
     * 获取当前时间字符串
     * @return
     */
    public static String  getDate(){
    	Date d = new Date();  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");  
        String dateNowStr = sdf.format(d); 
    	return dateNowStr;
    }
    /**
     * 传入数组和取出多少个数(从传入数组中获取一组传入指定长度不重复的List<Integer>集合)
     * @param datas
     * @param max
     * @return
     */
    public static List<Integer> GetNoRepeat(int[] datas,int max){
    	List<Integer> redoms=new ArrayList();
    	while(true){
    		if(redoms.size()==max){break;}
    		else{
    			//循环传入数组，判断集合中是否存在传入的数组中的值
    			int Smax=datas.length;
    	        int min=0;
    	        Random random = new Random();
    	        int s = random.nextInt(Smax)%(Smax-min+1) + min;
    	        //System.out.println("随机数："+s);
    			if(IsExistence(redoms,datas[s])==false){
    					redoms.add(datas[s]);
    					//System.out.println(datas[s]);
    			}
				
    		}
    	}
    	return redoms;
    }
    /**
     * 判断集合中是否存在i
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
       /* System.out.println("返回一个定长的随机字符串(只包含大小写字母、数字):" + generateString(10));  
        System.out  
                .println("返回一个定长的随机纯字母字符串(只包含大小写字母):" + generateMixString(10));  
        System.out.println("返回一个定长的随机纯大写字母字符串(只包含大小写字母):"  
                + generateLowerString(10));  
        System.out.println("返回一个定长的随机纯小写字母字符串(只包含大小写字母):"  
                + generateUpperString(10));  
        System.out.println("生成一个定长的纯0字符串:" + generateZeroString(10));  
        System.out.println("根据数字生成一个定长的字符串，长度不够前面补0:"  
                + toFixdLengthString(123, 10));  
        int[] in = { 1, 2, 3, 4, 5, 6, 7 };  
        System.out.println("每次生成的len位数都不相同:" + getNotSimple(in, 3));  
        System.out.println(getDate());*/
        System.out.println(">>>");
    	int datas[]={1,1,1,1,1,1,1,1,1,1,1,1,1,32,12,40,4,3,5,8,9,100};
        List<Integer> result=GetNoRepeat(datas,10);
        for (Integer i : result) {
			System.out.print(i+"_ ");
		}
    }  
}  