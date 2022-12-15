public class SplitVacationList {
    @auraenabled
    Public static Map<string,string> splitVacationList(){
        /*string ListofVacation=label.Vacation_Types;
list<string>vacations = ListofVacation.split(',');
return vacations;
*/
        List<Vacations__mdt> VacTypes = [select Type_name__C,MasterLabel,developerName from Vacations__mdt];
        Map <string,string> Option =new map<string,string>();
        for (vacations__mdt VType:VacTypes)
        {
            Option.put(Vtype.developerName,VType.Type_name__C);
            
        }
        return option;
        
    }
}