package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.orm.Tgoods;
import com.service.liuService;

public class tongji_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		
		if(type.endsWith("tongjiRes"))
		{
			tongjiRes(req, res);
		}
		
	}
	public void tongjiRes(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String bianhao=req.getParameter("bianhao").trim();
		String mingcheng=req.getParameter("mingcheng").trim();
		
		List goodsList=liuService.getGoodsList(bianhao, mingcheng);
		for(int i=0;i<goodsList.size();i++)
		{
			Tgoods goods=(Tgoods)goodsList.get(i);
			int rukuShu=liuService.get_rukuShu(goods.getId());
			int xiaoshoushu=liuService.get_xiaoshouShu(goods.getId());
			goods.setKucun(rukuShu-xiaoshoushu);
			
		}
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/tongji/tongjiRes.jsp").forward(req, res);
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
