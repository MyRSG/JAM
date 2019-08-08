Feature: Add File

  Add file is a basic feature in Content Manager.
  User could create a file in content tree,
  by telling ContentManager where the file comes from.
  We don't consider permission in this feature,
  permission should be in feature permission.

  @CHAZ-1 @OPEN @MANUAL
  Scenario Outline: Admin add a pdf convertible file
    Given user 'Admin' login
    And there is a teamsite <teamsite>
    And there is a folder <folder> in teamsite <teamsite>
    And wokring teamsite is teamsite <teamsite>
    And there is no file <file> in folder <folder>
    When user 'Admin' add file <file> into folder <folder>
    Then file <file> is in folder <folder>
    
    Examples:
      | file         | folder  | format | teamsite |
      | addpptx.pptx | addFile | pptx   | Files    |
      | adddocx.docx | addFile | docx   | Files    |
      | addpdf.pdf   | addFile | pdf    | Files    |

  @CHAZ-1 @OPEN
  Scenario Outline: Admin add a pdf non-convertible file
    Given user 'Admin' login
    And there is a teamsite <teamsite>
    And there is a folder <folder> in teamsite <teamsite>
    And wokring teamsite is teamsite <teamsite>
    And there is no file <file> in folder <folder>
    When user 'Admin' add file <file> into folder <folder>
    Then file <file> is in folder <folder>
    And file <file> version is '0.1'
    And file <file> type is StaticContent
    And file <file> format is <format>
    And file <file> has a thumbnail
    And file <file> has a previewImage
    
    Examples:
      | file           | folder  | format  | teamsite |
      | addtxt.txt     | addFile | txt     | Files    |
      | addjpeg.jpeg   | addFile | jpeg    | Files    |
      | addpng.png     | addFile | png     | Files    |
      | addxlsx.xlsx   | addFile | xlsx    | Files    |

  @ORPHAN
  Scenario Outline: Admin add a video
    Given user 'Admin' login
    And there is a teamsite <teamsite>
    And there is a folder <folder> in teamsite <teamsite>
    And wokring teamsite is teamsite <teamsite>
    And there is no file <file> in folder <folder>
    When user 'Admin' add file <file> into folder <folder>
    Then file <file> is in folder <folder>
    And file <file> version is '0.1'
    And file <file> type is StaticContent
    And file <file> format is <format>
    And file <file> has a thumbnail
    And file <file> has a media link
    
    Examples:
      | file         | folder  | format | teamsite |
      | addmp4.mp4   | addFile | mp4    | Files    |

  @ORPHAN
  Scenario: Admin add a file with auto renaming
    Given user 'Admin' login
    And there is a teamsite 'Files'
    And there is a folder 'autoRename' in teamsite 'Files'
    And there is a file 'rename.txt' in folder 'autoRename'
    When user 'Admin' add file 'rename.txt' into folder 'autoRename' with auto renaming
    Then 'rename (1).txt' is in folder 'autoRename'
