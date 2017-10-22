package model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//租房合约
@Entity
@Table(name="t_Gonggao")
public class Gonggao {
	

	@Id
	@GeneratedValue
	private int id;//主键
	
	
    private String biaoti;//租房合约标题
	
    @Column(name="content", columnDefinition="TEXT")
	private String content;//租房合约内容
    
	private String fujian;//文件

	private String fujianYuanshiming;//文件名
	
	private Date createtime;//添加时间

	private int deletestatus;//删除状态  0表示未删除 1表示已删除
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	public String getBiaoti() {
		return biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
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

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public String getFujianYuanshiming() {
		return fujianYuanshiming;
	}

	public void setFujianYuanshiming(String fujianYuanshiming) {
		this.fujianYuanshiming = fujianYuanshiming;
	}
	

	
}
