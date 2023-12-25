<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kisan_Info.aspx.cs" Inherits="Farmer_Info.Kisan_Info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 272px;
        }
        .auto-style4 {
            width: 272px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            text-align: center;
            font-size: large;
            color: #993399;
            text-decoration: underline;
        }
    </style>
    <%--<script type="text/javascript">
    function SetHiddenField(FarmerId) {
        document.getElementById('<%= hfSelectedFarmerID.ClientID %>').value = FarmerId;
    }
    </script>--%>

</head>
<body>
    <form id="form1" runat="server">
        <div>            
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" colspan="2"><strong>***Farmer Infomation***</strong></td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>District Name</strong></td>
                    <td>
                        <asp:DropDownList ID="ddlDistrict" runat="server" Height="26px" Width="219px" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ControlToValidate="ddlDistrict" ErrorMessage="Please select District" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Branch Name</strong></td>
                    <td>
                        <asp:DropDownList ID="ddlBranch" runat="server" Height="26px" Width="219px" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlBranch" ErrorMessage="Please select Branch" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"><strong>Society Name</strong></td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlSociety" runat="server" Height="26px" Width="219px">
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlSociety" ErrorMessage="Please select Society" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Farmer Name</strong></td>
                    <td>
                        <asp:TextBox ID="FarmerNametxt" runat="server" Width="210px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FarmerNametxt" ErrorMessage="Please enter a Farmer Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Father Name</strong></td>
                    <td>
                        <asp:TextBox ID="FatherNametxt" runat="server" Width="210px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FatherNametxt" ErrorMessage="Please enter a Father Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Village Name</strong></td>
                    <td>
                        <asp:TextBox ID="Villagetxt" runat="server" Width="210px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Villagetxt" ErrorMessage="Please enter a Village Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Gender</strong></td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblGender" ErrorMessage="Please select Gender" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Caste</strong></td>
                    <td>
                        <asp:DropDownList ID="ddlCaste" runat="server">
                            <asp:ListItem Value="0">---Select Caste---</asp:ListItem>
                            <asp:ListItem>General</asp:ListItem>
                            <asp:ListItem>OBC</asp:ListItem>
                            <asp:ListItem>SC</asp:ListItem>
                            <asp:ListItem>ST</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="0" ControlToValidate="ddlCaste" ErrorMessage="Please select Caste" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td><strong>
                        <asp:Button ID="btn_Insert" runat="server" Font-Bold="True" Text="Insert" Width="108px" OnClick="Insert_Click" />
                        </strong>&nbsp; <strong>
                        <asp:Button ID="btn_Update" runat="server" Font-Bold="True" Text="Update" Width="108px" OnClick="btn_Update_Click" />
                        </strong>&nbsp;
<%--                        <asp:Button ID="btn_Delete" runat="server" Font-Bold="True" Text="Delete" Width="108px" />
                        &nbsp;
                        <asp:Button ID="btn_Search" runat="server" Font-Bold="True" Text="Search" Width="108px" />--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>              
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" 
                            RowStyle-BackColor="#F7F6F3" RowStyle-ForeColor="#333333"
                            HeaderStyle-BackColor="#5D7B9D" HeaderStyle-Font-Bold="True" HeaderStyle-ForeColor="White">
                            <Columns>
                                <%--<asp:BoundField DataField="FarmerId" HeaderText="FarmerId" SortExpression="FarmerId" />--%>
                                <asp:BoundField DataField="FarmerName" HeaderText="FarmerName" SortExpression="FarmerName" />
                                <asp:BoundField DataField="FatherName" HeaderText="FatherName" SortExpression="FatherName" />
                                <asp:BoundField DataField="VillageName" HeaderText="VillageName" SortExpression="VillageName" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                <asp:BoundField DataField="Caste" HeaderText="Caste" SortExpression="Caste" />   
                                <asp:BoundField DataField="DistrictName" HeaderText="DistrictName" SortExpression="DistrictName" />
                                <asp:BoundField DataField="DistrictId" HeaderText="DistrictId" Visible="false" />
                                <asp:BoundField DataField="BranchName" HeaderText="BranchName" SortExpression="BranchName" />
                                <asp:BoundField DataField="BranchId" HeaderText="BranchId" Visible="false"  />
                                <asp:BoundField DataField="SocName" HeaderText="SocName" SortExpression="SocName" />
                                <asp:BoundField DataField="SocId" HeaderText="SocId" Visible="false"  />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hfFarmerId" Value='<%# Eval("FarmerId") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowSelectButton="true" />
                                <asp:CommandField ShowDeleteButton="true" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <asp:HiddenField ID="hfFarmerId1" runat="server" />
                <asp:HiddenField ID="hfSelectedFarmerID" runat="server" />
            </table>
        </div>
    </form>
</body>
</html>
