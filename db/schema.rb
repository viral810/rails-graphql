# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171106181457) do

  create_table "abuse_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "abuse_type"
    t.decimal "raw_timestamp", precision: 16, scale: 6
    t.datetime "time"
    t.integer "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "server_ip"
    t.boolean "resolved"
    t.text "subject"
    t.text "body"
    t.text "response_sent"
    t.string "resolved_by"
    t.integer "port"
    t.index ["abuse_type"], name: "index_abuse_events_on_abuse_type"
    t.index ["resolved"], name: "index_abuse_events_on_resolved"
    t.index ["server_ip"], name: "index_abuse_events_on_server_ip"
    t.index ["subject"], name: "index_abuse_events_on_subject", length: { subject: 90 }
  end

  create_table "add_ons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "description", null: false
    t.string "code", null: false
    t.string "status", default: "active"
    t.integer "payment_provider_plan_id", null: false
    t.bigint "expiry_in_seconds"
    t.bigint "data_in_bytes", default: 0
    t.integer "price_in_cents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_provider_id"
    t.index ["payment_provider_id"], name: "index_add_ons_on_payment_provider_id"
    t.index ["payment_provider_plan_id"], name: "index_add_ons_on_payment_provider_plan_id"
  end

  create_table "advertisement_subscriber_rewards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "type", null: false
    t.integer "subscriber_id", null: false
    t.integer "reward_id", null: false
    t.integer "amount", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.integer "offer_id"
    t.string "offer_name"
    t.string "advertisement_receipt_id"
    t.integer "payout_in_cents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_receipt_id"], name: "index_advertisement_subscriber_rewards_on_ad_receipt_id"
    t.index ["offer_id"], name: "index_advertisement_subscriber_rewards_on_offer_id"
    t.index ["reward_id"], name: "index_advertisement_subscriber_rewards_on_reward_id"
    t.index ["subscriber_id"], name: "index_advertisement_subscriber_rewards_on_subscriber_id"
  end

  create_table "affiliates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.integer "payment_provider_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "allowable_rewards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "reward_group_id"
    t.integer "reward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_group_id"], name: "index_allowable_rewards_on_reward_group_id"
    t.index ["reward_id"], name: "index_allowable_rewards_on_reward_id"
  end

  create_table "authorized_applications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false
    t.string "client_api_key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "partner_id"
  end

  create_table "bandwidths", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "ip_address"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "bandwidth_in"
    t.bigint "bandwidth_out"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ip_address", "end_time"], name: "bandwidths_ip_address_end_time_ix"
  end

  create_table "bench_incidents", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "bench_type"
    t.string "reason"
    t.string "server_ids"
    t.integer "outage_time"
    t.datetime "started_at"
    t.datetime "resolved_at"
    t.string "name"
    t.index ["resolved_at", "started_at"], name: "index_bench_incidents_on_resolved_at_and_started_at"
  end

  create_table "captchas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificate_managers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "serial", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "server_id"
    t.string "ip"
    t.string "cert_type"
    t.text "cert"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_regions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_regions_on_name", unique: true
  end

  create_table "daily_avg_user_counts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "day", null: false
    t.integer "uniq_subscriber_plan_id_count", null: false
    t.index ["day"], name: "index_daily_avg_user_counts_on_day", unique: true
  end

  create_table "daily_subscriber_plan_usage_totals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_plan_id"
    t.datetime "start_time"
    t.bigint "bandwidth_in", default: 0
    t.bigint "bandwidth_out", default: 0
    t.bigint "bandwidth_total", default: 0
    t.integer "adtracker", default: 0
    t.bigint "compressed", default: 0
    t.bigint "uncompressed", default: 0
    t.bigint "total_uncompressed", default: 0
    t.bigint "total_compressed", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "adblocker", default: 0
    t.integer "ad_trackers_not_blocked", default: 0, unsigned: true
    t.integer "ads_not_blocked", default: 0, unsigned: true
    t.index ["start_time"], name: "dsput_start"
    t.index ["subscriber_plan_id", "start_time"], name: "dsput_spid_start", unique: true
  end

  create_table "delayed_jobs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "queue"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "device_geo_requests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "device_id", null: false
    t.string "geo", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["device_id"], name: "device_geo_requests_device_id_ix"
  end

  create_table "devices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "udid", limit: 40, null: false
    t.string "secondary_udid", limit: 40
    t.integer "product_batch_id", null: false
    t.string "revision"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "version"
    t.integer "subscriber_plan_id"
    t.string "operating_system", limit: 20
    t.string "device_type", limit: 20
    t.index ["product_batch_id"], name: "devices_product_batch_id_fk"
    t.index ["secondary_udid"], name: "devices_secondary_udid_ix"
    t.index ["subscriber_plan_id"], name: "devices_subscriber_plan_id_fk"
    t.index ["udid"], name: "devices_udid_ix"
  end

  create_table "features", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "user_display", default: true
  end

  create_table "firefox_updates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "app"
    t.string "version"
    t.string "build_id"
    t.string "build_target"
    t.string "locale"
    t.string "channel"
    t.string "os_version"
    t.string "distribution"
    t.string "distribution_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "found_update", default: false
  end

  create_table "forgot_password_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_id", null: false
    t.string "params", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id"], name: "index_forgot_password_logs_on_subscriber_id"
  end

  create_table "geo_status_messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text "message"
    t.string "country_name"
    t.string "country_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nagios_incidents", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "incident_id"
    t.string "incident_type"
    t.string "host_name"
    t.string "server_ip"
    t.integer "server_id"
    t.string "service"
    t.string "state"
    t.boolean "resolved"
    t.string "resolved_using"
    t.datetime "event_start_time"
    t.datetime "event_end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "native_x_push_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_id", null: false
    t.string "notification_type", null: false
    t.text "notification", null: false
    t.boolean "handled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id"], name: "index_native_x_push_notifications_on_subscriber_id"
  end

  create_table "networks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "build_alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offerings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "discount_code"
    t.string "status", limit: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "payment_provider_plan_id", null: false
    t.index ["name"], name: "index_offerings_on_name", unique: true
    t.index ["payment_provider_plan_id"], name: "offerings_payment_provider_plan_id_fk"
  end

  create_table "one_time_tokens", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "subscriber_id", null: false
    t.string "email", null: false
    t.string "status", null: false
    t.string "token_type", null: false
    t.string "auth_token", limit: 64, null: false
    t.datetime "expiry_time", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["auth_token"], name: "index_one_time_tokens_on_auth_token"
    t.index ["email"], name: "index_subscriber_recovery_tokens_on_email"
    t.index ["subscriber_id", "token_type"], name: "index_one_time_tokens_on_subscriber_id_and_token_type"
    t.index ["subscriber_id"], name: "subscriber_recovery_tokens_subscriber_id_fk"
  end

  create_table "ops_api_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "cert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ops_jobs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "job_id"
    t.string "state"
    t.string "job_status"
    t.datetime "created_at"
    t.datetime "cancelled_at"
    t.datetime "failed_at"
    t.datetime "done_at"
    t.integer "failed_count", default: 0
    t.text "output"
    t.text "result"
    t.string "job_type"
    t.text "job_args"
  end

  create_table "optimized_geos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "continent_code"
    t.string "continent"
    t.string "country_code"
    t.string "country"
    t.string "state_code"
    t.string "state"
    t.float "longitude", limit: 24
    t.float "latitude", limit: 24
    t.integer "surfeasy_region_id"
    t.integer "network_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_code", "state_code"], name: "location_lookup_index"
    t.index ["country_code"], name: "country_code_lookup_index"
    t.index ["surfeasy_region_id"], name: "index_optimized_geos_on_surfeasy_region_id"
  end

  create_table "partner_error_messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "partner_id", null: false
    t.integer "error_code", null: false
    t.string "locale", default: "en", null: false
    t.text "message", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id", "error_code", "locale"], name: "partner_error_messages_by_partner_id_locale_error_code", unique: true
    t.index ["partner_id"], name: "index_partner_error_messages_on_partner_id"
  end

  create_table "partner_ftps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "partner_id", null: false
    t.string "host", null: false
    t.string "username", null: false
    t.string "password", null: false
    t.string "path_to_gpg_key", null: false
    t.string "gpg_email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_partner_ftps_on_partner_id", unique: true
  end

  create_table "partner_push_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "partner_id", null: false
    t.integer "push_notification_id", null: false
    t.integer "product_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id", "push_notification_id", "product_id"], name: "partner_pn_partner_id_pn_id_product_id", unique: true
  end

  create_table "partner_ssos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "partner_id"
    t.integer "sso_id"
    t.string "state"
    t.date "state_changed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id", "sso_id"], name: "index_partner_ssos_on_partner_id_and_sso_id", unique: true
  end

  create_table "partner_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.string "password_salt", null: false
    t.string "persistence_token", null: false
    t.string "single_access_token", null: false
    t.string "perishable_token", null: false
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "partner_id", null: false
    t.index ["email"], name: "index_partner_users_on_email", unique: true
    t.index ["partner_id", "email"], name: "partner_users_partner_id_fk"
  end

  create_table "partners", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "api_key", limit: 64
    t.string "subscriber_scope", limit: 20
    t.boolean "is_enterprise", default: false, null: false
    t.boolean "use_sungard", default: false
    t.boolean "use_ssae16", default: false
    t.boolean "use_default", default: true
    t.string "webhook_url"
    t.integer "network_id", null: false
    t.index ["api_key"], name: "index_partners_on_api_key"
  end

  create_table "payment_provider_plan_features", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "payment_provider_plan_id", null: false
    t.integer "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "default", default: "off"
    t.integer "product_id"
    t.index ["feature_id"], name: "payment_provider_plan_features_feature_id_fk"
    t.index ["payment_provider_plan_id"], name: "payment_provider_plan_features_payment_provider_plan_id_fk"
    t.index ["product_id"], name: "payment_provider_plan_features_product_id_fk"
  end

  create_table "payment_provider_plan_optimized_geos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "payment_provider_plan_id", null: false
    t.integer "optimized_geo_id", null: false
    t.string "state", default: "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_provider_plan_id"], name: "index_pppog_on_ppp_id"
    t.index ["state"], name: "index_payment_provider_plan_optimized_geos_on_state"
  end

  create_table "payment_provider_plans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "payment_provider_id", null: false
    t.integer "plan_id", null: false
    t.string "plan_code", null: false
    t.string "url"
    t.string "status", default: "active", null: false
    t.text "plan_options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_in_cents", default: 0
    t.boolean "default", default: false
    t.integer "partner_id"
    t.string "plan_type", default: "normal"
    t.boolean "is_upgradable", default: true
    t.boolean "is_rewardable", default: true
    t.boolean "is_paid", default: false, null: false
    t.datetime "expiry_date"
    t.index ["payment_provider_id", "plan_code"], name: "uk_payment_provider_plans_provider_plan_code", unique: true
    t.index ["plan_id"], name: "index_payment_provider_plans_on_plan_id"
  end

  create_table "payment_provider_subscriber_receipts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "payment_provider_subscriber_id"
    t.text "receipt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subscriber_plan_id"
    t.string "status", default: "active", null: false
    t.string "transaction_id"
    t.index ["payment_provider_subscriber_id"], name: "payment_provider_subscriber_receipts_pps_fk"
  end

  create_table "payment_provider_subscribers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "payment_provider_id", null: false
    t.integer "subscriber_id", null: false
    t.string "account_code", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "subscriber_details"
    t.index ["account_code"], name: "index_payment_provider_subscribers_on_account_code"
    t.index ["payment_provider_id", "subscriber_id"], name: "uk_payment_provider_subscribers_provider_to_subscriber", unique: true
    t.index ["subscriber_id"], name: "payment_provider_subscribers_subscriber_id_fk"
  end

  create_table "payment_providers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_payment_providers_on_name", unique: true
  end

  create_table "plan_upgrades", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "source_plan_id", null: false
    t.integer "target_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_plan_id", "target_plan_id"], name: "uk_plan_upgrades_source_target_plans", unique: true
    t.index ["target_plan_id"], name: "plan_upgrades_target_plan_id_fk"
  end

  create_table "plans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "quota_period_length", default: 1, null: false
    t.string "quota_period_unit", limit: 20, default: "months", null: false
    t.integer "time_limit"
    t.string "time_limit_unit", limit: 20
    t.integer "data_limit"
    t.string "data_limit_unit", limit: 20
    t.integer "device_limit", default: 1, null: false
    t.string "status", limit: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "partner_id"
    t.string "graphic_url"
    t.string "overlay_url"
    t.integer "one_time_data_limit", default: 0
    t.index ["name"], name: "index_plans_on_name", unique: true
    t.index ["partner_id"], name: "index_plans_on_partner_id"
  end

  create_table "pricing_plans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "plan_code"
    t.string "name"
    t.string "description"
    t.string "accounting_code"
    t.string "plan_interval_unit"
    t.integer "plan_interval_length"
    t.string "trial_interval_unit"
    t.integer "trial_interval_length"
    t.string "setup_fee_in_cents"
    t.string "unit_amount_in_cents"
    t.integer "total_billing_cycles"
    t.string "unit_name"
    t.boolean "display_quantity"
    t.string "success_url"
    t.string "cancel_url"
    t.integer "bandwidth"
    t.string "status"
    t.boolean "expires", default: false
  end

  create_table "product_batches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "quantity", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "description", null: false
    t.integer "product_id", null: false
    t.integer "offering_id"
    t.index ["offering_id"], name: "product_batches_offering_id_fk"
    t.index ["product_id"], name: "product_batches_product_id_fk"
  end

  create_table "product_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 32
    t.string "description", limit: 32
    t.integer "product_id"
    t.string "status", limit: 12
    t.string "client_api_key", limit: 64
    t.string "key_type", limit: 8
    t.string "version", limit: 32
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_rewards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "product_id"
    t.integer "reward_id"
    t.index ["product_id"], name: "index_product_rewards_on_product_id"
    t.index ["reward_id"], name: "index_product_rewards_on_reward_id"
  end

  create_table "product_versions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "product_id", null: false
    t.string "version", null: false
    t.string "state", limit: 20, default: "unreleased"
    t.string "release_notes_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "update_by_date"
    t.integer "grace_period"
    t.index ["product_id", "version"], name: "index_product_versions_on_product_id_and_version", unique: true
  end

  create_table "products", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "description", null: false
    t.string "code", limit: 6, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "pregenerated_udids", default: false, null: false
    t.string "default_revision"
    t.integer "default_product_batch_id"
    t.string "client_api_key"
    t.string "download_url"
    t.integer "partner_id"
    t.string "service", limit: 20
    t.string "platform", limit: 20
    t.integer "payment_provider_id"
    t.string "platform_type"
    t.boolean "supports_digest", default: false, null: false
    t.string "state", default: "active", null: false
    t.index ["code"], name: "index_products_on_code", unique: true
    t.index ["default_product_batch_id"], name: "products_default_product_batch_id_fk"
    t.index ["partner_id", "platform"], name: "index_products_on_partner_id_and_platform"
    t.index ["partner_id", "service"], name: "index_products_on_partner_id_and_service"
    t.index ["partner_id"], name: "index_products_on_partner_id"
  end

  create_table "products_plans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "plan_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["plan_id", "product_id"], name: "plans_products_combination_uk", unique: true
    t.index ["product_id"], name: "products_plans_product_id_fk"
  end

  create_table "promotions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "country_code"
    t.string "plan_status"
    t.integer "plan_seconds_left"
    t.integer "plan_source_id"
    t.integer "plan_target_id"
    t.integer "add_on_source_id"
    t.integer "add_on_target_id"
    t.string "plan_access_state"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_discount"
  end

  create_table "providers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false
    t.integer "surfeasy_region_id"
    t.string "country_code"
    t.string "state_code"
    t.string "city"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "provisioned", default: false
    t.boolean "is_sungard", default: false
    t.boolean "is_ssae16", default: false
    t.boolean "is_default", default: true
    t.integer "optimized_geo_id"
    t.string "region_prefix", limit: 12, default: "US"
    t.string "cloud_provider_name"
    t.string "provider_type", limit: 12, default: "general"
    t.string "cloud_region"
    t.boolean "pooled_bandwidth", default: false
    t.index ["name"], name: "index_cloud_regions_on_name", unique: true
    t.index ["optimized_geo_id"], name: "index_providers_on_optimized_geo_id"
    t.index ["surfeasy_region_id"], name: "providers_surfeasy_region_id_fk"
  end

  create_table "proxies_subscriptions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "proxy_id"
    t.integer "subscription_id"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["proxy_id"], name: "index_proxies_subscriptions_on_proxy_id"
    t.index ["subscription_id"], name: "index_proxies_subscriptions_on_subscription_id"
  end

  create_table "push_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "action"
    t.text "message"
    t.text "custom_data"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "payment_provider_id", null: false
    t.integer "subscriber_plan_id"
    t.text "content", null: false
    t.string "transaction_id", null: false
    t.string "account_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_type", limit: 36
    t.integer "item_id"
    t.index ["item_type", "item_id"], name: "index_receipts_on_item_type_and_item_id"
    t.index ["payment_provider_id", "account_code"], name: "index_receipts_on_payment_provider_id_and_account_code"
    t.index ["payment_provider_id", "transaction_id"], name: "index_receipts_on_payment_provider_id_and_transaction_id"
    t.index ["payment_provider_id"], name: "receipts_payment_provider_id_fk"
    t.index ["subscriber_plan_id"], name: "receipts_subscriber_plan_id_fk"
    t.index ["transaction_id"], name: "index_receipts_on_transaction_id", unique: true
  end

  create_table "recurly_push_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "notification_type"
    t.text "notification"
    t.boolean "handled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redemption_code_batches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "quantity", null: false
    t.string "description", null: false
    t.string "batch_type", default: "closed", null: false
    t.integer "offering_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offering_id"], name: "redemption_code_batches_offering_id_fk"
  end

  create_table "redemption_codes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code", limit: 20, null: false
    t.integer "redemption_code_batch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", limit: 20, default: "active", null: false
    t.boolean "used", default: false, null: false
    t.index ["code"], name: "index_redemption_codes_on_code"
    t.index ["redemption_code_batch_id"], name: "redemption_codes_redemption_code_batch_id_fk"
  end

  create_table "referrals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "subscriber_id", null: false
    t.string "email", null: false
    t.datetime "last_contact", null: false
    t.string "status", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id", "email"], name: "index_referrals_on_subscriber_id_and_email", unique: true
  end

  create_table "reset_codes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "serial_no", null: false
    t.string "reset_code", null: false
    t.boolean "redeemed", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "retail_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "subscriber_id", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "store_number", null: false
    t.string "employee_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "retailer_id", null: false
    t.index ["retailer_id"], name: "retail_users_retailer_id_fk"
    t.index ["subscriber_id"], name: "retail_users_subscriber_id_fk"
  end

  create_table "retailers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.integer "redemption_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["redemption_code_id"], name: "retailers_redemption_code_id_fk"
  end

  create_table "reward_groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean "active", default: false
    t.string "description", null: false
    t.string "affiliate_id"
    t.string "country_code", limit: 2
    t.integer "percentage_grouping", default: 100
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_source"
    t.index ["name"], name: "index_reward_groups_on_name", unique: true
  end

  create_table "rewards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code", null: false
    t.text "description", null: false
    t.integer "amount", default: 0, null: false
    t.string "status", default: "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "reusable", default: false, null: false
    t.string "email_action"
    t.boolean "display", default: true, null: false
    t.integer "priority"
    t.string "icon"
    t.boolean "renewable", default: true
    t.bigint "expiry_in_seconds"
    t.string "rewardable_class"
    t.integer "reusable_limit"
    t.string "reusable_limit_unit"
    t.string "url"
  end

  create_table "roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.text "configuration", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_services", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "role_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["role_id"], name: "roles_services_role_id_fk"
    t.index ["service_id"], name: "roles_services_service_id_fk"
  end

  create_table "server_builds", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "server_id"
    t.string "current_stage_name"
    t.integer "current_stage"
    t.text "arguments"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "error"
  end

  create_table "servers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false
    t.string "state", null: false
    t.string "ip_address", null: false
    t.string "cloud", null: false
    t.string "cloud_id", null: false
    t.string "cloud_size", null: false
    t.integer "provider_id", null: false
    t.datetime "start_time"
    t.datetime "destroy_time"
    t.datetime "last_puppeted_at"
    t.string "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "dedicated_server_id"
    t.integer "bench_incident_id"
    t.integer "network_id"
    t.float "bandwidth", limit: 24
    t.float "monthly_bandwidth_limit", limit: 24
    t.datetime "billing_start_date"
    t.integer "cost", default: 0
    t.string "os_version"
    t.float "actual_bandwidth_limit", limit: 24
    t.float "monthly_data_used", limit: 24
    t.integer "cores", default: 2
    t.index ["bench_incident_id"], name: "index_servers_on_bench_incident_id"
    t.index ["dedicated_server_id"], name: "index_servers_on_dedicated_server_id"
    t.index ["ip_address", "state"], name: "servers_ip_address_state_idx"
    t.index ["network_id"], name: "servers_network_id_idx"
    t.index ["provider_id"], name: "servers_provider_id_fk"
  end

  create_table "servers_services", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "server_id", null: false
    t.integer "service_id", null: false
    t.text "configuration", null: false
    t.string "server_options"
    t.string "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["server_id"], name: "servers_services_server_id_fk"
    t.index ["service_id"], name: "servers_services_service_id_fk"
  end

  create_table "servers_subscribers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "server_id", null: false
    t.integer "subscriber_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status", null: false
    t.index ["server_id"], name: "servers_subscribers_server_id_fk"
    t.index ["subscriber_id"], name: "servers_subscribers_subscriber_id_fk"
  end

  create_table "services", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false
    t.text "configuration", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signifyd_cases", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_id", null: false
    t.integer "subscriber_plan_id", null: false
    t.bigint "investigation_id"
    t.string "status"
    t.float "score", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id"], name: "index_signifyd_cases_on_subscriber_id", unique: true
    t.index ["subscriber_plan_id"], name: "index_signifyd_cases_on_subscriber_plan_id", unique: true
  end

  create_table "signifyd_push_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "signifyd_case_id", null: false
    t.string "notification_type"
    t.text "notification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["signifyd_case_id"], name: "index_signifyd_push_notifications_on_signifyd_case_id"
  end

  create_table "ssos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ssos_on_name", unique: true
  end

  create_table "subscriber_appsflyers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_id"
    t.string "appsflyer_key", limit: 40
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appsflyer_key"], name: "index_subscriber_appsflyers_on_appsflyer_key"
    t.index ["subscriber_id"], name: "index_subscriber_appsflyers_on_subscriber_id"
  end

  create_table "subscriber_devices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "subscriber_id", null: false
    t.integer "device_id"
    t.string "name", limit: 200, default: "Device", null: false
    t.string "status"
    t.datetime "registration_date", null: false
    t.string "password_hash", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "device_hash", null: false
    t.integer "subscriber_plan_id"
    t.string "push_token", limit: 1537
    t.string "advertising_id", limit: 40
    t.datetime "status_changed_at", null: false
    t.integer "cert_serial_number", default: 0, unsigned: true
    t.index ["advertising_id"], name: "index_subscriber_devices_on_advertising_id"
    t.index ["device_hash"], name: "index_subscriber_devices_on_device_hash"
    t.index ["device_id"], name: "subscriber_devices_device_id_fk"
    t.index ["push_token"], name: "index_subscriber_devices_on_push_token", length: { push_token: 64 }
    t.index ["status", "registration_date"], name: "index_subscriber_devices_on_status_and_registration_date"
    t.index ["subscriber_id"], name: "subscriber_devices_subscriber_id_fk"
    t.index ["subscriber_plan_id"], name: "subscriber_devices_subscriber_plan_id_fk"
    t.index ["updated_at"], name: "index_subscriber_devices_on_updated_at"
  end

  create_table "subscriber_one_time_rewards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_id", null: false
    t.integer "reward_id", null: false
    t.integer "amount", null: false
    t.bigint "amount_used_in_bytes", default: 0, null: false
    t.boolean "completed", default: false
    t.boolean "converted", default: false
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.integer "offer_id"
    t.string "offer_name", limit: 40
    t.string "receipt_id", limit: 40
    t.integer "payout_in_cents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receipt_id"], name: "index_subscriber_one_time_rewards_on_receipt_id", unique: true
    t.index ["reward_id"], name: "index_subscriber_one_time_rewards_on_reward_id"
    t.index ["subscriber_id"], name: "index_subscriber_one_time_rewards_on_subscriber_id"
  end

  create_table "subscriber_plan_add_ons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_plan_id", null: false
    t.integer "add_on_id", null: false
    t.string "status", default: "active"
    t.bigint "bandwidth_remaining", default: 0
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid", limit: 40
    t.index ["add_on_id"], name: "index_subscriber_plan_add_ons_on_add_on_id"
    t.index ["subscriber_plan_id"], name: "index_subscriber_plan_add_ons_on_subscriber_plan_id"
    t.index ["uuid"], name: "index_subscriber_plan_add_ons_on_uuid"
  end

  create_table "subscriber_plan_features", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_plan_id", null: false
    t.integer "feature_id", null: false
    t.boolean "state", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["feature_id", "subscriber_plan_id", "product_id"], name: "sub_plan_features_f_sp_prod"
    t.index ["feature_id"], name: "subscriber_plan_features_feature_id_fk"
    t.index ["product_id"], name: "subscriber_plan_features_product_id_fk"
    t.index ["subscriber_plan_id", "product_id"], name: "sub_plan_features_sub_plan_id_product_id_ix"
    t.index ["subscriber_plan_id"], name: "subscriber_plan_features_subscriber_plan_id_fk"
  end

  create_table "subscriber_plan_usage_totals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "bandwidth_in", default: 0, null: false
    t.bigint "bandwidth_out", default: 0, null: false
    t.bigint "bandwidth_total", default: 0, null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "subscriber_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "threshold"
    t.index ["subscriber_plan_id", "start_time"], name: "subscriber_plan_usage_totals_subplan_idx"
  end

  create_table "subscriber_plans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "subscriber_id", null: false
    t.integer "offering_id"
    t.string "status", default: "active", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "time_quota_color", default: "green", null: false
    t.string "data_quota_color", default: "green", null: false
    t.string "access_state", default: "good", null: false
    t.integer "payment_provider_plan_id", null: false
    t.boolean "assigned", default: false, null: false
    t.integer "reset_day", limit: 2
    t.integer "receipt_id"
    t.string "state_change_reason", limit: 40
    t.string "payment_provider_version", limit: 36
    t.string "uuid", limit: 40
    t.datetime "status_changed_at", null: false
    t.integer "additional_device_limit", limit: 2, default: 0, unsigned: true
    t.index ["offering_id"], name: "subscriber_plans_offering_id_fk"
    t.index ["payment_provider_plan_id"], name: "subscriber_plans_payment_provider_plan_id_fk"
    t.index ["receipt_id"], name: "subscriber_plans_receipt_id_fk"
    t.index ["subscriber_id"], name: "subscriber_plans_subscriber_id_fk"
    t.index ["uuid"], name: "index_subscriber_plans_on_uuid"
  end

  create_table "subscriber_redemption_codes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "redemption_code_id", null: false
    t.integer "subscriber_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["redemption_code_id"], name: "subscriber_redemption_codes_redemption_code_id_fk"
    t.index ["subscriber_id"], name: "subscriber_redemption_codes_subscriber_id_fk"
  end

  create_table "subscriber_referral_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "referring_subscriber_id", null: false
    t.integer "referred_subscriber_id"
    t.string "method", null: false
    t.text "headers", null: false
    t.text "params", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referred_subscriber_id"], name: "subscriber_referral_logs_referred_subscriber_fk"
    t.index ["referring_subscriber_id"], name: "subscriber_referral_logs_referring_subscriber_fk"
  end

  create_table "subscriber_referrals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "subscriber_id"
    t.integer "referred_subscriber_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id"], name: "index_subscriber_referrals_on_subscriber_id"
  end

  create_table "subscriber_rewards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "subscriber_id", null: false
    t.integer "reward_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: true, null: false
    t.text "data"
    t.index ["reward_id"], name: "subscriber_rewards_reward_id_fk"
    t.index ["subscriber_id"], name: "subscriber_rewards_subscriber_id_fk"
  end

  create_table "subscriber_shipping_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_id"
    t.binary "shipping_address"
    t.string "phone_number"
    t.string "shipping_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id"], name: "index_subscriber_shipping_infos_on_subscriber_id"
  end

  create_table "subscriber_ssos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subscriber_id"
    t.integer "partner_sso_id"
    t.string "sso_token"
    t.string "sso_subscriber_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_sso_id"], name: "index_subscriber_ssos_on_partner_sso_id"
    t.index ["sso_subscriber_key"], name: "index_subscriber_ssos_on_sso_subscriber_key"
    t.index ["subscriber_id"], name: "index_subscriber_ssos_on_subscriber_id"
  end

  create_table "subscribers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "user_id", null: false
    t.string "display_name", limit: 512, null: false
    t.string "email", null: false
    t.string "password_hash", null: false
    t.string "account_source", null: false
    t.string "status", null: false
    t.datetime "registration_date", null: false
    t.string "phone_support_pin", limit: 25, null: false
    t.boolean "updates_email_list", null: false
    t.boolean "news_email_list", null: false
    t.string "persistence_token", null: false
    t.integer "update_channel_id"
    t.integer "override_update_channel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_request_at"
    t.string "referral_code", limit: 20
    t.string "referral_url", limit: 100
    t.bigint "earned_data_limit", default: 0, null: false
    t.boolean "email_confirmed", default: false, null: false
    t.integer "referring_subscriber_id"
    t.integer "failed_login_count"
    t.boolean "temporary", default: false, null: false
    t.datetime "last_email_confirmation_date"
    t.string "origin_country", limit: 2
    t.string "affiliate_instance_id", limit: 64
    t.string "locale", default: "en"
    t.boolean "in_mixpanel", default: false
    t.integer "partner_id", null: false
    t.string "partner_scope", limit: 20, default: "surfeasy"
    t.string "affiliate_name", limit: 120
    t.datetime "status_changed_at", null: false
    t.integer "mail_bounce_count", limit: 2, default: 0, null: false
    t.bigint "earned_one_time_data_limit", default: 0, unsigned: true
    t.bigint "one_time_data_used", default: 0, unsigned: true
    t.integer "reward_group_id"
    t.integer "affiliate_id"
    t.string "state_change_reason", limit: 40
    t.string "sub_affiliate_code", limit: 20
    t.index ["email"], name: "index_subscribers_on_email"
    t.index ["override_update_channel_id"], name: "subscribers_override_update_channel_id_fk"
    t.index ["partner_id"], name: "index_subscribers_on_partner_id"
    t.index ["partner_scope", "email"], name: "index_subscribers_on_partner_scope_and_email"
    t.index ["persistence_token"], name: "subsribers_persistence_token_idx"
    t.index ["phone_support_pin"], name: "index_subscribers_on_phone_support_pin"
    t.index ["referral_code"], name: "index_subscribers_on_referral_code", unique: true
    t.index ["referring_subscriber_id"], name: "subscribers_referring_subscriber_id_fk"
    t.index ["reward_group_id"], name: "index_subscribers_on_reward_group_id"
    t.index ["update_channel_id"], name: "subscribers_update_channel_id_fk"
    t.index ["user_id"], name: "index_subscribers_on_user_id", unique: true
  end

  create_table "subscriptions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "email"
    t.string "serial_no"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "password"
    t.integer "batch_number"
    t.string "status"
    t.string "first_name"
    t.string "last_name"
    t.integer "zone_id"
    t.string "ivr_code"
    t.integer "ivr_used"
    t.datetime "registration_date"
    t.string "persistence_token", null: false
    t.datetime "last_request_at"
    t.integer "pricing_plan_id"
    t.integer "phone_support_pin"
    t.boolean "updates_email_list"
    t.boolean "news_email_list"
    t.string "account_code"
    t.string "secondary_serial_no"
    t.integer "original_pricing_plan_id"
    t.integer "update_channel_id"
    t.integer "override_update_channel_id"
    t.string "encoded_password"
    t.index ["override_update_channel_id"], name: "subscriptions_override_update_channel_id_fk"
    t.index ["persistence_token"], name: "index_subscriptions_on_persistence_token"
    t.index ["serial_no"], name: "index_subscriptions_on_serial_no", unique: true
    t.index ["update_channel_id"], name: "subscriptions_update_channel_id_fk"
    t.index ["zone_id"], name: "zone_id_sub_ix"
  end

  create_table "surfcare_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "login", null: false
    t.string "crypted_password", null: false
    t.string "password_salt", null: false
    t.string "persistence_token", null: false
    t.string "single_access_token", null: false
    t.string "perishable_token", null: false
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "role", default: "user"
  end

  create_table "surfeasy_regions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "customer_region_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "default_cloud_provider_id"
    t.index ["customer_region_id"], name: "surfeasy_regions_customer_region_id_fk"
    t.index ["name"], name: "index_surfeasy_regions_on_name", unique: true
  end

  create_table "temp_accounts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "email"
    t.string "subscription_id"
    t.string "state"
    t.string "rtype"
    t.string "auth_token"
    t.string "password"
    t.datetime "expiry_time"
  end

  create_table "update_channel_file_assignments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "update_channel_id", null: false
    t.integer "update_file_id", null: false
    t.string "priority", limit: 8, default: "normal", null: false
    t.boolean "active", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["update_channel_id", "update_file_id"], name: "update_channel_file_assignment_uk", unique: true
    t.index ["update_file_id"], name: "update_channel_file_assignments_update_file_id_fk"
  end

  create_table "update_channels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 64, null: false
    t.text "description", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_update_channels_on_name", unique: true
  end

  create_table "update_files", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "product_id", null: false
    t.integer "product_version_id", null: false
    t.boolean "available", null: false
    t.string "reason", null: false
    t.string "url", null: false
    t.string "file_location", null: false
    t.bigint "file_size", null: false
    t.string "file_format", null: false
    t.string "hash_function", null: false
    t.string "hash_value", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "os"
    t.string "arch"
    t.integer "bits"
    t.index ["product_id"], name: "update_files_product_id_fk"
    t.index ["product_version_id"], name: "update_files_product_version_id_fk"
  end

  create_table "updates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "product"
    t.string "version"
    t.string "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "file_url"
    t.string "file_location"
    t.string "required"
    t.bigint "file_size"
    t.string "file_format"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "web_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "username"
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "role"
  end

  add_foreign_key "offerings", "payment_provider_plans", name: "offerings_payment_provider_plan_id_fk"
  add_foreign_key "payment_provider_plan_features", "products", name: "payment_provider_plan_features_product_id_fk"
  add_foreign_key "payment_provider_plans", "payment_providers", name: "payment_provider_plans_payment_provider_id_fk"
  add_foreign_key "payment_provider_plans", "plans", name: "payment_provider_plans_plan_id_fk"
  add_foreign_key "plan_upgrades", "plans", column: "source_plan_id", name: "plan_upgrades_source_plan_id_fk"
  add_foreign_key "plan_upgrades", "plans", column: "target_plan_id", name: "plan_upgrades_target_plan_id_fk"
  add_foreign_key "product_batches", "offerings", name: "product_batches_offering_id_fk"
  add_foreign_key "products", "product_batches", column: "default_product_batch_id", name: "products_default_product_batch_id_fk"
  add_foreign_key "products_plans", "plans", name: "products_plans_plan_id_fk"
  add_foreign_key "redemption_code_batches", "offerings", name: "redemption_code_batches_offering_id_fk"
  add_foreign_key "redemption_codes", "redemption_code_batches", name: "redemption_codes_redemption_code_batch_id_fk"
  add_foreign_key "retailers", "redemption_codes", name: "retailers_redemption_code_id_fk"
  add_foreign_key "roles_services", "roles", name: "roles_services_role_id_fk"
  add_foreign_key "roles_services", "services", name: "roles_services_service_id_fk"
  add_foreign_key "servers_services", "services", name: "servers_services_service_id_fk"
  add_foreign_key "surfeasy_regions", "customer_regions", name: "surfeasy_regions_customer_region_id_fk"
  add_foreign_key "update_channel_file_assignments", "update_channels", name: "update_channel_file_assignments_update_channel_id_fk"
  add_foreign_key "update_channel_file_assignments", "update_files", name: "update_channel_file_assignments_update_file_id_fk"
  add_foreign_key "update_files", "product_versions", name: "update_files_product_version_id_fk"
end
