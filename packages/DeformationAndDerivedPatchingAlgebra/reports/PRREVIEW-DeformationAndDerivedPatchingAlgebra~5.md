# Review of DeformationAndDerivedPatchingAlgebra (pull request #1034 at fab28ea)

**Verdict:** needs changes

## R01 (P1) — The changed Hom-complex name breaks the build

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/Suggested.lean:409`: `let D := CochainComplex.linearHomComplex R P`.
**Claim:** This identifier is unavailable at the pinned libraries, so the acceptance test does not elaborate.
**Witness:** Targeted build and direct elaboration both report `Unknown constant CochainComplex.linearHomComplex`. `TauCeti/Algebra/Homology/LinearHomComplex/Basic.lean:80` defines `TauCeti.linearHomComplex`.
**Repair:** Restore `TauCeti.linearHomComplex R P`. This single replacement elaborates in a scratch copy, including checks of all 32 signatures.

## R02 (P3) — Pass the derived-category choice explicitly

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/Suggested.lean:41`: `attribute [local instance] HasDerivedCategory.standard`.
**Claim:** The `statement-hygiene` gate forbids this local derived-category instance.
**Witness:** The gate reports this exact line; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:42` specifies an explicit `HasDerivedCategory` parameter for statements involving derived categories.
**Repair:** Delete the attribute. Add `[HasDerivedCategory.{v} (ModuleCat.{u} R)]` to `Der`, `H`, `derivedSupport`, `codimension_amplitude_inequality`, `balanced_dimension_concentration` and `patched_dual_concentration`; use the corresponding `S` parameter in `cohenMacaulay_action_concentration`. This variant elaborates.

## R03 (P3) — Use the existing intermediate-field algebra instance

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/Suggested.lean:210`: `letI : Algebra O E := ((algebraMap K E).comp (algebraMap O K)).toAlgebra`.
**Claim:** A `letI` inside this theorem signature fails `statement-hygiene`.
**Witness:** `Mathlib/FieldTheory/IntermediateField/Basic.lean:408` supplies `IntermediateField.algebra'` under the field, algebra and scalar-tower hypotheses already present.
**Repair:** Delete the `letI` and use the existing instance for `Module.Finite O (integralClosure O E)` and `B →ₐ[O] integralClosure O E`. The resulting signature elaborates without additional hypotheses.

## R04 (P3) — Name the parafactoriality statement as an existence result

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/Suggested.lean:310`: `Nonempty (L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial …)`.
**Claim:** The theorem's name does not satisfy the gate's `nonempty_*` convention for this conclusion.
**Witness:** The gate identifies `localCI_parafactorial`; `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1346` explicitly disclaims a canonical trivializing section.
**Repair:** Rename the theorem `nonempty_localCI_parafactorial` and update its README reference. Keep the existence statement; do not invent a canonical trivialization. The renamed declaration elaborates.

## R05 (P3) — Name the Ext comparison as an existence result

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/Suggested.lean:432`: `Nonempty (CategoryTheory.Abelian.Ext … ≃+ CategoryTheory.Abelian.Ext …)`.
**Claim:** The theorem's name does not satisfy the gate's `nonempty_*` convention for this conclusion.
**Witness:** The gate identifies `finiteActionCanonicalDuality_ext`; `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1798` says this native Ext statement does not select a normalization.
**Repair:** Rename it `nonempty_finiteActionCanonicalDuality_ext` and update its README reference. This preserves the stated generality and elaborates.

## R06 (P3) — Correct the PR's validation claim

**Location:** PR description, Validation paragraph: “the targeted Lake build succeeds with `sorry` as the only warning”.
**Claim:** This sentence contradicts the submitted head.
**Witness:** At `fab28ea`, the targeted build exits 1 at `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/Suggested.lean:409`; the gate also reports four statement-hygiene violations.
**Repair:** Until repaired, write: “At fab28ea the targeted build fails on an unknown Hom-complex identifier, and four statement-hygiene checks fail; the dependency check passes.” Update this evidence after rerunning checks on the repaired head.

## R07 (P3) — State that the PR adds a new roadmap

