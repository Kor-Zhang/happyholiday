package com.happyholiday.front.car.filter;

import org.apache.log4j.Logger;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebFault;

public class ForwardIndex implements Filter {
	/**
	 * Logger for this class
	 */
	private FilterConfig config = null;
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filterChain) throws IOException, ServletException {
			String path =  "http://localhost:8080/happyholiday/indexAction!getCarouselInfo.action";
			((HttpServletResponse)res).sendRedirect( path);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}

}
