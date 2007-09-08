<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenu.ascx.cs" Inherits="Incremental.Kick.Web.UI.Templates.Default.TopMenu" %>
<%@ Import Namespace="Incremental.Kick.Web.Helpers" %>

<div id="header">

<table width="100%">
    <tr>
        <td>
            <span id="headerLogo">
             &nbsp;<a href="<%=UrlFactory.CreateUrl(UrlFactory.PageName.Home)%>"><%=this.KickPage.HostProfile.SiteTitle%></a></span><span id="headerTagLine"><%=this.KickPage.HostProfile.TagLine%></span>
        </td>
        <td align="right">
            <span id="headerLinks">
                <% if (this.Page.User.Identity.IsAuthenticated) { %>
                <a href="<%=UrlFactory.CreateUrl(UrlFactory.PageName.UserProfile, this.Page.User.Identity.Name)%>">
                    your profile</a>
                
                <% if (this.KickPage.KickUserProfile.IsAdministrator) { %>
                     <a href="<%=UrlFactory.CreateUrl(UrlFactory.PageName.Admin)%>">admin</a>
                 <% } %> 
                    
                <a href="<%=UrlFactory.CreateUrl(UrlFactory.PageName.Logout)%>">logout</a>
                     
                 
                 
                <% } else { %>
                <a href="<%=UrlFactory.CreateUrl(UrlFactory.PageName.Login)%>">login</a> <a href="<%=UrlFactory.CreateUrl(UrlFactory.PageName.Register)%>">
                    register</a>
                <% } %>
                
                <a href="<%=UrlFactory.CreateUrl(UrlFactory.PageName.SubmitStory)%>">submit a story</a>
                
                
                <a href="<%=UrlFactory.CreateUrl(UrlFactory.PageName.About)%>">about</a>
                
                <%=this.BlogLink%>
            </span>
        </td>
    </tr>
</table>

</div>
