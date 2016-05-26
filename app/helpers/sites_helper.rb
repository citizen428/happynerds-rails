module SitesHelper
  TAG_MAPPINGS = { ios: "iOS", raspberry: "Raspberry Pi"}.with_indifferent_access

  def title_for(tag)
    TAG_MAPPINGS.fetch(tag) { tag.capitalize }
  end
end
