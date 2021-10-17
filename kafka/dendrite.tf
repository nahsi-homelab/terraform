resource "kafka_topic" "DendriteOutputTypingEvent" {
  name               = "DendriteOutputTypingEvent"
  replication_factor = 2
  partitions         = 1
}

resource "kafka_topic" "DendriteOutputSendToDeviceEvent" {
  name               = "DendriteOutputSendToDeviceEvent"
  replication_factor = 2
  partitions         = 1
}

resource "kafka_topic" "DendriteOutputKeyChangeEvent" {
  name               = "DendriteOutputKeyChangeEvent"
  replication_factor = 2
  partitions         = 1
}

resource "kafka_topic" "DendriteOutputRoomEvent" {
  name               = "DendriteOutputRoomEvent"
  replication_factor = 2
  partitions         = 1
}

resource "kafka_topic" "DendriteOutputClientData" {
  name               = "DendriteOutputClientData"
  replication_factor = 2
  partitions         = 1
}

resource "kafka_topic" "DendriteOutputReceiptEvent" {
  name               = "DendriteOutputReceiptEvent"
  replication_factor = 2
  partitions         = 1
}
