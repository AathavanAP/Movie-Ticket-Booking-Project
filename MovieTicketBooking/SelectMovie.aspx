<%@ Page Title="Select Movie" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="SelectMovie.aspx.cs" Inherits="MovieTicketBooking.SelectMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Select Your Movie and Location</h2>
    
    <div style="margin-bottom: 15px;">
        <label for="movieDropdown" style="display: block; margin-bottom: 5px;">Select Movie:</label>
        <asp:DropDownList ID="movieDropdown" runat="server" style="width: 100%; max-width: 300px;">
        </asp:DropDownList>
        <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" 
            runat="server" 
            ControlToValidate="movieDropdown" 
            InitialValue="" 
            ErrorMessage="Please select a movie." 
            ForeColor="Red" 
            Display="Dynamic" 
            EnableClientScript="true" />
    </div>
    
    <div style="margin-bottom: 15px;">
        <label for="locationDropdown" style="display: block; margin-bottom: 5px;">Select Location:</label>
        <asp:DropDownList ID="locationDropdown" runat="server" style="width: 100%; max-width: 300px;">
        </asp:DropDownList>
        <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2" 
            runat="server" 
            ControlToValidate="locationDropdown" 
            InitialValue="" 
            ErrorMessage="Please select a location." 
            ForeColor="Red" 
            Display="Dynamic" 
            EnableClientScript="true" />
    </div>
    
    <div style="margin-top: 30px;">
        <asp:Button ID="ConfirmButton" runat="server" Text="Next" OnClick="ConfirmButton_Click" />
    </div>
</asp:Content>
