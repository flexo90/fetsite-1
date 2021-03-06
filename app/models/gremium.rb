# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: gremien
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text
#  typ        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gremium < ActiveRecord::Base
  TYPEN={1=>"offiziell", 2=>"offiziell-temporär", 3 => "inoffiziell",4=>"inoffiziell-tempo"} # Kategorien, im Wesentlichen wichtig für Listung oder nicht Listung
  GESCHLECHT={0=>"saechlich", 1 => "maennlich", 2 => "weiblich"} # Geschlecht des Gremiums zur richtige Deklination
  ART2FALL={0=>"des", 1=>"des",2=>"der"} # Artikel 2.Fall abhängig vom Geschlecht
  attr_accessible :desc, :name, :typ, :geschlecht,:thema_id
  has_many :memberships # Mitgliedschaften bei dem Gremium
  belongs_to :thema # Gehört zu einem Thema
  scope :tabs, -> { where(:typ => [1,3]).order(:typ).order(:name) } # Gremien die in Tabs angezeigt werden (Alle Anderen nur in der Liste
  # Gremium im 2. Fall für die Konstruktion "Mitglied des ... / der ... " 
  def fall2 
    Gremium::ART2FALL[self.geschlecht.to_i].to_s+" "+ self.name.to_s+ ((self.geschlecht.to_i==1||self.geschlecht.to_i==0)? "s":"") 
  end
  
end
