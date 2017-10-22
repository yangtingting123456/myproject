package model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//点评表
@Entity
@Table(name="t_Dianping")
public class Dianping {
	
	@Id
	@GeneratedValue
	private int id;//主键
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;//关联用户的id 外键
	
	@ManyToOne
	@JoinColumn(name="productid")
	private Product  product;//房屋

	
	 @Column(name="content", columnDefinition="TEXT")
	private String content;//点评内容

	private Date createtime;//点评时间

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	


	
}
