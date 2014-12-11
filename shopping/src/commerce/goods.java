package commerce;

public class goods {
  private Integer ID=Integer.getInteger("-1");//商品ID号
  private int typeID=-1;//商品类别ID
  private String goodsName="";//商品名称
  private String introduce="";//商品简介
  private float price=(float)0.0; //商品定价，此处必须强制类型转换
  private float nowPrice=(float)0.0;//商品现价，此处必须强制类型转换
  private String  picture="";//商品图片
  private int newGoods=-1;//是否为新品
  private int sale=-1;//是否特价

  public void goods(){//商品类的构造方法，不能省略
  }

  public Integer getID(){//获取商品ID
 return ID;
}
public void setID(Integer ID){//设置商品ID
 this.ID=ID;
}

  public int getTypeID() {
    return typeID;
  }
public void setTypeID(int typeID) {
  this.typeID = typeID;
}

public String getGoodsName(){
  return goodsName;
}
public void setGoodsName(String goodsName){
  this.goodsName=goodsName;
}

public String getIntroduce(){
  return introduce;
}
public void setIntroduce(String introduce){
  this.introduce=introduce;
}
public float getPrice(){
  return price;
}
public void setPrice(float price){
  this.price=price;
}
public float getNowPrice(){
  return nowPrice;
}
public void setNowPrice(float nowPrice){
  this.nowPrice=nowPrice;
}
public String getPicture(){
  return picture;
}
public void setPicture(String picture){
  this.picture=picture;
}
public int getNewGoods() {
  return newGoods;
}
public void setNewGoods(int newGoods) {
this.newGoods = newGoods;
}
public int getSale() {//获取商品是否为特价商品
  return sale;
}
public void setSale(int sale) {//设置商品是否为特价商品
this.sale = sale;
}
}
