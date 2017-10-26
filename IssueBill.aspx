<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IssueBill.aspx.cs" Inherits="IssueBill" EnableEventValidation = "false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill</title>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    
    <link href="assets/css/icons.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container card" style="margin-top: 2%" id="bill">
        	<h2 align="center" style="color: red">TransCorp Inc.</h2>
        	<h4 align="center">Legal Bill as per <asp:label runat="server" ID="bdate"></asp:label></h4>
        	<p align="center">This is a system generated bill as per authorized rules and do not require any signatures.</p>
        	<table class="table table-bordered table-striped">
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

			<table class="table table-bordered table-striped">
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

			<table class="table table-bordered table-striped">
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


			<table class="table table-bordered table-striped">
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

			<p align="center">The destination time and truck allotment will be done as soon the payment is made, for more information please contact the nearby branch manager.</p>
        </div>
        <div class="col-md-offset-5">
			<asp:Button runat="server" ID="Payment" OnClick="btnExport_Click" CssClass="btn btn-success" text="Export as pdf"></asp:Button>
			<asp:LinkButton runat="server" ID="Cancel" CssClass="btn btn-danger" text="Go Back" PostBackUrl="Pastorders.aspx"></asp:LinkButton>
		</div>
    </form>
</body>

</html>
