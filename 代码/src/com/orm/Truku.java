package com.orm;

public class Truku
{
	private int id;
	private int goods_id;
	private int gongyingshang_id;
	private String danjuhao;
	
	private int rukushu;
	private float danjia;
	private float zongjia;
	
	private String rukushi;
	private String beizhu;
	
	private Tgoods goods;
	private gongyingshang gongyingshang;
	
	
	
	public String getBeizhu()
	{
		return beizhu;
	}
	public void setBeizhu(String beizhu)
	{
		this.beizhu = beizhu;
	}
	public float getDanjia()
	{
		return danjia;
	}
	public void setDanjia(float danjia)
	{
		this.danjia = danjia;
	}
	public String getDanjuhao()
	{
		return danjuhao;
	}
	public void setDanjuhao(String danjuhao)
	{
		this.danjuhao = danjuhao;
	}
	public gongyingshang getGongyingshang()
	{
		return gongyingshang;
	}
	public void setGongyingshang(gongyingshang gongyingshang)
	{
		this.gongyingshang = gongyingshang;
	}
	public Tgoods getGoods()
	{
		return goods;
	}
	public void setGoods(Tgoods goods)
	{
		this.goods = goods;
	}
	public int getGongyingshang_id()
	{
		return gongyingshang_id;
	}
	public void setGongyingshang_id(int gongyingshang_id)
	{
		this.gongyingshang_id = gongyingshang_id;
	}
	public int getGoods_id()
	{
		return goods_id;
	}
	public void setGoods_id(int goods_id)
	{
		this.goods_id = goods_id;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getRukushi()
	{
		return rukushi;
	}
	public void setRukushi(String rukushi)
	{
		this.rukushi = rukushi;
	}
	public int getRukushu()
	{
		return rukushu;
	}
	public void setRukushu(int rukushu)
	{
		this.rukushu = rukushu;
	}
	public float getZongjia()
	{
		return zongjia;
	}
	public void setZongjia(float zongjia)
	{
		this.zongjia = zongjia;
	}
	
}
