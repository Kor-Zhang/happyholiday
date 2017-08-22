package com.happyholiday.front.user.util;

import java.util.Random;

/**
 * 获得 短信验证码 6位
 * @author 熊铖
 *
 */
public class GetVerification {
    /** 
     * 产生随机的六位数 
     * @return 
     */  
    public static String getSix(){  
        Random rad=new Random();  
          
        String result  = rad.nextInt(1000000) +"";  
          
        if(result.length()!=6){  
            return getSix();  
        }  
        return result;  
    }  
}
