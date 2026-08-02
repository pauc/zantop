// Loaded by the layout only for signed-in users, so nothing here reaches a
// visitor. ./admin/rich-text imports Trix and narrows its configuration; it is
// first so that no editor is set up before that has happened.
//
// @rails/actiontext is deliberately absent. Its only job is uploading Trix
// attachments to ActiveStorage, and rich-text.js refuses attachments outright.
import "./admin/rich-text"
import RailsUJS from "@rails/ujs"

import "./admin/work-forms"
import "./admin/work-sorting"

RailsUJS.start()
