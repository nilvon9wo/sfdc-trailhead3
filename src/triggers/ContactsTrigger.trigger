trigger ContactsTrigger on Contact (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
	fflib_SObjectDomain.triggerHandler(TRIG_ContactsTriggerHandler.class);
}