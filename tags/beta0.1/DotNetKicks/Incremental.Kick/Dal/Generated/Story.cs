using System; 
using System.Text; 
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration; 
using System.Xml; 
using System.Xml.Serialization;
using SubSonic; 
using SubSonic.Utilities;

namespace Incremental.Kick.Dal
{
	/// <summary>
	/// Strongly-typed collection for the Story class.
	/// </summary>
	[Serializable]
	public partial class StoryCollection : ActiveList<Story, StoryCollection> 
	{	   
		public StoryCollection() {}

	}

	/// <summary>
	/// This is an ActiveRecord class which wraps the Kick_Story table.
	/// </summary>
	[Serializable]
	public partial class Story : ActiveRecord<Story>
	{
		#region .ctors and Default Settings
		
		public Story()
		{
		  SetSQLProps();
		  InitSetDefaults();
		  MarkNew();
		}

		
		private void InitSetDefaults() { SetDefaults(); }

		
		public Story(bool useDatabaseDefaults)
		{
			SetSQLProps();
			if(useDatabaseDefaults)
				ForceDefaults();
			MarkNew();
		}

		public Story(object keyID)
		{
			SetSQLProps();
			InitSetDefaults();
			LoadByKey(keyID);
		}

		 
		public Story(string columnName, object columnValue)
		{
			SetSQLProps();
			InitSetDefaults();
			LoadByParam(columnName,columnValue);
		}

		
		protected static void SetSQLProps() { GetTableSchema(); }

		
		#endregion
		
