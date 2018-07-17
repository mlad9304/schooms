require 'rails_helper'

RSpec.describe RoleSelector do

    describe '#call' do
        it 'broadcasts :multirole if there are several roles' do
            service = RoleSelector.new
            expect { service.call(['admin', 'teacher']) }.to broadcast(:multirole)
        end
        it 'broadcasts none if there is no roles' do
            service = RoleSelector.new
            expect { service.call([]) }.to broadcast(:none)
        end
        Role::KINDS.each do |kind|
            it 'broadcasts #{kind} role' do
                service = RoleSelector.new
                expect { service.call([kind]) }.to broadcast(kind.to_sym)
            end
        end

    end
end