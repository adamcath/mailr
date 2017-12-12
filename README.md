`mailr`: A very simple bulk email tool.

This tool takes an email template and a data file and send bulk emails. Run
`mailr help` to see usage.

# Example

Step 1: Write at template

```
Dear {name},

How's it going? How is {child_name}?

Well, talk to you soon {name}.

Love,
Me
```

Step 2: Create a data file

```
name,child_name,email
Adam,Maxwell,Adam Cath <acath@somewhere.com>
Stephanie,Maxwell,Stephanie Greer <steph@somewhere.com>
```

Step 3: Create emails

```
$ mailr build \
    --subject "This is a test email" \
    --from "Tester <tester@mailr.tool>" \
    --to-field email \
    template data.csv 
```

Step 4: Review emails

```
$ cat emails/*

From: Tester <tester@mailr.tool>
Subject: This is a test email
To: Adam Cath <acath@somewhere.com>

Dear Adam,

How's it going? How is Maxwell?

Well, talk to you soon Adam.

Love,
Me

From: Tester <tester@mailr.tool>
Subject: This is a test email
To: Stephanie Greer <steph@somewhere.com>

Dear Stephanie,

How's it going? How is Maxwell?

Well, talk to you soon Stephanie.

Love,
Me
```

Step 5: Send them

```
$ mailr send
Mail Delivery Status Report will be mailed to <arc>.
Mail Delivery Status Report will be mailed to <arc>.
```

Step 6: Make sure they went

You can do this by reviewing your mail client's "Sent Mail" folder.

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

