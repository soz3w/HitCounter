<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HitCounter.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id ="hitCount" style ="font-size:200px;"></div>
    </div>
    </form>
    <script src="Scripts/jquery-1.6.4.js"></script>
    <script src="Scripts/jquery.signalR-2.2.0.js"></script>

    <script type="text/javascript">
        $(function () {
            var con = $.hubConnection();
            var hub = con.createHubProxy('hitCounter');
            hub.on('onHitRecorded', function (i) {
                $('#hitCount').text(i);
            });
            con.start(function () {
                hub.invoke('recordHit');
            });
          

        });
    </script>
</body>
</html>
