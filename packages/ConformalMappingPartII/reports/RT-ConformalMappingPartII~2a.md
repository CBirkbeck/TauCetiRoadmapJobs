<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/132#issuecomment-6333584336 -->
Red team round 2 pass a (codex) of 3620f39

Verdict: needs_changes

1. **F01** (P2) Schwarzian chain rule puts holomorphy at the wrong point

   **Location:** `packages/ConformalMappingPartII/README.md:401`: “For holomorphic f,g near x”.

   **Claim:** Holomorphy of both functions near x, together with the two nonzero first derivatives, suffices for the displayed chain rule.

   **Witness:** Take x=0, g(z)=1+z+z²; set f(w)=w+conj(w−1)² when |w−1|<1/4, and f(w)=w otherwise. Then f′(1)=g′(0)=1, S(f∘g)(0)=S(f)(1)=0, but S(g)(0)=−6.

   Near 1, the totalized complex derivative of f is 1 at 1 and zero elsewhere; its second and third totalized derivatives vanish. The same holds for f∘g near zero. Thus this also witnesses the failure in the roadmap's chosen derivative convention. `packages/ConformalMappingPartII/Suggested.lean:199` already has the correct `AnalyticAt ℂ f (g x)` hypothesis.

   **Exact repair text:** “For g holomorphic near x and f holomorphic near g(x), with g′(x)≠0 and f′(g(x))≠0, S(f∘g)(x)=S(f)(g(x))g′(x)²+S(g)(x).” Keep the Lean signature unchanged.

2. **F02** (P1) Cusp comparison invokes an unsupplied metric uniqueness theorem

   **Location:** `packages/ConformalMappingPartII/README.md:352`: “pull back to the universal cover and use the uniqueness of the complete curvature −1 metric”.

   **Claim:** The cited finite-type metric contract and abstract Fuchsian cusp charts provide the metric comparison needed to prove cofiniteness and identify punctures.

   **Witness:** `TauCetiRoadmap/ComplexCurveModuli/README.md:50` supplies finite-area metrics on finite-type components. The pulled-back metric lives on the disc, whose complete curvature −1 metric has infinite area. Neither its general uniqueness nor complete pullback is in the cited contracts.

   The claim needs an additional input before cofiniteness has been proved; assuming that the disc-cover quotient already has the supplied finite area would be circular. An existing owner is available: `TauCetiRoadmap/RiemannianGeometry/README.md:666`–672 owns complete pullback metrics, and item R4.7 at line 717, especially lines 745–750, owns the complete simply connected space-form classification.

   **Exact repair text:** “Consume RiemannianGeometry R4.3 for completeness and curvature of the metric pulled back through the native universal cover, and R4.7 for Killing–Hopf classification. Prove `FinitePuncturedCover.metricComparison`: the pullback of ComplexCurveModuli D0.4's complete curvature −1 metric through a holomorphic universal disc cover equals the standard metric 4|dz|²/(1−|z|²)². Choose the classification isometry with positive orientation; its conformality makes it a holomorphic disc automorphism, which preserves the standard metric by ConformalMapping L2. Descend this equality before transferring finite area and identifying cusp ends.” Add R4.3 and R4.7 to the exact supplier contracts and this target's Needs line; retain the existing finite-puncture conclusions.

3. **F03** (P2) The repair re-owns the native cover's manifold topology

   **Location:** `packages/ConformalMappingPartII/README.md:215`: “Establish Hausdorffness and second countability there … this topological verification is included in `PointedCover.exists_cover`.”

   **Claim:** This roadmap constructs these general native universal-cover properties as part of its existence theorem.

   **Witness:** `TauCetiRoadmap/RiemannianGeometry/README.md:670`–672 already owns the native carrier's lifted smooth atlas, Hausdorffness, countable-sheet argument and second countability, before its curvature applications. These apply to the underlying real manifold of every connected plane domain.

   **Exact repair text:** “Consume RiemannianGeometry R4.3's Hausdorffness and second-countability theorem for the native based-path universal-cover manifold. For Ω⊆ℂ, compare its underlying real atlas with the complex charted-space instance already imported here; both are pulled back from the same plane charts. These supplied topological properties discharge the standing hypotheses of `SurfaceUniformization.noncompactCoordinate`.” Add RiemannianGeometry R4.3 to the supplier contracts and §1.1 Needs; remove the separately owned countable-loop/countable-sheet proof.

4. **F04** (P2) Surface Perron targets omit the existing planar owner

   **Location:** `packages/ConformalMappingPartII/README.md:207`: “The proof owns its surface-analytic prerequisites at the same generality.”

   **Claim:** The new Perron, Dirichlet and Green-function construction starts without a supplier for their existing Euclidean theory.

   **Witness:** `TauCetiRoadmap/PDE/README.md:290`–301, Lane C items 12–15, already owns mean-value, maximum/Harnack principles, Green/Poisson kernels and Perron's Dirichlet construction with boundary barriers. The new targets include their dimension-two chart cases but never cite PDE.

   **Exact repair text:** “Consume PDE Lane C items 12–15 for the Euclidean harmonic/subharmonic, maximum/Harnack, Poisson and Perron/barrier theory. `SurfaceUniformization.perron` transports that local theory through holomorphic charts and proves its surface-global envelope theorem. The surface Dirichlet and Green-function targets add chart compatibility, smooth-boundary barriers and the logarithmic-pole construction on compact bordered Riemann surfaces; their plane specializations agree with PDE's constructions.” Add this supplier contract and separate Needs lines for the Perron, Dirichlet and Green-function targets. Keep the full surface generality.

5. **F05** (P2) The cusp repair introduces an explicit forward dependency

   **Location:** `packages/ConformalMappingPartII/README.md:297`: “*Needs:* Layer 1, `FinitePuncturedCover.cuspComparison` (§1.12)”.

   **Claim:** The listed order builds the normalized roots covering and its cusp limit before the projective-deck and finite-puncture comparisons it consumes.

   **Witness:** §1.6 consumes §1.12, which consumes §1.11. These occur at lines 279, 348 and 341 respectively. §1.11 only needs the earlier general cover theory, so it can precede the roots specialization without a cycle.

   **Exact repair text:** “Build the general projective deck realization and `FinitePuncturedCover.cuspComparison` immediately after §1.5, before the normalized roots-of-unity covering. Renumber the following subsections and update all references to the cusp comparison.” Separate the general existence/uniqueness dependencies from the cusp-limit dependency when updating the roots-cover Needs lines.

