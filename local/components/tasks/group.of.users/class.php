<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
use \Bitrix\Main\GroupTable as Gt;

class GroupOfUsers extends \CBitrixComponent {

    public function getListOfGroups(){
        $groups = array();
        $dbGroups = Gt::getList(array(
            "select" => array("ID","NAME","DESCRIPTION")
        ));

        while($group = $dbGroups -> fetch()){
            $groups[] = $group;
        }

        $arResult['GROUPS_FOUND'] = $groups;
        return $arResult;
    }

    public function executeComponent(){
        if($this->startResultCache()){
            $this->arResult = array_merge($this->arResult,$this->getListOfGroups());
            $this->includeComponentTemplate();
        }
        global $APPLICATION;
        $APPLICATION->SetTitle($this->arParams['HEADING_OF_PAGE']);
    }
}