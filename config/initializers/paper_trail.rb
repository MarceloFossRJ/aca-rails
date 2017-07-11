PaperTrail.config.track_associations = false

PaperTrail::Version.class_eval do
  def user
    begin
      AcaRails::User.find(whodunnit).login if whodunnit
    rescue
      self.whodunnit
    end

  end
end