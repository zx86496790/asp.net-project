<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="book.aspx.cs" Inherits="asp.net_project.book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>BOOK</title>
    <link rel="stylesheet"  href="dist/css/bootstrap.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
                <div class="col-md-3">
                    <img src="dist/pics/icon.png" alt="..." class="img-responsive img-rounded">
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-4">
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-3">
                </div>
        </div>
        <div class="row">
            <div class="col-md-12">

                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>

            </div>
        </div>
    </form>
</body>
</html>
