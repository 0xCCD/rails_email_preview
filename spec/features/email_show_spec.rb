require 'spec_helper'

describe 'email show' do
  url_args = {mail_class: 'auth_mailer_preview', mail_action: 'email_confirmation'}
  it 'shows email' do
    visit rails_email_preview.rep_email_path(url_args)
    expect(page).to have_content('Dummy Email Confirmation')
  end

  it 'shows locale links' do
    visit rails_email_preview.rep_email_path(url_args)
    %w(en es).each do |locale|
      rails_email_preview.rep_email_path(url_args.merge(email_locale: locale))
    end
  end
end
