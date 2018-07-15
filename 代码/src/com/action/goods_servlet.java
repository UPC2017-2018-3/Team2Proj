package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Tcatelog;
import com.orm.Tgoods;
import com.service.liuService;

public class goods_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("goodsAdd"))
		{
			goodsAdd(req, res);
		}
		if(type.endsWith("goodsMana"))
		{
			goodsMana(req, res);
		}
		if(type.endsWith("goodsDel"))
		{
			goodsDel(req, res);
		}
		if(type.endsWith("goodsAll"))
		{
			goodsAll(req, res);
		}
	}
	
	
	
	
	public void goodsAdd(HttpServletRequest req,HttpServletResponse res)
	{
		int catelog_id=Integer.parseInt(req.getParameter("catelog_id"));
		String bianhao=req.getParameter("bianhao");
		String mingcheng=req.getParameter("mingcheng");
		String danwei=req.getParameter("danwei");
		
		String guige=req.getParameter("guige");
		String beizhu=req.getParameter("beizhu");
		String del="no";
		
		String sql="insert into t_goods values(?,?,?,?,?,?,?)";
		Object[] params={catelog_id,bianhao,mingcheng,danwei,guige,beizhu,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void goodsMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' order by catelog_id";
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
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/goods/goodsMana.jsp").forward(req, res);
	}
	
	
	
	public void goodsDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		System.out.println("dddd");
		String sql="update t_goods set del='yes' where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	public void goodsAll(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' order by catelog_id";
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
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/goods/goodsAll.jsp").forward(req, res);
	}
	
	
	
	
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
            e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
}
