# Review of CongruenceSpectralGap (pull request #1504 at 86faacb)

**Verdict:** needs changes

The folder is unchanged since the last review and stands as accepted there. The three findings are all in the pull request's description, which was written for an earlier head; no file of the roadmap needs a change.

## R01 (P3) — The description gives the curve Euler–Poincaré formula the wrong owner

**Location:** pull request description, `<!-- roadmap-summary -->` block, second paragraph: “It is also the single home of the curve Euler–Poincaré formula with Swan conductors, imported by EtaleDualityAndPerverseSheaves”.

**Claim:** The head says the opposite: EtaleDualityAndPerverseSheaves owns the formula and this roadmap imports it, proving only the descent to a perfect base.

**Witness:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:19`: “EtaleDualityAndPerverseSheaves §5.2 owns the curve Euler–Poincaré formula with Swan conductors … §4.2b here proves only its descent to a perfect base”. Line 130 lists it as a supplier (`curveEulerPoincareSwan`).

**Repair:** Replace the sentence's first half with: “It imports the curve Euler–Poincaré formula with Swan conductors from EtaleDualityAndPerverseSheaves §5.2 and proves its descent to a perfect base; it is the single home of the raw hyper-Kloosterman sum and its sheaf, consumed by KloostermanMomentsAndPotentialAutomorphy and the rigid-cohomology roadmaps.”

## R02 (P3) — The description names a consumer that does not consume the gap

**Location:** pull request description, `<!-- roadmap-summary -->` block, second paragraph: “The gap feeds AutomorphicSpectralTheoryPartII's Schwartz multipliers, GeometricFreyMazur and conformal-area arguments.”

**Claim:** The README's Downstream consumers names no AutomorphicSpectralTheoryPartII and no Schwartz multiplier, and that roadmap's open head says it does not use the gap.

**Witness:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:922` names GeometricFreyMazur, KloostermanMomentsAndPotentialAutomorphy and PadicDifferentialEquationsAndRigidCohomology only. `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md:17` at its open head: “no target here uses that gap”.

**Repair:** Replace the sentence with: “The gap feeds GeometricFreyMazur, conformal-area arguments and arithmetic applications to congruence covers.”

## R03 (P3) — The description still presents the roadmap as an extension of AutomorphicSpectralTheory

**Location:** pull request description, first paragraph after the summary block: “Build the congruence spectral gap as an extension of AutomorphicSpectralTheory”; and in the summary block, “reusing the base roadmap's adelic decomposition”.

**Claim:** The head makes the roadmap standalone: its title lost the “Part II” subtitle and its scope says it is not a Part of AutomorphicSpectralTheory. “Extension of” and “base roadmap” describe the earlier head.

**Witness:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:1`: “# Roadmap: the congruence spectral gap”; line 5: “is built on TauCetiRoadmap.AutomorphicSpectralTheory and is a separate roadmap, not one of its Parts”.

**Repair:** Write “Build the congruence spectral gap as a separate roadmap on top of AutomorphicSpectralTheory: construct …”, and in the summary block “specializing AutomorphicSpectralTheory's adelic decomposition to every principal level”.

## Previous findings

- none: the previous report, of `86faacb`, had no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.2b curve Euler–Poincaré over a perfect base (R01) | Kl₂ on Gₘ/𝔽_q: rank 2, boundary 0 and ∞ of degree 1, Sw₀=0, Sw_∞=1 | χ_c(Gₘ)=2−2·0−(1+1)=0; right side 2·0−(0+1)=−1, the known χ_c of Kl₂ | agrees; owner is EtaleDualityAndPerverseSheaves §5.2 at its open head (its README line 4921) | description only (R01) |
| `hyperKloosterman_bound` (description: “every finite field and rank”) | k=0, r=1; k=1 | k=0: sum=ψ(0)=1, bound 0·…=0, fails, excluded by `1 ≤ k`; k=1: ‖ψ(r)‖=1≤1·q⁰=1 | Lean and README (line 721, k≥1) agree | none |
| `gauss_power_even_average_bound` | q=3, k=1; q=5, k=1, r=1 | q=3: no even nonprincipal character, 0≤3; q=5: only the quadratic character, ‖τ‖=√5≈2.236≤4·1·1+1=5 | holds | none |
| §5.3 / `congruence_eigenvalue_bound` (R02, R03) | m=3, r=1/5; constant u | 1/2−1/(9+1)=2/5=2r so r≤1/5; λ=1/4−1/25=21/100; constant has λ=0<21/100, excluded by `hnc` | holds | none |

The rows of the previous review, of `86faacb`, stand for every other statement: the folder is byte-identical to the head it read.

- Incremental re-review of 0 changed lines since 86faacb; nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty, the worktree is clean).
- Description checked sentence by sentence against the README and `Suggested.lean`: 3 sentences contradicted (R01–R03); the rest agree (all congruence levels, clipped spectrum §0.7, forced zero §2.2, exports §§5.4–5.5, 4 Lean declarations, folder added, not on main).
- Cross-roadmap citations resolved for the description: EtaleDualityAndPerverseSheaves §5.2, AutomorphicSpectralTheoryPartII line 17, GeometricFreyMazur, KloostermanMomentsAndPotentialAutomorphy and PadicDifferentialEquationsAndRigidCohomology at their open heads; 11 open roadmaps cite this one, AutomorphicSpectralTheory does not (no cycle).
- Gate rerun at this head: every counter 0, `OK`; the worker's gate adds `build=0`.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CongruenceSpectralGap/Suggested.lean` gives only the three `sorry` warnings (lines 52, 63, 79); the 4 elaborated signatures are those of the previous review, no binder lost.
- Seeded sample and declared gaps: no passage changed, so they stand as in the previous review; `overlaps.md` lists no dropped id, no second copy and no conflicting head.
- Overlap check: read AutomorphicSpectralTheoryPartII, MaassForms, VariationalMethods; nothing shared (PartII and MaassForms cite this roadmap's Layers 0–5 and §§0.1–0.2, 0.5b as owner; UnboundedOperators UO-D06 owns the Friedrichs extension, cited here and by VariationalMethods).
- Source independence: changed passages only, 0 passages compared with 0 sources (no passage changed); largest share lrs95, 30 of 102 locator mentions; contents not compared again (no layer added, removed or reordered), and lrs95 could not be read.

## Not verifiable

- `lrs95` is settled as uncertified (paywalled): its locators are cited by locator only and were not read.
- The description's “AI assistance” sentence (review and red-team round counts) describes the job board, not the head, and was not checked.
- The `depends-on` and `merge-order` blocks are generated and outside the check of the text.

## Source issues

- none

## For the human reviewers

- **Not tested.** `lrs95` has the largest share of the README's locators (30 of 102 mentions) and is paywalled, recorded as uncertified: wording and arrangement were not compared with it (`TauCetiRoadmap/CongruenceSpectralGap/README.md`, References).
