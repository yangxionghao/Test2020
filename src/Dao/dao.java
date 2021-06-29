package Dao;


import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import DataSourceUtils.DataSourceUtils;
import Bean.Power;
import Bean.login;
import Bean.tableValue;
import Bean.tree;
import Bean.wenjuan;
import Bean.zhuce;;

public class dao {

	public static login login(String user,String pass) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from zhuce where username=? and password=?";
		login rows = runner.query(sql, new BeanHandler<Bean.login>(Bean.login.class),user,pass);
	    return rows;
	}

	public int zhuce(zhuce zhuc) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into zhuce(js,username,password,rname,sex,sf,gzdw,zyfx,szhy,jycd,zc,txdz,yzbm,sj,gddh,yx,qq,msn) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int rows = 0;
		rows = runner.update(sql,zhuc.getJs(),zhuc.getUsername(),zhuc.getPassword(),zhuc.getRname(),zhuc.getSex(),zhuc.getSf(),zhuc.getGzdw(),zhuc.getZyfx(),zhuc.getSzhy(),zhuc.getJycd(),zhuc.getZc(),zhuc.getTxdz(),zhuc.getYzbm(),zhuc.getSj(),zhuc.getGddh(),zhuc.getYx(),zhuc.getQq(),zhuc.getMsn());
		return rows;
	}

	public int addwj(wenjuan wj ,String stxr) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into wj(wjid,shyj,sfsh,stxr,jgmc,gkglbm,txdz,szdy,dwwz,dzyx,frdb,yzbm,lxr,gddh,yddh,cz,jgsx,jgjj,jsxqmc,qsxqnf,jzxqnf,jxqgs,gjz1,gjz2,gjz3,gjz4,gjz5,ntrzjze,jsxqjjfs,hzyxdw,kjhdlx,xkfl,xqjsssly,xqjsyyhy) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int rows = 0;
		rows = runner.update(sql,0,"无","未审核",stxr,wj.getJgmc(),wj.getGkglbm(),wj.getTxdz(),wj.getSzdy(),wj.getDwwz(),wj.getDzyx(),wj.getFrdb(),wj.getYzbm(),wj.getLxr(),wj.getGddh(),wj.getYddh(),wj.getCz(),wj.getJgsx(),wj.getJgjj(),wj.getJsxqmc(),wj.getQsxqnf(),wj.getJzxqnf(),wj.getJxqgs(),wj.getGjz1(),wj.getGjz2(),wj.getGjz3(),wj.getGjz4(),wj.getGjz5(),wj.getNtrzjze(),wj.getJsxqjjfs(),wj.getHzyxdw(),wj.getKjhdlx(),wj.getXkfl(),wj.getXqjsssly(),wj.getXqjsyyhy());
		return rows;
	}
	public Power power(Bean.login lg) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql1 = "select js from zhuce where username = ?";
	    String js  = (String) runner.query(sql1, new ScalarHandler(), lg.getUsername());
	    System.out.println(js +".............");
		String sql="select * from power where jsid=?";
		int jsid = Integer.parseInt(js);
		Power rows = runner.query(sql, new BeanHandler<Power>(Power.class),jsid);
	    return rows;
	}

	public List<tree> tree() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from sheet1";
		List<tree> rows = runner.query(sql, new BeanListHandler<Bean.tree>(Bean.tree.class));
	    return rows;
	}

	public Power js(String jsid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from power where jsid = ?";
		Power rows = runner.query(sql, new BeanHandler<Bean.Power>(Bean.Power.class),jsid);
	    return rows;
	}

	public int addjs(String jsmc, String power, String bmsh_qx, String tjcx_qx, String wlsh_qx, String yhxg_qx,
			String xqzj_qx, String yhxx_qx,String xqgl_qx,String xssh_qx) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into power(jsmc,power,bmsh_qx,tjcx_qx,wlsh_qx,yhxg_qx,xqzj_qx,yhxx_qx,xqgl_qx,xssh_qx) values(?,?,?,?,?,?,?,?,?,?)";
		int rows = 0;
		rows = runner.update(sql,jsmc,power,bmsh_qx,tjcx_qx,wlsh_qx,yhxg_qx,xqzj_qx,yhxx_qx,xqgl_qx,xssh_qx);
		return rows;
	}

	public List<Bean.zhuce> yygl() throws SQLException {
		System.out.println("jinrudaoceng");
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from zhuce";
		List<Bean.zhuce> list = runner.query(sql, new BeanListHandler<Bean.zhuce>(Bean.zhuce.class));
		for(int i=0;i<list.size();i++){
		zhuce s=(zhuce) list.get(i);
		System.out.println(s.getPassword() +"  ..." + s.getUid() + ".." + s.getUsername());

		}
		return list;
	}

	public int deleteyh(int id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from zhuce where uid=?";
		int rows = runner.update(sql, id);
		return rows;
	}

	public Bean.zhuce selectfromuid(int id) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from zhuce where uid = ?";
		zhuce rows = null;
		try {
			rows = runner.query(sql, new BeanHandler<Bean.zhuce>(Bean.zhuce.class),id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return rows;
	}

	public int yygl_xgtj(Bean.zhuce zhuc,int id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update zhuce set username=?,password=?,rname=?,sex=?,sf=?,gzdw=?,zyfx=?,szhy=?,jycd=?,zc=?,txdz=?,yzbm=?,sj=?,gddh=?,yx=?,qq=?,msn=? where uid=?";
		int rows = runner.update(sql,zhuc.getUsername(),zhuc.getPassword(),zhuc.getRname(),zhuc.getSex(),zhuc.getSf(),zhuc.getGzdw(),zhuc.getZyfx(),zhuc.getSzhy(),zhuc.getJycd(),zhuc.getZc(),zhuc.getTxdz(),zhuc.getYzbm(),zhuc.getSj(),zhuc.getGddh(),zhuc.getYx(),zhuc.getQq(),zhuc.getMsn(),id);
		return rows;
	}

	public int qxgl(int id, String js) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update zhuce set js=? where uid=?";
		int rows = runner.update(sql,js,id);
		return rows;
	}

	public List<Bean.wenjuan> mywj(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from wj where stxr =?";
		List<Bean.wenjuan> list = runner.query(sql, new BeanListHandler<Bean.wenjuan>(Bean.wenjuan.class),username);
		return list;
	}

	public List<Bean.wenjuan> xssh() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from wj where sfsh =?";
		List<Bean.wenjuan> list = runner.query(sql, new BeanListHandler<Bean.wenjuan>(Bean.wenjuan.class),"未审核");
		return list;
	}

	public wenjuan xsshhx(String wjid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from wj where wjid =?";
		wenjuan wj = runner.query(sql, new BeanHandler<Bean.wenjuan>(Bean.wenjuan.class),wjid);
		return wj;
	}

	public List<wenjuan> bmsh() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from wj where sfsh =?";
		List<Bean.wenjuan> list = runner.query(sql, new BeanListHandler<Bean.wenjuan>(Bean.wenjuan.class),"通过形式审核");
		return list;
	}

	public wenjuan bmshhx(String wjid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from wj where wjid =?";
		wenjuan wj = runner.query(sql, new BeanHandler<Bean.wenjuan>(Bean.wenjuan.class),wjid);
		return wj;
	}

	public List<Bean.wenjuan> mhfljs(String jstj, String value) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from wj where "+jstj+" like ?";
		System.out.println(sql);
		List<Bean.wenjuan> list = runner.query(sql,new BeanListHandler<Bean.wenjuan>(Bean.wenjuan.class),"%"+value+"%");
		return list;
	}

	public List<wenjuan> bmfljs(String jstj, String value) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from wj where "+jstj+" =?";
		List<Bean.wenjuan> list = runner.query(sql, new BeanListHandler<Bean.wenjuan>(Bean.wenjuan.class),value);
		return list;
	}

	public List<wenjuan> zhjs(List<Object> m, List<Object> n, String b) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from wj where 1 = 1 ";
		StringBuilder c=new StringBuilder(sql);
		if(b.equals("binglie"))
		{
			String d=" = ";
		for(int i=0;i<m.size();i++)
		{
			if(new String((String) m.toArray()[i]).contains("type"))
			{
			c.append("and "+n.toArray()[i]);
			}
			
			if(new String((String) m.toArray()[i]).contains("cipin"))
					{
			if(new String((String) n.toArray()[i]).contains("jingque"))
			{	d=" = ";
				c.append(d);	
			}
			else
			{
				d=" like ";
				c.append(d);
			}
			
					
					}
			if(new String((String) m.toArray()[i]).contains("search"))
			{
				if(d.equals(" like "))
				{
					c.append("'%"+n.toArray()[i]+"%' ");
				}
			
				else {
					c.append(" '"+n.toArray()[i]+"' ");

				}
			
			}
		}}
		else if(b.equals("huozhe"))
		{c.append(" and ");
		String d=" = ";
			for(int i=0;i<m.size();i++)
		{
				if(new String((String) m.toArray()[i]).contains("type"))
				{	c.append(n.toArray()[i]);}
				
				
				if(new String((String) m.toArray()[i]).contains("cipin"))
						{
				if(new String((String) n.toArray()[i]).contains("jingque"))
				{	d=" = ";
					c.append(d);	
				}
				else
				{
					d=" like ";
					c.append(d);
				}
				
						
						}
			
			
				
			
			if(new String((String) m.toArray()[i]).contains("search"))
			{
				if(d.equals(" like "))
				{
					c.append("'%"+n.toArray()[i]+"%' ");

				}
				else
				{
									c.append("'"+n.toArray()[i]+"' ");

				}
			}

			if(new String((String) m.toArray()[i]).contains("xuanze"))	
	{
				if(new String((String) n.toArray()[i]).contains("binglie"))
				{System.out.println(i);
		c.append(" and ");}
	else
		{
		c.append(" or ");}
		}

		}
			
		}
		sql=c.toString();
		System.out.println(sql);
		List<Bean.wenjuan> list = runner.query(sql,new BeanListHandler<Bean.wenjuan>(Bean.wenjuan.class));
		return list;
	}

	public List<tableValue> tbvalue(String jstj, String value, String tjzd) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		System.out.println(value + "...");
		String sql="select "+tjzd+" as type,count("+tjzd+") as count from wj where "+jstj+" like ? GROUP BY "+tjzd+"";
		System.out.println(sql);
		List<Bean.tableValue> list = runner.query(sql, new BeanListHandler<Bean.tableValue>(Bean.tableValue.class),"%"+value+"%");
		System.out.println(list.get(0).getType() + ":" + list.get(0).getCount());
		return list;
	}

	public List<tableValue> jqtbvalue(String jstj, String value, String tjzd) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		System.out.println(value + "...");
		String sql="select "+tjzd+" as type,count("+tjzd+") as count from wj where "+jstj+" = ? GROUP BY "+tjzd+"";
		System.out.println(sql);
		List<Bean.tableValue> list = runner.query(sql, new BeanListHandler<Bean.tableValue>(Bean.tableValue.class),value);
		System.out.println(list.get(0).getType() + ":" + list.get(0).getCount());
		return list;
	}

	public int xgmm(Bean.login lg, String xmm,String ysmm) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update zhuce set password=? where username=? and password=?";
		int rows = runner.update(sql,xmm,lg.getUsername(),ysmm);
		return rows;
	}

	
	
//	public static JavaBean.login login(String id, String pass) throws SQLException {
//		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
//	String sql = "insert into zhuce values(?,?,?)";
//		String sql = "select * from zhuce where jgID=? and pass=?";
//		JavaBean.login login = runner.query(sql, new BeanHandler<JavaBean.login>(JavaBean.login.class), id,pass);
//	rows = runner.update(sql,login.getId(),login.getPass(),login.getType());
//		System.out.println(login.getType());
//		return login;
//	}
	
	
}