6. **F06** (P3) The committed change includes a file outside the package

   **Location:** `merge-order/ORDER.txt:148`: “ConformalMappingPartII”.

   **Claim:** The package pull request changes only its own folder.

   **Witness:** `git diff --stat origin/main...HEAD` lists `merge-order/ORDER.txt | 1 +`; its patch appends `ConformalMappingPartII`. The repair report's statement that the file was already dirty does not remove this committed change.

   **Exact repair text:** “Exclude `merge-order/ORDER.txt` from the package pull request's diff. Preserve the accepted merge-order registration through a separate board/intake change.” No order file was edited in this review.

## Verified sound

Read all 1,164 README lines and all 499 Lean lines. The inventory contains 75 declarations: 3 structures, 13 definitions, 44 theorem targets and 15 proved examples. All 60 named declarations occur in the README. There are 96 numbered target subsections; the tables below also cover their APIs, the six surface-construction targets, supplier agreements and conventions. The 24 Checks blocks contain 78 individual Checks. Each was tested mathematically, including the named boundary targets replacing admitted examples. This is a source and mathematical review, not a Lean build.

The single import is Mathlib. There are no section variable/include assumptions to disappear from admitted declarations, no admitted data or examples, no set_option, no lemma, and no placeholder propositions. The 15 examples each exercise a retained definition, with at most two per definition. Named scalar boundary theorems have matching README descriptions. Heavy geometric constructions remain README targets; the easy general covering-existence, exact-radius and mean-growth headlines are present.

The Little Picard contract is precise and present under the same gap:little-picard slug in the README and design/plan.json, naming ModularForms Layer 10. Its absence from the supplier is accepted conditionally under the brief. None of S01–S06 re-raises that settled omission.

**Earlier findings, checked individually through the repair report's alias map.** Locations in this table are in packages/ConformalMappingPartII/ unless a supplier is named. Each quoted passage is from the reviewed head. The 21 rows account for all 29 original findings; merged rows explicitly list both original IDs.

| Repair / original finding(s) | Status | Repaired passage and witness |
|---|---|---|
| F01 / r1a-F01, r1b-F02 | Repaired | Suggested.lean:79: “E.initialJet (fun z ↦ z ^ 2) 0 2 = 2 := by”. All 15 example bodies are actual proofs; admissions occur only in the 44 theorem declarations. Kernel validation remains unperformed. |
| F02 / r1a-F02, r1b-F01 | Repaired | README.md:252: “conformalRadius.eq_classical”. The contract at line 91 consumes ClassicalArithmeticCompletion §6.20; that supplier's lines 12529–12542 give the proper simply connected radius and its APIs. The covering extension retains its separate domain of interpretation. |
| F03 / r1a-F03, r1b-F07 | Repaired | README.md:15: “Mathlib/Analysis/SpecialFunctions/Integrability/Log.lean”. This and PosLog.lean contain MeromorphicOn.circleIntegrable_log_norm (line 122) and circleIntegrable_posLog_norm (line 65). |
| F04 / r1a-F04, r1b-F03 | Repaired | README.md:132: “LinearEquation.orderTwo_affine”. Literal comparison of all 60 named declarations against the README finds none missing, including the 17 previously absent names. |
| F05 / r1a-F05 | Repaired | README.md:215: “The general domain may have infinitely many complementary components.” Suggested.lean:112 has open/connected/pointed hypotheses and two distinct omitted points, without finite-connectivity restriction. |
| F06 / r1a-F06 | Repaired | Suggested.lean:287: “theorem gauss_equation (a b c x : ℂ)”. Only c and the evaluation disc are restricted. Lines 294–305 include the entire terminating case and the polynomials 1 and 1−x. |
| F07 / r1a-F07 | Repaired conditionally | README.md:97: “What ModularForms must provide (gap:little-picard)”. The plan has the same slug and supplier. Lines 205–207 own the noncompact coordinate and its analytic construction targets. The settled supplier-gap reason is valid. New ownership issues are S03–S04. |
| F08 / r1a-F08, r1b-F14 | Partly repaired | README.md:350: “FinitePuncturedCover.cuspComparison”. The comparison now owns cofiniteness, puncture/cusp matching and the nonzero primitive-q coefficient, using ComplexCurveModuli D0.4. An additional metric input is missing (S02), and its use precedes its construction (S05). |
| F09 / r1a-F09, r1b-F06 | Repaired | README.md:129: “TeschlODE, §1.2, equation (1.18), p.7”. Its companion formula and Theorem 4.7 support the linear ODE construction: TeschlODE lines 438–444 and 6243–6254. Extremality cites the lifted Schwarz argument at lines 271 and 277. |
| F10 / r1a-F10, r1b-F13 | Repaired | Suggested.lean:244: “blaschkeFactor 1 z = -1 ∧ blaschkeFactor (-1) z = 1”. Constant counting, characteristic, pivot-zero and ODE controls have proved examples; inverse Schwarzian and disconnected-cover controls have named theorem targets. Native-only calculations remain supplier agreements. |
| F11 / r1a-F11 | Repaired | sources.toml:1: “schema = "tauceti-roadmap-sources/v1"”. Eleven unique records cover the cited works/sections; DLMF replaces the unavailable redundant handbook. The settled Hem88 and KR16 access limits are retained. |
| F12 / r1a-F12 | Repaired | README.md:969: “t^N=1−exp(−MN)/2”. For M>0 this gives 0<t<1 and a strict small-value witness; surjectivity supplies its preimage. ExceptionalCuspSet.nonempty at Lean line 441 mirrors it. |
| F13 / r1a-F13 | Repaired | README.md:423: “(5.1.13), p.670”. Sum rules, symmetric coefficients and three-mean comparison cite the corrected CDT locations, respectively CDT-journal lines 2514, 2537 and 3221–3243. |
| F14 / r1a-F14, r1b-F05 | Repaired | Suggested.lean:1: “import Mathlib”. This is the entire import list; the unused Tau Ceti import is gone. |
| F15 / r1a-F15 | Repaired | README.md:93: “holomorphic linear-system and scalar initial-value theorems on discs”. DiophantineApproximationAndTranscendence §5.1, lines 2960–2964, owns these with the evaluation equivalence. Layer 0 keeps adapters and global continuation. |
| F16 / r1b-F04 | Repaired | Suggested.lean:420: “scalarSpike 0 = 2”. All 15 remaining examples test roadmap definitions, at most two per definition; library-only examples and the closing name catalogue are absent. |
| F17 / r1b-F08 | Repaired | README.md:7: “L2” / “L3” / “L4”. Links point to the actual ConformalMapping README and identify its Layers-list items, rather than nonexistent heading fragments. |
| F18 / r1b-F09 | Repaired | README.md:81: “These inputs are consumed from the pinned Tau Ceti modules named above.” The temporal ownership-deferral wording is absent. |
| F19 / r1b-F10 | Repaired | README.md:89: “Subgroup.isFundamentalDomain_dirichletDomain”. Rotation classification, covolume, cusp data, horodisc invariance, Shimizu and area declarations also exist at the Tau Ceti pin. Root-family comparisons retain the additional work. |
| F20 / r1b-F11 | Repaired | README.md:379: “logDeriv (deriv f)”. The native pre-Schwarzian and TauCeti.logDeriv_deriv_comp are consumed. Its pinned file has the composition theorem at line 72, but no duplicate Schwarzian block. |
| F21 / r1b-F12 | Repaired | README.md:310: “rotation (-Real.pi / N)”. For N=3 and τ=2i the matrix gives inverse-Cayley value −1/6−i√3/6. CDT-journal lines 2357–2364 have the inconsistent positive-root label; it was not copied. |

