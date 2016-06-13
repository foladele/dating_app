require 'rails_helper'

RSpec.describe Person, type: :model do

	describe 'attributes' do

		it { should respond_to :name}
		it { should respond_to :age}
		it { should respond_to :gender}

	end

	describe 'print name' do	
		it 'gets name' do
			newperson = Person.create(name: 'marla')
			expect(newperson.name).to eq('marla')
			# @people = Person.all
			# expect(@people.find(@newperson.id).name).to eq('marla')
		end

		it 'gets age' do
			newperson = Person.create(age: "24")
			expect(newperson.age).to eq("24")
		end

		it 'search' do
			newperson  = Person.create(gender: "female")
			@people = Person.search(newperson.gender)
			expect(@people.find(newperson.id).gender).to eq("female")
		end
	end

end
