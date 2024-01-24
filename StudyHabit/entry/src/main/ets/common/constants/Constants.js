class CommonConstantsInfo {
    constructor() {
        this.dbName = '';
        this.tableName = '';
        this.columns = [];
    }
}
/**
 * Constants for common style.
 */
export class Constants {
}
Constants.BG_COLOR = Color.Gray;
Constants.PAGE_MARGIN = '5vh';
Constants.PAGE_PADDING = '0';
Constants.RDB_NAME = { dbName: 'taskInfo.db' }; // db name
/** day info table */
Constants.DAY_INFO = {
    tableName: 'dayInfo',
    columns: ['date', 'targetTaskNum', 'finTaskNum']
};
/** global info table */
Constants.GLOBAL_INFO = {
    tableName: 'globalInfo',
    columns: ['id', 'firstDate', 'lastDate', 'checkInDays', 'achievements']
};
/** task info table */
Constants.TASK_INFO = {
    tableName: 'taskInfo',
    columns: [
        'id',
        'date',
        'taskID',
        'targetValue',
        'isAlarm',
        'startTime',
        'endTime',
        'frequency',
        'isDone',
        'finValue',
        'isOpen'
    ]
};
/** form info table */
Constants.FORM_INFO = {
    tableName: 'formInfo',
    columns: ['id', 'formId', 'formName', 'formDimension']
};
// TaskNum
Constants.TASK_NUM = 6;
// THOUSANDTH
Constants.THOUSANDTH_15 = '1.5%'; // ‘1.5%’
Constants.THOUSANDTH_12 = '2.2%'; // ‘2.2%’
Constants.THOUSANDTH_33 = '3.3%'; // ‘3.3%’
Constants.THOUSANDTH_50 = '5%'; // ‘5%’
Constants.THOUSANDTH_66 = '6.6%'; // ‘6.6%’
Constants.THOUSANDTH_80 = '8%'; // ‘8%’
Constants.THOUSANDTH_100 = '10%'; // ‘10%’
Constants.THOUSANDTH_120 = '12%'; // ‘12%’
Constants.THOUSANDTH_160 = '16%'; // ‘16%’
Constants.THOUSANDTH_400 = '40%'; // ‘40%’
Constants.THOUSANDTH_420 = '42%'; // ‘42%’
Constants.THOUSANDTH_500 = '50%'; // ‘50%’
Constants.THOUSANDTH_560 = '56%'; // ‘56%’
Constants.THOUSANDTH_800 = '80%'; // ‘80%’
Constants.THOUSANDTH_830 = '83%'; // ‘83%’
Constants.THOUSANDTH_880 = '88%'; // ‘88%’
Constants.THOUSANDTH_900 = '90%'; // ‘90%’
Constants.THOUSANDTH_940 = '94%'; // ‘90%’
Constants.THOUSANDTH_1000 = '100%'; // ‘100%’
Constants.DEFAULT_2 = 2;
Constants.DEFAULT_6 = 6;
Constants.DEFAULT_8 = 8;
Constants.DEFAULT_12 = 12;
Constants.DEFAULT_10 = 10;
Constants.DEFAULT_16 = 16;
Constants.DEFAULT_18 = 18;
Constants.DEFAULT_20 = 20;
Constants.DEFAULT_24 = 24;
Constants.DEFAULT_28 = 28;
Constants.DEFAULT_32 = 32;
Constants.DEFAULT_48 = 48;
Constants.DEFAULT_56 = 56;
Constants.DEFAULT_60 = 60;
Constants.DEFAULT_100 = 100;
Constants.DEFAULT_180 = 180;
// fontWeight
Constants.FONT_WEIGHT_400 = 400;
Constants.FONT_WEIGHT_500 = 500;
Constants.FONT_WEIGHT_700 = 700;
Constants.FONT_WEIGHT_900 = 900;
// opacity
Constants.OPACITY_4 = 0.4;
Constants.OPACITY_6 = 0.6;
// radius
Constants.BORDER_RADIUS_PERCENT_50 = '50%';
// duration
Constants.AD_DURATION = 5; // 5s
Constants.LAUNCHER_DELAY_TIME = 2000; // 2000ms
Constants.DURATION_1000 = 1000; // 1000ms
Constants.DURATION_800 = 800; // 700ms
Constants.DURATION_100 = 100; // 100ms
// list space
Constants.LIST_ITEM_SPACE = 2;
Constants.SPACE_4 = 4;
// navigation title
Constants.ADD_TASK_TITLE = '添加任务';
Constants.EDIT_TASK_TITLE = '编辑任务';
// prompt message
Constants.SETTING_FINISHED_MESSAGE = '设置完成！！！';
Constants.SETTING_FINISH_FAILED_MESSAGE = '网络连接错误';
Constants.CHOOSE_TIME_OUT_RANGE = '选择时间超出范围';
Constants.NICK_NAME = 'JoIin';
Constants.SIGNATURE = '这是一条简短地个人签';
Constants.HOME_BTN_Z = 2;
// time range
Constants.DEFAULT_TIME = '08:00';
Constants.GET_UP_TIME_RANGE = '(06:00 - 09:00)';
Constants.SLEEP_TIME_RANGE = '(20:00 - 23:00)';
Constants.GET_UP_EARLY_TIME = '06:00';
Constants.GET_UP_LATE_TIME = '09:00';
Constants.SLEEP_EARLY_TIME = '20:00';
Constants.SLEEP_LATE_TIME = '23:00';
// frequency Dialog
Constants.EVERYDAY = '每天';
Constants.NO_LENGTH = 0;
Constants.INIT_WEEK_IDS = '1, 2, 3, 4, 5, 6, 7';
// unit
Constants.PER_DAY = '/ 天';
// global data key
Constants.GLOBAL_KEY = 'global';
// RemindContent
Constants.GET_UP_TASK_NAME = '早起';
Constants.DRINK_TASK_NAME = '喝水';
Constants.EAT_APPLE_TASK_NAME = '吃苹果';
Constants.SMILE_TASK_NAME = '每日微笑';
Constants.BRUSH_TEETH_TASK_NAME = '每日刷牙';
Constants.SLEEP_TASK_NAME = '早睡';
Constants.GET_UP_CONTENT = '该早起啦';
Constants.DRINK_CONTENT = '该喝水啦';
Constants.EAT_APPLE_CONTENT = '该吃苹果啦';
Constants.SMILE_CONTENT = '请保持微笑';
Constants.BRUSH_TEETH_CONTENT = '每日刷牙';
Constants.SLEEP_CONTENT = '早睡';
Constants.H_STORE = 'healthAppStore';
Constants.REMINDER_AGENT_TAG = 'reminderAgent';
Constants.PACKAGE_NAME = 'com.example.healthy_life';
Constants.ENTRY_ABILITY = 'EntryAbility';
// offset
Constants.ZERO = 0;
Constants.MINUS_20 = -20;
Constants.HAS_NO_INDEX = -1;
Constants.OFFSET_24 = -24;
// targetSetting Range
Constants.DRINK_STEP = 25;
Constants.DRINK_MAX_RANGE = 500;
Constants.TIMES_50 = 50;
Constants.TIMES_100 = 100;
Constants.EAT_APPLE_RANGE = 100;
// letter spacing
Constants.LETTER_1 = 0.1;
Constants.LETTER_34 = 3.4;
// achievement
Constants.ACHIEVE_CARD_IMG_HEIGHT = 88;
Constants.ACHIEVE_CARD_TOP = 38;
Constants.ACHIEVE_CARD_BOTTOM = 10;
Constants.ACHIEVE_SPLIT_RATIO = 1 / 3;
Constants.ACHIEVE_TITLE_BAR_LEFT = 20;
Constants.ACHIEVE_TITLE_BAR_TOP = 15;
Constants.FULL_WIDTH = '100%';
Constants.FULL_HEIGHT = '100%';
Constants.WEEK_DAY_NUM = 7; // number days of one week
Constants.WEEK_DAY_TIME = 7 * 24 * 60 * 60 * 1000;
// Card Constants
Constants.TAG = "UpdateFormUtils";
Constants.FORM_PARAM_IDENTITY_KEY = "ohos.extra.param.key.form_identity";
Constants.FORM_PARAM_DIMENSION_KEY = "ohos.extra.param.key.form_dimension";
Constants.FORM_PARAM_NAME_KEY = "ohos.extra.param.key.form_name";
Constants.DEFAULT_DIMENSION_2X2 = 2;
Constants.DEFAULT_DIMENSION_2X4 = 3;
Constants.WIDGET_NAME_AGENCY = "agency";
Constants.WIDGET_NAME_PROGRESS = "progress";
export var TaskType;
(function (TaskType) {
    TaskType["Getup"] = "getup";
    TaskType["Drink"] = "drink";
    TaskType["Apple"] = "apple";
    TaskType["Smile"] = "smile";
    TaskType["Clean"] = "clean";
    TaskType["Sleep"] = "sleep";
})(TaskType || (TaskType = {}));
export var Unit;
(function (Unit) {
    Unit["Liter"] = "L";
    Unit["Pcs"] = "\u4E2A";
    Unit["Times"] = "\u6B21";
    Unit["Empty"] = "";
})(Unit || (Unit = {}));
//# sourceMappingURL=Constants.js.map