require 'pdfkit'
Rails.application.config.middleware.use(
  PDFKit::Middleware,
  {
    print_media_type: true
  },
  only: /^\/offers\/(\d)*/
)
