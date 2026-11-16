# Review of SmoothBundlesConnections (pull request #2127 at c022e59)

**Verdict:** accepted

No findings. Incremental re-review of the 38 lines changed since `c1d15cd` (all in `TauCetiRoadmap/SmoothBundlesConnections/README.md`: the scope sentence, the B1.4 corollary, its API bullet and three Checks; `Suggested.lean` unchanged).

## Deferred findings

- D01 — stands

## Previous findings

- none: the previous report, of `c1d15cd`, raised no finding of its own; its R01 is D01 (deferred) and its R02 was repaired at that head and is untouched here.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| B1.4 corollary, (a) ⇒ (c) | local model `U × G → U`; `P = ∅` | fibre `{x} × G` = one orbit of right multiplication; onto since the U cover M and `G ∋ 1`; empty P forces `U = ∅`, so `M = ∅` | holds | none |
| Same, (c) ⇒ (b) | `π`, `q` both surjective submersions with orbit fibres; `G = 1`, `π(x) = x³` on ℝ | π descends along q and q along π (B1.1 descent), mutually inverse; `x³`: `dπ(0) = 0`, so (c) fails, and `φ = x³` is no diffeomorphism, so (b) fails: both sides false | holds | none |
| Same, (b) ⇒ (a) | `φ : P/G → M`, `V ⊂ P/G` open | `π⁻¹(φ V) = q⁻¹(V)`; `(φ × id_G) ∘ (q⁻¹(V) ≃ V × G)` lies over `φ(V)` and stays equivariant; `π = φ ∘ q` smooth and orbit-constant | holds | none |
| Same, trivial group | `G = 1` | (a): `π⁻¹(U) ≃ U` over a cover, so π a diffeomorphism; (b): `φ = π ∘ q⁻¹`; (c): injective surjective submersion; all three say "π is a diffeomorphism" | consistent | none |
| "Every principal bundle … is covered" | presentation data over a base of the Conventions | free: fibres are torsors; proper: `(p,g) ↦ (p,pg)` is a homeomorphism onto `P ×_M P`, closed as M is Hausdorff; P Hausdorff (separate in M or inside one `U × G`), second countable (countably many U by Lindelöf, G second countable) | holds under the Conventions' hypotheses on bases and groups (README lines 129–130) | none |
| Hypotheses of B1.1's converse as used | converse asks: P boundaryless Hausdorff, π surjective submersion, smooth free right action, orbits = fibres, G second countable | all are among the hypotheses of `exists_freeProperQuotient_isSubmersion` or in (c); for q, the quotient theorem supplies the submersion | in scope | none |
| Check: `SO(3) → S²`, `π(g) = ge₃` | `X = E₁₃ − E₃₁`, `E₂₃ − E₃₂`; `h ≠ 1` in H | `Xe₃ = −e₁`, `−e₂` up to sign, spanning `e₃^⊥`, so `gXe₃` spans `(ge₃)^⊥`; `π(g) = π(g′)` iff `g⁻¹g′ ∈ H` iff `g′ ∈ gH`; `hge₃ = ge₃` only on the axis `±e₃`; conversion `g·h = h⁻¹ • g = gh` | sound; excludes the cosets Hg | none |
| Check: Hopf local product over `z₁ ≠ 0` | forward then back; action by λ | `([1:z],λ) ↦ λ(1,z)/√(1+|z|²)` has first coordinate of phase λ; back: `(z₁/|z₁|)(1,z₂/z₁)·|z₁| = (z₁,z₂)` as `|z₁|²+|z₂|² = 1`; `λz ↦ (z₁/|z₁|)·λ`; `λ̄z ↦ (z₁/|z₁|)·λ̄` | sound; separates the Hopf action from the converted scalar action | none |
| Check: freeness cannot be dropped | `ℤ/2` trivial on `S¹`, `π = id` | q bijective, `φ = q⁻¹` a diffeomorphism: (b); id a surjective submersion with point fibres = orbits: (c); `U × ℤ/2 → U` is 2-to-1 and `π⁻¹(U) = U` 1-to-1: not (a) | sound negative control | none |
| `exists_freeProperQuotient_isSubmersion` (cited by the corollary) | trivial G; empty source | signature as elaborated: `[ProperSMul G M]`, smooth action, freeness, `∃ _ : ChartedSpace …, IsManifold … ∧ IsSubmersion … Quotient.mk''`; the corollary's "atlas from that theorem, for which q is a submersion" matches | agrees | none |

