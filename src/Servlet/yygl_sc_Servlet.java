package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.dao;

/**
 * Servlet implementation class yygl_sc_Servlet
 */
@WebServlet("/yygl_sc_Servlet")
public class yygl_sc_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public yygl_sc_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进来了 ！！！！！！！！");
	    request.setCharacterEncoding("utf-8");
	     response.setContentType("text/html;charset=utf-8");
	     int id = Integer.parseInt(request.getParameter("uid"));
         dao dao = new dao();
         try {
			int rows = dao.deleteyh(id);
			if(rows!=0) {
				response.getWriter().write("<script>alert('删除成功');window.location.href='"+request.getContextPath()+"/templete/yygl.jsp'</script>");
			}
			response.getWriter().write("<script>alert('删除失败');window.location.href='"+request.getContextPath()+"/templete/yygl.jsp'</script>");
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
