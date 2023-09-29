// ignore_for_file: constant_identifier_names

class AppLanguage {
  const AppLanguage();

  /// variable name should follow rule 'oneTwo' ==> groupUser
  /// variable value should follow rule 'one-two' ==> group-user

  //main menu
  static const home = 'home';

  static const specialMenu = 'special-menu';
  static const dashboard = 'dashboard';
  static const setupProduct = 'setup-product';
  static const setupMenu = 'setup-menu';
  static const setupFloorPlan = 'setup-floor-plan';
  static const setupSetting = 'setup-setting';

  static const masterData = 'master-data';
  static const purchaseTransaction = 'purchase-transaction';
  static const saleTransaction = 'sale-transaction';
  static const stockTransaction = 'stock-transaction';
  static const staffTransaction = 'staff-transaction';
  static const securityUser = 'security-user';
  static const toppingCategory = 'topping-category';
  static const toppingItem = 'topping-item';

  //form
  //category
  static const category = 'category';

  //product
  static const product = 'product';
  static const unit = 'unit';
  static const cost = 'cost';
  static const reOrder = 're-order';
  static const addProductByCategory = 'add-product-by-category';

  //customer
  static const customer = 'customer';
  static const dob = 'dob';
  static const score = 'score';

  //memberType
  static const memberType = 'member-type';

  //paymentType
  static const paymentType = 'payment-type';

  //gift
  static const gift = 'gift';

  //redeem gift
  static const redeemGift = 'redeem-gift';

  //sale
  static const sale = 'sale';

  //floor
  static const floor = 'floor';

  //table
  static const table = 'table';
  static const qtyChair = 'qty-chair';
  static const tableShape = 'table-shape';

  //main menu
  static const mainMenu = 'main-menu';

  //menu
  static const menu = 'menu';
  static const price = 'price';
  static const discount = 'discount';
  static const addMenuByMainMenu = 'add-menu-by-main-menu';
  static const menuIngredient = 'menu-ingredient';
  static const menuPrinter = 'menu-printer';
  static const menuAllPrinter = 'menu-all-printer';

  //topping
  static const topping = 'topping';

  //purchase
  static const purchase = 'purchase';
  static const payment = 'payment';
  static const expense = 'expense';
  static const categoryExpense = 'category-expense';
  static const pettyCash = 'petty-cash';
  static const purchaseInvoice = 'purchase-invoice';
  static const converted = 'converted';
  static const reference = 'reference';
  static const supplierName = 'supplier-name';
  static const supplierPhone = 'supplier-phone';
  static const description = 'description';
  static const qty = 'qty';
  static const amount = 'amount';
  static const dueDate = 'due_date';
  static const subTotal = 'sub-total';
  static const discountPercent = 'discount-percent';
  static const discountAmount = 'discount-amount';
  static const discountTotal = 'discount-total';
  static const total = 'total';
  static const vat = 'vat';
  static const vatTotal = 'vat-total';
  static const grandTotal = 'grand-total';
  static const amountPaid = 'amount-paid';
  static const amountLeft = 'amount-left';

  //staff transaction
  static const staff = 'staff';
  static const staffPosition = 'staff-position';
  static const borrowAndPay = 'borrow-and-pay';
  static const staffDayOff = 'staff-day-off';
  static const publicHoliday = 'public-holiday';
  static const staffInOut = 'staff-in-out';
  static const staffOT = 'staff-OT';
  static const staffSalary = 'staff-salary';
  static const staffCategory = 'staff-category';
  static const startWork = 'start-work';
  static const extraSalary = 'extra-salary';
  static const qtyWorkHour = 'qty-work-hour';
  static const workHour = 'work-hour';

  //supplier
  static const supplier = 'supplier';

  //ware house stock
  static const warehouse = 'warehouse';
  static const stockIn = 'stock-in';
  static const stockTransfer = 'stock-trasnfer';
  static const stockAdjust = 'stock-adjust';

