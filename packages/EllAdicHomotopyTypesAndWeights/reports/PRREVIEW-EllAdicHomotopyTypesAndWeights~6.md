# Review of EllAdicHomotopyTypesAndWeights (pull request #1644 at 2e22a16)

**Verdict:** needs changes

Incremental re-review of the 34 lines changed in `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md` since `e3d2077`. Both findings are about the pull request's description; the README changes are correct.

## R01 (P3) — The description calls every roadmap not on main a consumer

**Location:** Pull request description, dependencies paragraph: “In open pull requests of ours: not determined (…). Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite.”

**Claim:** The README consumes nine roadmaps that are still in open pull requests. It names no consumer roadmap at all.

**Witness:** README line 592 (§4.4 *Needs:*) cites AlgebraicTopologyPartII through five gaps and ComplexComparisonPartII §§C6.0, C6.3, C6.6. Line 1006 cites DeligneWeightsAndPurity and AnabelianGeometryAndNonabelianChabauty. “Downstream consumers” (line 1008) names no roadmap.

**Repair:** Replace the two sentences with: “The README consumes DGAInfinity, AlgebraicTopology, DerivedModuleAlgebra, AdicSpacesPartII, EtaleCohomologyFoundations, SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero and ReductiveGroups on main. It also consumes the nine roadmaps listed under Depends on, which are still in open pull requests and merge first. MixedHodgeModulesAndIrregularHodgeTheory is named for scope only, and no consumer roadmap is named.”

## R02 (P3) — The description says the Lean states definitions and theorems with `sorry`

**Location:** Pull request description: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti” and “the targeted Lake build succeeds with `sorry` as the only warning”.

**Claim:** `Suggested.lean` has no declarations and no `sorry`, because none of the 21 headline theorems can be stated at the pins. A reader needs to know this, and the description does not say it.

**Witness:** `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/Suggested.lean` lines 59–61: the namespace opens and closes with nothing in it. The file has 0 occurrences of `sorry`. `lake env lean` exits 0 with no output. The docstring lists 21 headlines, each with the carrier it lacks.

**Repair:** Replace both clauses with: “`Suggested.lean` has no declarations. Its module docstring names the 21 headline theorems and, for each one, the carrier missing at the pinned Mathlib and Tau Ceti. The targeted Lake build succeeds with no warning.”

## Previous findings

- None: the review of `e3d2077` raised no findings and accepted the folder.

## Verified sound

| Statement | Instances tried and values computed on each side | Result / change |
|---|---|---|
| gap:sullivan-quasi-isomorphism-rigidity (scope clause deleted) | Λ(a₁), a↦2a: H¹ map 2, inverse a↦a/2, iso. Λ(x₂,y₃), dy=x², x↦cx, y↦c²y: quasi-iso iff c≠0, then iso. | Holds on both. |
| same, non-minimal control | Λ(u₁,v₂), du=v → K: H=K in degree 0 on both sides; the source has v≠0 in degree 2, so it is not an iso. Linear du is excluded by minimality. | Minimality is the hypothesis that excludes it. |
| gap:sullivan-scalar-extension (scope clause deleted) | ℚ→ℚ(√2) and ℚ→ℚ(x): identity of Λ(a₁,b₁), d=0. H¹ dimensions 2/2, H² 1/1 (injective). Decomposable generator differentials stay decomposable after ⊗L. | Holds (field extensions are flat). |
| Supplier address, lines 11, 65, 71, 75 | AlgebraicTopologyPartII at #1694 head `ed88288`: Layer 4 is §§4.1–4.6 (lines 617–753). 0 lines mention Sullivan, A_PL, Hirsch or minimal models. References to AlgebraicTopologyPartII Layer 4 in the README: 16 → 0 (14 “AlgebraicTopologyPartII Layer 4” and 2 “the Layer 4 rational-homotopy”). | Repair is consistent. |
| *Needs:*/Dependencies lines 185, 358, 374, 561, 592, 606, 664, 678, 717, 865, 887, 1006 | Every slug cited through AlgebraicTopologyPartII is one of the five contracts at lines 67–75. The README and `design/plan.json` have the same 12 gap slugs. | Consistent. |
| §8.2 formality (*Needs:* changed; seeded sample) | ℙ¹: Λ(x₂,y₃), dy=x², φ(x)=[x], φ(y)=0, φ(dy)=[x]²=0 in ℚ_ℓ[x]/(x²), so φ is a chain map. 𝔾_m: H¹ has weight 2≠1, so the projection kills it. | Holds; the proper hypothesis is needed. |
| Line 13, MixedHodgeModulesAndIrregularHodgeTheory §§5.1–5.2 | `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`: §5.1 at line 480 (D^b MHM, smooth quasi-projective varieties and supported categories); §5.2 at line 497 (f_!, f^* weights ≤w). Old `H.1/` ids: 0 in that README. | Resolves; a scope statement, not a supplier. |
| `Suggested.lean` against the description (R02) | 0 declarations, 0 `sorry`, 21 headline bullets. `lake env lean` exits 0 with no output in 14.3 s. The description says “theorems statable” and “`sorry` as the only warning”. | Contradiction (R02). |
| Description dependency sentence (R01) | Suppliers: 8 on main and 9 in open pull requests. Consumer roadmaps named in the README: 0. The description says “everything else … is a consumer”. | Contradiction (R01). |