		#region Schema and Query Accessor
		public static Query CreateQuery() { return new Query(Schema); }

		
		public static TableSchema.Table Schema
		{
			get
			{
				if (BaseSchema == null)
					SetSQLProps();
				return BaseSchema;
			}

		}

		
		private static void GetTableSchema() 
		{
			if(!IsSchemaInitialized)
			{
				//Schema declaration
				TableSchema.Table schema = new TableSchema.Table("Kick_Story", TableType.Table, DataService.GetInstance("DotNetKicks"));
				schema.Columns = new TableSchema.TableColumnCollection();
				schema.SchemaName = @"dbo";
				//columns
				
				TableSchema.TableColumn colvarStoryID = new TableSchema.TableColumn(schema);
				colvarStoryID.ColumnName = "StoryID";
				colvarStoryID.DataType = DbType.Int32;
				colvarStoryID.MaxLength = 0;
				colvarStoryID.AutoIncrement = true;
				colvarStoryID.IsNullable = false;
				colvarStoryID.IsPrimaryKey = true;
				colvarStoryID.IsForeignKey = false;
				colvarStoryID.IsReadOnly = false;
				colvarStoryID.DefaultSetting = @"";
				colvarStoryID.ForeignKeyTableName = "";
				schema.Columns.Add(colvarStoryID);
				
				TableSchema.TableColumn colvarHostID = new TableSchema.TableColumn(schema);
				colvarHostID.ColumnName = "HostID";
				colvarHostID.DataType = DbType.Int32;
				colvarHostID.MaxLength = 0;
				colvarHostID.AutoIncrement = false;
				colvarHostID.IsNullable = false;
				colvarHostID.IsPrimaryKey = false;
				colvarHostID.IsForeignKey = true;
				colvarHostID.IsReadOnly = false;
				colvarHostID.DefaultSetting = @"";
				
					colvarHostID.ForeignKeyTableName = "Kick_Host";
				schema.Columns.Add(colvarHostID);
				
				TableSchema.TableColumn colvarStoryIdentifier = new TableSchema.TableColumn(schema);
				colvarStoryIdentifier.ColumnName = "StoryIdentifier";
				colvarStoryIdentifier.DataType = DbType.String;
				colvarStoryIdentifier.MaxLength = 255;
				colvarStoryIdentifier.AutoIncrement = false;
				colvarStoryIdentifier.IsNullable = false;
				colvarStoryIdentifier.IsPrimaryKey = false;
				colvarStoryIdentifier.IsForeignKey = false;
				colvarStoryIdentifier.IsReadOnly = false;
				colvarStoryIdentifier.DefaultSetting = @"";
				colvarStoryIdentifier.ForeignKeyTableName = "";
				schema.Columns.Add(colvarStoryIdentifier);
				
				TableSchema.TableColumn colvarTitle = new TableSchema.TableColumn(schema);
				colvarTitle.ColumnName = "Title";
				colvarTitle.DataType = DbType.String;
				colvarTitle.MaxLength = 255;
				colvarTitle.AutoIncrement = false;
				colvarTitle.IsNullable = false;
				colvarTitle.IsPrimaryKey = false;
				colvarTitle.IsForeignKey = false;
				colvarTitle.IsReadOnly = false;
				colvarTitle.DefaultSetting = @"";
				colvarTitle.ForeignKeyTableName = "";
				schema.Columns.Add(colvarTitle);
				
				TableSchema.TableColumn colvarDescription = new TableSchema.TableColumn(schema);
				colvarDescription.ColumnName = "Description";
				colvarDescription.DataType = DbType.String;
				colvarDescription.MaxLength = 4000;
				colvarDescription.AutoIncrement = false;
				colvarDescription.IsNullable = false;
				colvarDescription.IsPrimaryKey = false;
				colvarDescription.IsForeignKey = false;
				colvarDescription.IsReadOnly = false;
				colvarDescription.DefaultSetting = @"";
				colvarDescription.ForeignKeyTableName = "";
				schema.Columns.Add(colvarDescription);
				
				TableSchema.TableColumn colvarUrl = new TableSchema.TableColumn(schema);
				colvarUrl.ColumnName = "Url";
				colvarUrl.DataType = DbType.String;
				colvarUrl.MaxLength = 1000;
				colvarUrl.AutoIncrement = false;
				colvarUrl.IsNullable = false;
				colvarUrl.IsPrimaryKey = false;
				colvarUrl.IsForeignKey = false;
				colvarUrl.IsReadOnly = false;
				colvarUrl.DefaultSetting = @"";
				colvarUrl.ForeignKeyTableName = "";
				schema.Columns.Add(colvarUrl);
				
				TableSchema.TableColumn colvarCategoryID = new TableSchema.TableColumn(schema);
				colvarCategoryID.ColumnName = "CategoryID";
				colvarCategoryID.DataType = DbType.Int16;
				colvarCategoryID.MaxLength = 0;
				colvarCategoryID.AutoIncrement = false;
				colvarCategoryID.IsNullable = false;
				colvarCategoryID.IsPrimaryKey = false;
				colvarCategoryID.IsForeignKey = true;
				colvarCategoryID.IsReadOnly = false;
				colvarCategoryID.DefaultSetting = @"";
				
					colvarCategoryID.ForeignKeyTableName = "Kick_Category";
				schema.Columns.Add(colvarCategoryID);
				
				TableSchema.TableColumn colvarUserID = new TableSchema.TableColumn(schema);
				colvarUserID.ColumnName = "UserID";
				colvarUserID.DataType = DbType.Int32;
				colvarUserID.MaxLength = 0;
				colvarUserID.AutoIncrement = false;
				colvarUserID.IsNullable = false;
				colvarUserID.IsPrimaryKey = false;
				colvarUserID.IsForeignKey = true;
				colvarUserID.IsReadOnly = false;
				
						colvarUserID.DefaultSetting = @"((1))";
				
					colvarUserID.ForeignKeyTableName = "Kick_User";
				schema.Columns.Add(colvarUserID);
				
				TableSchema.TableColumn colvarUsername = new TableSchema.TableColumn(schema);
				colvarUsername.ColumnName = "Username";
				colvarUsername.DataType = DbType.String;
				colvarUsername.MaxLength = 50;
				colvarUsername.AutoIncrement = false;
				colvarUsername.IsNullable = false;
				colvarUsername.IsPrimaryKey = false;
				colvarUsername.IsForeignKey = false;
				colvarUsername.IsReadOnly = false;
				colvarUsername.DefaultSetting = @"";
				colvarUsername.ForeignKeyTableName = "";
				schema.Columns.Add(colvarUsername);
				
				TableSchema.TableColumn colvarKickCount = new TableSchema.TableColumn(schema);
				colvarKickCount.ColumnName = "KickCount";
				colvarKickCount.DataType = DbType.Int32;
				colvarKickCount.MaxLength = 0;
				colvarKickCount.AutoIncrement = false;
				colvarKickCount.IsNullable = false;
				colvarKickCount.IsPrimaryKey = false;
				colvarKickCount.IsForeignKey = false;
				colvarKickCount.IsReadOnly = false;
				colvarKickCount.DefaultSetting = @"";
				colvarKickCount.ForeignKeyTableName = "";
				schema.Columns.Add(colvarKickCount);
				
				TableSchema.TableColumn colvarSpamCount = new TableSchema.TableColumn(schema);
				colvarSpamCount.ColumnName = "SpamCount";
				colvarSpamCount.DataType = DbType.Int32;
				colvarSpamCount.MaxLength = 0;
				colvarSpamCount.AutoIncrement = false;
				colvarSpamCount.IsNullable = false;
				colvarSpamCount.IsPrimaryKey = false;
				colvarSpamCount.IsForeignKey = false;
				colvarSpamCount.IsReadOnly = false;
				colvarSpamCount.DefaultSetting = @"";
				colvarSpamCount.ForeignKeyTableName = "";
				schema.Columns.Add(colvarSpamCount);
				
				TableSchema.TableColumn colvarViewCount = new TableSchema.TableColumn(schema);
				colvarViewCount.ColumnName = "ViewCount";
				colvarViewCount.DataType = DbType.Int32;
				colvarViewCount.MaxLength = 0;
				colvarViewCount.AutoIncrement = false;
				colvarViewCount.IsNullable = false;
				colvarViewCount.IsPrimaryKey = false;
				colvarViewCount.IsForeignKey = false;
				colvarViewCount.IsReadOnly = false;
				colvarViewCount.DefaultSetting = @"";
				colvarViewCount.ForeignKeyTableName = "";
				schema.Columns.Add(colvarViewCount);
				
				TableSchema.TableColumn colvarCommentCount = new TableSchema.TableColumn(schema);
				colvarCommentCount.ColumnName = "CommentCount";
				colvarCommentCount.DataType = DbType.Int32;
				colvarCommentCount.MaxLength = 0;
				colvarCommentCount.AutoIncrement = false;
				colvarCommentCount.IsNullable = false;
				colvarCommentCount.IsPrimaryKey = false;
				colvarCommentCount.IsForeignKey = false;
				colvarCommentCount.IsReadOnly = false;
				colvarCommentCount.DefaultSetting = @"";
				colvarCommentCount.ForeignKeyTableName = "";
				schema.Columns.Add(colvarCommentCount);
				
				TableSchema.TableColumn colvarIsPublishedToHomepage = new TableSchema.TableColumn(schema);
				colvarIsPublishedToHomepage.ColumnName = "IsPublishedToHomepage";
				colvarIsPublishedToHomepage.DataType = DbType.Boolean;
				colvarIsPublishedToHomepage.MaxLength = 0;
				colvarIsPublishedToHomepage.AutoIncrement = false;
				colvarIsPublishedToHomepage.IsNullable = false;
				colvarIsPublishedToHomepage.IsPrimaryKey = false;
				colvarIsPublishedToHomepage.IsForeignKey = false;
				colvarIsPublishedToHomepage.IsReadOnly = false;
				colvarIsPublishedToHomepage.DefaultSetting = @"";
				colvarIsPublishedToHomepage.ForeignKeyTableName = "";
				schema.Columns.Add(colvarIsPublishedToHomepage);
				
				TableSchema.TableColumn colvarIsSpam = new TableSchema.TableColumn(schema);
				colvarIsSpam.ColumnName = "IsSpam";
				colvarIsSpam.DataType = DbType.Boolean;
				colvarIsSpam.MaxLength = 0;
				colvarIsSpam.AutoIncrement = false;
				colvarIsSpam.IsNullable = false;
				colvarIsSpam.IsPrimaryKey = false;
				colvarIsSpam.IsForeignKey = false;
				colvarIsSpam.IsReadOnly = false;
				colvarIsSpam.DefaultSetting = @"";
				colvarIsSpam.ForeignKeyTableName = "";
				schema.Columns.Add(colvarIsSpam);
				
				TableSchema.TableColumn colvarAdsenseID = new TableSchema.TableColumn(schema);
				colvarAdsenseID.ColumnName = "AdsenseID";
				colvarAdsenseID.DataType = DbType.String;
				colvarAdsenseID.MaxLength = 30;
				colvarAdsenseID.AutoIncrement = false;
				colvarAdsenseID.IsNullable = false;
				colvarAdsenseID.IsPrimaryKey = false;
				colvarAdsenseID.IsForeignKey = false;
				colvarAdsenseID.IsReadOnly = false;
				
						colvarAdsenseID.DefaultSetting = @"('')";
				colvarAdsenseID.ForeignKeyTableName = "";
				schema.Columns.Add(colvarAdsenseID);
				
				TableSchema.TableColumn colvarCreatedOn = new TableSchema.TableColumn(schema);
				colvarCreatedOn.ColumnName = "CreatedOn";
				colvarCreatedOn.DataType = DbType.DateTime;
				colvarCreatedOn.MaxLength = 0;
				colvarCreatedOn.AutoIncrement = false;
				colvarCreatedOn.IsNullable = false;
				colvarCreatedOn.IsPrimaryKey = false;
				colvarCreatedOn.IsForeignKey = false;
				colvarCreatedOn.IsReadOnly = false;
				colvarCreatedOn.DefaultSetting = @"";
				colvarCreatedOn.ForeignKeyTableName = "";
				schema.Columns.Add(colvarCreatedOn);
				
				TableSchema.TableColumn colvarPublishedOn = new TableSchema.TableColumn(schema);
				colvarPublishedOn.ColumnName = "PublishedOn";
				colvarPublishedOn.DataType = DbType.DateTime;
				colvarPublishedOn.MaxLength = 0;
				colvarPublishedOn.AutoIncrement = false;
				colvarPublishedOn.IsNullable = false;
				colvarPublishedOn.IsPrimaryKey = false;
				colvarPublishedOn.IsForeignKey = false;
				colvarPublishedOn.IsReadOnly = false;
				colvarPublishedOn.DefaultSetting = @"";
				colvarPublishedOn.ForeignKeyTableName = "";
				schema.Columns.Add(colvarPublishedOn);
				
				BaseSchema = schema;
				//add this schema to the provider
				//so we can query it later
				DataService.Providers["DotNetKicks"].AddSchema("Kick_Story",schema);
			}

		}

