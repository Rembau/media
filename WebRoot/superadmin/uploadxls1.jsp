<%@ page contentType="text/html;charset=gb2312" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<jsp:useBean id="beanexcel" scope="session" class="javabean.ExcelHandle" />
<%
SmartUpload mySmartUpload =new SmartUpload();
long file_size_max=40000000;
String fileName2="",ext="",testvar="";
String url="superadmin/upload/"; //Ӧ��֤�ڸ�Ŀ¼���д�Ŀ¼�Ĵ��ڣ�Ҳ����˵��Ҫ�Լ�������Ӧ���ļ��У�
//��ʼ��
mySmartUpload.initialize(pageContext);
//ֻ�������ش����ļ�
try {
mySmartUpload.setAllowedFilesList("xls");//�˴����ļ���ʽ���Ը�����Ҫ�Լ��޸�
//�����ļ� 
mySmartUpload.upload();
} catch (Exception e){
%>
<SCRIPT language=javascript>
alert("ֻ�����ϴ�excel(xls��ʽ)���ļ�");
window.location='daorucourse.jsp';
</script>
<%
}
try{ 
com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
if (myFile.isMissing()){%>
<SCRIPT language=javascript>
alert("ֻ�����ϴ�excel(xls��ʽ)���ļ�");
window.location='daoruteacher.jsp';
</script>
<%}
else{
//String myFileName=myFile.getFileName(); //ȡ�����ص��ļ����ļ���
ext= myFile.getFileExt(); //ȡ�ú�׺��
int file_size=myFile.getSize(); //ȡ���ļ��Ĵ�С 
String saveurl="";
if(file_size<file_size_max){
//�����ļ�����ȡ�õ�ǰ�ϴ�ʱ��ĺ�����ֵ
Calendar calendar = Calendar.getInstance();
//String filename = String.valueOf(calendar.getTimeInMillis()); 
saveurl=application.getRealPath("/")+url;
saveurl+="��ʱ��."+ext; //����·��
myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);
String saveurl1=saveurl.replaceAll("\\\\","/");
System.out.print(saveurl1+"ok");

beanexcel.path=saveurl1;
out.print(beanexcel.excel1());

/*
String ret = "parent.HtmlEdit.focus();";
ret += "var range = parent.HtmlEdit.document.selection.createRange();" ;
ret += "range.pasteHTML('<img src=\"" + request.getContextPath() + "/upload/" + filename + "." + ext + "\">');" ;
ret += "alert('�ϴ��ɹ���');";
ret += "window.location='upload.htm';";
out.print("<script language=javascript>" + ret + "</script>");
*/
}
}
}catch (Exception e){ 
e.printStackTrace();
out.print(e.toString()); 
}
%> 