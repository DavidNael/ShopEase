import '../screens/homepage/views/shop_view.dart';
import 'assets_manager.dart';

List<Category> categories = [
  const Category(
    name: "Clothes",
    id: "pcmcat242800050021",
    image: ImageAssets.clothesCategory,
  ),
  const Category(
    name: "Shoes",
    id: "pcmcat242800050021",
    image: ImageAssets.shoesCategory,
  ),
  const Category(
    name: "Bags",
    id: "pcmcat242800050021",
    image: ImageAssets.bagsCategory,
  ),
  const Category(
    name: "Accessories",
    id: "abcat0811002",
    image: ImageAssets.accessoriesCategory,
  ),
  const Category(
    name: "Beauty",
    id: "abcat0915000",
    image: ImageAssets.beautyCategory,
  ),
  const Category(
    name: "Electronics",
    id: "abcat0500000",
    image: ImageAssets.electronicsCategory,
  ),
  const Category(
    name: "Shirts",
    id: "pcmcat242800050021",
    image: ImageAssets.shirtCategory,
  ),
  const Category(
    name: "Home",
    id: "abcat0900000",
    image: ImageAssets.homeCategory,
  ),
  const Category(
    name: "Sports",
    id: "pcmcat242800050021",
    image: ImageAssets.sportsCategory,
  ),
  const Category(
    name: "Toys",
    id: "pcmcat252700050006",
    image: ImageAssets.toysCategory,
  ),
];

