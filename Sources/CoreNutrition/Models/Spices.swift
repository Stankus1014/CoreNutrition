//
//  Spices.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//
import Foundation

public struct Spice: Codable, Sendable, Hashable {
    var spice: Spices
    var amount: Double?
    var servingType: ServingType?
}

public enum Spices: String, Codable, Sendable {
    
    case salt
    case blackPepper
    case whitePepper
    case garlicPowder
    case onionPowder
    case paprika
    case smokedPaprika
    case cayennePepper
    case chiliPowder
    case redPepperFlake
    case oregano
    case basil
    case thyme
    case rosemary
    case parsley
    case sage
    case marjoram
    case bayLeaf
    case cumin
    case groundCumin
    case coriander
    case groundCoriander
    case turmeric
    case gingerPowder
    case groundGinger
    case mustardPowder
    case nutmeg
    case groundNutmeg
    case clove
    case groundClove
    case allspice
    case cinnamon
    case groundCinnamon
    case cardamom
    case groundCardamom
    case fennelSeed
    case carawaySeed
    case aniseSeed
    case starAnise
    case sumac
    case zaatar
    case tacoSeasoning
    case italianSeasoning
    case poultrySeasoning
    case cajunSeasoning
    case creoleSeasoning
    case lemonPepper
    case oldBaySeasoning
    case everythingBagelSeasoning
    case fiveSpicePowder
    case garamMasala
    case curryPowder
    case madrasCurryPowder
    case harissa
    case berbere
    case rasElHanout
    case chipotlePowder
    case chipotleSeasoning
    case smokedChiliPowder
    case koreanChiliFlake
    case gochugaru
    case furikake
    case sesameSeed
    case blackSesameSeed
    case whiteSesameSeed
    case celerySeed
    case dill
    case dillWeed
    case mint
    case chive
    case tarragon
    case herbesDeProvence
    case msg
    case saffron
    case asafoetida
    case fenugreek
    case mace
    case amchur
    case kachriPowder
    case ajwain
    case kalonji
    case poppySeed
    case wasabiPowder
    case mustardSeed
    case picklingSpice
    case steakseasoning
    case bbqRub
    case dryRub
    case seasonedSalt
    case garlicSalt
    case onionSalt
    case celerySalt
    case smokedSalt
    case kosherSalt
    case seaSalt
    case pinkSalt
    case flakySalt
    case tableSalt
    case vanillaBean
    case vanillaPowder
    
