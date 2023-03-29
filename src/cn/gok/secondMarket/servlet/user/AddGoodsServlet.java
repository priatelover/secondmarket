package cn.gok.secondMarket.servlet.user;

import cn.gok.secondMarket.dao.Imp.GoodsDaoImp;
import cn.gok.secondMarket.utils.DBUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet(name = "AddGoodsServlet", value = "/AddGoodsServlet")
public class AddGoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        String userId = request.getParameter("userId");
        upload.setFileSizeMax(1024 * 1024 * 5);
        List<FileItem> items = null;
        String newImageName="";
        Map<String,String> map=new HashMap<String,String>();
        try {
            //items 是表单所有的input类型的元素
            items = upload.parseRequest(request);
            //需要多items判断是否是文件类型
            for (FileItem fileItem : items) {
                //isFormField:
                //true:代表普通input标签
                //false：代表文件的input标签

                if (!fileItem.isFormField()) {
                    //进入文件上传的工作
                    //获取原始名称
                    String filename = fileItem.getName();
                    System.out.println(filename);
                    //获取文件后缀
                    String imgSuffix = filename.substring(filename.lastIndexOf(".") + 1);
                    String imgSuffixs = "png,jpg,jpeg,jfif";
                    //判断文件后缀
                    if (!imgSuffixs.contains(imgSuffix)) {
                        return;
                    }
                    //重命名
                    newImageName = UUID.randomUUID().toString() + "." + imgSuffix;
                    //设置文件保存路径
                    String path = request.getServletContext().getRealPath("/") + "images";
                    //创建文件夹
                    File file = new File(path);
                    if (!file.exists()) {
                        file.mkdir();
                    }
                    //保存文件
                    fileItem.write(new File(path + File.separator + newImageName));
                } else {
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    System.out.println(name+"------------------>"+value);
                    value = new String(value.getBytes("ISO-8859-1"),"utf-8");
                    System.out.println(name+"------------------>"+value);
                    map.put(name,value);
                }
            }
            StringBuilder goodsNum= new StringBuilder("");
            for (int i = 0; i < 6; i++) {
                goodsNum.append(Math.ceil(Math.random() * 10));
            }
            GoodsDaoImp goodsDaoImp = new GoodsDaoImp();
            goodsDaoImp.addNewGoods(goodsNum.toString(),map.get("goodsName"),newImageName, map.get("type"), map.get("price"),userId );

        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            response.sendRedirect("IndexServlet");
        }
    }
}
