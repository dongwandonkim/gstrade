document.addEventListener('turbolinks:load', () => {
  const copyBtn = document.getElementById('copyBtn');

  copyBtn.addEventListener('click', copyToClipBoard);
});

function copyToClipBoard() {
  var copyText = document.getElementsByClassName('copyToClipboard');

  copyText.value = 'hihi';
  console.log(copyText);
}
