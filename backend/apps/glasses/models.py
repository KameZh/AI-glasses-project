"""Glasses device model – tracks XREAL One paired to a user account."""

from django.db import models
from django.conf import settings


class GlassesDevice(models.Model):
    """Represents a paired XREAL One glasses unit."""

    CONN_BLE = "ble"
    CONN_USB = "usb"
    CONN_WIFI = "wifi"
    CONNECTION_CHOICES = [
        (CONN_BLE, "Bluetooth LE"),
        (CONN_USB, "USB / USB-C"),
        (CONN_WIFI, "Wi-Fi"),
    ]

    owner = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="glasses_devices",
    )
    device_id = models.CharField(max_length=128, unique=True, db_index=True)
    name = models.CharField(max_length=80, default="XREAL One")
    firmware_version = models.CharField(max_length=40, blank=True)
    connection_type = models.CharField(
        max_length=10, choices=CONNECTION_CHOICES, default=CONN_BLE
    )
    is_online = models.BooleanField(default=False)
    battery_level = models.SmallIntegerField(default=100)  # 0–100 %
    display_brightness = models.SmallIntegerField(default=80)  # 0–100 %
    paired_at = models.DateTimeField(auto_now_add=True)
    last_seen_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        db_table = "glasses_devices"

    def __str__(self):
        return f"{self.name} [{self.device_id}]"
