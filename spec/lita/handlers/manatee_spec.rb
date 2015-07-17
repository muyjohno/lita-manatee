require "spec_helper"

describe Lita::Handlers::Manatee, lita_handler: true do
  it { is_expected.to route_command('manatee').to(:manatee) }

  it 'replies' do
    send_command('manatee')
    expect(replies.last).to match("http://calmingmanatee.com/img/manatee")
  end
end
