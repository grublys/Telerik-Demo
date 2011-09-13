module ContactsHelper
  def lead_type_icon(lead_type)
    lead_type_icons = { 'HOT' => 'hot-icon.png',
                        'COLD' => 'cold-icon.png',
                        'NEUTRAL' => 'neutral-icon.png' }
    lead_type_icons[lead_type]
  end
end
