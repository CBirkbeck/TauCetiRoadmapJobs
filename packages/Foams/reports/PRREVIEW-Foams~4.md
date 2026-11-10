# Review of Foams (pull request #1629 at 4b76614)

**Verdict:** needs changes

Incremental re-review of the 79 lines changed in the folder since `78a1fb3`. The diff is a merge of main at `3090489d` plus the repair commit. All four previous findings are repaired. One new P3 defect remains: the repair deleted the SurfaceTopology row, but four sentences still refer to the "finite-map" contract and carriers that row supplied.

## R01 (P3) — "Finite-map" wording still points at the deleted SurfaceTopology contract

**Location:** `TauCetiRoadmap/Foams/README.md:259` ("Closed-web planarity uses the finite-map interfaces."), 1037 (K1's chord lemmas "stated on the shared finite-map carriers"), 1051 ("finite-map adapters") and 1064 ("Construct the web adapter here from the cited finite-map contract.").

**Claim:** Section 2.4 builds its adapter from a cited "finite-map" contract and consumes K1 lemmas stated on shared "finite-map carriers".

**Witness:** The only finite-map contract was the SurfaceTopology row (README line 237 at `78a1fb3`), which this change deletes. No citation or definition in the README replaces it, and Tau Ceti `2fd255d9` has no such carrier. K1's planarity runs on permutation triples (`TauCeti.PDCode.IsPlanar`, `TauCeti/KnotTheory/PDCode/Planar.lean:350`).

**Repair:** Name the carriers that are now cited:

- 259: "Closed-web planarity uses the permutation-triple and ribbon-graph interfaces listed under From Tau Ceti."
- 1037: "… stated on Tau Ceti's permutation triples, the carrier of `TauCeti.PDCode.IsPlanar`."
- 1051: "… componentwise Euler test, permutation-triple adapters and closure …"
- 1064: "Construct the web adapter here from the permutation-triple/ribbon-graph comparisons cited under From Tau Ceti."

Rewrap the lines afterwards. Tested on a scratch copy of the README with these four edits:

- No occurrence of "finite-map" remains.
- `roadmaps resolve` reports no unresolved cross-roadmap citation and no unresolved Lean name.
- The dependency check returns `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`.
- `TauCeti.PDCode.IsPlanar` exists at the pin (namespace `TauCeti.PDCode`, `Planar.lean` lines 83, 87, 350). It is defined through `TauCeti.PDCode.toPermutationTriple` (line 251): the Euler characteristic equals twice the number of monodromy orbits. This is the same componentwise Euler-2 test that 2.4 states.

## Previous findings

- R01 — repaired: the supplier table rows are now "[KhovanovHomology, G] … Finite plane realizations, polygonal complement and boundary-orientation dictionaries, controlled smoothing and relative extension" and "[GeometricTopology, 2.2] and [3.3] … Boundary-parametrized Schoenflies and relative isotopy extension". 2.4 cites the Tau Ceti ribbon-graph comparisons, and the gate reports `dropped=0`. The leftover wording is R01 above.
- R02 — repaired: `Suggested.lean:38–39` "∃! c : Coalgebra R A, c.counit = ε ∧ @Coalgebra.IsFrobenius R A _ _ _ _ _ c.toCoalgebraStruct". On a scratch copy, `rfl` proves this equal to the statement read at `78a1fb3`.
- R03 — repaired: the branch merges main `3090489d`, and the pins are Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. README 222–229 cites `TauCeti.Khovanov.coalgebra`, `isFrobenius`, `mul_compr₂_counit`, `baseChangeCoalgEquiv`, `CircleTensor`, `circleBasis` and `circleQuantumGrading`. Line 664 writes `TauCeti.DGShiftClosure` in a code span.
- R04 — repaired: README 1065 reads "[Erickson, Planar Graphs, “Rotation systems”]", and lines 856 and 1528 read "Propositions 10–11, p. 4".

## Verified sound

**Scope of this pass.** The changed passages are:

- From Tau Ceti: the Khovanov bullet and the ribbon-graph bullet.
- The supplier table.
- 0.10 (the `TauCeti.DGShiftClosure` sentence).
- 1.3 and 2.12 (the Goertz–Wedrich locator).
- 2.4 (reuse paragraph, Erickson locator, *Needs*).
- 7.2 (supplier use and *Needs*).
- The link definitions.
- The Frobenius headline in `Suggested.lean`.

The pass also covered what depends on these passages: 0.8 and KH1, which the new bullet serves; KH2; and 2.4's planarity test, which the Euler bullet serves.

**Build, gate, scope.**

- Head `4b7661466d76ded0e1b72eac7dd3719aa20b4052`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Foams'` is empty. The long outside-folder list in the change summary comes from the merge of main, not from this pull request.
- The folder holds README.md, Suggested.lean and metadata.toml.
- `lake env lean` on Suggested.lean at the new pins gives exactly three warnings, `declaration uses sorry`, at lines 34, 63 and 113.
- The worker's gate: every check passed.
- My rerun of the gate: every counter is zero except `depcheck=1`, "NOT IN ORDER: Foams (insert it after its last supplier)". The gate reads the board's merge-order file, which does not list Foams yet; the candidate order lists it at line 402. Under the brief's rules this is not a finding.
- Dependency check against the candidate order:

```text
depcheck: 236 roadmaps, 2269 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The new suppliers KhovanovHomology and GeometricTopology are on main (`f8836c4`), and neither is on the never-cite list. Neither README mentions Foams, so no cycle arises.

**Signatures.** I put `#check @name` for all 11 declarations in one scratch file and elaborated it once. Only the Frobenius headline changed. Its elaborated type still carries `[CommRing R] [CommRing A] [Algebra R A] [Module.Free R A] [Module.Finite R A]`, `ε` and the `IsPerfPair` hypothesis, and agrees with README 0.8. A separate `rfl` check shows that `c.counit` is the counit of `c`'s own `CoalgebraStruct`, the same one the old `letI` form used. One-tactic probe on the changed headline: `simp`, `rfl`, `infer_instance` and `decide` all leave the goal open, so it is not padding. The other 10 elaborated types are identical to `signatures.md`.

**Library declarations opened at the pins.**

Tau Ceti `2fd255d9`:

- `KnotTheory/Khovanov/Frobenius.lean`: `TauCeti.Khovanov.coalgebra` at line 69 (counit `a+bε ↦ b`), `comul_one` 98, `comul_eps` 103, `isFrobenius` 112, `mul_compr₂_counit` 120, `baseChangeCoalgEquiv` 146.
- `Algebra/DualNumber/Trace.lean`: `TauCeti.dualNumberTracePairing` 37 and `dualNumberTracePairing_isPerfPair` 52.
- `KnotTheory/Khovanov/CircleTensor.lean`: `CircleTensor` 128, `circleBasis` 133, `circleQuantumGrading` 229, `isHomogeneous_fiberwiseMul` 375.
- `KnotTheory/Khovanov/EnhancedState.lean:99`: `labelingQuantumDegree`, which is the sum of +1 per 1-label and −1 per X-label.
- `Combinatorics/RibbonGraph/OfPermutationTriple.lean`: `TauCeti.PermutationTriple.ribbonGraph` 70, `facePerm_ribbonGraph` 108, `isConnected_ribbonGraph` 121.
- `Combinatorics/RibbonGraph/ToPermutationTriple.lean:45`: `TauCeti.BipartiteRibbonGraph.toPermutationTriple`.
- `Combinatorics/RibbonGraph/EulerCharacteristic.lean`: `eulerChar_toPermutationTriple` 29, `even_eulerChar` 35, `IsConnected.eulerChar_le_two` 41.
- `CategoryTheory/DG/ShiftClosure/Basic.lean`: `TauCeti.DGShiftClosure`, namespace at line 107. Its composition carries a Koszul sign (module doc, lines 26–29), as 0.10 says.
- `KnotTheory/PDCode/Planar.lean`: `TauCeti.PDCode.toPermutationTriple` 251 and `IsPlanar` 350.

Mathlib `1b1ccf4b`: `Coalgebra.IsFrobenius` (`RingTheory/Coalgebra/IsFrobenius.lean:111`), a class over `[CoalgebraStruct R A]`. Its explicit-argument pattern matches the `@`-application on Suggested.lean line 39.

**Cross-roadmap citations resolved.**

- KhovanovHomology G, on main line 343 and at the head of #1187 line 344. G owns:
  - finite plane realizations;
  - the polygonal complement and boundary-orientation dictionaries;
  - controlled smoothing;
  - the relative ambient-extension adapter.

  These are the contract the new row consumes.
- GeometricTopology 2.2, on main line 1357 and at #1797 line 2118: Brown's theorem for a bicollared `Sⁿ⁻¹ ⊂ Sⁿ`, with the closure homeomorphism restricting to the given boundary parametrization.
- GeometricTopology 3.3, on main line 1504 and at #1797 line 2365: relative isotopy extension, with compact `N`, boundaryless `M`, `1 ≤ m`, `m+1 ≤ n`.

The anchors `#g-plane-geometry-relative-extension-and-smooth-link-comparison`, `#22-the-generalized-schoenflies-theorem` and `#33-isotopy-extension` match these headings. K1 (main line 92) and K2 (line 168) are unchanged. K2 plans the chosen dual-number coalgebra as a local instance, and Tau Ceti now supplies it as the scoped instance. The 0.8 phrase "K2's native DualNumber R carrier" is therefore accurate. `overlaps.md` reports no dropped id, and the open revisions #1187 and #1797 keep G, 2.2 and 3.3 at the same numbers.

**Ownership of what 7.2 now proves itself.** The interior-arc and boundary-relative disk-with-holes statements were formerly drawn from PlanarTopology. I ran `roadmaps grep` for interior-arc, disk-with-holes and boundary-relative over main and the open heads. The only planned owner is PlanarTopology in #271, which is on the never-cite list. Foams owning the restricted forms it needs, from GeometricTopology 2.2 and 3.3 and KhovanovHomology G, is the correct resolution.

**Seeded sample.** Two seeded targets fall in the changed passages:

- 0.8: through the new Tau Ceti bullet. The values are in the table below.
- 1.3: Goertz–Wedrich Propositions 10 and 11 are on p. 4 (`gw-cob line 145` begins page 4; the propositions are at lines 154 and 184). Proposition 11 sends the involution to the identity, which is what 1.3 uses for the unoriented evaluation with identity involution.

The other seeded targets are untouched by the diff and their locators were not re-read: 0.1 was read last round, and 0.4, 0.5, 0.9, 1.2, 2.7, 2.10, 2.11, 3.2, 4.1, 6.2, 6.3 and 6.5 are listed in the table with computed Checks.

**Adversarial pass.** Coefficients are ℤ unless stated. Rows marked "r3" are carried from the previous report (statements untouched by the diff), with that report's values.

| Statement (section) | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Frobenius headline, restated (0.8, Suggested 38–39) | old `letI` form versus new `@` form | `rfl` closes the equality of the two propositions; `c.counit` is definitionally the `letI` counit | pass, unchanged statement |
| Frobenius headline, instance (0.8, new bullet) | `R[ε]`, Tau Ceti counit `a+bε ↦ b` | form = `dualNumberTracePairing` (`mul_compr₂_counit`), perfect (`…_isPerfPair`); dual basis of (1, X) is (X, 1), so Δ(1) = 1⊗X + X⊗1 = `comul_one`, Δ(X) = (X⊗1)Δ(1) = X⊗X = `comul_eps` | pass |
| Frobenius headline, degenerate (0.8) | A = R = ℤ with ε = id; ε = 2·id; A = 0 | Δ(1) = 1⊗1; pairing 2ab has Gram (2), not a unit, so the hypothesis excludes it; zero module has one coalgebra | pass |
| KH1 versus Tau Ceti counit and coproduct (1.4, new bullet) | 1, X | README ε(1)=0, ε(X)=1, Δ(1)=1⊗X+X⊗1, Δ(X)=X⊗X; Tau Ceti `sndHom`, `comul_one`, `comul_eps`: the same | pass |
| KH2 versus `circleQuantumGrading` (1.4, 2.13) | one circle; merge of two circles | README A{1}: 1 ↦ +1, X ↦ −1; `labelingQuantumDegree`: +1, −1. Merge degree \|τ\|−\|σ\| = 1−2 = −1; README m: 1⊗1 (deg 2) ↦ 1 (deg 1), −1 | pass |
| Euler bullet versus 2.4 test | theta, ρ=(abc)(ACB), τ=(aA)(bB)(cC); ρ=(abc)(ABC); circle with one bivalent vertex | triple count: cycles(ρ) + cycles(τ) + cycles(ρτ) − darts = 2+3+3−6 = 2, 2+3+1−6 = 0, 1+1+2−2 = 2; README V−E+F: 2, 0, 2. Both counts agree when τ is fixed-point-free, as for closed webs | pass |
| Parity and bound (2.4, new bullet) | the three values above | even: 2, 0, 2; connected ≤ 2: 2, 0, 2 | pass |
| "No Koszul sign" (0.10) | f of degree 1 from X{0} to X{1}, g of degree 1 | C^(sh): sign +1; `DGShiftClosure`: (−1)^((s−r)q) = (−1)^1 = −1 | pass, the contrast holds |
| GT 2.2 / 3.3 contract (7.2) | round circle in S²; disk with one hole inside ℝ² | bicollared, so 2.2 gives two discs with the boundary parametrization; 3.3 needs boundaryless M = ℝ² and compact N, and the relative statement on the holed disk stays a 7.2 target, as written | pass |
| GW locator (1.3) | Props 10, 11 | page 4 begins at `gw-cob line 145`; Props at 154, 184; Lemma 8 at 133 (p. 3) | pass |
| Evaluations (1.3) | sphere, torus, genus 2, X-sphere, Klein with φ = id; disk degree, c = 1 | ε(1)=0; ε(mΔ1)=ε(2X)=2; ε(h²)=ε(4X²)=0; ε(X)=1; Klein = torus = 2; −c·χ = −1, X-disk 2−1 = 1 | pass |
| Surface records (0.4) | torus, Klein, Möbius | χ 0, 0, 0; crosscaps 0, 2, 1; odd crosscap number is excluded (`gw-cob line 150`) | pass |
| Ordered labels (0.5) | S₃, rightmost first | (12)(23): 1↦2, 2↦3, 3↦1 = (123); (23)(12) = (132) | pass |
| Quantum integers (0.9) | [2], [3] | [2]² = q²+2+q⁻² = [3]+[1] | pass |
| Graded coefficients (3.2) | e₁·, degrees 2 and −3; End(Λ_N) | 2+(−3) = −1; degree-0 part ℤ, full graded Λ_N | pass |
| Decorations (6.3) | x then x² | x·x² = x³ on one facet; x⊗y on two | pass |
| Kernel (6.5) | X², split–merge, sphere, torus | X² = 0; mΔ(1) = 2X, mΔ(X) = 0 = 2·X·X; 0 and 2, equal only mod 2 | pass |
| Freeness headline (2.8), r3 | p = 0; p = diag(1,0); p(x,y) = (x,e₁x), shifts (2,0); N = 0 | empty basis; (1,0) in degree a; image basis (1,e₁) of degree 2; Λ₀ = ℤ | pass |
| Circle basis headline (2.11), r3 | (N,a) = (0,0), (1,0), (1,1), (2,1), (4,2) | ℤ with basis 1; Λ₁ with c₀=1; 0×0 det 1; (1, c₁); 6 = C(4,2) | pass |
| `elementaryCoefficient` (2.11), r3 | n = 2, r = −1, 0, 2, 3 | 0, 1, x₁, 0 | pass |
| `circleIdeal` (2.11), r3 | (N,a) = (2,1) | b₁+c₁−e₁, c₁b₁−e₂: x² − e₁x + e₂ | pass |
| Dual Jacobi–Trudi (2.11), r3 | N=4, a=2, λ = (2), (1,1), (2,1) | c₁²−c₂, c₂, c₁c₂; weights 4, 4, 6 | pass |
| Top-Schur traces, normalization (1.2), r3 | a = 0..3; sphere, torus, genus 2 | 1, σ, −σ², −σ³; χ/2 = a, 0, −a | pass |
| Square relation (2.7), r3 | N=4, boundary (0,0,0,1,1,0) | Q_01 = 2, P_R = 0, R₀ = 1 | pass |
| Reconstruction (2.10), r3 | id_W = Σ uᵢvᵢ | x = Σ uᵢ(vᵢx) | pass |
| Boundary weight (4.1), r3 | merge a=b=1, N=3 | 6 − 3 = 3 = (2+2+2)/2 | pass |
| Adjunction degrees (6.2), r3 | a=b=1; a=1, b=2 | unit degree ab, counit −ab: ±1, ±2 | pass |

**Remarks on untouched text (no change requested).**

- 7.2 says "boundary-preserving planar isotopy", while Bar-Natan Def 5.1 (`bn line 1027`) says only "planar isotopy". If "boundary-preserving" is read as pointwise on the hole boundaries, the Dehn twist of a radial arc in an annulus becomes a separate operation.

## Not verifiable

- Blanchet–Habegger–Masbaum–Vogel, Proposition 1.1, p. 886 (2.1): paywalled and recorded uncertified in an earlier round; not fetched again.
- The q-graded 2.7 relations and the higher coherence equations of Layers 3 and 5: untouched by this diff, and not re-checked term by term.

## Source issues

- **Misprint** in gw-cob at Proposition 11, p. 4: the source repeats the article before "forgetful functor" (`gw-cob line 187`); it should be a single article; affects nothing.
