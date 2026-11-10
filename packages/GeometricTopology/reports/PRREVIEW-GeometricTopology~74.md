# Review of GeometricTopology (pull request #1797 at 9864ff4)

**Verdict:** needs changes

Seventeen findings: two P1, four P2 and eleven P3. Both P1 findings are false statements that a Check or example in the same README refutes. The four P2 findings are a missing connectedness hypothesis, a misstated Hauptvermutung, and two headlines that are statable at the pins but absent from `Suggested.lean`.

## R01 (P1) — 6.2: the averaged signature is not even-valued at roots of Δ

**Location.** `TauCetiRoadmap/GeometricTopology/README.md:1958-1960`: "a concordance invariant and a homomorphism `C → ℤ` for each `ω`, with image in `2ℤ` for `ω ≠ 1`". The Check at lines 1979–1980 repeats it as "the "onto `2ℤ`" statement is for `ω ≠ 1` only".

**Claim.** For every `ω ≠ 1`, `σ_ω` takes even values on `C`.

**Witness.** The README's own Check (lines 1973–1976). The trefoil form at `e^{iθ}` has `det = a(a−1)`, `a = 2 − 2cos θ`. The signature is `0` below `π/3` and `−2` above, so the averaged value at the root is `−1 ∉ 2ℤ`. The phrase is copied from `livingston2005` line 230.

**Repair.** Replace the clause with: "… a homomorphism `C → ℤ` for each `ω`; `σ_ω(K)` is even whenever `Δ_K(ω) ≠ 0`, in particular at `ω = e^{2πi/p}` (no Alexander polynomial vanishes there, since `Φ_p(1) = p`); at a root the averaged value can be odd (the trefoil at `e^{iπ/3}` gives `−1`)". In the Check at lines 1979–1980, keep "`σ_1 = 0`, so `ω = 1` carries no information" and drop "onto `2ℤ`". Add the trefoil value at `e^{iπ/3}` as the negative control for evenness.

Tested on the trefoil: `θ = π` is not a root and gives `−2`, which is even. `θ = π/3` is a root and is exempt from the evenness clause.

## R02 (P1) — 10.3: the dual norm lives on the annihilator, not on a quotient

**Location.** `README.md:2777`: "`x*` is a norm on the quotient of `H²(M; ℝ)` by the annihilator of the kernel of `x`".

**Claim.** `x*` is a norm on `H²(M; ℝ)/Ann(ker x)`.

**Witness.**
- On `S² × S¹`, `Ann(ker x) = 0`, so the quotient is `H² ≅ ℝ`. Yet `x* = +∞` off `0` (Check, lines 2788–2790).
- On a hyperbolic `M`, the quotient is `H²/H² = 0`, while lines 2759–2763 use `x*` on all of `H²`.

**Repair.** "`x*` is finite exactly on `Ann(ker x) ⊆ H²(M; ℝ)`, the dual of `H₂(M; ℝ)/ker x`; it is a norm there and `+∞` off it; its unit ball is the convex hull of finitely many integral points (Thurston, Theorem 2)."

Tested: on `S² × S¹`, `Ann(ker x) = 0`, with `x*(0) = 0` and `x* = +∞` elsewhere. On a hyperbolic `M`, `Ann(ker x) = H²` and `x*` is a norm on all of it.

## R03 (P2) — 10.4: Thurston's inequality needs connected surfaces

**Location.** `README.md:2823-2825`: "every closed embedded oriented surface `S`, `|⟨e(F), [S]⟩| ≤ |χ(S)|`", repeated in the bullet at line 2859.

**Claim.** The bound holds for every closed embedded oriented surface, including disconnected ones. 10.3 (line 2794) explicitly treats disconnected surfaces as surfaces.

**Witness.** Take `M = Σ₂ × S¹` (irreducible), its taut product foliation, and `S = (Σ₂ × pt) ⊔ (sphere in a ball)`. Then `⟨e(F),[S]⟩ = −2 + 0` (line 2877), but `|χ(S)| = |−2 + 2| = 0`, so `2 ≤ 0` fails.

**Repair.** Write "every closed embedded **connected** oriented surface `S`" at both places. This is Yazdi's inequality (1) (`yazdi2016` lines 49–54), and the native `TauCeti.EulerClassBounded` also quantifies over `[ConnectedSpace S]` (`TauCeti/Geometry/Manifold/Foliation/EulerClass.lean:218`). For a disconnected `S` the bound is `Σᵢ |χ(Sᵢ)|`.

Tested on the witness: the components give `2 ≤ 2` and `0 ≤ 2`, both true.

## R04 (P2) — 11.2: Moise's Hauptvermutung is not "a common subdivision"

