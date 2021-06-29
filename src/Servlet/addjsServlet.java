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
 * Servlet implementation class addjsServlet
 */
@WebServlet("/addjsServlet")
public class addjsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addjsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	     response.setContentType("text/html;charset=utf-8");
	     String jsmc = request.getParameter("jsmc");
	     String power = request.getParameter("power");
	     if(power==null) {
	    	 power = "1";
	     }
	     String bmsh_qx = request.getParameter("bmsh_qx");
	     if(bmsh_qx==null) {
	    	 bmsh_qx = "1";
	     }
	     String tjcx_qx = request.getParameter("tjcx_qx");
	     if(tjcx_qx==null) {
	    	 tjcx_qx = "1";
	     }
	     String wlsh_qx = request.getParameter("wlsh_qx");
	     if(wlsh_qx==null) {
	    	 wlsh_qx = "1";
	     }
	     String yhxg_qx = request.getParameter("yhxg_qx");
	     if(yhxg_qx==null) {
	    	 yhxg_qx = "1";
	     }
	     String xqzj_qx = request.getParameter("xqzj_qx");
	     if(xqzj_qx==null) {
	    	 xqzj_qx = "1";
	     }
	     String yhxx_qx = request.getParameter("yhxx_qx");
	     if(yhxx_qx==null) {
	    	 yhxx_qx = "1";
	     }
	     String xqgl_qx = request.getParameter("xqgl_qx");
	     if(xqgl_qx==null) {
	    	 xqgl_qx = "1";
	     }
	     String xssh_qx = request.getParameter("xssh_qx");
	     if(xssh_qx==null) {
	    	 xssh_qx = "1";
	     }
         dao dao = new dao();
          try {
			int f = dao.addjs(jsmc,power,bmsh_qx,tjcx_qx,wlsh_qx,yhxg_qx,xqzj_qx,yhxx_qx,xqgl_qx,xssh_qx);
			if(f!=0) {
				response.getWriter().write("<script>alert('角色添加成功！');window.location.href='"+request.getContextPath()+"/templete/addjs.jsp'</script>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
