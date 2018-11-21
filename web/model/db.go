package model

import (
	"errors"
	"fmt"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"github.com/molisoft/litebt/lib"
)

var Db *gorm.DB

func init() {
	dbUri := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8&parseTime=True&loc=Local",
		lib.Cfg.Db.Username,
		lib.Cfg.Db.Password,
		lib.Cfg.Db.Host,
		lib.Cfg.Db.Port,
		lib.Cfg.Db.DbName)

	var err error
	Db, err = gorm.Open("mysql", dbUri)
	if err != nil {
		panic(errors.New("无法连接数据库！" + err.Error()))
	}

	migrate()
}

// 数据迁移
//
func migrate() {
	Db.Set("gorm:table_options", "ENGINE=InnoDB")
	Db.AutoMigrate(&File{})

	fmt.Println("migration is over.")
}
