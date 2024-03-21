# frozen_string_literal: true

class HogesController < ApplicationController
  def show
    html = render_to_string(template: 'hoges/show')

    pdf = html2pdf(html)

    redirect_to "/"
    # send_data pdf, filename: 'post.pdf', type: 'application/pdf'
  end

  private

  # Ferrumを使ってHTMLからPDFを生成
  def html2pdf(html)
    # chromiumへのパスとno-sandbox browserオプションを渡す
    browser = Ferrum::Browser.new(browser_path: '/usr/local/bin/chromium', browser_options: { 'no-sandbox': nil })

    header_html = render_to_string('pdf/header', layout: false)
    footer_html = render_to_string('pdf/footer', layout: false)

    browser.goto("data:text/html,#{html}")

    pdf = browser.pdf(
      format: :A4,
      encoding: :binary,
      display_header_footer: true,
      header_template: header_html,
      footer_template: footer_html,
    )

    browser.quit

    pdf
  end
end
