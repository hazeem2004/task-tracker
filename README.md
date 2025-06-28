# Incident Report - June 28

**Issue:** Users were unable to access dashboard after login.

**Root Cause:** Memory spike due to unhandled large JSON payload.

**Fix:** Optimized payload & increased memory limit.

**Tools Used:**
- Docker logs
- GitHub Issues
- Trivy for scan
- VS Code for fix

**Status:** Fixed and deployed.
