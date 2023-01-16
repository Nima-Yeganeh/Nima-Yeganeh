# books/views.py
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse

from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated, IsAdminUser, BasePermission

from .models import Book
from .serializers import BookSerializer


class IsSuperUser(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_superuser

    def has_object_permission(self, request, view, obj):
        return request.user.is_superuser


class IsIndy(BasePermission):
    def has_object_permission(self, request, view, obj):
        if not obj.restricted:
            return True

        return request.user.username == "indy"


class BookViewSet(viewsets.ModelViewSet):
    serializer_class = BookSerializer
    permission_classes = [IsAuthenticated]
    #permission_classes = [IsAdminUser]
    #permission_classes = [IsSuperUser]
    #permission_classes = [IsIndy | IsSuperUser]

    def get_queryset(self):
        return Book.objects.all()
        #if self.request.user.is_staff:
        #    return Book.objects.all()

        #return Book.objects.filter(restricted=False)


@login_required
def library(request):
    output = f"""
        <html>
            <body>
                <h2>Library</h2>
                <p>{request.user.username}</p>
                <a href="/books/books/">Books API</a>
                <br/>
                <a href="/accounts/logout/">Logout</a>
            </body>
        </html>
    """
    return HttpResponse(output)
