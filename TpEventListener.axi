PROGRAM_NAME='TpEventListener'


#IF_NOT_DEFINED __TP_EVENT_LISTENER__
#DEFINE __TP_EVENT_LISTENER__


#INCLUDE 'TpApi'


/*

Callback signitures below. To subscribe to a callback ensure that the associated
compiler directive is declared prio to the inclusion of this axi.


/**
 * Called when a NFC tag is read.
 */
// #DEFINE INCLUDE_TP_NFC_TAG_READ_CALLBACK
define_function NfcTagRead(integer tagType, char uid[], integer uidLength) {}

/**
 * Called when dynamic resource loads.
 */
// #DEFINE INCLUDE_RESOURCE_LOAD_CALLBACK
define_function TpResourceLoaded(char name[]) {}


*/



define_event

#IF_DEFINED INCLUDE_TP_NFC_TAG_READ_CALLBACK
custom_event[dvTp.number:1:dvTp.system,
		TP_CUSTOM_EVENT_NFC,
		TP_NFC_EVENT_TAG_READ] {
	stack_var integer tagType;
	stack_var integer dataType;
	stack_var integer dataLength;

	tagType = type_cast(custom.value1);
	dataType = type_cast(custom.value2);
	dataLength = type_cast(custom.value3);

	switch (dataType) {
		case TP_NFC_DATA_TYPE_UID:{
			NfcTagRead(tagType, custom.text, dataLength);
		}
		case TP_NFC_DATA_TYPE_CARD_DATA: {
			// not implemented in current firmware
		}
	}

}
#END_IF

#IF_DEFINED INCLUDE_RESOURCE_LOAD_CALLBACK
custom_event[dvTp.number:1:dvTp.system,
		0,
		TP_CUSTOM_EVENT_RESOURCE_LOAD] {
	TpResourceLoaded(custom.text);

}
#END_IF


#END_IF // __TP_EVENT_LISTENER__
