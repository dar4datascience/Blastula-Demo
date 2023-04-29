# Get a nicely formatted date/time string
date_time <- add_readable_time()

# Create an image string using an on-disk
# image file
img_file_path <-
  system.file(
    "img", "pexels-photo-267151.jpeg",
    package = "blastula"
  )

img_string <- add_image(file = img_file_path)

email <-
  compose_email(
    body = md(glue::glue(
      "Hello,

This is a *great* picture I found when looking
for sun + cloud photos:

{img_string}
")),
    footer = md(glue::glue("Email sent on {date_time}."))
  )

em <- outl$create_email(email, subject="Hello from R", to="duquedsealand@gmail.com")

# add an attachment and send it
em$add_attachment(".gitignore")
em$send()


# 
# 
# # Sending email by SMTP using a credentials file
# email %>%
#   smtp_send(
#     to = "jane_doe@example.com",
#     from = "joe_public@example.net",
#     subject = "Testing the `smtp_send()` function",
#     credentials = creds_file("email_creds")
#   )