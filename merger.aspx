<%@ Page Language="C#" %>
<script runat="server">
    public void Page_Load(object sender, EventArgs e)
    {
        string contents = string.Empty;
        string[] files = 
        {
            "include/css/normalize.css", 
            "include/css/bootstrap.min.css", 
            "include/css/jquery.transitions.css", 
            "include/css/main.css", 
            "include/css/animate.css", 
            "include/css/jquery.fancybox-1.3.4.css", 
            "include/css/light.css", 
            "include/css/red-dark.css"
        };

        foreach (string file in files)
        {
            contents += System.IO.File.ReadAllText(Server.MapPath(file));
        }

        System.IO.File.WriteAllText(Server.MapPath("merged.txt"), contents);
        
        Response.ContentType = "text/plain";
        Response.Write(contents);
    }
</script>