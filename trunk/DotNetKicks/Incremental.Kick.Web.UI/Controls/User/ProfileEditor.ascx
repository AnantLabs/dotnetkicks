<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileEditor.ascx.cs" Inherits="Incremental.Kick.Web.UI.Controls.ProfileEditor" %>
<script type="text/javascript">
function checkEmailExists(sender, args)
{
    StartLoading();
    var context = {sender:sender, args:args, message: "The email already exists, please use another one."};

    ajaxServices.checkEmailExists(args.Value, function(response)
    { response.context = context; checkUserDataCallback(response); });
}
function checkUserDataCallback(response)
{
    if(response.result)
    {
        response.context.sender.innerHTML = response.context.message;
        response.context.args.IsValid = false;
        
        response.context.sender.style.display = '';
    }
    else
        response.context.sender.style.display = 'none';    

    FinishLoading();
}
</script>

<table class="FormTable">
    <tr>
        <td class="FormTitle FormTD">
            Display Gravatar:</td>
        <td class="FormInput FormTD">
            <asp:CheckBox ID="UseGravatar" runat="server" />
            <em class="smallerText">Gravatars are 80x80 images and are provided by this free service: <a href="http://site.gravatar.com/">http://site.gravatar.com/</a></em>
        </td>
    </tr>
    <tr>
        <td class="FormTitle FormTD">Custom Gravatar Email:</td>
        <td class="FormInput FormTD"><asp:TextBox ID="GravatarCustomEmail" runat="server" size="60"></asp:TextBox>
            <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="GravatarCustomEmail"
                Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">You must enter a valid email address</asp:RegularExpressionValidator><br /><span class="FormHelp">(leave blank if you wish to use <em><asp:Label ID="UserEmail" runat="server" /></em>)</span>
</td>
    </tr>
    <!--<tr>
        <td class="FormTitle FormTD">Change Email Address:</td>
        <td class="FormInput FormTD"><asp:TextBox ID="ChangeEmail" runat="server" size="60"></asp:TextBox>
        <span class="ValidationMessage">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage=""
                    ControlToValidate="ChangeEmail" ValidationExpression="^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$"
                    Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:CustomValidator
                        ID="EmailExists" runat="server" ClientValidationFunction="checkEmailExists" ControlToValidate="ChangeEmail"
                        Display="Dynamic" ErrorMessage="The email already exists, please use another one."
                        OnServerValidate="EmailExists_ServerValidate"></asp:CustomValidator></span>
        <br /><span class="FormHelp">We will send a validation email, so please use a real one.<br /><span class="FormHelp">(Your email is currently set to <em><asp:Label ID="CurrentEmail" runat="server" /></em>)</span></td>
    </tr>-->
    <tr>
        <td class="FormTitle FormTD">Location:</td>
        <td class="FormInput FormTD"><asp:TextBox ID="Location" runat="server" size="60"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="FormTitle FormTD">Website:</td>
        <td class="FormInput FormTD"><asp:TextBox ID="WebsiteURL" runat="server" size="60" />
            <asp:RegularExpressionValidator ID="WebsiteValidator" runat="server" ControlToValidate="WebsiteURL"
                Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?">You must enter a valid url</asp:RegularExpressionValidator><br /><span class="FormHelp">eg. <em>http://www.dotnetkicks.com/</em></span></td>
    </tr>
    <tr>
        <td class="FormTitle FormTD">
            Blog:</td>
        <td class="FormInput FormTD"><asp:TextBox ID="BlogUrl" runat="server" size="60" />
            <asp:RegularExpressionValidator ID="BlogValidator" runat="server" ControlToValidate="BlogUrl"
                Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?">You must enter a valid url</asp:RegularExpressionValidator><br /><span class="FormHelp">eg. <em>http://blog.incremental.ie/</em></span></td>
    </tr>
    <tr>
        <td class="FormTitle FormTD">Blog Feed:</td>
        <td class="FormInput FormTD"><asp:TextBox ID="BlogFeedUrl" runat="server" size="60" />
            <asp:RegularExpressionValidator ID="BlogFeedValidator" runat="server" ControlToValidate="BlogFeedUrl"
                Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?">You must enter a valid url</asp:RegularExpressionValidator><br /><span class="FormHelp">eg. <em>http://feeds.feedburner.com/dotnetkicks</em></span></td>
    </tr>
    <tr>
        <td class="FormTitle FormTD">Appear online:</td>
        <td class="FormInput FormTD"><asp:CheckBox ID="AppearOnline" runat="server" />
        <br /><span class="FormHelp">Disable this to prevent other people from seeing your online status</span></td>
    </tr>
    <tr>
        <td class="FormTitle FormTD">Show story thumbnail:</td>
        <td class="FormInput FormTD"><asp:CheckBox ID="ShowStoryThumbnail" runat="server" />
        <br /><span class="FormHelp">Disable this to hide story thumbnails on the homepage</span></td>
    </tr>
    <tr>
        <td class="FormTitle FormTD"></td>
        <td class="FormInput FormTD"><asp:Button ID="UpdateProfile" runat="server" Text="Update Profile" OnClick="UpdateProfile_Click" /></td>
    </tr>
</table>