**Dependency and ownership checks.** Inspected ConformalMapping L1–L4, UniversalCovers Stages 0–2, DifferentialGeometry §2.3, FuchsianOrbifolds Layers 0, 2, 3 and 4, ClassicalArithmeticCompletion §6.20, DiophantineApproximationAndTranscendence §5.1 and ComplexCurveModuli D0.4, and checked the missing Little Picard export in ModularForms Layer 10: 16 section contracts including the gap. The seven supplied open-head folders were searched by mathematical object; none is cited directly by this package. Ordinary Gauss hypergeometric functions are distinct from QSeriesPartitionsAndMockModularForms' basic q-series. ArithmeticDynamics' Green functions and conformal-radius estimates do not own these covering constructions. The other five supplied heads showed no competing owner of a package target.

The mechanical dependency check on the reviewed README, with the supplied order, exited successfully:

    depcheck: 8 roadmaps, 49 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The check does not detect S02–S05: missing owners and internal target order require manual checks. No notion needs moving from a later roadmap. The proposed RiemannianGeometry and PDE imports are existing main-branch roadmaps.

Object-level searches at both library pins confirmed the imported local divisor, circle-average, meromorphic-integrability, native hypergeometric, Gamma/digamma, lifted-cover, root-power-descent, pre-Schwarzian, disc-rotation, cusp, Shimizu and area interfaces. In particular, divisor_fun_pow carries genuine meromorphicity; root-power descent needs a nonzero exponent and an open analytic domain, with scalar ℂ supplying completeness; Herglotz's imaginary constant vanishes after L(0)=0. These hypotheses are supplied at their stated uses.

**Complete Lean inventory and binder audit.** All rows refer to packages/ConformalMappingPartII/Suggested.lean. The namespace is TauCetiRoadmap.ConformalMappingPartII; every declaration is in the noncomputable section, with no ambient variable or instance block. ℂ, ℝ and their subtypes use their native instances. “E” carries positive order, an open connected domain and analytic coefficients; “F:RootsCover N” carries N≥2 and a positive real derivative. Every additional guard below is in the declaration itself. An example is identified by its line number.

