# Review of ComplexKahlerGeometry (pull request #1807 at 89357f3)

**Verdict:** needs changes

## R01 (P2) — The finite-rank Runge operator and Runge's theorem by pole pushing have a second owner on main

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` 2.2, lines 607–609: "The finite-rank operator and its estimate are this roadmap's own; the inputs are the reconstruction formula and Runge's theorem cited below." Also line 44 (Scope) and the route of lines 611–633.

**Claim.** GlobalHolomorphicFunctions, on main and earlier in the merge order, owns the same operator with the same estimate and the same pole-pushing proof of Runge's theorem, and names K2 as its consumer. This README never cites GlobalHolomorphicFunctions.

**Witness.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md` on main, line 1444: "Also prove `exists_finite_rank_runge_operator`, the finite-rank linear Runge operator used by GH5 and CKG K2"; its `Suggested.lean` line 177 declares it; heading 2.5 at line 1380.

**Repair.** Replace lines 602–633 by: "The finite-rank operator is GlobalHolomorphicFunctions Layer 2.5's and is cited, not proved again: for Ω⊆ℂ open, K⊆Ω compact and filled in Ω, U⊇K open, L⊆U∩Ω a compact collar with K⊆int L and ε>0, it gives N, points ζ_j∈int L, weights w_j and g_j holomorphic on Ω with `sup_K|f−A f|≤ε sup_L|f|` for every f holomorphic on U, `A f=Σ_j w_j f(ζ_j)g_j`. K2 owns only its use in 2.3: A has fixed evaluation points and output functions, so it commutes with parameter derivatives and preserves holomorphic parameters. *Needs:* GlobalHolomorphicFunctions Layers 0.3, 2.1 and 2.5." Add `### From TauCetiRoadmap.GlobalHolomorphicFunctions` to the supplier contracts with those layers, and drop "the finite-rank Runge operator" from line 44. The annulus Check (no operator for ε<3/4 when K is not filled) stays valid for the cited statement, which assumes K filled.

## R02 (P2) — Exactness of complex two-forms on plane domains has a second owner on main, which names K5a as its consumer

**Location.** README 5.6, lines 1942–1951: "prove that every smooth complex-valued 2-form on Ω is exact … The passage from the scalar solver to two-forms is this roadmap's own." Also line 64 (Scope: "exactness of planar two-forms").

**Claim.** GlobalHolomorphicFunctions Layer 7.2 on main proves the same statement on `TopologicalSpace.Opens ℂ` from its own scalar solver (Layer 7.1) and says K5a consumes it. The two roadmaps on main each say the other side proves nothing for them.

**Witness.** GlobalHolomorphicFunctions `Suggested.lean` on main, line 327, `exists_mextDeriv_eq_complex_two_form (U : TopologicalSpace.Opens ℂ)`; its README lines 2553–2554: "K5a consumes GH5.1's complex two-form exactness for its complex de Rham comparison"; heading 7.2 at line 2339.

**Repair.** Replace 5.6's statement and route by: "For every open Ω⊆ℂ every smooth complex-valued 2-form on Ω is exact: this is GlobalHolomorphicFunctions Layer 7.2, cited. K5a.PlanarTwoForms owns only its consequence on K5a's carrier, `H²_dR(Ω;ℂ)=0` in the complex de Rham quotient of 5.5. *Needs:* GlobalHolomorphicFunctions Layer 7.2; 5.5's complex de Rham carrier." Keep the three Checks (they test the cited statement: `u=z̄/(2i)` gives `d(u dz)=dx∧dy`). In 2.3 add one clause: the case P=Q=point is GlobalHolomorphicFunctions Layer 7.1's scalar solver, which the joint solver extends to parameters. Change line 64 to leave planar two-form exactness to GlobalHolomorphicFunctions.

## R03 (P3) — `uniqueFactorizationMonoid_holomorphicStalk` carries an existential `IsDomain` binder that the pin already supplies as an instance

