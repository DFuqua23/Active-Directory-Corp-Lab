### This repo provides a more in depth breakdown of the scrip and how it works

## Configuration Variables

At the top of the script, two values are set:<br>
$PASSWORD_FOR_USERS – the password that will be assigned to every new account<br>
$NUMBER_OF_ACCOUNTS_TO_CREATE – how many users the script should generate<br>

These lines control the size of the user group and the default login information for all accounts the script builds.


<img width="1076" height="212" alt="Script Part1" src="https://github.com/user-attachments/assets/c555a279-9f5c-4399-87aa-fc2f580ce618" />

---

The script starts a counter with $count = 1 <br>
It loops until it reaches the total number of accounts you specified  <br>
This makes sure the script only creates exactly the number of users you told it to. No more and no less


<img width="1264" height="450" alt="Script Part 2" src="https://github.com/user-attachments/assets/65988748-5b9e-48fa-95a6-7249253f06ac" />

---

This section is how each user’s info is created <br>
$firstName and $lastName generate random names <br>
$username combines them into a login name <br>
$password converts the plain text password into a SecureString, which is required by Active Directory commands


<img width="1043" height="413" alt="Script part 3" src="https://github.com/user-attachments/assets/c8161538-ea8f-488e-82ea-165e6de3e220" />

---


This last part actually creates the user in Active Directory using the names and username we generated. It puts each user in the Employees OU, sets their password to not expire (for the lab), enables the account, and then goes to the next user in the loop.  <br>

-GivenName / -Surname → first and last name  <br>
-DisplayName, -Name, -EmployeeID → visible username information  <br>
-PasswordNeverExpires $true → keeps passwords simple for lab testing  <br>
-Path → tells AD which OU the user belongs in (_EMPLOYEES)  <br>
-Enabled $true → activates the account so it can log in  <br>

After each user is created, $count++ increases the counter and the loop moves on to the next user.


<img width="791" height="283" alt="Script part Last" src="https://github.com/user-attachments/assets/6fd9dcc0-ac8b-47c4-8f87-0e541eccc351" />

---

This is a picture of the generatd users in the adictive directory users and computers section, under the users folder

<img width="1922" height="1198" alt="Screenshot 2025-11-20 141714" src="https://github.com/user-attachments/assets/0f012f55-d3d0-45c7-96b6-ee7275ad8083" />






