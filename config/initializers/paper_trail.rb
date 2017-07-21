PaperTrail.config.track_associations = false
PaperTrail.config.version_limit = 10
PaperTrail::Version.class_eval do
  def user
    begin
      AcaRails::User.find(whodunnit).login if whodunnit
    rescue
      self.whodunnit
    end

  end
end