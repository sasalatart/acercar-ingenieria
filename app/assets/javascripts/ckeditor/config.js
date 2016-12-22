(function() {
  CKEDITOR.editorConfig = function(config) {
    config.language = 'es';
    config.toolbar_Pure = [{
      name: 'document',
      items: ['Source']
    }, {
      name: 'clipboard',
      items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']
    }, {
      name: 'styles',
      items: ['Styles', 'Format', 'Font', 'FontSize']
    }, {
      name: 'colors',
      items: ['TextColor', 'BGColor']
    }, {
      name: 'insert',
      items: ['Table', 'HorizontalRule', 'SpecialChar']
    }, '/', {
      name: 'basicstyles',
      items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
    }, {
      name: 'paragraph',
      items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
    }, {
      name: 'links',
      items: ['Link', 'Unlink', 'Anchor']
    }, {
      name: 'editing',
      items: ['Find', 'Replace', '-', 'SelectAll', '-', 'SpellChecker', 'Scayt']
    }, {
      name: 'tools',
      items: ['Maximize']
    }];
    config.toolbar = 'Pure';
    return true;
  };

}).call(this);
