"""Module providing a function printing python version."""
from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector
from constant_values import SUCCESS_CODE, DATA_NOT_FOUND_CODE, SUCCESS, FAILED, BAD_REQUEST

mydb = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="root",
    database="managementsystem",
    port="3306",
)

print(mydb)
mycursor = mydb.cursor()
print(mycursor)

app = Flask(__name__)
CORS(app)


# # Home Page
# @app.route("/")
# def login():
#     return render_template("login.html")


# Login Page
@app.route("/login", methods=["GET"])
def login_get():
    """Function inside"""
    username = request.form.get("username")
    password = request.form.get("password")
    # More Pythonic way to check for non-empty strings
    if username and password:
        data = [username, password]
        myresult = user_validate(data)
        if myresult:
            res = {
                "data": myresult,
                "status": SUCCESS,
                "code": SUCCESS_CODE,
                "message": "Logged in Successfully"
            }
            return jsonify(res)  # Using jsonify for consistency
        else:
            res = {
                "status": FAILED,
                "code": DATA_NOT_FOUND_CODE,
                "message": "Invalid request. Check your email and password."
            }
            return jsonify(res)  # Modified to use jsonify
    else:
        res = {
            "status": FAILED,
            "code": BAD_REQUEST,
            "message": "Please enter all the values."
        }
        return jsonify(res)


def user_validate(data):
    """Function inside"""
    sql = "SELECT * FROM person where email = %s and password1 = %s and role = 'admin'"
    mycursor1 = mydb.cursor()
    mycursor1.execute(sql, data)
    myresult = mycursor1.fetchall()
    return myresult


# Course Page
@app.route("/courses")
def courses():
    """Function inside"""
    mycursor1 = mydb.cursor()
    mycursor1.execute(
        "select c.id, c.name, c.description, cm.name as courseModeName, cm.mainType as courseMainType, c.totalCredits, c.totalFee, date(c.createdDate) from course c left join courseMode cm on c.courseModeId = cm.id;"
    )
    course_list = mycursor1.fetchall()
    res = {
        "data": course_list,
        "status": SUCCESS,
        "code": SUCCESS_CODE,
        "message": "Fetched Details Successfully"
        }
    return jsonify(res)



def getCourseMode():
    """Function inside"""
    sql = "SELECT * FROM coursemode"
    mycursor1 = mydb.cursor()
    mycursor1.execute(sql)
    myresult = mycursor1.fetchall()
    return myresult


# Add a new course
@app.route("/add_course", methods=["POST"])
def add_course():
    """Function inside"""
    details = request.form
    course_name = details["course_name"]
    description = details["description"]
    credit = details["credit"]
    credit = int(credit)
    fee = details["fee"]
    fee = int(fee)
    course_type = details["courseType"]
    course_type = int(course_type)
    duration = int(details["duration"])
    if len(course_name) > 0 and len(description) > 0 and credit > 0 and len(course_type) > 0 and duration > 0:
        data = [course_name, description, credit, fee, course_type, duration]
        sql = "INSERT INTO course(name, description, totalCredits, totalFee, courseModeId, duration) VALUES (%s, %s, %s, %s, %s, %s)"
        mycursor.execute(sql, data)
        mydb.commit()
        res = {
            "status": SUCCESS,
            "code": SUCCESS_CODE,
            "message": "Created Course Successfully"
        }
        return jsonify(res)
    else:
        res = {
                "status": FAILED,
                "code": BAD_REQUEST,
                "message": "Please enter all the values."
            }
        return res
        


# Display all students
@app.route("/students")
def students():
    """Function inside"""
    mycursor1 = mydb.cursor()
    mycursor1.execute(
        "select p.id, p.firstName, p.lastName, p.email, p.password1, p.phone, p.dob, p.emergencyContact, p.bloodGroup, ad.addressLine1, ad.addressLine2, ad.streetNo, ad.city, ad.pinCode, ad.state, ad.country from person p left join address ad on p.addressId = ad.id where p.isStudent = 1"
    )
    student_list = mycursor1.fetchall()
    mycursor1.close()
    # print(students)
    res = {
        "data": student_list,
        "status": SUCCESS,
        "code": SUCCESS_CODE,
        "message": "Fetched Details Successfully"
    }
    return jsonify(res)