The rows for statements this diff leaves untouched stand as in the previous review, of `e3d2077`.

- Gate rerun at `2e22a16`: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate also reports `build=0`. Nothing outside the folder changed.
- Dependency check (`--movable --pr 1644`): `depcheck: 205 roadmaps, 1896 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/Suggested.lean` exits 0 with no output. The file has not changed since `fbf13f8f`, and with no declarations there is nothing to `#check`.
- Source locators checked: 4. Morgan Definition 5.3 (morgan line 1036, p. 163); Proposition 5.9 (morgan line 1162, p. 167); weil-II (5.3.7) (line 3947, p. 242); dgms §6 Main Theorem (line 1060, p. 270).
- Cross-roadmap citations resolved: 6. AlgebraicTopologyPartII Layer 4 at #1694, where §4.4's route (line 711) uses the Serre spectral sequence and rational Hurewicz, not Sullivan theory. MixedHodge §§5.1/5.2 at package lines 480/497. EtaleHomotopyTypes §§3.2/3.3/3.4 at #1806 lines 536/555/574.
- Ownership: Sullivan algebras, A_PL, Hirsch extensions and 1-minimal models are planned only here, across main (`7342e8f`), the 439 open heads and the board packages. The pinned Tau Ceti has only A∞ minimal models; Mathlib has none. The five gaps stay minimal.
- Remark (no change asked): `design/plan.json` still gives section `AT2.4` (AlgebraicTopologyPartII Layer 4) for the five gaps, and the `needs` of two of them still begin “In §AT2.4”. The plan is fixed after the design.
- Remark: the citation resolver's lead at line 13 is a false positive (the cited roadmap is a board package). That package's line 1116 lists this roadmap as a consumer of §§5.1–5.2, but no *Needs:* line here cites those sections.

Overlap check: read EtaleHomotopyTypes, StableHomotopyKTheory, MotivicEtaleKTheory, AnabelianGeometryAndNonabelianChabauty, DerivedModuleAlgebra. EtaleHomotopyTypes (§§3.2–3.4, 6.7), MotivicEtaleKTheory (§§3.1–3.2, 3.4), AnabelianGeometryAndNonabelianChabauty (§§2.1–2.3) and DerivedModuleAlgebra (§§0.DP, 0.14–0.17, 1.1–1.5) own what they share with this roadmap, which cites each of them. StableHomotopyKTheory shares nothing.

## Not verifiable

- `sga5` and `miller` are uncertified (paywalled) and settled. The changed passages do not cite them.

## Source issues

- none
