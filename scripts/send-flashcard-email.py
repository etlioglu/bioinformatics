import base64
import os
import random
from pathlib import Path

from mailjet_rest import Client

png_path = Path("png-web")
images = os.listdir(png_path)
random_image = random.choice(images)
random_image_path = png_path / random_image
sanitized_image_name = random_image.replace("_", " ").replace("web.png", "")


# mailjet setup
api_key = os.environ["MJ_APIKEY_PUBLIC"]
api_secret = os.environ["MJ_APIKEY_PRIVATE"]
mailjet = Client(auth=(api_key, api_secret))

# from https://www.techcoil.com/blog/how-to-use-python-3-to-convert-your-images-to-base64-encoding/
def get_base64_encoded_image(image_path):
    with open(image_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode("utf-8")

img_as_base64 = get_base64_encoded_image(random_image_path)

data = {
    "FromEmail": "etlioglu@protonmail.com",
    "FromName": "H. Emre Etlioglu",
    "Subject": sanitized_image_name,
    "Html-part": '<img src="cid:random_image_path">',
    "To": "Name <emre.etlioglu@gmail.com>",
    "Inline_attachments": [
        {
            "Content-type": "image/png",
            "Filename": str(random_image_path),
            "content": img_as_base64,
        }
    ],
}
result = mailjet.send.create(data=data)
# print(result.status_code)
# print(result.json())
