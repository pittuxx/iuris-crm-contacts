require 'spec_helper'

module Iuris::Contacts

	describe ContactsController do 
		set_engine_routes

		context 'user visits contacts path' do
			login_user
			describe 'GET index' do
			
				it 'should get :index' do
					get :index
					expect(response).to be_success
				end
				it 'shoud have a current_user' do
					expect(subject.current_user).to be_instance_of(Iuris::User)
					expect(subject.current_user).to_not be_nil
				end
				it 'renders the contacts#index' do
					get :index
					expect(response).to render_template :index
				end
				it 'has a current_user who is not admin' do
					expect(subject.current_user.admin).to be false
				end
			end
		end

		context 'guest visit contacts path' do
			describe 'GET index' do

				it 'should be redirected to login page' do
					get :index
					expect(subject).to redirect_to new_user_session_path
				end
				it 'does not have a current_user' do
					expect(subject.current_user).to be_nil
				end
			end
		end

		context 'admin visits contacts path' do
			login_admin
			describe 'GET index' do

				it 'has a current_user' do
					expect(subject.current_user).to_not be_nil
				end

				it 'has a current_user who is admin' do
					expect(subject.current_user.admin).to be true
				end

				it 'should be index' do
					get :index
					expect(response).to be_success
				end

				it 'renders the :index view' do
					get :index
					expect(response).to render_template :index
				end
			end
		end

		context 'cancancan' do
			describe 'testing cancancan authorization for user' do
				login_user

				it 'user cannot access other user contacts' do
					# :contact is not created by @user, who is logged in
					FactoryGirl.create(:contact)
					get :show, id: 1
					expect(response).to render_template 'static/403'
				end

				it 'user can access their contacts' do
					FactoryGirl.create(:contact, user_id: @user.id)
					get :show, id: 1
					expect(response).to render_template :show
				end
			end

			describe 'testing cancancan authorization for user' do
				login_admin

				it 'admin can access other user contacts' do
					user = FactoryGirl.create(:user)
					FactoryGirl.create(:contact, user_id: user.id)
					get :show, id: 1
					expect(response).to render_template :show
				end
			end
		end

		context 'CRUD' do
			login_user
			render_views

			before(:each) do
				@contact = FactoryGirl.create(:contact, user_id: @user.id)
			end

			it 'can read' do
				get :show, id: 1
				expect(response.body).to match /#{@contact.first_name}/
			end

			it 'can update' do
				expect(@contact.first_name).to eql 'Mongorito'
    		expect(@contact.company).to eql 'Chundulu Express'
				put :update, :id => @contact.id, :contact => @contact.attributes = { :first_name => "new name", :company => "new company" }
    		expect(response).to redirect_to(@contact)
    		expect(@contact.first_name).to eql 'new name'
    		expect(@contact.company).to eql 'new company'
    		expect(Contact.count).to eq(1)
			end

			it 'can delete' do
				delete :destroy, id: @contact.id
				expect(Contact.count).to eq(0)
			end
		end
	end
end		