/*
"allowed": [
            "sku",
            "score",
            "productId",
            "name",
            "source",
            "type",
            "startDate",
            "new",
            "active",
            "lowPriceGuarantee",
            "activeUpdateDate",
            "regularPrice",
            "salePrice",
            "clearance",
            "onSale",
            "planPrice",
            "priceWithPlan.newTwoYearPlan",
            "priceWithPlan.upgradeTwoYearPlan",
            "priceWithPlan.newTwoYearPlanSalePrice",
            "priceWithPlan.upgradeTwoYearPlanSalePrice",
            "priceWithPlan.newTwoYearPlanRegularPrice",
            "priceWithPlan.upgradeTwoYearPlanRegularPrice",
            "contracts.id",
            "contracts.type",
            "contracts.description",
            "contracts.defaultContract",
            "contracts.term",
            "contracts.prices",
            "contracts.priceNote",
            "contracts.purchaseType",
            "priceRestriction",
            "priceUpdateDate",
            "digital",
            "preowned",
            "carriers.carrierName",
            "carriers.carrierCode",
            "carriers.carrierCodeConstant",
            "carriers.maxLinesIndividual",
            "carriers.maxLinesBusiness",
            "carriers.carrierTechnologies",
            "carriers.carrierTerms",
            "planFeatures.featureCode",
            "planFeatures.featureName",
            "planFeatures.optionIndicator",
            "planFeatures.monthlyRecurringChargeForThisPlan",
            "planFeatures.monthlyRecurringCharge",
            "planFeatures.sendIncludedFeatureForActivationForThisPlan",
            "planFeatures.sendIncludedFeatureForActivation",
            "planFeatures.lineQualifier",
            "planFeatures.featureShortDescription",
            "planFeatures.featureActivationCharge",
            "planFeatures.featureValidFrom",
            "planFeatures.featureValidUntil",
            "planFeatures.recommendedFlag",
            "planFeatures.billingLevel",
            "planFeatures.planFeatureDescriptions",
            "planFeatures.planFeatureCategory",
            "devices.sku",
            "devices.deviceFeatures",
            "carrierPlans.sku",
            "technologyCode",
            "carrierModelNumber",
            "earlyTerminationFees.etfText",
            "earlyTerminationFees.terminationFee",
            "earlyTerminationFees.decliningAmount",
            "earlyTerminationFees.contractLengthInMonths",
            "monthlyRecurringCharge",
            "monthlyRecurringChargeGrandTotal",
            "activationCharge",
            "minutePrice",
            "planCategory",
            "planType",
            "familyIndividualCode",
            "validFrom",
            "validUntil",
            "carrierPlan",
            "outletCenter",
            "secondaryMarket",
            "frequentlyPurchasedWith.sku",
            "accessories.sku",
            "relatedProducts.sku",
            "requiredParts.sku",
            "techSupportPlans.sku",
            "crossSell.sku",
            "crossSell.score",
            "salesRankShortTerm",
            "salesRankMediumTerm",
            "salesRankLongTerm",
            "bestSellingRank",
            "url",
            "spin360Url",
            "mobileUrl",
            "affiliateUrl",
            "addToCartUrl",
            "affiliateAddToCartUrl",
            "linkShareAffiliateUrl",
            "linkShareAffiliateAddToCartUrl",
            "search",
            "stores.storeId",
            "stores.storeType",
            "stores.locationType",
            "stores.tradeIn",
            "stores.brand",
            "stores.name",
            "stores.longName",
            "stores.address",
            "stores.address2",
            "stores.city",
            "stores.region",
            "stores.fullPostalCode",
            "stores.country",
            "stores.lat",
            "stores.lng",
            "stores.hours",
            "stores.hoursAmPm",
            "stores.gmtOffset",
            "stores.language",
            "stores.services",
            "stores.phone",
            "stores.postalCode",
            "stores.distance",
            "stores.detailedHours",
            "stores.detailedCurbsideHours",
            "stores.location",
            "upc",
            "productTemplate",
            "categoryPath.id",
            "categoryPath.name",
            "alternateCategories.id",
            "alternateCategories.name",
            "lists.listId",
            "lists.startDate",
            "lists.endDate",
            "customerReviewCount",
            "customerReviewAverage",
            "customerTopRated",
            "format",
            "freeShipping",
            "freeShippingEligible",
            "inStoreAvailability",
            "inStoreAvailabilityText",
            "inStoreAvailabilityTextHtml",
            "inStoreAvailabilityUpdateDate",
            "itemUpdateDate",
            "onlineAvailability",
            "onlineAvailabilityText",
            "onlineAvailabilityTextHtml",
            "onlineAvailabilityUpdateDate",
            "releaseDate",
            "shippingCost",
            "shipping.ground",
            "shipping.secondDay",
            "shipping.nextDay",
            "shipping.vendorDelivery",
            "shippingLevelsOfService.serviceLevelId",
            "shippingLevelsOfService.serviceLevelName",
            "shippingLevelsOfService.unitShippingPrice",
            "specialOrder",
            "shortDescription",
            "shortDescriptionHtml",
            "class",
            "classId",
            "subclass",
            "subclassId",
            "department",
            "departmentId",
            "bestBuyItemId",
            "protectionPlanTerm",
            "protectionPlanType",
            "protectionPlanLowPrice",
            "protectionPlanHighPrice",
            "buybackPlans.sku",
            "buybackPlans.type",
            "buybackPlans.name",
            "buybackPlans.productId",
            "buybackPlans.regularPrice",
            "buybackPlans.salePrice",
            "protectionPlans.sku",
            "protectionPlans.name",
            "protectionPlans.productId",
            "protectionPlans.type",
            "protectionPlans.term",
            "protectionPlans.regularPrice",
            "protectionPlans.salePrice",
            "protectionPlanDetails.states",
            "protectionPlanDetails.termsAndConditions",
            "productFamilies.name",
            "productFamilies.skus",
            "productVariations.sku",
            "productVariations.variations",
            "aspectRatio",
            "screenFormat",
            "lengthInMinutes",
            "mpaaRating",
            "plot",
            "plotHtml",
            "studio",
            "theatricalReleaseDate",
            "description",
            "manufacturer",
            "modelNumber",
            "images.rel",
            "images.unitOfMeasure",
            "images.width",
            "images.height",
            "images.href",
            "images.primary",
            "image",
            "largeFrontImage",
            "mediumImage",
            "thumbnailImage",
            "largeImage",
            "alternateViewsImage",
            "angleImage",
            "backViewImage",
            "energyGuideImage",
            "leftViewImage",
            "accessoriesImage",
            "remoteControlImage",
            "rightViewImage",
            "topViewImage",
            "albumTitle",
            "artistName",
            "artistId",
            "originalReleaseDate",
            "parentalAdvisory",
            "mediaCount",
            "monoStereo",
            "studioLive",
            "condition",
            "inStorePickup",
            "friendsAndFamilyPickup",
            "homeDelivery",
            "quantityLimit",
            "fulfilledBy",
            "members.sku",
            "bundledIn.sku",
            "albumLabel",
            "genre",
            "color",
            "depth",
            "dollarSavings",
            "percentSavings",
            "tradeInValue",
            "height",
            "orderable",
            "weight",
            "shippingWeight",
            "width",
            "warrantyLabor",
            "warrantyParts",
            "softwareAge",
            "softwareGrade",
            "platform",
            "numberOfPlayers",
            "softwareNumberOfPlayers",
            "esrbRating",
            "longDescription",
            "longDescriptionHtml",
            "cast.name",
            "cast.role",
            "crew.name",
            "crew.role",
            "details.name",
            "details.value",
            "details.values",
            "includedItemList.includedItem",
            "features.feature",
            "offers.id",
            "offers.heading",
            "offers.text",
            "offers.url",
            "offers.imageUrl",
            "offers.type",
            "offers.startDate",
            "offers.endDate",
            "offers.contentNotes",
            "offers.offerName",
            "offers.giftSku",
            "marketplace",
            "listingId",
            "sellerId",
            "shippingRestrictions",
            "discs.discNumber",
            "discs.tracks",
            "commerceSku",
            "haulawayAvailable",
            "proposition65WarningMessage",
            "proposition65WarningType",
            "videoChapters.chapter",
            "videoLanguages.language",
            "subtitleLanguages.language",
            "additionalFeatures.feature",
            "agitatorType",
            "allergyCycle",
            "analogAudioInputs",
            "audioOutputs",
            "avOutputs",
            "automaticTemperatureControl",
            "batteryLifeMin",
            "bdLive",
            "bleachDispenser",
            "bluRayPlayer",
            "bluetoothEnabled",
            "brightnessCdPerSqM",
            "brightnessLumens",
            "brightnessLux",
            "brightnessNits",
            "builtForBluRay",
            "builtInDigitalCamera",
            "builtInPlayer",
            "cabinetSideColor",
            "capacityCuFt",
            "capacityFreezerCuFt",
            "capacityFreshFoodCuFt",
            "capacityRefrigeratorCuFt",
            "cdRRwCompatible",
            "channelLabeling",
            "childLock",
            "clock",
            "coaxialDigitalAudioOutputs",
            "collection",
            "combFilter",
            "compactDesign",
            "componentVideoInputs",
            "componentVideoOutputs",
            "compositeVideoInputs",
            "compositeVideoOutputs",
            "contrastRatio",
            "controlLocation",
            "controlType",
            "counterDepth",
            "customSettings",
            "cycleDescriptions.cycleDescription",
            "delayedStart",
            "delicateCycle",
            "depthIncludingHandlesIn",
            "depthLessDoorIn",
            "depthWithDoorOpenIn",
            "depthWithStandIn",
            "depthWithoutHandlesIn",
            "depthWithoutStandIn",
            "deviceManufacturer",
            "digitalAudioInputs",
            "digitalAudioOutputs",
            "digitalOutputs",
            "digitalTuner",
            "discCapacity",
            "dispenserColor",
            "displayType",
            "dolbyDigitalDecoder",
            "doorHandleColor",
            "doorOpenAlarm",
            "driveCapacityGb",
            "driveConnectivity",
            "drumAndInteriorFinish",
            "dryingRack",
            "dvdPlayer",
            "dviInputs",
            "dviOutputs",
            "dynamicContrastRatio",
            "endOfCycleSignal",
            "energyConsumptionKwhPerYear",
            "energyStarQualified",
            "estimatedYearlyOperatingCosts.estimatedYearlyOperatingCost",
            "estimatedYearlyOperatingCostsUsd",
            "ethernetPort",
            "extraDelicateCycle",
            "fabricDispenser",
            "factoryInstalledIceMaker",
            "fiveOneChannelInput",
            "fiveOneChannelOutput",
            "frontFacingCamera",
            "frontPanelAvInputs",
            "frontSurroundPowerPerChannel",
            "gallonDoorStorage",
            "handWashCycle",
            "hdRadioCompatible",
            "hdRadioReady",
            "hdmiInputs",
            "hdmiOutputs",
            "hdtvCompatibility",
            "headphoneJacks",
            "heightToTopOfDoorHingeIn",
            "heightToTopOfRefrigeratorIn",
            "heightWithStandIn",
            "heightWithoutStandIn",
            "highEfficiency",
            "humidityControlledCrisper",
            "ieee1394FirewirePort",
            "instantContent.provider",
            "interiorLight",
            "internetConnectable",
            "iphoneAccessory",
            "ipodConnection",
            "ipodDock",
            "ipodReady",
            "languageOptions.language",
            "lcdScreenSizeIn",
            "ledButtons",
            "lintFilterLight",
            "loadAccess",
            "maximumContrastRatioDynamic",
            "maximumOutputResolution",
            "maximumPowerHandling",
            "maximumResolutionHorizontalPx",
            "maximumResolutionVerticalPx",
            "maximumStandHeightIn",
            "mediaCardSlot",
            "mediaPort",
            "minimumContrastRatioDynamic",
            "minimumStandHeightIn",
            "mms",
            "mobileOperatingSystem",
            "moistureSensor",
            "mountBracketVesaPattern",
            "mp3PlaybackCapability",
            "multiroomCapability",
            "noiseReduction",
            "numberOfChannels",
            "numberOfCoaxialDigitalAudioOutputs",
            "numberOfCycles",
            "numberOfOpticalDigitalAudioOutputs",
            "numberOfSpeakers",
            "numberOfWashCycles",
            "onScreenDisplay",
            "onlinePlay",
            "opticalDigitalAudioOutputs",
            "pcInput",
            "pcInputs",
            "peakPowerHandling",
            "permanentPressCycle",
            "phonoInputs",
            "pictureInPicture",
            "playbackFormats.format",
            "playerType",
            "powerSource",
            "powerSourceRatings",
            "preampOutputs",
            "preWashDispenser",
            "productAspectRatio",
            "productHeightIn",
            "rearFacingCamera",
            "rearSurroundPowerPerChannel",
            "remoteControlType",
            "reversibleDoorHinge",
            "rfAntennaInput",
            "rfAntennaInputs",
            "sVideoInputs",
            "sVideoOutputs",
            "sabbathMode",
            "sanitationAllergyCycle",
            "sanitationCycle",
            "satelliteRadioReady",
            "scannerType",
            "screenSizeIn",
            "screenSizeClassIn",
            "screenRefreshRateHz",
            "sdCardSlot",
            "secondRinse",
            "serviceProvider",
            "shelfConstruction",
            "shelfSystemType",
            "simulatedSurround",
            "sixOneChannelInput",
            "smartCapable",
            "sleepTimer",
            "soundLeveler",
            "soundType",
            "speakerAbSwitching",
            "speakerLocation",
            "stackable",
            "standHeightIn",
            "stationPresets",
            "stationPresetsAm",
            "stationPresetsFm",
            "stationPresetsHd",
            "steam",
            "style",
            "subwooferPowerWatts",
            "subwooferSizeIn",
            "surfaceFinish",
            "surroundSoundDecoders",
            "temperatureControlType",
            "threeDPassThrough",
            "threeDReady",
            "thruTheDoorDispenser.dispenser",
            "thruTheDoorIceDispenser",
            "thruTheDoorWaterDispenser",
            "touchPadControls",
            "totalHarmonicDistortion",
            "totalReceiverPower",
            "totalSystemPowerWatts",
            "tvType",
            "usbPort",
            "vChip",
            "verticalResolution",
            "vibrationReduction",
            "videoUpConversion",
            "waterEfficiency",
            "waterFilterLocation",
            "waterFilterModelNumber",
            "waterFiltration",
            "waterFiltrationReplacementIndicatorLight",
            "wattsPerChannel",
            "wattsPerChannelRms",
            "wifiBuiltIn",
            "wifiReady",
            "wirelessSubwoofer"
        ],

*/