# Review of AlgebraicTopology (pull request #1652 at 61ee7a2)

**Verdict:** accepted

Incremental re-review of 105 changed lines since b7e4a02 (71 insertions, 34 deletions, `README.md` and `Suggested.lean` only; nothing changed outside the folder). The six findings of the previous review (PRREVIEW-AlgebraicTopology~11) are all repaired at this head and none of the repairs introduced a new problem. The gate passes with every counter zero, the dependency check reports no problem, the module builds and elaborates with `sorry` as the only warning, every library name the changed passages cite exists at the pins with the hypotheses the README states, and every consumer citation the new bullets make resolves on main at c9a16a0 or at HomotopySpheres' open head. No finding remains.

## Previous findings

- R01 — repaired: `Suggested.lean:1`–`:9` is now `module`, `public import Mathlib` and five `public import TauCeti.…` lines; `public section` at `:51` precedes the namespace. The gate's build check reports `build=0`; the targeted build and a probe elaboration emit the 18 `sorry` warnings and nothing else.
- R02 — repaired: `README.md:996` reads “the ordered-product interchange sign (Theorem 3.11, p.210)”. In the cached Hatcher text Theorem 3.11 (hatcher line 9099) follows the marker for PDF page 219; the offset is 9 (Theorem 2.44 marker 155 = printed p.146, Proposition 2.22 marker 133 = p.124, Proposition 3B.1 marker 278 = p.269), so printed p.210.
- R03 — repaired: `README.md:119`–`:124` now says Layer 4.0 is the single owner of the coreflection, convenient products, exponentials, CW comparisons and the pointed suspension–loop adjunction, and that HomotopySpheres' pointed cones, Puppe sequences and stabilization are consumers; `:3264`–`:3266` says the same; the worked-example bullet `:3369`–`:3374` is now the adapter statement (degreewise surjective skeletal towers, limits equal to the cochains of the pair, imported DerivedModuleAlgebra maps transported along the comparison) with the two tested values.
- R04 — repaired: `Suggested.lean:315`–`:317` carries `[CompactSpace X] [T2Space X]` and no `[T2Space Y]` (confirmed by `#check`, signature below); `README.md:3026` says “any space Y equipped with a `CWTypeModel`”, and `:3032`–`:3038` and the docstring give the argument (postcomposition with the model equivalence, homotopies as adjoints of (f,t,x) ↦ H(t,f(x)), evaluation continuous for compact Hausdorff X) and the Sierpiński instance.
- R05 — repaired: `README.md:3293`–`:3298` adds the GeneralizedCohomology (G2.1) bullet naming §4.7, §8.2, §8.10 and 8.11b, and the HeegaardFloer bullet naming §6.4's compact-triad Poincaré–Lefschetz theorem with its degree, cap-boundary sign and coefficient-pairing conventions.
- R06 — repaired: the supplier contract `README.md:272`–`:284` cites `TopCat.singularHomologyCross` in `Singular.CrossProduct` with its cycle-class formula, both naturality lemmas and the Alexander–Whitney comparison, states the pin's generality (preadditive monoidal category with homology, colimit-preservation hypotheses that `ModuleCat` satisfies by instance search) and that the pin has no Künneth isomorphism, sequence or Tor term; §5.1 `:1363`–`:1377` builds the field isomorphism and the hereditary-ring sequence on the direct sum of the native maps, defines this roadmap's cross product as the native map followed by the unitor `R ⊗_R R ≅ R`, and defines no second cross product.

No repair report marks any finding “not actionable in this package”.

## Verified sound

**Scope of this round.** Incremental re-review of 105 changed lines since b7e4a02. The passages reviewed in full: the Scope bullet on Layer 4.0 (`README.md:119`–`:127`), the Eilenberg–Zilber/cross-product supplier contract (`:272`–`:284`), the §4.5 locator (`:996`), §5.1 (`:1361`–`:1377`), §8.11's absolute statement (`:3025`–`:3038`), the Downstream consumers paragraph and the two new carrier bullets (`:3264`–`:3298`), the tower worked example (`:3369`–`:3374`), and in `Suggested.lean` the header (`:1`–`:9`, `:51`) and `finiteSourceMappingCWType` (`:303`–`:318`) with the `CWTypeModel` structure it uses (`:213`–`:218`). Of the seeded sample, 5.2 (which needs §5.1) and 8.10 (named by the new consumer bullet) fall in the dependents of the changed passages and were re-read; the other seeded targets are untouched by the diff and their rows are carried from the previous reports. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Gate and dependency check.** Re-run from the checkout at 61ee7a2, the gate prints every counter zero (`set_option=0 … sorry-data=0 … imports=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 … OK`); the worker's run adds `build=0`. The dependency command returned

