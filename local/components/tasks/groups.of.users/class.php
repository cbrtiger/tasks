<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
use \Bitrix\Main\GroupTable as Gt;
use Bitrix\Main\Application;

class GroupOfUsers extends \CBitrixComponent {

    public function getListOfGroups(){
        $groups = array();
        $dbGroups = Gt::getList(array(
            "select" => array("ID","NAME","DESCRIPTION")
        ));

        while($group = $dbGroups -> fetch()){
            $groups[] = $group;
        }


        global $APPLICATION;
        if(strpos($this->arParams['URL_TEMPLATES_GROUPDETAIL'],"?")){
            foreach($groups as $key => $single_group){
                $groups[$key]['DETAIL_GROUP_URL'] = $APPLICATION->GetCurPage() . "?GROUP_ID=" . $single_group['ID'];
            }
        } else {
            foreach($groups as $key => $single_group){
                $groups[$key]['DETAIL_GROUP_URL'] = $APPLICATION->GetCurPage() . $single_group['ID'] . "/";
            }
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