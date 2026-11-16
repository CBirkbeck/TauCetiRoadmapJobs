# FIX-RT-HyperbolicDynamicsAndThermodynamicFormalism~1

Repair of red-team round 1 (passes a and b) of `packages/HyperbolicDynamicsAndThermodynamicFormalism`. Eight findings; the two that overlap (1a/F02 and 1b/F01) are settled once. Files changed: `README.md`, `Suggested.lean`, `sources.toml`. `metadata.toml` and `design/plan.json` are unchanged: no new supplier gap.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~1a/F01 (P1) — applied

Confirmed: RiemannianGeometry R4.1 on main (`TauCetiRoadmap/RiemannianGeometry/README.md`, R4 item 1) proves only the lower bound `s_κ(t)|D_tJ(0)| ≤ |J(t)|` for J(0) = 0. Changed in §9.3: "converge by comparison … gives |J(t)| ≤ e^(−at)|J(0)|" becomes a five-step route that this target owns. (i) Convexity f'' ≥ a²f, from pinned Tau Ceti identities. (ii) A maximum principle against `|w| sinh(a(T−t))/sinh(aT)`. (iii) R4.1, used only for convergence. (iv) R4.1 again, for uniqueness of the forward-bounded field. (v) A uniform bound ‖U(v)‖ ≤ B, which gives the Sasaki-norm rate κ = a. I also added a curvature −4 Check, the new pinned names in *Needs:* and in the Tau Ceti contract, and a sentence on complementarity.

The review's repair was right but incomplete. It bounded |J| and said nothing about D_tJ, and the rate κ = a "for the norm (|J(0)|² + |D_tJ(0)|²)^(1/2)" needs a bound on D_tJ as well. Step (v) supplies it. It uses the convergence estimate at T = 1, continuity of D(g¹) through the declared gap `connection-map-jacobi-derivative`, and compactness of SM.

The pinned inputs, all checked at the Tau Ceti pin:
- `TauCeti.Manifold.IsJacobiFieldOn.hasDerivWithinAt_inner_alongCurveWithin_self` (`Jacobi/Convexity.lean:62`): the identity (⟨DJ, J⟩)' = |DJ|² − ⟨R(J, γ')γ', J⟩.
- `CovariantDerivative.forall_sectionalCurvature_le_iff` (`Curvature/Sectional.lean:148`).
- `TauCeti.Manifold.jacobiFieldSpace`, `jacobiInitialData` and `jacobiInitialData_injective` (`Jacobi/Space.lean`).
- `TauCeti.Manifold.IsJacobiFieldOn.eq_of_endpoints_eq_of_sectionalCurvature_nonpos` and `convexOn_norm_of_sectionalCurvature_nonpos` (`Convexity.lean`).
- `TauCeti.Manifold.IsJacobiFieldOn.inner_curveVelocityWithin_eq` (`Jacobi/Tangential.lean`).

No pinned statement gives an upper bound under a negative upper curvature bound. `Jacobi/Comparison.lean` has only the expanding estimate for d(exp), and `Model.lean` and `ConstantCurvature.lean` treat constant curvature only. A `roadmaps grep` for stable Jacobi fields, Riccati equations and "geodesic flow … Anosov" finds no other owner, so §9.3 owns the estimate.

Pattern search: R4.1 is cited in exactly three places: the supplier contract (correctly stated, lower bound), §9.3 and the Layer 9 dependencies. Only §9.3 credited it with an upper bound.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~1a/F02, RT-HyperbolicDynamicsAndThermodynamicFormalism~1b/F01 (P2) — applied differently

`Suggested.lean`: the module docstring now classifies Layer 9. The Anosov property of geodesic flows (§9.3) is a headline: it is Anosov's theorem, proved by §9.3's Jacobi-field analysis, and it is not statable for the reason already given. The Anosov properties of toral automorphisms and suspensions (§§9.1–9.2) are examples that check the definitions of Layer 7 on explicit systems. They are not headlines and are not stated. §9.1 would also need, as data, the diffeomorphism induced on `UnitAddTorus (Fin n)` by an integer matrix; no file at either pin mentions both `UnitAddTorus` and a `Diffeomorph`. The ergodic headline of §9.1 is stated (`isEquilibriumState_toralEndomorphism_zero_iff`).

