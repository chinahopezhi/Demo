package com.wgh.DB;
public class chStr {
        /***************************************************
                *method name:	chStr()
                *method function:解决输出中文乱码问题
                *return value:  String
                *2011-04-08
        ****************************************************/
        public String chStr(String str){
                if(str==null){
                        str="";
                }else{
                        try{
                                str=(new String(str.getBytes("iso-8859-1"),"GB2312")).trim();//String类的getBytes方法是一个取得字符串编码类型的函数，trim（）方法用于去除字符串的收尾空格
                        }catch(Exception e){
                                e.printStackTrace(System.err);
                        }
                }
                return str;
            }
        /***************************************************
          *method name:convertStr()
          *method function:显示文本中的回车换行、空格及保证HTML标记的正常输出
          *return value:  String
          * author:wgh
          *2011-04-08
        ****************************************************/
       public String convertStr(String str1){
           if(str1==null){
               str1="";
           }else{
               try{
                 //replaceAll(String str1,String str2)方法为JDK1.4.x的新方法，使用str2替换字符串中的所有str2字符串
                 str1=str1.replaceAll("<","&lt;");//替换字符串中的"<"和">"字符，保证HTML标记的正常输出
                 str1=str1.replaceAll(">","&gt;");
                 str1=str1.replaceAll(" ","&nbsp;");//空格符
                 str1=str1.replaceAll("\r\n","<br>");//回车换行符
               }catch(Exception e){
                       e.printStackTrace(System.err);
               }
           }
           return str1;
       }
}
