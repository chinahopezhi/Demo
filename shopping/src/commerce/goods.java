package commerce;

public class goods {
  private Integer ID=Integer.getInteger("-1");//��ƷID��
  private int typeID=-1;//��Ʒ���ID
  private String goodsName="";//��Ʒ����
  private String introduce="";//��Ʒ���
  private float price=(float)0.0; //��Ʒ���ۣ��˴�����ǿ������ת��
  private float nowPrice=(float)0.0;//��Ʒ�ּۣ��˴�����ǿ������ת��
  private String  picture="";//��ƷͼƬ
  private int newGoods=-1;//�Ƿ�Ϊ��Ʒ
  private int sale=-1;//�Ƿ��ؼ�

  public void goods(){//��Ʒ��Ĺ��췽��������ʡ��
  }

  public Integer getID(){//��ȡ��ƷID
 return ID;
}
public void setID(Integer ID){//������ƷID
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
public int getSale() {//��ȡ��Ʒ�Ƿ�Ϊ�ؼ���Ʒ
  return sale;
}
public void setSale(int sale) {//������Ʒ�Ƿ�Ϊ�ؼ���Ʒ
this.sale = sale;
}
}
