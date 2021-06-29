package Bean;

public class tableValue {
 private String type;
 private int count;
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public tableValue(String type, int count) {
	super();
	this.type = type;
	this.count = count;
}
public tableValue() {
	super();
}
 
}
