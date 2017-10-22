package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//留言
@Entity
@Table(name = "t_Feedback")
public class Feedback implements Serializable {

	private static final long serialVersionUID = -117947798302585032L;

	private int id;//主键
	
	 @Column(name="mywords", columnDefinition="TEXT")
     private String mywords;//内容
	
	private Date createDate;
	
	private User user;
	
	private int feedbacklock;//删除状态
	
	
	
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMywords() {
		return mywords;
	}

	public void setMywords(String mywords) {
		this.mywords = mywords;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@ManyToOne
	@JoinColumn(name="userid")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getFeedbacklock() {
		return feedbacklock;
	}

	public void setFeedbacklock(int feedbacklock) {
		this.feedbacklock = feedbacklock;
	}
	
	
}
