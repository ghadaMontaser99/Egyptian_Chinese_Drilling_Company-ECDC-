USE [FreelanceJobDB]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [ClientName], [IsDeleted]) VALUES (1, N'Meditera ', 0)
INSERT [dbo].[Client] ([Id], [ClientName], [IsDeleted]) VALUES (2, N'Petropel', 0)
INSERT [dbo].[Client] ([Id], [ClientName], [IsDeleted]) VALUES (3, N'Tag oil', 0)
INSERT [dbo].[Client] ([Id], [ClientName], [IsDeleted]) VALUES (4, N'Khalda', 0)
INSERT [dbo].[Client] ([Id], [ClientName], [IsDeleted]) VALUES (5, N'Babetco', 0)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231123062257_init', N'7.0.5')
GO
