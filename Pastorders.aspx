<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Pastorders.aspx.cs" Inherits="Pastorders" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="content1">
    <div class="container card">
    	<h4>Showing the list of all the past orders.</h4>
    	<p>Click on the view details to view more detailed information about an order, issue bills and receipts, etc...</p>
    	<asp:GridView runat="server" ID="pogrid" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPaging" PageSize="5" CssClass="table table-striped table-bordered">
            <columns>  
				<asp:TemplateField HeaderText="Order ID">  
				    <ItemTemplate>  
				        <asp:Label ID="OrderID" runat="server" Text='<%#Bind("OrderID") %>'></asp:Label>  
				    </ItemTemplate>  
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Order Name">  
				    <ItemTemplate>  
				        <asp:Label ID="OrderName" runat="server" Text='<%#Bind("OName") %>'></asp:Label>  
				    </ItemTemplate>  
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Consignment Details">  
				    <ItemTemplate>  
				        <asp:Label ID="ConsignmentDetails" runat="server" Text='<%#Bind("CDetails") %>'></asp:Label>  
				    </ItemTemplate>  
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Volume">  
				    <ItemTemplate>  
				        <asp:Label ID="Volume" runat="server" Text='<%#Bind("Volume") %>'></asp:Label>  
				    </ItemTemplate>  
				</asp:TemplateField>

				<asp:TemplateField HeaderText="View Details">  
			        <ItemTemplate>  
			            <asp:LinkButton runat="server" class="btn btn-success btn-sm" OnClick="ViewClick_Redirect" Text="View Details" CommandArgument='<%#Eval("OrderID")%>'/>
			        </ItemTemplate>  
			    </asp:TemplateField>  

			</columns>
        </asp:GridView>
    </div>
</asp:Content>

