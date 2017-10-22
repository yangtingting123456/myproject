package action;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Dianping;
import model.Feedback;
import model.Fenlei;
import model.Gonggao;
import model.Lease;
import model.Manage;
import model.Product;
import model.User;

import org.apache.struts2.ServletActionContext;

import util.Pager;
import util.Util;


import com.opensymphony.xwork2.ActionSupport;

import dao.DianpingDao;
import dao.FeedbackDao;
import dao.FenleiDao;
import dao.GonggaoDao;
import dao.LeaseDao;
import dao.ManageDao;
import dao.ProductDao;
import dao.UserDao;


public class ManageAction extends ActionSupport{

	
	private static final long serialVersionUID = 1L;
	
	
	private String url="./";
	
	private GonggaoDao gonggaoDao;
	private FeedbackDao feedbackDao;
	private DianpingDao dianpingDao;
	private LeaseDao leaseDao;

	public DianpingDao getDianpingDao() {
		return dianpingDao;
	}

	public void setDianpingDao(DianpingDao dianpingDao) {
		this.dianpingDao = dianpingDao;
	}

	public LeaseDao getLeaseDao() {
		return leaseDao;
	}

	public void setLeaseDao(LeaseDao leaseDao) {
		this.leaseDao = leaseDao;
	}

	
	
	public GonggaoDao getGonggaoDao() {
		return gonggaoDao;
	}

