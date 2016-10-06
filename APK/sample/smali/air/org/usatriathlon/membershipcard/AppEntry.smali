.class public Lair/org/usatriathlon/membershipcard/AppEntry;
.super Landroid/app/Activity;
.source "AppEntry.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "AppEntry"

.field private static final RESOURCE_BUTTON_EXIT:Ljava/lang/String; = "string.button_exit"

.field private static final RESOURCE_BUTTON_INSTALL:Ljava/lang/String; = "string.button_install"

.field private static final RESOURCE_CLASS:Ljava/lang/String; = "air.org.usatriathlon.membershipcard.R"

.field private static final RESOURCE_TEXT_RUNTIME_REQUIRED:Ljava/lang/String; = "string.text_runtime_required"

.field private static final RESOURCE_TITLE_ADOBE_AIR:Ljava/lang/String; = "string.title_adobe_air"

.field private static RUNTIME_PACKAGE_ID:Ljava/lang/String;

.field private static sAndroidActivityWrapper:Ljava/lang/Object;

.field private static sAndroidActivityWrapperClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static sDloader:Ldalvik/system/DexClassLoader;

.field private static sRuntimeClassesLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    sput-boolean v0, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    .line 61
    const/4 v0, 0x0

    sput-object v0, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapper:Ljava/lang/Object;

    .line 62
    const-string v0, "com.adobe.air"

    sput-object v0, Lair/org/usatriathlon/membershipcard/AppEntry;->RUNTIME_PACKAGE_ID:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private BroadcastIntent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 69
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p2, v0}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lair/org/usatriathlon/membershipcard/AppEntry;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :goto_0
    return-void

    .line 75
    :catch_0
    move-exception v0

    goto :goto_0

    .line 71
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method private varargs InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 341
    sget-boolean v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    if-nez v1, :cond_0

    .line 342
    const/4 v1, 0x0

    .line 356
    :goto_0
    return-object v1

    .line 344
    :cond_0
    const/4 v0, 0x0

    .line 347
    .local v0, "retval":Ljava/lang/Object;
    if-eqz p2, :cond_1

    .line 348
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapper:Ljava/lang/Object;

    invoke-virtual {p1, v1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "retval":Ljava/lang/Object;
    :goto_1
    move-object v1, v0

    .line 356
    goto :goto_0

    .line 350
    .restart local v0    # "retval":Ljava/lang/Object;
    :cond_1
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapper:Ljava/lang/Object;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    .line 352
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private InvokeWrapperOnCreate()V
    .locals 12

    .prologue
    .line 319
    :try_start_0
    sget-object v7, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v8, "onCreate"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Landroid/app/Activity;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-class v11, [Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 324
    .local v4, "method":Ljava/lang/reflect/Method;
    const-string v6, ""

    .line 325
    .local v6, "xmlPath":Ljava/lang/String;
    const-string v5, ""

    .line 326
    .local v5, "rootDirectory":Ljava/lang/String;
    const-string v1, "-nodebug"

    .line 327
    .local v1, "extraArgs":Ljava/lang/String;
    new-instance v2, Ljava/lang/Boolean;

    const/4 v7, 0x0

    invoke-direct {v2, v7}, Ljava/lang/Boolean;-><init>(Z)V

    .line 328
    .local v2, "isADL":Ljava/lang/Boolean;
    new-instance v3, Ljava/lang/Boolean;

    const/4 v7, 0x0

    invoke-direct {v3, v7}, Ljava/lang/Boolean;-><init>(Z)V

    .line 329
    .local v3, "isDebuggerMode":Ljava/lang/Boolean;
    const/4 v7, 0x5

    new-array v0, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v6, v0, v7

    const/4 v7, 0x1

    aput-object v5, v0, v7

    const/4 v7, 0x2

    aput-object v1, v0, v7

    const/4 v7, 0x3

    invoke-virtual {v2}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v7

    const/4 v7, 0x4

    invoke-virtual {v3}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v7

    .line 331
    .local v0, "args":[Ljava/lang/String;
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p0, v7, v8

    const/4 v8, 0x1

    aput-object v0, v7, v8

    invoke-direct {p0, v4, v7}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    .end local v0    # "args":[Ljava/lang/String;
    .end local v1    # "extraArgs":Ljava/lang/String;
    .end local v2    # "isADL":Ljava/lang/Boolean;
    .end local v3    # "isDebuggerMode":Ljava/lang/Boolean;
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "rootDirectory":Ljava/lang/String;
    .end local v6    # "xmlPath":Ljava/lang/String;
    :goto_0
    return-void

    .line 333
    :catch_0
    move-exception v7

    goto :goto_0
.end method

.method private static KillSelf()V
    .locals 1

    .prologue
    .line 361
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 362
    return-void
.end method

.method static synthetic access$000(Lair/org/usatriathlon/membershipcard/AppEntry;)V
    .locals 0
    .param p0, "x0"    # Lair/org/usatriathlon/membershipcard/AppEntry;

    .prologue
    .line 55
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->launchMarketPlaceForAIR()V

    return-void
.end method

.method static synthetic access$100(Lair/org/usatriathlon/membershipcard/AppEntry;)V
    .locals 0
    .param p0, "x0"    # Lair/org/usatriathlon/membershipcard/AppEntry;

    .prologue
    .line 55
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->loadSharedRuntimeDex()V

    return-void
.end method

.method static synthetic access$200(Lair/org/usatriathlon/membershipcard/AppEntry;Z)V
    .locals 0
    .param p0, "x0"    # Lair/org/usatriathlon/membershipcard/AppEntry;
    .param p1, "x1"    # Z

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lair/org/usatriathlon/membershipcard/AppEntry;->createActivityWrapper(Z)V

    return-void
.end method

.method static synthetic access$300()Z
    .locals 1

    .prologue
    .line 55
    sget-boolean v0, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    return v0
.end method

.method static synthetic access$400(Lair/org/usatriathlon/membershipcard/AppEntry;)V
    .locals 0
    .param p0, "x0"    # Lair/org/usatriathlon/membershipcard/AppEntry;

    .prologue
    .line 55
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeWrapperOnCreate()V

    return-void
.end method

.method static synthetic access$500()V
    .locals 0

    .prologue
    .line 55
    invoke-static {}, Lair/org/usatriathlon/membershipcard/AppEntry;->KillSelf()V

    return-void
.end method

.method private createActivityWrapper(Z)V
    .locals 6
    .param p1, "hasCaptiveRuntime"    # Z

    .prologue
    const-string v1, "CreateAndroidActivityWrapper"

    .line 609
    if-eqz p1, :cond_0

    .line 611
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "CreateAndroidActivityWrapper"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/app/Activity;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Ljava/lang/Boolean;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 612
    .local v0, "methodCreateAndroidActivityWrapper":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sput-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapper:Ljava/lang/Object;

    .line 624
    .end local v0    # "methodCreateAndroidActivityWrapper":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 616
    :cond_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "CreateAndroidActivityWrapper"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/app/Activity;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 617
    .restart local v0    # "methodCreateAndroidActivityWrapper":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sput-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapper:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 620
    .end local v0    # "methodCreateAndroidActivityWrapper":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private isRuntimeInstalled()Z
    .locals 4

    .prologue
    .line 120
    invoke-virtual {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 124
    .local v1, "pkgMgr":Landroid/content/pm/PackageManager;
    :try_start_0
    sget-object v2, Lair/org/usatriathlon/membershipcard/AppEntry;->RUNTIME_PACKAGE_ID:Ljava/lang/String;

    const/16 v3, 0x100

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 127
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 129
    .local v0, "nfe":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private isRuntimeOnExternalStorage()Z
    .locals 5

    .prologue
    const/high16 v4, 0x40000

    .line 137
    invoke-virtual {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 142
    .local v1, "pkgMgr":Landroid/content/pm/PackageManager;
    :try_start_0
    sget-object v2, Lair/org/usatriathlon/membershipcard/AppEntry;->RUNTIME_PACKAGE_ID:Ljava/lang/String;

    const/16 v3, 0x2000

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 143
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget v2, v0, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    and-int/2addr v2, v4

    if-ne v2, v4, :cond_0

    .line 144
    const/4 v2, 0x1

    .line 151
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :goto_0
    return v2

    .line 146
    :catch_0
    move-exception v2

    .line 151
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private launchAIRService()V
    .locals 4

    .prologue
    .line 271
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.adobe.air.AIRServiceAction"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 272
    .local v1, "intent":Landroid/content/Intent;
    sget-object v2, Lair/org/usatriathlon/membershipcard/AppEntry;->RUNTIME_PACKAGE_ID:Ljava/lang/String;

    const-string v3, "com.adobe.air.AIRService"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 275
    new-instance v0, Lair/org/usatriathlon/membershipcard/AppEntry$4;

    invoke-direct {v0, p0}, Lair/org/usatriathlon/membershipcard/AppEntry$4;-><init>(Lair/org/usatriathlon/membershipcard/AppEntry;)V

    .line 306
    .local v0, "conn":Landroid/content/ServiceConnection;
    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Lair/org/usatriathlon/membershipcard/AppEntry;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 313
    .end local v0    # "conn":Landroid/content/ServiceConnection;
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 309
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private launchMarketPlaceForAIR()V
    .locals 8

    .prologue
    .line 84
    const/4 v1, 0x0

    .line 88
    .local v1, "airDownloadURL":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->getComponentName()Landroid/content/ComponentName;

    move-result-object v6

    const/16 v7, 0x80

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v2

    .line 89
    .local v2, "info":Landroid/content/pm/ActivityInfo;
    iget-object v4, v2, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 92
    .local v4, "metadata":Landroid/os/Bundle;
    if-eqz v4, :cond_0

    .line 94
    const-string v5, "airDownloadURL"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/lang/String;

    move-object v1, v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 104
    .end local v2    # "info":Landroid/content/pm/ActivityInfo;
    .end local v4    # "metadata":Landroid/os/Bundle;
    :cond_0
    :goto_0
    move-object v3, v1

    .line 105
    .local v3, "marketPlaceURL":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 106
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "market://details?id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lair/org/usatriathlon/membershipcard/AppEntry;->RUNTIME_PACKAGE_ID:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 110
    :cond_1
    :try_start_1
    const-string v5, "android.intent.action.VIEW"

    invoke-direct {p0, v5, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->BroadcastIntent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 116
    :goto_1
    return-void

    .line 112
    :catch_0
    move-exception v5

    goto :goto_1

    .line 98
    .end local v3    # "marketPlaceURL":Ljava/lang/String;
    :catch_1
    move-exception v5

    goto :goto_0
.end method

.method private loadCaptiveRuntimeClasses()Z
    .locals 2

    .prologue
    .line 563
    const/4 v0, 0x0

    .line 567
    .local v0, "hasCaptiveRuntime":Z
    :try_start_0
    const-string v1, "com.adobe.air.AndroidActivityWrapper"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    .line 568
    const/4 v0, 0x1

    .line 569
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    sput-boolean v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 575
    :cond_0
    :goto_0
    return v0

    .line 571
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private loadSharedRuntimeDex()V
    .locals 6

    .prologue
    .line 584
    :try_start_0
    sget-boolean v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    if-nez v1, :cond_0

    .line 587
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->RUNTIME_PACKAGE_ID:Ljava/lang/String;

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lair/org/usatriathlon/membershipcard/AppEntry;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v0

    .line 588
    .local v0, "con":Landroid/content/Context;
    new-instance v1, Ldalvik/system/DexClassLoader;

    sget-object v2, Lair/org/usatriathlon/membershipcard/AppEntry;->RUNTIME_PACKAGE_ID:Ljava/lang/String;

    invoke-virtual {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-direct {v1, v2, v3, v4, v5}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    sput-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sDloader:Ldalvik/system/DexClassLoader;

    .line 593
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sDloader:Ldalvik/system/DexClassLoader;

    const-string v2, "com.adobe.air.AndroidActivityWrapper"

    invoke-virtual {v1, v2}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    .line 594
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    if-eqz v1, :cond_0

    .line 595
    const/4 v1, 0x1

    sput-boolean v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 604
    .end local v0    # "con":Landroid/content/Context;
    :cond_0
    :goto_0
    return-void

    .line 600
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private showDialog(ILjava/lang/String;II)V
    .locals 2
    .param p1, "titleId"    # I
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "positiveButtonId"    # I
    .param p4, "negativeButtonId"    # I

    .prologue
    .line 156
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 157
    .local v0, "alertDialogBuilder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 158
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 159
    new-instance v1, Lair/org/usatriathlon/membershipcard/AppEntry$1;

    invoke-direct {v1, p0}, Lair/org/usatriathlon/membershipcard/AppEntry$1;-><init>(Lair/org/usatriathlon/membershipcard/AppEntry;)V

    invoke-virtual {v0, p3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 166
    new-instance v1, Lair/org/usatriathlon/membershipcard/AppEntry$2;

    invoke-direct {v1, p0}, Lair/org/usatriathlon/membershipcard/AppEntry$2;-><init>(Lair/org/usatriathlon/membershipcard/AppEntry;)V

    invoke-virtual {v0, p4, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 172
    new-instance v1, Lair/org/usatriathlon/membershipcard/AppEntry$3;

    invoke-direct {v1, p0}, Lair/org/usatriathlon/membershipcard/AppEntry$3;-><init>(Lair/org/usatriathlon/membershipcard/AppEntry;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 178
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 179
    return-void
.end method

.method private showRuntimeNotInstalledDialog()V
    .locals 5

    .prologue
    .line 189
    new-instance v0, Lcom/adobe/air/ResourceIdMap;

    const-string v2, "air.org.usatriathlon.membershipcard.R"

    invoke-direct {v0, v2}, Lcom/adobe/air/ResourceIdMap;-><init>(Ljava/lang/String;)V

    .line 190
    .local v0, "r":Lcom/adobe/air/ResourceIdMap;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "string.text_runtime_required"

    invoke-virtual {v0, v3}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "string.text_install_runtime"

    invoke-virtual {v0, v3}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 191
    .local v1, "text":Ljava/lang/String;
    const-string v2, "string.title_adobe_air"

    invoke-virtual {v0, v2}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v2

    const-string v3, "string.button_install"

    invoke-virtual {v0, v3}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v3

    const-string v4, "string.button_exit"

    invoke-virtual {v0, v4}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v4

    invoke-direct {p0, v2, v1, v3, v4}, Lair/org/usatriathlon/membershipcard/AppEntry;->showDialog(ILjava/lang/String;II)V

    .line 195
    return-void
.end method

.method private showRuntimeOnExternalStorageDialog()V
    .locals 5

    .prologue
    .line 199
    new-instance v0, Lcom/adobe/air/ResourceIdMap;

    const-string v2, "air.org.usatriathlon.membershipcard.R"

    invoke-direct {v0, v2}, Lcom/adobe/air/ResourceIdMap;-><init>(Ljava/lang/String;)V

    .line 200
    .local v0, "r":Lcom/adobe/air/ResourceIdMap;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "string.text_runtime_required"

    invoke-virtual {v0, v3}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "string.text_runtime_on_external_storage"

    invoke-virtual {v0, v3}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 201
    .local v1, "text":Ljava/lang/String;
    const-string v2, "string.title_adobe_air"

    invoke-virtual {v0, v2}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v2

    const-string v3, "string.button_install"

    invoke-virtual {v0, v3}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v3

    const-string v4, "string.button_exit"

    invoke-virtual {v0, v4}, Lcom/adobe/air/ResourceIdMap;->getId(Ljava/lang/String;)I

    move-result v4

    invoke-direct {p0, v2, v1, v3, v4}, Lair/org/usatriathlon/membershipcard/AppEntry;->showDialog(ILjava/lang/String;II)V

    .line 205
    return-void
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 492
    const/4 v0, 0x0

    .line 495
    .local v0, "handled":Z
    :try_start_0
    sget-object v2, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v3, "dispatchGenericMotionEvent"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/view/MotionEvent;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 496
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {p0, v1, v2}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 503
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v2, v8

    :goto_1
    return v2

    :cond_1
    move v2, v7

    goto :goto_1

    .line 498
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 9
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 474
    const/4 v0, 0x0

    .line 477
    .local v0, "handled":Z
    :try_start_0
    sget-object v2, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v3, "dispatchKeyEvent"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/view/KeyEvent;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 478
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {p0, v1, v2}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 485
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v2, v8

    :goto_1
    return v2

    :cond_1
    move v2, v7

    goto :goto_1

    .line 480
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public finishActivityFromChild(Landroid/app/Activity;I)V
    .locals 6
    .param p1, "child"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I

    .prologue
    .line 629
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->finishActivityFromChild(Landroid/app/Activity;I)V

    .line 633
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "finishActivityFromChild"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/app/Activity;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 634
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 640
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 636
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public finishFromChild(Landroid/app/Activity;)V
    .locals 6
    .param p1, "child"    # Landroid/app/Activity;

    .prologue
    .line 645
    invoke-super {p0, p1}, Landroid/app/Activity;->finishFromChild(Landroid/app/Activity;)V

    .line 649
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "finishFromChild"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/app/Activity;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 650
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 656
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 652
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 530
    :try_start_0
    sget-boolean v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    if-eqz v1, :cond_0

    .line 532
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onActivityResult"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-class v5, Landroid/content/Intent;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 533
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 540
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :cond_0
    :goto_0
    return-void

    .line 536
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onApplyThemeResource(Landroid/content/res/Resources$Theme;IZ)V
    .locals 6
    .param p1, "theme"    # Landroid/content/res/Resources$Theme;
    .param p2, "resid"    # I
    .param p3, "first"    # Z

    .prologue
    .line 1179
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onApplyThemeResource(Landroid/content/res/Resources$Theme;IZ)V

    .line 1183
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onApplyThemeResource"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/content/res/Resources$Theme;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1184
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1190
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1186
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onAttachedToWindow()V
    .locals 4

    .prologue
    .line 661
    invoke-super {p0}, Landroid/app/Activity;->onAttachedToWindow()V

    .line 665
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onAttachedToWindow"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 666
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 672
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 668
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 4

    .prologue
    .line 677
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 681
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onBackPressed"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 682
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 688
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 684
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onChildTitleChanged(Landroid/app/Activity;Ljava/lang/CharSequence;)V
    .locals 6
    .param p1, "childActivity"    # Landroid/app/Activity;
    .param p2, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 1195
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onChildTitleChanged(Landroid/app/Activity;Ljava/lang/CharSequence;)V

    .line 1199
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onChildTitleChanged"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/app/Activity;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Ljava/lang/CharSequence;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1200
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1206
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1202
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 6
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 458
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 462
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onConfigurationChanged"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/content/res/Configuration;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 463
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 465
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onContentChanged()V
    .locals 4

    .prologue
    .line 693
    invoke-super {p0}, Landroid/app/Activity;->onContentChanged()V

    .line 697
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onContentChanged"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 698
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 704
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 700
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 8
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 709
    invoke-super {p0, p1}, Landroid/app/Activity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    .line 713
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onContextItemSelected"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/view/MenuItem;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 714
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 719
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 716
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 719
    goto :goto_0
.end method

.method public onContextMenuClosed(Landroid/view/Menu;)V
    .locals 6
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 726
    invoke-super {p0, p1}, Landroid/app/Activity;->onContextMenuClosed(Landroid/view/Menu;)V

    .line 730
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onContextMenuClosed"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/view/Menu;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 731
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 737
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 733
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 211
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 215
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 216
    .local v3, "t":Ljava/util/Date;
    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    .line 217
    .local v1, "millis":J
    const-string v4, "StartupTime1"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->loadCaptiveRuntimeClasses()Z

    move-result v0

    .line 223
    .local v0, "hasCaptiveRuntime":Z
    if-nez v0, :cond_2

    .line 225
    sget-boolean v4, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    if-nez v4, :cond_1

    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->isRuntimeInstalled()Z

    move-result v4

    if-nez v4, :cond_1

    .line 230
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->isRuntimeOnExternalStorage()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 231
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->showRuntimeOnExternalStorageDialog()V

    .line 263
    :goto_0
    return-void

    .line 233
    :cond_0
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->showRuntimeNotInstalledDialog()V

    goto :goto_0

    .line 236
    :cond_1
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->loadSharedRuntimeDex()V

    .line 239
    :cond_2
    sget-boolean v4, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    if-eqz v4, :cond_3

    .line 241
    invoke-direct {p0, v0}, Lair/org/usatriathlon/membershipcard/AppEntry;->createActivityWrapper(Z)V

    .line 244
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeWrapperOnCreate()V

    goto :goto_0

    .line 248
    :cond_3
    if-eqz v0, :cond_4

    .line 252
    invoke-static {}, Lair/org/usatriathlon/membershipcard/AppEntry;->KillSelf()V

    goto :goto_0

    .line 260
    :cond_4
    invoke-direct {p0}, Lair/org/usatriathlon/membershipcard/AppEntry;->launchAIRService()V

    goto :goto_0
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 6
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    .line 742
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 746
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onCreateContextMenu"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/view/ContextMenu;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Landroid/view/View;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-class v5, Landroid/view/ContextMenu$ContextMenuInfo;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 747
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 753
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 749
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onCreateDescription()Ljava/lang/CharSequence;
    .locals 8

    .prologue
    .line 758
    invoke-super {p0}, Landroid/app/Activity;->onCreateDescription()Ljava/lang/CharSequence;

    move-result-object v2

    .line 762
    .local v2, "retval":Ljava/lang/CharSequence;
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onCreateDescription"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/CharSequence;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 763
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/CharSequence;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, p0

    .line 768
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 765
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move-object v3, v2

    .line 768
    goto :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 8
    .param p1, "id"    # I

    .prologue
    .line 1211
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v2

    .line 1215
    .local v2, "retval":Landroid/app/Dialog;
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onCreateDialog"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/app/Dialog;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1216
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Landroid/app/Dialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, p0

    .line 1221
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 1218
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move-object v3, v2

    .line 1221
    goto :goto_0
.end method

.method protected onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
    .locals 8
    .param p1, "id"    # I
    .param p2, "args"    # Landroid/os/Bundle;

    .prologue
    .line 1228
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object v2

    .line 1232
    .local v2, "retval":Landroid/app/Dialog;
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onCreateDialog"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/os/Bundle;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-class v7, Landroid/app/Dialog;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1233
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    aput-object v2, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Landroid/app/Dialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, p0

    .line 1238
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 1235
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move-object v3, v2

    .line 1238
    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 8
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 775
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v2

    .line 779
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onCreateOptionsMenu"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/view/Menu;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 780
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 785
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 782
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 785
    goto :goto_0
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 8
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 792
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v2

    .line 796
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onCreatePanelMenu"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/view/Menu;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 797
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 802
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 799
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 802
    goto :goto_0
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 8
    .param p1, "featureId"    # I

    .prologue
    .line 809
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreatePanelView(I)Landroid/view/View;

    move-result-object v2

    .line 813
    .local v2, "retval":Landroid/view/View;
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onCreatePanelView"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/view/View;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 814
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, p0

    .line 819
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 816
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move-object v3, v2

    .line 819
    goto :goto_0
.end method

.method public onCreateThumbnail(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;)Z
    .locals 8
    .param p1, "outBitmap"    # Landroid/graphics/Bitmap;
    .param p2, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 826
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onCreateThumbnail(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;)Z

    move-result v2

    .line 830
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onCreateThumbnail"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/graphics/Bitmap;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/graphics/Canvas;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 831
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 836
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 833
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 836
    goto :goto_0
.end method

.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 843
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v2

    .line 847
    .local v2, "retval":Landroid/view/View;
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onCreateView"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/content/Context;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-class v7, Landroid/util/AttributeSet;

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-class v7, Landroid/view/View;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 848
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    aput-object p3, v3, v4

    const/4 v4, 0x3

    aput-object v2, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, p0

    .line 853
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 850
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move-object v3, v2

    .line 853
    goto :goto_0
.end method

.method public onDestroy()V
    .locals 4

    .prologue
    .line 442
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 445
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onDestroy"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 446
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 452
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 448
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onDetachedFromWindow()V
    .locals 4

    .prologue
    .line 860
    invoke-super {p0}, Landroid/app/Activity;->onDetachedFromWindow()V

    .line 864
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onDetachedFromWindow"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 865
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 871
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 867
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 8
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 876
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v2

    .line 880
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onKeyDown"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/view/KeyEvent;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 881
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 886
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 883
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 886
    goto :goto_0
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .locals 8
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 893
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result v2

    .line 897
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onKeyLongPress"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/view/KeyEvent;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 898
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 903
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 900
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 903
    goto :goto_0
.end method

.method public onKeyMultiple(IILandroid/view/KeyEvent;)Z
    .locals 8
    .param p1, "keyCode"    # I
    .param p2, "repeatCount"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 910
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v2

    .line 914
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onKeyMultiple"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-class v7, Landroid/view/KeyEvent;

    aput-object v7, v5, v6

    const/4 v6, 0x3

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 915
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object p3, v3, v4

    const/4 v4, 0x3

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 920
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 917
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 920
    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 8
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 927
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v2

    .line 931
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onKeyUp"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/view/KeyEvent;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 932
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 937
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 934
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 937
    goto :goto_0
.end method

.method public onLowMemory()V
    .locals 4

    .prologue
    .line 516
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onLowMemory"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 517
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 523
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 519
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 8
    .param p1, "featureId"    # I
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 944
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v2

    .line 948
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onMenuItemSelected"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/view/MenuItem;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 949
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 954
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 951
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 954
    goto :goto_0
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 8
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 961
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result v2

    .line 965
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onMenuOpened"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/view/Menu;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 966
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 971
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 968
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 971
    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 7
    .param p1, "aIntent"    # Landroid/content/Intent;

    .prologue
    .line 545
    move-object v0, p1

    .line 546
    .local v0, "ii":Landroid/content/Intent;
    invoke-super {p0, v0}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 552
    :try_start_0
    sget-object v2, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v3, "onNewIntent"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Intent;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 553
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-direct {p0, v1, v2}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 559
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 555
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 8
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 979
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    .line 983
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onOptionsItemSelected"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/view/MenuItem;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 984
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 989
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 986
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 989
    goto :goto_0
.end method

.method public onOptionsMenuClosed(Landroid/view/Menu;)V
    .locals 6
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 996
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsMenuClosed(Landroid/view/Menu;)V

    .line 1000
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onOptionsMenuClosed"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/view/Menu;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1001
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1007
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1003
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 6
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1012
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onPanelClosed(ILandroid/view/Menu;)V

    .line 1016
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onPanelClosed"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Landroid/view/Menu;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1017
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1023
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1019
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onPause()V
    .locals 4

    .prologue
    .line 391
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 394
    :try_start_0
    sget-boolean v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    if-eqz v1, :cond_0

    .line 396
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onPause"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 397
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 404
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :cond_0
    :goto_0
    return-void

    .line 400
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 1245
    invoke-super {p0, p1}, Landroid/app/Activity;->onPostCreate(Landroid/os/Bundle;)V

    .line 1249
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onPostCreate"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/os/Bundle;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1250
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1256
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1252
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onPostResume()V
    .locals 4

    .prologue
    .line 1261
    invoke-super {p0}, Landroid/app/Activity;->onPostResume()V

    .line 1265
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onPostResume"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1266
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1272
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1268
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 6
    .param p1, "id"    # I
    .param p2, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 1277
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onPrepareDialog(ILandroid/app/Dialog;)V

    .line 1281
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onPrepareDialog"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/R$id;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Landroid/app/Dialog;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1282
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1288
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1284
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "id"    # I
    .param p2, "dialog"    # Landroid/app/Dialog;
    .param p3, "args"    # Landroid/os/Bundle;

    .prologue
    .line 1293
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onPrepareDialog(ILandroid/app/Dialog;Landroid/os/Bundle;)V

    .line 1297
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onPrepareDialog"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/R$id;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Landroid/app/Dialog;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-class v5, Landroid/os/Bundle;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1298
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1304
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1300
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 8
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1028
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v2

    .line 1032
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onPrepareOptionsMenu"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/view/Menu;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1033
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 1038
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 1035
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 1038
    goto :goto_0
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 8
    .param p1, "featureId"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1045
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v2

    .line 1049
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onPreparePanel"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Landroid/view/View;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-class v7, Landroid/view/Menu;

    aput-object v7, v5, v6

    const/4 v6, 0x3

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1050
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    aput-object p3, v3, v4

    const/4 v4, 0x3

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 1055
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 1052
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 1055
    goto :goto_0
.end method

.method public onRestart()V
    .locals 4

    .prologue
    .line 373
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 376
    :try_start_0
    sget-boolean v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    if-eqz v1, :cond_0

    .line 378
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onRestart"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 379
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 386
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :cond_0
    :goto_0
    return-void

    .line 382
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 1309
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 1313
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onRestoreInstanceState"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/os/Bundle;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1314
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1320
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1316
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 409
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 412
    :try_start_0
    sget-boolean v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sRuntimeClassesLoaded:Z

    if-eqz v1, :cond_0

    .line 414
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onResume"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 415
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 422
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :cond_0
    :goto_0
    return-void

    .line 418
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 8

    .prologue
    .line 1062
    invoke-super {p0}, Landroid/app/Activity;->onRetainNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v2

    .line 1066
    .local v2, "retval":Ljava/lang/Object;
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onRetainNonConfigurationInstance"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/Object;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1067
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 1072
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 1069
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move-object v3, v2

    .line 1072
    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 1325
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 1329
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onSaveInstanceState"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/os/Bundle;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1330
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1336
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1332
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onSearchRequested()Z
    .locals 8

    .prologue
    .line 1079
    invoke-super {p0}, Landroid/app/Activity;->onSearchRequested()Z

    move-result v2

    .line 1083
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onSearchRequested"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1084
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 1089
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 1086
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 1089
    goto :goto_0
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 367
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 368
    return-void
.end method

.method public onStop()V
    .locals 4

    .prologue
    .line 427
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 430
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onStop"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 431
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 437
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 433
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onTitleChanged(Ljava/lang/CharSequence;I)V
    .locals 6
    .param p1, "title"    # Ljava/lang/CharSequence;
    .param p2, "color"    # I

    .prologue
    .line 1341
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onTitleChanged(Ljava/lang/CharSequence;I)V

    .line 1345
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onTitleChanged"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/CharSequence;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1346
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1352
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1348
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 1096
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 1100
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onTouchEvent"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/view/MotionEvent;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1101
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 1106
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 1103
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 1106
    goto :goto_0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 1113
    invoke-super {p0, p1}, Landroid/app/Activity;->onTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 1117
    .local v2, "retval":Z
    :try_start_0
    sget-object v3, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v4, "onTrackballEvent"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/view/MotionEvent;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1118
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {p0, v1, v3}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lair/org/usatriathlon/membershipcard/AppEntry;
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 1124
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v3

    .line 1121
    :catch_0
    move-exception v3

    move-object v0, v3

    .local v0, "e":Ljava/lang/Exception;
    move v3, v2

    .line 1124
    goto :goto_0
.end method

.method public onUserInteraction()V
    .locals 4

    .prologue
    .line 1131
    invoke-super {p0}, Landroid/app/Activity;->onUserInteraction()V

    .line 1135
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onUserInteraction"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1136
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1142
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1138
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onUserLeaveHint()V
    .locals 4

    .prologue
    .line 1357
    invoke-super {p0}, Landroid/app/Activity;->onUserLeaveHint()V

    .line 1361
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onUserLeaveHint"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1362
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1368
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1364
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .locals 6
    .param p1, "params"    # Landroid/view/WindowManager$LayoutParams;

    .prologue
    .line 1147
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 1151
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onWindowAttributesChanged"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/view/WindowManager$LayoutParams;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1152
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1158
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1154
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 6
    .param p1, "hasFocus"    # Z

    .prologue
    .line 1163
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 1167
    :try_start_0
    sget-object v1, Lair/org/usatriathlon/membershipcard/AppEntry;->sAndroidActivityWrapperClass:Ljava/lang/Class;

    const-string v2, "onWindowFocusChanged"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1168
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lair/org/usatriathlon/membershipcard/AppEntry;->InvokeMethod(Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1174
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1170
    :catch_0
    move-exception v1

    goto :goto_0
.end method
