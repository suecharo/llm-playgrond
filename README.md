# Running LLM on a Local CPU Server

## tl;dr

This guide explains how to run LLM on a local CPU server using Hugging Face's transformers library.

## Purpose

The primary objectives of this guide are:

- To demonstrate how to run an LLM on a local CPU server.
- As it stands, this guide only covers execution of the model.
- To help in identifying the optimal model for a given task or dataset while considering the CPU resources and execution time.

## Environment

This guide is primarily tested on an Ubuntu 22.04 CPU server. Here are the commands to set up the environment using Docker:

```bash
$ docker compose up -d --build
$ docker compose exec app bash
```

## Finding Models

You can find suitable models for your needs using the [Hugging Face's model hub](https://huggingface.co/models).

Use the following URL format to make specific queries:

https://huggingface.co/models?pipeline_tag=fill-mask&sort=downloads&search=bio

<img width="800" src="https://github.com/suecharo/llm-playgrond/assets/26019402/05ba1297-966a-4360-8c79-6d00986d66bd">

## Selecting a Pipeline

You can choose a suitable pipeline from a list provided here: https://huggingface.co/tasks.

## Code Snippets

[./fill_mask.py](./fill_mask.py)

```bash
$ python3 fill_mask.py
[{'score': 0.28551000356674194, 'token': 5105, 'token_str': 'p53', 'sequence': 'p53 is a tumor suppressor gene.'}, {'score': 0.16949528455734253, 'token': 13544, 'token_str': 'tp53', 'sequence': 'tp53 is a tumor suppressor gene.'}, {'score': 0.08561991900205612, 'token': 11779, 'token_str': 'brca1', 'sequence': 'brca1 is a tumor suppressor gene.'}, {'score': 0.07339842617511749, 'token': 9496, 'token_str': 'pten', 'sequence': 'pten is a tumor suppressor gene.'}, {'score': 0.06466531753540039, 'token': 2176, 'token_str': 'it', 'sequence': 'it is a tumor suppressor gene.'}]
```
