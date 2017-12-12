`mailr`: A very simple bulk email tool.

This tool takes an email template and a data file and send bulk emails. Run
`mailr help` to see usage.

# Email engine

This tool depends on `sendmail`. On Mac OS, if this doesn't work by default,
you can usually make it work with `sudo postfix start`.

To use a real email account, you need to configure postfix accordingly.
Otherwise, we may be able to send mail here, but the email will appear as
"suspicious" because it wasn't properly authenticated.

Sending mail is asynchronous. Once you run this tool with `send`, the mails 
are enqueued for sending. You can monitor your email's "Sent Mail" folder
to get confirmation of sending. If it doesn't happen within a few minutes, run
`mailq` and `mail` to see what the problem may be.

# Templating syntax

The template file is interpeted as a 
[Python format string](https://docs.python.org/2/library/string.html#formatstrings), 
and formatted once for each row of data.

# Data file syntax

It's just CSV with a header row.

