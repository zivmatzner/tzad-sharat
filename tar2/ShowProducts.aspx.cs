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
        Product prod = new Product();
        List<Product> pl = prod.getProducts();
        //if (IsPostBack == false) { 
        int i = 0;
            foreach (Product p in pl)
            {

                CheckBox cb = new CheckBox();
                if (p.Inventory > 0)
                {
                    cb.ID = "cb" + i.ToString();
                    PlaceHolder1.Controls.Add(cb);
                }
                else
                {

                    cb.Enabled = false;
                    cb.ID = "cb" + i.ToString();
                    PlaceHolder1.Controls.Add(cb);
                }

                Image img = new Image();
                img.ImageUrl = p.ImagePath;
                PlaceHolder1.Controls.Add(img);
                Label lbl = new Label();
                lbl.Text = "<br/> product name: " + p.Title + "<br/>";
                PlaceHolder1.Controls.Add(lbl);
                Label lbl2 = new Label();
                lbl2.Text = "product price: " + p.Price + " NIS <br/>";
                PlaceHolder1.Controls.Add(lbl2);
                Label lbl4 = new Label();
                lbl4.Text = "product ditails: <br/>";
                PlaceHolder1.Controls.Add(lbl4);
                foreach (KeyValuePair<string, string> entry in p.Attributes)
                {
                    Label lbl3 = new Label();
                    lbl3.Text = entry.Value+"<br/>";
                    PlaceHolder1.Controls.Add(lbl3);

                }
                i++;
            }
        //}
     
  


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int j = 0;
        Product prod = new Product();
        List<Product> pl = prod.getProducts();
        List<string> ids = new List<string>();
        List<Product> slst = new List<Product>();
        foreach (Product p in pl)
        {

            CheckBox cb = (CheckBox)PlaceHolder1.FindControl("cb" + j.ToString());
            if (cb.Checked == true)
            {
                slst.Add(p);
                ids.Add("cb" + j.ToString());
            }

            j++;
        }

        Session["tocart"] = slst;
        Session["idis"] = ids;

        Label lbl7 = new Label();
        lbl7.Text = "the products you chose are: <br/>";
        foreach (Product d in slst)
        {

            lbl7.Text += d.Title + "<br/>";
        }
        PlaceHolder2.Controls.Add(lbl7);

        Response.Redirect("Cart.aspx");
    }

    protected void Page_PreRender(object sender, EventArgs e)
    { // PreRender is called when it still "sees" the previous controls

    }
}