| Line / section | Declaration | Actual context / adversarial test |
|---|---|---|
| 26 / 0.1 | LinearEquation | Ω:Set ℂ, n:ℕ; n=0 impossible; zero coefficients at n=1,2 permitted. |
| 34 / 0.1 | LinearEquation.initialJet | E,y,x; Fin n, unscaled derivatives; z² has second jet 2. |
| 39 / 0.1 | LinearEquation.IsSolution | E,y; analyticity and the equation, not just either condition. |
| 47 / 0.2 | LinearEquation.initial_value | E,x∈Ω, arbitrary Fin n jet; uniqueness is eventual equality, not equality outside Ω. |
| 59 / 0.4 | LinearEquation.global_initial_value | E, explicit SimplyConnectedSpace Ω, x∈Ω, jet; uniqueness is EqOn Ω. |
| 66 / 0.1 | LinearEquation.orderOne_constants | E of order 1, coefficient zero on Ω, solution y; constants and zero pass. |
| 72 / 0.2 | LinearEquation.orderTwo_affine | E of order 2, all coefficients zero, solution y; affine family and derivative jet agree. |
| 78 / 0.2 | example | E of order 3; z² at zero yields second derivative 2. |
| 84 / 0.1 | example | E of order 1, coefficient one, explicit point in Ω; exp(−z) passes, 1 fails. |
| 101 / 1.2 | PointedCover | Ω,a; analytic scalar realization, based value, genuine subtype covering and surjectivity; square map fails. |
| 112 / 1.1 | PointedCover.exists_cover | Open connected Ω, a∈Ω, two distinct omitted values; includes infinitely connected domains. |
| 120 / 1.3 | conformalRadius | Arbitrary Ω,a, infimum of derivative norms; geometric claims only where a cover exists. |
| 125 / 1.4 | PointedCover.extremal | F, open Ω, analytic based disc map f; lift, norm bound and rotation equality; constant f is allowed. |
| 141 / 1.2 | PointedCover.identity_exists | Unit disc and base zero; identity exists. |
| 145 / 1.2 | PointedCover.square_not_cover | Unit disc; critical point at zero forbids z². |
| 149 / 1.3 | conformalRadius.unitDisc | Unit disc, base zero; radius 1. |
| 152 / 1.3 | conformalRadius.radiusTwo | Radius-two ball, base zero; radius 2, not its reciprocal. |
| 156 / 1.6 | RootsCover | N:ℕ, extends pointed roots cover; N≥2 and derivative orientation are actual fields. |
| 162 / 1.6 | RootsCover.exists_cover | N≥2 explicitly; N=1 excluded. |
| 166 / 1.9–1.10 | RootsCover.power_descent | F; analytic G, G(0)=0, omitted value 1, factorization and derivative, uniqueness on disc. |
| 176 / 1.6 | RootsCover.realRadialLimit | F; limit within real t<1, enough near 1 to lie in disc; never equality at a finite disc point. |
| 181 / 1.6 | RootsCover.quarterTurn | F; derivative rotates by i, so loses positive-real normalization. |
| 186 / 1.2 | PointedCover.disconnected_not_cover | Specified disjoint two-ball target; connected image cannot be surjective. |
| 193 / 2.1 | schwarzian | Totalized complex derivatives and division; analytic meaning requires f′≠0. |
| 198 / 2.2 | schwarzian_comp_apply | f analytic at g(x), g analytic at x, both first derivatives nonzero; correctly typed, README needs S01. |
| 205 / 2.8 | roots_inverse_schwarzian | F, x not a root, analytic inverse germ w, local inverse identity, w(x) in disc; excludes fake inverse data. |
| 212 / 2.1 | example | Affine map 2z+1; Schwarzian zero. |
| 219 / 2.1 | example | z² at x≠0; Schwarzian −3/(2x²). |
| 226 / 2.1 | schwarzian.inverse | x≠0; Schwarzian of 1/z vanishes. |
| 232 / 3.1 | blaschkeFactor | Arbitrary a,z; special boundary branch −a removes the boundary 0/0. |
| 236 / 3.2 | finiteBlaschke | Fin k factors, natural multiplicities; k=0 and multiplicity zero give 1. |
| 240 / 3.1 | example | a=0; factor is z. |
| 244 / 3.1 | example | a=±1; factors ∓1 including at their former singular points. |
| 248 / 3.2 | example | Empty product 1 and boundary factor at 1 equal −1. |
| 254 / 3.2 | example | One zero at 0 of multiplicity 2 gives z². |
| 259 / 3.4 | herglotz_log | R>0, analytic on closed ball, zero-free there, g(0)=1; evaluation strictly inside R. |
| 269 / 3.8 | quotient_representation | Analytic near closed unit disc, ε>0; h(0)=1; zero g allowed under totalized logarithms. |
| 279 / 4.4 | inverseRatio | N:ℕ, u:ℂ, totalized native series quotient; only germ claims for N≥2. |
| 287 / 4.1 | gauss_equation | Arbitrary a,b; c avoids nonpositive integers, norm x<1; a=0 and a=−1 retained. |
| 294 / 4.1 | gauss_equation_terminating | Same c guard, either numerator a nonpositive integer, arbitrary x; polynomial identity global. |
| 302 / 4.1 | gauss_terminating_checks | Arbitrary x; native terminating series give 1 and 1−x. |
| 307 / 4.5 | inverseRatio.cover_inverse | F; analytic germ and both eventual inverse compositions; prefactor is reciprocal of F′(0). |
| 313 / 4.4 | inverseRatio.levelTwo_initial | N=2; value 0, derivative 1. |
| 316 / 4.4 | example | N≥2; inverseRatio N 0=0. |
| 321 / 4.4 | inverseRatio.levelTwo_cubic | N=2; coefficient 1/4 becomes third derivative 3/2. |
| 326 / 5.1 | gammaRadius | N:ℕ; totalized real Gamma expression, geometric scope N≥2. |
| 333 / 5.5 | roots_conformal_radius | N≥2, arbitrary PointedCover of roots complement; derivative norm independent of orientation. |
| 340 / 5.8 | gammaRadius.positive_expansion | Absolute C>0, all N≥2, 0<E≤C/N⁶; ζ(3),ζ(5) real parts agree with real positive values. |
| 347 / 5.1 | gammaRadius.smallLevels | N=2,3; reflection/duplication yield the stated values. |
| 351 / 5.1 | example | N=1; Gamma at zero is totalized to zero, not a positive covering radius. |
| 358 / 6.7 | half_rotation_involution | F,z in disc; Fⁿ−1 nonzero; positive half-turn gives the same power identity as the negative half-turn. |
| 367 / 7.1 | discCounting | Arbitrary f,r; local divisor on closed ball; at zero the separate D(0)log r term is essential. |
| 373 / 7.2 | discCharacteristic | Arbitrary f,r; native proximity plus local count, without fabricated global meromorphicity. |
| 378 / 7.4 | discCounting.zero_iff | f meromorphic on disc, centre order≥0, 0<r<1; conclusion concerns open ball and germ orders. |
| 384 / 7.8 | local_first_main_translation | f meromorphic on disc, order(f−a,0)≠top, 0<r<1; trailing coefficient, not assigned centre value. |
| 392 / 7.1 | example | Any constant c and real r; no poles, count zero. |
| 396 / 7.2 | example | Any constant c,r; characteristic posLog norm c, including c=0. |
| 401 / 7.1 | discCounting.centrePole | 0<r<1; f=1/z gives log r<0. |
| 405 / 7.1 | discCounting.boundaryPole | a≠0, norm a<1; radius norm a puts the pole exactly at zero weight. |
| 409 / 7.2 | discCharacteristic.identity | 0<r<1; f=z has characteristic zero. |
| 413 / 7.2 | discCharacteristic.centrePole | 0<r<1; f=1/z has cancelling proximity and negative count. |
| 417 / 7.4 | scalarSpike | Value 2 at zero, 1 otherwise; punctured-germ information cannot recover assigned value. |
| 420 / 7.4 | example | Actual values distinguish the discontinuous representative from constant 1. |
| 424 / 7.4 | scalarSpike.removable_not_continuous | 0<r<1; globally meromorphic, all orders zero, count zero, not continuous/analytic at zero. |
| 432 / 8.5 | ExceptionalCuspSet | F,M:ℝ; disc intersected with strict small-value inequality; M>0 only in its geometric theorems. |
| 436 / 8.5 | ExceptionalCuspSet.zero_not_mem | F,M>0; at zero the norm is 1>exp(−MN). |
| 441 / 8.5 | ExceptionalCuspSet.nonempty | F,M>0; tⁿ=1−exp(−MN)/2 gives a permitted target and hence a preimage. |
| 445 / 8.5 | ExceptionalCuspSet.rotated_large | F,M>0,z in disc, exp M+1<norm F(z); z in rotated set but not the original set. |
| 452 / 8.7 | large_n_max_growth | Absolute C,N₀, N≥N₀≥2, arbitrary pointed roots cover, 0<r<1; pointwise circle bound. |
| 460 / 9.7 | pivotMap | N:ℕ,x:ℂ; totalized xⁿ/(xⁿ−1), analytic pole retained at roots. |
| 463 / 9.7 | example | N=2,x=2; pivot 4/3. |
| 467 / 9.7 | example | N≥2; assigned values at 0 and 1 both zero for different reasons. |
| 472 / 9.7 | pivotMap.levelTwo_pole | Assigned value at 1 zero but meromorphic order −1. |
| 477 / 9.4 | normalized_log_derivative | R>0, g analytic and zero-free on closed ball, g(0)=1, 0<r<R; all denominators protected. |
| 488 / 9.19 | uniform_mean_growth | Absolute C>0, all N≥2, arbitrary pointed roots cover, 0<r<1; three stated means, log argument>1. |

**Adversarial mathematics table.** Each numbered row covers the whole subsection, including its named APIs and all of its Checks. The further rows cover conventions and construction targets not isolated as numbered subsections. “Retain” means no defect found in the stated mathematics; it does not assert that a future proof has been formalized. Complex scalar coefficients make prime-characteristic, ramification, zero-ring and scheme-flatness tests inapplicable. The relevant replacements are zero order, empty/ disconnected domains, trivial deck groups, small levels, poles, removable representatives, boundary radii and normalization changes.

