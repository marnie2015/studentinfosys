require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { address_1: @student.address_1, address_2: @student.address_2, birthdate: @student.birthdate, contact_1: @student.contact_1, contact_2: @student.contact_2, fname: @student.fname, gender: @student.gender, lname: @student.lname, mname: @student.mname, status: @student.status, user_name: @student.user_name, user_pass: @student.user_pass }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { address_1: @student.address_1, address_2: @student.address_2, birthdate: @student.birthdate, contact_1: @student.contact_1, contact_2: @student.contact_2, fname: @student.fname, gender: @student.gender, lname: @student.lname, mname: @student.mname, status: @student.status, user_name: @student.user_name, user_pass: @student.user_pass }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
