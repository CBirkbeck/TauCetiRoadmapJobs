# Review of ComplexKahlerGeometry (pull request #1807 at 89357f3)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README 3572–3575 now read "C7.6 K7.1's comparison of `TauCeti.ComplexProjectiveSpace 1` with `Projectivization ℂ (Fin 2 → ℂ)` and its Riemann-sphere diffeomorphism from `OnePoint ℂ` to `Projectivization ℂ (Fin 2 → ℂ)` on Mathlib's topology".

## Deferred findings

- D01 — stands as a settled deferral and is unchanged at this head. README 104–106 and 111–114 are as before, and so are main's RealAnalyticGeometry line 22 and PseudodifferentialOperators line 91.
- D02 — K7.1's half no longer applies. 7.1 (2727–2731) no longer repeats Tau Ceti's Hausdorff argument: the complex case now follows from K7.1's own model homeomorphism. AlgebraicTopology §4.6's real case (1848–1856 at this head) is unchanged.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 7.1 second countability by `Topology.IsOpenQuotientMap.secondCountableTopology` (2727–2729, changed) | n=2. Wrong route: a quotient map that is not open | `inferInstance` fails at the pin. The lemma applied to `isOpenQuotientMap_mk'` elaborates for every n. ℝ with ℤ collapsed to a point is a non-open quotient of ℝ and is not first countable | openness is needed and present; holds |
| 7.1 Hausdorff, compact and path-connected by transport (2729–2731, changed) | n=0, n=1, general n | n=0: S¹/S¹ is a point. n=1: S³/S¹≅S². The probe's `isEmbedding.t2Space`, `symm.compactSpace` and `Surjective.pathConnectedSpace` elaborate. `inferInstance` fails for all four | holds; the transport is needed |
| Model homeomorphism, "no separation property" (2771–2773, changed) | v=(3,4) and (6i,8i). Wrong model: the sup norm | (3,4)↦(3/5,4/5) and (6i,8i)↦i(3/5,4/5), one class. The inverse gives [(3/5,4/5)]=[(3,4)]. The sup norm gives (3/4,1), whose Euclidean norm 5/4≠1 | the probe builds `homeo` from the two quotient maps alone; holds |
| χ on Mathlib's carrier via `Homeomorph.finiteCWType` and `Homeomorph.eulerChar_eq` (contract 263–265, *Needs:* 2817–2819, changed) | n=0, 1, 2 | A point has χ=1, S² has χ=2 and ℂP² has χ=3. The probe closes `eulerChar (ℙ ℂ (Fin (n+1)→ℂ)) = n+1` with the two rewrites | holds; both carriers are in `Type` |
| 7.1 Check 1 (the comparison that the changed text relies on) | `[3:4]`, `[6i:8i]` | The scalar (2i)⁻¹ identifies the two lines, and the probe's `F 1` values agree. The chart v₀≠0 reads 4/3 in both models | holds |
| 7.1 *Needs:* (2809–2819) against Dependencies (3341–3344) and the contracts (210–213, 257–266), all changed | the item lists | *Needs:* lists 3 Mathlib names, 3 atlas modules, 3 sphere-model modules and 3 χ names, all present at the pins. Dependencies names the open quotient map and the transported instances | agree |
| Consumer bullet 3572–3575 (R01) | the C7.6 chain | Under t↦[t:1]: [1:0]↦∞, [0:1]↦0, [1:1]↦1. CharacteristicClasses 181, 272–275 and 3305–3307 name the comparison and the diffeomorphism, and CKG now names both | repaired |

The rows for untouched statements and headline theorems stand as in the previous review, of `8d8b243`.

- Gate:
  - The worker's gate at 89357f3 passed: every check 0, build 0.
  - My rerun without the pull request's folder list: every scanner is 0 except `outside-folder`=24, which is exactly the files of the 12 folders the brief names. `git diff --stat` excluding them is empty.
  - Dependency check: `depcheck: 206 roadmaps, 1919 edges, 0 problem(s)`.
- Elaboration:
  - `lake env lean` on `Suggested.lean`: exit 0, 27 warnings, all `declaration uses sorry`. The file is unchanged since d524e59, so the 36 signatures and the binder check stand.
  - A scratch probe (`import Mathlib` plus five Tau Ceti modules) builds the model homeomorphism, the four instances, `FiniteCWType`, χ=n+1 and Check 1, and exits 0.
- Library declarations opened at the pins (12 Mathlib, 17 Tau Ceti):
  - Mathlib: `Topology/Bases.lean:1137`; `Topology/Algebra/Projectivization.lean:44, 47, 56, 61, 83`; `LinearAlgebra/Projectivization/Basic.lean:78, 118, 149`; `Topology/Homeomorph/Lemmas.lean:104`; `Topology/Connected/PathConnected.lean:623`.
  - Tau Ceti: `Topology/ComplexProjectiveSpace/Basic.lean:58, 67, 72, 77, 102, 130, 153`; `Topology/Algebra/Projectivization.lean:149, 188, 215, 251, 271, 311`; `Topology/CWComplex/Classical/FiniteCWType.lean:98`; `AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:163` and `ComplexProjective.lean:68`.
  - The modules `Topology/ComplexProjectiveSpace/Charts` and `Geometry/Manifold/Instances/ComplexProjectiveSpace` exist.
- Source locators: 7.1, the only sampled target in a changed passage, cites no textbook locator. Its claims rest on the pinned declarations above, all checked.
- Cross-roadmap citations resolved (8):
  - At this head: CharacteristicClasses 181, 272–275, 3305–3307; AlgebraicTopology 1887–1890, which leaves the comparison and the CW transport to K7.
  - At their open heads: DGFloerPartII 838.
  - On main: MorseTheory 1215.
- Overlap check: searched every open head and main by pattern for the changed objects, which covers ComplexComparisonPartII, SmoothBundlesConnections, GeometricQuantization, RiemannianGeometry, DeRhamCohomologyAndDuality, CalibratedGeometry, GlobalHolomorphicFunctions and DifferentialGeometry.
  - The instances on Mathlib's ℙ_ℂ, the model comparison and the χ transport have one owner, K7.1.
  - Hausdorffness of the real `Projectivization ℝ (Fin (n+1) → ℝ)` is AlgebraicTopology §4.6's: a different object.
- Pull-request text holds against this head:
  - "K7.1 reproves on Mathlib's topology the instances Tau Ceti states on its own copy" is still accurate: K7.1 now proves them by transport.
  - The CharacteristicClasses sentence "takes ComplexKahlerGeometry K7.1's Riemann-sphere diffeomorphism on Mathlib's topology (C7.6)" states the new consumer.
  - "ComplexKahlerGeometry's changes only in comments" holds.

## Not verifiable

- webster-nn, hormander-alpdo1, wells-dacm, griffiths-harris, koszul-malgrange, nomizu-nilmanifolds and raghunathan-discrete-subgroups are uncertified in the manifest. No changed passage cites them.

## Source issues

- none
