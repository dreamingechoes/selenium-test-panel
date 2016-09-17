class Step < ActiveRecord::Base
  belongs_to :case_test

  has_attached_file :screenshot, styles: {
    thumb: '100x100>',
    medium: '1000x1000>'
  }
  validates_attachment :screenshot, content_type: { content_type: "image/png" }

  AVAILABLE_KINDS = {'1': 'Click', '2': 'GetDatalayer'}.freeze

  def load_datalayer
    datalayer.present? ? YAML::load(datalayer).to_s.gsub!("=>", ":").gsub!("nil", "null") : "{}"
  end

  def parse_datalayer(object)
    tmp = {}
    object.each do |element|
      element.each do |k, v|
        tmp[k] = v
      end
    end
    YAML::dump(tmp)
  end

  def get_step_kind
    AVAILABLE_KINDS[:"#{step_number}"]
  end
end
