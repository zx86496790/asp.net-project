<%-- 
    Document   : addBook
    Created on : 2014-3-28, 23:55:06
    Author     : zsen
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="beans.BookInfo"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BOOK ROOM RESULT</title>
        <link rel="stylesheet" href="dist/css/bootstrap.min.css">
    </head>
    <body>
        <% 
                ArrayList<BookInfo> alBookInfo=new ArrayList<BookInfo>();
                ArrayList<Room> alRoom=new ArrayList<Room>();
                String name = "zhnx0249";
		String password = "oracle";
		String url = "jdbc:oracle:thin:@dilbert.humber.ca:1521:grok";
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
			Connection connection = DriverManager.getConnection(url, name,password);
			if (connection != null) {
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery("SELECT * FROM JAVA_PROJECT_BOOKINFO");
				while (rs.next()) {
                                        BookInfo bi=new BookInfo(String.valueOf(rs.getInt(1)), String.valueOf(rs.getInt(2)), String.valueOf(rs.getInt(3)), rs.getDate(4).toString(), rs.getDate(5).toString());
					alBookInfo.add(bi);
                                }
                                rs=statement.executeQuery("SELECT * FROM JAVA_PROJECT_ROOM");
				while (rs.next()) {
                                        Room r=new Room(String.valueOf(rs.getInt(1)), String.valueOf(rs.getInt(2)), rs.getDouble(3), rs.getString(4));
                                        
					alRoom.add(r);
                                }
			}
                        connection.close();
                        boolean flag=false;
                        for(Room r:alRoom)
                        {
                            if(request.getParameter("roomID").equalsIgnoreCase(r.getRoomId()))
                            {
                                flag=true;
                            }
                        }
		%>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
        <%
            String roomID=request.getParameter("roomID");
            String details=request.getParameter("details");
            String bookStartDate=request.getParameter("startDate");
            String bookEndDate=request.getParameter("endDate");
            if(roomID.equalsIgnoreCase(""))
            {
                %>
                <div class="thumbnail">
                    <img src="dist/pics/error.gif" alt="...">
                    <div class="caption">
                        <h3>NO ROOM NUMBER</h3>
                        <p>YOU MUST INPUT A VALID ROOM NUMBER</p>
                        <p><a href="book.jsp" class="btn btn-primary btn-lg btn-block" role="button">GO BACK</a> </p>
                    </div>
                </div>
        <%
            }else if(flag==false)
            {
                        %>
               <div class="thumbnail">
                    <img src="dist/pics/error.gif" alt="...">
                    <div class="caption">
                        <h3>ROOM NUMBER ERROR</h3>
                        <p>THE ROOM YOU WANT TO ADD ALREADY EXISTS</p>
                        <p><a href="book.jsp" class="btn btn-primary btn-lg btn-block" role="button">GO BACK</a> </p>
                    </div>
                </div>
                        <%
            }else if(bookStartDate.equalsIgnoreCase("")||bookEndDate.equalsIgnoreCase(""))
            {
                        %>
               <div class="thumbnail">
                    <img src="dist/pics/error.gif" alt="...">
                    <div class="caption">
                        <h3>DATE IS MISSING</h3>
                        <p>START DATE OR END DATE IS MISSING</p>
                        <p><a href="book.jsp" class="btn btn-primary btn-lg btn-block" role="button">GO BACK</a> </p>
                    </div>
                </div>
                        <%
            }
            else 
            {   
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
                                       Date bookDateStart=null;
                                       Date bookDateEnd=null;
                                       bookDateStart=sdf.parse(bookStartDate);
                                       bookDateEnd=sdf.parse(bookEndDate);
                if(bookDateEnd.compareTo(bookDateStart)<=0){
                %>
                <div class="thumbnail">
                    <img src="dist/pics/error.gif" alt="...">
                    <div class="caption">
                        <h3>DATE WRONG</h3>
                        <p>END DATE MUST BE GREATER THAN START DATE</p>
                        <p><a href="book.jsp" class="btn btn-primary btn-lg btn-block" role="button">GO BACK</a> </p>
                    </div>
                </div>
                <%}
                else
                {boolean bb=false;
                    for(BookInfo bi:alBookInfo)
                    {
                         Date bookInfoStartDate=sdf.parse(bi.getStartDate());
                         Date bookInfoEndDate=sdf.parse(bi.getEndDate());
                         if((roomID.equalsIgnoreCase(bi.getRoomId()))){
                         if((bookDateStart.compareTo(bookInfoStartDate)>=0&&bookDateStart.compareTo(bookInfoEndDate)<=0)||(bookDateEnd.compareTo(bookInfoStartDate)>=0&&bookDateEnd.compareTo(bookInfoEndDate)<=0)||(bookDateStart.compareTo(bookInfoStartDate)>=0&&bookDateEnd.compareTo(bookInfoEndDate)<=0)||(bookDateStart.compareTo(bookInfoStartDate)<=0&&bookDateEnd.compareTo(bookInfoEndDate)>=0))
                         {
                              %>
                                <div class="thumbnail">
                                    <img src="dist/pics/error.gif" alt="...">
                                    <div class="caption">
                                    <h3>DATE HAS BEEN BOOKED</h3>
                                    <p>DURING THE PERIOD THE ROOM HAS BEEN BOOKED</p>
                                    <p><a href="book.jsp" class="btn btn-primary btn-lg btn-block" role="button">GO BACK</a> </p>
                                    </div>
                                </div>
                <%}
                         else
                         {
                             int maxID=0;
                             for(BookInfo bi1:alBookInfo)
                             {
                                 int temp=Integer.parseInt(bi1.getId());
                                 if(temp>=maxID)
                                 {
                                     maxID=temp;
                                 }
                             }
                             ArrayList<Integer> ar=new ArrayList<Integer>();
                             connection = DriverManager.getConnection(url, name,password);
                            if (connection != null) {
		            Statement st = connection.createStatement();
                               PreparedStatement pstmt=null;
                               ResultSet rs=st.executeQuery("select bookId from JAVA_PROJECT_BOOKINFO");
                               while(rs.next()){
                                   int m=rs.getInt(1);
                                  if(ar.isEmpty()){
                                       ar.add(m);
                                  }else{
                                       for(int i=0;i<(ar.size());i++){
                                           if(m<ar.get(0)){ar.add(0, m);}
                                          else if(m>ar.get((ar.size()-1))){ar.add((ar.size()),m);}
                                  else if((m>ar.get(i-1))&&(m<ar.get(i))){ar.add((i), m);}
                                    
                              }
                                    }                     
                             }
                              boolean b=false;int lNumber=1;
                             for(int i=0;i<ar.size();i++){
                                lNumber=ar.get(i);
                                   if((1<ar.get(0))){lNumber=1;b=true;break;}
                                   else if(ar.get(ar.size()-1)==(ar.size())){lNumber=ar.size();b=true;break;}
                                  else {lNumber++;if(((i+1)<ar.size())&&((lNumber<ar.get(i+1)))){b=true;break;}}
                                    
                              }
                               

			        pstmt = connection.prepareStatement("insert into JAVA_PROJECT_BOOKINFO values (?,?,?,?,?,?)");
                               pstmt.setInt(1, lNumber);
                            
                              pstmt.setInt(2, Integer.parseInt(roomID));
                              pstmt.setInt(3, Integer.parseInt(session.getAttribute("id").toString()));
                               java.sql.Date ds=null;
                               // ds=java.sql.Date.valueOf(bookStartDate);
                               ds=new java.sql.Date((sdf.parse(request.getParameter("startDate"))).getTime());
                             java.sql.Date de=null;
                               //de=java.sql.Date.valueOf(bookEndDate);
                              de=new java.sql.Date((sdf.parse(request.getParameter("endDate"))).getTime());
                              pstmt.setDate(4, ds);
                             pstmt.setDate(5, de);
                              pstmt.setString(6, request.getParameter("details"));
                              pstmt.execute();
                              bb=true;
                                 %>
                        <div class="thumbnail">
                                <img src="dist/pics/done.jpg" alt="...">
                                <div class="caption">
                                    <h3>DONE</h3>
                                    <p>YOU HAVE ADDED THE RECORD</p>
                                    <p><a href="book.jsp" class="btn btn-primary btn-lg btn-block" role="button">GO BACK</a> </p>
                                </div>
                            </div>
                        <%
			}
                             
                         }
                         }                                  
                         }
                    if(!bb){
                        
                                 ArrayList<Integer> ar=new ArrayList<Integer>();
                                 connection.close();
                             connection = DriverManager.getConnection(url, name,password);
                            if (connection != null) {
		            Statement st = connection.createStatement();
                               PreparedStatement pstmt=null;
                               ResultSet rs=st.executeQuery("select bookId from JAVA_PROJECT_BOOKINFO");
                               while(rs.next()){
                                   int m=rs.getInt(1);
                                  if(ar.isEmpty()){
                                       ar.add(m);
                                  }else{
                                       for(int i=0;i<(ar.size());i++){
                                           if(m<ar.get(0)){ar.add(0, m);}
                                          else if(m>ar.get((ar.size()-1))){ar.add((ar.size()),m);}
                                  else if((m>ar.get(i-1))&&(m<ar.get(i))){ar.add((i), m);}
                                    
                              }
                                    }                     
                             }
                              boolean b=false;int lNumber=1;
                             for(int i=0;i<ar.size();i++){
                                lNumber=ar.get(i);
                                   if((1<ar.get(0))){lNumber=1;b=true;break;}
                                   else if(ar.get(ar.size()-1)==(ar.size())){lNumber=ar.size();b=true;break;}
                                  else {lNumber++;if(((i+1)<ar.size())&&((lNumber<ar.get(i+1)))){b=true;break;}}
                                    
                              }
                               

			        pstmt = connection.prepareStatement("insert into JAVA_PROJECT_BOOKINFO values (?,?,?,?,?,?)");
                               pstmt.setInt(1, lNumber);
                            
                              pstmt.setInt(2, Integer.parseInt(roomID));
                              pstmt.setInt(3, Integer.parseInt(session.getAttribute("id").toString()));
                               java.sql.Date ds=null;
                               // ds=java.sql.Date.valueOf(bookStartDate);
                               ds=new java.sql.Date((sdf.parse(request.getParameter("startDate"))).getTime());
                             java.sql.Date de=null;
                               //de=java.sql.Date.valueOf(bookEndDate);
                              de=new java.sql.Date((sdf.parse(request.getParameter("endDate"))).getTime());
                              pstmt.setDate(4, ds);
                             pstmt.setDate(5, de);
                              pstmt.setString(6, request.getParameter("details"));
                              pstmt.execute();
                                   %>
                        <div class="thumbnail">
                                <img src="dist/pics/done.jpg" alt="...">
                                <div class="caption">
                                    <h3>DONE</h3>
                                    <p>YOU HAVE ADDED THE RECORD</p>
                                    <p><a href="book.jsp" class="btn btn-primary btn-lg btn-block" role="button">GO BACK</a> </p>
                                </div>
                            </div>
                        <%
                        }
                    }
                    
                    
                    }
                }
                
        %>

                </div>
                <div class="col-md-4">
                </div>
            </div>
        </div>
        
           <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="dist/js/jquery-1.10.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="dist/js/bootstrap.min.js"></script>
    </body>
</html>

