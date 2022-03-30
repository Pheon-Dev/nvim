local log = require("structlog")

log.configure({
  name = {
    sinks = {
      log.sinks.Console(
        log.level.INFO,
        {
          processors = {
            log.processors.Namer(),
            log.processors.StackWriter({ "line", "file" }, { max_parents = 0, stack_level = 0 }),
            log.processors.Timestamper("%H:%M:%S"),
          },
          formatter = log.formatters.FormatColorizer( --
            "%s [%s] %s: %-30s",
            { "timestamp", "level", "logger_name", "msg" },
            { level = log.formatters.FormatColorizer.color_level() }
          ),
        }
      ),
      log.sinks.NvimNotify(
        log.level.WARN,
        {
          processors = {
            log.processors.Namer(),
          },
          formatter = log.formatters.Format( --
            "%s",
            { "msg" },
            { blacklist = { "level", "logger_name" } }
          ),
          params_map = { title = "logger_name" },
        }),
      log.sinks.File(
        log.level.TRACE,
        "./test.log",
        {
          processors = {
            log.processors.Namer(),
            log.processors.StackWriter({ "line", "file" }, { max_parents = 3 }),
            log.processors.Timestamper("%H:%M:%S"),
          },
          formatter = log.formatters.Format( --
            "%s [%s] %s: %-30s",
            { "timestamp", "level", "logger_name", "msg" }
          ),
        }
      ),
    },
  },
  -- other_logger = {...}
})

-- local logger = log.get_logger("name")
-- logger:info("A log message")
-- logger:warn("A log message with keyword arguments", { warning = "something happened" })
