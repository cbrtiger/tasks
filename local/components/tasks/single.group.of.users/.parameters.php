<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
use \Bitrix\Main\Localization\Loc;

$arComponentParameters = array(
    "PARAMETERS" => array(
        "GROUP_IDENTIFIER" => array(
            "NAME" => Loc::getMessage("GROUP_IDENTIFIER"),
            "TYPE" => "STRING",
            "DEFAULT" => "1"
        ),
        "CACHE_TIME" => array("DEFAULT" => 36000000)
    )
);