<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="content1">

    <div class="container card">
    	<h4>Register for new Consignment here / Create new order...</h4>
    	<div class="row col-md-12">
    		<h4><b>Consignment Details</b></h4>    		
			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Order Name</label>
                <asp:TextBox runat="server" ID="OName" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Order Details (Optional)</label>
                <asp:TextBox runat="server" ID="ODetails" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Volume (* In Cubic mts)</label>
                <asp:TextBox runat="server" ID="OVol" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Remarks (if any)</label>
                <asp:TextBox runat="server" ID="ORemarks" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<h4><b>Sender Details</b></h4>
			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Sender's Name</label>
                <asp:TextBox runat="server" ID="OSender" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Sender ID proof (any)</label>
                <asp:TextBox runat="server" ID="OSID" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Sender Mobile Number</label>
                <asp:TextBox runat="server" ID="OSMobile" type="int" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Sender's Email</label>
                <asp:TextBox runat="server" ID="OSEmail" type="email" CssClass="form-control"></asp:TextBox>
			</div>

			<h4><b>Receivers Details</b></h4>
			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Receiver's Name</label>
                <asp:TextBox runat="server" ID="OReceiver" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Receiver ID proof (any)</label>
                <asp:TextBox runat="server" ID="ORID" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Receiver Mobile Number</label>
                <asp:TextBox runat="server" ID="ORMobile" type="int" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Receiver's Email</label>
                <asp:TextBox runat="server" ID="OREmail" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<h4><b>Transportation Details</b></h4>    		

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Enter Destination Branch</label>
                <asp:TextBox runat="server" ID="OTo" type="text" CssClass="form-control"></asp:TextBox>
			</div>

			<div class="form-group label-floating has-primary col-md-3">
				<label class="control-label">Distance from here</label>
                <asp:TextBox runat="server" ID="ODist" type="text" CssClass="form-control"></asp:TextBox>
			</div>
			<br>
			<p>All the Submitted details can be found in past orders, to issue bills. An Estimated fare can be calculated, but this may vary depending on situations.</p>
			<br>
			<div class="col-md-offset-4">
    			<asp:Button runat="server" ID="OSubmit" OnClick="Place_order" CssClass="btn btn-primary" text="Submit Details"></asp:Button>
    			<asp:Button runat="server" ID="OCFare" OnClick="Calculate_fare" CssClass="btn btn-success" text="Calculate Fare"></asp:Button>
    		</div>

    	</div>

    </div>
</asp:Content>

