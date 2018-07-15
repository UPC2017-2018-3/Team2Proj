package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Tgoods;
import com.orm.Truku;
import com.orm.Txiaoshou;
import com.service.liuService;

public class xiaoshou_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("xiaoshouAdd"))
		{
			xiaoshouAdd(req, res);
		}
		if(type.endsWith("xiaoshouMana"))
		{
			xiaoshouMana(req, res);
		}
		if(type.endsWith("xiaoshouDel"))
		{
			xiaoshouDel(req, res);
		}
	}
	
	
	
	
	public void xiaoshouAdd(HttpServletRequest req,HttpServletResponse res)
	{
		
		int goods_id=Integer.parseInt(req.getParameter("goods_id"));
		int xiaoshoushu=Integer.parseInt(req.getParameter("xiaoshoushu"));
		
		float danjia=Float.parseFloat(req.getParameter("danjia"));
		float zongjia=danjia * xiaoshoushu;
		String xiaoshoushi=req.getParameter("xiaoshoushi");
		String beizhu=req.getParameter("beizhu");
		
		
		
		int rukuShu=liuService.get_rukuShu(goods_id);
		if(xiaoshoushu>rukuShu)
		{
			req.setAttribute("msg", "库存不足");
			String targetURL = "/common/msg.jsp";
			dispatch(targetURL, req, res);
		}
		else
		{
			String sql="insert into t_xiaoshou values(?,?,?,?,?,?)";
			Object[] params={goods_id,xiaoshoushu,
					         danjia,zongjia,xiaoshoushi,beizhu};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			mydb.closed();
			
			
			req.setAttribute("message", "操作成功");
			req.setAttribute("path", "xiaoshou?type=xiaoshouMana");
			
			String targetURL = "/common/success.jsp";
			dispatch(targetURL, req, res);
		}
		
		
	}
	
	
	public void xiaoshouMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List xiaoshouList=new ArrayList();
		String sql="select * from t_xiaoshou";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Txiaoshou xiaoshou=new Txiaoshou();
				
				xiaoshou.setId(rs.getInt("id"));
				xiaoshou.setGoods_id(rs.getInt("goods_id"));
				
				xiaoshou.setXiaoshoushu(rs.getInt("xiaoshoushu"));
				xiaoshou.setDanjia(rs.getFloat("danjia"));
				xiaoshou.setZongjia(rs.getFloat("zongjia"));
				xiaoshou.setXiaoshoushi(rs.getString("xiaoshoushi"));
				
				xiaoshou.setBeizhu(rs.getString("beizhu"));
				
				xiaoshou.setGoods(liuService.get_goods(rs.getInt("goods_id")));
				xiaoshouList.add(xiaoshou);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("xiaoshouList", xiaoshouList);
		req.getRequestDispatcher("admin/xiaoshou/xiaoshouMana.jsp").forward(req, res);
	}
	
	
	public void xiaoshouDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="delete from t_xiaoshou where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "xiaoshou?type=xiaoshouMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
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
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