**Location:** PR description: “Roadmap folder `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra` (README, `Suggested.lean`, `metadata.toml`)”.
**Claim:** The description does not state whether this adds a roadmap or revises one on main, which the PR-text check requires.
**Witness:** The folder is absent from `origin/main`; the base-to-head diff adds three files, 2,405 lines, 108 headings and 32 Lean declarations, with no deletions.
**Repair:** Replace that fragment with: “This PR adds the new `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra` roadmap: README, `Suggested.lean` and metadata. It revises no existing roadmap.”

## Previous findings

- R01 — repaired: `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1448` specifies the cardinality of a basis of `∏_ℕ k`, explicitly excluding the countable index set.
- R01 (carried) — repaired: `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:13` names regular-element projective-dimension reduction; line 564 distinguishes the cited depth/resolution results from its inline proof.
- R02 (carried) — repaired: `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1186` now names PurityOfBranchLocus §0.3's `auslander_buchsbaum` and `IsRegularLocalRing.free_of_isCohenMacaulay`.

## Verified sound

Here `O` is a complete DVR with uniformizer `π` and residue field `k`.

| Statement | Instances tried | Computed left side | Computed right side | Result / change |
|---|---|---|---|---|
| §3.1 syzygy bound | `M=k` over `O`, `j=1`; `k` over `k[ε]/ε²` | Depths `1`; `0` | `min(1,0+1)=1`; `min(0,j)=0` | Equalities; locator repair retained |
| §3.1 regular-element reduction | `A=k[[x,y]], M=A/(y)`, kill `x`; control `M=k` over `O` | `pd_(k[[y]]) k=1`; control `pd_k k=0` | `pd_A M=1`; control `pd_O k=1` | `1=1`; `0≠1` excluded by module-regularity hypothesis |
| §5.8 point-completion freeness | Source `E[[t]]`, module `E[[t]]²`; control module `E` | Depths `1`; `0` | Source dimension `1`; projective dimensions `0`; `1` | Free rank two; control fails depth hypothesis |
| §7.5 corrected index set | `O=F₂[[t]]`, `J` a basis of `F₂^ℕ`; control `J=ℕ` | Residue dimensions `2^ℵ₀`; `ℵ₀` | Product residue dimension `2^ℵ₀` | Correct cardinality agrees; countable completion fails |
| §7.5 nonprojectivity and Ext | `P=∏_ℕ O`, target `O` | `P` complete; infinite free sums have nonconvergent Cauchy partial sums `Σπⁿe_n` | `Ext¹_O(P,O)=0`; `Ext²_O(P,O)=0` | Nonprojective source remains compatible with vanishing against complete targets |
| `Der`, `H`, `derivedSupport` (R02) | Field stalk `k[0]`, either derived-category choice | `H⁰=k`, other cohomology `0`; support `{(0)}` | Same stalk cohomology and support | Choice parameter preserves the object |
| `codimension_amplitude_inequality` (R02) | `O →π O` in degrees `0,1`; field stalk in degree `0` | Support dimensions `0`; `0` | Bounds `1−1=0`; `0−0=0` | Both inequalities are equalities |
| `balanced_dimension_concentration` (R02) | `O →π O` in degrees `0,1` | `H¹=k`, other cohomology `0`; projective dimension `1`; local cohomology only `H⁰_m(k)=k` | Endpoint `1`; projective dimension `l=1`; support dimension and local-cohomology degree `n−l=0` | Concentration and nonvanishing agree |
| `cohenMacaulay_action_concentration` | `S=O`, `R=N=k`, `P=[O →π O]`, degrees `0,1` | `H⁰=0`, `H¹=k`, `pd_O k=1`, both depths `0`; scalar `1·1=1` | `l=1`, `d−l=0`, `dim R=0`; induced action sends `1` to `1` | `.asHom` preserves the action equation |
| Same theorem, nonregular CM base | `S=R=k[ε]/ε²`, free stalk in degree `−2`, `l=d=0` | `H⁻²=S`, `pd=0`, both depths `0`, support dimension `0` | Endpoint `a+l=−2`; required dimensions `d−l=0` | Regularity of the base is unnecessary |
| `patched_dual_concentration` (R01) | `P=[O →π O]`, degrees `0,1`; shifted to `2,3` | Dual cohomology `k` in degree `0`; respectively `−2`; other degrees `0` | `Ext¹_O(k,O)=k`; expected endpoint `−a=0`, respectively `−2` | Mathematical indices agree; restore pinned constructor |
| `exists_integral_point_of_not_nilpotent` (R03) | `O=B=Z₂`, `K=Q₂`, choose embedded `E=K`; control `B=F₂` | Integral closure `Z₂`, rank `1`, map identity, image of `2` nonnilpotent | Required finite local point exists; control image of `2` equals `0` | Native algebra instance suffices; control excluded |
| `localCI_parafactorial` (R04) | `A=F₃[[x₁,x₂,x₃,x₄]]`, empty regular sequence, trivial line on punctured spectrum | Dimension `4`; trivializations multiply by `1` or `2` | Both maps invertible: `1·1=1`, `2·2=1` in `F₃` | Existence does not choose a trivialization |
| `finiteActionCanonicalDuality_ext` (R05) | `S=O`, `Q=R=N=k`, `d=1,e=r=0`; zero-module control | `Ext¹_O(k,O)=k`; `Ext¹_O(0,O)=0` | `Hom_k(k,k)=k`; `Hom_k(0,k)=0` | Both comparisons agree; no normalization chosen |

