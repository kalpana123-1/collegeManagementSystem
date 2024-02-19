from flask import Flask, render_template, request, redirect
import mysql.connector

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

app = Flask(__name__, template_folder="template")


# Home Page
@app.route("/")
def login():
    return render_template("login.html")


# Login Page
@app.route("/login", methods=["POST"])
def login_post():
    username = request.form["username"]
    password = request.form["password"]
    data = []
    data.append(username)
    data.append(password)
    myresult = userValidate(data)
    if len(myresult) > 0:
        return render_template("index.html", myresult=myresult)
    else:
        return render_template("login.html", myresult=myresult)


def userValidate(data):
    sql = "SELECT * FROM person where email = %s and password1 = %s and role = 'admin'"
    mycursor1 = mydb.cursor()
    mycursor1.execute(sql, data)
    myresult = mycursor1.fetchall()
    return myresult


# Course Page
@app.route("/courses")
def courses():
    mycursor1 = mydb.cursor()
    mycursor1.execute(
        "select c.id, c.name, c.description, cm.name as courseModeName, cm.mainType as courseMainType, c.totalCredits, c.totalFee, date(c.createdDate) from course c left join courseMode cm on c.courseModeId = cm.id;"
    )
    courses = mycursor1.fetchall()
    return render_template("course.html", courses=courses)


def getCourseMode():
    sql = "SELECT * FROM coursemode"
    mycursor1 = mydb.cursor()
    mycursor1.execute(sql)
    myresult = mycursor1.fetchall()
    return myresult


# Add a new course
@app.route("/add_course", methods=["GET", "POST"])
def add_course():
    if request.method == "POST":
        details = request.form
        # print(details)
        course_name = details["course_name"]
        description = details["description"]
        credit = details["credit"]
        credit = int(credit)
        fee = details["fee"]
        fee = int(fee)
        courseType = details["courseType"]
        courseType = int(courseType)
        duration = int(details["duration"])
        data = [course_name, description, credit, fee, courseType, duration]
        sql = "INSERT INTO course(name, description, totalCredits, totalFee, courseModeId, duration) VALUES (%s, %s, %s, %s, %s, %s)"
        mycursor.execute(sql, data)
        mydb.commit()
    return render_template("add_course.html")


# Display all students
@app.route("/students")
def students():
    mycursor1 = mydb.cursor()
    mycursor1.execute(
        "select p.firstName, p.lastName, p.email, p.password1, p.phone, p.dob, p.emergencyContact, p.bloodGroup, ad.addressLine1, ad.addressLine2, ad.streetNo, ad.city, ad.pinCode, ad.state, ad.country from person p left join address ad on p.addressId = ad.id where p.isStudent = 1"
    )
    students = mycursor1.fetchall()
    mycursor1.close()
    # print(students)
    return render_template("students.html", students=students)


# Add a new student
@app.route("/add_student", methods=["GET", "POST"])
def add_student():
    if request.method == "POST":
        details = request.form
        # address deatils
        addressLine1 = details["addressLine1"]
        addressLine2 = details["addressLine2"]
        streetNo = details["streetNo"]
        city = details["city"]
        pinCode = details["pinCode"]
        state = details["state"]
        country = details["country"]
        address = [addressLine1, addressLine2, streetNo, city, pinCode, state, country]
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
    return render_template("add_student.html")


@app.route("/staff")
def staff():
    mycursor1 = mydb.cursor()
    mycursor1.execute(
        "select p.firstName, p.lastName, p.email, p.password1, p.phone, p.dob, p.emergencyContact, p.bloodGroup, ad.addressLine1, ad.addressLine2, ad.streetNo, ad.city, ad.pinCode, ad.state, ad.country from person p left join address ad on p.addressId = ad.id where p.isStudent = 0"
    )
    students = mycursor1.fetchall()
    mycursor1.close()
    return render_template("staff.html", students=students)


@app.route("/add_staff", methods=["GET", "POST"])
def add_staff():
    if request.method == "POST":
        details = request.form
        # address deatils
        addressLine1 = details["addressLine1"]
        addressLine2 = details["addressLine2"]
        streetNo = details["streetNo"]
        city = details["city"]
        pinCode = details["pinCode"]
        state = details["state"]
        country = details["country"]
        address = [addressLine1, addressLine2, streetNo, city, pinCode, state, country]
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
    return render_template("add_staff.html")


if __name__ == "__main__":
    app.run(debug=True)
