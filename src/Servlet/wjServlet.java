package Servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import Bean.login;
import Bean.wenjuan;
import Dao.dao;

/**
 * Servlet implementation class wjServlet
 */
@WebServlet("/wjServlet")
public class wjServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wjServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		login lg=(login)request.getSession().getAttribute("lg");
		wenjuan w = new wenjuan();
		try {
			BeanUtils.populate(w, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		
		
		
//		String jgmc = request.getParameter("jgmc");
//		String txdz = request.getParameter("txdz");
//		String dwwz = request.getParameter("dwwz");
//		String dzyx = request.getParameter("dzyx");
//		String frdb = request.getParameter("frdb");
//		String yzbm = request.getParameter("yzbm");
//		String lxr = request.getParameter("lxr");
//		String gddh = request.getParameter("gddh");
//		String yddh = request.getParameter("yddh");
//		String cz = request.getParameter("cz");
//		String hgsx = request.getParameter("jgsx");
//		String jgjj = request.getParameter("jgjj");
//		String jgxqmc = request.getParameter("jsxqmc");
//		String  qsxqnf = request.getParameter("qsxqnf");
//		String jzxqnf = request.getParameter("jzxqnf");
//		String zdkjxqgs = request.getParameter("zdkjxqgs");
//		String gjz = request.getParameter("gjz");
//		String kjhdlx = request.getParameter("yjlx");
//		String xkfl = request.getParameter("xkfl");
//		String[] jsly = request.getParameterValues("jsly");
//		String xqjsssly = ",";
//		if(jsly!=null) {
//		for(int i = 0;i<jsly.length;i++) {
//			System.out.println(jsly[i]);
//			if(!jsly[i].equals("其他")) {
//			xqjsssly = jsly[i]+xqjsssly;
//			}
//		}
//		}else {
//			xqjsssly=null;
//		}
//		System.out.println(xqjsssly);
//		String qtjsms = request.getParameter("qtjs");
//		String xqjsyyhy = request.getParameter("yyhy");
//		String hzms =",";
//		String[] ms= request.getParameterValues("hzms");
//		if(ms!=null) {
//		for(int i = 0;i<ms.length;i++) {
//			hzms = ms[i]+hzms;
//		}}else {
//			hzms = null;
//		}
//		String jhtz = request.getParameter("a");
//		String qytz = request.getParameter("a1");
//		String yhdk = request.getParameter("a3");
//		String qtrz = request.getParameter("a2");
//		wenjuan wj = new wenjuan(0,jgmc,txdz,dwwz,dzyx,frdb,yzbm,lxr,gddh,yddh,cz,hgsx,jgjj,jgxqmc,qsxqnf,jzxqnf,zdkjxqgs,gjz,kjhdlx,xkfl,xqjsssly,qtjsms,xqjsyyhy,hzms,jhtz,qytz,yhdk,qtrz);
	    dao dao = new dao();
	    try {
			int rows = dao.addwj(w,lg.getUsername());
			if(rows!=0) {
   			 response.getWriter().write("<script>alert('问卷添加成功！');window.location.href='"+request.getContextPath()+"/login.html'</script>");
   		}else {
   			response.getWriter().write("<script>alert('问卷添加失败！');window.location.href='"+request.getContextPath()+"/zhu/zhuce.jsp'</script>");
   		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