| Statement / README subsection | Instances tried | Result | Change |
|---|---|---|---|
| Cayley convention and native atlas | z=0,1/2,1; disc and annulus covers; overlapping sheets | C(0)=i, C(1/2)=3i, boundary denominator zero; disc projection invertible, annulus projection not; identity transitions | Retain; native objects imported |
| Derivative, area and projective conventions | z²; constant integrand 1; lifts A and −A | Second jet 2; circle mean 1; same projective action | Retain |
| Primitive cusp coordinate | Width w and improper width 2w | Primitive q gives nonzero linear term; replacement introduces a power/root rather than a coordinate | Retain primitive-full-stabilizer requirement |
| 0.1 Equation, solution, jet, companion | n=0,1,2,3; y=0,1,exp(−z),z²; vector (0,1) | n=0 excluded; exp(−z) passes coefficient-one equation, 1 fails; second jet 2; wrong vector fails companion system | Retain |
| 0.2 Initial jet/germ equivalence | y″=0, jets (u,v); zero jet | u+v(z−x₀); zero solution; uniqueness only as germs | Retain supplier comparison |
| 0.3 Continuation | Constant equation; loop around a singularity | Continuation along nonsingular paths; path homotopy matters | Retain |
| 0.4 Global solutions and dimension | Disc, plane, punctured plane; first/second order | Global jet equivalence in simply connected case; puncture invalidates unconditional path independence | Retain explicit simple connectivity |
| 0.5 Meromorphic-basis monodromy | Ordinary point; c/z; exp(1/z) | Pole bounds 0,1; identity monodromy alone permits essential singularity | Retain full-basis and regularity distinctions |
| 0.6 Simultaneous pole clearing | p regular and nonconstant; several algebraic images | Positive vanishing orders multiply; finite maximum pole bound and minimal-polynomial powers clear poles | Retain; constant p excluded |
| 1.1 Noncompact coordinate and general cover | Plane, disc, sphere, twice-punctured plane, infinitely connected domain | Plane/disc coordinates; sphere excluded; two omissions exclude plane alternative conditional on Picard | S03–S04 ownership; accepted declared gap |
| 1.2 Pointed-cover APIs | Identity, z², disconnected two-ball target; phase rotation | Identity passes, z² ramifies, disconnected target impossible; two based covers differ by rotation | Retain |
| 1.3 Radius and classical comparison | Radius-one/two balls; domain-to-disc map z/2; once-punctured plane | Radii 1,2; inverse derivative gives 2; no eligible hyperbolic interpretation for punctured plane | Retain supplier comparison and totalization boundary |
| 1.4 Extremality | Constant map; identity lift; strict contraction | Constant strictly below positive cover radius; equality forces rotation | Retain |
| 1.5 Monotonicity | Equal domains; nested concentric discs | Equality for same domain, strict scale increase in disc example | Retain |
| 1.6 Normalized roots cover and cusp limit | N=1,2; source quarter-turn; real t approaching 1 | N=1 excluded; phase condition selects cover; radial limit not an attained omitted value | S05 order; cusp input subject to S02 |
| 1.7 Nonzero derivative | z² versus a genuine cover | Ramification prevents covering; holomorphic covering is locally biholomorphic | Retain |
| 1.8 Equivariance and matrix | N=2,3; τ=i,2i; A and −A | Origin fixed; displayed matrix is inverse root rotation; sign independent of lift | Retain corrected sign |
| 1.9 Power descent and ramification | u=0; nonzero lifts of zero; root rotation | Descended derivative nonzero at selected origin; other zero lifts give local degree N; no global-cover overclaim | Retain |
| 1.10 Descended derivative | F(z)=az+O(z²) | F(z)ⁿ=aⁿzⁿ+… implies G′(0)=aⁿ | Retain |
| 1.11 Projective deck realization | Identity deck map; two SL₂ lifts; finite stabilizer | Effective projective subgroup, free action, no central-kernel stabilizers | Move earlier under S05 |
| 1.12 Finite puncture/cusp comparison | Three punctures; infinity; proper-power q | Infinity counted as puncture; primitive q needed for linear leading coefficient; cusp Schwarzian coefficient 1/2 | S02 missing metric input; S05 order |
| 2.1 Schwarzian and pre-Schwarzian API | Affine, square, inverse; f′=0 | Values 0,−3/(2z²),0 away from poles/critical points; totalized value at critical point is not geometric invariant | Retain guards |
| 2.2 Chain rule | f analytic near x but not g(x); g=1+z+z² | Explicit S01 counterexample; Lean has correct base point | S01 |
| 2.3 Möbius invariance | Translation, scaling, inversion | All have zero Schwarzian on their holomorphic noncritical domains | Retain |
| 2.4 Schwarzian/ODE correspondence | w=z and w=1/z on admissible patches | Square-root pair solves y″+(S(w)/2)y=0; ratio recovers w; branch choice local | Retain |
| 2.5 Accessory expansion | One puncture chart, infinity unpunctured | Leading 1/(2(z−p)²); infinity imposes decay through order z⁻³ | Retain; proof depends on repaired cusp comparison |
| 2.6 Accessory sum rules | Expand each term at infinity | Coefficients of z⁻¹,z⁻²,z⁻³ give exactly the three displayed sums | Retain |
| 2.7 Symmetric accessory coefficients | N=2,3; root sums | m₀=0 and m_k=−(N+1)ζ⁻ᵏ/(2N) satisfy the constraints for N+1 finite punctures | Retain |
| 2.8 Roots inverse Schwarzian | N=2,x=0; approach simple root; x=∞ | Value 3/2 at 0 for N=2; double-pole coefficient 1/2; decay compatible with puncture at infinity | Retain |
| 2.9 Inverse second-order equation | Divide by 4(xⁿ−1)² on puncture complement | Coefficient is one half of the inverse Schwarzian, with correct sign | Retain |
| 3.1 Boundary-extended Blaschke factor | a=0,1,−1; interior a; boundary z=a | z,−1,1; no denominator zero for interior parameter on closed disc; boundary branch removes 0/0 | Retain |
| 3.2 Finite products | Empty family, zero multiplicity, repeated zero, boundary parameter | 1,1,z² and constant unit phase; multiplicities add | Retain |
| 3.3 Interior-zero removal | g=z², g=1−z, nonzero constant | Removes interior zero; boundary zero remains; no false closed-disc zero-free claim | Retain |
| 3.4 Normalized Herglotz log | g=1, exp(az); g with a zero | L=0,az; zero-free hypothesis necessary; L(0)=0 fixes imaginary constant | Retain |
| 3.5 Differentiated Herglotz kernel | z=0; constant boundary data | Derivative kernel 2w/(w−z)²; zero for constant normalized log | Retain factor 2 |
| 3.6 Outer representation and phase | G=i; G positive constant; interior point | Phase G(0)/norm G(0) necessary; positive constant needs phase 1 | Retain |
| 3.7 Radial smoothing | Constant g; zero on unit circle; δ decreasing to 0 | Closed-disc extension gains ε through continuity; zeros do not invalidate log integrability | Retain |
| 3.8 Quotient representation | g=0,1; g constant of norm>1 | h=1 handles basic cases; two logarithmic bounds agree with proximity and ε | Retain |
| 3.9 Optimality | Constant norm>1; both factors controlled and h(0)=1 | Jensen bounds force the mean lower bound; no arbitrary improvement | Retain |
| 4.1 Gauss equation | a=0; a=−1,b=c=1; c=0 | Functions 1 and 1−x satisfy equation globally; c=0 excluded | Retain repaired generality |
| 4.2 Transformed equation | Chain rule x↦xⁿ at N=2; x=0 | Powers and first-derivative term match; singular expressions interpreted only on stated punctured domain before extension | Retain |
| 4.3 Two hypergeometric solutions | At x=0; Wronskian leading values | One even-power series starts at 1, other at x; independent | Retain |
| 4.4 InverseRatio API | N=2; x=0; first nontrivial coefficient | J₂(0)=0, J₂′(0)=1, cubic coefficient 1/4 | Retain |
| 4.5 Inverse matching | Differentiate both inverse compositions at zero | Prefactor 1/F′(0), not F′(0); analytic equality is germ-local | Retain |
| 4.6 Zero-balanced continuation | k=0; a=1/2; x positive approaching 0 | −log x−2γ−2ψ(a), Gamma normalization restored; log branch fixed | Retain corrected Euler sign |
| 4.7 Digamma bounds | k=1, a=1/4 and 3/4; k→∞ | Maximum ψ(2)−ψ(5/4) occurs at the lower endpoints; positive differences decrease to zero | Retain |
| 4.8 Uniform continuation tails | a in [1/4,3/4]; x→0 on stated slit sector | Parameters avoid poles; tails and parameter derivative O(x(1+abs log x)) | Retain compact parameter range |
| 5.1 Gamma radius API | N=1,2,3; N→∞ | Totalized N=1 zero; positive small-level values; limit 1 | Retain |
| 5.2 Positivity | N=2 versus N=1 | All Gamma arguments positive only in geometric range | Retain N≥2 |
| 5.3 Alternative formula | N=2,3 | Reflection/duplication preserve positive sign and give the stated quarter/sixth Gamma values | Retain |
| 5.4 Cusp inverse limit | Positive real x→1 | Logarithmic singularities cancel in the ratio; finite positive matching constant | Retain, conditional on S02 input |
| 5.5 Exact radius | Source phase rotation; pointed unnormalized cover | Derivative norm unchanged; positive derivative only used to choose inverse branch | Retain full PointedCover statement |
| 5.6 Log-Gamma expansion | z=0; linear coefficient; abs z<1 | Constant 0, coefficient −γ, convergent zeta tail; no pole crossed | Retain |
| 5.7 Odd-zeta radius series | Combine ±1/N and ±1/(2N) | Linear term log16/N; even powers cancel; cubic ζ(3)/2 and quintic 3ζ(5)/8 | Retain |
| 5.8 Positive remainder | N=2 and large N | Exponentiation gives positive N⁻⁶ term, remainder uniformly bounded after compact tail estimate | Retain |
| 6.1 Ideal polygon/domain comparison | N=2 ideal quadrilateral; free centre | Area 2π; native Dirichlet domain includes finite sides but no ideal points | Retain |
| 6.2 Cusp width | N=2; scaling cusp coordinate | Width 2cot(π/4)=2; scaling rescales width and q consistently | Retain primitive normalization |
| 6.3 Deck free group | N=2; loop relation on sphere with N+1 punctures | Free rank N, not N+1; relation eliminates infinity loop | Retain |
| 6.4 Power stabilizer | N=2 and root rotation of exact order N | Quotient index N; origin stabilizer cyclic order N | Retain |
| 6.5 Full invariance group | Equal values of Fⁿ; lift differing by a root phase | Deck transformations and root rotation account for all possibilities | Retain |
| 6.6 Quadrilateral area | N=2; N→∞ | π and limit 2π; equals deck area divided by N | Retain |
| 6.7 Half-rotation inversion | z=0; apply half-turn twice | F(0)ⁿ=0 transforms to zero; Möbius involution squares to identity on Fⁿ | Retain both half-turn signs |
| 6.8 Triangle overgroup | N=2; index two | Orientation-preserving triangle group, area π/2 at N=2; half quadrilateral area | Retain |
| 7.1 Local pole count | Constants, 1/z, 1/(z−a) with r=norm a | Zero, log r, zero boundary weight | Retain centre correction |
| 7.2 Local characteristic | Constants 0,1,2; z and 1/z | posLog norm c; z and 1/z have T=0 for r<1 | Retain |
| 7.3 Positivity at regular centre | Constant; centre pole | Nonnegative when no centre pole; raw count can be negative at centre pole | Retain centre hypothesis |
| 7.4 Vanishing criterion | Boundary pole; scalarSpike; centre pole | Open-ball germ criterion valid; no continuity conclusion; centre guard necessary | Retain |
| 7.5 Jensen formula | f=z,1/z; removable representative | Order times log r and trailing coefficient reproduce mean; assigned centre value is irrelevant | Retain |
| 7.6 Inversion | f=azᵏ; f=0 | Difference log norm a; identically zero excluded by finite-order condition | Retain |
| 7.7 Translation proximity | Constant f,a; a=0 | Error posLog norm a+log2 valid including totalized zero | Retain |
| 7.8 Local first main theorem | f=z,a=0; f=1/z; f≡a | Trailing coefficients correct; f≡a excluded by order=top | Retain |
| 7.9 Power laws | n=0,1,2; centre pole | n=0 gives constant 1 and zero; order/count scale, negative centre term included | Retain |
| 7.10 Radial monotonicity | Constants; z; 1/z | Constant characteristic, zero examples; crossing a pole begins nonnegative log(r/norm a) contribution | Retain |
| 8.1 Uniform cusp asymptotic | Positive x→0; N→∞ | Euler sign −2γ agrees with continuation; compact parameter interval avoids degeneration | Retain |
| 8.2 Height lower bound | N=2 excluded if below threshold; M≥M₀ | Estimate is asserted only in quantitative range and chosen quadrilateral, not all translates | Retain |
| 8.3 Horoball image | a=1,c=0; varying D>0 | Tangency 1, diameter 2/(1+D); general a²+c² dependence invariant under lift sign | Retain |
| 8.4 Shimizu transport | c=0; c≠0; full versus deck stabilizer | c=0 handled by full stabilizer; height separation for other cosets uses Φ_N | Retain |
| 8.5 Exceptional set APIs | z=0; explicit positive preimage; large F(z) | Zero excluded; set nonempty; large values detected only after half rotation | Retain |
| 8.6 Circle exclusion | M=N/(1−r), r→0 and r→1 | Diameter A(1−r)/N smaller than 1−r for N>A; uniform in r | Retain large-level guard |
| 8.7 Maximum growth | Arbitrary phase of cover; 0<r<1 | Supremum unchanged by source rotation; constant scales as N/(1−r) | Retain |
| 9.1 Kernel mean | z=0; r<R | Mean 1/(R²−r²); at r=0 this is 1/R²; denominator positive | Retain |
| 9.2 L¹ logarithm | Normalized zero-free g=1,exp(az) | Mean log norm zero; positive/negative parts equal, factor 2 | Retain |
| 9.3 Entropy bound | Constant nonnegative input; input with zero set | Jensen/log concavity with zero mass treated separately; 1/e controls negative u log u | Retain |
| 9.4 Normalized log derivative | g=1 and exp(az); r<R | Zero derivative case respects posLog totalization; denominator R−r positive | Retain |
| 9.5 Radii choice | r≤1/4; r→1 | ρ=1/4 prevents log(1/r) loss; ρ<R=(1+r)/2<1 | Retain |
| 9.6 Apply to 1−Fⁿ | z=0; omitted values | Value 1 and zero-free on every interior closed disc; chain factor N retained | Retain |
| 9.7 Pivot API | x=0,1,2; N=2 | Values 0,0,4/3; root value is totalization of an analytic pole | Retain |
| 9.8 Partial fractions | N=2,x=0,2; approach a root | Sum identity has factor x/N; root residues agree; off-root guard necessary | Retain |
| 9.9 Logarithmic derivative chain | F(z)≈az near 0 | N F′Fⁿ⁻¹/(Fⁿ−1) has sign and power correct | Retain |
| 9.10 Pivot lower bound | r small; Fⁿ has zero at centre | Translation uses centre coefficient −1 of modulus 1; absolute log4 loss sufficient | Retain |
| 9.11 Fixed-level mean bound | N=2; r≤1/4 and r→1 | Boundary asymptotic alone insufficient; target explicitly requires effective all-radius constant | Retain additional proof obligation |
| 9.12 Three-mean equivalence | f=Fⁿ, f/(f−1),1/(f−1) near zero | All holomorphic on disc; inversion/translation losses bounded absolutely | Retain |
| 9.13 Omitted-one log derivative | f(0)=0; f omits 1 | Normalized function 1−f is nonzero with centre 1 | Retain |
| 9.14 Divisor of F′/F | Simple zero of F; F′ nowhere zero | Simple pole at each zero; no extra zero divisor from critical points | Retain |
| 9.15 Reciprocal derivative | Near zero F′(0)≠0; other simple zeros | Jensen compensation and divisor count use actual trailing terms | Retain |
| 9.16 Upper pivot estimate | N=2 and large N | Constants and log N losses remain controlled; no denominator at omitted root | Retain |
| 9.17 Large-level absorption | N beyond explicit threshold; r→0 | Choose coefficient less than N in characteristic inequality; log(N/(1−r))≥log2 | Retain |
| 9.18 Finite-level completion | Empty/small finite leftover set; N=2 | Maximum of finitely many effective constants, with positive floor if needed | Retain |
| 9.19 Uniform endpoint | N=2, arbitrary phase, r→0 and r→1 | Positive logarithmic bound for all three means; no global-meromorphic extension assumed | Retain |
| SurfaceUniformization.noncompactCoordinate | ℂ, disc, sphere | First two embed; compact sphere deliberately excluded | S03–S04 inputs |
| SurfaceUniformization.perron / Dirichlet input | Constant families; bounded disc; smooth boundary | Harmonic replacement/maximum closure essential; barriers supply boundary values | S04 earlier planar owner |
| SurfaceUniformization.greenFunction | Closed radius-R disc with pole 0 | log(R/abs z) positive inside, zero on boundary, regular part log R | S04 earlier planar owner |
| SurfaceUniformization.discEmbedding | Smooth closed disc; annulus | Disc qualifies; annulus fails simple connectivity | Retain |
| SurfaceUniformization.exhaustion | Plane and unit disc; sphere | Nested compact discs work; noncompactness essential | Retain |
| SurfaceUniformization.limitEmbedding | Normalized disc exhaustion; unnormalized shrinking embeddings | Normalization prevents constant limit; argument principle preserves injectivity | Retain |

