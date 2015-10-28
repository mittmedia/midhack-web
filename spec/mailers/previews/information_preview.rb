# Preview all emails at http://localhost:3000/rails/mailers/information
class InformationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/information/programme
  def programme
    Information.programme
  end

end
