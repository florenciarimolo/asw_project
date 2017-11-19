require 'test_helper'

class IssueListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issue_list = issue_lists(:one)
  end

  test "should get index" do
    get issue_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_issue_list_url
    assert_response :success
  end

  test "should create issue_list" do
    assert_difference('IssueList.count') do
      post issue_lists_url, params: { issue_list: { name: @issue_list.name } }
    end

    assert_redirected_to issue_list_url(IssueList.last)
  end

  test "should show issue_list" do
    get issue_list_url(@issue_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_issue_list_url(@issue_list)
    assert_response :success
  end

  test "should update issue_list" do
    patch issue_list_url(@issue_list), params: { issue_list: { name: @issue_list.name } }
    assert_redirected_to issue_list_url(@issue_list)
  end

  test "should destroy issue_list" do
    assert_difference('IssueList.count', -1) do
      delete issue_list_url(@issue_list)
    end

    assert_redirected_to issue_lists_url
  end
end
