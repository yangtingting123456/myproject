package model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

//房屋信息
@Entity
@Table(name="t_Product")
public class Product {
	

	@Id
	@GeneratedValue
	private int id;//主键
	
	private String name;//房屋类别（3室1厅，2室1厅，单身公寓，单间）
	
	private String address;//房屋地址
	
	private double jiage;//月租费（元/月）
	
	private String imgpath;//房屋图片
	
	@Column(name="maoshu", columnDefinition="TEXT")
	private String maoshu;//房屋介绍  
	
	@ManyToOne
	@JoinColumn(name="fenleiid")
	private Fenlei fenlei;// 关联所在城市

	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;// 关联房东
	
	private String stauts;//审核状态
	
	private String czstauts;//出租状态（未租，已租）
	
	private Date createtime;//发布时间

	private int deletestatus;//删除状态 0表示未删除 1表示删除
	
	
	//不映射到数据库属性
	@Transient
	private String beginTime;//初始值
	@Transient
	private String endTime;//结尾值

	public String getMaoshu() {
		return maoshu;
	}

	public void setMaoshu(String maoshu) {
		this.maoshu = maoshu;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Fenlei getFenlei() {
		return fenlei;
	}

	public void setFenlei(Fenlei fenlei) {
		this.fenlei = fenlei;
	}

	public double getJiage() {
		return jiage;
	}

	public void setJiage(double jiage) {
		this.jiage = jiage;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getStauts() {
		return stauts;
	}

	public void setStauts(String stauts) {
		this.stauts = stauts;
	}

	public String getCzstauts() {
		return czstauts;
	}

	public void setCzstauts(String czstauts) {
		this.czstauts = czstauts;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	

	


	
}
