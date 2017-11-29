using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    double total;
    protected void Page_Load(object sender, EventArgs e)
        
    {
        if (IsPostBack == false)
        {
            Label2.Text = "you just arrived to the cart page for the first time! <br/>";
        }
        else { Label2.Text = "your change saved. <br/>"; }
        show((List < Product > )Session["tocart"], (List<string>)Session["idis"]);
    }

    protected void CheckBox_CheckChanged(object sender, EventArgs e)
    {

        int j = 0;
        Product prod = new Product();
        List<Product> pl = prod.getProducts();
        List<Product> slst2 = new List<Product>();
        foreach (Product p in (List<Product>)Session["tocart"])
        {
            CheckBox cb = (CheckBox)PlaceHolder1.FindControl("cb" + j.ToString());
            if (cb.Checked == false)
            {
                slst2.Add(p);
            }

            j++;
        }

        Session["tocart"] = slst2;
        show((List<Product>)Session["tocart"], (List<string>)Session["idis"]);



    }

    void show(List<Product> sas,List<string> id)
    {
        int i = 0;
        double totalcost = 0;
        Label lbl7 = new Label();
        lbl7.Text = "the products you chose are: <br/>";
        foreach (Product d in sas)
        {
            CheckBox cb = new CheckBox();
            cb.CheckedChanged += new EventHandler(Page_Load);
            cb.ID = "cb" + i.ToString();
            PlaceHolder1.Controls.Add(cb);

            Image img = new Image();
            img.ImageUrl = d.ImagePath;
            PlaceHolder1.Controls.Add(img);
            Label lbl = new Label();
            lbl.Text = "<br/> product name: " + d.Title + "<br/>";
            PlaceHolder1.Controls.Add(lbl);
            Label lbl2 = new Label();
            lbl2.Text = "product price: " + d.Price + " NIS <br/>";
            PlaceHolder1.Controls.Add(lbl2);

            totalcost = totalcost + d.Price;
            i++;
        }

        total = totalcost;
        Label1.Text = "your total price is: " + totalcost;
        PlaceHolder1.Controls.Add(Label1);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["totaltopay"] = total;

        Response.Redirect("payment.aspx");
    }
}