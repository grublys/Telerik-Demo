<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>
    <%@ Register Assembly="Telerik.Web.UI"
        Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server" />

    <div id="description">
        <h2>Demonstration Application: Customer Relations Management System</h2>

        <p>This is a demonstration application designed to help you evaluate Telerik's Test Studio. The application is a skeleton around the metaphor of a Customer Relations Management (CRM) system. You can create new contacts, view existing ones, export the grid to a file, and a number of other actions.</p>
        <p>This CRM application is <strong>not</strong> a real application; it's designed to give you the chance to work with several common problems around automation. This way you'll be able to use Test Studio and see how well it works! You can use the existing Test Studio project under test/TestStudio, or you can create your own.</p>
    </div>

    <h2>RadGrid</h2>
    <telerik:RadGrid ID="RadGrid1" runat="server" PageSize="10" AutoGenerateColumns="false">
        <MasterTableView>
            <Columns>
                <telerik:GridBoundColumn DataField="first_name" HeaderText="First Name" />
                <telerik:GridBoundColumn DataField="last_name" HeaderText="Last Name" />
                <telerik:GridBoundColumn DataField="email" HeaderText="Email" />
                <telerik:GridBoundColumn DataField="linkedin_profile" HeaderText="LinkedIn" />
                <telerik:GridBoundColumn DataField="lead_type" HeaderText="Lead Type" />
                <telerik:GridHyperlinkColumn Text="View Contact" NavigateUrl="#" HeaderText="Action" Target="_blank" />
            </Columns>
        </MasterTableView>

        <ClientSettings>
            <ClientEvents OnCommand="function(){}" />
        </ClientSettings>
    </telerik:RadGrid>

    <script type="text/javascript">
        function pageLoad() {
            $.getJSON('http://localhost:3000/contacts.json', function (json) {
                var mtv = $find("<%= RadGrid1.ClientID %>").get_masterTableView(); mtv.set_dataSource(json); mtv.dataBind();
            });
        }
    </script>

    <br />

    <div id="buttons">
        <div class="left">
            <a href="http://localhost:3000/contacts/new" class="large_button gray" target="_blank">New Contact</a>
            <a href="http://localhost:3000/contacts/treeview" class="large_button gray">Treeview</a>
        </div>

        <div class="right">
            <a href="http://locahost:3000/contacts/export" class="large_button green">Export to PDF</a>
        </div>
    </div>

    <div id="moreInfo">
        <p>Interested in learing more about Test Studio? Visit us at <a href="http://www.telerik.com/automated-testing-tools.aspx">the Test Studio home page.</a> You can also <a href="http://www.telerik.com/automated-testing-tools.aspx">download a fully functional trial of Test Studio</a> complete with our full priority support to help you get started!</p>
    </div>
</asp:Content>
