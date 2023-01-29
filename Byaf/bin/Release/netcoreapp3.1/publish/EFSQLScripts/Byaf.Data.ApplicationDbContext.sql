IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        [Password] nvarchar(max) NULL,
        [Role] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [Category] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [ProductCount] int NOT NULL,
        CONSTRAINT [PK_Category] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [Country] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_Country] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [OrderStatus] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_OrderStatus] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [PaymentStatus] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_PaymentStatus] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [PaymentType] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_PaymentType] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [City] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [CountryId] int NULL,
        CONSTRAINT [PK_City] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_City_Country_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Country] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [Payment] (
        [Id] int NOT NULL IDENTITY,
        [PaymentTypeId] int NULL,
        [PaymentStatusId] int NULL,
        [DateTime] datetime2 NOT NULL,
        [Allowed] bit NOT NULL,
        CONSTRAINT [PK_Payment] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Payment_PaymentStatus_PaymentStatusId] FOREIGN KEY ([PaymentStatusId]) REFERENCES [PaymentStatus] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Payment_PaymentType_PaymentTypeId] FOREIGN KEY ([PaymentTypeId]) REFERENCES [PaymentType] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [Area] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [CityId] int NULL,
        CONSTRAINT [PK_Area] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Area_City_CityId] FOREIGN KEY ([CityId]) REFERENCES [City] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [Address] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [AddressLine1] nvarchar(max) NULL,
        [AddressLine2] nvarchar(max) NULL,
        [LandMark] nvarchar(max) NULL,
        [PostalCode] nvarchar(max) NULL,
        [AreaId] int NULL,
        CONSTRAINT [PK_Address] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Address_Area_AreaId] FOREIGN KEY ([AreaId]) REFERENCES [Area] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [Customer] (
        [Id] int NOT NULL IDENTITY,
        [FirstName] nvarchar(max) NULL,
        [LastName] nvarchar(max) NULL,
        [AddressId] int NULL,
        [PhoneNo] nvarchar(max) NULL,
        [Email] nvarchar(max) NULL,
        CONSTRAINT [PK_Customer] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Customer_Address_AddressId] FOREIGN KEY ([AddressId]) REFERENCES [Address] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [Order] (
        [Id] int NOT NULL IDENTITY,
        [CustomerId] int NULL,
        [PaymentId] int NULL,
        [DateTime] datetime2 NOT NULL,
        [OrderStatusId] int NULL,
        CONSTRAINT [PK_Order] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Order_Customer_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [Customer] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Order_OrderStatus_OrderStatusId] FOREIGN KEY ([OrderStatusId]) REFERENCES [OrderStatus] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Order_Payment_PaymentId] FOREIGN KEY ([PaymentId]) REFERENCES [Payment] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [PaymentInfo] (
        [Id] int NOT NULL IDENTITY,
        [CreditCard] nvarchar(max) NULL,
        [CreditCardNo] nvarchar(max) NULL,
        [CreditCardExpiryDate] nvarchar(max) NULL,
        [CVV] nvarchar(max) NULL,
        [CustomerId] int NULL,
        CONSTRAINT [PK_PaymentInfo] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_PaymentInfo_Customer_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [Customer] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [OrderDetails] (
        [Id] int NOT NULL IDENTITY,
        [OrderId] int NULL,
        [Total] decimal(18,2) NOT NULL,
        [ItemsQty] int NOT NULL,
        CONSTRAINT [PK_OrderDetails] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_OrderDetails_Order_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Order] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [Product] (
        [Id] int NOT NULL IDENTITY,
        [Code] nvarchar(max) NULL,
        [Name] nvarchar(max) NULL,
        [CategoryId] int NULL,
        [TotalCost] decimal(18,2) NOT NULL,
        [SalesPrice] decimal(18,2) NOT NULL,
        [DiscountPrice] decimal(18,2) NOT NULL,
        [Profit] decimal(18,2) NOT NULL,
        [Qty] int NOT NULL,
        [Description] nvarchar(max) NULL,
        [OrderDetailsId] int NULL,
        CONSTRAINT [PK_Product] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Product_Category_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Product_OrderDetails_OrderDetailsId] FOREIGN KEY ([OrderDetailsId]) REFERENCES [OrderDetails] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE TABLE [Cost] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Price] decimal(18,2) NOT NULL,
        [ProductId] int NULL,
        CONSTRAINT [PK_Cost] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Cost_Product_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Product] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Address_AreaId] ON [Address] ([AreaId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Area_CityId] ON [Area] ([CityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_City_CountryId] ON [City] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Cost_ProductId] ON [Cost] ([ProductId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Customer_AddressId] ON [Customer] ([AddressId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Order_CustomerId] ON [Order] ([CustomerId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Order_OrderStatusId] ON [Order] ([OrderStatusId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Order_PaymentId] ON [Order] ([PaymentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_OrderDetails_OrderId] ON [OrderDetails] ([OrderId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Payment_PaymentStatusId] ON [Payment] ([PaymentStatusId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Payment_PaymentTypeId] ON [Payment] ([PaymentTypeId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_PaymentInfo_CustomerId] ON [PaymentInfo] ([CustomerId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Product_CategoryId] ON [Product] ([CategoryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    CREATE INDEX [IX_Product_OrderDetailsId] ON [Product] ([OrderDetailsId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221213224400_inital migration')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221213224400_inital migration', N'3.1.24');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Address] DROP CONSTRAINT [FK_Address_Area_AreaId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Area] DROP CONSTRAINT [FK_Area_City_CityId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [City] DROP CONSTRAINT [FK_City_Country_CountryId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Cost] DROP CONSTRAINT [FK_Cost_Product_ProductId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Customer] DROP CONSTRAINT [FK_Customer_Address_AddressId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Order] DROP CONSTRAINT [FK_Order_Customer_CustomerId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Order] DROP CONSTRAINT [FK_Order_OrderStatus_OrderStatusId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Order] DROP CONSTRAINT [FK_Order_Payment_PaymentId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Order_OrderId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Payment] DROP CONSTRAINT [FK_Payment_PaymentStatus_PaymentStatusId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Payment] DROP CONSTRAINT [FK_Payment_PaymentType_PaymentTypeId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [PaymentInfo] DROP CONSTRAINT [FK_PaymentInfo_Customer_CustomerId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Product] DROP CONSTRAINT [FK_Product_Category_CategoryId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    ALTER TABLE [Product] DROP CONSTRAINT [FK_Product_OrderDetails_OrderDetailsId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP TABLE [PaymentType];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Product_CategoryId] ON [Product];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Product_OrderDetailsId] ON [Product];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_PaymentInfo_CustomerId] ON [PaymentInfo];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Payment_PaymentStatusId] ON [Payment];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Payment_PaymentTypeId] ON [Payment];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_OrderDetails_OrderId] ON [OrderDetails];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Order_CustomerId] ON [Order];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Order_OrderStatusId] ON [Order];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Order_PaymentId] ON [Order];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Customer_AddressId] ON [Customer];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Cost_ProductId] ON [Cost];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_City_CountryId] ON [City];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Area_CityId] ON [Area];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DROP INDEX [IX_Address_AreaId] ON [Address];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Product]') AND [c].[name] = N'CategoryId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Product] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Product] DROP COLUMN [CategoryId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Product]') AND [c].[name] = N'OrderDetailsId');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Product] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Product] DROP COLUMN [OrderDetailsId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PaymentInfo]') AND [c].[name] = N'CustomerId');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [PaymentInfo] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [PaymentInfo] DROP COLUMN [CustomerId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Customer]') AND [c].[name] = N'AddressId');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Customer] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Customer] DROP COLUMN [AddressId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Cost]') AND [c].[name] = N'ProductId');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Cost] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [Cost] DROP COLUMN [ProductId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Payment]') AND [c].[name] = N'PaymentTypeId');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Payment] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [Payment] ALTER COLUMN [PaymentTypeId] int NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Payment]') AND [c].[name] = N'PaymentStatusId');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Payment] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Payment] ALTER COLUMN [PaymentStatusId] int NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderDetails]') AND [c].[name] = N'OrderId');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [OrderDetails] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [OrderDetails] ALTER COLUMN [OrderId] int NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Order]') AND [c].[name] = N'PaymentId');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Order] DROP CONSTRAINT [' + @var8 + '];');
    ALTER TABLE [Order] ALTER COLUMN [PaymentId] int NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Order]') AND [c].[name] = N'OrderStatusId');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [Order] DROP CONSTRAINT [' + @var9 + '];');
    ALTER TABLE [Order] ALTER COLUMN [OrderStatusId] int NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Order]') AND [c].[name] = N'CustomerId');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Order] DROP CONSTRAINT [' + @var10 + '];');
    ALTER TABLE [Order] ALTER COLUMN [CustomerId] int NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var11 sysname;
    SELECT @var11 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[City]') AND [c].[name] = N'CountryId');
    IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [City] DROP CONSTRAINT [' + @var11 + '];');
    ALTER TABLE [City] ALTER COLUMN [CountryId] int NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var12 sysname;
    SELECT @var12 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Area]') AND [c].[name] = N'CityId');
    IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [Area] DROP CONSTRAINT [' + @var12 + '];');
    ALTER TABLE [Area] ALTER COLUMN [CityId] int NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    DECLARE @var13 sysname;
    SELECT @var13 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Address]') AND [c].[name] = N'AreaId');
    IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [Address] DROP CONSTRAINT [' + @var13 + '];');
    ALTER TABLE [Address] ALTER COLUMN [AreaId] int NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    CREATE TABLE [CustomerAddress] (
        [Id] int NOT NULL IDENTITY,
        [CustomerId] int NOT NULL,
        [AddressId] int NOT NULL,
        CONSTRAINT [PK_CustomerAddress] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    CREATE TABLE [CustomerPaymentInfo] (
        [Id] int NOT NULL IDENTITY,
        [CustomerId] int NOT NULL,
        [PaymentInfoId] int NOT NULL,
        CONSTRAINT [PK_CustomerPaymentInfo] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    CREATE TABLE [OrderDetailsProduct] (
        [Id] int NOT NULL IDENTITY,
        [OrderDetailsId] int NOT NULL,
        [ProductId] int NOT NULL,
        CONSTRAINT [PK_OrderDetailsProduct] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    CREATE TABLE [ProductCategory] (
        [Id] int NOT NULL IDENTITY,
        [ProductId] int NOT NULL,
        [CategoryId] int NOT NULL,
        CONSTRAINT [PK_ProductCategory] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    CREATE TABLE [ProductCost] (
        [Id] int NOT NULL IDENTITY,
        [ProductId] int NOT NULL,
        [CostId] int NOT NULL,
        CONSTRAINT [PK_ProductCost] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221214173125_fix forign keys')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221214173125_fix forign keys', N'3.1.24');
END;

GO

