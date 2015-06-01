<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CS_DEFAULTRESPONSESel.aspx.cs" Inherits="WEC_CS_DEFAULTRESPONSESel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });

    function selThis_B(tds) {
        var tdObj = $(tds[0]);
        var aObj = tdObj.find("a");
        if (aObj.length > 0) {
            _selERR = "����ѡ�����ӽڵ�����ݣ�";
            _selOK = false;
        }
    }
    function selOK_B(id) {
        //alert(id);
        $("input[id$='hidSelID']").val(id);
        //alert($("input[id$='hidSelID']").val());
        __doPostBack("ctl00$cphBody$LinkButton1", "");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="ID">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AID">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ADDTIME.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="STARTTIME">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.STARTTIME.ZhName %>��</dt><!--��ʼʱ��-->
               <dd><span>
               
                    <input id="txtSTARTTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ENDTIME">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ENDTIME.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
               
                    <input id="txtENDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="MSGCONTENT">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.MSGCONTENT.ZhName %>��</dt><!--��Ϣ����-->
               <dd><span>
               
                    <input id="txtMSGCONTENT" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl class="btn"><dd>
         <span><asp:Button ID="btn_Find" runat="server" Text="��ѯ" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.AID._ZhName %></td><!--���ںű��-->
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.ADDTIME._ZhName %></td><!--����ʱ��-->
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.STARTTIME._ZhName %></td><!--��ʼʱ��-->
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.ENDTIME._ZhName %></td><!--����ʱ��-->
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.MSGCONTENT._ZhName %></td><!--��Ϣ����-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).AID %></td>
                    
                    
                    <td><%#(((WEC_CS_DEFAULTRESPONSE)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_CS_DEFAULTRESPONSE)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_CS_DEFAULTRESPONSE.Attribute.STATUS, ((WEC_CS_DEFAULTRESPONSE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_CS_DEFAULTRESPONSE)Container.DataItem).STARTTIME == DateTime.MinValue) ? "" : ((WEC_CS_DEFAULTRESPONSE)Container.DataItem).STARTTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((WEC_CS_DEFAULTRESPONSE)Container.DataItem).ENDTIME == DateTime.MinValue) ? "" : ((WEC_CS_DEFAULTRESPONSE)Container.DataItem).ENDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).MSGCONTENT %></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        <div class="path-url hide">
        <strong>��ǰ·����</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
        <div class="pages">
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>
