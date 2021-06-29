package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.login;
import Dao.dao;

/**
 * Servlet implementation class dengluServlet
 */
@WebServlet("/dengluServlet")
public class dengluServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dengluServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     request.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8");
     HttpSession session = request.getSession(true);
     String rand =(String)session.getAttribute("rand");
     String srand = request.getParameter("randcode");
     if(!rand.equals(srand)) {
			response.getWriter().write("<script>alert('验证码错误！');window.location.href='"+request.getContextPath()+"/login.html'</script>");
     }else {
     String user = request.getParameter("user");
     String password = request.getParameter("pwd");
	 login lg = new login(user,password);
	 session.setAttribute("lg", lg);
	 try {
		lg = dao.login(user,password);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 System.out.println(lg);
	  if(lg!=null) {
		  response.getWriter().write("<script>window.location.href='"+request.getContextPath()+"/main.html'</script>");
	  }else {
		  response.getWriter().write("<script>alert('用户名或密码错误！');window.location.href='"+request.getContextPath()+"/login.html'</script>");
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
