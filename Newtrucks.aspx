<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Newtrucks.aspx.cs" Inherits="Newtrucks" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="content1">
    

    <div class="container card">
    	<h4>Enter the New Truck Details here...</h4>
    	<div class="row col-md-12">
    		<h4><b>Truck Details</b></h4>    		
			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Truck ID</label>
                <asp:TextBox runat="server" ID="TID" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter License Number</label>
                <asp:TextBox runat="server" ID="TLinum" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Truck Status</label>
                <asp:TextBox runat="server" ID="TStatus" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Truck Model</label>
                <asp:TextBox runat="server" ID="TModel" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<p>All the Submitted details can be found in truck status. The capacity of each truck is assumed to be 500 cubic meters.</p>
			<br>
			<div class="col-md-offset-4">
    			<asp:Button runat="server" ID="TSubmit" OnClick="Insert_trucks" CssClass="btn btn-primary" text="Submit Details"></asp:Button>
    			<asp:Button runat="server" ID="TTrucks" CssClass="btn btn-success" text="View All Trucks"></asp:Button>
    		</div>

    	</div>
</asp:Content>