    var name: String {
        switch self {
        case .salt:
            return "Salt"
        case .blackPepper:
            return "Black Pepper"
        case .whitePepper:
            return "White Pepper"
        case .garlicPowder:
            return "Garlic Powder"
        case .onionPowder:
            return "Onion Powder"
        case .paprika:
            return "Paprika"
        case .smokedPaprika:
            return "Smoked Paprika"
        case .cayennePepper:
            return "Cayenne Pepper"
        case .chiliPowder:
            return "ChiliPowder"
        case .redPepperFlake:
            return "Red Pepper Flake"
        case .oregano:
            return "Oregano"
        case .basil:
            return "Basil"
        case .thyme:
            return "Thyme"
        case .rosemary:
            return "Rosemary"
        case .parsley:
            return "Parsley"
        case .sage:
            return "Sage"
        case .marjoram:
            return "Marjoram"
        case .bayLeaf:
            return "Bay Leaf"
        case .cumin:
            return "Cumin"
        case .groundCumin:
            return "Ground Cumin"
        case .coriander:
            return "Coriander"
        case .groundCoriander:
            return "Ground Coriander"
        case .turmeric:
            return "Tumeric"
        case .gingerPowder:
            return "Ginger Powder"
        case .groundGinger:
            return "Ground Ginger"
        case .mustardPowder:
            return "Mustard Powder"
        case .nutmeg:
            return "Nutmeg"
        case .groundNutmeg:
            return "Ground Nutmeg"
        case .clove:
            return "Clove"
        case .groundClove:
            return "Ground Clove"
        case .allspice:
            return "Allspice"
        case .cinnamon:
            return "Cinnamon"
        case .groundCinnamon:
            return "Ground Cinnamon"
        case .cardamom:
            return "Cardamom"
        case .groundCardamom:
            return "Ground Cardamom"
        case .fennelSeed:
            return "Fennel Seed"
        case .carawaySeed:
            return "Caraway Seed"
        case .aniseSeed:
            return "Anise Seed"
        case .starAnise:
            return "Star Anise"
        case .sumac:
            return "Sumac"
        case .zaatar:
            return "Zaatar"
        case .tacoSeasoning:
            return "Taco Seasoning"
        case .italianSeasoning:
            return "Italian Seasoning"
        case .poultrySeasoning:
            return "Poultry Seasoning"
        case .cajunSeasoning:
            return "Cajun Seasoning"
        case .creoleSeasoning:
            return "Creole Seasoning"
        case .lemonPepper:
            return "Lemon Pepper"
        case .oldBaySeasoning:
            return "Old Bay Seasoning"
        case .everythingBagelSeasoning:
            return "Everything Bagel Seasoning"
        case .fiveSpicePowder:
            return "Five Spice Powder"
        case .garamMasala:
            return "Garam Masala"
        case .curryPowder:
            return "Curry Powder"
        case .madrasCurryPowder:
            return "Madras Curry Powder"
        case .harissa:
            return "Harissa"
        case .berbere:
            return "Berbere"
        case .rasElHanout:
            return "Ras El Hanout"
        case .chipotlePowder:
            return "Chipotle Powder"
        case .chipotleSeasoning:
            return "Chipotle Seasoning"
        case .smokedChiliPowder:
            return "Smoked Chili Powder"
        case .koreanChiliFlake:
            return "Korean Chili Flake"
        case .gochugaru:
            return "Gochugaru"
        case .furikake:
            return "Furikake"
        case .sesameSeed:
            return "Sesame Seed"
        case .blackSesameSeed:
            return "Black Sesame Seed"
        case .whiteSesameSeed:
            return "White Seasame Seed"
        case .celerySeed:
            return "Celery Seed"
        case .dill:
            return "Dill"
        case .dillWeed:
            return "Dill Weed"
        case .mint:
            return "Mint"
        case .chive:
            return "Chive"
        case .tarragon:
            return "Tarragon"
        case .herbesDeProvence:
            return "Herbes De Provence"
        case .msg:
            return "MSG"
        case .saffron:
            return "Saffron"
        case .asafoetida:
            return "Asafoetida"
        case .fenugreek:
            return "Fenugreek"
        case .mace:
            return "Mace"
        case .amchur:
            return "Amchur"
        case .kachriPowder:
            return "Kachri Powder"
        case .ajwain:
            return "Ajwain"
        case .kalonji:
            return "Kalonji"
        case .poppySeed:
            return "Poppy Seed"
        case .wasabiPowder:
            return "Wasabi Powder"
        case .mustardSeed:
            return "Mustard Seed"
        case .picklingSpice:
            return "Pickling Spice"
        case .steakseasoning:
            return "Steak Seasoning"
        case .bbqRub:
            return "BBQ Rub"
        case .dryRub:
            return "Dry Rub"
        case .seasonedSalt:
            return "Seasoned Salt"
        case .garlicSalt:
            return "Garlic Salt"
        case .onionSalt:
            return "Onion Salt"
        case .celerySalt:
            return "Celery Salt"
        case .smokedSalt:
            return "Smoked Salt"
        case .kosherSalt:
            return "Kosher Salt"
        case .seaSalt:
            return "Sea Salt"
        case .pinkSalt:
            return "Pink Salt"
        case .flakySalt:
            return "Flaky Salt"
        case .tableSalt:
            return "Table Salt"
        case .vanillaBean:
            return "Vanilla Bean"
        case .vanillaPowder:
            return "Vanilla Powder"
        }
    }
    
    var imageURL: String {
        // TODO: Create images for each spice icon
        return ""
    }
    
}