Carried from R02 of the review at 3adc047, partly repaired (the README now cites `smoothStalkIsDomain`, line 848).

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` lines 299–302: `∃ _ : IsDomain ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x), UniqueFactorizationMonoid (…)`.

**Claim.** The first half of the statement is a pinned instance, so the headline restates it inside an existential.

**Witness.** Scratch copy with `TauCeti.Geometry.Manifold.Complex.StructureSheaf.Domain` imported: `example (x : M) : IsDomain (… .stalk x) := inferInstance` elaborates, and the theorem stated as plain `UniqueFactorizationMonoid (… .stalk x)` elaborates (exit 0, 28 `sorry` warnings).

**Repair.** Add `public import TauCeti.Geometry.Manifold.Complex.StructureSheaf.Domain` and state the theorem as `UniqueFactorizationMonoid ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x)`.

## R04 (P3) — 5.5 cites DifferentialGeometry 6.2 for a "target" that 6.2 itself cites from Tau Ceti

**Location.** README 5.5, lines 1903–1904: "Apply DifferentialGeometry 6.2's smooth star-convex primitive target, constructed from DifferentialGeometry 5.4's radial homotopy".

**Claim.** DifferentialGeometry 6.2 on main states no such target and builds nothing from 5.4 there: it names the pinned declaration.

**Witness.** `TauCetiRoadmap/DifferentialGeometry/README.md` on main, lines 2431–2432: "is `StarConvex.exists_contDiffOn_forall_extDeriv_eq` (`Analysis/Calculus/DifferentialForm/Poincare.lean`)"; the declaration is at Tau Ceti's `Analysis/Calculus/DifferentialForm/Poincare.lean` line 393, for forms with values in any normed space `F`.

**Repair.** Replace the sentence by: "Apply Tau Ceti's flat Poincaré lemma `StarConvex.exists_contDiffOn_forall_extDeriv_eq`, for forms with complex values, to obtain smooth primitives `g_+` and `g_-` of ω on these domains." Add the declaration to "From Tau Ceti" and to 5.5's `*Needs:*`.

## R05 (P3) — Three targets still need later ones, and 8.1's `*Needs:*` lists the inputs of 8.2–8.3

Carried from R07 of the review at 3adc047, partly repaired (2.2 and 2.3 no longer need each other).

**Location.** README line 3437 (8.2 `*Needs:*` "8.3's central reduction"); lines 597–598 (2.1 `*Needs:*` "2.3's solver and 2.4's product-domain approximation for the whole-polydisc lemma"); lines 3408–3411 (8.1 `*Needs:*` ends with ComplexManifolds Milestone 4, LieGroupoidsPoisson G1.3, Sakane, Angella and Raghunathan).

**Claim.** 8.2 and 2.1 depend on later subsections, and 8.1's line blocks the Frölicher adapter behind the nilmanifold inputs, which 8.1's statements do not use.

**Witness.** 8.1's statements (lines 3358–3396) mention no quotient, Lie algebra or lattice; 8.3 line 3441: "Supply the existence and lattice theorem needed at every induction step".

**Repair.** Put 8.3 before 8.2 and renumber. Move the whole-polydisc sentence and `dolbeault_grothendieck_polydisc` (lines 579–582) to 2.4, after the solver and the product-domain approximation. End 8.1's `*Needs:*` at "K6.1's Hodge decomposition for the Kähler degeneration."

## R06 (P3) — 3.4 cites Demailly II (4.31) for the dimension drop, which (4.31) does not state

Carried from R09 of the review at 3adc047; its other five locators are repaired.

**Location.** README lines 1020–1026: "Prove that the singular locus of every reduced analytic subset is a closed analytic subset, with strictly smaller complex dimension … Follow [Demailly, chapter II §4.4, Theorem 4.31]".

**Claim.** (4.31) gives analyticity of the singular locus only; the density of regular points, which the dimension drop needs, is (4.24).

**Witness.** `demailly-agbook` line 4929: (4.31) asserts that the singular set is an analytic subset, nothing on dimension. `demailly-agbook` line 4789, (4.24), p. 98: the regular points of an irreducible germ are dense and connected in small neighbourhoods.

**Repair.** Replace the last sentence by "(Demailly, Chapter II, (4.31), p. 100, for analyticity; (4.24), p. 98, for the density of regular points; the dimension drop for subsets that are not pure-dimensional is this roadmap's own deduction)."

## R07 (P3) — 7.2's computation of `H⁰(O(k))` has no locator

**Location.** README lines 2840–2842: "Identify `H⁰(O(k))` with homogeneous degree-k polynomials for k≥0 by the local transition/Hartogs argument, and prove dimension `binomial(n+k,n)`."

**Claim.** A stated theorem without a locator; the source cited throughout states it.

**Witness.** `demailly-agbook` line 13724, (15.5), p. 278: sections of `O(k)` on `P(V)` vanish for k<0 and are `S^k V*` for k≥0; line 13727, (15.6): the dimension `binomial(n+k,n)`.

**Repair.** Append "(Demailly, Chapter V, (15.5)–(15.6), p. 278)" to the sentence.

## R08 (P3) — Four sentences say the roadmap follows a source

**Location.** README line 976: "Follow Griffiths–Harris, *Principles of Algebraic Geometry*, chapter 0 §§1–2, and Demailly, chapter II: prove local parametrization"; also lines 504 ("Follow Webster's 1989 rapidly converging proof"), 1012 and 1025.

**Claim.** A roadmap does not say it follows a source, and a proof sketch names a route without making it mandatory; a result that appears in a source takes a locator in parentheses.

**Witness.** The four sentences open with the imperative "Follow" and name a source's chapter or section as the plan of the proof.

**Repair.** Line 976: "Prove local parametrization of a pure-dimensional analytic germ by a finite branched projection to a polydisc (Demailly, Chapter II, §4.3; Griffiths–Harris, chapter 0, §§1–2), …". Line 504: "Route: Webster's rapidly converging iteration (Math. Z. 201 (1989), 303–316): construct …". Line 1012: "(Demailly, Chapter II, (4.29), p. 99)". Line 1025: as in R06.

## R09 (P3) — No Check separates `IsKahler` from the same predicate without J-invariance

Carried from R11 of the review at 3adc047; its other items are repaired or no longer in the text.

**Location.** README 6.1, lines 2339–2341 ("compatible with J (`SmoothTwoForm.Compatible`, invariance and positivity on complex lines)"), and the Checks of 6.3, lines 2521–2540.

**Claim.** The Checks exclude a non-closed form (Hopf), a non-integrable J (Kodaira–Thurston) and a non-positive class (`σ₁` on `S²×S²`). None excludes a closed form that tames J without being invariant, so the wrong model "closed, taming, integrable" passes every Check.

**Witness.** On ℂ², `κ=dx₁∧dy₁+dx₂∧dy₂+dx₁∧dx₂`: closed; `κ(v,Jv)=|v|²+(a₂b₁−a₁b₂)≥|v|²/2>0`; `κ(J∂_(x₁),J∂_(x₂))=κ(∂_(y₁),∂_(y₂))=0≠1=κ(∂_(x₁),∂_(x₂))`.

**Repair.** Add to 6.3's Checks: "Invariance: on ℂ² the closed form `dx₁∧dy₁+dx₂∧dy₂+dx₁∧dx₂` satisfies `κ(v,Jv)≥|v|²/2` for the standard J but `κ(J∂_(x₁),J∂_(x₂))=0≠1=κ(∂_(x₁),∂_(x₂))`, so it is not a Kähler form; a condition with positivity on complex lines alone would admit it."

## R10 (P3) — The description's sentence on K7.1 describes an earlier head

**Location.** Pull request description, first bullet: "K7.1 reproves on Mathlib's topology the instances Tau Ceti states on its own copy".

**Claim.** At this head K7.1 does not reprove the instances; it reproves the atlas and the Riemann-sphere diffeomorphism.

**Witness.** README lines 2727–2731: "Obtain the four on Mathlib's instance without repeating those arguments: second countability from the open quotient map … and Hausdorffness, compactness and path-connectedness by transporting the sphere-quotient model's" instances; lines 2738–2739 and 2797–2798 repeat the proofs of the atlas and of the diffeomorphism.

**Repair.** Replace the clause by: "K7.1 obtains on Mathlib's topology second countability from the open quotient map and Hausdorffness, compactness and path-connectedness by transport from the sphere-quotient model, and repeats there the proofs of Tau Ceti's affine atlas and Riemann-sphere diffeomorphism".

## Previous findings

- R01 (PlanarTopology, SurfaceTopology) — repaired: 0 mentions of either name; 7.7 proves the integral dictionary "on the realified surface Σ itself … no step classifies surfaces" (lines 3156–3158).
- R02 (Layer 3 re-plans pinned objects) — partly: 3.1–3.3 now cite the pinned declarations ("consumed, not restated", line 843); the `IsDomain` binder remains (R03).
- R03 (Layers 1, 2, 5, 7 re-plan pinned objects) — repaired: "cited, not constructed" (line 387), "cited, not proved again" (line 660), `TauCeti.Analysis.Distribution.DeltaSeries` (line 1621); the docstring gives the import clash (lines 82–85).
- R04 (Rückert, Oka, de Rham Hodge absent) — repaired: `ruckert_nullstellensatz`, `oka_coherence`, `hodge_theorem_deRham` are declared (`Suggested.lean` lines 230, 241, 332).
- R05 (differential-operator core owned twice) — repaired: "Consume P1.0's differential-operator carrier and Laplace-type predicate" (line 1964).
- R06 (dropped anchors) — repaired: "K1 is now Layer 1, … K8 is now Layer 8" (lines 373–376); the overlap report lists no dropped id.
- R07 (targets needing later targets) — partly (R05).
- R08 (suppliers named as consumers) — repaired: no mention of VariationalMethods; the AlgebraicTopology Stage 7 clause is gone (lines 3572–3575).
- R09 (locators) — partly: five repaired; (4.31) remains (R06).
- R10 (unqualified subsection numbers) — repaired: "DifferentialGeometry 8.4's", "DifferentialGeometry 5.5's", "DifferentialGeometry 5.4's" (lines 1872, 1876, 1931).
- R11 (Checks) — partly: the three wrong Checks are no longer in the text and `polydisc`, `lefschetzMap` have Checks (lines 745, 2533); the invariance Check is missing (R09).
- R12 (padding) — repaired: `realified_isManifold_analytic` is not declared.
- R13 (conflicting open pull requests) — repaired: the overlap report lists only #1808, which the merge-order paragraph orders after this pull request.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 implicit map and submanifolds | `G=v²−z` at `(1,1)`, at `(0,0)`; cusp | `F=√(z+w)`, `G(z,F)=w`; `∂_vG=0`; `(3t²,2t)=0` at `t=0` | sound | none |
| 1.3 type calculus, eigenbundles | `u=∂_x` on ℂ | `u^(1,0)=(∂_x−i∂_y)/2=∂_z`, `J∂_z=i∂_z`; `(u+iJu)/2=∂_z̄` | sound | none |
| 1.4 `newlander_nirenberg` | `n=0`; constant φ; `J=ofComplexManifold` | point, trivial; constant is pseudoholomorphic but no local diffeomorphism; charts are the φ | sound | wording (R08) |
| `dolbeault_grothendieck_polydisc`, `polydisc` | `n=0`; `r₁≤0`; `n=1`, `φ=z̄ dz̄` | point; empty, vacuous; `ψ=z̄²/2` | sound | order (R05) |
| 2.2 finite-rank Runge operator | annulus `2≤|z|≤3` in `|z|<4`, `f=1/z`; `K=∅` | `sup_L|f|=2/3`, `sup_K|f−Af|≥2π/4π=1/2`, fails for `ε<3/4`; `0≤0` | sound | second owner (R01) |
| `exists_mixed_parameter_dbar_solution` | `P=Q=` point; `f=q̄` | Layer 7.1 of GlobalHolomorphicFunctions; `∂̄_qT(χf)=T(χ)≠0`, excluded by `hfhol` | sound | clause (R02) |
| 3.2 `weierstrass_preparation`, `_unique`, `weierstrass_division` | `w²−z`; `w³` divided by it; `d=0`; `f=z` | `u=1`, `a=(−z,0)`; `q=w`, `r=zw`; `u=f`; `hd` fails | sound | none |
| 3.3 meromorphic germ field | `1/z²+3/z+5+z`; `(1/z+1)(1/z−1)` | `P(t)=t²+3t`, coefficient `3`; orders −1, −2: `0`, `1` | sound | none |
| `ruckert_nullstellensatz` | `k=0`; `f₀=z²`, `g=z`; `n=0` | `g=0`, `m=1`; `g²=1·f₀`; constants, `m=1` | sound | none |
| `oka_coherence`, `cartan_coherence_reducedIdeal` | `k=0`; `f=(z₁,z₂)`; `f=(zw)²` | `m=0`; relation `(z₂,−z₁)`; generator `zw`, not `(zw)²` | sound | wording (R08) |
| `riemann_extension`, `hartogs_extension_across_point` | `k=0`; `1/z`; ℂ² with doubled origin | `U=∅`; unbounded, excluded; extends through the chart of `p`, `{p}ᶜ` open | sound | none |
| `isRegularLocalRing_holomorphicStalk`, `uniqueFactorizationMonoid_…` | `E=0`; `E=ℂ`; probe | field, dimension 0; DVR, dimension 1; `IsDomain` inferred at the pin | sound | binder (R03) |
| 5.1 pointwise algebra, densities, distributions | chart `x↦−x`; point delta; `Λ²` | `|dx|` fixed, `dx↦−dx`; `H^s` iff `s<−n/2`; symbol `1+‖ζ‖²=5` at `‖ζ‖=2` | sound | none |
| 5.5 complex de Rham cohomology | `dz/z` on `ℂ∖{0}` | `c_U=0`, `c_L=−2πi`, `Per=c_U−c_L=2πi`, `P([dz/z])=1` | sound | citation (R04) |
| 5.6 planar two-forms | `h=1`; wedge order | `u=z̄/(2i)`, `d(u dz)=dx∧dy`; `dz̄∧dz=2i dx∧dy` | sound | second owner (R02) |
| `hodge_theorem_deRham` | circle; `m≠dim`; `M=∅` | `d*(f dθ)=−f′`, harmonic line; excluded by pinned `Orientation.card_eq`; `0` | sound | none |
| 5.9 local Hermitian identities | ℂ, standard metric | `|dz|²=2`, `∂̄*(f dz̄)=−2f_z`, `Δ_∂̄=−2∂_z∂_z̄`, `*dz=−i dz`, `ω²/2!=dvol` | sound | none |
| `finiteDimensional_dolbeaultCohomology`, `finrank_dolbeaultCohomology_serre` | Hopf; `p>n`; `E=0` | `h^(0,1)=1=h^(2,1)`; `n−p=0` in ℕ, `0≠h^(0,n−q)`, excluded by `hp`; `1=1` | sound | none |
| `IsKahler` | `dx∧dy`; Hopf metric; `κ` of R09 | closed, compatible; `dω≠0`; taming, not invariant, excluded by `Compatible.invariant` | sound | Check (R09) |
| `del_delBar_lemma` | Kähler form of an elliptic curve | closed, `∫>0`, not exact: excluded by `hexact` | sound | none |
| `finrank_deRhamCohomology_eq_sum_dolbeault`, `…_symm`, `even_…_odd` | elliptic curve; ℂP¹; Hopf; `k>2n` | `2=1+1`; `1=0+1+0`; `b₁=1`, `0≠1` (not Kähler); `0=0` | sound | none |
| `hard_lefschetz`, `lefschetzMap` | `k=n`; ℂP²; `S²×S²`; `M=∅` | identity; `[ω]²≠0`; `(aσ₁+bσ₂)²=2ab`; zero spaces | sound | none |
| 6.4 analytic cycles | line, cuspidal cubic, `{xy=0}` in ℂP² | `∫ω_FS=1`, `3`, `2`; `[V]=1,3,2` times the line | sound | none |
| 7.1 projective models | `(3,4)`, `2i(3,4)`; `(1,i)`; `n=0` | `(3/5,4/5)`, chart `4/3`; chart `i`, conjugate map gives `−i`; one point | sound | none |
| 7.3 `finrank_…_complexProjectiveSpace` (both), `integralCohomology_…`, `integralCupPow` | `n=0,1,2`; `S²∨S⁴`; `u=2·`generator | `h^(0,0)=1`; `h^(2,2)(ℂP¹)=0`; `u²=0` fails at `k=2`; fails at `k=1` | sound | none |
| 7.6 `finrank_dolbeaultCohomology_complexTorus` | `n=0,1,2`; `L=ℤ⊂ℂ` | `1`; `h^(2,0)=0`; `1+4+1=6=C(4,2)`; excluded by `IsZLattice ℝ L` | sound | none |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; `M=∅`; Hopf | `2=2`, `4=2·2`; `0`; dimension two, outside the statement | sound | none |
| 8.1 Frölicher, `finrank_deRhamCohomology_le_sum_dolbeault` | `E₁^(1,0)`; Iwasawa; Hopf | `(3,−2)→(5,−3)=E₁^(2,0)`; `4≤5`; `1≤1`; `r≥max(p,n−p)+1` | sound | Needs (R05) |
| 8.2–8.3 nilmanifolds | Iwasawa; integer Heisenberg | `dφ₃=−φ₁∧φ₂`, `d₁[φ₃]≠0`; `log=X+Y+½Z`, `Γ∩A≅ℤ` | sound | order (R05) |
| 7.2, 7.4, 7.5, 7.8, 7.9 Checks | as in the text | `h(e₁,e₂)=i/(8π)`; `a′=az_k`; exponents `0…8`, kernel `x₀x₃−x₁x₂`; `Re(aτ)=v`; weights `2^(a+b+1)`, `2^(1−m−n)` | sound | locator (R07) |

- Source locators checked against the text: about 60 numbered items of `demailly-agbook` located in their chapters, of which these were read in full: lines 1266, 3794, 3804–3817, 4399, 4742, 4842, 5189, 6997, 7027, 11208, 13812, 14239, 14583, 14697, 14702, 14858–14869, 15370–15374, 15486, 15946, 16000; `rainer-advanced-complex-analysis` 1295, 1338, 1630, `angella-iwasawa` 256, 693–724, `sakane-parallelisable` 102–115, `lojasiewicz-triangulation` 512, `ballmann-kahler` 1829, 1990, `berwick-evans-tripathy` 287, `hormann-steinbauer-distributions` 1522 (p. 35), 3759 (p. 90).
- Library declarations opened at the pins: Mathlib `Topology/Algebra/Projectivization.lean` line 44 and Tau Ceti `Topology/Algebra/Projectivization.lean` line 90 (the same declaration twice, as 7.1 says); Tau Ceti `Geometry/Manifold/Riemannian/Codifferential.lean` 88, 121, 252; `Geometry/Manifold/Orientation/Basic.lean` 83; `Geometry/Symplectic/Manifold/TwoForm.lean` 231; `Geometry/Symplectic/Manifold/AlmostComplex/Eigenbundle.lean` 96, 149; `Analysis/Distribution/DeltaSeries.lean` 97; `Analysis/Calculus/DifferentialForm/Poincare.lean` 393. The two names of the citation report are module names and both files exist.
- Cross-roadmap citations resolved: AlgebraicTopology at this head (4.6 at 1827, 5.0 at 2161 with the reindexing `(2p+q+1,−p−1)`, 6.3–6.5, 8.7) and CharacteristicClasses at this head (C1.5, C1.5a, C2.4a, C7.6); on main DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1, DifferentialGeometry, PDE §§1.3–1.7, 2.2, PseudodifferentialOperators P1.0, RealAnalyticGeometry R0–R3.2, ComplexManifolds Milestones 1–7, ComplexTori Milestone 1, SmoothBundlesConnections B1–B2.4, LieGroupoidsPoisson §G1.3, StableReduction Layer 4, GeometricTopology Layer 11.
- AlgebraicTopology 4.6 at this head (line 1839) cites the affine atlas on Mathlib's topology as Tau Ceti's, while 7.1 here plans it again on Mathlib's instance; 7.1's account of the pins is the accurate one, no change asked here.
- Dependency check: `depcheck: 245 roadmaps, 2263 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Every supplier named is on main or in `Completed/`.
- Gate (worker's record at 89357f3): every check passed, `build=0`. `lake env lean` on `Suggested.lean`: 27 `sorry` warnings and nothing else.
- One-tactic probe: all 27 sorried theorems tried with `first | rfl | infer_instance | simp` on a scratch copy; 27 errors, none closes. `#check @name` for the 36 declarations (worker's signature report read against the README): the four flagged binders are on `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` and `lefschetzMap`, whose bodies do not need them; every theorem about them carries `[FiniteDimensional …]`, `[T2Space M]`, `[CompactSpace M]` in its own signature.

Overlap check: read CalibratedGeometry, GlobalHolomorphicFunctions, PseudodifferentialOperators (main), ComplexComparisonPartII, SmoothBundlesConnections, GeometricQuantization, DeRhamCohomologyAndDuality, RelativisticQuantumFieldTheory (open heads); shared: finite-rank Runge operator and planar two-form exactness, owner GlobalHolomorphicFunctions (R01, R02); Wirtinger inequality, owner CalibratedGeometry, 6.4 uses only the equality on complex submanifolds; nothing else shared.

Source independence: 14 passages compared with 8 sources, none shared beyond statements the mathematics forces; largest share demailly-agbook, 55 of 93 source mentions; contents compared with demailly-agbook (Chapters I–IX): independent. Layer 2 draws on its Chapters I and IV, Layer 6 on III, VI and VII, Layers 1, 7 and 8 match no chapter, and K5a's distribution and Sobolev theory is not in it; the order germs, bundles, elliptic theory, Kähler theory is forced by 4.1's use of 3.1's sheaf, 5.9's use of Layer 4 and 6.3's use of 5.10.

## Not verifiable

- `webster-nn`: settled as uncertified; 1.4's route is cited by locator only.
- `hormander-alpdo1`, Theorems 2.3.4–2.3.5: settled as uncertified.
- `griffiths-harris`, `raghunathan-discrete-subgroups`, `koszul-malgrange`, `nomizu-nilmanifolds`: settled as uncertified; Nomizu's theorem was read in the form of `angella-iwasawa` line 256, Raghunathan's two statements as quoted at `sakane-parallelisable` lines 112–113.
- `knutson-borel-weil` §1: the extraction has lost its formulas (lines 13–38); only the prose of the incidence picture was compared.

## Source issues

- none

## For the human reviewers

- **Licence.** `knutson-borel-weil` and `rainer-advanced-complex-analysis` are unpublished lecture notes read from their authors' university pages; `ballmann-kahler` is read from a third party's course page (people.maths.ox.ac.uk), not the publisher's or the author's.
