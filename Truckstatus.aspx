<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Truckstatus.aspx.cs" Inherits="Truckstatus" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="content1">
    <div class="container card">
    	<h3>Truck Status and available trucks</h3>
    	<asp:GridView runat="server" ID="ttgrid" AllowPaging="true" OnPageIndexChanging="OnPaging" PageSize="5" CssClass="table table-striped table-bordered">
    	</asp:GridView>
    </div>

    
    </div>
</asp:Content>