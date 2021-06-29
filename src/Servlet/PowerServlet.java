package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Bean.Power;
import Bean.login;
import Dao.dao;

/**
 * Servlet implementation class PowerServlet
 */
@WebServlet("/PowerServlet")
public class PowerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PowerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.setCharacterEncoding("utf-8");
				login lg=(login)request.getSession().getAttribute("lg");
				System.out.println(lg.getUsername());
				dao dao = new dao();
				try {
					Power power = new Power();
					 power = dao.power(lg);
					System.out.println(power.getBmsh_qx()+"^^^^^");
					Gson gson=new Gson();
					String item=gson.toJson(power);
					System.out.println(item+"###");
						response.getWriter().write("["+item+"]");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
//				String sql="select * from power where username='"+lg.getUsername()+"'";
//				Connection conn = DBUtil.getConn();
//				Statement state = null;
//				ResultSet rs = null;
//				Power p=null;
//				try {
//					state = conn.createStatement();
//					rs = state.executeQuery(sql);
//					//要用statement类的executeQuery()方法来下达select指令以查询数据库，
//					//executeQuery()方法会把数据库响应的查询结果存放在ResultSet类对象中供我们使用。
//
//					while (rs.next()) {
//						int i1=rs.getInt("xqzj_qx");
//						int i2=rs.getInt("xqgl_qx");
//						int i3=rs.getInt("yhxx_qx");
//						int i4=rs.getInt("yhxg_qx");
//						int i5=rs.getInt("xssh_qx");
//						int i7=rs.getInt("bmsh_qx");
//						int i8=rs.getInt("bmsh_qx");
//						int i9=rs.getInt("power");
//						
//						p=new Power(i1,i2,i3,i4,i5,i7,i8,i9,user.getUsername());
//						 
//						
//					}
//				}
//				catch (SQLException e) {
//					e.printStackTrace();
//				} finally {
//					DBUtil.close(rs, state, conn);
//				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
