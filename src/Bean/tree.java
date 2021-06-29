package Bean;

public class tree {
private int id;
private String name;
private int pid;

public tree() {
	super();
}
public tree(int id, String name, int pid) {
	super();
	this.id = id;
	this.name = name;
	this.pid = pid;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
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
public tree(int id, String name) {
	super();
	this.id = id;
	this.name = name;
}

}
