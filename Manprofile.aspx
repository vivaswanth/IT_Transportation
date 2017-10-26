<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Manprofile.aspx.cs" Inherits="Manprofile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="content1">
        <div class="container card">
            <h4>profile Information</h4>
            <table class="table">
            <tr>
                <th class="col-md-3">Full Name</th>
                <th class="col-md-3">User Name</th>
                <th class="col-md-3">Manager ID</th>
                <th class="col-md-3">Branch ID</th>
            </tr>
            <tr>    
                <td class="col-md-3"><asp:label runat="server" ID="FullName"></asp:label></td>
                <td class="col-md-3"><asp:label runat="server" ID="UserName"></asp:label></td>
                <td class="col-md-3"><asp:label runat="server" ID="ManID"></asp:label></td>
                <td class="col-md-3"><asp:label runat="server" ID="BranchID"></asp:label></td>
            </tr>
            </table>

            <h4>Personal Information</h4>
            <table class="table">
            <tr>
                <th class="col-md-3">Gender</th>
                <th class="col-md-3">Date of Birth</th>
                <th class="col-md-3">Mobile Number</th>
                <th class="col-md-3">Email</th>
            </tr>
            <tr>    
                <td class="col-md-3"><asp:label runat="server" ID="gender"></asp:label></td>
                <td class="col-md-3"><asp:label runat="server" ID="dob"></asp:label></td>
                <td class="col-md-3"><asp:label runat="server" ID="mobile"></asp:label></td>
                <td class="col-md-3"><asp:label runat="server" ID="email"></asp:label></td>
            </tr>
            </table>
        </div>
</asp:Content>

