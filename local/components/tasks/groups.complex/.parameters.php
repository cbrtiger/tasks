<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
use \Bitrix\Main\Localization\Loc;

$arComponentParameters = array(
    "PARAMETERS" => array(
        "VARIABLE_ALIASES" => array(
            "GROUP_ID" => array("NAME" => Loc::getMessage("GROUP_ID"))
        ),
        "SEF_MODE" => array(
            "groupslist" => array(
                "NAME" => Loc::getMessage("GROUPS_LIST"),
                "DEFAULT" => "",
                "VARIABLES" => array()
            ),
            "groupdetail" => array(
                "NAME" => Loc::getMessage("GROUP_DETAIL"),
                "DEFAULT" => "#GROUP_ID#/",
                "VARIABLES" => array("GROUP_ID")
            )
        )
    )
);