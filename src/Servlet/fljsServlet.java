package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.wenjuan;
import Dao.dao;

/**
 * Servlet implementation class fljsServlet
 */
@WebServlet("/fljsServlet")
public class fljsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fljsServlet() {
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
	     dao dao = new dao();
	     List<wenjuan> list = null;
	     if(jsyq.equals("0")) {
	    	 try {
				list = dao.mhfljs(jstj,value);
				request.setAttribute("list",list);
            	if(list.equals("")||list.equals(null)) {
            		response.getWriter().write("<script>alert('查询结果条数为0！');window.location.href='"+request.getContextPath()+"/templete/fljs.jsp'</script>");
				 }else {
				request.getRequestDispatcher("templete/fljs.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     }else {
	    	 try {
				list = dao.bmfljs(jstj,value);
				request.setAttribute("list",list);
//				if(list.equals("")||list.equals(null)) {
//            		response.getWriter().write("<script>alert('查询结果条数为0！');window.location.href='"+request.getContextPath()+"/templete/fljs.jsp'</script>");
//				 }else{ 
					 System.out.println("1");
				request.getRequestDispatcher("templete/fljs.jsp").forward(request, response);
				 System.out.println("2");
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