**Location.** `README.md:2975-2977`: "any two triangulations of a `3`-manifold have a common subdivision". 12.3's route at lines 3183–3184 relies on it: "the common subdivision of two triangulations are 11.2".

**Claim.** Two triangulations of the same 3-manifold have a common subdivision.

**Witness.** Let `h : |K| ≃ₜ S³`, and let `φ(x) = ‖x‖²x` on a coordinate ball, the identity outside; `φ` is not PL at the centre. A common subdivision of `h` and `φ ∘ h` would make `h⁻¹φh` simplexwise linear, so none exists.

**Repair.** "any two triangulations of a `3`-manifold are combinatorially equivalent: they have isomorphic subdivisions, equivalently their realizations are PL homeomorphic (Moise, Theorem 36.2)". Use the same wording in 12.3's route.

Tested: `h` and `φ ∘ h` share `K`, so they are combinatorially equivalent, although they have no common subdivision. The roadmap's own extract on main (`TauCetiRoadmap/GeometricTopology/references/moise-triangulation-dim3.md` line 15) records Theorem 36.2 in this PL-homeomorphism form.

## R05 (P2) — Thurston's irreducible inequality is statable; the docstring says it is not

**Location.** `TauCetiRoadmap/GeometricTopology/Suggested.lean:56-58`: "the general (irreducible) form of Thurston's inequality and the infinite family of Yazdi's theorem (Layer 10) lack the Thurston norm".

**Claim.** Neither statement can be stated at the pins.

**Witness.** The surface form (README 10.4, connected as in R03) needs no norm, only `TauCeti.IsSphereBoundsBall` (`TauCeti/Geometry/Manifold/Irreducible.lean:42`) and `TauCeti.EulerClassBounded`. The statement below elaborates on a scratch copy with `lake env lean`; the only warning is the `sorry` one.

```lean
theorem thurston_euler_class_inequality_of_isSphereBoundsBall (M : Type) [MetricSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M] [CompactSpace M]
    [ConnectedSpace M] [TauCeti.Orientable (𝓡 3) M] (hM : TauCeti.IsSphereBoundsBall M) :
    haveI : IsManifold (𝓡 3) (∞ + 1) M := .of_le (n := ∞) (by simp)
    ∀ (F : TauCeti.Foliation (𝓡 3) ∞ M 2), F.Taut →
      ∀ e : (TopCat.of M).singularCohomology (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ
        (ModuleCat.of ℤ ℤ) 2, F.IsEulerClass e → TauCeti.EulerClassBounded e := by
  sorry
```

Yazdi's Main Theorem (`yazdi2016` lines 111–114) is also statable through `EulerClassNormOne`, which 10.3 identifies with `x* = 1` on hyperbolic `M`. This form also elaborates:

`∀ k (N : Fin k → Type) [∀ i, TopologicalSpace (N i)], ∃ M` (the binder block of `TauCeti.YazdiEulerClassOneTheorem`)`, IsHyperbolic ∧ (∀ i, IsEmpty (M ≃ₜ N i)) ∧ ∃ e, Even e ∧ EulerClassNormOne e ∧ ∀ F, F.Taut → ¬ F.IsEulerClass e`.

**Repair.**
- Add the theorem above to `Suggested.lean` and name it in README 10.4.
- Either add Yazdi's family in the form above, or give the real reason it is left out.
- Narrow the docstring's "not statable" list to the norm form `x*(e(F)) ≤ 1`.

## R06 (P2) — Agol's aspherical virtual Haken theorem is statable and absent

**Location.** `README.md:2206-2207`: "State the aspherical form as a target: a closed `3`-manifold with `π_k(M) = 0` for all `k ≥ 2` is virtually Haken (Agol, Theorem 9.1)". `Suggested.lean:201-205` states only the hyperbolic case, and the module docstring does not list the aspherical form as unstatable.

**Witness.**
- Agol's Theorem 9.1 is the aspherical statement (`agol2013` line 27).
- `TauCeti.IsVirtuallyHaken` needs only `[TopologicalSpace M]` (`TauCeti/Geometry/Manifold/VirtuallyHaken.lean:63`).
- The statement in the repair elaborates on a scratch copy.

**Repair.** Add the following to `Suggested.lean` and name it in 7.4:

```lean
theorem agol_virtually_haken_of_aspherical (M : Type u) [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) 0 M] [CompactSpace M]
    [ConnectedSpace M] (hM : ∀ (k : ℕ) (x : M), 2 ≤ k → Subsingleton (HomotopyGroup (Fin k) M x)) :
    TauCeti.IsVirtuallyHaken M := by
  sorry
```

The non-orientable case follows through the orientation double cover, and the native Haken predicate admits non-orientable covers.

## R07 (P3) — 10.3: the `S² × S¹` boundedness Check is false

