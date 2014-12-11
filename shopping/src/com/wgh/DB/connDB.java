package com.wgh.DB;     //�����ౣ�浽com.wgh.DB����

import java.sql.*;      //�����ṩ���������ݿ��̵İ�
import java.io.*;       //�����ṩ���豸�޹ص����롢�����֧�ֵİ�
import java.util.*;     //�����ṩʵ�÷��������ݽṹ�����

public class connDB {
  public Connection conn = null;//����һ��Connection����
  public Statement stmt = null;//����һ��Statement����
  public ResultSet rs = null;//����һ��ResultSet����
  
  static String sd = "sun.jdbc.odbc.JdbcOdbcDriver";
  static String sc = "jdbc:odbc:db_shop";

//  private static String propFileName = "d:/connDB.properties";
 // private static Properties prop = new Properties();
  /*private static void loadProperty() {
    try {
      prop.load(new FileInputStream(propFileName));  //ͨ���ļ��������������Properties�ļ�
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
   *���ܣ�ִ�в�ѯ���
   */
  public ResultSet executeQuery(String sql) {
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,  //ResultSet.TYPE_SCROLL_INSENSITIVE���������¼ָ����ǰ������ƶ����ҵ�Result����䶯��¼ָ��ʱ����Ӱ���¼ָ���λ��
                                  ResultSet.CONCUR_READ_ONLY);  //ResultSet.CONCUR_READ_ONLY�������Խ���ΪResultSet������ܶ�ȡ�������޸ģ��ڶ����ݿ�Ĳ�ѯ������ʹ��
      rs = stmt.executeQuery(sql);    //stmtΪStatement�����һ��ʵ����ͨ����executeQuery��String sql���������Է���һ��ResultSet����
    }
    catch (SQLException ex) {
      System.err.println(ex.getMessage());
    }
    return rs;
  }

  /*
   *����:ִ�и��²���
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
   *����:�ر����ݿ������
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
