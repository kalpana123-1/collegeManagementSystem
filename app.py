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
    mycursor.execute(sql, data)
    myresult = mycursor.fetchall()
    return myresult


# Course Page
@app.route("/courses")
def courses():
    mycursor.execute(
        "select c.id, c.name, c.description, cm.name as courseModeName, cm.mainType as courseMainType, c.totalCredits, c.totalFee, date(c.createdDate) from course c left join courseMode cm on c.courseModeId = cm.id;"  # noqa: E501
    )
    courses = mycursor.fetchall()
    return render_template("course.html", courses=courses)


def getCourseMode():
    sql = "SELECT * FROM coursemode"
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    return myresult


# Add a new course


@app.route("/add_course", methods=["GET", "POST"])
def add_course():
    if request.method == "POST":
        details = request.form
        print(details)
        course_name = details["course_name"]
        description = details["description"]
        credit = details["credit"]
        fee = details["fee"]
        data = [course_name, description, credit, fee]
        sql = "INSERT INTO course(name, description, totalCredits, totalFee) VALUES (%s, %s, %s, %s)"  # noqa: E501
        mycursor.execute(sql, data)
        return redirect("/courses")
    return render_template("add_course.html")


# Display all students
@app.route("/students")
def students():
    mycursor.execute(
        "SELECT p.*, a.* FROM person p left join address a on a.id = p.addressId where p.isStudent = 1"  # noqa: E501
    )
    students = mycursor.fetchall()
    mycursor.close()
    print(students)
    return render_template("students.html", students=students)




# Add a new student
@app.route("/add_student", methods=["GET", "POST"])
def add_student():
    if request.method == "POST":
        details = request.form
        address = [], detail = []
        # student details
        first_name = details["first_name"]
        last_name = details["last_name"]
        email = details["email"]
        phone = details["phone"]
        blood = details["blood"]
        emergency = details["emergency"]
        detail.push(first_name, last_name, email, phone, blood, emergency)
        # address deatils
        addressLine1 = details["addressLine1"]
        address.push(addressLine1)
        addressResult = mycursor.execute(
            "INSERT INTO `address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES (%s, %s, %d, %s, %d, %s, %s)",  # noqa: E501
            (address),
        )
        print(addressResult)
        mycursor.execute(
            "INSERT INTO student(first_name, last_name) VALUES (%s, %s)",
            (first_name, last_name),
        )
        return redirect("/students")
    return render_template("add_student.html")


@app.route("/staff")
def staff():
    mycursor.execute(
        "SELECT p.*, a.* FROM person p left join address a on a.id = p.addressId where p.isStudent = 0"  # noqa: E501
    )
    students = mycursor.fetchall()
    mycursor.close()
    return render_template("staff.html", students=students)


@app.route("/add_staff", methods=["GET", "POST"])
def add_staff():
    if request.method == "POST":
        details = request.form
        first_name = details["first_name"]
        last_name = details["last_name"]
        mycursor.execute(
            "INSERT INTO student(first_name, last_name) VALUES (%s, %s)",
            (first_name, last_name),
        )
        return redirect("/students")
    return render_template("add_staff.html")


if __name__ == "__main__":
    app.run(debug=True)
