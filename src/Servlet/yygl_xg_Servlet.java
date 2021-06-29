package Servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.zhuce;
import Dao.dao;

/**
 * Servlet implementation class yygl_xg_Servlet
 */
@WebServlet("/yygl_xg_Servlet")
public class yygl_xg_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public yygl_xg_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	     response.setContentType("text/html;charset=utf-8");
	     int id = Integer.parseInt(request.getParameter("uid"));
	     ServletContext context = this.getServletContext();
         context.setAttribute("uid", id);
         dao dao = new dao();
         zhuce zc = dao.selectfromuid(id);
         request.setAttribute("zhuce", zc);
         request.getRequestDispatcher("/templete/yygl_xg.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