```text
depcheck: 234 roadmaps, 2161 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line for this roadmap.

**Elaboration, signatures, padding.** A probe copy of `Suggested.lean` in the scratch directory, with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | decide | trivial | sorry` and `#check @name` appended for all 31 declarations, elaborated with `lake env lean` from the checkout, exit 0 apart from four `#check`s of library names the file does not import (listed below, re-checked in a second probe). All 18 admitted theorems still report `declaration uses 'sorry'` (lines 64, 74, 87, 146, 157, 180, 190, 200, 221, 233, 245, 258, 276, 285, 296, 315, 335, 363), so none closes by one tactic; no padding. All 31 `#check`s print, so nothing became private under `public section`; the elaborated types agree with the worker's `signatures.md` and with the README. The changed one:

```lean
@TauCetiRoadmap.AlgebraicTopology.finiteSourceMappingCWType : ∀ {X Y : Type u_1} [inst : TopologicalSpace X]
  [inst_1 : TopologicalSpace Y] [CompactSpace X] [T2Space X] (modelY : TauCetiRoadmap.AlgebraicTopology.CWTypeModel Y),
  Nonempty (TauCetiRoadmap.AlgebraicTopology.CWTypeModel C(X, Y))
```

No section binder is lost (the file has none). Lean form: `module` header with `public import Mathlib` and five existing `TauCeti.*` modules, one module docstring, `theorem` throughout, no `set_option`, `lemma`, `#eval`, `#print axioms`, `True` placeholder or sorried data.

