module Github.Object.IssueComment exposing (..)

import Github.Enum.CommentAuthorAssociation
import Github.Enum.CommentCannotUpdateReason
import Github.Enum.ReactionContent
import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.IssueComment
selection constructor =
    Object.object constructor


author : SelectionSet author Github.Object.Actor -> FieldDecoder (Maybe author) Github.Object.IssueComment
author object =
    Object.selectionFieldDecoder "author" [] object (identity >> Decode.maybe)


authorAssociation : FieldDecoder Github.Enum.CommentAuthorAssociation.CommentAuthorAssociation Github.Object.IssueComment
authorAssociation =
    Object.fieldDecoder "authorAssociation" [] Github.Enum.CommentAuthorAssociation.decoder


body : FieldDecoder String Github.Object.IssueComment
body =
    Object.fieldDecoder "body" [] Decode.string


bodyHTML : FieldDecoder String Github.Object.IssueComment
bodyHTML =
    Object.fieldDecoder "bodyHTML" [] Decode.string


bodyText : FieldDecoder String Github.Object.IssueComment
bodyText =
    Object.fieldDecoder "bodyText" [] Decode.string


createdAt : FieldDecoder String Github.Object.IssueComment
createdAt =
    Object.fieldDecoder "createdAt" [] Decode.string


createdViaEmail : FieldDecoder Bool Github.Object.IssueComment
createdViaEmail =
    Object.fieldDecoder "createdViaEmail" [] Decode.bool


databaseId : FieldDecoder (Maybe Int) Github.Object.IssueComment
databaseId =
    Object.fieldDecoder "databaseId" [] (Decode.int |> Decode.maybe)


editor : SelectionSet editor Github.Object.Actor -> FieldDecoder (Maybe editor) Github.Object.IssueComment
editor object =
    Object.selectionFieldDecoder "editor" [] object (identity >> Decode.maybe)


id : FieldDecoder String Github.Object.IssueComment
id =
    Object.fieldDecoder "id" [] Decode.string


issue : SelectionSet issue Github.Object.Issue -> FieldDecoder issue Github.Object.IssueComment
issue object =
    Object.selectionFieldDecoder "issue" [] object identity


lastEditedAt : FieldDecoder (Maybe String) Github.Object.IssueComment
lastEditedAt =
    Object.fieldDecoder "lastEditedAt" [] (Decode.string |> Decode.maybe)


publishedAt : FieldDecoder (Maybe String) Github.Object.IssueComment
publishedAt =
    Object.fieldDecoder "publishedAt" [] (Decode.string |> Decode.maybe)


pullRequest : SelectionSet pullRequest Github.Object.PullRequest -> FieldDecoder (Maybe pullRequest) Github.Object.IssueComment
pullRequest object =
    Object.selectionFieldDecoder "pullRequest" [] object (identity >> Decode.maybe)


reactionGroups : SelectionSet reactionGroups Github.Object.ReactionGroup -> FieldDecoder (Maybe (List reactionGroups)) Github.Object.IssueComment
reactionGroups object =
    Object.selectionFieldDecoder "reactionGroups" [] object (identity >> Decode.list >> Decode.maybe)


reactions : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, content : OptionalArgument Github.Enum.ReactionContent.ReactionContent, orderBy : OptionalArgument Value } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, content : OptionalArgument Github.Enum.ReactionContent.ReactionContent, orderBy : OptionalArgument Value }) -> SelectionSet reactions Github.Object.ReactionConnection -> FieldDecoder reactions Github.Object.IssueComment
reactions fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, content = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "content" filledInOptionals.content (Encode.enum toString), Argument.optional "orderBy" filledInOptionals.orderBy identity ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "reactions" optionalArgs object identity


repository : SelectionSet repository Github.Object.Repository -> FieldDecoder repository Github.Object.IssueComment
repository object =
    Object.selectionFieldDecoder "repository" [] object identity


resourcePath : FieldDecoder String Github.Object.IssueComment
resourcePath =
    Object.fieldDecoder "resourcePath" [] Decode.string


updatedAt : FieldDecoder String Github.Object.IssueComment
updatedAt =
    Object.fieldDecoder "updatedAt" [] Decode.string


url : FieldDecoder String Github.Object.IssueComment
url =
    Object.fieldDecoder "url" [] Decode.string


viewerCanDelete : FieldDecoder Bool Github.Object.IssueComment
viewerCanDelete =
    Object.fieldDecoder "viewerCanDelete" [] Decode.bool


viewerCanReact : FieldDecoder Bool Github.Object.IssueComment
viewerCanReact =
    Object.fieldDecoder "viewerCanReact" [] Decode.bool


viewerCanUpdate : FieldDecoder Bool Github.Object.IssueComment
viewerCanUpdate =
    Object.fieldDecoder "viewerCanUpdate" [] Decode.bool


viewerCannotUpdateReasons : FieldDecoder (List Github.Enum.CommentCannotUpdateReason.CommentCannotUpdateReason) Github.Object.IssueComment
viewerCannotUpdateReasons =
    Object.fieldDecoder "viewerCannotUpdateReasons" [] (Github.Enum.CommentCannotUpdateReason.decoder |> Decode.list)


viewerDidAuthor : FieldDecoder Bool Github.Object.IssueComment
viewerDidAuthor =
    Object.fieldDecoder "viewerDidAuthor" [] Decode.bool