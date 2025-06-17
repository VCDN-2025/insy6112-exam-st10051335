use patients_ST10051335;

db.patients.insertMany([
    {
        "Patient Name": "Debbie",
        "Patient Surname": "Theart",
        "Date of Birth": new ISODate("1980-03-17")
    },
    {
        "Patient Name": "Thomas",
        "Patient Surname": "Duncan",
        "Date of Birth": new ISODate("1976-08-12")
    }
]);

db.patients.find().pretty();

db.patients.find({
    "Date of Birth": { $gt: new ISODate("1979-01-12") }
}).pretty();