**Source-locator audit.** The following 39 locator groups were checked against nine accessible source records. Repeated citations of the same formula are grouped, rather than counted repeatedly. The remaining two records are settled as stated under Not verifiable. Only source locators are recorded here, not source passages.

| Source / locator group | Read evidence | Scope and normalization checked |
|---|---|---|
| TeschlODE §1.2 (1.18), p.7 | TeschlODE lines 438–444 | Companion system uses successive derivatives, without factorial scaling. |
| TeschlODE §4.3 Theorem 4.7 and proof, p.130 | TeschlODE lines 6243–6254 | Complex linear IV theorem, continuation and simply connected global form. |
| Uniformization Theorem 1, p.2 | Uniformization lines 39–40 | Noncompact simply connected Riemann surface embeds biholomorphically into the plane. |
| Uniformization Theorem 6 / Appendix A, pp.4,11 | Uniformization lines 152–159 and 505–520 | Perron family closure and local boundedness, not arbitrary suprema of harmonic functions. |
| Uniformization Proposition 9 / Appendix B, pp.5–6,11–12 | Uniformization lines 213–251 and 521–570 | Boundary problem and logarithmic Green singularity; roadmap restricts to compact smooth bordered surface with nonempty boundary. |
| Uniformization Theorem 10, pp.6–8 | Uniformization lines 253–380 | Simply connected bordered-surface disc construction and noncritical map. |
| Uniformization Theorem 12, pp.8–10 | Uniformization lines 383–461 | Exhaustion by nested compact simply connected bordered subsurfaces. |
| Uniformization Lemma 13 / Appendix D, pp.10,13–14 | Uniformization lines 470–471 and 616–664 | Compactness of normalized univalent functions; normalization prevents constant limit. |
| Uniformization §7, pp.10–11 | Uniformization lines 462–503 | Diagonal embedding limit and injectivity argument. |
| McMullenRS Theorem 2.9, p.9 | McMullenRS lines 318–336 | Triply punctured sphere disc cover. Little Picard follows by lifting and Liouville; it is an inference, not this theorem's literal statement. |
| McMullenRS Theorem 17.1, p.157 | McMullenRS lines 5726–5727 | Background classification, distinguished from the sufficient noncompact-coordinate construction actually owned. |
| DLMF 15.10.1 | DLMF-15-10 lines 76–78 | Gauss equation signs and coefficients. |
| DLMF 15.8.10 | DLMF-15-8 lines 516–520 | m=0,b=a; coefficient ψ(k+1)−ψ(k+a), principal slit branch. |
| DLMF 15.2.2 | DLMF-15-2 lines 145–149 | Bold hypergeometric normalization divides by Γ(c); restore Γ(2a) in continuation. |
| DLMF 5.7.3 | DLMF-5-7 lines 127–132 | Log-Gamma Taylor coefficients after combining the elementary log(1+z) term. |
| DLMF 5.7.6 | DLMF-5-7 lines 252–256 | Reciprocal digamma series, monotone parameter differences away from poles. |
| CDT Corollary 2.0.5, p.636 | CDT-journal lines 479–509 | Full meromorphic basis and finite pole clearing; no converse from identity monodromy alone. |
| CDT Lemma 2.3.1 / Remark 2.3.3, pp.639–642 | CDT-journal lines 711–907 | Blaschke removal, Herglotz multiplier, ε from radial extension, optimality lower bound. |
| CDT Remark 5.0.1 / Definition 5.1.1, p.667 | CDT-journal lines 2316–2345 | Cayley direction and derivative normalization. |
| CDT (5.1.2)–(5.1.6), p.668 | CDT-journal lines 2357–2395 | Equivariance, inverse-rotation misprint, radius formula and stated expansion. |
| CDT Schwarzian equation (5.1.8), p.669 | CDT-journal lines 2416–2450 | Half-Schwarzian coefficient in second-order equation. |
| CDT (5.1.13)–(5.1.15), pp.670–671 | CDT-journal lines 2491–2551 | Accessory coefficients, infinity constraints and symmetry computation. |
| CDT Lemma 5.1.16, pp.671–672 | CDT-journal lines 2552–2651 | Power descent, inverse equation, two hypergeometric solutions and reciprocal prefactor. |
| CDT Lemma 5.1.20 and cusp limit, p.672 | CDT-journal lines 2654–2677 | Continuation and boundary matching, cross-checked with DLMF rather than retaining source misprints. |
| CDT radius proof and (5.1.24), p.673 | CDT-journal lines 2681–2779 | Gamma reflection/duplication, positive arguments, log expansion and small levels. |
| CDT §5.2, pp.674–675 | CDT-journal lines 2795–2863 | Ideal polygon, deck rank, power stabilizer, quadrilateral and triangle indices, involution. |
| CDT Lemma 5.2.9, pp.676–677 | CDT-journal lines 2870–2933 | Uniform cusp ratio and height estimate; corrected Euler sign and digamma index. |
| CDT transported horoballs, p.677 | CDT-journal lines 2939–2950 | Diameter 2/(1+D(a²+c²)) and tangency point. |
| CDT maximum-growth argument, p.678 | CDT-journal lines 2957–2985 | Full power stabilizer and rotated exceptional set are necessary; roadmap retains both corrections. |
| CDT §6 opening, pp.678–679 | CDT-journal lines 3003–3015 | Fixed-level asymptotics cited as input, without mistaking them for an effective all-radius bound. |
| CDT (6.1.1)–(6.1.6), pp.679–680 | CDT-journal lines 3030–3072 | Counting/proximity normalization, first main theorem and inversion constant. |
| CDT Lemma 6.1.7, p.680 | CDT-journal lines 3084–3125 | Zero-free normalized log derivative, Herglotz representation and constants. |
| CDT (6.1.12) and proof, pp.680–681 | CDT-journal lines 3126–3185 | Inverse-square kernel mean, factor two in L¹ log, entropy bound. |
| CDT §6.2.2 / (6.2.3), p.682 | CDT-journal lines 3221–3243 | Pivot lower bound and bounded difference between the three characteristics. |
| CDT Corollary 6.2.9, p.683 | CDT-journal lines 3253–3278 | Omitted-one logarithmic derivative and transfer to positive fixed inner radius. |
| CDT reciprocal-derivative proof, pp.683–684 | CDT-journal lines 3279–3359 and 3382–3419 | Actual zero/pole divisors and trailing constants; simple zeros of F. |
| CDT absorption and finite completion, p.684 | CDT-journal lines 3433–3444 | Large-N absorption plus finitely many small levels, with effectivity an additional explicit target. |
| CDT Theorem 6.0.1, p.679 | CDT-journal lines 3017–3026 | Uniform three-mean logarithmic endpoint. |
| Tsu52 Theorem 11, p.25 | Tsu52 lines 606–616; missing formula inspected using sources-service OCR | p≥3 punctures; characteristic asymptotic with coefficient 1/(p−2). This alone does not give the extra effective all-radius constant required by §9.11. |

