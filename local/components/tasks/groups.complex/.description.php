<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
use \Bitrix\Main\Localization\Loc;

$arComponentDescription = array(
    "NAME" => Loc::getMessage("GROUPS_COMPLEX_COMPONENT_NAME"),
    "DESCRIPTION" => Loc::getMessage("GROUPS_COMPLEX_COMPONENT_DESCRIPTION"),
    "COMPLEX" => "Y",
    "PATH" => array(
        "ID" => "tasks"
    )
);