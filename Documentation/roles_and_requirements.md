# Roles and Requirements

Updated 2020-06-04

## Roles

- [Unauthenticated and Unauthorized User (e.g., prospective participant, etc.)](###unauthenticated-and-unauthorized-user)
- [Program Participant](###program-participant)
- [Medical Services Provider (e.g., EMS, ED Staff, etc.)](###medical-services-provider)
- [Patient Agent (Primary Care Physician, Power of Attorney (POA) agent, etc.)](###patient-agent)
- [System Administrator](###system-administrator)

## User Stories (Functional Requirements)

### Unauthenticated and Unauthorized User

- As an unauthenticated and unauthorized user, I want access to an informative Landing page, so I can learn about the Letter of Life (LOL) program.
- As an unauthenticated and unauthorized user, I want access to an informative About page, so I can learn about the LOL program.
- As an unauthenticated and unauthorized user, I want access to a Contact page, so I can solicit information about the LOL program or contact the System Administrator about an issue.
- As an unauthenticated and unauthorized user, I want access to a secure Registration page, so I can enroll in the Letter of Life program.

### Program Participant

- As a registered, authenticated, and authorized Program Participant, I want to access my LOL via a Login Page, so unauthenticated and unauthorized users cannot access my medical history.
- As a registered, authenticated, and authorized Program Participant, I want to add my LOL information to the database via an online form, so medical personnel can have access to my medical history in case of an emergency.
- As a registered, authenticated, and authorized Program Participant, I want to view my LOL information via an online form, so I can validate my information or print my LOL.
- As a registered, authenticated, and authorized Program Participant, I want to edit my LOL information via an online form, so I can ensure my medical history is up to date.
- As a registered, authenticated, and authorized Program Participant, I want to delete my LOL information from the database via an online form, so I may stop participating in the program.
- As a registered, authenticated, and authorized Program Participant, I want to print a barcode or quick response (QR) code with a link to my LOL (which I may affix to a bracelet, card, or necklace), so medical personnel can quickly access my medical history in case of an emergency.
- As a registered, authenticated, and authorized Program Participant, I want access to a secure Contact page, so I can contact my Patient Advocate (if designated) and/or the System Administrator about an issue.

### Medical Services Provider

- As a registered, authenticated, and authorized Medical Services Provider, I want to access the LOL system via a Login Page, so unauthenticated and unauthorized users cannot access a patient's medical history.
- As a registered, authenticated, and authorized Medical Services Provider, I want to edit my profile information via an online form, so I can ensure my information is up to date.
- As a registered, authenticated, and authorized Medical Services Provider, I want to search for patients on a laptop or mobile device via an online form, so I can retrieve their medical history and provide correct medical care.
- As a registered, authenticated, and authorized Medical Services Provider, I want to search for a patient by scanning a barcode or quick response (QR) code, using a mobile device or authorized accessory, so I can retrieve their medical history and provide correct medical care.
- As a registered, authenticated, and authorized Medical Services Provider, I want to view a patient's medical history on a laptop or mobile device via an online form, so I can provide correct medical care.
- As a registered, authenticated, and authorized Medical Services Provider, I want to print a MIEMSS-approved Short Form, populated with my patient's information, so I can provide non-system medical facilities and staff with my patient's medical history.
- As a registered, authenticated, and authorized Medical Services Provider, I want access to a secure Contact page, so I can contact the System Administrator about an issue.

### Patient Agent

- As a registered, authenticated, and authorized Patient Agent, I want to access the LOL system via a Login Page, so unauthenticated and unauthorized users cannot access the medical history of my patients.
- As a registered, authenticated, and authorized Patient Agent, I want to edit my profile information via an online form, so I can ensure my information is up to date.
- As a registered, authenticated, and authorized Patient Agent, I want to search for patients on a laptop or mobile device via an online form, so I can view, edit, and print patient information, as necessary.
- As a registered, authenticated, and authorized Patient Agent, I want to search for a patient by scanning a barcode or quick response (QR) code, using a mobile device or authorized accessory, so I can view, edit, and print patient information, as necessary.
- As a registered, authenticated, and authorized Patient Agent, I want to view the LOL information of my patients via an online form, so I can validate their information or print their LOL.
- As a registered, authenticated, and authorized Patient Agent, I want to edit the LOL information of my patients via an online form, so I can ensure their medical history is up to date.
- As a registered, authenticated, and authorized Patient Agent, I want to print a barcode or quick response (QR) code with a link to my patient's LOL (which I may affix to a bracelet, card, or necklace), so medical personnel can quickly access their medical history in case of an emergency.
- As a registered, authenticated, and authorized Patient Agent, I want access to a secure Contact page, so I can contact the System Administrator about an issue.

### System Administrator

- As a registered, authenticated, and authorized System Administrator, I want to access the LOL system via a Login Page, so unauthenticated and unauthorized users cannot access patient medical history or user account information.
- As a registered, authenticated, and authorized System Administrator, I want to search for user accounts on a laptop or mobile device via an online form, so I can add, view, edit, and delete user accounts, as necessary.
- As a registered, authenticated, and authorized System Administrator, I want to add accounts for Medical Services Providers and Patient Advocates, so I can limit non-patient access to patient information.
- As a registered, authenticated, and authorized System Administrator, I want to view accounts for Medical Services Providers and Patient Advocates, so I can validate their information.
- As a registered, authenticated, and authorized System Administrator, I want to edit accounts for Medical Services Providers and Patient Advocates, so I can ensure their information is up to date.
- As a registered, authenticated, and authorized System Administrator, I want to delete accounts for Medical Services Providers and Patient Advocates, so I can limit non-patient access to patient information.
- As a registered, authenticated, and authorized System Administrator, I want to search for patients on a laptop or mobile device via an online form, so I can add, view, edit, and delete patient information, as necessary.
- As a registered, authenticated, and authorized System Administrator, I want to add accounts for patients, so I can enroll them in the program.
- As a registered, authenticated, and authorized System Administrator, I want to view accounts for patients, so I can validate their information.
- As a registered, authenticated, and authorized System Administrator, I want to edit accounts for patients, so I can ensure their information is up to date.
- As a registered, authenticated, and authorized System Administrator, I want to delete accounts for patients, so I can disenroll them from the program.
- As a registered, authenticated, and authorized System Administrator, I want to view a system error log, so I can inform the development team of problems or issues with the application.
- As a registered, authenticated, and authorized System Administrator, I want to view a system activity log, so I can audit access and use of the system.
- As a registered, authenticated, and authorized System Administrator, I want to a user guide, so I provide users with instructions on how to use the system.

### Non-Functional Requirements:

- As a system, I want to limit Create-Read-Update-Delete (CRUD) access to authenticated and authorized users only, so I may preserve the confidentiality and integrity of Personally Identifiable Information (PII).
- As a system, I want new registrants to verify their accounts via a link sent via email (2FA), so I may mitigate the creation of fake accounts.
- As a system, I want all non-verified accounts to be deleted within 24 hours, so I may prevent database bloating.
- As a system, I want all user input validated, so I may prevent injection and scripting attacks.
- As a system, I want user sessions to timeout within 30 minutes, so I may prevent inadvertent disclosure of PII.
- As a system, I want to limit multi-account access to authorized devices only (MAC Whitelisting), so I may preserve the confidentiality and integrity of PII, as well as the availability of the system.
- As a system, I want the following NIST SP 800-53 controls enforced throughout the application, so I may preserve the confidentiality and integrity of PII, as well as the availability of the system:
  - AC-2: ACCOUNT MANAGEMENT
  - AC-3: ACCESS ENFORCEMENT
  - AC-7: UNSUCCESSFUL LOGON ATTEMPTS
  - AC-8: SYSTEM USE NOTIFICATION
  - AC-11: SESSION LOCK
  - AC-12: SESSION TERMINATION
  - AU-2: AUDIT EVENTS
  - AU-8: TIME STAMPS
  - IA-2: IDENTIFICATION AND AUTHENTICATION (ORGANIZATIONAL USERS)
  - SC-13: CRYPTOGRAPHIC PROTECTION
  - SC-23: SESSION AUTHENTICITY
  - SI-10: INFORMATION INPUT VALIDATION
  - SI-11: ERROR HANDLING
- As a system, I want all SQL queries to use prepared statements, so I can prevent SQL injection attacks.
- As a system, I want all tables to be normalized to 3rd Normal Form, so I can improve data integrity and reduce data redundancy.
- As a system, I want to unit test all functions and methods, so I can ensure boundary conditions are not violated.
- As a system, I want to incorporate static code analysis, using both automated and manual methods, so I can ensure there are no weaknesses due to code syntax.
- As a system, I want to incorporate dynamic code analysis and penetration testing, so I can ensure there are no vulnerabilities due to code semantics.
- As a system, I want to style and comment all code per the appropriate style guide, so I can properly maintain and turn-over the application, as necessary.
- As a system, I want to incorporate version control, so I may audit and track code generation.
- As a system, I want all CRITICAL, HIGH, MEDIUM, and STANDARD issues and risks, identified during static and dynamic analysis, corrected before uploading to a repository, so I can ensure the repository's code meets the bug bar.
- As a system, if a CRITICAL, HIGH, MEDIUM, and STANDARD issue and risk cannot be corrected immediately, I want it recorded in a bug log, so I can ensure the issue or risk is corrected before deployment.
- As a system, I want all presentation code to be HTML5 and W3C compliant, so I can ensure the application provides the same functionality across different platforms.
