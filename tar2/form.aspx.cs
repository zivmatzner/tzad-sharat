using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void save_Click(object sender, EventArgs e)
    {
        Dictionary<string, string> atrib = new Dictionary<string, string>();
        string[] items = descriptionid.Value.TrimEnd(',').Split(',');
        int i = 0;
        foreach (string item in items)
        {

            string[] keyValue = item.Split('=');
            atrib.Add(keyValue[0], keyValue[1]);
            i++;
        }
        Product product = new Product(TextBoxname.Text, atrib, Convert.ToDouble(TextBoxprice.Text), Convert.ToInt16(DropDownListcategory.SelectedValue));
        string info = product.getinfo();
        outputLBL.Text = info;
    }

    protected void Upload(object sender, EventArgs e)
    {
        string name = imageUpload.FileName; // take the name on the client
        string path = Server.MapPath("."); //path to the current directory
        imageUpload.SaveAs(path + "/images/" + name); // must give a full path
        img.ImageUrl = "images/" + name; // note that this is a relative link
    }
}