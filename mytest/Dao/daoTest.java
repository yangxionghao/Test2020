package Dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.tableValue;
import Bean.wenjuan;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class daoTest {

	@BeforeEach
	void setUp() throws Exception {
	}

	@Test
	void test() throws SQLException {
		dao d = new dao();
        //测试添加角色
//		int rows = d.addjs("软件测试","0","1","1","1","1","1","1","1","1");
//		System.out.println(rows);
		
		//综合查询
//		List<Object>m=new ArrayList<>();
//        m.add("type1");
//        m.add("cipin");
//        m.add("search1"); 
//		List<Object>n=new ArrayList<>();
//		n.add("gkglbm");
//		n.add("mohu");
//		n.add("2");
//		String b="binglie";
//		List<wenjuan> list=d.zhjs(m,n,b);
//		System.out.println(list);
		
		//条件检索
//		List<wenjuan> m =new ArrayList<>();
//		 m = d.bmfljs("gkglbm","2"); 
//		 System.out.println(m);
		
		//图表显示
//		List<wenjuan> m =new ArrayList<>();
//		 m = d.mhfljs("gkglbm","2"); 
//		 System.out.println(m);
		
		List<tableValue> tv = new ArrayList<>();
	     tv = d.tbvalue("gkglbm", "2", "jgsx");
		System.out.println(tv);
	}

}