**Location.** `README.md:2806-2809`: "on `S² × S¹` the class `e` pairing to `2` with `[S² × pt]` is bounded (every connected surface with `χ ≤ 0` … compressible, so pairs to `0` or is excluded) while `x*(e) = +∞`".

**Witness.** The tubed torus `T` of the preceding Check (lines 2800–2802) is connected, with `χ(T) = 0` and `[T] = [S² × pt]`. So `|⟨e,[T]⟩| = 2 > 0 = −χ(T)`: `e` is not `EulerClassBounded`, which agrees with `x*(e) = +∞`.

**Repair.** Replace the Check with: "on `S² × S¹` the class with `⟨e,[S² × pt]⟩ = 2` is not bounded (`T` gives `2 > 0`), matching `x*(e) = +∞`".

Also drop the claim that the bound-to-`x*` direction needs hyperbolicity, or support it with a correct witness. Replacing each non-ball sphere component of a minimizing surface by a tubed torus proves that direction on every closed oriented `M`.

## R08 (P3) — 8.4: the Poincaré route skips the homeomorphism-to-diffeomorphism step

**Location.** `README.md:2429-2431`: "a simply connected Seifert fibred space is `S³` (Scott, Section 3 …). So every summand would be diffeomorphic to `S³`". The *Needs:* line at 2458–2462 lists no smoothing input.

**Witness.** Scott gives a homeomorphism. `TauCeti.IsPrimeManifold` (`TauCeti/Geometry/Manifold/ConnectedSum/Prime.lean:217`) and the Lean conclusion `M ≃ₘ⟮𝓡 3, 𝓡 3⟯ S³` need a diffeomorphism. That upgrade is 12.3's third bullet (`README.md:3199-3202`).

**Repair.** Write "homeomorphic, hence diffeomorphic by the uniqueness of smooth structures on `3`-manifolds (12.3)", and add "12.3 (uniqueness of smooth structures in dimension three)" to 8.4's *Needs:*. This adds no cycle: Layer 12 needs only Layers 1 and 11.

## R09 (P3) — `cerf_theorem` is padding

**Location.** `Suggested.lean:97-102`: `theorem cerf_theorem : TauCeti.CerfTheorem`.

**Witness.** `example : TauCeti.CerfTheorem := smale_conjecture.cerfTheorem` elaborates on a scratch copy of the file. It uses the native `TauCeti.SmaleConjecture.cerfTheorem` (`TauCeti/Geometry/Diffeomorphism/Cerf.lean:84`), so `cerf_theorem` adds nothing to the acceptance test beyond `smale_conjecture`.

**Repair.** Delete `cerf_theorem` from `Suggested.lean`; README 3.3 keeps the statement. Also:
- drop Cerf from `Suggested.lean:34-35` and from `README.md:568-569`;
- change 3.3's Examples (lines 1176–1177) to say that Smale and Watanabe are stated and that Cerf follows natively from Smale.

## R10 (P3) — 4.6: only the untwisted Whitehead double has Δ = 1

**Location.** `README.md:1498-1499`: "and to the Whitehead double of any knot, which has `Δ = 1`".

**Witness.** The `t`-twisted double has Seifert matrix `[[−1, 1], [0, t]]`, so `Δ = −t·s + (2t + 1) − t·s⁻¹`. For `t = 1` this is `−s + 3 − s⁻¹ ≠ 1`. Livingston's `b`-twisted doubles (`livingston2005` line 232) have nonzero signatures.

**Repair.** "the untwisted Whitehead double of any knot". Tested: `t = 0` gives `Δ = 1`.

## R11 (P3) — 4.3: Lickorish locators disagree with the roadmap's own extracts

**Location.**
- `README.md:1298` "Lickorish … Theorem 16.10"
- line 1305 "the proof of Theorem 1.1"
- line 1310 "Lickorish, Chapter 1, Theorem 1.7"
- References at lines 3284 and 3287
- `Suggested.lean:112`

**Witness.** This roadmap's own extracts on main, under `TauCetiRoadmap/GeometricTopology/references/` and removed by this PR, record:
- Markov's theorem as **Proposition** 16.10, p. 187 (`lickorish-braids-markov.md` line 13);
- Reidemeister's theorem as unnumbered prose, pp. 3–4 (`lickorish-reidemeister.md` lines 4 and 42).

**Repair.** Check the book, then cite "Proposition 16.10, p. 187" and "Chapter 1, pp. 3–4" in the README, the References and the `markov_theorem` docstring.

## R12 (P3) — 11.3: the Rourke–Sanderson chapter is wrong

**Location.** `README.md:3021`: "Prove the **reconciliation** with Layer 1 (Rourke–Sanderson, Chapter 3)". The same locator appears in 2.2 (line 884) and in the References (line 3273).