  //user
  static const user = 'user';
  static const groupUser = 'group-user';

  //general word
  static const quit = 'quit';
  static const confirm = 'confirm';
  static const search = 'search';
  static const setting = 'setting';
  static const general = 'general';
  static const pos = 'pos';
  static const invoice = 'invoice';
  static const device = 'device';
  static const security = 'security';

  static const image = 'image';
  static const phone = 'phone';
  static const address = 'address';
  static const dataIsExist = 'data-is-exist';
  static const dataIsBlank = 'data-is-blank';
  static const view = 'view';
  static const addNew = 'add-new';
  static const edit = 'edit';
  static const delete = 'delete';
  static const export = 'export';
  static const print = 'print';

  static const password = 'password';
  static const save = 'save';
  static const update = 'update';
  static const cancel = 'cancel';

  static const ok = 'ok';
  static const yes = 'yes';
  static const no = 'no';

  static const noOrder = 'no-order';
  static const note = 'note';
  static const createBy = 'create-by';
  static const modifyBy = 'modify-by';
  static const record = 'record';
  static const english = 'english';
  static const khmer = 'khmer';
  static const name = 'name';

  static const date = 'date';
  static const time = 'time';

  //month
  static const january = 'january';
  static const february = 'february';
  static const march = 'march';
  static const april = 'april';
  static const may = 'may';
  static const june = 'june';
  static const july = 'july';
  static const august = 'august';
  static const september = 'september';
  static const october = 'october';
  static const november = 'november';
  static const december = 'december';

  //province
  static const phnomPenh = 'phnom-penh';
  static const banteayMeanchey = 'banteay-meanchey';
  static const battambang = 'battambang';
  static const kampongCham = 'kampong-cham';
  static const kampongChhnang = 'kampong-chhnang';
  static const kampongSpeu = 'kampong-speu';
  static const kampongThom = 'kampong-thom';
  static const kampot = 'kampot';
  static const kandal = 'kandal';
  static const kohKong = 'koh-kong';
  static const kratie = 'kratie';
  static const mondulkiri = 'mondulkiri';
  static const preahVihear = 'preah-vihear';
  static const preyVeng = 'prey-veng';
  static const pursat = 'pursat';
  static const ratanakiri = 'ratanakiri';
  static const siemReap = 'siem-reap';
  static const preahSihanouk = 'preah-sihanouk';
  static const stungTreng = 'stung-treng';
  static const svayRieng = 'svay-rieng';
  static const takeo = 'takeo';
  static const oddarMeanchey = 'oddar-meanchey';
  static const kep = 'kep';
  static const pailin = 'pailin';
  static const tboungKhmum = 'tboung-khmum';

  //general sentence
  static const noInternetConnection = 'no-internet-connection';
  static const doYouWantToDeleteThisRecord =
      'do-you-want-to-delete-this-record';
  static const pleaseSelectDataToDelete = 'please-select-data-to-delete';
  static const pleaseSelectDataToEdit = 'please-select-data-to-edit';
  static const pleaseSelectDataToPrint = 'please-select-data-to-print';
  static const doYouWantToLogOut = 'do-you-want-to-log-out';
  static const noPermissionToUse = 'no-permission-to-use';
  static const checkingInternetConnection = 'checking-internet-connection';
  static const updateShippingToComplete = 'update-shipping-to-complete';
  static const notYetReceipt = 'not-yet-receipt';
  static const alreadyReceipt = 'already-receipt';
  static const savingData = 'saving-data';
  static const updatingData = 'updating-data';
  static const deletingData = 'deleting-data';
  static const failedSavingData = 'failed-saving-data';
  static const failedUpdatingingData = 'failed-updating-data';
  static const failedDeletingingData = 'failed-deleting-data';
  static const dataIsNull = 'data-is-null';

  static const chooseLanguage = 'choose-language';

