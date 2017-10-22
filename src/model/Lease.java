package model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//租赁
@Entity
@Table(name="t_Lease")
public class Lease {
	
	@Id
	@GeneratedValue
	private int id;//主键
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;//关联用户的id 外键
	
	@ManyToOne
	@JoinColumn(name="productid")
	private Product  product;//房屋

	private int times;//时长
	
	private double price;//合计总价

	private Date createtime;//租赁时间

	private int deletestatus;//是否删除状态 0表示未删除 1表示删除  
	
	
	
	
	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	


	
}
