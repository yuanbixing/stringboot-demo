package com.yaa;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SiteBlogApplicationTests {

	@Test
	public void contextLoads() {
		backup();
	}

	public static void backup() {
//		try {
//			Runtime rt = Runtime.getRuntime();
//			Process child = rt.exec("D:/mysql/mysql-5.7.16-winx64/bin/mysqldump -uroot -p123456 blog");
//			InputStream in = child.getInputStream();
//			InputStreamReader xx = new InputStreamReader(in, "utf8");
//			String inStr;
//			StringBuffer sb = new StringBuffer("");
//			String outStr;
//			BufferedReader br = new BufferedReader(xx);
//			while ((inStr = br.readLine()) != null) {
//				sb.append(inStr + "\r\n");
//			}
//			outStr = sb.toString();
//
//			FileOutputStream fout = new FileOutputStream("E:/qq.sql");
//			OutputStreamWriter writer = new OutputStreamWriter(fout, "utf8");
//			writer.write(outStr);
//			writer.flush();
//
//			in.close();
//			xx.close();
//			br.close();
//			writer.close();
//			fout.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}


}