		#endregion
		
		#region Props
		
		  
		[XmlAttribute("StoryID")]
		public int StoryID 
		{
			get { return GetColumnValue<int>("StoryID"); }

			set { SetColumnValue("StoryID", value); }

		}

		  
		[XmlAttribute("HostID")]
		public int HostID 
		{
			get { return GetColumnValue<int>("HostID"); }

			set { SetColumnValue("HostID", value); }

		}

		  
		[XmlAttribute("StoryIdentifier")]
		public string StoryIdentifier 
		{
			get { return GetColumnValue<string>("StoryIdentifier"); }

			set { SetColumnValue("StoryIdentifier", value); }

		}

		  
		[XmlAttribute("Title")]
		public string Title 
		{
			get { return GetColumnValue<string>("Title"); }

			set { SetColumnValue("Title", value); }

		}

		  
		[XmlAttribute("Description")]
		public string Description 
		{
			get { return GetColumnValue<string>("Description"); }

			set { SetColumnValue("Description", value); }

		}

		  
		[XmlAttribute("Url")]
		public string Url 
		{
			get { return GetColumnValue<string>("Url"); }

			set { SetColumnValue("Url", value); }

		}

		  
		[XmlAttribute("CategoryID")]
		public short CategoryID 
		{
			get { return GetColumnValue<short>("CategoryID"); }

			set { SetColumnValue("CategoryID", value); }

		}

		  
		[XmlAttribute("UserID")]
		public int UserID 
		{
			get { return GetColumnValue<int>("UserID"); }

			set { SetColumnValue("UserID", value); }

		}

		  
		[XmlAttribute("Username")]
		public string Username 
		{
			get { return GetColumnValue<string>("Username"); }

			set { SetColumnValue("Username", value); }

		}

		  
		[XmlAttribute("KickCount")]
		public int KickCount 
		{
			get { return GetColumnValue<int>("KickCount"); }

			set { SetColumnValue("KickCount", value); }

		}

		  
		[XmlAttribute("SpamCount")]
		public int SpamCount 
		{
			get { return GetColumnValue<int>("SpamCount"); }

			set { SetColumnValue("SpamCount", value); }

		}

		  
		[XmlAttribute("ViewCount")]
		public int ViewCount 
		{
			get { return GetColumnValue<int>("ViewCount"); }

			set { SetColumnValue("ViewCount", value); }

		}

		  
		[XmlAttribute("CommentCount")]
		public int CommentCount 
		{
			get { return GetColumnValue<int>("CommentCount"); }

			set { SetColumnValue("CommentCount", value); }

		}

		  
		[XmlAttribute("IsPublishedToHomepage")]
		public bool IsPublishedToHomepage 
		{
			get { return GetColumnValue<bool>("IsPublishedToHomepage"); }

			set { SetColumnValue("IsPublishedToHomepage", value); }

		}

		  
		[XmlAttribute("IsSpam")]
		public bool IsSpam 
		{
			get { return GetColumnValue<bool>("IsSpam"); }

			set { SetColumnValue("IsSpam", value); }

		}

		  
		[XmlAttribute("AdsenseID")]
		public string AdsenseID 
		{
			get { return GetColumnValue<string>("AdsenseID"); }

			set { SetColumnValue("AdsenseID", value); }

		}

		  
		[XmlAttribute("CreatedOn")]
		public DateTime CreatedOn 
		{
			get { return GetColumnValue<DateTime>("CreatedOn"); }

			set { SetColumnValue("CreatedOn", value); }

		}

		  
		[XmlAttribute("PublishedOn")]
		public DateTime PublishedOn 
		{
			get { return GetColumnValue<DateTime>("PublishedOn"); }

			set { SetColumnValue("PublishedOn", value); }

		}

		
		#endregion
		
		
		#region PrimaryKey Methods
		