**Witness.** The extract on main (`references/rs-regular-neighbourhoods-and-collapse.md` lines 5 and 76–95) gives:
- the PL manifold definition at 1.8 (p. 7);
- the vertex-link criterion at Exercise 2.21(1) (p. 22).

Chapter 3 is regular neighbourhoods and collapsing.

**Repair.** Cite "Rourke–Sanderson, 1.8 and Exercise 2.21(1)" for 11.3 and for 2.2's links of points. Keep Chapter 3 for collapse.

## R13 (P3) — 7.2: Ratcliffe's Theorem 11.8.5 assumes orientability

**Location.** `README.md:2083-2086`: "Theorem 11.8.5: a homotopy equivalence between closed hyperbolic manifolds of dimension at least three is homotopic to an isometry".

**Witness.** The extract on main (`references/ratcliffe-mostow-rigidity.md` line 17) states Theorem 11.8.5 for *closed, connected, orientable* hyperbolic n-manifolds with n > 2. The native `TauCeti.MostowRigidity` (`TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Mostow.lean:72`) assumes no orientability.

**Repair.** Add "connected, orientable" to the paraphrase and name the step for the non-orientable case. Lift both metrics to the orientation double cover; the isometry homotopic to the identity commutes with the deck involution by uniqueness, so it descends. Alternatively, cite Mostow (1973) for all closed hyperbolic manifolds.

## R14 (P3) — Scope: Kirby Problem 1.41 is attributed to the wrong paper

**Location.** `README.md:141-144`: "Problem 1.41 (Piccirillo's non-slice Conway knot … *The Conway knot is not slice*, Proposition 1.4 and Theorem 1.5)". The Conventions at line 222 say "the shake genus 1.41".

**Witness.** The Conway-knot paper cites `[Kir97]` Problem **1.21** (`piccirillo2020` lines 98–99), not 1.41. The extract on main (`references/kirby-problems.md` lines 33–35) records 1.41(A) as the 0-shake-genus question.

**Repair.** Attribute 1.41 to the shake-genus question, resolved in Piccirillo, *Shake genus and slice genus*, Geom. Topol. 23 (2019). Cite the Conway-knot paper under Problem 1.21, or without a problem number.

## R15 (P3) — 6.3: the genus bound is in Livingston §9.5, not §3.1

**Location.** `README.md:1997-1998`: "`|σ_ω(K)| ≤ 2 g_s(K)` … (Tristram; Livingston, Section 3.1; …)".

**Witness.** `livingston2005` §3.1 (lines 223–240) contains no genus bound. The bound by half the Tristram–Levine signature is §9.5 (lines 815–819).

**Repair.** Cite "Livingston, Section 9.5".

## R16 (P3) — Conflicting open revisions of this roadmap, with no stated order

**Location.** This folder. The pull request's description names no order relative to the other open pull requests that change it.

**Witness.**
- #903 conflicts in `README.md` and `Suggested.lean`; #1517 and #1791 conflict in `README.md`.
- Open roadmaps cite #903's ids, absent here: TangentialBordism `README.md:415` "Layer11.3" (Whitehead's triangulation, 12.1 here) and line 384 "Layer 4.3.1" (`gap:finite-quadratic-arf`, also FourManifolds line 369).

**Repair.** State in the description which of #903 and #1797 is rebased onto the other. Also:
- #1517's knot/link distinction is already covered by the Conventions (lines 177–184);
- #1791 adds PlanarTopology and SurfaceTopology links, and neither roadmap may be cited as a supplier;
- if #1797 merges first, say that the finite quadratic Arf algebra has no section here, so its consumers re-point.

## R17 (P3) — Style: "deferred"

**Location.** `README.md:3191`, `3216` and `3231` ("is deferred in the scope statement").

**Witness.** The house rules forbid "deferred". The scope statement (lines 123–133) places Kirby–Siebenmann in a GeometricTopology Part II.

**Repair.** Write "is stated in GeometricTopology Part II (Scope and ownership)" at each place.

## Verified sound

**Gate and dependency check.**
- The worker's `gate.md` passes every check.
- My re-run of the gate gives every check `0` except `outside-folder=24`. All 24 files are in this pull request's own folders (AlgebraicTopology, IntegralLattices, QuadraticFormInvariants, ReductiveGroups, LieHighestWeight). The brief's exclusion diff is empty, so nothing outside the folder changed.
- Dependency check: `depcheck: 238 roadmaps, 2350 edges, 0 problem(s)`, so there is no UPWARD and no CYCLE line.