The rows for the untouched statements stand as in the previous review, of `c1d15cd`.

- Source locators checked against the text: 0; the changed passages add none (the corollary is derived from B1.1's presentation, converse and descent and from the quotient theorem, whose locators are unchanged). The seeded sample (five targets of B6.1) falls outside the changed passages.
- Library declarations opened at the pin: 4. Tau Ceti `Topology/ComplexProjectiveSpace/Basic.lean`: `TauCeti.ComplexProjectiveSpace` (58, the orbit quotient of the unit sphere by the unit circle), `mk` (84, defined on the sphere with explicit `n`, so `mk 1` is the map on `S³`), `mk_eq_mk_iff` (102, fibres are circle orbits), `instT2Space` (79, through `properSMul_of_compactSpace`).
- Cross-roadmap citations resolved: none added. Citing roadmaps on main (TangentialBordism, CalibratedGeometry, LieGroupoidsPoisson, StringOrientation) cite B1.4 for the quotient theorem, which is unchanged; no heading or id is added, removed or renamed.
- Duplication: no declaration at the Tau Ceti pin states the equivalence (searched `PrincipalBundle` with orbit, quotient, proper, free); no roadmap on main or open states it (searched "fibres are the orbits", "free proper … principal"; ManifoldOptimization line 351 is the Stiefel instance only).
- Gate rerun on this head: every counter 0, `OK`; the worker's run adds `build=0`. Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`. No file changed outside the folder.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else; no Lean statement changed, so signatures and the padding probe stand as before.
- Pull request text read against this head: the B1.4 bullet states the corollary, both equivalent conditions and the three Checks; no sentence contradicted, no change unstated (no heading, declaration or supplier added or removed).
- Overlap check: read ComplexKahlerGeometry, CharacteristicClasses, ManifoldOptimization, TopologicalKTheory, RiemannianManifoldsWithConvexBoundary, DifferentialGeometry, LieGroupoidsPoisson; soft/fine-sheaf acyclicity is shared with ComplexKahlerGeometry 2.5 (D01, owner B6.1); the new characterization is owned here only; nothing else shared.

Source independence: changed passages only; 5 passages compared (the corollary, its API bullet, three Checks), which cite no source and take no wording from the cached texts; largest share Kolář–Michor–Slovák, 26 of 78 locators, unchanged; no layer added, removed or reordered, so contents not compared again.

Research link: the end theorems (Ehresmann's fibration theorem, Ambrose–Singer, the flat-bundle dictionary, the classification of circle bundles by `H²(M;ℤ)`) are the bundle and connection prerequisites that symplectic reduction and prequantization, Lie groupoids and gauge theory are stated in; rests on the README's Summary and Downstream consumers (HamiltonianReduction, LieGroupoidsPoisson).

## Not verifiable

- Nothing in the changed passages. The items of the earlier reviews (Kolář–Michor–Slovák body text, Kobayashi–Nomizu I, Lee, Freed, Schreiber–Waldorf) stand.

## Source issues

- none

## For the human reviewers

- **Not tested.** The most-cited source is Kolář–Michor–Slovák (26 of 78 locators). Its contents page was read in an earlier review; its body text was not searchable in the fetched extraction, so wording was not compared with it.
- **Scope of D01.** ComplexKahlerGeometry 2.5 (main lines 744 and 748) still plans fine-implies-acyclic, which B6.1 owns here; the change it needs is in that folder, not this one.
