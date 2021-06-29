package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.zhuce;
import Dao.dao;

/**
 * Servlet implementation class yygl_xgqd_Servlet
 */
@WebServlet("/yygl_xgqd_Servlet")
public class yygl_xgqd_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public yygl_xgqd_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	     response.setContentType("text/html;charset=utf-8");
	     ServletContext context = this.getServletContext();
	     int id = (int) context.getAttribute("uid");
	     String name = request.getParameter("username");
	     String psw = request.getParameter("password");
	     String rname = request.getParameter("rname");
	     String  sex = request.getParameter("sex");
	     String sf = request.getParameter("province");
	     if(sf.equals("0")) {
	    	 sf = "湖南";
	     }else if(sf.equals("1")) {
	    	 sf = "湖北";
	     }else if(sf.equals("2")) {
	    	 sf = "广东";
	     }
	     String city = request.getParameter("city");
	     String rsf = sf+"省"+city+"市";
	     System.out.println(rsf);
	     String gzdw = request.getParameter("gzdw");
	     String zyfx = request.getParameter("zyfx");
	     String szhy = request.getParameter("szhy");
	     String jycd = request.getParameter("jycd");
	     String zc = request.getParameter("zc"); 
	     String txdz = request.getParameter("txdz");
	     String yzbm = request.getParameter("yzbm");
	     String sj = request.getParameter("sj");
	     String gddh = request.getParameter("gddh");
	     String yx = request.getParameter("yx");
	     String qq = request.getParameter("qq");
	     String msn = request.getParameter("msn");
	     zhuce zhuc = new zhuce(0,3,name,psw,rname,sex,rsf,gzdw,zyfx,szhy,jycd,zc,txdz,yzbm,sj,gddh,yx,qq,msn);
	     dao dao = new dao();
	     try {
			int rows = dao.yygl_xgtj(zhuc,id);
			if(rows!=0)
			response.getWriter().write("<script>alert('修改成功！');window.location.href='"+request.getContextPath()+"/templete/yygl.jsp'</script>");
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
