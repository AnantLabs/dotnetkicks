using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Incremental.Kick.Web.UI.Pages.Admin {
    public partial class Hosts : Incremental.Kick.Web.Controls.KickUIPage {
        protected Hosts() {
            this.RequiresAdministratorRole();
            this.DisplayAds = false;
        }
    }
}