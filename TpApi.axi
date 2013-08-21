PROGRAM_NAME = 'TpApi'


#IF_NOT_DEFINED __TP_EVENT_LISTENER__
#DEFINE __TP_EVENT_LISTENER__


define_constant

// Touch panel custom event addresses
TP_CUSTOM_EVENT_NFC = 1

// NFC custom events
TP_NFC_EVENT_TAG_READ = 700;

// NFC tag types
TP_NFC_TAG_TYPE_ISO15693 = 1;
TP_NFC_TAG_TYPE_ISO14443A = 2;
TP_NFC_TAG_TYPE_ISO14443B = 3;
TP_NFC_TAG_TYPE_FELICA = 4;

// NFC data payloads
TP_NFC_DATA_TYPE_UID = 0;
TP_NFC_DATA_TYPE_CARD_DATA = 1;


/**
 * Shows a popup on the current page.
 *
 * @param	tp			the device to show the popup page on
 * @param	popupName	the name of the popup page to show
 */
define_function showPopup(dev tp, char popupName[]) {
	send_command tp, "'@PPN-', popupName";
}

/**
 * Shows a popup page.
 *
 * @param	tp			the device to show the popup page on
 * @param	popupName	the name of the popup page to show
 * @param	pageName	the name of the page to show the popup on
 */
define_function showPopupEx(dev tp, char popupName[], char pageName[]) {
	send_command tp, "'@PPN-', popupName, ';', pageName";
}

/**
 * Hides a popup on the current page.
 *
 * @param	tp			the device to hide the popup page on
 * @param	popupName	the name of the popup page to show
 */
define_function hidePopup(dev tp, char popupName[]) {
	send_command tp, "'@PPF-', popupName";
}

/**
 * Hides a popup page.
 *
 * @param	tp			the device to hide the popup page on
 * @param	popupName	the name of the popup page to show
 * @param	pageName	the name of the page to show the popup on
 */
define_function hidePopupEx(dev tp, char popupName[], char pageName[]) {
	send_command tp, "'@PPF-', popupName, ';', pageName";
}

/**
 * Sets the currently displayed page on a touch panel.
 *
 * @param	tp			the device to set the page of
 * @param	name		the name of the page to show
 */
define_function setPage(dev tp[], char name[]) {
	send_command tp, "'PAGE-', name";
}

/**
 * Transition to a page using an internal panel animation.
 *
 * @param	tp			the device to change the page of
 * @param	name		the page to transition to
 * @param	anim		the animation to use
 * @param	origin		the animation origin poin
 * @param	time		the animation time
 */
define_function setPageAnimated(dev tp,
		char name[],
		char anim[],
		integer origin,
		integer time) {
	send_command tp, "'^AFP-', name, ',', anim, ',', itoa(origin), ',',
			itoa(time)";
}

/**
 * Show the internal panel keyboard.
 *
 * @param	tp			the device to show the keyboard on
 * @param	initial		the initial text to show
 * @param	prompt		keyboard prompt text
 */
define_function showKeyboard(dev tp, char initial[], char prompt[]) {
	send_command tp, "'@AKB-', initial, ';', prompt";
}

/**
 * Explicity set a button state.
 *
 * @param	tp			the device containing the button
 * @param	address		the button address
 * @param	state		the state to set
 */
define_function setButtonState(dev tp[], integer address, integer state) {
	send_command tp, "'^ANI-', itoa(address), ',0,', itoa(state), ',0'";
}

/**
 * Set the button position and size.
 *
 * @param	tp			the device containing the button
 * @param	address		the button address
 * @param	x			the button x position in pixels
 * @param	y			the button y position in pixels
 * @param	w			the button width in pixels
 * @param	h			the button height in pixels
 */
define_function setButtonRectangle(dev tp,
		integer address,
		integer x,
		integer y,
		integer w,
		integer h) {
	send_command tp, "'^BMF-', itoa(address), ',0,%R', itoa(x), ',',
			itoa(y), ',', itoa(x + w), ',', itoa(y + h)";
}

/**
 * Set the text rendered by a button.
 *
 * @param	tp			the device containing the button
 * @param	address		the button address
 * @param	text		the text to show
 */
define_function setButtonText(dev tp, integer address, char text[]) {
	send_command tp, "'^TXT-', itoa(address), ',0,', text";
}

/**
 * Plays a sounds file embedded within the TP4 file.
 *
 * @param	name		the name of the sound file to play
 */
 define_function playSound(dev tp, char soundName[]) {
	send_command tp, "'@SOU-', soundName";
 }



#END_IF
