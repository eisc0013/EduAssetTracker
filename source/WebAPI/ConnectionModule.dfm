object SQLiteConnection: TSQLiteConnection
  OldCreateOrder = True
  Height = 366
  Width = 282
  object AureliusConn: TAureliusConnection
    DriverName = 'SQLite'
    Params.Strings = (
      
        'Database=C:\Prog\Projects\EduAssetTracker.git\source\DataModel\E' +
        'duAssetTracker.sqlite3'
      'EnableForeignKeys=True')
    Left = 112
    Top = 248
  end
  object SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher
    Left = 112
    Top = 8
  end
  object XDataServer: TXDataServer
    Dispatcher = SparkleHttpSysDispatcher
    Pool = XDataConnectionPool
    DefaultEntitySetPermissions = [List, Get, Insert, Modify, Delete]
    EntitySetPermissions = <>
    SwaggerOptions.Enabled = True
    SwaggerUIOptions.Enabled = True
    Left = 112
    Top = 88
  end
  object XDataConnectionPool: TXDataConnectionPool
    Connection = AureliusConn
    Left = 112
    Top = 168
  end
end
