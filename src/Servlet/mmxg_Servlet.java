package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.login;
import Dao.dao;

/**
 * Servlet implementation class mmxg_Servlet
 */
@WebServlet("/mmxg_Servlet")
public class mmxg_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mmxg_Servlet() {
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
	     String ysmm = request.getParameter("ysmm");
	     String xmm = request.getParameter("xmm");
	     dao dao =new dao();
	     System.out.println(ysmm);
	     try {
			int f = dao.xgmm(lg,xmm,ysmm);
			if(f!=0) {
				response.getWriter().write("<script>alert('修改成功！');window.location.href='"+request.getContextPath()+"/yonghu/mmxg.jsp'</script>");
			}else {
				response.getWriter().write("<script>alert('修改失败！');window.location.href='"+request.getContextPath()+"/yonghu/mmxg.jsp'</script>");
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
