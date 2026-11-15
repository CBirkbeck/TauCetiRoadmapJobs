# Review of AutomorphyLiftingBeyondTaylorWiles (pull request #1824 at 1583602)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since the review of `1583602` (0 lines) and its files stand as accepted there. The three findings below are all about the pull request's description, which no review had read against the head; none asks for a change in the folder.

## R01 (P3) — The summary block says the level comparison comes from suppliers

**Location:** pull request description, `<!-- roadmap-summary -->` block, "Approach and generality": "Patching algebra, deformation theory and the tree-amalgam level comparison come from supplier roadmaps and Mathlib."

**Claim:** The head owns the level comparison; only the tree, its amalgam and the structure theorem are supplied.

**Witness:** `TauCetiRoadmap/AutomorphyLiftingBeyondTaylorWiles/README.md` line 7: "It owns … the rank-two level comparison at arbitrary number-field components"; Layer 3 (§§3.1–3.7) builds it. The description's own third paragraph lists it among what the roadmap builds.

**Repair:** Replace the sentence by: "Patching algebra, deformation theory, and the local tree with its amalgam presentation come from supplier roadmaps and Mathlib; the Taylor–Wiles level comparison built on that amalgam (Layer 3) is this roadmap's own."

## R02 (P3) — The description restricts the roadmap to positive defect

**Location:** pull request description, third paragraph: "It works where the cohomology of the arithmetic quotients of Res PGLₙ occupies a range of length ℓ₀ = r₁⌊(n−1)/2⌋ + r₂(n−1) > 0, so the Taylor–Wiles numerical coincidence fails".

**Claim:** The head imposes no condition `ℓ₀ > 0`: it treats every number field and `n ≥ 2`, defect zero included.

**Witness:** README Conventions fix "a number field F … n ≥ 2" only; §5.10 "Defect zero: n = 2 over a totally real field" has `l_0 = r_1⌊1/2⌋ + r_2 = 0`; the Conventions Check gives (d, q₀, ℓ₀) = (2, 1, 0) for F = ℚ, n = 2.

**Repair:** Replace by: "It works for every defect ℓ₀ = r₁⌊(n−1)/2⌋ + r₂(n−1) ≥ 0. When ℓ₀ > 0 the Taylor–Wiles numerical coincidence fails and module patching becomes patching of perfect complexes of length ℓ₀; when ℓ₀ = 0 (§5.10, n = 2 over a totally real field) it reduces to module patching."

## R03 (P3) — The description does not say that `Suggested.lean` declares nothing

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** A reader concludes that the file states definitions and sorried theorems. At the head it states none, so the pull request carries no Lean acceptance test, which the description leaves unstated.

**Witness:** `TauCetiRoadmap/AutomorphyLiftingBeyondTaylorWiles/Suggested.lean`: an empty namespace; docstring: "None of them is statable at the pins, so the file declares nothing." `lake env lean` prints nothing (no `sorry` warning). Worker's count: Lean declarations added 0.

**Repair:** Replace the two sentences by: "`Suggested.lean` declares nothing: none of the nine headline theorems is statable against the pinned Mathlib and Tau Ceti, and its docstring names the carrier each lacks; every target is in the README." and "the targeted Lake build succeeds with no warning (the file contains no declaration)".

## Previous findings

- none: the review of `1583602` had no finding.

## Verified sound

| Statement (cited by the description) | Instances tried | Values computed | Result |
|---|---|---|---|
| ℓ₀ = r₁⌊(n−1)/2⌋ + r₂(n−1), `2q₀ + ℓ₀ = d`, d = r₁(n(n+1)/2−1) + r₂(n²−1) (README Conventions) | F = ℚ, n = 2; imaginary quadratic, n = 2; real quadratic, n = 2 and n = 3; F = ℚ, n = 3; CM quartic, n = 2 | (d, q₀, ℓ₀) = (2,1,0); (3,1,1); (4,2,0) and (10,4,2); (5,2,1); (6,2,2) | formula as the description prints it; ℓ₀ = 0 occurs and is treated (§5.10), hence R02 |
| "condition (d) of the patching theorem needs" the inertia–diamond clause (README §4.4) | §4.4 (d) at line 1155 | (d) is discharged by clause (6): diamond operators ↦ inertial characters at `Q_M`, in the image of `R_{S_{Q_M}}`; `T_{α,1} = ⟨α^{1−n}⟩ ↦ θ(α)` (n = 2: `⟨α⁻¹⟩`) | description agrees with the head |
| "CG18 Lemma 8.2, without the false flatness assertion" (README §1.3) | §1.3 text; the §1.2 square-zero example, q = 7, O = ℤ₃ | (q−1)·tr(Φ(Σ−1)) = 6·tr = 0 with tr ≠ 0 mod 3, so p-torsion exists; §1.3 keeps (1)–(4) "without a flatness assertion" | description agrees with the head |

The rows of the review of `1583602` for the roadmap's own statements stand as written there; no statement changed.

- Description sentences read against the head and found right: p > n unramified; non-neat levels through groupoid cohomology; p = 3 retained when n = 2; literal, possibly p-torsion local quotients; Conjecture B an explicit hypothesis; Proposition 8.5; Lemma 9.6 at every component; the conditional GLₙ distinct-root comparison and its PGLₙ descent (§§3.6–3.7); the two patching data; the two downstream uses (README "Downstream consumers"); a new folder of three files; "5 independent review rounds and 2 red-team rounds" (five review and two red-team reports are on the board).
- Gate, re-run on the head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, no output. No declaration, so no `#check @name` comparison and no one-tactic probe apply.
- The diff outside the roadmap folder against `origin/main` is empty.
- Overlap facts: no other open pull request changes this roadmap, none drops an id it cites, no second copy on main; the worker's citation resolver lists nothing unresolved.
- Overlap check: read OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialAutomorphyInfrastructurePartII, GL2ModularityLiftingPartII (GlobalGaloisDeformations as resolved in the review of `1583602`); one shared object, the selected-root level comparison of CG18 Lemma 9.6: owner this roadmap §3.5, which GL2ModularityLiftingPartII cites as owner.
- Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change, no layer was added, removed or reordered); the comparison of the review of `1583602` stands.
- Declared gaps: the eleven slugs are unchanged and were not re-examined.

## Not verifiable

- none.

## Source issues

- none

## For the human reviewers

- none
