<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="MovieTicketBooking._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to Movie Ticket Booking!</h2>
    <p style="margin-bottom: 20px;">Book your tickets for the latest movies here.</p>

    <div style="margin-bottom: 15px;">
        <label for="Name" style="display: block; margin-bottom: 5px;">Enter Your Name:</label>
        <asp:TextBox ID="Name" runat="server" style="width: 100%; max-width: 300px;" />
        <asp:RegularExpressionValidator 
            ID="regexNameValidator" 
            runat="server" 
            ControlToValidate="Name" 
            ErrorMessage="Invalid Name" 
            ValidationExpression="^[a-zA-Z\s'-]+$" 
            Display="Dynamic" 
            ForeColor="Red" 
            EnableClientScript="true" />
        <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" 
            runat="server" 
            ControlToValidate="Name" 
            ErrorMessage="Name is required." 
            ForeColor="Red" 
            Display="Dynamic" 
            EnableClientScript="true" />
    </div>
    
    <div style="margin-bottom: 15px;">
        <label for="PhoneNumber" style="display: block; margin-bottom: 5px;">Enter Your Phone Number:</label>
        <asp:TextBox ID="phoneNumber" runat="server" style="width: 100%; max-width: 300px;" />
        <asp:RegularExpressionValidator 
            ID="regexPhoneValidator" 
            runat="server" 
            ControlToValidate="phoneNumber" 
            ErrorMessage="Invalid Number" 
            ValidationExpression="^\d{10}$" 
            Display="Dynamic" 
            ForeColor="Red" 
            EnableClientScript="true" />
        <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2" 
            runat="server" 
            ControlToValidate="phoneNumber" 
            ErrorMessage="Phone number is required." 
            ForeColor="Red" 
            Display="Dynamic" 
            EnableClientScript="true" />
    </div>
    
    <div style="margin-bottom: 30px;">
        <label for="movieLanguage" style="display: block; margin-bottom: 5px;">Select Movie Language:</label>
        <asp:DropDownList ID="movieLanguage" runat="server" style="width: 100%; max-width: 300px;">
        </asp:DropDownList>
        <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator3" 
            runat="server" 
            ControlToValidate="movieLanguage" 
            InitialValue="" 
            ErrorMessage="Please select a movie language." 
            ForeColor="Red" 
            Display="Dynamic" 
            EnableClientScript="true" />
    </div>
    
    <div style="margin-top: 20px;">
        <asp:Button ID="nextButton" runat="server" Text="Next" OnClick="NextButton_Click" CausesValidation="True" />
    </div>
    
    <p style="margin-top: 20px;"><a href="BookingHistory.aspx">Booking History</a></p>
</asp:Content>
