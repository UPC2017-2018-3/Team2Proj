package com.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.DB;
import com.orm.Tgoods;
import com.orm.gongyingshang;

public class liuService
{
	
	public static Tgoods get_goods(int id)
	{
		Tgoods goods=new Tgoods();
		String sql="select * from t_goods where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setBianhao(rs.getString("bianhao"));
				goods.setMingcheng(rs.getString("mingcheng"));
				
				goods.setDanwei(rs.getString("danwei"));
				goods.setGuige(rs.getString("guige"));
				goods.setBeizhu(rs.getString("beizhu"));
				goods.setDel(rs.getString("del"));
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return goods;
	}
	
	
	public static gongyingshang get_gongyingshang(int id)
	{
		gongyingshang gongyingshang=new gongyingshang();
		String sql="select * from t_gongyingshang where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				gongyingshang.setId(rs.getInt("id"));
				gongyingshang.setMingcheng(rs.getString("mingcheng"));
				gongyingshang.setDizhi(rs.getString("dizhi"));
				gongyingshang.setLianxiren(rs.getString("lianxiren"));
				
				gongyingshang.setDianhua(rs.getString("dianhua"));
				gongyingshang.setYoubian(rs.getString("youbian"));
				gongyingshang.setChuanzhen(rs.getString("chuanzhen"));
				gongyingshang.setYouxiang(rs.getString("youxiang"));
				
				gongyingshang.setDel(rs.getString("del"));
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return gongyingshang;
	}
	
	public static List getGoodsList(String bianhao,String mingcheng)
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' and bianhao like '%"+bianhao+"%'"+" and mingcheng like '%"+mingcheng+"%'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setBianhao(rs.getString("bianhao"));
				goods.setMingcheng(rs.getString("mingcheng"));
				
				goods.setDanwei(rs.getString("danwei"));
				goods.setGuige(rs.getString("guige"));
				goods.setBeizhu(rs.getString("beizhu"));
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return goodsList;
	}
	
	
	public static int get_rukuShu(int goods_id)
	{
		int i=0;
		
		String sql="select * from t_ruku where goods_id=?";
		Object[] params={goods_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				i=i+rs.getInt("rukushu");
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return i;
	}
	
	
	public static int get_xiaoshouShu(int goods_id)
	{
		int i=0;
		
		String sql="select * from t_xiaoshou where goods_id=?";
		Object[] params={goods_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				i=i+rs.getInt("xiaoshoushu");
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return i;
	}
}
