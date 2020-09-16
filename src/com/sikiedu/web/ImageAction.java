package com.sikiedu.web;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;


/**
 * @author Administrator
 * @date 2020/9/12 0012 10:11:34
 * @description
 */
public class ImageAction  extends ActionSupport {

    private String base64;

    public String getImage() throws Exception{
       //TODO Auto-generated method stub
       System.out.println("我已经到达这里!!");
       System.out.println(base64);
       //将base64的数据放置到文件中保存起来
       //获得一个路径来去存放我们的文件(数据）
       //得到request
        HttpServletRequest request = ServletActionContext.getRequest();
        String dir = request.getRealPath("/upload");
        //如果没有这个路径，我们自己创建
        File fileLocation = new File(dir);
        if(!fileLocation.exists())
        {
           boolean created = fileLocation.mkdir();
           if(!created)
           {  //失败了，一般不会出现这种结果
              return null;
           }
        }
        //增加软件的通用性
        //到达这里，就说明有了这个文件
        //如果在base64中找到了jpeg这个字符串
        if(base64.indexOf("jpeg")!=-1)
        {
           base64 = base64.replaceFirst("jpeg","jpg");
            //将jpeg改为jpg
          //  System.out.println(base64);
        }
        //给这个文件来一个名字(substring()是前闭后开)
        String upName = UUID.randomUUID().toString() + System.currentTimeMillis() +"."+base64.substring(11,14);
        System.out.println("名字:"+upName);

        //给这个文件数据
        //获取有用数据
        String iconbase64 = base64.substring(22);
        //io
        //将base64格式改为字节数组
        byte[] buffer = new BASE64Decoder().decodeBuffer(iconbase64);
        FileOutputStream out = new FileOutputStream(dir+"/"+upName);
        System.out.println("路径:"+dir);
        //字节数组数据写入文件中
        out.write(buffer);
        //关闭out
        out.close();
        return null;
    }

    public String getBase64() {
        return base64;
    }

    public void setBase64(String base64) {
        this.base64 = base64;
    }
}
