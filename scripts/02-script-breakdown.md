
## 1️⃣ Configuration Variables

This portion sets the “inputs” for the script:

$PASSWORD_FOR_USERS defines the default password all new users will receive.

$NUMBER_OF_ACCOUNTS_TO_CREATE tells the script how many users to create.

By adjusting these values, you control the scale and basic password policy for the bulk user creation.


<img width="1076" height="212" alt="Script Part1" src="https://github.com/user-attachments/assets/c555a279-9f5c-4399-87aa-fc2f580ce618" />

---

Initializes a counter variable $count = 1.

The loop will run until the target number of accounts is reached (1000 in this example).

Ensures the script creates exactly the number of accounts specified.


<img width="1264" height="450" alt="Script Part 2" src="https://github.com/user-attachments/assets/65988748-5b9e-48fa-95a6-7249253f06ac" />

---

$firstName and $lastName generate random names.

$username concatenates them like bano.tirel.

$password converts the plaintext password into a secure string, required by Active Directory cmdlets.


<img width="1043" height="413" alt="Script part 3" src="https://github.com/user-attachments/assets/c8161538-ea8f-488e-82ea-165e6de3e220" />

---


New-ADUser creates the actual AD user with:

-GivenName / -Surname → first and last name

-DisplayName / -Name / -EmployeeID → username

-PasswordNeverExpires $true → lab-friendly password policy

-Path → places the user in the _EMPLOYEES OU

-Enabled $true → account is active and ready for login

$count++ increments the loop counter.


<img width="791" height="283" alt="Script part Last" src="https://github.com/user-attachments/assets/6fd9dcc0-ac8b-47c4-8f87-0e541eccc351" />

---

This is a picture of the generatd users in the adictive directory users and computers section, under the users folds

<img width="1922" height="1198" alt="Screenshot 2025-11-20 141714" src="https://github.com/user-attachments/assets/0f012f55-d3d0-45c7-96b6-ee7275ad8083" />






