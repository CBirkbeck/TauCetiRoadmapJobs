# Review of NeronModelsAndSemistableAbelianVarieties (pull request #852 at 861f8ce)

**Verdict:** needs changes

## R01 (P3) — Replace the obsolete scope and carrier claim

**Location:** PR description, first paragraph after `<!-- /roadmap-summary -->` (`scratch/pull-request.md:22`): “over excellent discrete valuation rings” and “stated on Tau Ceti's stable-reduction Picard carriers”.
**Claim:** This paragraph understates the existence theorem's scope and falsely describes the carriers available for the two geometric milestones.
**Witness:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/Suggested.lean:68` quantifies over every DVR; lines 31–37 explicitly say semistable reduction and Grothendieck's criterion require missing geometric carriers.
**Repair:** Replace the paragraph with: “This pull request adds a new roadmap for finite-type Néron models over every discrete valuation ring and connected Dedekind scheme, semistable reduction, Raynaud uniformisation, and Picard and integral monodromy theory. Suggested.lean states local and global existence, isogeny invariance of good reduction, and the elliptic good-reduction comparison. Semistable reduction and Grothendieck's monodromy criterion are README targets; their required geometric carriers are absent from the pins.”

## R02 (P3) — Correct the pointer to downstream consumers

**Location:** PR description, Dependencies paragraph (`scratch/pull-request.md:28`): “consumers of this roadmap are listed in the merge-order block, not here.”
**Claim:** The named block does not list the downstream consumers.
**Witness:** The `merge-order` block ends at #852 and lists its supplier closure. `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:4590` lists FaltingsFinitenessAndIsogenyTheorems as a consumer; that name occurs zero times in the block.
**Repair:** Replace that clause with: “downstream consumers are listed in the README's ‘Downstream consumers’ section.”

## Previous findings

- R01 — repaired: README line 353 still names Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`; both match `lake-manifest.json`.
- R02 — repaired: README lines 490–494, 1217–1220 and 1280–1285 still cite ReductiveGroups Layer 3 for affine identity components and component groups; the non-affine construction remains this roadmap's.
- R03 — repaired: README lines 1209–1213 still construct the global open identity model over connected Dedekind schemes and identify its local and generic fibres; §2.1 still lists §1.9 as an input.
- R04 — repaired: the description's `depends-on` and `merge-order` blocks contain neither #1522 nor GroupSchemesOverABase.

## Verified sound

| Statement | Instances tried | Left-hand value | Right-hand value | Result / change |
|---|---|---|---|---|
| §1.7 LocalExistence, mentioned in R01 | Zero-dimensional abelian variety over the fraction field of any DVR | Generic fibre `Spec K`; each smooth-test morphism set has cardinality 1 | Model `Spec R`; restriction is the unique map `1 → 1`, hence bijective | Instance agrees; correct description's DVR scope |
| §3.10 semistable reduction, mentioned in R01 | Split Tate curve over a complete discretely valued field | Identity fibre `G_m`; `(t,a,u) = (1,0,0)` | Choose `K′ = K`; extension degree 1, unipotent rank 0 | Instance agrees; no pinned Lean target claimed |
| §3.11 Grothendieck criterion, mentioned in R01 | Split Tate curve; good-reduction elliptic curve; `ℓ ≠ p` | Semistable in both cases; unipotent rank 0 | Tate inertia `[[1,c],[0,1]]`: `(ρ−1)²=0`; good reduction `ρ=I` | Both sides true; correct carrier claim |
| Consumer pointer in R02 | FaltingsFinitenessAndIsogenyTheorems | README consumer occurrence: 1 | Merge-order block occurrences: 0 | Replace pointer |

The untouched statement rows stand as in the previous review of `861f8ce`.

- Delta: 0 changed folder lines, 0 outside-folder changes; base-to-head adds 3 files, 4,880 lines and 5 Lean declarations, removing none.
- Previous findings: all 4 repairs retained; 2 supplier contracts re-resolved, ReductiveGroups Layer 3 and AlgebraicModuliForArithmeticGeometry §7.9.
- Seeded source sample: 0 of the 15 targets falls in a changed passage; 0 source locators reopened and 0 pinned library declarations newly audited.
- Signatures: scratch `#check @name` elaborated all 5 declarations; DVR, fraction-field, normality, dimension, isogeny and minimal-equation hypotheses agree with the README; 0 lost binders.
- Gate: all scanners pass; targeted module build exits 0. Its replay emits a Mathlib module-system advisory in addition to the 4 admitted-theorem warnings.
- Direct elaboration: exits 0 with exactly 4 `sorry` warnings; the signature probe also exits 0. Untouched padding checks stand from the previous review.

Dependency check output:

```text
depcheck: 245 roadmaps, 2222 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Overlap check: read scopes of FaltingsFinitenessAndIsogenyTheorems (height/isogeny applications), AbelianSchemesAndArithmeticModuli (abelian schemes and Tate modules), ArithmeticGaloisRepresentations (representation conductors), RelativeJacobiansAndIntegralCurveModels (general integral Picard comparisons), FiniteFlatGroupsAndIntegralPadicHodgeTheory (finite-flat classifications), StableReduction (curve models), EtaleCohomologyFoundations (étale foundations), and ModularCurves (relative elliptic curves); those objects retain their named owners, and Néron models and regular semistable Picard comparisons remain here. The supplied overlap inventory reports no conflicting edit or dropped cited id.

Source independence: changed passages only; 0 roadmap passages compared with 0 sources because the folder diff is empty. No layer was added, removed or reordered; the arrangement and locator-share audit was not repeated.

## Not verifiable

- SGA 7 I, Exposé IX, §§1.1–1.2, pp. 321–323: `sga7-ix` remains uncertified; no text requested again.
- Bosch–Lütkebohmert–Raynaud §1.2 Lemma 5 and §1.4 Propositions 1–2 and Theorem 3: paywalled locators carried from the previous review.
- The four admitted Lean theorems were elaborated, not proved.

## Source issues

- none

## For the human reviewers

- none

