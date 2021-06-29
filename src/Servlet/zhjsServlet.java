package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.wenjuan;
import Dao.dao;

/**
 * Servlet implementation class zhjsServlet
 */
@WebServlet("/zhjsServlet")
public class zhjsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public zhjsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	     response.setContentType("text/html;charset=utf-8");
	     java.util.Map<String, String[]> parameterMap = request.getParameterMap(); 
			List<Object>m=new ArrayList<>();
			List<Object>n=new ArrayList<>();
			String a="";
			for(Entry<String, String[]> entry:parameterMap.entrySet()){
				if(!(a=entry.getKey()).equals("method"))
				{System.out.println(entry.getKey() + "$$$");
				m.add(a);
				
				}
				
				for(String str:entry.getValue()){
					if(!str.equals("list2"))
					{System.out.println(str +"###");
					n.add(str);
					
					}
				}
				System.out.println("---------------------------");
			}
			System.out.println(m + "***");
			
			String b="binglie";
			
			for(int i=0;i<m.size();i++)
			{
				if(new String((String) m.toArray()[i]).contains("xuanze"))
				{
					b=(String) n.toArray()[i];
				}
			}
			dao dao = new dao();
			try {
				List<wenjuan> list=dao.zhjs(m,n,b);
				request.setAttribute("list",list);
            	if(list.equals("")||list.equals(null)) {
            		response.getWriter().write("<script>alert('查询结果条数为0！');window.location.href='"+request.getContextPath()+"/templete/tongji.jsp'</script>");
				 }else {
				  request.getRequestDispatcher("templete/tongji.jsp").forward(request, response);
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
