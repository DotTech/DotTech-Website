<%@ Page Language="C#" %>
<script runat="server">
    public void Page_Load(object sender, EventArgs e)
    {
        string name = Request.Form["name"];
        string email = Request.Form["email"];
        string message = Request.Form["message"];

        if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(message))
        {
            try
            {
                System.Net.Mail.MailMessage m = new System.Net.Mail.MailMessage();

                m.From = new System.Net.Mail.MailAddress(email);
                m.To.Add(new System.Net.Mail.MailAddress("ruud@dottech.nl"));
                m.Subject = string.Format("Message from {0} (dottech.nl contactform)", name);
                m.Body = string.Format("{0} ({1} has sent you the following message:\r\n\r\n{2}", name, email, message);

                System.Net.Mail.SmtpClient c = new System.Net.Mail.SmtpClient();
                c.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                c.UseDefaultCredentials = true;
                c.Host = "127.0.0.1";
                c.Port = 25;
                c.Send(m);

                Response.Write("OK");
                Response.End();
            }
            catch (Exception)
            {
            }
        }
        
        Response.Write("FAILED");
 }
</script>