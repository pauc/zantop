import Trix from "trix"

// Constrains Trix to the markup config/initializers/action_text.rb will render:
// paragraphs, line breaks, bold, italic and links.
//
// This used to be done in actiontext.scss, by hiding the unwanted toolbar
// buttons with display: none. That only hid them. The keyboard shortcuts still
// worked, and — the part that actually bit — Trix's HTML parser still accepted
// headings, lists, quotes and <pre> from pasted text, so a description pasted
// out of Word arrived full of markup the site has no styles for. Everything
// below changes the editor's configuration instead, which the toolbar, the
// shortcuts and the paste parser are all built from.

// Trix's default block is a <div>. The bulk of the existing content came from
// the old Rails 3.2 app and uses <p>, so emit <p> too rather than adding to the
// handful of <div> paragraphs. Both still render; see the initializer.
Trix.config.blockAttributes.default.tagName = "p"

// Block-level formatting with no styles on this site. Removing the entries
// removes the buttons' behaviour, their shortcuts, and the parser's ability to
// produce them from pasted HTML. bullet/bulletList and number/numberList are
// pairs — bullet.test() reads its list attribute's config, so they go together.
delete Trix.config.blockAttributes.heading1
delete Trix.config.blockAttributes.quote
delete Trix.config.blockAttributes.code
delete Trix.config.blockAttributes.bullet
delete Trix.config.blockAttributes.bulletList
delete Trix.config.blockAttributes.number
delete Trix.config.blockAttributes.numberList

// Strikethrough renders as <del>, which is not in the allowed set either.
delete Trix.config.textAttributes.strike

// No attachments, anywhere. Images on this site are Image records with their
// own variants, ordering and gallery — not files dropped into a description.
// The attach button used to be hidden while direct upload stayed wired up, so a
// pasted or dragged image did upload itself to ActiveStorage and embed a blob
// nothing would ever render. Refusing the file is what actually prevents that,
// and it covers the file picker, drag and drop, and paste alike.
addEventListener("trix-file-accept", (event) => event.preventDefault())

Object.assign(Trix.config.lang, {
  bold: "Negreta",
  italic: "Cursiva",
  link: "Enllaç",
  unlink: "Treure l'enllaç",
  undo: "Desfer",
  redo: "Refer",
  url: "Adreça",
  urlPlaceholder: "Escriu una adreça…"
})

// The toolbar is now a list of what the editor can do, instead of Trix's full
// toolbar with most of it hidden. Kept structurally identical to Trix's own
// markup so trix.css still dresses it.
Trix.config.toolbar.getDefaultHTML = () => {
  const { lang } = Trix.config

  return `
    <div class="trix-button-row">
      <span class="trix-button-group trix-button-group--text-tools" data-trix-button-group="text-tools">
        <button type="button" class="trix-button trix-button--icon trix-button--icon-bold" data-trix-attribute="bold" data-trix-key="b" title="${lang.bold}" tabindex="-1">${lang.bold}</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-italic" data-trix-attribute="italic" data-trix-key="i" title="${lang.italic}" tabindex="-1">${lang.italic}</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-link" data-trix-attribute="href" data-trix-action="link" data-trix-key="k" title="${lang.link}" tabindex="-1">${lang.link}</button>
      </span>

      <span class="trix-button-group trix-button-group--history-tools" data-trix-button-group="history-tools">
        <button type="button" class="trix-button trix-button--icon trix-button--icon-undo" data-trix-action="undo" data-trix-key="z" title="${lang.undo}" tabindex="-1">${lang.undo}</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-redo" data-trix-action="redo" data-trix-key="shift+z" title="${lang.redo}" tabindex="-1">${lang.redo}</button>
      </span>
    </div>

    <div class="trix-dialogs" data-trix-dialogs>
      <div class="trix-dialog trix-dialog--link" data-trix-dialog="href" data-trix-dialog-attribute="href">
        <div class="trix-dialog__link-fields">
          <input type="url" name="href" class="trix-input trix-input--dialog" placeholder="${lang.urlPlaceholder}" aria-label="${lang.url}" data-trix-validate-href required data-trix-input>
          <div class="trix-button-group">
            <input type="button" class="trix-button trix-button--dialog" value="${lang.link}" data-trix-method="setAttribute">
            <input type="button" class="trix-button trix-button--dialog" value="${lang.unlink}" data-trix-method="removeAttribute">
          </div>
        </div>
      </div>
    </div>
  `
}
