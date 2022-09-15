*** Settings ***
Library                   QWeb
Library                   QForce
Resource                  ../resources/common.robot
Suite Setup               Setup Browser
Suite Teardown            End suite
Default Tags              dev1

*** Test Cases ***
 US-0000006 Test Case
    # Bike Shop App Access
    QWeb.Appstate         Login
    Set Tags              Bike Shop                   US-0000006
    LaunchApp             Bike Shop
    ClickText             Show Navigation Menu
    VerifyText            Home
    ClickText             Home
    ClickText             Show Navigation Menu
    VerifyText            Bikes
    ClickText             Bikes

US-0000007 Test Case
    [Documentation]
    [Tags]                Bike Shop                   US-0000007
    QWeb.Appstate         Login
    ClickText             App Launcher
    LaunchApp             Bike Shop
    ClickText             Show Navigation Menu
    ClickText             Bikes
    #create first test bike
    ClickText             New
    TypeText              *Bike Name                  Trek Bike Test
    PickList              Brand                       Trek
    ClickText             Purchase Date               partial_match=False
    ClickText             Previous Month
    ClickText             1
    #create test purchaser account
    ClickText             Purchaser
    ClickText             New Account
    UseModal              On
    TypeText              Account Name*               Bike Purchaser Test
    TypeText              Phone                       12223334444
    PickList              Type                        Customer
    PickList              Industry                    Environmental
    ClickText             Save                        partial_match=False
    UseModal              Off
    ClickText             Save                        partial_match=False
    ClickText             Close                       partial_match=False
    ClickText             Bike Purchaser Test         partial_match=False
    #create additional test bikes

    VerifyText            Bikes(1)                    Trek Bike Test
    ClickText             New                         Bikes(1)                partial_match=False
    TypeText              *Bike Name                  Salsa Bike Test
    PickList              Brand                       Salsa
    ClickText             Purchase Date               partial_match=False
    ClickText             1
    ClickText             Save & New
    TypeText              *Bike Name                  Marin Bike Test
    PickList              Brand                       Marin
    ClickText             Purchase Date               partial_match=False
    ClickText             Previous Month
    ClickText             Previous Month
    ClickText             1
    ClickText             Save & New
    TypeText              *Bike Name                  Cannondale Bike Test
    PickList              Brand                       Cannondale
    ClickText             Purchase Date               partial_match=False
    ClickText             Previous Month
    ClickText             Previous Month
    ClickText             10
    # ClickText           Save & New                  COMMENTING OUT BECAUSE INTENTIONALLY WRONG
    # TypeText            *Bike Name                  Rad Power Bike Test
    #PickList             Brand                       Rad Power
    # ClickText           Purchase Date               partial_match=False
    # ClickText           Previous Month
    # ClickText           15
    ClickText             Save                        partial_match=False
    ClickText             Close Trek Bike Test

US-0000007 Delete Test Data
    [tags]                Test data
    ClickText             App Launcher
    LaunchApp             Bike Shop
    ClickText             Show Navigation Menu
    ClickText             Accounts
    Set Suite Variable    ${data}                     Bike Purchaser Test
    RunBlock              NoData                      timeout=180s            exp_handler=DeleteAccounts
    # Delete Test Bikes
    ClickText             Show Navigation Menu
    ClickText             Bikes
    Set Suite Variable    ${data}                     Trek Bike Test
    RunBlock              NoData                      timeout=180s            exp_handler=DeleteBikes
    Set Suite Variable    ${data}                     Salsa Bike Test
    RunBlock              NoData                      timeout=180s            exp_handler=DeleteBikes
    Set Suite Variable    ${data}                     Marin Bike Test
    RunBlock              NoData                      timeout=180s            exp_handler=DeleteBikes
    Set Suite Variable    ${data}                     Cannondale Bike Test
    RunBlock              NoData                      timeout=180s            exp_handler=DeleteBikes
    Set Suite Variable    ${data}                     Rad Power Bike Test
    RunBlock              NoData                      timeout=180s            exp_handler=DeleteBikes
    LaunchApp             Sales

Bicycle Object Test
    Setup Browser
    Home
    LaunchApp             Bicycles        #Test will fail at this point until custom tab is created
    ClickText             New                         partial_match=False
    TypeText              *Bicycle Name               Test Bike Record
    PickList              Type                        Road
    ClickText             Save                        partial_match=False
    VerifyField           Bicycle Name                Test Bike Record
    VerifyField           Type                        Road
    ClickText             Show more actions
    ClickText             Delete
    UseModal              On
    ClickText             Delete
    UseModal              Off
