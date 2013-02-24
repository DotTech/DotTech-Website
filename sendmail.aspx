<%@ Page Language="C#" %>
<script runat="server">
    public void Page_Load(object sender, EventArgs e)
    {
        string name = Request.Form["name"];
        string email = Request.Form["email"];
        string message = Request.Form["message"];
        string redirect = Request.Form["redirect"];
        
        if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(message))
        {
            System.Net.Mail.MailMessage m = new System.Net.Mail.MailMessage();
            
            m.From = new System.Net.Mail.MailAddress("info@dottech.nl");
            m.To.Add(new System.Net.Mail.MailAddress("ruud@dottech.nl"));
            m.Subject = "Contactformulier dottech.nl";
            m.Body = message;

            System.Net.Mail.SmtpClient c = new System.Net.Mail.SmtpClient();
            // c.Send(m);
        }
 }
</script>