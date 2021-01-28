<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
use \Bitrix\Main\Localization\Loc;

$arComponentDescription = array(
    "NAME" => Loc::getMessage("SINGLE_GROUP_OF_USERS_COMPONENT_NAME"),
    "DESCRIPTION" => Loc::getMessage("SINGLE_GROUP_OF_USERS_COMPONENT_DESCRIPTION"),
    "PATH" => array(
        "ID" => "tasks"
    )
);