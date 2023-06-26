#!/usr/bin/env python3
from typing import Any

from transformers import pipeline


def fill_mask(model: str, sentence: str) -> Any:
    classifier = pipeline("fill-mask", model=model)
    return classifier(sentence)


def main() -> None:
    # https://huggingface.co/microsoft/BiomedNLP-PubMedBERT-base-uncased-abstract-fulltext
    model = "microsoft/BiomedNLP-PubMedBERT-base-uncased-abstract-fulltext"
    # https://huggingface.co/emilyalsentzer/Bio_ClinicalBERT
    # model = "emilyalsentzer/Bio_ClinicalBERT"

    sentence = "[MASK] is a tumor suppressor gene."

    result = fill_mask(model, sentence)
    print(result)


if __name__ == "__main__":
    main()