**Build and #check audit.**
- `lake env lean` on `Suggested.lean` succeeds, with 23 warnings, all `declaration uses sorry`.
- I put `#check @name` for all 23 declarations in one scratch file. Every elaborated type matches its README statement. The file has no `variable` block (only `universe u`), so no binder can be dropped; I changed nothing.
- One-tactic probe (`simp | rfl | infer_instance | decide`) on the native propositions: every attempt fails, so none is provable that way. The exception is `cerf_theorem`, which closes in one term from `smale_conjecture` (R09).
- None of the 23 native propositions has a proof at the pin. I grepped for theorems concluding each of them.

**Library declarations opened at the pins** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):

| Declaration | File:line |
|---|---|
| `AnnulusConjecture` | `LocallyFlat/Annulus.lean:105` |
| `SmaleConjecture` | `Diffeomorphism/Smale.lean:46` |
| `CerfTheorem`, `SmaleConjecture.cerfTheorem` | `Cerf.lean:77`, `:84` |
| `WatanabeTheorem` | `Disc.lean:77` |
| `FreedmanSliceTheorem` | `Slice/Freedman.lean:66` |
| `IsReidemeisterMove`, `ReidemeisterEquiv` | `PDCode/Oriented/Reidemeister/Equivalence.lean:95`, `:130` |
| `MathieuChirallyCosmeticTheorem` | `DehnSurgery/Cosmetic.lean:316` |
| `nonempty_homeomorph_lensSpace_of_unknot_slopeValue` (`ℓ₁ = −q ℓ₀`) | `DehnSurgery/LensSpace.lean:269` |
| `IsMostowRigid`, `MostowRigidity` | `Hyperbolic/Mostow.lean:40`, `:72` |
| `GabaiMeyerhoffMilleyTheorem` | `Hyperbolic/Weeks.lean:77` |
| `HyperbolicMetric`, `IsHyperbolic` | `Riemannian/Hyperbolic.lean:51`, `:70` |
| `IsVirtuallyFibered` | `Topology/VirtuallyFibered.lean:56` |
| `IsVirtuallyHaken` | `VirtuallyHaken.lean:63` |
| `VirtualHakenConjecture` | `Hyperbolic/VirtualHaken.lean:65` |
| `KneserPrimeDecompositionTheorem`, `MilnorPrimeDecompositionTheorem` | `PrimeDecomposition.lean:79`, `:91` |
| `IsPrimeManifold` | `ConnectedSum/Prime.lean:217` |
| `JSJTheorem` | `JSJDecomposition.lean:248` |
| `GeometrizationConjecture` | `Geometrization.lean:144` |
| `LiRankGenusTheorem` | `Heegaard/RankGenus.lean:138` |
| `EulerClassBounded`, `ThurstonEulerClassInequality`, `EulerClassOneConjecture`, `YazdiEulerClassOneTheorem` | `Foliation/EulerClass.lean:218`, `:330`, `:346`, `:387` |
| `IsSphereBoundsBall` | `Irreducible.lean:42` |
| `IsClosedConnectedManifold` | `Geometry/Manifold/Basic.lean:57` |
| `IsTriangulable` | `Triangulable/Basic.lean:38` |
| `PLGroupoid_le_continuousGroupoid`, `doubleRight`, `doubleRight_mem_PLGroupoid` | `PLGroupoid/Basic.lean:117`, `:161`, `:189` |

In addition, I grepped 56 further cited native names as declarations at the pin and found all of them, among them:
- `isPurelyCosmetic_meridian`, `FibersOverCircle.isVirtuallyFibered`, `markovEquiv_sigma_last_one_one`;
- `jonesTrace_sigma_pow_three`, `brownBicollaring`, `exists_isTubularNeighborhood_normalBundle`;
- `not_contractibleSpace_discDiff_four`, `realizationStandardSuccSimplexBoundaryHomeomorphSphere`;
- `collapsible_orderedCylinder_top`, `Contractible2Complex`.

