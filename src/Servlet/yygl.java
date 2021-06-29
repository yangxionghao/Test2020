package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Bean.zhuce;
import Dao.dao;

/**
 * Servlet implementation class yygl
 */
@WebServlet("/yygl")
public class yygl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public yygl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    Dao.dao dao = new dao();
	    try {
			List<zhuce> list = dao.yygl();
				for(int i=0;i<list.size();i++){
				zhuce s=(zhuce) list.get(i);
				System.out.println(s.getPassword() +"  ..." + s.getUid() + ".." + s.getUsername());
				}
				Gson gson=new Gson();
				String item=gson.toJson(list);
				System.out.println(item+"###");
			    response.getWriter().write(item);
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
