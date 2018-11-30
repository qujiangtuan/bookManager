package com.bie.utils;

import java.io.File;
import java.util.Random;
import java.util.regex.Pattern;

public class StringUtil {
          public static boolean isEmpty(String str) {
                    if ("".equals(str) || str == null) {
                              return true;
                    }
                    return false;
          }

          public static boolean isEmpty(int str) {
                    if ("".equals(str)) {
                              return true;
                    }
                    return false;
          }
          public static String getRandom3() {
                    String threeNumber;
                    Random random = new Random();
                    int i = random.nextInt(1000);
                    String str = i + "";
                    if (i >= 0 && i <= 9) {
                              threeNumber = "00" + str;
                    } else if (i >= 10 && i <= 99) {
                              threeNumber = "0" + str;
                    } else {
                              threeNumber = str;
                    }
                    return threeNumber;
          }
          public static String getRandom2() {
                    String twoNumber;
                    Random random = new Random();
                    int i = random.nextInt(100);
                    String str = i + "";
                    if (i >= 0 && i <= 9) {
                              twoNumber = "0" + str;
                    } else {
                              twoNumber = str;
                    }
                    return twoNumber;
          }
          public static String getRandom4() {
                    String threeNumber;
                    Random random = new Random();
                    int i = random.nextInt(1000);
                    String str = i + "";
                    if (i >= 0 && i <= 9) {
                              threeNumber = "00" + str;
                    } else if (i >= 10 && i <= 99) {
                              threeNumber = "0" + str;
                    } else {
                              threeNumber = str;
                    }
                    return threeNumber;
          }
          /**
           * 正则表达式：判断是否数字
           * @param str
           * @return
           */
          public static boolean isNumeric(String str){ 
                    Pattern pattern = Pattern.compile("[0-9]*"); 
                    return pattern.matcher(str).matches();    
                 }

          public static boolean isEmpty(File file) {
                    if(file==null){
                              return true;
                    }
                    if(!file.exists()){
                              return true;
                    }else
                    if(file.exists() && file.length() == 0) {  
                              return true;
                    } 
                    return false;
          }
          
//          public static void main(String[] args) {
//                    StringUtil su=new StringUtil();
//                    System.out.println(su.getTerm());
//          }
}
