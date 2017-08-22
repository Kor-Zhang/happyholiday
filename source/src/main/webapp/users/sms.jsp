<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <%
            	String PostData = "userid=&account=scs00947&password=scs00947&mobile=18874489675&sendTime=&content="+java.net.URLEncoder.encode("您的验证码是99090@(幸福假日)【畅卓科技】","utf-8");
                                                                                    //out.println(PostData);
                                                                                    String ret = st.util.st.util.Send.SMS(PostData, "http://sms.chanzor.com:8001/sms.aspx?action=send");
                                                                                    out.println(ret);
                                                                                    //请自己反序列化返回的字符串并实现自己的逻辑
            %>

        </h1>
    </body>
</html>
