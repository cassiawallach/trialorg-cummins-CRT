*** Settings ***
Library                   QWeb
Library                   QForce
Resource                  ../resources/common.robot
Suite Setup               Setup Browser
Suite Teardown            End suite
Default Tags              dev1

*** Test Cases ***
Bicycle Object Test
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