CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];
  config.toolbar = "simple";
  config.skin = 'kama';
  config.extraPlugins='confighelper'; 
  // ... rest of the original config.js  ...
}