function rangeAction() {
  if (rangeTwo.value == rangeOne.value) {
    rangeTwo.classList.add('aligned');
  } if (rangeThree.value == rangeOne.value) {
      rangeThree.classList.add('aligned');
    } if (rangeThree.value != rangeOne.value) {
    rangeThree.classList.remove('aligned');
  } if (rangeTwo.value != rangeOne.value) {
    rangeTwo.classList.remove('aligned');
  } if (rangeTwo.value == rangeOne.value &
      rangeThree.value == rangeOne.value) {
    finishPuzzleOne.classList.remove('hidden');
  }
}
function buttonOne() {
  puzzleOne.classList.add('hidden');
  puzzleTwo.classList.remove('hidden');
}
function stepOneButton() {
  stepOne.classList.add('unlocked');
}
function stepTwoButton() {
  if (stepOne.classList.contains('unlocked')) {
    stepTwo.classList.add('unlocked');
  }
}
function stepThreeButton() {
  if (stepTwo.classList.contains('unlocked')) {
    stepThree.classList.add('unlocked');
    finishPuzzleTwo.classList.remove('hidden');
  }
}
function buttonTwo() {
  puzzleTwo.classList.add('hidden');
  puzzleThree.classList.remove('hidden');
}
function buttonThree() {
  if (finalInput.value == 'one two three') {
    puzzleThree.classList.add('hidden');
    celebration.classList.remove('hidden');
  }
}
rangeInputs.onchange = rangeAction;
finishPuzzleOne.onclick = buttonOne;
stepOne.onclick = stepOneButton;
stepTwo.onclick = stepTwoButton;
stepThree.onclick = stepThreeButton;
finishPuzzleTwo.onclick = buttonTwo;
finishPuzzleThree.onclick = buttonThree;
