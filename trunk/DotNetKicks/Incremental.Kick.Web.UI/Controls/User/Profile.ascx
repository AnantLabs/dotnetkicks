<%@ Control Language="C#" AutoEventWireup="true" Codebehind="Profile.ascx.cs" Inherits="Incremental.Kick.Web.UI.Controls.Profile" %>
<table class="FormTable">
    <tr>
        <td class="FormTitle FormTD">
            Member Since:</td>
        <td class="FormInput FormTD">
            <%= this.UserProfile.CreatedOn.ToLongDateString()%> <em>(<%= SubSonic.Sugar.Dates.ReadableDiff(this.UserProfile.CreatedOn, DateTime.Now)%>)</em>
        </td>
    </tr>
    <tr>
        <td class="FormTitle FormTD">
            Last Seen:</td>
        <td class="FormInput FormTD">
            <%= SubSonic.Sugar.Dates.ReadableDiff(this.UserProfile.LastActiveOn, DateTime.Now)%> <em><a class="smallerText" href="/whoisonline">Who else is online?</a></em>
        </td>
    </tr>
    <% if (!String.IsNullOrEmpty(this.UserProfile.Location)) { %>
    <tr>
        <td class="FormTitle FormTD">
            Location:</td>
        <td class="FormInput FormTD">
            <%= Server.HtmlEncode(this.UserProfile.Location) %>
        </td>
    </tr>
    <% } %>
    <% if (!String.IsNullOrEmpty(this.UserProfile.WebsiteURL)) { %>
    <tr>
        <td class="FormTitle FormTD">
            Website:</td>
        <td class="FormInput FormTD">
            <a href="<%= Server.HtmlEncode(this.UserProfile.WebsiteURL) %>" nofollow>
                <%= Server.HtmlEncode(this.UserProfile.WebsiteURL) %>
            </a>
        </td>
    </tr>
    <% } %>
    <% if (!String.IsNullOrEmpty(this.UserProfile.BlogURL)) { %>
    <tr>
        <td class="FormTitle FormTD">
            Blog:</td>
        <td class="FormInput FormTD">
            <a href="<%= Server.HtmlEncode(this.UserProfile.BlogURL) %>" nofollow>
                <%= Server.HtmlEncode(this.UserProfile.BlogURL) %>
            </a>
            <% if (!String.IsNullOrEmpty(this.UserProfile.BlogFeedURL)) { %>
            &nbsp; <a href="<%= Server.HtmlEncode(this.UserProfile.BlogFeedURL) %>" nofollow>
                <img src="/static/images/icons/rss.jpg" border="0" width="16" height="16" /></a>
            <% } %>
        </td>
    </tr>
    <% } %>
    <tr>
        <td class="FormTitle FormTD">
        </td>
        <td class="FormInput FormTD">
        </td>
    </tr>
</table>

<% if (this.KickPage.KickUserProfile.UserID == this.UserProfile.UserID) { %>
<table class="FormTable">
    <tr>
        <td class="FormTitle FormTD">
        </td>
        <td class="FormInput FormTD">
            <h2>
                <a href="/users/<%= this.KickPage.KickUserProfile.Username %>/profile/edit">Edit Profile</a></h2>
        </td>
    </tr>
</table>
<% } else { %>
<% if ( this.KickPage.KickUserProfile.IsFriendOf(this.UserProfile.UserID)  )  { %>
   <p><%= this.KickPage.UrlParameters.UserIdentifier %> is your friend!</p>
   <p>
       <asp:LinkButton ID="lnkRemoveFriend" runat="server" OnClick="lnkRemoveFriend_Click">Remove <%= this.KickPage.UrlParameters.UserIdentifier%> as a Friend</asp:LinkButton>
       * not working yet
   </p>
<% } else {%>
    <p>
       <asp:LinkButton ID="lnkAddFriend" runat="server" OnClick="lnkAddFriend_Click">Add <%= this.UserProfile.Username%> as a Friend</asp:LinkButton>
   </p>   
<% } } %>