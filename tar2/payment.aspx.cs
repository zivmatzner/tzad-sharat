using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            Label1.Text = "hello";
        }
        else
        {
            Label1.Text = "hello you";
        }

        Label2.Text = "your total cost is: "+Session["totaltopay"].ToString();
    }

    protected void Upload(object sender, EventArgs e)
    {
        string name = imageUpload.FileName; // take the name on the client
        string path = Server.MapPath("."); //path to the current directory
        imageUpload.SaveAs(path + "/images/" + name); // must give a full path
        img.ImageUrl = "images/" + name; // note that this is a relative link
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label lbl10 = new Label();
        lbl10.Text = "your purches is complite!";
        PlaceHolder1.Controls.Add(lbl10);
    }
}