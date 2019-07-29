Feature: Check In File

Scenario Outline:  check in a file
    Given user <user> login 
    And there is a teamsite <teamsite>
    And user <user> can modify file in teamsite <teamsite>
    And there is a folder <folder> in teamsite <teamsite> 
    And there is a file <file> in folder <folder>
    And file owner is user <owner>
    And file <file> is checked out by user <checkout-by>
    When user <user> checkout file <file>
    Then file <file> is checked in

    Examples:
    | user  | owner | checkout-by | file             | folder       | teamsite |
    | chao  | todd  | chao        | checkInFile1.txt | checkInFiles | Files    |
    | todd  | todd  | chao        | checkInFile2.txt | checkInFiles | Files    |
    | admin | todd  | chao        | checkInFile3.txt | checkInFiles | Files    |
