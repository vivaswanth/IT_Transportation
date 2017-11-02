<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Orderstatus.aspx.cs" Inherits="Orderstatus" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="content1">
    <div class="container card">
    	<h4>Showing the list of all the past orders.</h4>
    	<p>Click on the view details to view more detailed information about an order, issue bills and receipts, etc...</p>
    	<asp:GridView runat="server" ID="osgrid" AllowPaging="true" OnPageIndexChanging="OnPaging" PageSize="5" CssClass="table table-striped table-bordered">
    	</asp:GridView>
   	</div>
</asp:Content>
