"""
ASGI config for xreal_companion backend.
Supports both HTTP (Django) and WebSocket (Django Channels) connections.
"""

import os
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")

django_asgi_app = get_asgi_application()

from apps.notifications import routing as notification_routing
from apps.glasses import routing as glasses_routing

application = ProtocolTypeRouter(
    {
        "http": django_asgi_app,
        "websocket": AuthMiddlewareStack(
            URLRouter(
                notification_routing.websocket_urlpatterns
                + glasses_routing.websocket_urlpatterns
            )
        ),
    }
)
