package Dao;

import java.awt.List;
import java.util.ArrayList;
import java.util.Random;

public class jiangti {
	public static void main(String[] args) {
		int[] intRandom = new int[6];
		ArrayList mylist = new ArrayList(); //生成数据集，用来保存随即生成数，并用于判断
		Random rd = new Random();
		while(mylist.size() < 6) {
		int num = rd.nextInt(36);
		if(!mylist.contains(num)&&!mylist.contains(0)) {
			mylist.add(num); //往集合里面添加数据。
			}
		}

		for(int i = 0;i <mylist.size();i++) {
		intRandom[i] = (Integer)(mylist.get(i));
		System.out.println("第"+(i+1)+"位勇士是"+intRandom[i]);
		}
		}
	}

