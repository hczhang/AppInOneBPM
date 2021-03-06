using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class SYS_ROLEDATAManage : AgileFrame.AppInOne.Common.BasePage
{
    SYS_ROLEDATA valObj = new SYS_ROLEDATA();
    SYS_ROLEDATA condObj = new SYS_ROLEDATA();
    List<SYS_ROLEDATA> listObj = new List<SYS_ROLEDATA>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(SYS_ROLEDATA condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_ROLEDATA.Attribute.ROLE_ID, Order.Desc);
        listObj = BLLTable<SYS_ROLEDATA>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageNum.Value = "30";
            aspPager.PageSize = 30;
            
            #endregion
            #region//数据初始化
            
            #endregion

            BindList(condObj, 1);
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_ROLEDATA>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_ROLEDATA();

        
        
        if(txtROLE_ID.Value !="" )
            condObj.Like(SYS_ROLEDATA.Attribute.ROLE_ID, Convert.ToDecimal(txtROLE_ID.Value));
        
        
        if(txtDATA_TYPE.Value !="" )
            condObj.Like(SYS_ROLEDATA.Attribute.DATA_TYPE, Convert.ToString(txtDATA_TYPE.Value));
        
        
        if(txtDATA_ID.Value !="" )
            condObj.Like(SYS_ROLEDATA.Attribute.DATA_ID, Convert.ToString(txtDATA_ID.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageNum.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_ROLEDATA>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}