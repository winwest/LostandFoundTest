package UserBean;

public class allBean {
	
	//丢失物品BEAN
	private String lost_name,lost_place,lost_time,lname,lphone,lost_trait;
	//拾取物品BEAN
	private String pick_name,pick_place,pick_time,pname,pphone,pick_trait;
	//用户Bean
	private String Name,Password,Phone;
	private int userID;
	
	private int lost_num,pick_num;
	
	public allBean(){
		
	}
	
	//生成get和set
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	
	
	public String getPick_name() {
		return pick_name;
	}
	public void setPick_name(String pick_name) {
		this.pick_name = pick_name;
	}
	public String getPick_place() {
		return pick_place;
	}
	public void setPick_place(String pick_place) {
		this.pick_place = pick_place;
	}
	public String getPick_time() {
		return pick_time;
	}
	public void setPick_time(String pick_time) {
		this.pick_time = pick_time;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPphone() {
		return pphone;
	}
	public void setPphone(String pphone) {
		this.pphone = pphone;
	}
	public String getPick_trait() {
		return pick_trait;
	}
	public void setPick_trait(String pick_trait) {
		this.pick_trait = pick_trait;
	}
	public int getPick_num() {
		return pick_num;
	}
	public void setPick_num(int pick_num) {
		this.pick_num = pick_num;
	}
	
	
	
	public String getLost_name() {
		return lost_name;
	}
	public void setLost_name(String lost_name) {
		this.lost_name = lost_name;
	}
	public String getLost_place() {
		return lost_place;
	}
	public void setLost_place(String lost_place) {
		this.lost_place = lost_place;
	}
	public String getLost_time() {
		return lost_time;
	}
	public void setLost_time(String lost_time) {
		this.lost_time = lost_time;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLphone() {
		return lphone;
	}
	public void setLphone(String lphone) {
		this.lphone = lphone;
	}
	public String getLost_trait() {
		return lost_trait;
	}
	public void setLost_trait(String lost_trait) {
		this.lost_trait = lost_trait;
	}
	public int getLost_num() {
		return lost_num;
	}
	public void setLost_num(int lost_num) {
		this.lost_num = lost_num;
	}
}
