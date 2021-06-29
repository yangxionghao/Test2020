package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.wenjuan;
import Dao.dao;

/**
 * Servlet implementation class xssh1_Servlet
 */
@WebServlet("/xssh1_Servlet")
public class xssh1_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xssh1_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	     response.setContentType("text/html;charset=utf-8");
	     String wjid = request.getParameter("wjid");
	     System.out.println(wjid);
	     dao dao =new dao();
	     String sy = request.getParameter("sy");
	     System.out.println(sy);
			try {
				wenjuan wj = dao.xsshhx(wjid);
				request.setAttribute("wj", wj);
				  if(sy.equals("fljs")) {
				request.getRequestDispatcher("/templete/fljs_list.jsp").forward(request, response);
				     }else {
		         request.getRequestDispatcher("/templete/xssh1.jsp").forward(request, response);
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
