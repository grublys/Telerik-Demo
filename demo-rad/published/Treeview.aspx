<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Treeview.aspx.cs" Inherits="demo_rad.Treeview" %>
  <%@ Register Assembly="Telerik.Web.UI"
      Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server" />

    <div id="treeview">
        <telerik:RadTreeView ID="RadTreeView1" runat="server">
        </telerik:RadTreeView>
    </div>

    <script type="text/javascript">
        function pageLoad() {
            $.getJSON('http://localhost:3000/contacts.json', function (json) {
                for (var i = 0; i < json.length; i++) {
                    var node = json[i].last_name;
                    var parent = json[i].lead_type;
                    addNode(parent, node);
                }
            });
        }

        function addNode(parent, node) {
            var treeView = $find("<%= RadTreeView1.ClientID %>");
            var hasParent = treeView.findNodeByText(parent);
            if (hasParent == null) {
                treeView.trackChanges();
                var newNodeParent = new Telerik.Web.UI.RadTreeNode();
                newNodeParent.set_text(parent);
                var newNodeChild = new Telerik.Web.UI.RadTreeNode();
                newNodeChild.set_text(node);
                treeView.get_nodes().add(newNodeParent);
                newNodeParent.get_nodes().add(newNodeChild)
                treeView.commitChanges();
            } else {
                treeView.trackChanges();
                var newNode = new Telerik.Web.UI.RadTreeNode();
                newNode.set_text(node);
                hasParent.get_nodes().add(newNode);
                treeView.commitChanges();
            }
        }
    </script>

    <div id="inline_contact_edit_form"></div>


    <div id="buttons">
        <div class="left">
            <a href="Default.aspx" class="large_button gray">Gridview</a>
        </div>
    </div>

</asp:Content>