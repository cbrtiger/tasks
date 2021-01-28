<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
use \Bitrix\Main\Localization\Loc;

$arComponentDescription = array(
    "NAME" => Loc::getMessage("GROUP_OF_USERS_COMPONENT_NAME"),
    "DESCRIPTION" => Loc::getMessage("GROUP_OF_USER_COMPONENT_DESCRIPTION"),
    "PATH" => array(
        "ID" => "tasks",
        "NAME" => Loc::getMessage("TASKS_NAMESPACE_AREA")
    )
);