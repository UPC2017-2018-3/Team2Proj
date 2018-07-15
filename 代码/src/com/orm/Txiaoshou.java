package com.orm;

public class Txiaoshou
{
	private int id;
	private int goods_id;
	
	private int xiaoshoushu;
	private float danjia;
	private float zongjia;
	private String xiaoshoushi;
	
	private String beizhu;
	private Tgoods goods;
	
	
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
	
	public Tgoods getGoods()
	{
		return goods;
	}
	public void setGoods(Tgoods goods)
	{
		this.goods = goods;
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
	
	public String getXiaoshoushi()
	{
		return xiaoshoushi;
	}
	public void setXiaoshoushi(String xiaoshoushi)
	{
		this.xiaoshoushi = xiaoshoushi;
	}
	public int getXiaoshoushu()
	{
		return xiaoshoushu;
	}
	public void setXiaoshoushu(int xiaoshoushu)
	{
		this.xiaoshoushu = xiaoshoushu;
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
