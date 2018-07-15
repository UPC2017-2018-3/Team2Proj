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
import com.service.liuService;

public class ruku_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("rukuAdd"))
		{
			rukuAdd(req, res);
		}
		if(type.endsWith("rukuMana"))
		{
			rukuMana(req, res);
		}
		if(type.endsWith("rukuDel"))
		{
			rukuDel(req, res);
		}
	}
	
	
	
	
	public void rukuAdd(HttpServletRequest req,HttpServletResponse res)
	{
		int goods_id=Integer.parseInt(req.getParameter("goods_id"));
		int gongyingshang_id=Integer.parseInt(req.getParameter("gongyingshang_id"));
		String danjuhao=req.getParameter("danjuhao");
		int rukushu=Integer.parseInt(req.getParameter("rukushu"));
		
		float danjia=Float.parseFloat(req.getParameter("danjia"));
		float zongjia=danjia * rukushu;
		
		String rukushi=req.getParameter("rukushi");
		String beizhu=req.getParameter("beizhu");
		
		String sql="insert into t_ruku values(?,?,?,?,?,?,?,?)";
		Object[] params={goods_id,gongyingshang_id,danjuhao,rukushu,
				         danjia,zongjia,rukushi,beizhu};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "ruku?type=rukuMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void rukuDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="delete from t_ruku where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "ruku?type=rukuMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void rukuMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List rukuList=new ArrayList();
		String sql="select * from t_ruku";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Truku ruku=new Truku();
				
				ruku.setId(rs.getInt("id"));
				ruku.setGoods_id(rs.getInt("goods_id"));
				ruku.setGongyingshang_id(rs.getInt("gongyingshang_id"));
				ruku.setDanjuhao(rs.getString("danjuhao"));
				
				ruku.setRukushu(rs.getInt("rukushu"));
				ruku.setDanjia(rs.getFloat("danjia"));
				ruku.setZongjia(rs.getFloat("zongjia"));
				
				ruku.setRukushi(rs.getString("rukushi"));
				ruku.setBeizhu(rs.getString("beizhu"));
				
				ruku.setGoods(liuService.get_goods(rs.getInt("goods_id")));
				ruku.setGongyingshang(liuService.get_gongyingshang(rs.getInt("gongyingshang_id")));
				rukuList.add(ruku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("rukuList", rukuList);
		req.getRequestDispatcher("admin/ruku/rukuMana.jsp").forward(req, res);
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
