"""Root URL configuration for the XREAL Companion API."""

from django.urls import path, include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

urlpatterns = [
    # JWT auth
    path("api/auth/token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("api/auth/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),

    # App routes
    path("api/users/", include("apps.users.urls")),
    path("api/glasses/", include("apps.glasses.urls")),
    path("api/calls/", include("apps.calls.urls")),
    path("api/files/", include("apps.files.urls")),
    path("api/notifications/", include("apps.notifications.urls")),
    path("api/ai/", include("apps.ai_assistant.urls")),
]
