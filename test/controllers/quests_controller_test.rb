require 'test_helper'

class QuestsControllerTest < ActionController::TestCase
  setup do
    @quest = quests(:quest1)
    u = users(:michael)
    session[:user_id] = u.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest" do
    assert_difference('Quest.count') do
      post :create, quest: { description: @quest.description, reward: @quest.reward, title: @quest.title }
    end

    assert_redirected_to profile_path
  end

  test "should show quest" do
    get :show, id: @quest
    assert_response :success
  end


  test "should update quest" do
    patch :update, id: @quest, quest: { description: @quest.description, reward: @quest.reward, title: @quest.title }
    assert_redirected_to quest_path(assigns(:quest))
  end


end