**Cross-roadmap citations resolved** (on main unless noted):
- **DifferentialGeometry:** 5.5 (faces and the abstract boundary, lines 63–93 and 528), Layer 4 (line 402) and 12.4 (line 923). At #886's head, 5.5 is split into 5.5a/5.5b with a mapping sentence (lines 38–39).
- **HopfRinow (completed):** Layer 1 (the Levi-Civita connection and the exponential map) and Layer 4 (transport across isometries).
- **AlgebraicTopology:** Stages 1–8 and 6.5 (the homological degree) on main and at this head. #1652 renames Stage k to Layer k and gives the mapping (lines 581–585).
- **CharacteristicClasses:** C2.
- **CombinatorialHeegaardFloer:** Lane G items 7 and 10 (`|τ| ≤ g_s`) and Lane K.
- **Downstream consumers:** all 15 named consumer roadmaps exist on main. OptimalTransport's description of GT Layer 7 (consuming HopfRinow's connection and supplying the volume) agrees with this README.
- **Dropped id:** the only id this pull request drops is the far-horizon anchor, cited by RiemannianGeometry (#1327 line 892, #1683 line 1048). Its old-to-new mapping is at lines 3116–3120. The "item 1" and "item 3" citations by AlgebraicTopology, PositiveMass, CalibratedGeometry, AnalyticStableMaps, GromovWittenTheory and FourManifolds resolve through that mapping.
- **Ownership against open pull requests** (checked by object): FourManifolds, TeichmullerGeometry, KhovanovHomology and TangentialBordism. TangentialBordism owns cobordism carriers, and 6.3 defers to it. The only double owner is #903, a revision of this same roadmap (R16).

**Source sample** (15 seeded targets; texts from the sources cache):

| Target | Result |
|---|---|
| 1.2 | Not verifiable (Hirsch is uncertified; Milnor and Gompf–Stipsicz are not cached). Checks computed below. |
| 4.3 | Lickorish locators: R11. Birman not cached. |
| 4.4 | Lickorish not cached. Checks computed. |
| 4.6 | `livingston2005` lines 547–548 support the statement; the Freedman–Quinn extract on main records 11.7B (pp. 210–211); R10. |
| 6.2 | `livingston2005` lines 223–236 confirm the averaging, the homomorphism and independence at `e^{2πi/p}`; "onto 2ℤ" is R01. |
| 7.2 | R13; Mostow and Thurston not cached. |
| 8.2 | `hatcher-3m` lines 147–148 (Proposition 1.4) and 166–168 (Theorem 1.5) confirmed. |
| 9.1 | `scharlemann2002` lines 38–51 (§1: two handlebodies per genus) and 88–111 (§2.1: splitting from a triangulation) confirmed. |
| 9.2 | `li2013` lines 66–68 (Theorem 1.1, arbitrarily large discrepancy) and 73–74 (Theorem 1.2) confirmed. |
| 10.1 | `calegari2007` lines 6399–6400 (Definition 4.25), 5994–6002 (Example 4.7, the Reeb component) and 6702–6707 (Theorem 4.35) confirmed. |
| 10.3 | `yazdi2016` line 92 (the dual ball has integral vertices) confirmed; R02 and R07. |
| 11.3 | R12. |
| 11.4 | Not verifiable (see below). |
| 12.2 | Native `PLGroupoid_le_continuousGroupoid` and `doubleRight` (derivative 1, then 2) confirmed. |
| 12.3 | `manolescu2016` lines 102–114 (E₈ is not triangulable and has no PL structure) confirmed; Moise not cached; R04. |

Other locators read and confirmed:
- `watanabe2018` lines 32–36: Theorem 1.1 and Remark 1.2, with `A₁ = 0` and `A₂ ≅ ℚ`.
- `km2004` lines 41 and 54–55: Conjecture 1 and Theorem 2; lines 73–76: Problem 1.15 and the reduction for slopes ≠ ±1.
- `agol2013` lines 27–32: Theorems 9.1 and 9.2, and Problems 3.50–51.
- `gmm2009` lines 20 and 52–55: Theorem 1.1, the (5,1), (5,2) filling, and the all-orientable convention.
- `hatcher-3m` lines 531–534, 703–704 and 1204–1249: Theorem 1.9, Proposition 1.12, and `L_{p/q}` with `π₁ = ℤ_q` and Theorem 2.5. The README's translation `L_{p/q} = L(q, p)` is correct.
- `hatcher-at` lines 10998, 11035, 22534 and 6051: Theorem 3.44, Corollary 3.45, Proposition A.1 and Theorem 2.35.
- `yazdi2016` lines 81–85, 100–102 and 111–114: Definition 1.1 (`a ∈ 2H²`), Theorem 1.2 (Gabai, vertices) and the Main Theorem.

**Adversarial table** (values computed by hand or read at the pin):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 gluing Checks | `D²∪D²`; `S¹×D²` by id / by swap; 2-handle on unknot | `χ = 2`; `H₁ = ℤ` vs `0`; framing 0 gives `∂ = S²×S¹` (`H₁ = ℤ`), ±1 gives `S³` | holds | none |
| 1.4 connected sum | `T²#T²`; `ℝ#ℝ`; `n = 2` π₁ | `χ = 0 + 0 − 2 = −2`; two components (dim 1); quotient of `ℤ²*ℤ²` | holds | none |
| 2.4 annulus | `n = 0`; `r = R` | `[a,c] ∪ [d,b]` for `a < c < d < b`; hypothesis fails | holds | none |
| 3.2 antipodal map | `O(2)`, `O(3)` | `det(−1) = (−1)^{n+1}`: `+1`, `−1` | holds | none |
| 3.3 Cerf vs dim 6 | `π₀Diff⁺(S⁶)` | `Θ₇ = ℤ/28 ≠ 0` | holds | R09 (padding) |
| 4.2 planarity | trefoil; one crossing paired 0–2/1–3 | `F = n + 2 = 5`; `1 − 2 + 1 = 0` | holds | none |
| 4.3 Markov | `σ₀ ~ 1 ∈ B₁`; `σ₀³` vs `σ₀⁻³` | `V(2) = −6` vs `0.5625`; `n = 0` closes to a circle | holds | R11 (locator) |
| 4.4 slice genus | trefoil; figure-eight; square knot | `|σ| = 2 ⇒ g_s = 1`; `Δ(−1) = 5` not a square; `Δ = (t−1+t⁻¹)²` | holds | none |
| 4.5 Δ and V | unknot, trefoil, figure-eight | `Δ(−1) = 1, −3, 5`; Burau `−t³+t²−t = −t²·Δ`, value 3 at `−1`; skein specializations satisfy `t⁻¹V₊ − tV₋ = zV₀` | holds | none |
| 4.6 Freedman | unknot / trefoil / twisted double | perfect & `Δ = 1`; `F₂` & `Δ ≠ 1`; `Δ = −s + 3 − s⁻¹` | twisted double fails | R10 |
| 5.2 framing change | trefoil cabling `k = 6` | `λ₀ ↦ (0 − 6)/1 = −6` | holds | none |
| 5.3 lens spaces | `L(5,1)/L(5,2)`; `L(5,2)/L(5,3)`; `S³_U(5/2)` | `2 ∉ {±1}`; `2·3 ≡ 1`; `ℓ = ![1, −2] = ![1, 3]`, `H₁ = ℤ/5` | holds | none |
| 5.3 Hopf (0,n) | slam-dunk | `0 − 1/n` on unknot gives `S³` | holds | none |
| 5.4 Property P | unknot; trefoil +1; `s = 0`; `|p| ≥ 2` | `π₁ = 1`; order 120; `H₁ = ℤ`; `H₁ = ℤ/p` | holds | none |
| 5.4 Property R / G–L | unknot 0 and 1/n; trefoil 0 | `S¹×S²`; `S³`; torus bundle, `π₁ ≠ ℤ` | holds | none |
| 5.4 Mathieu | Ni–Wu test | `q² = 4 ≢ 8 (mod 9)`; `9/2 ≠ ±9` | holds | none |
| 6.1 concordance group | `T#−T`, `T#T`, `E` | `σ = 0`, `−4`; `E` has order 2 | holds | none |
| 6.2 signature | trefoil at `θ = π`, `θ` with `cos θ = 3/5`, `θ = π/3` | `det = 12 ⇒ −2`; `det = −0.16 ⇒ 0`; `det = 0 ⇒ −1` | `2ℤ` claim false | R01 |
| 6.3 genus bound | `T(2,5)`; unknot to trefoil | `4 ≤ 2·2`; `|0 − (−2)| ≤ 2` | holds | R15 (locator) |
| 7.1 volumes | `S²`, `S³`, genus-2 surface | `4π`, `2π²`; `−vol = 2π(−2) ⇒ 4π` | holds | none |
| 7.2 Mostow | genus 2; `T³` | Teichmüller dimension `6g − 6 = 6`; `ℤ² ⊂ π₁` | holds | R13 (hypotheses) |
| 7.3 Weeks | `5, 5/2` and `1, 1` fillings | `H₁ = ℤ/5⊕ℤ/5` (order 25); blow-down gives `+1` on trefoil or figure-eight, det 3 or 5 | holds | none |
| 7.4 Agol | `Σ₂×S¹`; `S³`; aspherical form | fibers, not hyperbolic; `π₁ = 1`; elaborates at the pins | aspherical form absent | R06 |
| 8.2 Kneser–Milnor | `S³`; `L(2,1)#L(3,1)`; `ℝ³` | `k = 0`; `C₂*C₃`, 2 factors; prime vacuously | holds | none |
| 8.3 JSJ | `T³` with a coordinate torus | empty subfamily is a decomposition, so not minimal | holds | none |
| 8.4 Poincaré | Poincaré sphere; `S²×S¹`; empty `M` | `π₁` order 120; `ℤ`; `SimplyConnectedSpace` needs `Nonempty` | holds | R08 (Needs) |
| 9.1 splittings | `‖z‖ ≤ ‖w‖` vs `‖w‖ ≤ 2‖z‖`; frontier genus | overlap `1/5 ≤ |z|² ≤ 1/2`; `χ = 2(1−g)` | holds | none |
| 9.2 rank/genus | `T³`; Poincaré sphere; `ℝP²×S¹` | `3 = 3`; `2 = 2`; rank of `ℤ/2×ℤ` is 2 | holds | none |
| 10.1 tautness | `S²×S¹`; `ℝ³` planes; `T³` irrational | `pt×S¹` transversal; height has a critical point; taut | holds | none |
| 10.2 Euler class | `TS²`; Hopf bundle | `⟨e,[S²]⟩ = 2`; `±1` | holds | none |
| 10.3 norm | `S²×S¹`; `Σ₂×S¹`; `S₁⊔S₂` | `x = 0`; `x = 2`; `χ₋ = 2`, `|χ| = 0` | holds | none |
| 10.3 dual norm | `S²×S¹`; hyperbolic `M` | `Ann(ker x) = 0`, `x* = ∞`; `H²/H² = 0` | false | R02 |
| 10.3 boundedness Check | tubed torus `T` | `|⟨e,[T]⟩| = 2 > 0` | Check false | R07 |
| 10.4 Thurston | `Σ₂×pt ⊔ S²` in `Σ₂×S¹` | `2 > |χ| = 0` | false | R03 |
| 10.4 parity | Hopf vs `TS²`, mod-2 reduction | `e ≡ w₂ = 0` | holds | none |
| 11.2 Moise | `h` vs `φ∘h`, `φ = ‖x‖²x` | no common subdivision | false | R04 |
| 11.3 combinatorial manifolds | `Δ¹`, `∂Δ²`, bow-tie, `ℝP²₆` | links: points, 2 points, 2 edges, 5-cycle; `H₁ = ℤ/2` | holds | R12 (locator) |
| 11.4 dunce hat | `π₁⟨a | aaa⁻¹⟩` | trivial; every edge in ≥ 2 triangle sides | holds | none |
| 12.1 torus | `V ≥ 7` | `E = 3V ≤ V(V−1)/2` | holds | none |
| 12.2 `doubleRight` | slopes at 0 | 1 and 2 | holds | none |
| 12.3 E₈ / T⁵ | rank, signature | 8, 8, even; two PL structures | holds | R17 (style) |
| Manolescu | universes | compact ⇒ finite complex, so `{0}` loses nothing | holds | none |
| GMM | Weeks vs figure-eight complement | `0.9427 < 2.0299` (the latter cusped, so excluded) | holds | none |
| Li | `n = 0` vs `1` | gap ≥ 1 vs ≥ 2 | holds | none |

## Not verifiable

These texts are not in the sources cache, or are paywalled or settled uncertified. This review edits no manifest.
- **Kirby's list** (`kirby1997`): the cached text is empty (Ghostscript failure). I cross-checked the problem numbers through `km2004` (1.15), `agol2013` (3.50–51), `watanabe2018` (4.34, 4.126) and the extract on main.
- **Hirsch** (uncertified, settled): Theorem 6.1, Chapter 8 §2 and the disc theorem. The extract on main locates the disc theorem at Chapter 4, Theorem 6.6, not Chapter 8, Theorem 3.1; please re-check.
- **Not cached (paywalled books and papers):**
  - Milnor's *h-cobordism* §3; Gompf–Stipsicz §4.1; Birman Theorem 2.3; Burde–Zieschang;
  - Lickorish Theorems 2.2 and 8.4; Rolfsen Chapters 2, 7 and 9; Freedman–Quinn 11.7B; Tristram; Levine;
  - Mostow; Ratcliffe; Thurston's *3-D Geometry*; Scott; Hempel; Candel–Conlon;
  - Moise 35.3 and 36.2; Munkres 10.5 and 10.6; Kirby–Siebenmann; Milnor–Stasheff; Brown 1962;
  - Lee: I believe *Smooth Manifolds* Theorem 6.24 covers only submanifolds of `ℝⁿ`, but I could not check it.
- **Zeeman, *On the dunce hat*:** not cached. Collapsibility is not invariant under subdivision, so whether Zeeman's theorem covers the specific `orderedCylinder` triangulation named at `README.md:3080` is unchecked.
- **Thurston 1986** and **Gabai 1983, Corollary 6.18:** uncertified (settled).
- **`kauffman1990`:** listed in `needs-references.toml` for 4.6.1, but this head does not cite it, so the request is moot.

## Source issues

- **Error** in livingston2005 at §3.1, printed p. 7 (line 230): the source says the averaged `σ_ω` maps onto `2ℤ` for every `ω ≠ 1`; it should say evenness holds only where `Δ_V(ω) ≠ 0` (trefoil at `e^{iπ/3}`: `−1`); affects a stated result.
- **Gap** in yazdi2016 at §1, p. 2 (lines 55–56): the source says compressing yields an incompressible `S′` with `|χ(S′)| ≤ |χ(S)|`; it should use `χ₋` with ball-bounding spheres discarded (a compressible torus compresses to a sphere, `2 > 0`); affects the proof.
