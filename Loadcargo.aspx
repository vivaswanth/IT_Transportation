<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Loadcargo.aspx.cs" Inherits="Loadcargo" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="content1">

	<div class="container card">
    	<h4>Showing the list of all the possible trucks.</h4>
    	<p>Click on the select trucks..</p>
    	<asp:label runat="server" ID="label"></asp:label>
    	<asp:GridView runat="server" ID="lcgrid" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPaging" PageSize="5" CssClass="table table-striped table-bordered">
            <columns>  
				<asp:TemplateField HeaderText="Truck ID">  
				    <ItemTemplate>  
				        <asp:Label ID="TruckID" runat="server" Text='<%#Bind("TruckID") %>'></asp:Label>  
				    </ItemTemplate>  
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Status">  
				    <ItemTemplate>  
				        <asp:Label ID="Status" runat="server" Text='<%#Bind("Status") %>'></asp:Label>  
				    </ItemTemplate>  
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Capacity Status [Available space]">  
				    <ItemTemplate>  
				        <asp:Label ID="Capacity" runat="server" Text='<%#Bind("Capacity") %>'></asp:Label>  
				    </ItemTemplate>  
				</asp:TemplateField>

				<asp:TemplateField HeaderText="View Details">  
			        <ItemTemplate>  
			            <asp:LinkButton runat="server" class="btn btn-success btn-sm" OnClick="Allocate" Text="Allocate" CommandArgument='<%#Eval("TruckID")%>'/>
			        </ItemTemplate>  
			    </asp:TemplateField>  

			</columns>
        </asp:GridView>

    </div>

</asp:Content>

