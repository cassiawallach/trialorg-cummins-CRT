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
    LaunchApp        Bicycles
    ClickText        New
    TypeText         *Bicycle Name               Test Road Bike
    PickList         Type                        Road
    TypeText         Price                       600
#create new contact for owner (and account)
    ClickText        Owner                       partial_match=False
    ClickText        New Contact
    UseModal         On
    TypeText         First Name                  Test Contact
    TypeText         Last Name                   Test
    ClickText        Account Name*
    ClickText        New Account
    TypeText         Account Name*               Test Account
    ClickText        Save                        anchor=Account Information
    UseModal         Off
    TypeText         Phone                       4444444444
    TypeText         Email                       test@test.com
    ClickText        Save                        anchor=Contact Information
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
    VerifyText       Test Road Bike
    ClickText        Test Road Bike
    ClickText        Show more actions
    ClickText        Delete
    UseModal         On
    ClickText        Delete
    UseModal         Off
    ClickText        Home
