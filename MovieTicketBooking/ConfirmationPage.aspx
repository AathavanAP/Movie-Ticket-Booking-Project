<%@ Page Title="Confirmation Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ConfirmationPage.aspx.cs" Inherits="MovieTicketBooking.ConfirmationPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Confirmation Message Label -->
    <div style="text-align: center; margin-bottom: 20px;">
        <asp:Label ID="lblConfirmationMessage" runat="server" ForeColor="Green" Font-Bold="True" />
    </div>
    
    <h2>Confirm Your Booking</h2>
    
    <!-- Datepicker -->
    <div style="margin-bottom: 15px;">
        <label for="bookingDate" style="display: block; margin-bottom: 5px;">Select Date:</label>
        <asp:TextBox ID="bookingDate" runat="server" style="width: 100%; max-width: 300px;" />
        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="bookingDate" />
        <asp:RequiredFieldValidator 
            ID="rfvBookingDate" 
            runat="server" 
            ControlToValidate="bookingDate" 
            ErrorMessage="Date is required." 
            ForeColor="Red" 
            Display="Dynamic" />
    </div>
    
    <!-- Time Slot Checkboxes -->
    <div style="margin-bottom: 15px;">
        <label for="timeSlot" style="display: block; margin-bottom: 5px;">Select Time Slot:</label>
        <asp:CheckBox ID="time10am" runat="server" Text="10 am" AutoPostBack="true" OnCheckedChanged="TimeSlot_CheckedChanged" />
        <asp:CheckBox ID="time1pm" runat="server" Text="1 pm" AutoPostBack="true" OnCheckedChanged="TimeSlot_CheckedChanged" />
        <asp:CheckBox ID="time6pm" runat="server" Text="6 pm" AutoPostBack="true" OnCheckedChanged="TimeSlot_CheckedChanged" />
        <asp:CheckBox ID="time9pm" runat="server" Text="9 pm" AutoPostBack="true" OnCheckedChanged="TimeSlot_CheckedChanged" />
        <asp:Label ID="lblTimeSlotError" runat="server" ForeColor="Red" />
    </div>
    
    <!-- Ticket Count Dropdown -->
    <div style="margin-bottom: 15px;">
        <label for="ticketCount" style="display: block; margin-bottom: 5px;">Ticket Count:</label>
        <asp:DropDownList ID="ticketCount" runat="server" style="width: 100%; max-width: 300px;">
            <asp:ListItem Text="--Select Count--" Value="" />
            <asp:ListItem Text="1" Value="1" />
            <asp:ListItem Text="2" Value="2" />
            <asp:ListItem Text="3" Value="3" />
            <asp:ListItem Text="4" Value="4" />
            <asp:ListItem Text="5" Value="5" />
            <asp:ListItem Text="6" Value="6" />
            <asp:ListItem Text="7" Value="7" />
            <asp:ListItem Text="8" Value="8" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator 
            ID="rfvTicketCount" 
            runat="server" 
            ControlToValidate="ticketCount" 
            InitialValue="" 
            ErrorMessage="Ticket count is required." 
            ForeColor="Red" 
            Display="Dynamic" />
    </div>
    
    <!-- Confirm and Cancel Buttons -->
    <div style="margin-top: 20px;">
        <asp:Button ID="confirmButton" runat="server" Text="Confirm" OnClick="ConfirmButton_Click"  />
    </div>
    <div style="margin-top: 20px;">
        <asp:Button ID="cancelButton" runat="server" Text="Cancel" OnClick="CancelButton_Click"  />
    </div>
</asp:Content>