This is option (a) of 1a/F02, in my own wording. For 1b/F01 I did not state §9.2(a), its preferred repair, and I dispute the premise that §9.2(a) is a headline. The roadmap's Summary names its end theorems (Bowen, Bowen–Ruelle, Bowen–Margulis, SRB) and calls all three Layer 9 systems "the examples". A sorried theorem that the suspension of an Anosov diffeomorphism is Anosov would be a definition-checking example, which the rules for `Suggested.lean` exclude. §9.3 differs: it is a classical deep theorem with its own route. 1b/F01's other request, a docstring bullet for §9.1, is applied.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~1a/F03 (P3) — applied

§8.4 API: "every f-invariant subset of U is contained in Λ" becomes "every subset S ⊆ U with f(S) = S is contained in Λ", plus a note that forward invariance does not suffice. The first Check (the sink) now records S = U, which has f(S) ⊆ S without lying in {p}, and that the only sets with f(S) = S are ∅ and {p}.

Same pattern, also repaired:
- §8.4 opening: "for an invariant Λ" becomes "for Λ with f(Λ) = Λ". The forward-invariant reading is false there: for diag(2, 1/2), the set {0} ∪ {(0, 2⁻ⁿ) : n ≥ 0} is forward invariant and locally maximal, but ⋂ fⁿ(U) = {0}.
- The `IsLocallyMaximal` docstring in `Suggested.lean`: the same change.
- §8.5's API item: now explicit, invariance under every g^t, t ∈ ℝ (Mathlib's `IsInvariant`), which forces g^t(S) = S.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~1b/F02 (P3) — applied

Confirmed: ClimenhagaThompson2016 lines 448–463 pass tail specification at all scales to enlargements, and the proof changes the scale. Changed in §2.2: "(ClimenhagaThompson2016, Lemma 2.10, … for the tail version …)" becomes a self-contained one-line proof with τ + T₀ in place of τ. The worked example (T₀ = 1, τ = 3, gaps 0.8 + g ≤ 4) is included, and Lemma 2.10 is cited only for the different statement it proves. `sources.toml` adds "Lemma 2.10" to that source's locator.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~1b/F03 (P3) — applied

`Suggested.lean`: `[CompactSpace M]` becomes `[SigmaCompactSpace M]` in sections `BowenRuelle` and `PositiveEntropy`, with the four docstrings updated. README §§10.2–10.3: "of/on a compact manifold" becomes "a manifold M of the Conventions (Hausdorff and σ-compact, not necessarily compact; Λ is compact by definition), with the truncated Riemannian distance". The §10.2 Check adds diag(2, 1/2) on ℝ² with Λ = {0}. The "In particular … Anosov" sentences and Layer 11 keep compactness.

Why this is safe: the routes use only §§8.4–8.5, already stated for σ-compact M, and §§6.3, 6.6, 6.8 and ClassicalErgodicTheory §§8.2 and 8.5 on the compact Λ.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~1b/F04 (P3) — applied

The book's chapter numbers and titles come from the publisher's public contents page (EMS Press, *Hyperbolic Flows*, doi 10.4171/200): Chapter 5 "Hyperbolicity" (pp. 251–329) and Chapter 8 "Anosov flows" (pp. 471–529). No section-level contents are public, and the text is uncertified.

I kept FH2019 only where a chapter title settles the claim. In §7.2, "(FH2019, Part II)" becomes "Chapter 5, for hyperbolic sets of flows, and Chapter 8, for Anosov flows". I deleted the other eight occurrences (§§6.5, 6.6, 7.4, 7.7, 8.3, 8.5, 9.2, 9.3). Each of them still has a BowenRuelle1975 or KatokHasselblatt1995 locator, except §6.5, whose claim is §8.5's own theorem.

`sources.toml`: locator becomes "Chapter 5 (Hyperbolicity), Chapter 8 (Anosov flows)", cited_for becomes ["7.2"], and version_note says where the chapter titles come from. The References entry is updated to match. No text was requested, so `needs-references.toml` is not written.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~1b/F05 (P3) — applied

