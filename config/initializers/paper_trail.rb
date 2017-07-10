PaperTrail.config.track_associations = false

PaperTrail::Version.class_eval do
  def user
    AcaRails::User.find(whodunnit).login if whodunnit
  end
end