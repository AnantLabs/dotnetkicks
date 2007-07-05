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
	/// Strongly-typed collection for the StoryUserHostTag class.
	/// </summary>
	[Serializable]
	public partial class StoryUserHostTagCollection : ActiveList<StoryUserHostTag, StoryUserHostTagCollection> 
	{	   
		public StoryUserHostTagCollection() {}

	}

	/// <summary>
	/// This is an ActiveRecord class which wraps the Kick_StoryUserHostTag table.
	/// </summary>
	[Serializable]
	public partial class StoryUserHostTag : ActiveRecord<StoryUserHostTag>
	{
		#region .ctors and Default Settings
		
		public StoryUserHostTag()
		{
		  SetSQLProps();
		  InitSetDefaults();
		  MarkNew();
		}

		
		private void InitSetDefaults() { SetDefaults(); }

		
		public StoryUserHostTag(bool useDatabaseDefaults)
		{
			SetSQLProps();
			if(useDatabaseDefaults)
				ForceDefaults();
			MarkNew();
		}

		public StoryUserHostTag(object keyID)
		{
			SetSQLProps();
			InitSetDefaults();
			LoadByKey(keyID);
		}

		 
		public StoryUserHostTag(string columnName, object columnValue)
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
				TableSchema.Table schema = new TableSchema.Table("Kick_StoryUserHostTag", TableType.Table, DataService.GetInstance("DotNetKicks"));
				schema.Columns = new TableSchema.TableColumnCollection();
				schema.SchemaName = @"dbo";
				//columns
				
				TableSchema.TableColumn colvarStoryUserHostTagID = new TableSchema.TableColumn(schema);
				colvarStoryUserHostTagID.ColumnName = "StoryUserHostTagID";
				colvarStoryUserHostTagID.DataType = DbType.Int32;
				colvarStoryUserHostTagID.MaxLength = 0;
				colvarStoryUserHostTagID.AutoIncrement = true;
				colvarStoryUserHostTagID.IsNullable = false;
				colvarStoryUserHostTagID.IsPrimaryKey = true;
				colvarStoryUserHostTagID.IsForeignKey = false;
				colvarStoryUserHostTagID.IsReadOnly = false;
				colvarStoryUserHostTagID.DefaultSetting = @"";
				colvarStoryUserHostTagID.ForeignKeyTableName = "";
				schema.Columns.Add(colvarStoryUserHostTagID);
				
				TableSchema.TableColumn colvarStoryID = new TableSchema.TableColumn(schema);
				colvarStoryID.ColumnName = "StoryID";
				colvarStoryID.DataType = DbType.Int32;
				colvarStoryID.MaxLength = 0;
				colvarStoryID.AutoIncrement = false;
				colvarStoryID.IsNullable = false;
				colvarStoryID.IsPrimaryKey = false;
				colvarStoryID.IsForeignKey = true;
				colvarStoryID.IsReadOnly = false;
				colvarStoryID.DefaultSetting = @"";
				
					colvarStoryID.ForeignKeyTableName = "Kick_Story";
				schema.Columns.Add(colvarStoryID);
				
				TableSchema.TableColumn colvarUserID = new TableSchema.TableColumn(schema);
				colvarUserID.ColumnName = "UserID";
				colvarUserID.DataType = DbType.Int32;
				colvarUserID.MaxLength = 0;
				colvarUserID.AutoIncrement = false;
				colvarUserID.IsNullable = false;
				colvarUserID.IsPrimaryKey = false;
				colvarUserID.IsForeignKey = true;
				colvarUserID.IsReadOnly = false;
				colvarUserID.DefaultSetting = @"";
				
					colvarUserID.ForeignKeyTableName = "Kick_User";
				schema.Columns.Add(colvarUserID);
				
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
				
				TableSchema.TableColumn colvarTagID = new TableSchema.TableColumn(schema);
				colvarTagID.ColumnName = "TagID";
				colvarTagID.DataType = DbType.Int32;
				colvarTagID.MaxLength = 0;
				colvarTagID.AutoIncrement = false;
				colvarTagID.IsNullable = false;
				colvarTagID.IsPrimaryKey = false;
				colvarTagID.IsForeignKey = true;
				colvarTagID.IsReadOnly = false;
				colvarTagID.DefaultSetting = @"";
				
					colvarTagID.ForeignKeyTableName = "Kick_Tag";
				schema.Columns.Add(colvarTagID);
				
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
				
				BaseSchema = schema;
				//add this schema to the provider
				//so we can query it later
				DataService.Providers["DotNetKicks"].AddSchema("Kick_StoryUserHostTag",schema);
			}

		}

		#endregion
		
		#region Props
		
		  
		[XmlAttribute("StoryUserHostTagID")]
		public int StoryUserHostTagID 
		{
			get { return GetColumnValue<int>("StoryUserHostTagID"); }

			set { SetColumnValue("StoryUserHostTagID", value); }

		}

		  
		[XmlAttribute("StoryID")]
		public int StoryID 
		{
			get { return GetColumnValue<int>("StoryID"); }

			set { SetColumnValue("StoryID", value); }

		}

		  
		[XmlAttribute("UserID")]
		public int UserID 
		{
			get { return GetColumnValue<int>("UserID"); }

			set { SetColumnValue("UserID", value); }

		}

		  
		[XmlAttribute("HostID")]
		public int HostID 
		{
			get { return GetColumnValue<int>("HostID"); }

			set { SetColumnValue("HostID", value); }

		}

		  
		[XmlAttribute("TagID")]
		public int TagID 
		{
			get { return GetColumnValue<int>("TagID"); }

			set { SetColumnValue("TagID", value); }

		}

		  
		[XmlAttribute("CreatedOn")]
		public DateTime CreatedOn 
		{
			get { return GetColumnValue<DateTime>("CreatedOn"); }

			set { SetColumnValue("CreatedOn", value); }

		}

		
		#endregion
		
		
			
		
		#region ForeignKey Properties
		
		/// <summary>
		/// Returns a Host ActiveRecord object related to this StoryUserHostTag
		/// 
		/// </summary>
		public Incremental.Kick.Dal.Host Host
		{
			get { return Incremental.Kick.Dal.Host.FetchByID(this.HostID); }

			set { SetColumnValue("HostID", value.HostID); }

		}

		
		
		/// <summary>
		/// Returns a Story ActiveRecord object related to this StoryUserHostTag
		/// 
		/// </summary>
		public Incremental.Kick.Dal.Story Story
		{
			get { return Incremental.Kick.Dal.Story.FetchByID(this.StoryID); }

			set { SetColumnValue("StoryID", value.StoryID); }

		}

		
		
		/// <summary>
		/// Returns a Tag ActiveRecord object related to this StoryUserHostTag
		/// 
		/// </summary>
		public Incremental.Kick.Dal.Tag Tag
		{
			get { return Incremental.Kick.Dal.Tag.FetchByID(this.TagID); }

			set { SetColumnValue("TagID", value.TagID); }

		}

		
		
		/// <summary>
		/// Returns a User ActiveRecord object related to this StoryUserHostTag
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
		public static void Insert(int varStoryID,int varUserID,int varHostID,int varTagID,DateTime varCreatedOn)
		{
			StoryUserHostTag item = new StoryUserHostTag();
			
			item.StoryID = varStoryID;
			
			item.UserID = varUserID;
			
			item.HostID = varHostID;
			
			item.TagID = varTagID;
			
			item.CreatedOn = varCreatedOn;
			
		
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}

		
		/// <summary>
		/// Updates a record, can be used with the Object Data Source
		/// </summary>
		public static void Update(int varStoryUserHostTagID,int varStoryID,int varUserID,int varHostID,int varTagID,DateTime varCreatedOn)
		{
			StoryUserHostTag item = new StoryUserHostTag();
			
				item.StoryUserHostTagID = varStoryUserHostTagID;
				
				item.StoryID = varStoryID;
				
				item.UserID = varUserID;
				
				item.HostID = varHostID;
				
				item.TagID = varTagID;
				
				item.CreatedOn = varCreatedOn;
				
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
			 public static string StoryUserHostTagID = @"StoryUserHostTagID";
			 public static string StoryID = @"StoryID";
			 public static string UserID = @"UserID";
			 public static string HostID = @"HostID";
			 public static string TagID = @"TagID";
			 public static string CreatedOn = @"CreatedOn";
						
		}

		#endregion
	}

}
