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
    ClickText        New                         partial_match=False
    TypeText         First Name                  Test
    TypeText         Last Name                   Contact
    ClickText        *Account Name
    ClickText        New Account
    UseModal         On
    TypeText         Account Name*               Test Account
    VerifyField      Type
    PickList         Type                        Customer
    PickList         Industry                    Recreation
    ClickText        Save                        anchor=Account Information
    UseModal         Off
    TypeText         Phone                       1112223333
    TypeText         Mobile                      4445556666
    TypeText         Email                       test@test.com
    TypeText         Description                 test data record
    ClickText        Save                        partial_match=False
    #Create Bike Record
    ClickText        Related
    ClickText        New                         anchor=Bicycles(0)
    UseModal         On
    TypeText         *Bicycle Name               Test Bicycle
    PickList         Type                        Road
    TypeText         Price                       600
    ClickText        Save                        partial_match=False
    UseModal         Off
    #Add Repair Records
    ClickText        Test Bicycle
    ClickText        Related
    ClickText        New                         partial_match=False
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
    TypeText         *Total Cost                 1000
    ClickText        Save & New
    MultiPickList    Repair Type                 Paint
    ClickText        Move selection to Chosen
    ClickText        Assigned to
    ClickText        Cassia Wallach
    TypeText         *Total Cost                 500
    ClickText        Save                        partial_match=False
    UseModal         Off
    #Delete Test Data
    ClickText        Details
    ClickText        Show more actions
    ClickText        Delete
    UseModal         On
    ClickText        Delete
    UseModal         Off
    LaunchApp        Accounts
    ClickText        Test Account
    ClickText        Show more actions
    ClickText        Delete
    UseModal         On
    ClickText        Delete
    UseModal         Off
    ClickText        Home