	public void setGonggaoDao(GonggaoDao gonggaoDao) {
		this.gonggaoDao = gonggaoDao;
	}
	
	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}
	
	private ManageDao manageDao;


	public ManageDao getManageDao() {
		return manageDao;
	}


	public void setManageDao(ManageDao manageDao) {
		this.manageDao = manageDao;
	}
	
	public FeedbackDao getFeedbackDao() {
		return feedbackDao;
	}
	public void setFeedbackDao(FeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}
	//管理员后台登陆
	public void login() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Manage bean = manageDao.selectBean(" where username='"+username+"' and password ='"+password+"' ");
		if(bean!=null){
			HttpSession session = request.getSession();
			session.setAttribute("manage", bean);
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('登陆成功');window.location.href='index.jsp'; </script>");
		}else{
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('用户名或者密码错误');window.location.href='login.jsp'; </script>");
		}
		
		
	}
	
	//用户退出操作
	public void loginout() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("manage");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('退出成功');window.location.href='login.jsp'; </script>");
	}
	
	
	public String changepwd(){
		this.setUrl("user/password.jsp");
		return SUCCESS;
		
	}
	
	
	//修改密码
	public void changepwd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		HttpSession session = request.getSession();
		Manage user = (Manage)session.getAttribute("manage");
		
		Manage bean = manageDao.selectBean(" where username='"+user.getUsername()+"' and password ='"+password1+"' ");
		if(bean!=null){
			bean.setPassword(password2);
			manageDao.updateBean(bean);
			
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('操作成功');</script>");
		}else{
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('原密码错误');window.location.href='method!changepwd'; </script>");
		}
		
		
	}
	
	//将FenleiDao注入到ManageAction中
	private FenleiDao fenleiDao;


	public FenleiDao getFenleiDao() {
		return fenleiDao;
	}


	public void setFenleiDao(FenleiDao fenleiDao) {
		this.fenleiDao = fenleiDao;
	}
	
	
	//所在城市信息列表
	public String fenleilist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(name !=null &&!"".equals(name)){
			sb.append(" name like '%"+name+"%' ");
			sb.append(" and ");

			request.setAttribute("name", name);
		}
		
		sb.append(" deletestatus=0 order by id desc ");

		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = fenleiDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Fenlei> list = fenleiDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!fenleilist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!fenleilist");
		request.setAttribute("url2", "method!fenlei");
		request.setAttribute("title", "所在城市信息管理");
		this.setUrl("fenlei/fenleilist.jsp");
		return SUCCESS;
	}
	
	
	//跳转到添加所在城市页面
	public String fenleiadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!fenleiadd2");
		request.setAttribute("title", "添加所在城市信息");
		this.setUrl("fenlei/fenleiadd.jsp");
		return SUCCESS;
	}
	
	
	//添加所在城市操作
	public void fenleiadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		Fenlei bean = new Fenlei();
		bean.setName(name);
		fenleiDao.insertBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!fenleilist'; </script>");
		
	}
	
	
	
	//删除所在城市操作
	public void fenleidelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Fenlei bean =fenleiDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		fenleiDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!fenleilist'; </script>");
		
	}
	
	//跳转到更新所在城市页面
	public String fenleiupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!fenleiupdate2");
		request.setAttribute("title", "修改所在城市信息");
		String id = request.getParameter("id");
		Fenlei bean =fenleiDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("fenlei/fenleiupdate.jsp");
		return SUCCESS;
	}
	
	
	//更新所在城市操作
	public void fenleiupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		Fenlei bean =fenleiDao.selectBean(" where id= "+id);
		bean.setName(name);
		fenleiDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!fenleilist'; </script>");
		
	}
	
	//跳转到查看所在城市页面
	public String fenleiupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();

		request.setAttribute("title", "查看所在城市信息");
		String id = request.getParameter("id");
		Fenlei bean =fenleiDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("fenlei/fenleiupdate3.jsp");
		return SUCCESS;
	}
	

	private ProductDao  productDao;


	public ProductDao getProductDao() {
		return productDao;
	}


	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	 private File uploadfile;
		
		
	 public File getUploadfile() {
			return uploadfile;
		}

		
	 public void setUploadfile(File uploadfile) {
			this.uploadfile = uploadfile;
		}
	
	
	//房屋信息列表
	public String productlist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		String fenlei = request.getParameter("fenlei");
		String stauts = request.getParameter("stauts");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(name !=null &&!"".equals(name)){
			sb.append(" name like '%"+name+"%' ");
			sb.append(" and ");

			request.setAttribute("name", name);
		}
		if(fenlei !=null &&!"".equals(fenlei)){
			sb.append(" fenlei.id like '%"+fenlei+"%' ");
			sb.append(" and ");

			request.setAttribute("fenlei", fenlei);
		}
		if(stauts !=null &&!"".equals(stauts)){
			sb.append(" stauts like '%"+stauts+"%' ");
			sb.append(" and ");

			request.setAttribute("stauts", stauts);
		}
		sb.append(" deletestatus=0 order by createtime desc ");

		String where = sb.toString();

		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Product> list = productDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 99, " where deletestatus=0 "));
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!productlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!productlist");
		request.setAttribute("url2", "method!product");
		request.setAttribute("title", "房屋信息管理");
		this.setUrl("product/productlist.jsp");
		return SUCCESS;
	}
	
	
	//跳转到添加房屋页面
	public String productadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!productadd2");
		request.setAttribute("url2", "method!product");
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where deletestatus=0"));
		request.setAttribute("userlist", userDao.selectBeanList(0, 9999, " where deletestatus=0 and role=2 "));
		request.setAttribute("title", "添加房屋信息");
		this.setUrl("product/productadd.jsp");
		return SUCCESS;
	}
	
	
	//添加房屋操作
	public void productadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String fenlei = request.getParameter("fenlei");
		String maoshu = request.getParameter("maoshu");
		String address = request.getParameter("address");
		String user = request.getParameter("user");

		//上传房屋图片
		String savapath = "C:/temp/";
		String time = Util.getTime2();
		String imgpath = time+".jpg";
		File file = new File(savapath+imgpath);
		Util.copyFile(uploadfile, file);
		
		Product bean = new Product();
		bean.setFenlei(fenleiDao.selectBean(" where id= "+fenlei));
		bean.setUser(userDao.selectBean(" where id= "+user));
		bean.setImgpath(imgpath);
		bean.setJiage(Double.parseDouble(jiage));
		bean.setName(name);
		bean.setAddress(address);
		bean.setMaoshu(maoshu);
		bean.setStauts("审核通过");
		bean.setCzstauts("未租");
		bean.setCreatetime(new Date());
		productDao.insertBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	
	
	
	//删除房屋操作
	public void productdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		productDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	
	//跳转到更新房屋页面
	public String productupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where deletestatus=0"));
		request.setAttribute("title", "修改房屋信息");
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		request.setAttribute("userlist", userDao.selectBeanList(0, 9999, " where deletestatus=0 and role=2 "));
		request.setAttribute("url", "method!productupdate2");
		this.setUrl("product/productupdate.jsp");
		return SUCCESS;
	}
	
	
	//更新房屋操作
	public void productupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String fenlei = request.getParameter("fenlei");
		String maoshu = request.getParameter("maoshu");
		String address = request.getParameter("address");
		String user = request.getParameter("user");
		
		

		Product bean =productDao.selectBean(" where id= "+id);
		bean.setFenlei(fenleiDao.selectBean(" where id= "+fenlei));
		bean.setUser(userDao.selectBean(" where id= "+user));
		
		bean.setJiage(Double.parseDouble(jiage));
		bean.setName(name);
		bean.setAddress(address);
		bean.setMaoshu(maoshu);
		productDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	
	//跳转到查看房屋页面
	public String productupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "查看房屋信息");
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("product/productupdate3.jsp");
		return SUCCESS;
	}
	
	//跳转到审核页面
	public String productupdate4(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "审核");
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("product/productupdate4.jsp");
		return SUCCESS;
	}
	
	//审核操作
	public void productupdate5() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		String stauts = request.getParameter("stauts");
		Product bean =productDao.selectBean(" where id= "+id);
		bean.setStauts(stauts);
		productDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}

	//用户列表
	public String userlist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String role = request.getParameter("role");
		String username = request.getParameter("username");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(username !=null &&!"".equals(username)){
			sb.append(" username like '%"+username+"%' ");
			sb.append(" and ");
			request.setAttribute("username", username);
		}
		if(role !=null &&!"".equals(role)){
			sb.append(" role like '%"+role+"%' ");
			sb.append(" and ");
			request.setAttribute("role", role);
		}
		sb.append(" deletestatus=0 order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = userDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<User> list = userDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!userlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!userlist");
		request.setAttribute("url2", "method!user");
		request.setAttribute("title", "用户管理");
		this.setUrl("user/userlist.jsp");
		return SUCCESS;
	}
	
	
	
	private UserDao userDao;


	public UserDao getUserDao() {
		return userDao;
	}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	
	//用户删除操作
	public void userdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		User bean =userDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		userDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!userlist'; </script>");
		
	}
	
	
	
	
	
	
	
	//租房合约列表
	public String gonggaolist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String biaoti = request.getParameter("biaoti");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(biaoti !=null &&!"".equals(biaoti)){
			sb.append(" biaoti like '%"+biaoti+"%' ");
			sb.append(" and ");

			request.setAttribute("biaoti", biaoti);
		}
		
		sb.append(" deletestatus=0 order by id desc ");

		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = gonggaoDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Gonggao> list = gonggaoDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!gonggaolist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!gonggaolist");
		request.setAttribute("url2", "method!gonggao");
		request.setAttribute("title", "租房合约管理");
		this.setUrl("gonggao/gonggaolist.jsp");
		return SUCCESS;
	}
	
	
	//跳转到添加租房合约页面
	public String gonggaoadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!gonggaoadd2");
		request.setAttribute("title", "添加租房合约");
		this.setUrl("gonggao/gonggaoadd.jsp");
		return SUCCESS;
	}
	
	
	//添加租房合约操作
	public void gonggaoadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String biaoti = request.getParameter("biaoti");
		String content = request.getParameter("content");
		String fujian = request.getParameter("fujian");
		String fujianYuanshiming = request.getParameter("fujianYuanshiming");
		Gonggao bean = new Gonggao();
		bean.setBiaoti(biaoti);
		bean.setContent(content);
		bean.setFujian(fujian);
		bean.setFujianYuanshiming(fujianYuanshiming);
		bean.setCreatetime(new Date());
		gonggaoDao.insertBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!gonggaolist'; </script>");
		
	}
	
	
	
	//删除租房合约操作
	public void gonggaodelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Gonggao bean =gonggaoDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		gonggaoDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!gonggaolist'; </script>");
		
	}
	
	//跳转到更新租房合约页面
	public String gonggaoupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!gonggaoupdate2");
		request.setAttribute("title", "修改租房合约");
		String id = request.getParameter("id");
		Gonggao bean =gonggaoDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("gonggao/gonggaoupdate.jsp");
		return SUCCESS;
	}
	
	
	//更新租房合约操作
	public void gonggaoupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String biaoti = request.getParameter("biaoti");
		String content = request.getParameter("content");
		String fujian = request.getParameter("fujian");
		String fujianYuanshiming = request.getParameter("fujianYuanshiming");
		String id = request.getParameter("id");
		Gonggao bean =gonggaoDao.selectBean(" where id= "+id);
		bean.setBiaoti(biaoti);
		bean.setContent(content);
		bean.setFujian(fujian);
		bean.setFujianYuanshiming(fujianYuanshiming);
		gonggaoDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!gonggaolist'; </script>");
		
	}
	
	//跳转到查看租房合约页面
	public String gonggaoupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "查看租房合约");
		String id = request.getParameter("id");
		Gonggao bean =gonggaoDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("gonggao/gonggaoupdate3.jsp");
		return SUCCESS;
	}
	
	//留言显示列表
	public String feedbacklist2(){
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		int currentpage = 1;
		int pagesize = 15;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		sb.append(" feedbacklock=0 order by id desc ");

		String where = sb.toString();
	//	String where =" feedbacklock=0 ";
		long total =  feedbackDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Feedback> list =  feedbackDao.selectBeanList((currentpage - 1) * pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!feedbacklist2", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("feedback/message2.jsp");
		return SUCCESS;
	}
	
	
	//删除留言操作
	public void feedbackdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Feedback bean =feedbackDao.selectBean(" where id= "+id);
		feedbackDao.deleteBean(bean);
		response.setCharacterEncoding("utf8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!feedbacklist2'; </script>");
		
	}
	
	//添加留言信息操作
	public void feedbackadd() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
     
		String mywords = request.getParameter("mywords");
	   // HttpSession session = request.getSession();
	    //User user = (User)session.getAttribute("user");	
	   // user=userDao.selectBean("where id="+user.getId()+" ");
		Feedback bean = new Feedback();
		bean.setMywords(mywords);	
		bean.setCreateDate(new Date());
	//	bean.setUser(user);
		feedbackDao.insertBean(bean);	
		response.setCharacterEncoding("utf8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('发送成功');window.location.href='method!feedbacklist'; </script>");
		
	}
	
	//留言显示列表
	public String feedbacklist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		int currentpage = 1;
		int pagesize = 15;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		sb.append(" feedbacklock=0 order by id desc ");
		String where = sb.toString();
		long total =  feedbackDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Feedback> list =  feedbackDao.selectBeanList((currentpage - 1) * pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!feedbacklist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("feedback/message.jsp");
		return SUCCESS;
	}
	
	

	
	
	/********************评价*********************/
	//评价列表
	public String dianpinglist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String biaoti = request.getParameter("biaoti");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(biaoti !=null &&!"".equals(biaoti)){
			sb.append(" biaoti like '%"+biaoti+"%' ");
			sb.append(" and ");
			request.setAttribute("biaoti", biaoti);
		}
		sb.append(" deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = dianpingDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Dianping> list = dianpingDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!dianpinglist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!dianpinglist");
		request.setAttribute("url2", "method!dianping");
		request.setAttribute("title", "评价管理");
		this.setUrl("dianping/dianpinglist.jsp");
		return SUCCESS;
	}
	
	
	
	
	//删除评价操作
	public void dianpingdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Dianping bean =dianpingDao.selectBean(" where id= "+id);
	
		bean.setDeletestatus(1);
		dianpingDao.updateBean(bean);
		
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('删除成功');window.location.href='method!dianpinglist'; </script>");
		
	}
	
	
	//房屋租赁列表
	public String leaselist() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		String fenlei = request.getParameter("fenlei");
		String truename = request.getParameter("truename");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(name !=null &&!"".equals(name)){
			sb.append(" product.name like '%"+name+"%' ");
			sb.append(" and ");

			request.setAttribute("name", name);
		}
		if(fenlei !=null &&!"".equals(fenlei)){
			sb.append(" product.fenlei.id like '%"+fenlei+"%' ");
			sb.append(" and ");

			request.setAttribute("fenlei", fenlei);
		}
		if(truename !=null &&!"".equals(truename)){
			sb.append(" user.truename like '%"+truename+"%' ");
			sb.append(" and ");

			request.setAttribute("truename", truename);
		}
		sb.append(" product.deletestatus=0 and deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = leaseDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Lease> list = leaseDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 99, " where deletestatus=0 "));
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!leaselist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("lease/leaselist.jsp");
		return SUCCESS;
	}
	
	//删除房屋租赁操作
	public void leasedelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Lease bean =leaseDao.selectBean(" where id= "+id);
	
		bean.setDeletestatus(1);
		leaseDao.updateBean(bean);
		Product product =productDao.selectBean(" where id= "+bean.getProduct().getId());
		product.setCzstauts("未租");
		productDao.updateBean(product);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('删除成功');window.location.href='method!leaselist'; </script>");
		
	}
	
	
}
