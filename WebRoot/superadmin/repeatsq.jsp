<%@ page language="java" import="java.util.*" pageEncoding="gb18030" import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
  <head>  
    <title>My JSP 'repeatsq.jsp' starting page</title>
    <link href="../css/main_style.css" rel="stylesheet" type="text/css">
  </head>
  <script type="text/javascript"> 
  function check1(){
     if(window.confirm('ȷ�����ȡ��ԭ����,ȷ��?')){
         return true;
     }
     return false;
  }
  function check2(){
     if(window.confirm('�������ɸ���,ȷ��?')){
         return true;
     }
     return false;
  }
  </script>
  <body>
    <%
    String sql="select * from media_clash where cl_mark='δ����'"; 
    ResultSet rs=conn.stmt.executeQuery(sql);
    Statement stmt1=conn.getStmt();
    int nowpage=1;
    int pagenum = 9;
	String currentpagestr = null;
	int allpage=1;
	int all;
	request.setCharacterEncoding("gbk");
	currentpagestr = request.getParameter("page");
	if (currentpagestr != null)
	//nowpage = Integer.valueOf(currentpagestr); 
	   nowpage=Integer.parseInt(currentpagestr);
				//if(nowpage==0)
			//out.print("<script>alert('���¼');window.location.href='landing.jsp';</script>");
	rs.last();
	all= rs.getRow();
	allpage=(all-1)/pagenum +1;
	rs.beforeFirst();
	int i=(nowpage-1)*pagenum;
	int k=i+1;
	while(i>0){
	rs.next();
	i--;}%>
	δ����   <a href="repeatsq_pass.jsp">ͨ��</a>    <a href="repeatsq_veto.jsp">δͨ��</a>
    <table width="100%" border="1" style="empty-cells:show; border-collapse:collapse;">
    <tr>
    <th>λ��</th>
    <th>����</th>
    <th>�ܴ�</th>
    <th>�ܼ�</th>
    <th>�ڴ�</th>
    <th>�����ʦ��Ϣ</th>
    <th>ԭ��ʦ��Ϣ</th>
    <th>����</th>
    </tr>
    <%
    int j=0;
    while(rs.next() && j++<pagenum) {%>
    <tr>
    <td><%=rs.getString("cl_area") %></td>
    <td>
    <%
String strjieci[]={"��һ��","�ڶ���","������","���Ľ�","�����","������","���߽�","�ڰ˽�","�ھŽ�","��ʮ��","��ʮһ��","��ʮ����"};
int introom=Integer.parseInt(rs.getString("cl_room"));
sql="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
ResultSet rs2=stmt1.executeQuery(sql);
rs2.next();
String floor2=rs2.getString(2);
%><%=floor2%>
<%=introom%1000%>
</td>
    <td><%=rs.getString("cl_week") %></td>
    <td><%=rs.getString("cl_weekday") %></td>
    <td>
    <%
    String jiecistart=rs.getString("cl_jiecistart"); 
    int alljie=Integer.parseInt(rs.getString("cl_alljie"));
    int mark=0;
    for (int ii=0;ii<12;ii++){
        if((jiecistart.equals(strjieci[ii]) || mark==1) && alljie>0){
            out.print(strjieci[ii]);
            mark=1;
            alljie--;
        }
        if(alljie==0){
           break;
        }
    }
    %>
    </td>
    <td><%=rs.getString("cl_depart")%>   <%=rs.getString("cl_num") %>    <%=rs.getString("cl_name") %></td>
    <td><%String id=rs.getString("cl_apid");
sql="select ap_num,ap_name from media_application where ap_area='"+rs.getString("cl_area")+"' and ap_room='"+rs.getString("cl_room")+"' and ap_week='"+rs.getString("cl_week")+"' and ap_weekday='"+rs.getString("cl_weekday")+"' and (ap_jieci like '%"+rs.getString("cl_jiecistart")+"%' or ap_jieci like '%"+rs.getString("cl_jieciend")+"%') and ap_state='ͨ��'";
rs2=stmt1.executeQuery(sql);
while(rs2.next()){
   out.println(rs2.getString(1)+" "+rs2.getString(2)+"<br>");
}
%>  
    </td>
    <td>
    <a href=".ClashHandle?id=<%=rs.getString("cl_id") %>&mark=ͨ��&page=<%=nowpage %>" onClick="return check1()">ͨ��</a> 
    <a href=".ClashHandle?id=<%=rs.getString("cl_id") %>&mark=���&page=<%=nowpage %>" onClick="return check2()">���</a></td>
    </tr>
    <%} %>
    </table>
    <center>
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">��<%=nowpage%>ҳ</td>
    <td align="center"><%if(nowpage>1){%>
      <a href="?page=<%=nowpage-1%>%>">��һҳ</a>
      <%}%></td>
    <td align="center"><%if(nowpage<allpage){%>
      <a href="?page=<%=nowpage+1%>">��һҳ</a>
      <%}%></td>
    <td align="center">��<%=allpage%>ҳ</td>
  </tr>
</table>
</center>
  </body>
</html>
