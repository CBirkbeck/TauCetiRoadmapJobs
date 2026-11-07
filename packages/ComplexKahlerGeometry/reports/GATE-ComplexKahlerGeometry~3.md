# GATE-ComplexKahlerGeometry~3: answers to human review of pull request #1398

One comment (roed-math, 2026-11-06), seven points, numbered in order. Branch commits:
`bad9cde6` (README: chart-local operator core, Tau Ceti Hodge star and Nijenhuis, anchor map) and
`80b96178` (Suggested.lean: Weierstrass preparation and division; Layer 3 docstring corrected).
Not pushed.

## H01 (roed-math) — answered

Both heads still conflict in both files (#1234 head f44628f). The order that fits the six points: this pull request merges first, and #1234 rebases onto it, adopting `mixed_parameter_solver` (H02), dropping the declarations of H03 and replacing K6.0's normal coordinates and the Fubini–Study block (H04); the pull-request description should say so.

## H02 (roed-math) — answered

Confirmed at #1234 head f44628f: `exists_mixed_parameter_dbar_solution` (its Suggested.lean lines 114–136) has the same binders, hypotheses and conclusion as `mixed_parameter_solver` (Suggested.lean line 85). This pull request keeps `mixed_parameter_solver` and #1234 adopts that name on rebase; no edit here.

## H03 (roed-math) — answered

The deleted declarations stay deleted. Main's `nijenhuisTensor` was sorry'd data (`:= by sorry`, main Suggested.lean line 77) and `IsKahler` mentions it; #1234's `nijenhuisOnFields`, `IsKahler` and `complexBessel*` are definitions that no headline statement uses. `hartogs_extension_across_point` is the special case A={p} of the README's Hartogs theorem across analytic subsets of dimension ≤ n−2 (README §3.2), so it would be a weakened stand-in and the Hartogs clause of the docstring is not narrowed. Checking that bullet (now Suggested.lean line 23) found its Weierstrass claim false at every pin: preparation and division need only Mathlib's `AnalyticAt`. They are now stated as `weierstrass_preparation`, `weierstrass_preparation_unique` and `weierstrass_division` (lines 114–159, README §3.1 line 631, acceptance list line 57), and the claim is removed from the docstring.

## H04 (roed-math) — answered

No text change. K6.0's normal-coordinate target and the one-line Fubini–Study projective-unitary invariance stay as they are here, and #1234 replaces both places when it rebases onto this pull request (H01).

## H05 (roed-math) — applied differently

Ownership of the operator core stays with Layer 5, because on main PseudodifferentialOperators consumes K5a: its distributions and Sobolev scale, and inside P1.0 its density line (PDO README lines 91–98 and 399–407). If K5a consumed P1.0 back, the two roadmaps would supply each other. Layer 5 is narrowed to the chart-local core K5a's analysis uses: operators by local coefficient expressions, principal symbols, transposes, formal adjoints, the connection Laplacian and Laplace type. The new subsection is "Finite-order operators, symbols and density transpose" (README line 1074), which drops J^m E, the jet and commutator characterizations, the Hadamard argument and Kolář–Michor–Slovák; scope (lines 25–31) leaves those to P1.0, which consumes the core. RiemannianGeometry R7 is named as a consumer (line 2648). #1683 at its current head 82a58c9 no longer claims an R7A core (its lines 24–28 defer to P1.0).

## H06 (roed-math) — applied differently

There is one object, not two. At main's Tau Ceti pin (2fd255d), `Orientation.hodgeStar` is Mathlib's `exteriorPower.hodgeStar` for `innerₗ` and `Orientation.volumeEquiv`, and `Orientation.formHodgeStar` is by definition its transport along `TauCeti.alternatingFormEquiv` (`HodgeStar/AlternatingForm.lean` lines 76–79, comparison `formHodgeStar_alternatingFormEquiv`). §5.1 (README line 985) and a new Tau Ceti contract (line 180) now consume that star, `complexHodgeStar`/`barHodgeStar` with their type law, `RoughForm.hodgeStar`, `SmoothForm.hodgeStar` and `SmoothForm.codifferential`. The old "specialize `exteriorPower.hodgeStar` to V*" construction is gone. K5a keeps the orientation-line twisted star and the complex-coefficient form star, so #1609 can cite either K5a or Tau Ceti for the same declaration.

## H07 (roed-math) — disputed

A supplier contract on #1768 makes this roadmap, which is on main, consume a roadmap that is not merged: with that edit the depcheck printed `UPWARD: ComplexKahlerGeometry (on main) -> DeRhamCohomologyAndDuality (#380) at README lines [150, 2057, 2200, 2209]`. So K6.1 keeps its boundaryless relative integration contract, and #1768, downstream, should consume K6.1 for the boundaryless instances rather than name K6.1 as its consumer. The nonexistent labels "DR.3.8 and DR.4.4" are replaced by §§2.4, 3.1–3.3 and 4.1 as they stand at #1768 head 1b57dbe (README lines 49–54); #1768's own consumer section already reads the old labels that way.

## Build

`lake build TauCetiRoadmap.ComplexKahlerGeometry.Suggested`: `Build completed successfully (8954 jobs)`, eight `declaration uses sorry` warnings (the eight theorems), no errors.

## Gate

`gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (after the edits): `depcheck: 239 roadmaps, 2360 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line.

## The Tau Ceti pin of this branch (for the worker)

This branch's `lake-manifest.json` still pins Tau Ceti 358314d and Mathlib f6090c7. Main moved to Tau Ceti 2fd255d and Mathlib 1b1ccf4 in #1800, and those are the pins the brief names. The build and the gate use the branch's pin: a first attempt that imported `TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure` and `TauCeti.Geometry.Symplectic.Manifold.Nijenhuis` failed with `imports: ... does not exist at the pinned Tau Ceti`, so it was reverted. Consequences:

- The README targets main's pin. H06's Hodge star and Layer 1's type calculus and Nijenhuis tensor (README line 303: `IsOfType`, `del`, `delBar`, `nijenhuis` and its identities, `isInvolutiveComplexDistribution_eigenspace_I_iff`, `delBar_delBar_apply`, `del_del_apply`, all checked at 2fd255d) are cited there. None of them exists at 358314d.
- Suggested.lean elaborates at 358314d, and its docstring is accurate there. At 2fd255d its Layer 1, 2, 5 and 6 bullets are not. Once main is merged into the branch, Newlander–Nirenberg becomes statable as follows (checked against the 2fd255d declarations by reading, not elaborated). #1807 states it identically: `theorem newlander_nirenberg {E} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E] {M} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ∞ M] (J : TauCeti.SmoothAlmostComplexStructure 𝓘(ℝ, E) M) (hJ : J.nijenhuis = 0) (x : M) : ∃ e ∈ IsManifold.maximalAtlas 𝓘(ℝ, E) ∞ M, x ∈ e.source ∧ TauCeti.IsPseudoholomorphicOn J (TauCeti.SmoothAlmostComplexStructure.ofComplexManifold E E) e e.source`. README line 327 already states this local form in prose. The same merge makes Dolbeault–Grothendieck on a polydisc, Dolbeault finiteness and Serre duality with trivial coefficients, the dimension form of the Hodge decomposition and Hard Lefschetz statable. #1807 states all of them against 2fd255d. Under the overlap rule they are not restated here: #1807 should rebase onto this pull request and bring that acceptance test.

## Signature check

All eight declarations were elaborated in one build, with `#check @name` lines appended temporarily and removed afterwards; the file is byte-identical to the committed one. Every binder is in each declaration's own signature (no section variables), and none was lost. The five unchanged declarations match the elaborated-signature list supplied with this job exactly. The three new ones match README §3.1: germs at the origin of `ℂⁿ × ℂ`, order exactly d via `iteratedDeriv`, and uniqueness as germs (`=ᶠ[nhds 0]`).

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `weierstrass_preparation` | d=0; n=0; f=w²−z; f=z | d=0: hd says f(0,0)≠0, polynomial =1, u=f. n=0: f=w²(1+w), u=1+w, a≡0 since the domain is one point. f=w²−z: d=2, u=1, a₁=0, a₀=−z, a₀(0)=0. f=z: every iteratedDeriv of w↦f(0,w) is 0, so no d satisfies hd | true; hypothesis excludes the degenerate f=z | Checks added to README §3.1 |
| `weierstrass_preparation_unique` | d=0; n=0 | d=0: u=f=u′. n=0: u=f/w^d=u′ and a=a′=0 | true | none |
| `weierstrass_division` | d=0; n=0; g=w², f=1+w+w² | d=0: f=g·(f/g), remainder empty. n=0: remainder = Taylor polynomial of degree <d. g=w², f=1+w+w²: q=1, r=1+w. With a remainder allowed degree ≤d there is a second solution q=0, r=1+w+w² | true; uniqueness needs the degree bound <d | negative-control Check added |
| §5.1 operator core: order ≤m by local form | m=0; dimension 0; zero bundle; x=2y; ∂∘(x∂) | Multiplication by 3: order 0, symbol 3, not the zero operator. Dimension 0: every operator has order 0 and every positive-order symbol is 0. Zero bundle: operator space 0. x=2y: ∂ₓ²=(1/4)∂_y², symbol at dx=2dy is (1/4)·4=1 (as a scalar it would be 1/4). ∂∘(x∂)=x∂²+∂, symbol xξ²=ξ·xξ | true | five Checks replace the jet Checks |
| Symbol conventions geometric vs Fourier | ∂² at ξ=2 | geometric 4, Fourier (iξ)²=−4, ratio i²=−1 | consistent with PDO's convention σ_F(∂_j)=iξ_j | Check kept |
| Tau Ceti star replaces the K5a construction | oriented plane; dimension 0; reversed orientation | α∧*β=⟨α,β⟩vol gives *dx=dy and *dy=−dx (dy∧(−dx)=dx∧dy); *²dx=−dx=(−1)^(1·1)dx; dimension 0: *1=±1 by the orientation; reversal: `formHodgeStar_neg_orientation` | agrees with the existing §5.1 Check | none |
| Complex stars (pinned identities) | α=β=i dx on ℂ | α∧*β=i dx∧i dy=−dx∧dy; B_ℂ(α,β)=i·i=−1; ⟨bar α,β⟩=conj(−i)·i=−1. barStar β=*(−i dx)=−i dy, α∧barStar β=dx∧dy, ⟨β,α⟩=conj(i)·i=1 | README pins match Tau Ceti `Complex.lean` | none |
| Fibre identification of ℂ⊗⋀^kV with complex forms | definition | complexHodgeStar=(o.hodgeStar).baseChange and formHodgeStar=alt∘hodgeStar∘alt⁻¹, so the complexified alt intertwines complexHodgeStar with formHodgeStar_ℂ | true | wording now says "intertwines" |
| Layer 1 Nijenhuis formulas (pinned) | integrable J; (0,1) fields | N=0 gives ∂̄²f=0 (Dolbeault). On (0,1) fields: ∂̄²f(v^{01},w^{01})=∂̄²f(v,w)=−¼∂f(N(v,w))=−¼∂f(N(v,w)^{10})=−¼∂f(N(v^{01},w^{01})) | the README's complex-field formula follows from Tau Ceti's real-vector one | formula restated explicitly |
| Newlander–Nirenberg local form (README prose) | complex dimension 0 and 1 | dim 0: chart at x, zero derivative intertwines trivially. dim 1: N(v,Jv)=J N(v,v)=0, so N≡0 and isothermal coordinates exist | true; no Hausdorffness needed (local) | prose added, line 327 |
| Anchor lines | the anchors the overlap tool listed | `#k2-…`, `#k3-…`, `#k5-…`, `#k7-projective-torus-and-hopf-examples` match the overlap tool's strings | correct | ten lines added, line 212 |

## Ownership, overlaps and citations

- Ownership against open work was checked by object in the sibling checkouts: DeRhamCohomologyAndDuality #1768 at 1b57dbe and GlobalHolomorphicFunctions #992. It was also checked with `roadmaps show` at the current heads of #1234, #1683, #1807, #1808 and #1854. No notion moved down: H07's contract stays where it already was.
- The same two-owner pattern as H07, not changed here: GlobalHolomorphicFunctions #992 (lines 38–39, 953, 1964–1969) says ComplexKahlerGeometry K2 consumes its §0.3 transform, its §2.5 finite-rank Runge operator and its §7.2 two-form exactness, while this README's Layer 2 owns them and `finite_rank_runge_approximation` is a headline here. #992 is downstream (merge order line 83), so by the same direction rule as H07 it should consume Layer 2. LieGroupoidsPoisson on main says ComplexKahlerGeometry K8 consumes its §G1.3a, while Layer 8 builds the complex over ℝ and ℂ. Both need their authors' decision and are recorded in the README's scope paragraph (line 42) as statements of objects owned here.
- Other open pull requests that change this roadmap: #1234 (H01). #1807, #1808 and #1854 conflict textually. #1854's change, 8.1 "DGFloer's generic filtered-complex spectral sequence" → "AlgebraicTopology Stage 5.0", is not restated here. Recommended order: this pull request first, then #1234 and the loop-cutting pull requests rebase onto it.
- Anchors this pull request drops that main roadmaps cite (Hyperfunctions, PseudodifferentialOperators, SmoothBundlesConnections, SpinGeometry, GeneralizedCohomology, MorseTheory, RiemannianGeometry): old → new lines added under "How to read the build" (README line 212).
- Ids this README cites that #886 drops (DifferentialGeometry §5.5 and §8.3): #886 is a revision, so main's numbering is kept; both items exist on main (DifferentialGeometry Layer 5.5 and Layer 8.3).
- Ids that only an open revision defines: none.
- `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere. Library names outside the roadmaps were checked by hand at 2fd255d.
- Not in this review's scope, noted for the worker: §5.4 consumes `CompactFormPair.*` names from VariationalMethods, which exists only as open pull request #1028 and is not in the merge order.

## Sources

No source was fetched. Demailly II (2.1) and (2.3)–(2.4) were checked at `demailly-agbook` lines 3794–3817 (page 80) for the Weierstrass docstrings. Kolář–Michor–Slovák was removed from the README's references because the jet construction it supported now belongs to PseudodifferentialOperators P1.0. The folder has no `sources.toml`, and this job may not create one, so nothing was recorded there. `needs-references.toml` was not written.

## Untrusted text

Nothing in the review asked for actions outside the job; no suspicious passage.
