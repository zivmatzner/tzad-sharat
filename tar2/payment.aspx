<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title></title>
    <style type="text/css">

        .valid{
            color:red;
        }

    </style>
    <script>

        function cardfan() {
            document.getElementById("craditsade1").style.visibility = "visible";
            document.getElementById("craditsade2").style.visibility = "visible";
            document.getElementById('<%=Page.Master.FindControl("ContentPlaceHolder1").FindControl("TextBoxcardnum").ClientID%>').required ="required";
            document.getElementById("craditsade3").style.visibility = "visible";
            document.getElementById('<%=Page.Master.FindControl("ContentPlaceHolder1").FindControl("TextBoxid").ClientID%>').required = "required";
            document.getElementById("craditsade4").style.visibility = "visible";
            document.getElementById('<%=Page.Master.FindControl("ContentPlaceHolder1").FindControl("Checkboxphone").ClientID%>').style.visibility = "hidden";
          


        }
        function phonefan() {
            document.getElementById("phonesade").style.visibility = "visible";
            document.getElementById('<%=Page.Master.FindControl("ContentPlaceHolder1").FindControl("TextBoxphone").ClientID%>').required = "required";
            document.getElementById('<%=Page.Master.FindControl("ContentPlaceHolder1").FindControl("Checkboxcard").ClientID%>').style.visibility = "hidden";
        }

        function validateLength(src, arg) {
            newnum = parseInt(arg.Value);
            bikoret = newnum % 10;
            if (arg.Value.length == 9) {
                var sum = 0;
                while (newnum > 0) {
                    sum = sum + newnum % 10;
                    newnum = Math.floor(newnum / 10);
                }

                if ((sum % 7) != bikoret) { arg.IsValid = false; }
                else { arg.IsValid = true; }
            }
        
            else { arg.IsValid = false; }
        }
        function validatephone(src, arg) {
            if (arg.Value.length !=  10)   
            { arg.IsValid = false; }
            else { arg.IsValid = true;}
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <div style="font-family:Tahoma">
        <table style="width: 100%;">
                                   <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>full name: </td>
                <td>&nbsp;</td>
                <td><asp:TextBox ID="TextBoxname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="nameTBVLD" CssClass="valid" runat="server" ControlToValidate="TextBoxname" ErrorMessage="Enter your name"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBoxname" runat="server" ErrorMessage="please enter your name with letters only" ValidationExpression="^[a-zA-Z]+$" ></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>address: </td>
                <td>&nbsp;</td>
                <td><asp:TextBox ID="TextBoxaddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="valid" runat="server" ControlToValidate="TextBoxaddress" ErrorMessage="Enter your address"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>E-mail: </td>
                <td>&nbsp;</td>
                <td><input id="Textemail" type="email"  runat="server"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="valid" runat="server" ControlToValidate="Textemail" ErrorMessage="Enter your e-mail"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td>delivery time: </td>
                <td>&nbsp;</td>
                <td><asp:Calendar ID="Calendar1" runat="server" required="required" ></asp:Calendar>
               
                </td>
            </tr>
            <tr>
                <td>paymant mathod: </td>
                <td>credit card: <input id="Checkboxcard" type="checkbox" runat="server" onclick="cardfan()" visibility="true"  />
                 
                </td>
                <td>over the phone: <input id="Checkboxphone"  type="checkbox" runat="server" onclick="phonefan()" visibility="true"  />
                  
                </td>
            </tr>
            <tr id="phonesade" style="visibility:hidden">
                <td>phone number: </td>
                <td>&nbsp;</td>
                <td><asp:TextBox ID="TextBoxphone" runat="server" ></asp:TextBox>
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="valid" ControlToValidate="TextBoxphone" runat="server" ErrorMessage="please enter your phone number with digits only" ValidationExpression="^[0-9]*$" ></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidator2" CssClass="valid" runat="server" ErrorMessage="phone number is incorrect" ControlToValidate="TextBoxphone" ClientValidationFunction = "validatephone"></asp:CustomValidator>
                </td>
            </tr>
            <tr id="craditsade1" style="visibility:hidden">
                <td>number of paymant: </td>
                <td>&nbsp;</td>
                <td><asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Text="1" Value="1"/>
                    <asp:ListItem Text="2" Value="2"/>
                    <asp:ListItem Text="3" Value="3"/>
                    </asp:DropDownList>
                  
                </td>
            </tr>
            <tr id="craditsade2" style="visibility:hidden">
                <td>credit card number: </td>
                <td>&nbsp;</td>
                <td><asp:TextBox ID="TextBoxcardnum" runat="server"></asp:TextBox>
               
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" CssClass="valid" ControlToValidate="TextBoxcardnum" runat="server" ErrorMessage="please enter your credit card number with digits only" ValidationExpression="^[0-9]*$" ></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr id="craditsade3" style="visibility:hidden">
                <td>id number: </td>
                <td>&nbsp;</td>
                <td><asp:TextBox ID="TextBoxid" runat="server"></asp:TextBox>
                
                <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="valid" ErrorMessage="the id number is incorrect" ControlToValidate="TextBoxid" ClientValidationFunction = "validateLength"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" CssClass="valid" ControlToValidate="TextBoxid" runat="server" ErrorMessage="please enter your id number with digits only" ValidationExpression="^[0-9]*$" ></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr id="craditsade4" style="visibility:hidden">
                <td>card type: </td>
                <td>&nbsp;</td>
                <td><asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Text="visa" Value="1"/>
                    <asp:ListItem Text="american express" Value="2"/>
                    <asp:ListItem Text="isracart" Value="3"/>
                    </asp:DropDownList>
                   
                </td>
            </tr>
           <tr>
            <td>add your image : <asp:FileUpload ID="imageUpload" runat="server" />
        &nbsp;<asp:Button ID="uploadBTN" runat="server" Text="Upload to the server" OnClick="Upload" /></td>
       <td> <asp:Image ID="img" runat="server" style="height:100px" /></td>
        </tr>
                        <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" /></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table> 
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </div>


</asp:Content>