§6.2: "there are φ(ε) > 0 and R(ε) such that if m ≥ R(ε) and d(f^m y, y) < φ(ε), there is z" becomes "there are η > 0 and R ∈ ℕ such that every y with d(f^m y, y) < η for some m ≥ R has a point z". §6.6 is changed the same way, with R > 0. These were the only two occurrences of φ(ε); the local uses of η in §1.3 and §11.3 are in other sections.

## Checks run

- **Elaboration.** `lake env lean packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean`, run from the content checkout, exits 0. The output is 15 warnings "declaration uses `sorry`", one for each theorem, and nothing else. The only Tau Ceti import is `TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`, unchanged; it was already built.
- **Mechanical signature check.** I put a `#check @…` for every `def` and `theorem` (50 declarations) in one scratch copy and elaborated it once: exit 0. I compared each elaborated type with its README statement. The four changed theorems keep, besides their own hypotheses:
  - `existsUnique_isEquilibriumState_of_isBasicSet` and `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet`: `[SigmaCompactSpace M]`, `[MeasurableSpace M]`, `[BorelSpace M]`, `[I.Boundaryless]`, `[IsManifold I ∞ M]`, and the `RiemannianBundle` / `IsContinuousRiemannianBundle` binders;
  - `pos_coverEntropy_of_isFlowBasicSet` and `pos_coverEntropy_of_isBasicSet`: `[SigmaCompactSpace M]` and the manifold and Riemannian binders.
  
  All other types are as in the job's `signatures.md`. The nine "dropped binder" leads there are definitions that do not use the binder (`[MeasurableSpace X]` on seven, `[FiniteDimensional]` on `hadamardPerronGraph` and `flowUnstableSubspace`); unchanged.