The earlier source-access failure for Tsu52 was resolved by a legal publisher-archive fetch and service OCR. Its temporary missing-reference entry was removed; no outstanding source request remains. Hem88 and KR16 were not requested again.

**Final counts:** 75 Lean declarations read and inventoried; 96 numbered README targets plus their APIs and the six surface-construction targets read; 39 source-locator groups verified across nine accessible records; 78 Checks in 24 blocks tested; 16 named supplier-section contracts checked, including the declared gap; seven supplied open heads searched for overlap, with zero direct citations from this package. The six findings comprise one P1, four P2 and one P3.

## Not verifiable

- The 15 example proof scripts and elaborated declaration types were inspected statically but were not kernel-checked. The brief prohibits Lean builds and supplies no permitted elaboration command for this read-only pass. No Lean process was started.
- Hem88, Theorem 3.1 and Lemma 3.3, remains waived under the supplied source disposition. Its primary text was not read; the accessory computations were checked independently and against CDT-journal.
- KR16 remains uncertified under the supplied source disposition. No claim about the unread proof or its effective constants is certified here. Section 9.11 explicitly owns the strengthened effective all-radius estimate; proving that estimate is future library work.
- gap:little-picard is a declared conditional supplier contract, not an implemented export at the inspected ModularForms version. Its independent modular-uniformization proof remains the supplier's obligation.
- This review verifies statements and proof-plan inputs, not the future proofs of the 44 admitted theorem targets or the heavy README-only constructions. In particular, no numerical effective constants for the final estimates were constructed during this review.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3620f39f2c86f42199c396f94cd9c57b2fa5b200", "job": "RT-ConformalMappingPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
