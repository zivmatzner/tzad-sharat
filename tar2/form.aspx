<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="font-family:Tahoma">
    <table style="width: 100%;">
    <tr>
        <td>product name:</td>
        <td><asp:TextBox ID="TextBoxname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="nameTBVLD" CssClass="valid" runat="server" ControlToValidate="TextBoxname" ErrorMessage="Enter the product name"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>product price:</td>
        <td><asp:TextBox ID="TextBoxprice" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="valid" runat="server" ControlToValidate="TextBoxprice" ErrorMessage="Enter the product price"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>category:</td>
        <td>
            <asp:DropDownList ID="DropDownListcategory" runat="server">
                <asp:ListItem Value="1">chair</asp:ListItem>
                <asp:ListItem Value="2">table</asp:ListItem>
                <asp:ListItem Value="3">armchair</asp:ListItem>
                <asp:ListItem Value="4">bed</asp:ListItem>
                <asp:ListItem Value="5">carpet</asp:ListItem>
                <asp:ListItem Value="6">shelf</asp:ListItem>
                <asp:ListItem Value="7">sofa</asp:ListItem>
                <asp:ListItem Value="8">stool</asp:ListItem>
                <asp:ListItem Value="9">wardrobe</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
            <tr>
        <td>product description:</td>
        <td><textarea id="descriptionid" cols="20" rows="2" runat="server"></textarea>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="valid" runat="server" ControlToValidate="descriptionid" ErrorMessage="Enter the product dexcription"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>


            <tr>
        <td>&nbsp;</td>
        <td><asp:Button ID="Button1" runat="server" Text="save product" OnClick="save_Click" /></td>
        <td>&nbsp;</td>
    </tr>
            <tr>
        <td>&nbsp;</td>
        <td><asp:Label ID="outputLBL" runat="server" Text=""></asp:Label></td>
        <td>&nbsp;</td>
    </tr>
        <tr>
                    <td>add your image : <asp:FileUpload ID="imageUpload" runat="server" />
        &nbsp;<asp:Button ID="uploadBTN" runat="server" Text="Upload to the server" OnClick="Upload" /></td>
       <td> <asp:Image ID="img" runat="server" /></td>
        </tr>
</table>
    </div>
</asp:Content>