		private Incremental.Kick.Dal.CommentCollection colCommentRecords;
		public Incremental.Kick.Dal.CommentCollection CommentRecords()
		{
			if(colCommentRecords == null)
				colCommentRecords = new Incremental.Kick.Dal.CommentCollection().Where(Comment.Columns.StoryID, StoryID).Load();
			return colCommentRecords;
		}

		private Incremental.Kick.Dal.StoryKickCollection colStoryKickRecords;
		public Incremental.Kick.Dal.StoryKickCollection StoryKickRecords()
		{
			if(colStoryKickRecords == null)
				colStoryKickRecords = new Incremental.Kick.Dal.StoryKickCollection().Where(StoryKick.Columns.StoryID, StoryID).Load();
			return colStoryKickRecords;
		}

		private Incremental.Kick.Dal.StoryUserHostTagCollection colStoryUserHostTagRecords;
		public Incremental.Kick.Dal.StoryUserHostTagCollection StoryUserHostTagRecords()
		{
			if(colStoryUserHostTagRecords == null)
				colStoryUserHostTagRecords = new Incremental.Kick.Dal.StoryUserHostTagCollection().Where(StoryUserHostTag.Columns.StoryID, StoryID).Load();
			return colStoryUserHostTagRecords;
		}

		#endregion
		
			
		