# Add a new student
@app.route("/add_student", methods=["POST"])
def add_student():
    """Function inside"""
    if request.method == "POST":
        details = request.form
        # address deatils
        address_line1 = details["addressLine1"]
        address_line2 = details["addressLine2"]
        street_no = details["streetNo"]
        city = details["city"]
        pin_code = details["pinCode"]
        state = details["state"]
        country = details["country"]
        if len(address_line1) > 0 and len(address_line2) > 0 and len(street_no) > 0 and len(city) and len(pin_code) and len(state) and len(country):
            address = [address_line1, address_line2, street_no, city, pin_code, state, country]
            sql = "INSERT INTO address (addressLine1, addressLine2, streetNo, city, pinCode, state, country) VALUES (%s, %s, %s, %s, %s, %s, %s)"
            mycursor.execute(sql, address)
            inserted_id = mycursor.lastrowid
            # student details
            first_name = details["first_name"]
            last_name = details["last_name"]
            email = details["email"]
            phone = details["phone"]
            password = details["password"]
            blood = details["blood"]
            emergency = details["emergency"]
            detail = [
                first_name,
                last_name,
                email,
                password,
                phone,
                emergency,
                blood,
                inserted_id,
            ]
            sql1 = "INSERT INTO person(firstName, lastName, email, password1, phone, dob, emergencyContact, bloodGroup, isStudent, addressId) VALUES (%s, %s, %s, %s, %s, '2000-09-01', %s, %s, '1', %s)"
            mycursor.execute(sql1, detail)
            mydb.commit()
            res = {
            "status": SUCCESS,
            "code": SUCCESS_CODE,
            "message": "Added Student Successfully"
            }
            return jsonify(res)
        else: 
            res = {
                "status": FAILED,
                "code": BAD_REQUEST,
                "message": "Please enter all the values."
            }
            return res


@app.route("/staff")
def staff():
    """Function inside"""
    mycursor1 = mydb.cursor()
    mycursor1.execute(
        "select p.firstName, p.lastName, p.email, p.password1, p.phone, p.dob, p.emergencyContact, p.bloodGroup, ad.addressLine1, ad.addressLine2, ad.streetNo, ad.city, ad.pinCode, ad.state, ad.country from person p left join address ad on p.addressId = ad.id where p.isStudent = 0"
    )
    staff_list = mycursor1.fetchall()
    mycursor1.close()
    res = {
        "data": staff_list,
        "status": SUCCESS,
        "code": SUCCESS_CODE,
        "message": "Fetched Details Successfully"
    }
    return jsonify(res)



@app.route("/add_staff", methods=["POST"])
def add_staff():
    """Function inside"""
    if request.method == "POST":
        details = request.form
        # address deatils
        address_line1 = details["addressLine1"]
        address_line2 = details["addressLine2"]
        street_no = details["streetNo"]
        city = details["city"]
        pin_code = details["pinCode"]
        state = details["state"]
        country = details["country"]
        if (len(address_line1) > 0 and len(address_line2) > 0 and len(street_no) > 0 and len(city) and len(pin_code) and len(state) and len(country)):
            address = [address_line1, address_line2, street_no, city, pin_code, state, country]
            sql = "INSERT INTO address (addressLine1, addressLine2, streetNo, city, pinCode, state, country) VALUES (%s, %s, %s, %s, %s, %s, %s)"
            mycursor.execute(sql, address)
            inserted_id = mycursor.lastrowid
            # student details
            first_name = details["first_name"]
            last_name = details["last_name"]
            email = details["email"]
            phone = details["phone"]
            password = details["password"]
            blood = details["blood"]
            emergency = details["emergency"]
            detail = [
                first_name,
                last_name,
                email,
                password,
                phone,
                emergency,
                blood,
                inserted_id,
            ]
            sql1 = "INSERT INTO person(firstName, lastName, email, password1, phone, dob, emergencyContact, bloodGroup, isStudent, addressId) VALUES (%s, %s, %s, %s, %s, '2000-09-01', %s, %s, '0', %s)"
            mycursor.execute(sql1, detail)
            mydb.commit()
            res = {
                "status": SUCCESS,
                "code": SUCCESS_CODE,
                "message": "Added Student Successfully"
            }
            return jsonify(res)
        else:
            res = {
                "status": FAILED,
                "code": BAD_REQUEST,
                "message": "Please enter all the values."
            }
            return res


@app.route("/departments")
def departments():
    """Function inside"""
    sql = "select d.id, d.name, c.name as courseName, d.description, date(d.createdDate) as createdDate from department d left join course c on d.courseId = c.id group by d.courseId;"
    mycursor.execute(sql)
    department_list = mycursor.fetchall()
    res = {
        "data": department_list,
        "status": SUCCESS,
        "code": SUCCESS_CODE,
        "message": "Fetched Details Successfully"
    }
    return jsonify(res)


# @app.route("/add_department", methods=["POST"])
# def add_course():
#   """Function inside"""
#     if request.method == "POST":
#         details = request.form
#         # print(details)
#         course_name = details["course_name"]
#         description = details["description"]
#         credit = details["credit"]
#         credit = int(credit)
#         fee = details["fee"]
#         fee = int(fee)
#         courseType = details["courseType"]
#         courseType = int(courseType)
#         duration = int(details["duration"])
#         data = [course_name, description, credit, fee, courseType, duration]
#         sql = "INSERT INTO course(name, description, totalCredits, totalFee, courseModeId, duration) VALUES (%s, %s, %s, %s, %s, %s)"
#         mycursor.execute(sql, data)
#         mydb.commit()
#     return render_template("add_course.html")

if __name__ == "__main__":
    app.run(debug=True)
