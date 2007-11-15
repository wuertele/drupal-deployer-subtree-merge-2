// $Id$
var fckIsRunning = new Array;
var fckIsLaunching = new Array;
var fckLaunchedTextareaId = new Array;
var fckLaunchedJsId = new Array;
var fckFirstrun = new Array;

function Toggle(js_id, textareaID, textTextarea, TextRTE)
{
  if (!fckIsRunning[js_id])
  {
    if (!fckIsLaunching[js_id])
    {
      fckIsLaunching[js_id] = true;
      eval(js_id + '.ReplaceTextarea();');
    }
    setTimeout("Toggle('" + js_id + "','" + textareaID + "','" + textTextarea + "','" + TextRTE + "');",1000);
    return ;
  }

  var oEditor ;
  if ( typeof( FCKeditorAPI ) != 'undefined' )
  oEditor = FCKeditorAPI.GetInstance( js_id );

  // Get the _Textarea and _FCKeditor DIVs.
  var eTextarea	= document.getElementById( textareaID );
  var eFCKeditor	= document.getElementById( js_id );
  var eFCKeditorDiv	= document.getElementById('fck_' + js_id);
  var text;

  // If the _Textarea DIV is visible, switch to FCKeditor.
  if ( eTextarea.style.display != 'none' )
  {
    document.getElementById('switch_' + js_id).innerHTML = textTextarea;

    // Switch the DIVs display.
    eTextarea.style.display = 'none';
    eFCKeditorDiv.style.display = '';

    text = eTextarea.value;
    if ($('input[@class=teaser-button]').attr('value') == Drupal.t('Join summary')) {
      var val = $('#edit-teaser-js').val();
      if (val && val.length) {
        text = val + '<!--break-->' + text;
      }
    }
    if ( text.length ) {
      oEditor.SetHTML( text, false);
    }

    // This is a hack for Gecko 1.0.x ... it stops editing when the editor is hidden.
    if (oEditor && !document.all)
    {
      if (oEditor.EditMode == FCK_EDITMODE_WYSIWYG)
      oEditor.MakeEditable() ;
    }
    $('div[@class=teaser-button-wrapper]').hide();
    $('#edit-teaser-js').parent().hide();
    $('#edit-teaser-include').parent().show();
  }
  else
  {
    if (fckFirstrun[js_id]) {
      fckFirstrun[js_id] = false;
    }
    document.getElementById('switch_' + js_id).innerHTML = TextRTE;

    var text = oEditor.GetHTML();
    var t = text.indexOf('<!--break-->');
    if (t != -1) {
      $('#edit-teaser-js').val(text.slice(0,t));
      eTextarea.value = text.slice(t+12);
      $('#edit-teaser-js').parent().show();
      $('#edit-teaser-js').attr('disabled', '');
      if ($('input[@class=teaser-button]').attr('value') != Drupal.t('Join summary')) {
        try {$('input[@class=teaser-button]').click();} catch(e) {$('input[@class=teaser-button]').val(Drupal.t('Join summary'));}
      }
    }
    else {
      $('#edit-teaser-js').attr('disabled', 'disabled');
      if ($('input[@class=teaser-button]').attr('value') != Drupal.t('Split summary at cursor')) {
        try {$('input[@class=teaser-button]').click();} catch(e) {$('input[@class=teaser-button]').val(Drupal.t('Split summary at cursor'));}
      }
      // Set the textarea value to the editor value.
      eTextarea.value = text;
    }

    // Switch the DIVs display.
    eTextarea.style.display = '';
    eFCKeditorDiv.style.display = 'none';
    $('div[@class=teaser-button-wrapper]').show();
  }
}

function CreateToggle(elId, jsId, fckeditorOn)
{
  var ta = document.getElementById(elId);
  var ta2 = document.getElementById('fck_' + jsId);

  ta2.value = ta.value;
  ta.parentNode.insertBefore(ta2, ta);
  if (fckeditorOn)
  ta.style.display = 'none';
  else
  ta2.style.display = 'none';
}

// The FCKeditor_OnComplete function is a special function called everytime an
// editor instance is completely loaded and available for API interactions.
function FCKeditor_OnComplete( editorInstance )
{
  fckIsRunning[editorInstance.Name] = true ;
  fckLaunchedTextareaId.push(editorInstance.Config['TextareaID']) ;
  fckLaunchedJsId.push(editorInstance.Name) ;
  fckFirstrun[editorInstance.Name] = true;

  // Enable the switch button. It is disabled at startup, waiting the editor to be loaded.
  document.getElementById('switch_' + editorInstance.Name).style.display = '' ;

  // If the textarea isn't visible update the content from the editor.
  editorInstance.LinkedField.form.onsubmit = function() {
    for( var i = 0 ; i < fckLaunchedJsId.length ; i++ ) {
      if ( document.getElementById( fckLaunchedTextareaId[i] ).style.display == 'none' )
      {
        var text = FCKeditorAPI.GetInstance( fckLaunchedJsId[i] ).GetXHTML();
        var t = text.indexOf('<!--break-->');
        if (t != -1) {
          $('#edit-teaser-js').val(text.slice(0,t));
          document.getElementById( fckLaunchedTextareaId[i] ).value = text.slice(t+12);
        }
        else {
          $('#edit-teaser-js').val('');
          document.getElementById( fckLaunchedTextareaId[i] ).value = text;
          if ($('input[@class=teaser-button]').attr('value') == Drupal.t('Join summary')) {
            try {$('input[@class=teaser-button]').click();} catch(e) {$('input[@class=teaser-button]').val(Drupal.t('Join summary'));}
          }
        }
      }
    }
  }

  $('#edit-teaser-js').attr('disabled', '');
  $('div[@class=teaser-button-wrapper]').hide();
  $('#edit-teaser-js').parent().hide();
  $('#edit-teaser-include').parent().show();

  // -- some hacks for IE
  var oldCheckAndRemovePaddingNode = editorInstance.EditorWindow.parent.FCKDomTools.CheckAndRemovePaddingNode ;

  editorInstance.EditorWindow.parent.FCKDomTools.CheckAndRemovePaddingNode = function( doc, tagName, dontRemove )
  {
    try
    {
      oldCheckAndRemovePaddingNode( doc, tagName, dontRemove ) ;
    }
    catch(e)
    {}
  }

  editorInstance.Events.FireEvent = function( eventName, params )
  {
    try
    {
      return editorInstance.EditorWindow.parent.FCKEvents.prototype.FireEvent.call( this, eventName, params ) ;
    }
    catch(e)
    {}
  }
  // -- some hacks for IE
}

