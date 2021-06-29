package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;

import DataSourceUtils.DataSourceUtils;

/**
 * Servlet implementation class xssh_bty
 */
@WebServlet("/xssh_bty")
public class xssh_bty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xssh_bty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	     response.setContentType("text/html;charset=utf-8");
	     String shyj = request.getParameter("shyj");
	     String wjid = request.getParameter("wjid");
	     QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "update wj set sfsh=?,shyj=? where wjid=?";
			try {
				int rows = runner.update(sql,"未通过形式审核",shyj,wjid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.getWriter().write("<script>alert('审核完成');window.location.href='"+request.getContextPath()+"/templete/xssh.jsp'</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
