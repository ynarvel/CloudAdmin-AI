# CloudAdmin-AI

AI-assisted Microsoft 365 and Azure administration automation framework.

CloudAdmin-AI is a policy-driven administration framework designed to help IT administrators perform controlled Microsoft 365 and Azure identity and access operations with:

- Exact target resolution
- Dependency discovery
- Explicit administrator confirmation
- Controlled write operations
- Post-action verification
- Local JSON and CSV audit records
- Dashboard generation
- Safety controls for destructive operations

> **Important:** CloudAdmin-AI is an administration framework, not a standalone Microsoft 365 management application. It relies on an AI/MCP environment with an existing Microsoft 365/Azure administration MCP connection.

---

# Table of Contents

- [Overview](#overview)
- [How CloudAdmin-AI Works](#how-cloudadmin-ai-works)
- [Architecture](#architecture)
- [Requirements](#requirements)
- [Microsoft 365 and Azure Requirements](#microsoft-365-and-azure-requirements)
- [MCP Requirement](#mcp-requirement)
- [Installation](#installation)
- [Clone the Repository](#clone-the-repository)
- [Configure the MCP Connection](#configure-the-mcp-connection)
- [Configuration Safety](#configuration-safety)
- [Verify the Environment](#verify-the-environment)
- [Using CloudAdmin-AI](#using-cloudadmin-ai)
- [Read-Only Operations](#read-only-operations)
- [Employee Onboarding](#employee-onboarding)
- [Employee Offboarding](#employee-offboarding)
- [Confirmation Model](#confirmation-model)
- [Dependency Analysis](#dependency-analysis)
- [Verification Model](#verification-model)
- [Audit Records](#audit-records)
- [Generate the Dashboard](#generate-the-dashboard)
- [PowerShell Audit Scripts](#powershell-audit-scripts)
- [Offboarding Actions](#offboarding-actions)
- [Destructive Operations](#destructive-operations)
- [Security Model](#security-model)
- [Sensitive Data](#sensitive-data)
- [Project Structure](#project-structure)
- [Example Workflow](#example-workflow)
- [Troubleshooting](#troubleshooting)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)

---

# Overview

CloudAdmin-AI provides a controlled framework for Microsoft 365 and Azure administration.

The framework is designed around a simple principle:

> Discover first, understand dependencies, show the proposed change, obtain confirmation, execute only approved actions, verify the result, and record the outcome.

The framework can be used for administrative workflows such as:

- Microsoft Entra ID administration
- Employee onboarding
- Employee offboarding
- Account disablement
- Session/sign-in revocation
- Microsoft 365 license management
- Group membership management
- Microsoft Teams membership handling
- Access package management
- Exchange mailbox-related processing
- OneDrive and SharePoint ownership awareness
- Intune device awareness
- Azure RBAC awareness
- Audit generation
- Dashboard generation

---

# How CloudAdmin-AI Works

CloudAdmin-AI follows a controlled execution model.

```text
Discovery
   |
   v
Dependency Analysis
   |
   v
Implementation Plan
   |
   v
Explicit Confirmation
   |
   v
Execute Approved Actions
   |
   v
Query Microsoft Again
   |
   v
Verify Expected State
   |
   v
Write Audit Record
   |
   v
Final Status