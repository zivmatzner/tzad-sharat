<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowProducts.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .cbc{
            font-family:Tahoma;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    
    
    <table style="width: 100%;" class="cbc";>
                <tr>
            <td><asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr id="tr1">
            <td> <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><asp:Button ID="Button1" runat="server" Text="Continue To Cart" OnClick="Button1_Click" /></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

    </table>
</asp:Content>

