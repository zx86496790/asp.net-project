<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="asp.net_project.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>INDEX</title>
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
    
        <!--beginning of content-->
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <img src="dist/pics/icon.png" alt="..." class="img-responsive img-rounded">
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-4">
                    <div class="btn-group btn-group-lg">
                        <asp:Button ID="btnSpecials" class="btn btn-primary" runat="server" Text="Specials" OnClick="btnSpecials_Click" />
                        <asp:Button ID="btnClassics" class="btn btn-primary" runat="server" Text="Classics" OnClick="btnClassics_Click" />
                        <asp:Button ID="btnOscars" class="btn btn-primary" runat="server" Text="Oscars" OnClick="btnOscars_Click" />
                    </div>
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtKeyword" class="form-control" placeholder="Input Keyword" runat="server"></asp:TextBox>
                    <asp:DropDownList class="form-control" ID="ddlCategory" runat="server">
                        <asp:ListItem>director</asp:ListItem>
                        <asp:ListItem>actor</asp:ListItem>
                        <asp:ListItem>character</asp:ListItem>
                        <asp:ListItem>title</asp:ListItem>
                        <asp:ListItem>keyword</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnSubmit" class="btn btn-primary btn-lg btn-block" runat="server" Text="Submit" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="alert alert-info">order this now</div>
                </div>
                <div class="col-md-4">
                    <div class="alert alert-info">comedy drama thriller sci-fi action animation</div>
                </div>
                <div class="col-md-4">
                    <div class="alert alert-info">sign in</div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <table class="table table-bordered">
                        <tr><td>MOVIE TITLE</td><td>
                            <asp:Label ID="labelMovieTitle1" runat="server" Text="Label"></asp:Label>
                            </td></tr>
                        <tr><td>MOVIE COMPANY</td><td>
                            <asp:Label ID="labelMovieCompany1" runat="server" Text="Label"></asp:Label>
                            </td></tr>
                        <tr><td>MOVIE SUMMARY</td><td>
                            <asp:Label ID="labelMovieSummary1" runat="server" Text="Label"></asp:Label>
                            </td></tr>
                    </table>
                    <hr />
                    <table class="table table-bordered">
                        <tr><td>MOVIE TITLE</td><td>
                            <asp:Label ID="labelMovieTitle2" runat="server" Text="Label"></asp:Label>
                            </td></tr>
                        <tr><td>MOVIE COMPANY</td><td>
                            <asp:Label ID="labelMovieCompany2" runat="server" Text="Label"></asp:Label>
                            </td></tr>
                        <tr><td>MOVIE SUMMARY</td><td>
                            <asp:Label ID="labelMovieSummary2" runat="server" Text="Label"></asp:Label>
                            </td></tr>
                    </table>
                    <hr />
                    <table class="table table-bordered">
                        <tr><td>MOVIE TITLE</td><td>
                            <asp:Label ID="labelMovieTitle3" runat="server" Text="Label"></asp:Label>
                            </td></tr>
                        <tr><td>MOVIE COMPANY</td><td>
                            <asp:Label ID="labelMovieCompany3" runat="server" Text="Label"></asp:Label>
                            </td></tr>
                        <tr><td>MOVIE SUMMARY</td><td>
                            <asp:Label ID="labelMovieSummary3" runat="server" Text="Label"></asp:Label>
                            </td></tr>
                    </table>
                    <hr />
                </div>
                <div class="col-md-4">
                    <div class="col-md-6">
                        <div class="alert alert-warning">TOP TEN</div>
                        <asp:BulletedList ID="bulletedListTopTen" runat="server">
                        </asp:BulletedList>
                    </div>
                    <div class="col-md-6">
                        <div class="alert alert-warning">NEW RELEASES</div>
                        <asp:BulletedList ID="bulletedListNewRelease" runat="server">
                        </asp:BulletedList>
                    </div>
                </div>
                <div class="col-md-4">
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
      <asp:TextBox type="text" class="form-control" ID="TextBox1" runat="server"></asp:TextBox>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
      <asp:TextBox type="password" class="form-control" id="TextBox2" runat="server"></asp:TextBox>
  </div>
  <asp:Button ID="Button1" runat="server" class="btn btn-default" Text="Submit" OnClick="Button1_Click" ></asp:Button>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
            </div>

        </div>



        <!--end of content-->


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="dist/js/jquery-1.10.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="dist/js/bootstrap.min.js"></script>

    </form>


    </body>
</html>