Untouched adversarial rows stand as in the previous review of `c94eeb0`.

- 9 source locators read: Stacks 00LX, 0CXE, 0CXF, 065R (`stacks-00LX` lines 8069, 12363, 12372, 12381); Buchweitz–Flenner 2.1, 2.3 (`bf2006` lines 47, 113); Christensen–Iyengar Proposition 6 (`ci2021` line 200); IKM 10.7, 11.3 (`ikm` lines 2116, 2226).
- 5 pinned declarations opened: `TauCeti/Algebra/Homology/LinearHomComplex/Basic.lean:80`; `Mathlib/CategoryTheory/Endomorphism.lean:55`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:81`; `Mathlib/FieldTheory/IntermediateField/Basic.lean:408`; `Mathlib/RingTheory/Regular/ProjectiveDimension.lean:86`.
- 3 changed-context supplier declarations resolved on main: PurityOfBranchLocus §0.3's two freeness inputs and SchemeAndStackFoundations §0.17's mapped `depth_shortExact`; no added supplier edge.
- 2 changed Lean headlines checked against §§9.2–9.3; all 32 `#check @name` signatures elaborate after R01's scratch correction, with the required binders retained; all 5 relevant one-tactic probes fail to close.
- Gate FAIL: 4 statement-hygiene hits; targeted build and direct elaboration both exit 1 at line 409; other scanners pass. The combined scratch repairs elaborate with exactly 18 `sorry` warnings.
- 12 changed lines reviewed; 0 directly changed seeded-sample targets; 0 outside-folder changes; 0 worktree edits. The PR title, summary block and prose were compared with the base-to-head addition.

Dependency-check output:

```text
depcheck: 245 roadmaps, 2214 edges, 0 problem(s)
```

Overlap check: read DirectSummandsAndBigCohenMacaulay, DeformationAndDerivedPatchingAlgebraPartII, LocalGaloisDeformationRings, CompletedCohomologyPartII, GL2ModularityLifting, DerivedModuleAlgebra, SchemeAndStackFoundations and PurityOfBranchLocus. For the changed objects, resolutions/Auslander–Buchsbaum/freeness belong to PurityOfBranchLocus, depth to SchemeAndStackFoundations, derived Hom to DerivedModuleAlgebra/the pins, and regular-element reduction, complete-flat representatives and concentration to this roadmap; the arithmetic roadmaps consume these comparisons.

Untouched scope remark: `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:21` assigns Macaulayfication to Part II, whose present scope excludes Macaulayfication; this lies outside the incremental changes.

Source independence: changed passages only—6 edited passages compared with 4 source texts and the cited supplier/pinned interfaces; no copied expression or reused material identified. Stacks has the largest share of this round's verified locators, 4 of 9. No layers changed, so the arrangement comparison was not reopened.

## Not verifiable

- Unchanged locators in Calegari–Geraghty (Lemma 6.1 and the correction) and Avramov's book chapter retain the previous review's certification limits; no newly required source remains unread.

## Source issues

- none

## For the human reviewers

- none
