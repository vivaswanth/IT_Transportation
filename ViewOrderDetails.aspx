<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="ViewOrderDetails.aspx.cs" Inherits="ViewOrderDetails" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="content1">

	<div class="container card">
		<h4>Showing Details regarding the order : <asp:label runat="server" ID="oid"></asp:label> | Payment Status : <asp:label runat="server" ID="ps"></asp:label></h4>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="col-md-3"><b>Order Name</b></th>
					<th class="col-md-3"><b>Order Arrival Time</b></th>
					<th class="col-md-3"><b>Order Details</b></th>
					<th class="col-md-3"><b>Order Fare</b></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-md-3"><asp:label runat="server" ID="OName"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="OAT"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="ODT"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="OFare"></asp:label></td>
				</tr>
			</tbody>
		</table>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="col-md-3"><b>Sender Name</b></th>
					<th class="col-md-3"><b>Sender ID</b></th>
					<th class="col-md-3"><b>Sender Email</b></th>
					<th class="col-md-3"><b>Sender Mobile</b></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-md-3"><asp:label runat="server" ID="OSN"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="OSID"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="OSEM"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="OSMO"></asp:label></td>
				</tr>
			</tbody>
		</table>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="col-md-3"><b>Receiver Name</b></th>
					<th class="col-md-3"><b>Receiver ID</b></th>
					<th class="col-md-3"><b>Receiver Email</b></th>
					<th class="col-md-3"><b>Receiver Mobile</b></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-md-3"><asp:label runat="server" ID="ORN"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="ORID"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="OREM"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="ORMO"></asp:label></td>
				</tr>
			</tbody>
		</table>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="col-md-3"><b>Starting Point</b></th>
					<th class="col-md-3"><b>Destination</b></th>
					<th class="col-md-3"><b>Distance</b></th>
					<th class="col-md-3"><b>Remarks</b></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-md-3"><asp:label runat="server" ID="OSP"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="ODP"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="ODS"></asp:label></td>
					<td class="col-md-3"><asp:label runat="server" ID="ORS"></asp:label></td>
				</tr>
			</tbody>
		</table>
		<p>Please Note that once the payment is done, the order cannot be cancelled, nor the payment can be refunded unless in exceptional cases.</p>
		<p>Server may take time to get updated, please refresh the page or back and reopen</p>
		<div class="col-md-offset-2">
			<asp:Button runat="server" ID="PBill" OnClick="GenerateBill" CssClass="btn btn-success" text="Produce Bill"></asp:Button>
			<asp:Button runat="server" ID="BPayment" OnClick="Paydone" CssClass="btn btn-success" text="Payment Done"></asp:Button>
			<asp:Button runat="server" ID="Alloc" OnClick="Alloc_truck" CssClass="btn btn-primary" text="Allocate Truck"></asp:Button>
			<asp:Button runat="server" ID="BCancel" OnClick="Cancelorder" CssClass="btn btn-danger" text="Cancel Order"></asp:Button>
		</div>
	</div>
</asp:Content>