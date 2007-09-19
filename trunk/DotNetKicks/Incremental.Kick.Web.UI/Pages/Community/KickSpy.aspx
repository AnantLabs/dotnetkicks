<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KickSpy.aspx.cs" Inherits="Incremental.Kick.Web.UI.Pages.Community.KickSpy" %>
<%@ Register Src="../../Controls/Community/KickSpy.ascx" TagName="KickSpy" TagPrefix="uc1" %>
<%@ Register Src="/Controls/User/ShoutBox.ascx" TagName="ShoutBox" TagPrefix="uc1" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">
<span style="font-size: 1.2em;"><em>
<strong><%= Incremental.Kick.Caching.UserCache.GetOnlineUsersCount(30, this.HostProfile.HostID) %> users are online now, <%= Incremental.Kick.Caching.UserCache.GetOnlineUsersCount(1440, this.HostProfile.HostID) %> were on today.
</strong></em></span>
   

    <Kick:UserList id="UserOnlineList" runat="server" />
    
    <uc1:KickSpy id="KickSpy1" runat="server" />
</asp:Content>

<asp:Content ID="RightContentOutline" ContentPlaceHolderID="RightContent" runat="server">
   
    <uc1:Shoutbox ID="Shoutbox" runat="server" />

</asp:Content>