  static const Map<String, String> mapOfKhmerLanguage = {
    //main menu
    home: 'ទំព័រមុខ',

    specialMenu: 'មីនុយពិសេស',
    dashboard: 'Dashboard',
    setupProduct: 'រៀបចំផលិតផល',
    setupMenu: 'រៀបចំមីនុយ',
    setupFloorPlan: 'រៀបចំជាន់',
    setupSetting: 'រៀបចំការកំណត់',

    masterData: 'ទិន្នន័យមេ',
    purchaseTransaction: 'ប្រតិបត្តិការជាវ',
    saleTransaction: 'ប្រតិបត្តិការលក់',
    stockTransaction: 'ប្រតិបត្តិការឃ្លាំង',
    staffTransaction: 'ប្រតិបត្តិការបុគ្គលិក',
    securityUser: 'សុវត្ថិភាពអ្នកប្រេីប្រាស់',

    //form
    //category
    category: 'ប្រភេទផលិតផល',

    //product
    product: 'ផលិតផល',
    unit: 'ខ្នាត',
    cost: 'ថ្លៃដើម',
    reOrder: 'បញ្ជាទិញឡើងវិញ',
    addProductByCategory: 'បង្កេីតផលិតផលតាមប្រភេទ',

    //floor
    floor: 'ជាន់',

    //table
    table: 'តុ',
    qtyChair: 'ចំនួនកៅអី',
    tableShape: 'រាងតុ',

    //main menu
    mainMenu: 'មីនុយមេ',

    //menu
    menu: 'មីនុយ',
    price: 'តម្លៃ',
    discount: 'បញ្ចុះតម្លៃ',
    addMenuByMainMenu: 'បង្កេីតមីនុយតាមប្រភេទ',
    menuIngredient: 'មីនុយគ្រឿងផ្សំ',
    menuPrinter: 'មីនុយព្រីនធ័រ',
    menuAllPrinter: 'ព្រីនធ័រទាំងអស់',

    //topping
    topping: 'មីនុយបន្ថែម',
    toppingCategory: 'ប្រភេទមីនុយបន្ថែម',
    toppingItem: 'មីនុយបន្ថែម Item',

    //purchase
    purchase: 'ការជាវ',
    payment: 'ការទូទាត់',
    expense: 'ការចំណាយ',
    categoryExpense: 'ប្រភេទការចំណាយ',
    pettyCash: 'ការចំណាយតិចតួច',
    purchaseInvoice: 'វិក្កយបត្រ',
    converted: 'បម្លែង',
    reference: 'ឯកសារយោង',
    supplierName: 'ឈ្មោះអ្នកផ្គត់ផ្គង់',
    supplierPhone: 'លេខទូរសព្ទអ្នកផ្គត់ផ្គង់',
    description: 'ការពិពណ៌នា',
    qty: 'ចំនួន',
    amount: 'ចំនួនទឹកប្រាក់',
    dueDate: 'កាលបរិច្ឆេទ​សង',
    subTotal: 'សរុបរង',
    discountPercent: 'បញ្ចុះតម្លៃភាគរយ',
    discountAmount: 'បញ្ចុះតម្លៃទឹកប្រាក់',
    discountTotal: 'បញ្ចុះតម្លៃសរុប',
    total: 'សរុប',
    vat: 'VAT',
    vatTotal: 'VAT សរុប',
    grandTotal: 'តំលៃ​បូក​សរុប',
    amountPaid: 'ទឹកប្រាក់ដែលបានបង់',
    amountLeft: 'ទឹកប្រាក់ដែលនៅសល់',

    //staff transaction
    staff: 'បុគ្គលិក',
    staffPosition: 'តំណែងបុគ្គលិក',
    borrowAndPay: 'បុគ្គលិកខ្ចីនិងសង',
    staffDayOff: 'បុគ្គលិកឈប់សម្រាក',
    publicHoliday: 'ថ្ងៃឈប់សម្រាកជាតិ',
    staffInOut: 'បុគ្គលិកចូលនិងចេញ',
    staffOT: 'បុគ្គលិកថែមម៉ោង',
    staffSalary: 'ប្រាក់ខែបុគ្គលិក',
    staffCategory: 'ប្រភេទបុគ្គលិក',
    startWork: 'ចាប់ផ្តេីមធ្វេីការ',
    extraSalary: 'ប្រាក់ខែបន្ថែម',
    qtyWorkHour: 'ចំនួនម៉ោងធ្វេីការ',
    workHour: 'ម៉ោងធ្វេីការ',

    //supplier
    supplier: 'អ្នកផ្គត់ផ្គង់',

    //warehouse  stock
    warehouse: 'ឃ្លាំង',
    stockIn: 'ស្តុកចូល',
    stockTransfer: 'ផ្ទេរស្តុក',
    stockAdjust: 'រៀបចំស្តុក',

    //customer

    customer: 'អតិថិជន',
    dob: 'ថ្ងៃកំណេីត',
    score: 'ពិន្ទុ',

    //member type
    memberType: 'ប្រភេទសមាជិក',

    //paymentType
    paymentType: 'ប្រភេទការបង់ប្រាក់',

    //gift
    gift: 'រង្វាន់',

    //redeem gift
    redeemGift: 'ការប្តូរយករង្វាន់',

    //sale
    sale: 'លក់',

    //user
    user: 'អ្នក​ប្រើប្រាស់',
    groupUser: 'ក្រុមអ្នកប្រេីប្រាស់',

    //general word
    confirm: 'រួចរាល់',
    quit: 'ចាកចេញ',
    search: 'ស្វែងរក',
    setting: 'ការកំនត់',
    general: 'ទូទៅ',
    pos: 'POS',
    invoice: 'វិក្កយបត្រ',
    device: 'Device',
    security: 'សុវត្ថិភាព',

    view: 'មើល',
    addNew: 'បន្ថែមថ្មី',
    edit: 'កែប្រែ',
    delete: 'លុបចេញ',
    export: 'នាំចេញ',
    print: 'បោះពុម្ព',
    image: 'រូបថត',
    phone: 'លេខទូរស័ព្ទ',
    address: 'អាស័យដ្ឋាន',
    password: 'លេខសំងាត់',
    save: 'រក្សាទុក',
    update: 'កែប្រែ',
    cancel: 'បោះបង់',
    dataIsBlank: 'មិនអាចទទេ',
    dataIsExist: 'មានរួចរាល់',

    yes: 'បាទ',
    no: 'ទេ',
    ok: 'យល់ព្រម',

    noOrder: '#',
    note: 'សំគាល់',
    createBy: 'បង្កើត',
    modifyBy: 'កែប្រែ',
    record: 'ទិន្នន័យ',
    english: 'អង់គ្លេស',
    khmer: 'ខ្មែរ',
    name: 'ឈ្មោះ',

    date: 'កាលបរិច្ឆេទ',
    time: 'ពេលវេលា',

    //month
    january: 'មករា',
    february: 'កុម្ភៈ',
    march: 'មីនា',
    april: 'មេសា',
    may: 'ឧសភា',
    june: 'មិថុនា',
    july: 'កក្កដា',
    august: 'សីហា',
    september: 'កញ្ញា',
    october: 'តុលា',
    november: 'វិច្ឆិកា',
    december: 'ធ្នូ',

    //province
    phnomPenh: 'ភ្នំពេញ',
    banteayMeanchey: 'បន្ទាយមានជ័យ',
    battambang: 'បាត់ដំបង',
    kampongCham: 'កំពង់ចាម',
    kampongChhnang: 'កំពង់ឆ្នាំង',
    kampongSpeu: 'កំពង់ស្ពឺ',
    kampongThom: 'កំពង់ធំ',
    kampot: 'កំពត',
    kandal: 'កណ្តាល',
    kohKong: 'កោះកុង',
    kratie: 'ក្រចេះ',
    mondulkiri: 'មណ្ឌលគិរី',
    preahVihear: 'ព្រះវិហារ',
    preyVeng: 'ព្រៃវែង',
    pursat: 'ពោធិសាត់',
    ratanakiri: 'រតនគិរី',
    siemReap: 'សៀមរាប',
    preahSihanouk: 'ព្រះសីហនុ',
    stungTreng: 'ស្ទឹងត្រែង',
    svayRieng: 'ស្វាយរៀង',
    takeo: 'តាកែវ',
    oddarMeanchey: 'ឧត្តរមានជ័យ',
    kep: 'កែប',
    pailin: 'ប៉ៃលិន',
    tboungKhmum: 'ត្បូងឃ្មុំ',

    //general sentence
    noInternetConnection: 'គ្មានអ៊ីនធឺេណត',
    doYouWantToDeleteThisRecord: 'តើអ្នកចង់លុបទិន្នន័យនេះទេ',
    pleaseSelectDataToDelete: 'សូមជ្រើសរើសទិន្នន័យដើម្បីលុប',
    pleaseSelectDataToEdit: 'សូមជ្រើសរើសទិន្នន័យដើម្បីកែប្រែ',
    pleaseSelectDataToPrint: 'សូមជ្រើសរើសទិន្នន័យដើម្បីបោះពុម្ព',
    doYouWantToLogOut: 'តើអ្នកចង់ចាកចេញ?',
    noPermissionToUse: 'គ្មានការអនុញ្ញាតប្រើប្រាស់',
    checkingInternetConnection: 'ត្រួតពិនិត្យអ៊ីនធឺេណត',
    updateShippingToComplete: 'កែប្រែការដឹកជញ្ជូន',
    notYetReceipt: 'មិនទាន់ទទួល',
    alreadyReceipt: 'ទទួលរួចហើយ',
    savingData: 'កំពុងរក្សាទុកទិន្នន័យ',
    updatingData: 'កំពុងកែប្រែទិន្នន័យ',
    deletingData: 'កំពុងលុបទិន្នន័យ',
    failedSavingData: 'រក្សាទុកទិន្នន័យបរាជ័យ',
    failedUpdatingingData: 'កែប្រែទិន្នន័យបរាជ័យ',
    failedDeletingingData: 'លុបទិន្នន័យបរាជ័យ',
    dataIsNull: 'គ្មានទិន្នន័យ',
    chooseLanguage: 'ជ្រើសរើសភាសា',
  };

