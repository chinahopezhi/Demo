package com.wgh.DB;     //将该类保存到com.wgh.DB包中

import java.sql.*;      //导入提供基本的数据库编程的包
import java.io.*;       //导入提供与设备无关的输入、输出流支持的包
import java.util.*;     //导入提供实用方法和数据结构的类包

public class connDB {
  public Connection conn = null;//定义一个Connection对象
  public Statement stmt = null;//定义一个Statement对象
  public ResultSet rs = null;//定义一个ResultSet对象
  
  static String sd = "sun.jdbc.odbc.JdbcOdbcDriver";
  static String sc = "jdbc:odbc:db_shop";

//  private static String propFileName = "d:/connDB.properties";
 // private static Properties prop = new Properties();
  /*private static void loadProperty() {
    try {
      prop.load(new FileInputStream(propFileName));  //通过文件输入流对象加载Properties文件
      dbClassName = prop.getProperty("DB_CLASS_NAME");
      dbUrl = prop.getProperty("DB_URL",
                               "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_shop");
      dbUser = prop.getProperty("DB_USER", "sa");
      dbPwd = prop.getProperty("DB_PWD", "");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }*/

  public static Connection getConnection() {
	    Connection conn = null;
	    try {
	        //Class.forName(sd);
	       // conn = DriverManager.getConnection(sc);
	        //System.out.println("sa");
	    	String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	    	String url="jdbc:sqlserver://localhost:1433;databaseName=db_shop";
	    	String user="sa";
	    	String password="sa";
	    	Class.forName(driver);
	    	conn = DriverManager.getConnection(url,user,password);
	      }
	      catch (Exception e) {
	        System.err.println(e.getMessage());
	      }
	    return conn;
	  }
  
  public static void main(String args[]) {
	  getConnection();
  }

  /*
   *功能：执行查询语句
   */
  public ResultSet executeQuery(String sql) {
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,  //ResultSet.TYPE_SCROLL_INSENSITIVE常量允许记录指针向前或向后移动，且当Result对象变动记录指针时，会影响记录指针的位置
                                  ResultSet.CONCUR_READ_ONLY);  //ResultSet.CONCUR_READ_ONLY常量可以解释为ResultSet对象仅能读取，不能修改，在对数据库的查询操作中使用
      rs = stmt.executeQuery(sql);    //stmt为Statement对象的一个实例，通过其executeQuery（String sql）方法可以返回一个ResultSet对象
    }
    catch (SQLException ex) {
      System.err.println(ex.getMessage());
    }
    return rs;
  }

  /*
   *功能:执行更新操作
   */
  public int executeUpdate(String sql) {
    int result = 0;
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_READ_ONLY);
      result = stmt.executeUpdate(sql);
    }
    catch (SQLException ex) {
      result = 0;
    }
    try {
      stmt.close();
    }
    catch (SQLException ex1) {
    }
    return result;
  }

  public int executeUpdate_id(String sql) {
    int result = 0;
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_READ_ONLY);
      result = stmt.executeUpdate(sql);
      String ID = "select @@IDENTITY as id";
      rs = stmt.executeQuery(ID);
      if (rs.next()) {
        int autoID = rs.getInt("id");
        result = autoID;
      }
    }
    catch (SQLException ex) {
      result = 0;
    }
    return result;
  }

  /*
   *功能:关闭数据库的连接
   */
  public void close() {
    try {
      if (rs != null) {
        rs.close();
      }
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
    try {
      if (stmt != null) {
        stmt.close();
      }
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
    try {
      if (conn != null) {
        conn.close();
      }
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
  }

}
