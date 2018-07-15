package com.orm;

public class Tgoods
{
	private int id;
	private int catelog_id;
	private String bianhao;
	private String mingcheng;
	
	private String danwei;
	private String guige;
	
	private String beizhu;
	private String del;
	
	private int kucun;
	
	
	public String getBeizhu()
	{
		return beizhu;
	}
	public void setBeizhu(String beizhu)
	{
		this.beizhu = beizhu;
	}
	public String getBianhao()
	{
		return bianhao;
	}
	public void setBianhao(String bianhao)
	{
		this.bianhao = bianhao;
	}
	public int getCatelog_id()
	{
		return catelog_id;
	}
	public void setCatelog_id(int catelog_id)
	{
		this.catelog_id = catelog_id;
	}
	public String getDanwei()
	{
		return danwei;
	}
	public void setDanwei(String danwei)
	{
		this.danwei = danwei;
	}
	public String getDel()
	{
		return del;
	}
	public void setDel(String del)
	{
		this.del = del;
	}
	
	public int getKucun()
	{
		return kucun;
	}
	public void setKucun(int kucun)
	{
		this.kucun = kucun;
	}
	public String getGuige()
	{
		return guige;
	}
	public void setGuige(String guige)
	{
		this.guige = guige;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	
	
	public String getMingcheng()
	{
		return mingcheng;
	}
	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}
}
