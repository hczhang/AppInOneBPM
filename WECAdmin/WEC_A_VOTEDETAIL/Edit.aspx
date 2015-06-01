<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
       $(function(){
           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
   <script type="text/javascript"src="<%=WebHelper.GetAppPath()%>Lib/JQuery/ui/jquery.ui.widget.min.js"></script>
   <script type="text/javascript"src="<%=WebHelper.GetAppPath()%>Lib/JQuery/ui/jquery.ui.position.min.js"></script>
 <script type="text/javascript"src="<%=WebHelper.GetAppPath()%>Lib/JQuery/ui/jquery.multiselect.js"></script>
<script type="text/javascript"src="<%=WebHelper.GetAppPath()%>Lib/JQuery/ui/jquery.multiselect.filter.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<%--<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>--%>
<div class="form" id="divForm">
       <div>
                   
        <%=getInput() %>

       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>