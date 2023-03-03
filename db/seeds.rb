# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Department.create([
    {
        "name" => "Umum"
    },
    {
        "name" => "Gizi"
    }
])

Doctor.create([
    {
        "name" => "Tangguh",
        "specialization" => "Penyakit Dalam",
        "contact" => "081221213323",
        "department_id" => 1
    },
    {
        "name" => "Widodo",
        "specialization" => "Kesmas",
        "contact" => "081222244443",
        "department" => Department.find_by_name("Gizi")
    }
])

Patient.create([
    {
        "name" => "Pani",
        "address" => "MT Haryono",
        "dob" => "2001-10-26",
        "gender" => "female",
        "contact" => "089767888911"
    }
])

MedicalHistory.create([
    {
        "complaint" => "ajnadsaamakdmask",
        "diagnosis" => "andjsandklsadaklda",
        "prescription" => "adfsafaskjdnadnsakdniriq",
        "patient_id" => 1,
        "doctor_id" => 1
    }
])

Schedule.create([
    {
        # "doctor" => Doctor.find_by_name("Tangguh"),
        "doctor_id" => 1,
        "day" => "2023-03-22",
        "start" => "2023-03-22 15:30:00 +7",
        "end" => "2023-03-22 16:30:00 +7"
    }
])

Appointment.create([
    {
        "patient_id" => 1,
        "doctor_id" => 1,
        "schedule_id" => 1,
        "appointment_date" => "2023-03-22",
        "start" => "2023-03-22 15:30:00 +7",
        "end" => "2023-03-22 16:30:00 +7"
    }
])