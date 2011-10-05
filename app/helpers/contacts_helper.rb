module ContactsHelper
  def lead_type_icon(lead_type)
    lead_type_icons = { 'HOT' => 'HOT.png',
                        'COLD' => 'COLD.png',
                        'NEUTRAL' => 'NEUTRAL.png' }
    lead_type_icons[lead_type]
  end
end