- **Dependency check:**

      depcheck: 248 roadmaps, 2331 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve`): no cross-roadmap citation and no Lean name found nowhere. The resolver did not check names outside TauCetiRoadmap, so I checked the eight new Tau Ceti names by grep at the pin (files and lines above).
- **Gate failures:** none were listed for this round.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §9.3 (i) f'' ≥ a²f for perpendicular J under K ≤ −a² | K = −1, J = e^(−t)E, a = 1; K = −4, J = e^(−2t)E, a = 1; K = 0, J = tE | f'' = e^(−t) = a²f (equality); f'' = 4e^(−2t) ≥ e^(−2t); a = 0 excluded by a > 0, and the zero of tE lies outside "where J ≠ 0" | holds | added "under K ≤ −a²" in the step |
| §9.3 (ii) \|J_T(t)\| ≤ \|w\| sinh(a(T−t))/sinh(aT) ≤ e^(−at)\|w\| | K = −4, a = 1, T = 1, t = 1/2; K = −1; t = 0 and t = T | 0.3240 ≤ 0.4434 ≤ e^(−0.5) = 0.6065; K = −1 gives equality; end values \|w\| and 0 on both sides | holds | new Check |
| §9.3 (iii) \|D_tJ_T(0) − D_tJ_(T₁)(0)\| ≤ a e^(−aT)\|w\|/sinh(aT); \|J_(T₁)(T)\| ≤ e^(−aT)\|w\| | K = −1, T = 1, T₁ → ∞; K = −4, a = 1, T = 1; sinh(T₁−T)/sinh(T₁) at T = 1, T₁ = 2 | coth 1 − 1 = 0.3130 against e^(−1)/sinh 1 = 0.3130 (sharp, since coth T − 1 = e^(−T)/sinh T); 2 coth 2 − 2 = 0.0746 ≤ 0.3130; 1.1752/3.6269 = 0.3240 ≤ e^(−1) = 0.3679 | holds | — |
| §9.3 (iv) the forward-bounded perpendicular field with given value is unique | K = −1, difference D = sinh(t)E' | \|D(t)\| = sinh t → ∞ unless E' = 0; R4.1 gives ≥ sinh(t)\|E'\| | holds | — |
| §9.3 (v) ‖U(v) − L(v)‖ ≤ a e^(−a)/sinh a; rate with C = (1 + B²)^(1/2) | K = −1: U = −Id, L = −coth(1) Id; K = −4, a = 1: U = −2 Id, L = −2 coth 2 | 0.3130 ≤ 0.3130; B = 1, C = √2 ≥ the sharp C = 1 of the existing Check (no conflict); 0.0746 ≤ 0.3130, B ≤ 2.075 | holds | — |
| §9.3 complementarity | closed surface of curvature −1 | E^s = {(w, −w)}, E^u = {(w, w)}, w ⊥ v, meet only in 0; 1 + 1 + 1 = 3 = dim SM | holds | — |
| §9.3 existence of J_T | dim M = 2; tangential test field | fields vanishing at 0 form a 2-dimensional space, evaluation at T injective, so onto; the tangential field tv vanishing at 0 and T is 0 | holds | — |
| §8.4 API, f(S) = S version | sink with ball U; three-copy example with U the balls at a and c; −Id with Λ = {(1, 0)} | S = U forward invariant but not in {p}, while sets with f(S) = S are ∅ and {p}; {c} has f{c} = {d} ⊄ U, so the only invariant S are ∅ and {a}; no nonempty S, consistent with vacuous maximality | both directions hold | Check extended |
| §8.4 opening, Λ with f(Λ) = Λ | diag(2, 1/2), Λ = {0} ∪ {(0, 2⁻ⁿ)} | forward invariant, locally maximal, ⋂ fⁿ(U) = {0} ≠ Λ | the forward reading fails | wording |
| §8.5 API | cat suspension, γ₀ ⊆ W | an `IsInvariant` S ⊆ W lies in γ₀ (the integer-vector bound 0.905 < 1 of the existing Check) | holds | wording |
| §2.2 short segments | T₀ = 1, τ = 3, segments (0.2), (5); a zero-length segment; a short last segment | gap 0.8 + g ≤ 4; gap T₀ + g ≤ τ + T₀; no gap after the last segment | holds | — |
| §§6.2/6.6 closing with η, R | identity of a finite set; m = 0 | η below the least distance, z = y; m = 0 gives d(y, y) = 0 < η and z = y | holds; quantifier order as in the source | — |
| §10.2 on σ-compact M | diag(2, 1/2) on ℝ², Λ = {0}; φ arbitrary | basic set (only the orbit of 0 stays in a ball); ν = δ₀; P = φ(0); ν(B_n) e^(nP − S_nφ) = 1 | holds; was excluded by `CompactSpace` | Lean and README |
| §10.3 on σ-compact M | hyperbolic saddle periodic orbit of period p in ℝ³ | time measure; P = (1/p)∫F; lower Gibbs C_ε = (2s_ε/p)e^(−2p max\|F\|), as in the existing Check | holds | Lean and README |
| §10.4 on σ-compact M | diag(2, 1/2), Λ = {0}; saddle periodic orbit | `Λ.Finite`; first disjunct, entropy 0 | holds | Lean |
| FH2019 locators | the publisher's contents page | Ch. 5 pp. 251–329, Ch. 8 pp. 471–529 | §7.2 only | locator changes |

## For the maintainer

- **No Lean name changed or was added or deleted.** Four theorems are more general, with `SigmaCompactSpace` in place of `CompactSpace`: `existsUnique_isEquilibriumState_of_isBasicSet`, `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet`, `pos_coverEntropy_of_isFlowBasicSet` and `pos_coverEntropy_of_isBasicSet`. No roadmap on main or at an open head cites any of them (`roadmaps grep`).
- **No supplier changed.** The gap `connection-map-jacobi-derivative` (RiemannianGeometry) is unchanged and is now also used for the continuity in step (v) of §9.3. It already covers this: the gap asks for the derivative of the geodesic flow as the Jacobi map.
- **Overlap lead.** The overlap tool says GeneralizedCohomology §G4.0b is defined only by an open revision. Both reviews read it on main (`TauCetiRoadmap/GeneralizedCohomology/README.md` around lines 939 and 1140–1151). I did not re-open it this round. The citation is unchanged and is not a dependency.
- **Ownership.** I checked ownership against open pull requests with the tools for the one new object: upper bounds and the decay of stable Jacobi fields under K ≤ −a². There is no other owner.
- **Suspicious text.** Neither review contained any.
