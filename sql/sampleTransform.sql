-- SELECT Name, Surname,
--   JSON_VALUE(jsonCol, '$.info.address.PostCode') AS PostCode,
--   JSON_VALUE(jsonCol, '$.info.address."Address Line 1"') + ' '
--   + JSON_VALUE(jsonCol, '$.info.address."Address Line 2"') AS Address
--   JSON_QUERY(jsonCol, '$.info.skills') AS Skills
-- FROM People
-- WHERE ISJSON(jsonCol) > 0
--   AND JSON_VALUE(jsonCol, '$.info.address.Town') = 'Belgrade'
--   AND Status = 'Active'
-- ORDER BY JSON_VALUE(jsonCol, '$.info.address.PostCode')

DECLARE @json NVARCHAR(MAX);
SET @json = N'[
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith"}, "dob": "2005-11-04T12:00:00"}
]';


SELECT *
FROM OPENJSON(@json)
  WITH (
    id INT 'strict $.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',
    age INT,
    dateOfBirth DATETIME2 '$.dob'
  );