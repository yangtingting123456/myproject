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
import model.Gonggao;
import model.Lease;
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
import dao.ProductDao;
import dao.UserDao;

public class IndexAction extends ActionSupport {
 
	private static final long serialVersionUID = 1L;

	private String url = "./";
	private FeedbackDao feedbackDao;
	private DianpingDao dianpingDao;
	private LeaseDao leaseDao;

	public DianpingDao getDianpingDao() {
		return dianpingDao;
	}

	public void setDianpingDao(DianpingDao dianpingDao) {
		this.dianpingDao = dianpingDao;
	}

	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}


	public FeedbackDao getFeedbackDao() {
		return feedbackDao;
	}
	public void setFeedbackDao(FeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}
	
	public LeaseDao getLeaseDao() {
		return leaseDao;
	}

	public void setLeaseDao(LeaseDao leaseDao) {
		this.leaseDao = leaseDao;
	}

	//首页
	public  String  index(){

		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String fenlei = request.getParameter("fenlei");
		
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(name !=null &&!"".equals(name)){
			sb.append(" name like '%"+name+"%' ");
			sb.append(" and ");
			request.setAttribute("name", name);
		}
		if(address !=null &&!"".equals(address)){
			sb.append(" address like '%"+address+"%' ");
			sb.append(" and ");
			request.setAttribute("address", address);
		}
		if(fenlei !=null &&!"".equals(fenlei)){
			sb.append(" fenlei.id= "+fenlei+" ");
			sb.append(" and ");
			request.setAttribute("fenlei", fenlei);
		}
		
		if(beginTime !=null &&!"".equals(beginTime)){
			sb.append(" jiage >= "+beginTime+" ");
			sb.append(" and ");
			request.setAttribute("beginTime", beginTime);
		}
		if(endTime !=null &&!"".equals(endTime)){
			sb.append(" jiage <= "+endTime+" ");
			sb.append(" and ");
			request.setAttribute("endTime", endTime);
		}
		
		sb.append(" deletestatus=0 and stauts='审核通过' and czstauts='未租' order by createtime desc  ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 6;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Product> list1 = productDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("productlist1", list1);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!index", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where deletestatus=0"));
		this.setUrl("index.jsp");
		return SUCCESS;
	
	}
	/**
	 * 将userDao注入到IndexAction当中
	 */
	
	
	
   
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	// 用户注册操作
	public void register() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String qq = request.getParameter("qq");
		String truename = request.getParameter("truename");
		Integer role = Integer.parseInt(request.getParameter("role"));

		User bean = userDao.selectBean("  where deletestatus=0 and username='"
				+ username + "'");

		if (bean == null) {
			bean = new User();
			bean.setAddress(address);
			bean.setCreatetime(new Date());
			bean.setEmail(email);
			bean.setPassword(password);
			bean.setPhone(phone);
			bean.setQq(qq);
			bean.setTruename(truename);
			bean.setUsername(username);
			bean.setRole(role);
			userDao.insertBean(bean);
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("注册成功");
		} else {
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("用户名已经存在，注册失败！");
		}

	}
	
	// 用户登录操作
	public void login() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Integer role = Integer.parseInt(request.getParameter("role"));
		User bean = userDao.selectBean("  where deletestatus=0 and username='"
				+ username + "' and password='" + password + "'  and role= "+role);
		if (bean != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", bean);
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer
					.print("<script  language='javascript'>alert('登录成功！');window.location.href='index'; </script>");
		} else {
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer
					.print("<script  language='javascript'>alert('用户名或者密码或者角色错误！登录失败');window.location.href='index'; </script>");
		}

	}

	// 用户退出操作
	public void loginout() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer
				.print("<script  language='javascript'>alert('退出成功！');window.location.href='index'; </script>");

	}
	
	
	//个人信息
	public String useradd() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest(); 
		//HttpSession session = request.getSession();
		//User bean = (User) session.getAttribute("bean");
		String id = request.getParameter("id");
		User bean =userDao.selectBean(" where id= "+id);
		
		request.setAttribute("bean", bean);
		this.setUrl("useradd.jsp");
		return SUCCESS;
	}
	
	
	
	
	
	
	/**
	 * 将fenleiDao注入到MangeAction当中
	 */
	private FenleiDao fenleiDao;

	public FenleiDao getFenleiDao() {
		return fenleiDao;
	}

	public void setFenleiDao(FenleiDao fenleiDao) {
		this.fenleiDao = fenleiDao;
	}
	
	/**
	 * 将productDao注入到MangeAction当中
	 */
	private ProductDao productDao;
    
	
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

	
	//房屋信息列表(屋主的房屋信息)
	public String productlist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");	
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
		sb.append(" deletestatus=0 and user="+user.getId()+" order by createtime desc ");

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
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!productlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("productlist.jsp");
		return SUCCESS;
	}
	
	
	//跳转到添加房屋页面(屋主)
	public String productadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where deletestatus=0"));
		this.setUrl("productadd.jsp");
		return SUCCESS;
	}
	
	
	//添加房屋操作(屋主)
	public void productadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");	
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String fenlei = request.getParameter("fenlei");
		String maoshu = request.getParameter("maoshu");
		String address = request.getParameter("address");
	

		//上传房屋图片
		String savapath = "C:/temp/";
		String time = Util.getTime2();
		String imgpath = time+".jpg";
		File file = new File(savapath+imgpath);
		Util.copyFile(uploadfile, file);
		
		Product bean = new Product();
		bean.setFenlei(fenleiDao.selectBean(" where id= "+fenlei));
		bean.setUser(user);
		bean.setImgpath(imgpath);
		bean.setJiage(Double.parseDouble(jiage));
		bean.setName(name);
		bean.setAddress(address);
		bean.setMaoshu(maoshu);
		bean.setStauts("待审核");
		bean.setCzstauts("未租");
		bean.setCreatetime(new Date());
		productDao.insertBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='indexmethod!productlist'; </script>");
		
	}
	
	
	
	//删除房屋操作(屋主)
	public void productdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		productDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='indexmethod!productlist'; </script>");
		
	}
	
	//跳转到更新房屋页面
	public String productupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where deletestatus=0"));
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("productupdate.jsp");
		return SUCCESS;
	}
	
	
	//更新房屋操作(屋主修改房屋信息)
	public void productupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String fenlei = request.getParameter("fenlei");
		String maoshu = request.getParameter("maoshu");
		String address = request.getParameter("address");

		Product bean =productDao.selectBean(" where id= "+id);
		bean.setFenlei(fenleiDao.selectBean(" where id= "+fenlei));
		bean.setJiage(Double.parseDouble(jiage));
		bean.setName(name);
		bean.setAddress(address);
		bean.setMaoshu(maoshu);
		productDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='indexmethod!productlist'; </script>");
		
	}


	//跳转到查看房屋页面
	public String productupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "查看房屋信息");
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		productDao.updateBean(bean);
		request.setAttribute("bean", bean);
		List<Dianping> dianpinlist = dianpingDao.selectBeanList(0, 99, " where product="+bean.getId()+" and deletestatus=0 ");
		request.setAttribute("dianpinlist", dianpinlist);
		this.setUrl("productupdate3.jsp");
		return SUCCESS;
	}
	

	
	private GonggaoDao gonggaoDao;



	public GonggaoDao getGonggaoDao() {
		return gonggaoDao;
	}

	public void setGonggaoDao(GonggaoDao gonggaoDao) {
		this.gonggaoDao = gonggaoDao;
	}
	
	//跳转到查看公告页面
	public String gonggaoupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "查看公告信息");
		String id = request.getParameter("id");
		Gonggao bean =gonggaoDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("gonggaoupdate3.jsp");
		return SUCCESS;
	}
	
	
	
	
	//添加留言信息操作
	public void feedbackadd() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer
					.print("<script  language='javascript'>alert('请先登录');window.location.href='indexmethod!feedbacklist'; </script>");
			return  ;
		}
		String mywords = request.getParameter("mywords");
	    user=userDao.selectBean("where id="+user.getId()+" ");
		Feedback bean = new Feedback();
		bean.setMywords(mywords);	
		bean.setCreateDate(new Date());
		bean.setUser(user);
		feedbackDao.insertBean(bean);	
		response.setCharacterEncoding("gbk");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('发送成功');window.location.href='indexmethod!feedbacklist'; </script>");
		
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
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!indexfeedbacklist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("message.jsp");
		return SUCCESS;
	}
	
	//跳转到更新用户页面
	public String userupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");	
		User bean =userDao.selectBean(" where id= "+user.getId());
		request.setAttribute("bean", bean);
		this.setUrl("userupdate.jsp");
		return SUCCESS;
	}
	
	
	//更新用户操作
	public void userupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String qq = request.getParameter("qq");
		String truename = request.getParameter("truename");
		String id = request.getParameter("id");
		User bean =userDao.selectBean(" where id= "+id);
		bean.setAddress(address);
		bean.setCreatetime(new Date());
		bean.setEmail(email);
		bean.setPassword(password);
		bean.setPhone(phone);
		bean.setQq(qq);
		bean.setTruename(truename);
		bean.setUsername(username);
		bean.setCreatetime(new Date());
		userDao.insertBean(bean);
        response.setCharacterEncoding("gbk");
		response.getWriter().write("个人信息修改成功");
	}
	
	
	

	//跳转到查看房屋页面
	public String productupdate4(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "查看房屋信息");
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		List<Dianping> dianpinlist = dianpingDao.selectBeanList(0, 99, " where product="+bean.getId()+"  and deletestatus=0  order by createtime desc");
		request.setAttribute("dianpinlist", dianpinlist);
		this.setUrl("productupdate4.jsp");
		return SUCCESS;
	}
	
	//添加点评操作
	public void dianpingadd() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		String id = request.getParameter("id");
		Product p =productDao.selectBean(" where id= "+id);
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Dianping bean = new Dianping();
		bean.setUser(user);
		bean.setContent(content);
		bean.setProduct(p);
		bean.setCreatetime(new Date());
		dianpingDao.insertBean(bean);
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='indexmethod!productupdate4?id="+p.getId()+"'; </script>");
		
	}
	
	
	// 添加租赁操作(用户)
	public void  leaseadd() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
	
		Integer times = Integer.parseInt(request.getParameter("times"));
		Product product = productDao.selectBean(" where id= "+request.getParameter("id"));
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('请先登录');window.location.href='indexmethod!productupdate3?id="+product.getId()+"'; </script>");
			return  ;
		}

		Lease bean = new Lease();
		bean.setCreatetime(new Date());
		bean.setProduct(product);
		bean.setUser(user);
		bean.setTimes(times);
		bean.setPrice(bean.getTimes()*product.getJiage());
		leaseDao.insertBean(bean);
		product.setCzstauts("已租");
		productDao.updateBean(product);
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('添加成功');window.location.href='indexmethod!productupdate3?id="+product.getId()+"'; </script>");
		
		
		
		
		
	}
	

	
	//我的房屋租赁列表（用户）
	public String leaselist() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
	
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		sb.append(" user.id="+user.getId()+" and product.deletestatus=0 and deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = leaseDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Lease> list = leaseDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!leaselist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("leaselist.jsp");
		return SUCCESS;
	}
	
	
}
