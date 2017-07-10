PaperTrail.config.track_associations = false

PaperTrail::Version.class_eval do
  def user
    begin
      AcaRails::User.find(whodunnit).login if whodunnit
    rescue
      whodunnit
    end

  end
end