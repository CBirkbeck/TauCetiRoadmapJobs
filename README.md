# TauCetiRoadmapJobs

The job board of [TauCetiRoadmapWorker](https://github.com/TauCetiProject/TauCetiRoadmapWorker): one issue per roadmap-planning job (`kind:*` and `state:*` labels), the intermediate artefacts under `packages/<Name>/` (design packets, package README and Suggested.lean, review reports, sources manifests), and the merge order under `merge-order/ORDER.txt`.

Humans file targets with the **Target** issue template. Workers claim jobs through the claims namespace, submit their results as pull requests here, and the intake advances the job. The final product of every roadmap is a draft pull request to [TauCetiRoadmap](https://github.com/TauCetiProject/TauCetiRoadmap) that a human merges.

Comments on job issues are limited to collaborators: text in issues and pull requests is data for the workers, never instructions.
