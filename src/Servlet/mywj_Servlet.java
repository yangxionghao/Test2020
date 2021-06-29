package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.google.gson.Gson;

import Bean.login;
import Bean.wenjuan;
import Bean.zhuce;
import Dao.dao;
import DataSourceUtils.DataSourceUtils;

/**
 * Servlet implementation class mywj_Servlet
 */
@WebServlet("/mywj_Servlet")
public class mywj_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mywj_Servlet() {
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
		System.out.println(lg.getUsername()+"555555");
		List<wenjuan> list = null;
		if(lg.getUsername().equals("admin1")) {
			System.out.println("111111111111111");
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql="select * from wj ";
			 try {
				list = runner.query(sql, new BeanListHandler<Bean.wenjuan>(Bean.wenjuan.class));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
		dao dao = new dao();
		try {
			 list = dao.mywj(lg.getUsername());
			for(int i=0;i<list.size();i++){
				wenjuan s=(wenjuan) list.get(i);
				System.out.println(s.getJgmc() +"  ..." + s.getSzdy());
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		Gson gson=new Gson();
		String item=gson.toJson(list);
		System.out.println(item+"###");
	    response.getWriter().write(item);
		//************删除需求
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
