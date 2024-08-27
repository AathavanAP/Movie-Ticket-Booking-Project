<%@ Page Title="Booking History" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="MovieTicketBooking.BookingHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Booking History</h2>
    
    <div style="margin-top: 20px;">
        <asp:GridView ID="GridViewBookingHistory" runat="server" AutoGenerateColumns="True" />
    </div>
</asp:Content>
