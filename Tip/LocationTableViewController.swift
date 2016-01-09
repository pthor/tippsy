//
//  LocationTableViewController.swift
//  Tip
//
//  Created by Paul Thormahlen on 1/7/16.
//  Copyright © 2016 Paul Thormahlen. All rights reserved.
//

import UIKit

class LocationTableViewController: UITableViewController{

    
    let textCellIdentifier = "LabelCell"
    var lastSelectedRowIndex:NSIndexPath?
    var locales = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        locales = [String](localesDictionary.keys.sort())

        // Do any additional setup after loading the view.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locales.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = locationLabelFromRowNumber(row)
        
        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        deselectOldLocale()
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)
        let row = indexPath.row
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        cell.textLabel?.text = locationLabelFromRowNumber(row)
        lastSelectedRowIndex = indexPath
        saveLocations(locales[row])
    }
    
    private func deselectOldLocale() {
        if lastSelectedRowIndex != nil {
            if let last_cell = tableView.cellForRowAtIndexPath(lastSelectedRowIndex!){
                tableView.beginUpdates()
                last_cell.accessoryType = UITableViewCellAccessoryType.None
                tableView.endUpdates()
            }
        }
    }
    
    private func saveLocations(localString: String){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(localString, forKey: "com.peloki.pthormahlen.tip.defaultLocale")
        defaults.synchronize()
    }
    
    private func locationLabelFromRowNumber(row:Int) -> String?{
        return localesDictionary[locales[row]]
    }

    let localesDictionary: [String: String] =
    ["ee_TG": "Ewe (Togo)",
        "kam_KE": "Kamba (Kenya)",
        "es_HN": "Spanish (Honduras)",
        "ml_IN": "Malayalam (India)",
        "ro_MD": "Romanian (Moldova)",
        "kab_DZ": "Kabyle (Algeria)",
        "es_CO": "Spanish (Colombia)",
        "es_PA": "Spanish (Panama)",
        "az_Latn": "Azerbaijani (Latin)",
        "en_NZ": "English (New Zealand)",
        "xog_UG": "Soga (Uganda)",
        "fr_GP": "French (Guadeloupe)",
        "fil_PH": "Filipino (Philippines)",
        "lt_LT": "Lithuanian (Lithuania)",
        "si_LK": "Sinhala (Sri Lanka)",
        "luo_KE": "Luo (Kenya)",
        "it_CH": "Italian (Switzerland)",
        "rm_CH": "Romansh (Switzerland)",
        "fr_GQ": "French (Equatorial Guinea)",
        "cgg_UG": "Chiga (Uganda)",
        "fr_RW": "French (Rwanda)",
        "es_SV": "Spanish (El Salvador)",
        "mas_TZ": "Masai (Tanzania)",
        "en_PH": "English (Philippines)",
        "mk_MK": "Macedonian (Macedonia)",
        "fr_TD": "French (Chad)",
        "kln_KE": "Kalenjin (Kenya)",
        "sr_Latn": "Serbian (Latin)",
        "el_GR": "Greek (Greece)",
        "el_CY": "Greek (Cyprus)",
        "es_CR": "Spanish (Costa Rica)",
        "fo_FO": "Faroese (Faroe Islands)",
        "ja_JP": "Japanese (Japan)",
        "ur_PK": "Urdu (Pakistan)",
        "pa_Guru": "Punjabi (Gurmukhi)",
        "gl_ES": "Galician (Spain)",
        "ar_EG": "Arabic (Egypt)",
        "th_TH": "Thai (Thailand)",
        "es_PE": "Spanish (Peru)",
        "fr_KM": "French (Comoros)",
        "lv_LV": "Latvian (Latvia)",
        "tzm_Latn": "Central Morocco Tamazight (Latin)",
        "gsw_CH": "Swiss German (Switzerland)",
        "is_IS": "Icelandic (Iceland)",
        "pt_BR": "Portuguese (Brazil)",
        "en_PK": "English (Pakistan)",
        "fa_IR": "Persian (Iran)",
        "fr_TG": "French (Togo)",
        "kde_TZ": "Makonde (Tanzania)",
        "mr_IN": "Marathi (India)",
        "ar_SA": "Arabic (Saudi Arabia)",
        "ka_GE": "Georgian (Georgia)",
        "mfe_MU": "Morisyen (Mauritius)",
        "fr_LU": "French (Luxembourg)",
        "de_LU": "German (Luxembourg)",
        "ru_MD": "Russian (Moldova)",
        "bg_BG": "Bulgarian (Bulgaria)",
        "shi_Latn": "Tachelhit (Latin)",
        "es_BO": "Spanish (Bolivia)",
        "ko_KR": "Korean (South Korea)",
        "it_IT": "Italian (Italy)",
        "pt_MZ": "Portuguese (Mozambique)",
        "ff_SN": "Fulah (Senegal)",
        "zh_Hans": "Chinese (Simplified Han)",
        "so_KE": "Somali (Kenya)",
        "bn_IN": "Bengali (India)",
        "en_UM": "English (U.S. Minor Outlying Islands)",
        "id_ID": "Indonesian (Indonesia)",
        "uz_Cyrl": "Uzbek (Cyrillic)",
        "es_EC": "Spanish (Ecuador)",
        "en_NA": "English (Namibia)",
        "bo_IN": "Tibetan (India)",
        "vun_TZ": "Vunjo (Tanzania)",
        "es_GQ": "Spanish (Equatorial Guinea)",
        "ta_IN": "Tamil (India)",
        "de_DE": "German (Germany)",
        "fr_FR": "French (France)",
        "rof_TZ": "Rombo (Tanzania)",
        "en_BW": "English (Botswana)",
        "ha_Latn": "Hausa (Latin)",
        "fr_NE": "French (Niger)",
        "es_MX": "Spanish (Mexico)",
        "bem_ZM": "Bemba (Zambia)",
        "bn_BD": "Bengali (Bangladesh)",
        "pt_GW": "Portuguese (Guinea-Bissau)",
        "de_AT": "German (Austria)",
        "kk_Cyrl": "Kazakh (Cyrillic)",
        "sw_TZ": "Swahili (Tanzania)",
        "et_EE": "Estonian (Estonia)",
        "da_DK": "Danish (Denmark)",
        "ro_RO": "Romanian (Romania)",
        "zh_Hant": "Chinese (Traditional Han)",
        "bm_ML": "Bambara (Mali)",
        "fr_CA": "French (Canada)",
        "en_IE": "English (Ireland)",
        "es_GT": "Spanish (Guatemala)",
        "en_AS": "English (American Samoa)",
        "bs_BA": "Bosnian (Bosnia and Herzegovina)",
        "am_ET": "Amharic (Ethiopia)",
        "haw_US": "Hawaiian (United States)",
        "ar_JO": "Arabic (Jordan)",
        "fa_AF": "Persian (Afghanistan)",
        "uz_Latn": "Uzbek (Latin)",
        "en_BZ": "English (Belize)",
        "nyn_UG": "Nyankole (Uganda)",
        "ebu_KE": "Embu (Kenya)",
        "te_IN": "Telugu (India)",
        "cy_GB": "Welsh (United Kingdom)",
        "en_JM": "English (Jamaica)",
        "en_US": "English (United States)",
        "ar_KW": "Arabic (Kuwait)",
        "af_ZA": "Afrikaans (South Africa)",
        "en_CA": "English (Canada)",
        "fr_DJ": "French (Djibouti)",
        "ti_ER": "Tigrinya (Eritrea)",
        "ig_NG": "Igbo (Nigeria)",
        "en_AU": "English (Australia)",
        "fr_MC": "French (Monaco)",
        "pt_PT": "Portuguese (Portugal)",
        "fr_CD": "French (Congo - Kinshasa)",
        "en_SG": "English (Singapore)",
        "bo_CN": "Tibetan (China)",
        "kn_IN": "Kannada (India)",
        "lg_UG": "Ganda (Uganda)",
        "gu_IN": "Gujarati (India)",
        "nd_ZW": "North Ndebele (Zimbabwe)",
        "sw_KE": "Swahili (Kenya)",
        "sq_AL": "Albanian (Albania)",
        "hr_HR": "Croatian (Croatia)",
        "mas_KE": "Masai (Kenya)",
        "ti_ET": "Tigrinya (Ethiopia)",
        "es_AR": "Spanish (Argentina)",
        "fr_CF": "French (Central African Republic)",
        "fr_RE": "French (Réunion)",
        "ru_UA": "Russian (Ukraine)",
        "yo_NG": "Yoruba (Nigeria)",
        "dav_KE": "Taita (Kenya)",
        "gv_GB": "Manx (United Kingdom)",
        "teo_UG": "Teso (Uganda)",
        "es_PR": "Spanish (Puerto Rico)",
        "fr_MF": "French (Saint Martin)",
        "rwk_TZ": "Rwa (Tanzania)",
        "nb_NO": "Norwegian Bokmål (Norway)",
        "fr_CG": "French (Congo - Brazzaville)",
        "ses_ML": "Koyraboro Senni (Mali)",
        "en_ZW": "English (Zimbabwe)",
        "ak_GH": "Akan (Ghana)",
        "vi_VN": "Vietnamese (Vietnam)",
        "sv_FI": "Swedish (Finland)",
        "to_TO": "Tonga (Tonga)",
        "fr_MG": "French (Madagascar)",
        "fr_GA": "French (Gabon)",
        "fr_CH": "French (Switzerland)",
        "de_CH": "German (Switzerland)",
        "es_US": "Spanish (United States)",
        "my_MM": "Burmese (Myanmar [Burma])",
        "ga_IE": "Irish (Ireland)",
        "ee_GH": "Ewe (Ghana)",
        "as_IN": "Assamese (India)",
        "ca_ES": "Catalan (Spain)",
        "fr_SN": "French (Senegal)",
        "ne_IN": "Nepali (India)",
        "ms_BN": "Malay (Brunei)",
        "ta_LK": "Tamil (Sri Lanka)",
        "ur_IN": "Urdu (India)",
        "fr_CI": "French (Côte d’Ivoire)",
        "sg_CF": "Sango (Central African Republic)",
        "om_ET": "Oromo (Ethiopia)",
        "uk_UA": "Ukrainian (Ukraine)",
        "mt_MT": "Maltese (Malta)",
        "ki_KE": "Kikuyu (Kenya)",
        "luy_KE": "Luyia (Kenya)",
        "en_IN": "English (India)",
        "en_TT": "English (Trinidad and Tobago)",
        "bez_TZ": "Bena (Tanzania)",
        "es_NI": "Spanish (Nicaragua)",
        "ne_NP": "Nepali (Nepal)",
        "en_MH": "English (Marshall Islands)",
        "hu_HU": "Hungarian (Hungary)",
        "en_GB": "English (United Kingdom)",
        "fr_BE": "French (Belgium)",
        "de_BE": "German (Belgium)",
        "be_BY": "Belarusian (Belarus)",
        "sl_SI": "Slovenian (Slovenia)",
        "fr_BF": "French (Burkina Faso)",
        "sk_SK": "Slovak (Slovakia)",
        "fr_ML": "French (Mali)",
        "he_IL": "Hebrew (Israel)",
        "ru_RU": "Russian (Russia)",
        "fr_CM": "French (Cameroon)",
        "teo_KE": "Teso (Kenya)",
        "seh_MZ": "Sena (Mozambique)",
        "kl_GL": "Kalaallisut (Greenland)",
        "fi_FI": "Finnish (Finland)",
        "es_ES": "Spanish (Spain)",
        "asa_TZ": "Asu (Tanzania)",
        "cs_CZ": "Czech (Czech Republic)",
        "tr_TR": "Turkish (Turkey)",
        "es_PY": "Spanish (Paraguay)",
        "en_HK": "English (Hong Kong SAR China)",
        "nl_NL": "Dutch (Netherlands)",
        "en_BE": "English (Belgium)",
        "ms_MY": "Malay (Malaysia)",
        "es_UY": "Spanish (Uruguay)",
        "kw_GB": "Cornish (United Kingdom)",
        "lag_TZ": "Langi (Tanzania)",
        "so_DJ": "Somali (Djibouti)",
        "sn_ZW": "Shona (Zimbabwe)",
        "or_IN": "Oriya (India)",
        "fr_BI": "French (Burundi)",
        "jmc_TZ": "Machame (Tanzania)",
        "chr_US": "Cherokee (United States)",
        "eu_ES": "Basque (Spain)",
        "saq_KE": "Samburu (Kenya)",
        "naq_NA": "Nama (Namibia)",
        "af_NA": "Afrikaans (Namibia)",
        "kea_CV": "Kabuverdianu (Cape Verde)",
        "es_DO": "Spanish (Dominican Republic)",
        "kok_IN": "Konkani (India)",
        "de_LI": "German (Liechtenstein)",
        "fr_BJ": "French (Benin)",
        "guz_KE": "Gusii (Kenya)",
        "rw_RW": "Kinyarwanda (Rwanda)",
        "mg_MG": "Malagasy (Madagascar)",
        "km_KH": "Khmer (Cambodia)",
        "shi_Tfng": "Tachelhit (Tifinagh)",
        "ar_AE": "Arabic (United Arab Emirates)",
        "fr_MQ": "French (Martinique)",
        "sv_SE": "Swedish (Sweden)",
        "az_Cyrl": "Azerbaijani (Cyrillic)",
        "so_ET": "Somali (Ethiopia)",
        "en_ZA": "English (South Africa)",
        "ii_CN": "Sichuan Yi (China)",
        "fr_BL": "French (Saint Barthélemy)",
        "hi_IN": "Hindi (India)",
        "mer_KE": "Meru (Kenya)",
        "nn_NO": "Norwegian Nynorsk (Norway)",
        "en_MP": "English (Northern Mariana Islands)",
        "nl_BE": "Dutch (Belgium)",
        "en_VI": "English (U.S. Virgin Islands)",
        "es_CL": "Spanish (Chile)",
        "hy_AM": "Armenian (Armenia)",
        "zu_ZA": "Zulu (South Africa)",
        "es_VE": "Spanish (Venezuela)",
        "khq_ML": "Koyra Chiini (Mali)",
        "ps_AF": "Pashto (Afghanistan)",
        "so_SO": "Somali (Somalia)",
        "sr_Cyrl": "Serbian (Cyrillic)",
        "pl_PL": "Polish (Poland)",
        "fr_GN": "French (Guinea)",
        "om_KE": "Oromo (Kenya)"]

}
