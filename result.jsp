<%@ page language="java"
contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <body>
        <h2>Saved All Records</h2>
       <table border="1">
        <tr>
            <th>ID</th>
            <th>GroupNo</th>
            <th>Member1</th>
            <th>Member2</th>
            <th>Guide</th>
        </tr>
       <%
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/miniproject", "root", "Admin@123");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM group_allot");
    while(rs.next()){
        %>
        <tr>
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getInt("group_no")%></td>
            <td><%=rs.getString("member1")%></td>
            <td><%=rs.getString("member2")%></td>
            <td><%=rs.getString("guide")%></td>
        </tr>
        <%
        }
        rs.close();
        st.close();
        con.close();
    }catch(Exception e){
        System.out.println("Error:"+e.getMessage());
    }
    %>
    </body>
</html>