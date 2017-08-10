@collections
Feature: User Collections

    Users want to be able to view a set of pipelines that they most care about. These
    pipelines can be grouped into collections that these users own and maintain.

    Collections can be modified to include and exclude pipelines over their lifetimes.
    These collections can also be shared between users, such as teammates sharing
    collections they're responsible for.

    Rules:
        - Collections are unique by name and owner

    Background:
        Given an existing repository with these users and permissions:
            | name          | permission  |
            | calvin        | admin       |
#            | miss wormwood | no access   |
        And an existing pipeline with that repository

    @ignore
    Scenario: Create New Collection
        And "calvin" is logged in
        When they create a new "myCollection" collection with that pipeline
        Then they can see that collection
        And the collection contains that pipeline

    @ignore
    Scenario: Update Existing Collection
        And "calvin" is logged in
        When they create a new "myCollection"
        Then they can see that collection
        And the collection is empty
        When they update the "myCollection" collection with the pipeline
        Then they can see that collection
        And the collection contains that pipeline

    @ignore
    Scenario: Listing A User's Collection
        And "calvin" is logged in
        And they have a collection "myCollection"
        And they have a collection "anotherCollection"
        When they fetch all their collections
        Then they can see those collections

    @ignore
    Scenario: Deleting A Collection
        And "calvin" is logged in
        And they have a collection "myCollection"
        When they delete that collection
        Then that collection no longer exists