**The cross-product contract at the pin.** `TauCeti/AlgebraicTopology/Singular/CrossProduct.lean` at Tau Ceti 358314d4: `singularHomologyCross` (`:73`) has type `H_p(X;R) ⊗ H_q(Y;S) ⟶ H_n(X ⊗ Y; R ⊗ S)` for `h : p + q = n`; `homologyπ_tensorHom_singularHomologyCross` (`:102`), `singularHomologyCross_naturality` (`:121`), `singularHomologyCross_coefficient_naturality` (`:152`) and `singularHomologyCross_comp_homologyMap_alexanderWhitney` (`:187`) exist with the statements the README describes. The standing variables (`:66`–`:70`) are a preadditive monoidal category with homology, `MonoidalPreadditive`, `HasCoproducts.{w}` and discrete-colimit preservation by `tensorLeft`/`tensorRight`, plus per-declaration coequalizer preservation for three objects, exactly as the contract says; the file contains no Künneth, Kunneth or Tor declaration. A second probe importing that module (built first with the brief's `lake build` of that one module) elaborated `singularHomologyCross X Y (ModuleCat.of k k) (ModuleCat.of k k) i j n h` for a field `k` and for a commutative ring `R`, exit 0 with no error or warning: every colimit-preservation hypothesis is found by instance search for `ModuleCat`, as the contract claims. The README's prose `TopCat.singularHomologyCross X Y k k i j n` elides the proof argument `h : i + j = n`, which the sentence states in words.

**The dropped `[T2Space Y]`.** `CWTypeModel Y` (`Suggested.lean:213`–`:218`) bundles a carrier with a `T2Space` instance, a `CWComplex` structure and a `HomotopyEquiv` from `Y`; the README's argument uses only that. At Mathlib f6090c70, `ContinuousMap.curry` (`Mathlib/Topology/CompactOpen.lean:430`) produces `C(X, C(Y, Z))` from `C(X × Y, Z)` with no hypothesis, so the adjoint `C(X,Y) × I → C(X,Y)` of a continuous `(f,t,x) ↦ H(t, f(x))` is continuous for any `Y`; continuity of evaluation is the `ContinuousEval` instance (`:245`), available for compact Hausdorff `X` since it is locally compact; the README cites Hatcher A.14–A.16 (pp.530–531) for both, checked in the previous rounds. Milnor's Theorem 3 (milnor1959 printed p.276) then applies to the carrier `K`.

**Consumers and suppliers resolved.** On main at c9a16a0: `TauCetiRoadmap/GeneralizedCohomology/README.md:229`–`:238` consumes `simplicialRealizationCW`, `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`, `kanRealizationUnitHomotopyIso`, `ordinaryEMRepresentability` and `ordinaryEMLoopComparison`; this README carries them at §4.7 (`:1253`, realization CW structure for every simplicial set), §8.2 (`:2531` every simplicial group is Kan, `:2532` Moore comparison, `:2539` realization-unit theorem), §8.10 (`:2971`) and 8.11b (`:3139`). `TauCetiRoadmap/HeegaardFloer/README.md:656`–`:658` consumes the compact-triad Poincaré–Lefschetz map with its fixed degree, cap-boundary sign and coefficient-pairing conventions; §6.4 (`:2243`–`:2265`) states it for a compact m-manifold with boundary faces, degree shift k ↦ m−k, the cap identity ∂(z⌢φ) = (−1)^k(∂z⌢φ − z⌢δφ) and every module-valued local system L. At HomotopySpheres' open head (`rev/1287`, `README.md:661`–`:683`), §3A is “Pointed constructions and stabilization” with §3A.1 compact-generation adjunction and §3A.2 pointed cones and Puppe sequences, whose `*Needs:*` line cites AlgebraicTopology Stage 4.5 and Stage 8; the new Scope wording describes it correctly as a consumer. Neither HomotopySpheres nor GeneralizedCohomology appears in a `*Needs:*` line newly; §8.10's existing `*Needs:*` (`:2973`) cites GeneralizedCohomology G2.1's product comparison while GeneralizedCohomology's supplier table (`:35`) consumes §8.10's representability: both roadmaps are on main, the exchange is acyclic at the section level (Layer 4.0 → G2.1 → §8.10 → G2), the Scope records the split (`:125`–`:127`), and the dependency check orders no main-against-main pair; this is unchanged by the diff and was accepted in PRREVIEW-AlgebraicTopology~8.

**Seeded source audit** (texts read from the cache: hatcher, printed page = PDF marker − 9; milnor1959). No passage is copied.

| Target | Locator and text checked | Assessment |
|---|---|---|
| 4.5 | Hatcher Theorem 3.11 (hatcher line 9099, marker 219 → p.210); Proposition 2.22 (line 5456, marker 133 → p.124); Proposition 3B.1 (line 11612, marker 278 → p.269) | All three locators now correct. |
| 5.1 | Native `singularHomologyCross` and its four lemmas at the pin (file and lines above); Hatcher 3B.5 (p.274), 3B.6 (p.275) carried from r8 | Contract and statement correct. |
| 5.2 | No page locator; derived from §5.1 and native cones; values recomputed below | Correct. |
| 6.4 | Hatcher Theorem 3.30 (line 10453, marker 250 → p.241, as `:2266` says); Theorem 3.43 (line 10976, marker 263 → p.254) for the five-lemma route | Correct. |
| 8.10, 8.11 | Milnor Theorem 3 p.276 and Hatcher A.14–A.16 carried from r8/r11; `ContinuousMap.curry` at the pin | Correct. |
| 2.3, 3.2, 3.5, 4.2, 4.3, 4.6, 6.5, 7.2, 8.1, 8.5, 8.6, 8.8, 8.9 | Untouched by the diff; rows carried from PRREVIEW-AlgebraicTopology~8 and ~11 | Carried. |

**Adversarial computations.** New rows for the changed statements; the rest cite the previous reports (“r8”, “r11”), unchanged by the diff. 0 denotes the trivial group or module.

| Statement | Instances tried | Values on the two sides / discriminating value | Result; change |
|---|---|---|---|
| 8.11 `finiteSourceMappingCWType` without `[T2Space Y]` | Y Sierpiński; Y the indiscrete two-point space; X = ∅; Y = ∅ with X ≠ ∅ | Sierpiński is contractible (H(x,t) = x for t < 1, H(x,1) = 0; H⁻¹{1} = {1} × [0,1) open), model K a point, C(X,Y) ≃ point; indiscrete Y is contractible and C(X,Y) is indiscrete (every subbasic V(C,U) is ∅ or all), so a point model; C(∅,Y) is a point with the point model; C(X,∅) = ∅ with the empty model. The homotopy e⁻¹∘e ≃ id transports to C(X,Y) through `curry` of (f,t,x) ↦ H(t,f(x)), continuous because evaluation is continuous for compact Hausdorff X | New; T2 on Y not needed; retain T2 on X |
| 5.1 field Künneth on the native map | T² over 𝔽₂ in degree 1; RP² × RP² over ℤ in degree 3; coefficient object | ⊕_{i+j=1} H_i(S¹;𝔽₂) ⊗ H_j(S¹;𝔽₂) = 𝔽₂ ⊕ 𝔽₂ = H₁(T²;𝔽₂); over ℤ the tensor sum in degree 3 is 0 while H₃ = Tor(ℤ/2,ℤ/2) = ℤ/2, so the field hypothesis is needed and the hereditary sequence has the Tor term; native target H_n(X×Y; k ⊗_k k), unitor k ⊗_k k ≅ k gives H_n(X×Y;k) (a model with ⊗_ℤ would give ℤ ⊗_ℤ ℤ = ℤ for k = ℤ only) | New; retain field / hereditary split and the unitor |
| 4.5 locator | Calibration at Theorem 2.44, Proposition 2.22, Proposition 3B.1 | 155 − 9 = 146, 133 − 9 = 124, 278 − 9 = 269; Theorem 3.11: 219 − 9 = 210 | New; agrees |
| 6.0 tower worked example | Point tower, constant with identity maps; one-vertex circle | δ(a)ₙ = aₙ − aₙ₊₁: δ(3,1,0,…) = (2,1,0,…); δ surjective (a₀ = 0, aₙ₊₁ = aₙ − bₙ) so lim¹ = coker δ = 0; circle: C¹_cell(X⁰) = 0, C¹_cell(Xⁿ) = M for n ≥ 1, limit M, differential from degree 0 is 1 − 1 = 0, H¹(S¹;M) = M | New; agrees with r8 values; retain |
| 6.4 compact triad conventions (consumer bullet) | K = S¹ × I, m = 2, L = ℤ, faces (∂₀K, ∂₁K) = (∅, ∂K) and swapped (∂K, ∅); also (S¹×{0}, S¹×{1}) | H^k(K,∂K) ≅ H_(2−k)(K): (0, ℤ, ℤ) against (H₂, H₁, H₀)(K) = (0, ℤ, ℤ) for k = 0, 1, 2; swapped: H^k(K) = (ℤ, ℤ, 0) against H_(2−k)(K,∂K) = (ℤ, ℤ, 0); a model without the degree shift would pair H⁰(K) = ℤ with H₀(K,∂K) = 0; with the two circle faces both sides vanish in every degree since K retracts onto either face | New; the bullet's degree shift k ↦ m−k and face swap agree with Hatcher 3.43's form; retain |
| 8.2 Kan/Moore (consumer bullet) | Constant simplicial group S₃; ℤ[Δ¹/∂Δ¹] | r11 rows: π₀ = S₃, πₙ = 0; N₁ = ℤ(e − s₀v), π₀ = π₁ = ℤ | r11; retain |
| 5.2 Wang sequence | Mapping torus of id on S¹; of the reflection on S¹ | id − f_* = 0, H₁(T²) = ℤ²; id − f_* = 2 on H₁(S¹), H₁(K) = ℤ ⊕ ℤ/2; id + f_* would give ℤ/2 ⊂ H₁(T²), false | r11; retain id − f_* |
| 1.1, 1.5, 1.6, 2.5, 2.7, 4.1, 4.3, 4.7, 5.3, 6.2, 6.3, 6.4 (2 = 0), 6.5, 7.1–7.4, 8.3–8.8, 8.12 | As in r8 and r11 | As recorded there | Carried; untouched by the diff |

**Ownership against open work.** The diff adds no construction: the cross product is the pin's and is cited, not restated (§5.1 says no second cross product is defined); the mapping-space theorem, the tower adapters and the compact-triad duality were owned here before. HomotopySpheres (open head above) still builds the compact-generation adjunction in its §3A.1; that duplicate is a repair on its side, recorded in its own reviews, and this README's Scope now states the ownership correctly. The other sibling checkouts were not re-read for this 105-line change; the roadmap packages on the board (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated by subject.

## Not verifiable

- **eilenberg-steenrod**, **whitehead**, **dold**, **may**, **mccleary**, **weibel**, **brown-cohomology**, **freedman-quinn**: no legal full text in the worker's cache and none found by the previous rounds; nothing in this diff cites them.
- **thom1954**, **lee**: settled as uncertified in the manifest; cited by locator only.

## Source issues

- none
