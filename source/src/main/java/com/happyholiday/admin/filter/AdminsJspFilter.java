package com.happyholiday.admin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.happyholiday.admin.BackStatic;
/**
 * 禁止用户直接访问/admins目录下的页面（除了/admins/index.jsp），
 * 但是允许/admins/index.jsp包含这些页面的操作
 * @author Jhon
 *
 */
public class AdminsJspFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		//request.getRequestURI()的内容为/happyholiday/admins/index.jsp
		//如果请求admins包下的主页，那么允许
		if(request.getRequestURI().equals(request.getContextPath()+"/admins/index.jsp")){
			chain.doFilter(request, response);
		}else{
			//request.getHeader("referer")内容为http://localhost:8080/happyholiday/admins/index.jsp
			String refer = request.getHeader("referer");
			///如果不是/aminds/idnex.jsp发出的请求，那么拒绝的访问
			if(refer==null||refer.indexOf(request.getContextPath()+"/admins/index.jsp")<=0){
				request.setAttribute("msg", "您无权限访问此页面，请谨慎操作！");
				request.getRequestDispatcher("/error/warning.jsp").forward(request, response);
			}else{
				chain.doFilter(request, response);
			}
		}
		
		
	}

	@Override
	public void destroy() {
		
	}

}