		#region ForeignKey Properties
		
		/// <summary>
		/// Returns a Category ActiveRecord object related to this Story
		/// 
		/// </summary>
		public Incremental.Kick.Dal.Category Category
		{
			get { return Incremental.Kick.Dal.Category.FetchByID(this.CategoryID); }

			set { SetColumnValue("CategoryID", value.CategoryID); }

		}

		
		
		/// <summary>
		/// Returns a Host ActiveRecord object related to this Story
		/// 
		/// </summary>
		public Incremental.Kick.Dal.Host Host
		{
			get { return Incremental.Kick.Dal.Host.FetchByID(this.HostID); }

			set { SetColumnValue("HostID", value.HostID); }

		}

		
		
		/// <summary>
		/// Returns a User ActiveRecord object related to this Story
		/// 
		/// </summary>
		public Incremental.Kick.Dal.User User
		{
			get { return Incremental.Kick.Dal.User.FetchByID(this.UserID); }

			set { SetColumnValue("UserID", value.UserID); }

		}

		
		
		#endregion
		
		
		
		//no ManyToMany tables defined (0)
		
		#region ObjectDataSource support
		
		
		/// <summary>
		/// Inserts a record, can be used with the Object Data Source
		/// </summary>
		public static void Insert(int varHostID,string varStoryIdentifier,string varTitle,string varDescription,string varUrl,short varCategoryID,int varUserID,string varUsername,int varKickCount,int varSpamCount,int varViewCount,int varCommentCount,bool varIsPublishedToHomepage,bool varIsSpam,string varAdsenseID,DateTime varCreatedOn,DateTime varPublishedOn)
		{
			Story item = new Story();
			
			item.HostID = varHostID;
			
			item.StoryIdentifier = varStoryIdentifier;
			
			item.Title = varTitle;
			
			item.Description = varDescription;
			
			item.Url = varUrl;
			
			item.CategoryID = varCategoryID;
			
			item.UserID = varUserID;
			
			item.Username = varUsername;
			
			item.KickCount = varKickCount;
			
			item.SpamCount = varSpamCount;
			
			item.ViewCount = varViewCount;
			
			item.CommentCount = varCommentCount;
			
			item.IsPublishedToHomepage = varIsPublishedToHomepage;
			
			item.IsSpam = varIsSpam;
			
			item.AdsenseID = varAdsenseID;
			
			item.CreatedOn = varCreatedOn;
			
			item.PublishedOn = varPublishedOn;
			
		
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}

		
		/// <summary>
		/// Updates a record, can be used with the Object Data Source
		/// </summary>
		public static void Update(int varStoryID,int varHostID,string varStoryIdentifier,string varTitle,string varDescription,string varUrl,short varCategoryID,int varUserID,string varUsername,int varKickCount,int varSpamCount,int varViewCount,int varCommentCount,bool varIsPublishedToHomepage,bool varIsSpam,string varAdsenseID,DateTime varCreatedOn,DateTime varPublishedOn)
		{
			Story item = new Story();
			
				item.StoryID = varStoryID;
				
				item.HostID = varHostID;
				
				item.StoryIdentifier = varStoryIdentifier;
				
				item.Title = varTitle;
				
				item.Description = varDescription;
				
				item.Url = varUrl;
				
				item.CategoryID = varCategoryID;
				
				item.UserID = varUserID;
				
				item.Username = varUsername;
				
				item.KickCount = varKickCount;
				
				item.SpamCount = varSpamCount;
				
				item.ViewCount = varViewCount;
				
				item.CommentCount = varCommentCount;
				
				item.IsPublishedToHomepage = varIsPublishedToHomepage;
				
				item.IsSpam = varIsSpam;
				
				item.AdsenseID = varAdsenseID;
				
				item.CreatedOn = varCreatedOn;
				
				item.PublishedOn = varPublishedOn;
				
			item.IsNew = false;
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}

		#endregion
		#region Columns Struct
		public struct Columns
		{
			 public static string StoryID = @"StoryID";
			 public static string HostID = @"HostID";
			 public static string StoryIdentifier = @"StoryIdentifier";
			 public static string Title = @"Title";
			 public static string Description = @"Description";
			 public static string Url = @"Url";
			 public static string CategoryID = @"CategoryID";
			 public static string UserID = @"UserID";
			 public static string Username = @"Username";
			 public static string KickCount = @"KickCount";
			 public static string SpamCount = @"SpamCount";
			 public static string ViewCount = @"ViewCount";
			 public static string CommentCount = @"CommentCount";
			 public static string IsPublishedToHomepage = @"IsPublishedToHomepage";
			 public static string IsSpam = @"IsSpam";
			 public static string AdsenseID = @"AdsenseID";
			 public static string CreatedOn = @"CreatedOn";
			 public static string PublishedOn = @"PublishedOn";
						
		}

		#endregion
	}

}