  static const Map<String, String> mapOfEnglishLanguage = {
    //main menu
    home: 'Home',

    specialMenu: 'Special Menu',
    dashboard: 'Dashboard',
    setupProduct: 'Setup Product',
    setupMenu: 'Setup Menu',
    setupFloorPlan: 'Setup Floor Plan',
    setupSetting: 'Setup Setting',

    masterData: 'Master Data',
    purchaseTransaction: 'ប្រតិបត្តិការជាវ',

    //form
    //category
    category: 'Category Product',

    //product
    product: 'Product',
    unit: 'Unit',
    cost: 'Cost',
    reOrder: 'ReOrder',

    //floor
    floor: 'Floor',

    //table
    table: 'Table',

    //main menu
    mainMenu: 'Main Menu',

    //menu
    menu: 'Menu',
    menuPrinter: 'Menu Printer',
    menuAllPrinter: 'All Printer',

    //supplier
    supplier: 'Supplier',

    //general word
    search: 'Search',

    view: 'មើល',
    addNew: 'បន្ថែមថ្មី',
    edit: 'កែប្រែ',
    delete: 'លុបចេញ',
    export: 'នាំចេញ',
    print: 'បោះពុម្ព',

    save: 'រក្សាទុក',
    update: 'កែប្រែ',
    cancel: 'បោះបង់',

    yes: 'បាទ',
    no: 'ទេ',
    ok: 'យល់ព្រម',

    noOrder: '#',
    note: 'សំគាល់',
    createBy: 'បង្កើត',
    modifyBy: 'កែប្រែ',
    record: 'ទិន្នន័យ',
    english: 'អង់គ្លេស',
    khmer: 'ខ្មែរ',
    name: 'Name',

    //month
    january: 'មករា',
    february: 'កុម្ភៈ',
    march: 'មីនា',
    april: 'មេសា',
    may: 'ឧសភា',
    june: 'មិថុនា',
    july: 'កក្កដា',
    august: 'សីហា',
    september: 'កញ្ញា',
    october: 'តុលា',
    november: 'វិច្ឆិកា',
    december: 'ធ្នូ',

    //province
    phnomPenh: 'ភ្នំពេញ',
    banteayMeanchey: 'បន្ទាយមានជ័យ',
    battambang: 'បាត់ដំបង',
    kampongCham: 'កំពង់ចាម',
    kampongChhnang: 'កំពង់ឆ្នាំង',
    kampongSpeu: 'កំពង់ស្ពឺ',
    kampongThom: 'កំពង់ធំ',
    kampot: 'កំពត',
    kandal: 'កណ្តាល',
    kohKong: 'កោះកុង',
    kratie: 'ក្រចេះ',
    mondulkiri: 'មណ្ឌលគិរី',
    preahVihear: 'ព្រះវិហារ',
    preyVeng: 'ព្រៃវែង',
    pursat: 'ពោធិសាត់',
    ratanakiri: 'រតនគិរី',
    siemReap: 'សៀមរាប',
    preahSihanouk: 'ព្រះសីហនុ',
    stungTreng: 'ស្ទឹងត្រែង',
    svayRieng: 'ស្វាយរៀង',
    takeo: 'តាកែវ',
    oddarMeanchey: 'ឧត្តរមានជ័យ',
    kep: 'កែប',
    pailin: 'ប៉ៃលិន',
    tboungKhmum: 'ត្បូងឃ្មុំ',

    //general sentence
    noInternetConnection: 'គ្មានអ៊ីនធឺេណត',
    doYouWantToDeleteThisRecord: 'តើអ្នកចង់លុបទិន្នន័យនេះទេ',
    pleaseSelectDataToDelete: 'សូមជ្រើសរើសទិន្នន័យដើម្បីលុប',
    pleaseSelectDataToEdit: 'សូមជ្រើសរើសទិន្នន័យដើម្បីកែប្រែ',
    pleaseSelectDataToPrint: 'សូមជ្រើសរើសទិន្នន័យដើម្បីបោះពុម្ព',
    doYouWantToLogOut: 'តើអ្នកចង់ចាកចេញ?',
    noPermissionToUse: 'គ្មានការអនុញ្ញាតប្រើប្រាស់',
    checkingInternetConnection: 'ត្រួតពិនិត្យអ៊ីនធឺេណត',
    updateShippingToComplete: 'កែប្រែការដឹកជញ្ជូន',
    notYetReceipt: 'មិនទាន់ទទួល',
    alreadyReceipt: 'ទទួលរួចហើយ',
    savingData: 'កំពុងរក្សាទុកទិន្នន័យ',
    updatingData: 'កំពុងកែប្រែទិន្នន័យ',
    deletingData: 'កំពុងលុបទិន្នន័យ',
    failedSavingData: 'រក្សាទុកទិន្នន័យបរាជ័យ',
    failedUpdatingingData: 'កែប្រែទិន្នន័យបរាជ័យ',
    failedDeletingingData: 'លុបទិន្នន័យបរាជ័យ',
    dataIsNull: 'គ្មានទិន្នន័យ',
  };
}
