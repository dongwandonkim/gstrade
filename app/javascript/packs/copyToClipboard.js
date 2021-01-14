function copyToClipBoard() {
  var copyText = document.getElementById('copyToClipboard');
  copyText.select();
  copyText.setSelectionRange(0, 99999);
  document.execCommand('copy');
  alert('Copied the text: ' + copyText.value);
}
