*** Settings ***
Library              QWeb
Library              QForce
Resource             ../resources/common.robot
Suite Setup          Setup Browser
Suite Teardown       End suite
Default Tags         dev1

*** Test Cases ***
Bicycle Object Test
    Home
    LaunchApp        Bicycles                    #Test will fail at this point until custom tab is created
    ClickText        New                         partial_match=False
    TypeText         *Bicycle Name               Test Bike Record
    PickList         Type                        Road
    ClickText        Save                        partial_match=False
    VerifyField      Bicycle Name                Test Bike Record
    VerifyField      Type                        Road
    ClickText        Show more actions
    ClickText        Delete
    UseModal         On
    ClickText        Delete
    UseModal         Off

Bicycle Repairs Test
    Home
    #create new contact for owner (and account)
    LaunchApp        Contacts
    ClickText        New
    TypeText         First Name                  Test
    TypeText         Last Name                   Contact
    TypeText         Phone                       1112223333
    TypeText         Mobile                      4445556666
    TypeText         Email                       test@test.com
    ClickText        *Account Name
    ClickText        New Account
    UseModal         On
    TypeText         Account Name*               Test Account
    Picklist         Type                        Customer
    PickList         Industry                    Recreation
    ClickText        Save                        anchor=Account Information
    UseModal         Off
    ClickText        Save                        partial_match=False



    LaunchApp        Contacts
    ClickText        New
    TypeText         First Name                  Test
    TypeText         Last Name                   Contact
    ClickText        *Account Name
    ClickText        New Account
    UseModal         On
    TypeText         Account Name*               Test Account
    PickList         Type                        Customer
    PickList         Industry                    Recreation
    ClickText        Save                        anchor=Account Information
    UseModal         Off
    TypeText         Phone                       1112223333
    TypeText         Mobile                      4445556666
    TypeText         Email                       test@test.com
    TypeText         Description                 test data record
    ClickText        Save                        partial_match=False
    ClickText        New                         anchor=3 partial_match=False
    VerifyText       Bicycles
    ClickText        New
    TypeText         *Bicycle Name               Test Bicycle
    PickList         Type                        Road
    TypeText         Price                       600
    ClickText        Save                        partial_match=False

    VerifyText       Details
    VerifyText       Related
    ClickText        Related
    ClickText        New
    MultiPickList    Repair Type                 Wheels
    ClickText        Move selection to Chosen
    MultiPickList    Repair Type                 Breaks
    ClickText        Move selection to Chosen
    MultiPickList    Repair Type                 Frame
    ClickText        Move selection to Chosen
    MultiPickList    Repair Type                 Paint
    ClickText        Move selection to Chosen
    ClickText        Assigned to
    ClickText        Cassia Wallach
    TypeText         *Total Cost                 600
    ClickText        Save & New
    MultiPickList    Repair Type                 Wheels
    ClickText        Move selection to Chosen
    ClickText        Assigned to
    ClickText        Cassia Wallach
    TypeText         *Total Cost                 300
    ClickText        Save                        partial_match=False
    VerifyText       Test Bicycle
    ClickText        Open Test Bicycle Preview
    ClickText        Test Bicycle
    VerifyText       est Contact
    ClickText        Open Test Contact Preview
    ClickText        Test Contact                anchor=ContactTest ContactView Contact Hierarchy
    ClickText        Open Test Account Preview
    ClickText        Test Account
    ClickText        Show more actions
    ClickText        Delete
    UseModal         On
    ClickText        Delete
    ClickText        App Launcher
    LaunchApp        Bicycles
    UseTable         xpath\=//*[@id\='brandBand_19']/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/table[1]
    VerifyTable      r1c2                        Select item 1\nTest Bicycle
    ClickText        Test Bicycle
    ClickText        Show more actions
    ClickText        Delete
    ClickText        Delete
    #Create Bike Record
    LaunchApp        Bicycles
    ClickText        New
    TypeText         *Bicycle Name               Test Bike
    PickList         Type                        Road
    TypeText         Price                       600
    ClickText        Owner                       partial_match=False
    TypeText         Owner                       Test
    VerifyText       Test Contact
    ClickText        Test Contact
    ClickText        Save                        partial_match=False
    #Create Repairs records
    ClickText        Related
    ClickText        New                         partial_match=False anchor=Repairs
    UseModal         On
    MultiPickList    Repair Type                 Wheels
    ClickText        Move selection to Chosen
    MultiPickList    Repair Type                 Breaks
    ClickText        Move selection to Chosen
    MultiPickList    Repair Type                 Frame
    ClickText        Move selection to Chosen
    MultiPickList    Repair Type                 Paint
    ClickText        Move selection to Chosen
    ClickText        Assigned to
    ClickText        Cassia Wallach
    TypeText         *Total Cost                 700
    ClickText        Save & New
    ClickText        Wheels
    MultiPickList    Repair Type                 Wheels
    ClickText        Move selection to Chosen
    ClickText        Assigned to
    ClickText        Cassia Wallach
    TypeText         *Total Cost                 60
    ClickText        Save & New
    MultiPickList    Repair Type                 Breaks
    ClickText        Move selection to Chosen
    ClickText        Assigned to
    ClickText        Cassia Wallach
    TypeText         *Total Cost                 90
    ClickText        Save                        partial_match=False
    UseModal         Off
    ClickText        Details
    #Delete Test Data
    LaunchApp        Accounts
    ClickText        Refresh
    VerifyText       Test Account
    ClickText        Test Account
    ClickText        Show more actions
    ClickText        Delete
    UseModal         On
    ClickText        Delete
    UseModal         Off
    ClickText        Close                       partial_match=False
    LaunchApp        Bicycles
    VerifyText       Test Bike
    ClickText        Test Bike
    ClickText        Show more actions
    ClickText        Delete
    UseModal         On
    ClickText        Delete
    UseModal         Off
    ClickText        Home
