package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.tableValue;
import Bean.wenjuan;
import Dao.dao;

/**
 * Servlet implementation class tubiao_Servlet
 */
@WebServlet("/tubiao_Servlet")
public class tubiao_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tubiao_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	     response.setContentType("text/html;charset=utf-8");
	     String jstj = request.getParameter("jstj");
	     String value = request.getParameter("value");
	     String jsyq = request.getParameter("jsyq");
	     String tjzd = request.getParameter("tjzd");
	     String tblx = request.getParameter("tblx");
	     dao dao = new dao();
	     List<wenjuan> list = null;
	     List<tableValue> listtb = null;
	     if(jsyq.equals("0")) {
	    	 try {
				list = dao.mhfljs(jstj,value);
				listtb = dao.tbvalue(jstj,value,tjzd);
				request.setAttribute("list",list);
				request.setAttribute("listtb",listtb);
				request.setAttribute("tblx", tblx);
				request.setAttribute("tjzd", tjzd);
            	if(list.equals("")||list.equals(null)) {
            		response.getWriter().write("<script>alert('查询结果条数为0！');window.location.href='"+request.getContextPath()+"/templete/fljs.jsp'</script>");
				 }else {
				request.getRequestDispatcher("templete/tubiao.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     }else {
	    	 try {
				list = dao.bmfljs(jstj,value);
				listtb = dao.jqtbvalue(jstj,value,tjzd);
				request.setAttribute("listtb",listtb);
				request.setAttribute("list",list);
				request.setAttribute("tblx", tblx);
//				if(list.equals("")||list.equals(null)) {
//            		response.getWriter().write("<script>alert('查询结果条数为0！');window.location.href='"+request.getContextPath()+"/templete/fljs.jsp'</script>");
//				 }else{ 
				request.getRequestDispatcher("templete/tubiao.jsp").forward(request, response);
//				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	 
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
