<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/132#issuecomment-6312736228 -->
Red team round 1 pass a (codex) of f9d9ca6

Verdict: needs_changes

1. **F01** (P3) All examples are admitted

   Location: `packages/ConformalMappingPartII/Suggested.lean:66` and every subsequent `example`; e.g. line 79: `E.initialJet (fun z ↦ z ^ 2) 0 2 = 2 := by sorry`.

   Claim: The examples test the proposed definitions.

   Witness: Every example ends in `by sorry`, including the definitional finite-product tests at lines 213–225. None supplies a proved test.

   Exact repair text: “Keep at most two proved, discriminating examples per kept definition. Replace each retained example's admission by a proof. Move any unproved boundary assertion to a named theorem target and list that name, hypotheses and locator in README.md. Remove unrelated library-only examples.”

2. **F02** (P2) The existing conformal-radius owner is omitted

   Location: `packages/ConformalMappingPartII/README.md:214`, “The scalar `conformalRadius Ω a` can use the infimum”.

   Claim: Layer 1 introduces the radius and its Riemann-map, monotonicity and affine-change API without another radius owner.

   Witness: `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:12529` (§6.20) already defines the simply connected radius, with `conformalRadius_deriv`, `conformalRadius_mono` and `conformalRadius_affine`; its value outside eligible simply connected domains is zero.

   Exact repair text: “Import ClassicalArithmeticCompletion §6.20 for the simply connected conformal radius and its API. The radius here extends it to pointed hyperbolic domains via universal covers. Prove `conformalRadius.eq_classical` on proper simply connected open domains with the base point in the domain. Keep the two totalizations distinct outside that common domain.” Add that supplier to the contracts and the comparison to §1.3; do not redevelop the supplier's special case.

3. **F03** (P3) The logarithmic-integrability file locator does not exist at the pin

   Location: `packages/ConformalMappingPartII/README.md:15`, “in `Analysis.SpecialFunctions.Integrability.LogMeromorphic`”.

   Claim: Both integrability inputs reside in this Mathlib module.

   Witness: At Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, the declarations are in `Mathlib/Analysis/SpecialFunctions/Integrability/Log.lean:122` and `Mathlib/Analysis/SpecialFunctions/Integrability/PosLog.lean:65`; there is no `LogMeromorphic.lean`.

   Exact repair text: “Logarithmic circle integrability is supplied by `MeromorphicOn.circleIntegrable_log_norm` in `Mathlib/Analysis/SpecialFunctions/Integrability/Log.lean` and `MeromorphicOn.circleIntegrable_posLog_norm` in `Mathlib/Analysis/SpecialFunctions/Integrability/PosLog.lean`.”

4. **F04** (P3) Seventeen theorem names are absent from the README

   Location: `packages/ConformalMappingPartII/Suggested.lean:59`, `LinearEquation.global_initial_value`, and the other declarations below.

   Claim: The Lean signatures are the named representative targets of the README.

   Witness: Literal name searches in the whole README fail for 17 of the 19 named theorems; only `LinearEquation.initial_value` and `schwarzian_comp_apply` occur.

   Exact repair text: Add these names to their corresponding README targets: §0.4 `LinearEquation.global_initial_value`; §1.4 `PointedCover.extremal`; §1.6 `RootsCover.exists_cover`; §1.9 `RootsCover.power_descent`; §2.8 `roots_inverse_schwarzian`; §3.4 `herglotz_log`; §3.8 `quotient_representation`; §4.1 `gauss_equation`; §4.5 `inverseRatio.cover_inverse`; §5.5 `roots_conformal_radius`; §5.8 `gammaRadius.positive_expansion`; §6.7 `half_rotation_involution`; §7.4 `discCounting.zero_iff`; §7.8 `local_first_main_translation`; §8.7 `large_n_max_growth`; §9.4 `normalized_log_derivative`; §9.19 `uniform_mean_growth`. Retain one spelling in both files.

5. **F05** (P2) The generic covering-existence milestone has no easy Lean signature

   Location: `packages/ConformalMappingPartII/README.md:186`, “For a connected open Ω⊆ℂ whose complement has at least two points”. `packages/ConformalMappingPartII/Suggested.lean:148` states existence only for roots complements.

   Claim: Layer 1 develops general hyperbolic plane-domain covering existence.

   Witness: `PointedCover Ω a` is already a real-bodied structure at Lean line 91. Its general existence statement needs only sets, connectedness, openness and omitted points; no new carrier is required.

   Exact repair text: Add the named §1.1 milestone `PointedCover.exists_cover` and its signature:

   ```lean
   /-- Every pointed connected open plane domain omitting two distinct points
   admits a holomorphic universal cover by the disc. -/
   theorem PointedCover.exists_cover {Ω : Set ℂ} {a : ℂ}
       (ho : IsOpen Ω) (hc : IsConnected Ω) (ha : a ∈ Ω)
       (hmiss : ∃ b c : ℂ, b ≠ c ∧ b ∉ Ω ∧ c ∉ Ω) :
       Nonempty (PointedCover Ω a) := by sorry
   ```

6. **F06** (P2) Gauss's equation unnecessarily excludes the terminating cases

   Location: `packages/ConformalMappingPartII/README.md:499`; `packages/ConformalMappingPartII/Suggested.lean:263`, hypotheses `ha` and `hb`.

   Claim: The reusable Gauss-equation target assumes neither numerator parameter is a nonpositive integer.

   Witness: At a=0,b=c=1 the series is 1; at a=−1,b=c=1 it is 1−x. Both solve the stated equation. Mathlib's `ordinaryHypergeometric_radius_top_of_neg_nat₁` explicitly supports these terminating series.

   Exact repair text: “For arbitrary complex a,b and c outside the nonpositive integers, the native hypergeometric series satisfies Gauss's equation on |x|<1, with initial coefficients 1 and ab/c. If a or b is a nonpositive integer it terminates and the polynomial identity holds on all ℂ.” Delete `ha` and `hb` from `gauss_equation`; use the pinned terminating-radius theorems for those cases and add the two polynomial checks.

7. **F07** (P1) Surface uniformization is an unowned input to the proposed proof

   Location: `packages/ConformalMappingPartII/README.md:186`, “The plane and sphere alternatives of simply connected Riemann-surface uniformization must be excluded”; its Needs line is at 188.

   Claim: The native lifted atlas, simple connectedness and `TauCeti.riemannMapping` ground this proof.

   Witness: At the Tau Ceti pin, `TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.lean:96` quantifies over `Ω : Set ℂ`. It does not classify abstract simply connected Riemann surfaces. No general surface-uniformization target is listed here.

   Exact repair text: “Before hyperbolic plane-domain uniformization, prove the uniformization classification for connected, simply connected, second-countable Hausdorff one-dimensional complex manifolds: each is biholomorphic to the sphere, plane or disc. Supply the analytic existence construction, not only the exclusion of alternatives. Prove or cite an exact earlier owner for Little Picard to exclude the plane for a covering omitting two values; exclude the sphere by compactness. The planar `TauCeti.riemannMapping` is only a planar input.” Give these added prerequisites their own named targets, exact source locators and Needs lines. Import ComplexCurveModuli D0.4 for its finite-type metric special case instead of re-owning it; that result does not cover arbitrary infinitely connected plane domains. Alternatively replace the classification-based proof with a fully owned direct proof of the stated plane-domain theorem. Keep §1.1's full generality.

8. **F08** (P1) The puncture-to-cusp comparison is asserted as a supplier contract that the supplier does not give

   Location: `packages/ConformalMappingPartII/README.md:81`, “Near a puncture those charts must give a nonzero leading q coefficient”; consumed at 363–365.

   Claim: FuchsianOrbifolds Layer 3 supplies the expansion of this plane/sphere covering at each omitted value.

   Witness: `TauCetiRoadmap/FuchsianOrbifolds/README.md:275` constructs q for an already identified parabolic cusp; lines 280–282 give extension conditional on growth. Neither identifies arbitrary punctured-plane ends with parabolic cusps or gives this covering's leading coefficient.

   Exact repair text: “Add `FinitePuncturedCover.cuspComparison` after projective deck realization and before accessory parameters: for a finite punctured sphere with at least three punctures, its disc-cover deck group is cofinite; cusp orbits correspond exactly to punctures; the quotient identification extends biholomorphically over them. At each finite puncture p, in a primitive cusp coordinate q, the covering has expansion p+cq+O(q²) with c≠0. Import ComplexCurveModuli D0.4 for the complete finite-area conformal metric and its cusp-end expansion; do not redevelop that finite-type metric theorem. Consume FuchsianOrbifolds Layers 3–4 for abstract cusp charts and compactification, and prove the comparison between those inputs and the actual covering here.” The existing metric owner is at `TauCetiRoadmap/ComplexCurveModuli/README.md:50`. Repoint §§1.6, 2.5 and 5.4 to this target; give it a primary locator. Do not assume the roots-specific Layer 6 polygon in its proof, since Layer 2 precedes Layer 6.

9. **F09** (P3) The ODE source locator does not contain the promised theorem family

   Location: `packages/ConformalMappingPartII/README.md:113`, and the identical source locators at 129, 135 and 141: “CDT, p.632; 1.1.6”.

   Claim: This locator supports the companion equivalence, arbitrary initial-jet equivalence, path continuation and global dimension theorem.

   Witness: CDT line 275 starts an arithmetic overconvergence discussion; lines 310–318 invoke Cauchy's analyticity theorem for a pulled-back solution. They do not state the general initial-value, companion or solution-space equivalence targets.

   Exact repair text: “CDT §1.1.6, p.632 motivates this application. Consume local holomorphic initial-value theory from DiophantineApproximationAndTranscendence §5.1 (R15). For the companion-coordinate change cite Teschl, Ordinary Differential Equations and Dynamical Systems, author preliminary version, §1.2, equation (1.18), p.7; for complex linear continuation and the global simply connected theorem cite §4.3, Theorem 4.7 and its proof, p.130.” These replacement locators were read: TeschlODE line 438 and TeschlODE line 6243. Apply the same correction to the Lean initial-value docstring and label the retained germ signature as a supplier comparison.

10. **F10** (P3) Statable README checks have no Lean counterpart

   Location: `packages/ConformalMappingPartII/README.md:337`, “For x≠0, S(x↦1/x)(x)=0”, with further omissions listed below.

   Claim: README checks on the introduced, existing carriers are mirrored in Suggested.lean.

   Witness: The Schwarzian examples at Lean lines 197–201 cover only affine and square maps. No inverse-map example occurs; analogous omissions include b_(−1), constant pole count, constant characteristic and p_N(0).

   Exact repair text: Add proved checks for the omitted cases, combining assertions to retain at most two examples per definition: §2.1 the inverse Schwarzian for x≠0; §3.1 `blaschkeFactor (-1) z = 1`; §7.1 `discCounting (fun _ ↦ 1) r = 0`; §7.2 `discCharacteristic (fun _ ↦ c) r = Real.posLog ‖c‖`; §9.7 `pivotMap N 0 = 0` for N≥2. Also mirror §0.1's constant-one negative control and exp(−x) positive control for y′+y=0. Audit the other scalar checks and transfer any unproved boundary check to a named README theorem as required by R01.

11. **F11** (P3) No source manifest records the cited works

   Location: `packages/ConformalMappingPartII/README.md:1066`, References; package file inventory at the reviewed head.

   Claim: The package cites CDT, DLMF, Hempel, Abramowitz–Stegun, Tsuji and Kraus–Roth.

   Witness: The package contains README.md, Suggested.lean, metadata.toml and review.json, but no `sources.toml`.

   Exact repair text: Add `packages/ConformalMappingPartII/sources.toml` with schema `tauceti-roadmap-sources/v1` and an entry for every retained work, its exact locators and cited targets, and the sources-service provenance/status. Record paywalled texts as uncertified; do not insert machine paths. Correct the Tsuji DOI to `10.4099/jjm1924.21.0_1` if retaining its primary citation.

12. **F12** (P3) One exceptional-set Check does not test the set

   Location: `packages/ConformalMappingPartII/README.md:889`, “For any z, |sz|=|z|.”

   Claim: This is one of the three discriminating Checks for `ExceptionalCuspSet`.

   Witness: The equality still holds if `ExceptionalCuspSet` is replaced by the empty set or the whole disc. The other two Checks only exclude zero and control large values; neither supplies a positive membership witness.

   Exact repair text: Replace that Check by: “For M>0 choose a real t in (0,1) with t^N=1−exp(−MN)/2. Surjectivity gives z in the disc with F_N(z)=t, and this z belongs to S(M,N).” Combine this positive membership test with the existing zero-exclusion Lean example, retaining the separate rotated-large-values test. Keep radius preservation as the already stated API property, not as a set-membership Check.

13. **F13** (P3) Several CDT locator numbers and pages are wrong

   Location: `packages/ConformalMappingPartII/README.md:365`, repeated at 371 and 377: “equations (5.1.12)–(5.1.14), p.670”; line 1009: “p.682; Theorem 6.0.1”.

   Claim: These equation and theorem numbers identify the accessory formulas and equivalence of mean estimates at the stated pages.

   Witness: CDT line 2456: Example 5.1.12; lines 2498/2514: accessory equations; line 2537: symmetric coefficient, p.671; line 3017: Theorem 6.0.1, p.679; line 3221: §6.2.2, p.682.

   Exact repair text: For §2.5 cite “CDT, proof of Lemma 5.1.8, equation (5.1.13), p.670; Hempel, Theorem 3.1”; for §2.6 cite “CDT, equation (5.1.14), p.670”; for §2.7 cite “CDT, proof of Lemma 5.1.8 following (5.1.14), pp.670–671”. For §9.12 cite “CDT, §6.2.2 and equation (6.2.3), p.682; first main theorem (6.1.3), p.679”. Hempel's primary locator remains uncertified in this pass.

14. **F14** (P3) Suggested.lean imports a Tau Ceti module it never uses

   Location: `packages/ConformalMappingPartII/Suggested.lean:2`, `import TauCeti.Analysis.Complex.Conformal.Moebius`.

   Claim: The imported Tau Ceti module is needed for the representative signatures.

   Witness: None of the 70 declarations uses `TauCeti.unitDiscMoebius`, `TauCeti.coe_unitDiscMoebius`, or another declaration from that module. The scalar Blaschke definition uses only Mathlib arithmetic and conjugation.

   Exact repair text: Delete the second import. Keep `import Mathlib`. Retain the README's native Möbius comparison as a future target, or import this module only if a retained, proved comparison test actually uses it.

15. **F15** (P2) Local holomorphic initial-value theory already has an owner

   Location: `packages/ConformalMappingPartII/README.md:115`, “Analytic linear initial-value theorem”; its Needs line at 129 names only this package's equation definition.

   Claim: Layer 0 develops local holomorphic linear initial-value existence, uniqueness and the dimension of the solution space from scratch.

   Witness: `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:2960` states the holomorphic matrix initial-value theorem on a positive-radius disc; lines 2962–2964 give the evaluation linear isomorphism and arbitrary scalar initial jets with dimension equal to order.

   Exact repair text: “Import DiophantineApproximationAndTranscendence §5.1, holomorphic linear systems and scalar initial-value theorems on discs. Layer 0 constructs the `LinearEquation`/analytic-germ comparison and unscaled jet linear equivalence by restricting to a disc inside Ω and applying that supplier. Local existence, uniqueness and disc solution-space dimension are consumed, not redeveloped. The continuation target on general domains and its simply connected global comparison remain here.” Add the owner to the exact supplier contracts and §§0.1–0.4 Needs lines as applicable. Retain `LinearEquation.initial_value` only as the explicit comparison corollary of that supplied theorem.

## Verified sound

Coverage: **70 Lean declarations read** (3 structures, 13 real-bodied definitions, 19 theorems, 35 examples); **95 numbered README targets read**, including their API paragraphs and **67 explicit API bullets**; **69 Check bullets tested mathematically** in 21 blocks, plus all ten layer Examples paragraphs. There are **zero proved Lean examples**. The tables below record every declaration, its context, every numbered target and the boundary tests.

**43 source-locator groups verified** against legal extracts and rendered source pages, with source lines or printed image-page locators below. Repeated citations count once per group. The four ODE locators in R09 are inspected but not counted as verified theorem support. Primary-source and elaboration limitations are listed under Not verifiable.

**10 distinct named supplier section contracts checked** across ConformalMapping L2–L4, UniversalCovers Stages 0–2, DifferentialGeometry §2.3, and FuchsianOrbifolds Layers 0,2,3. R08 identifies the excessive cusp claim. Main-branch object searches also found the earlier conformal-radius, finite-type metric and local ODE owners recorded in R02/R08/R15. The supplied QWittVectors, ErdosProgressionPowers and ArithmeticDynamics heads were searched for overlapping objects; the package has **zero direct citations** to these three siblings. No supplier-name drift was found among the other nine section contracts.

The pinned declarations were read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the lifted cover atlas, planar Riemann-map normalization, Cayley identities, power descent, complex Herglotz, Shimizu, native hypergeometric coefficients, Gamma/digamma, meromorphic order/divisor, Jensen, circle integrability and proximity. R03 records the incorrect module locator. Object searches distinguished the pre-Schwarzian and generic logarithmic-derivative APIs from the genuinely additional targets here.

The scalar formulas tested retain the needed nonzero and radius guards. In particular: the centre-pole term is log r; scalarSpike demonstrates why punctured meromorphic order does not establish pointwise analyticity; the inverse prefactor is reciprocal derivative; the Schwarzian has the squared chain-rule factor; the matrix convention is inverse disc rotation; the positive sixth-order Gamma remainder and the pivot's factor 1/N agree. README corrections to CDT's Euler-sign, digamma-index, rotated-set and outer-radius misprints are mathematically consistent. No forced headline, sorry-backed data, `set_option`, `lemma` declaration, `True` placeholder or hypothesis-containing-conclusion signature was found. R05 records the missing easy headline. Positive characteristic, zero rings and rank-zero module degeneracies do not apply to these fixed complex-analytic carriers; order zero and roots levels below two were checked where relevant.

The requested mechanical check, on the unchanged README, returned:

```text
depcheck: 4 roadmaps, 21 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The package diff at the reviewed head is confined to `packages/ConformalMappingPartII/` (README.md, Suggested.lean, metadata.toml, review.json). No build or elaboration was run, and no tracked package file was edited. No suspicious instruction passage was encountered. No declared supplier-gap contract was available to waive R07 or R08.

All 1072 README lines and 458 Lean lines were read. Rows record mathematical review, not Lean execution. “None” means no additional finding in the listed tests; it is not a machine proof. Fields, API clauses and prose continuations were checked with their parent target.

### README target and adversarial table

The file uses numbered headings rather than bold target labels. All 95 numbered targets appear below. Its bold supplier labels (ConformalMapping L2–L4; UniversalCovers Stages 0–2; FuchsianOrbifolds Layers 0,2,3), bold Checks markers, Summary and reference labels were also read.

| Target and README line | Instances tried | Result | Change |
|---|---|---|---|
| 0.1, line 91: Analytic complex linear differential equations | n=0 excluded; n=1 constant/exponential; n=2 companion; n=3 quadratic jet | Derivative jets and companion signs agree; import local ODE floor | R01,R09,R10,R15 |
| 0.2, line 115: Analytic linear initial-value theorem | Jets (u,v), (0,0,2); arbitrary off-domain extensions | Germ uniqueness is correctly scoped; underlying local theorem already owned | R09,R15 |
| 0.3, line 131: Continuation of linear ODE solutions | Path in punctured disc; coefficient pole on path | Path inside coefficient domain is essential and retained | R09,R15 |
| 0.4, line 137: Global solutions on simply connected domains | Disc versus annulus; x in Ω; n positive | Simply connected hypothesis explicit in Lean | R04,R09,R15 |
| 0.5, line 143: Meromorphic trivial local monodromy | 1/x versus exp(1/x); n independent germs | Essential singularity excluded; rank exhausts ordinary solution space | None |
| 0.6, line 163: Simultaneous algebraic pole clearing | Finite algebraic images; high pole order; non-Galois-stable set | Products of minimal polynomials clear all finite pole orders | None |
| 1.1, line 184: Hyperbolic uniformization of the cover | Disc, annulus, infinitely connected plane domain; one omitted point | Statement true; proposed classification input missing | R05,R07 |
| 1.2, line 190: Pointed analytic cover uniqueness | Identity, dilation, square, disconnected target; off-disc values | Surjectivity and EqOn prevent false uniqueness | R01,R10 |
| 1.3, line 210: The pointed conformal radius | Disc radius 1; radius-2 disc; punctured plane; empty witness set | Correct totalization qualification; earlier special-case owner omitted | R02,R10 |
| 1.4, line 232: Extremality of the pointed cover | Constant disc map; rotations; strict contractions | Lift equality detects exactly rotations | R04 |
| 1.5, line 238: Monotonicity of conformal radius | Nested concentric discs; equal domains | Correct inequality direction | R02 |
| 1.6, line 244: The normalized roots-of-unity covering | N=0,1 excluded; N=2; quarter-turn; boundary value 1 | Orientation is real-positive; cusp identification needs comparison | R04,R08 |
| 1.7, line 264: Nonvanishing derivative of the cover | Square map at zero versus true cover | Cover local homeomorphism excludes ramification | None |
| 1.8, line 270: Rotation equivariance of the covering | N=2, ζ=-1; derivative at zero; arbitrary phase | Equivariance consistent with normalized cover | None |
| 1.9, line 276: The descended power map | Zero and nonzero preimages of zero; N=2 branch choice | Simple zero at origin; order N elsewhere | R04 |
| 1.10, line 297: Derivative of the descended power map | F(z)=az+O(z^(N+1)); N=2 | Derivative a^N, not a or Na | None |
| 1.11, line 303: Projective realization of analytic deck transformations | Identity deck map; elliptic fixed point; sign of SL lift | Faithful free deck action is properly distinguished | R07 |
| 2.1, line 322: The Schwarzian derivative | Affine, square, reciprocal; critical point x=0 | Sign and factor 3/2 correct; identities guard derivative | R10 |
| 2.2, line 341: Schwarzian chain rule | f=g=square away from zero; identity inner map | Squared derivative weight gives S(x^4)=-15/(2x²) | None |
| 2.3, line 347: Möbius invariance of the Schwarzian | Reciprocal postcomposition; determinant zero excluded | Möbius denominators explicitly guarded | None |
| 2.4, line 353: The Schwarzian differential equation | w=x and w=x²; independent versus dependent solutions | Wronskian nonzero; coefficient S/2 correct | None |
| 2.5, line 359: Hempel’s accessory-parameter formula | Three finite punctures; infinity unpunctured | Double pole 1/2 correct; cusp comparison unowned | R08,R13 |
| 2.6, line 367: Accessory-parameter constraints at infinity | Laurent coefficients X^-1, X^-2, X^-3 | Three cancellations have correct factors | R13 |
| 2.7, line 373: Accessory parameters for the symmetric punctures | N=2 symmetric set {0,1,-1}; rotation | m0=0 and m±1=∓3/4 satisfy constraints | R13 |
| 2.8, line 379: The rational Schwarzian for the roots cover | N=2 at x=0; inversion x↦1/x | S=3/2 at origin; transformed numerator agrees | R04 |
| 2.9, line 385: The linear equation of the inverse covering | N=2 at origin; basis changed by GL2 | Quotient normalization needed and retained | None |
| 3.1, line 404: Boundary-compatible Blaschke factors | a=0,1,-1; z=a on boundary | Boundary extension removes the totalized 0/0 value | R01,R10 |
| 3.2, line 423: Finite Blaschke products | Empty family, zero multiplicities, boundary-only family, double zero | Empty and boundary products have modulus one | R01 |
| 3.3, line 442: Removing zeros with a finite Blaschke product | g=z, g=z-1, nonzero constant; zero germ excluded | Boundary zeros correctly remain in G | None |
| 3.4, line 448: Herglotz representation of a normalized logarithm | g=1; normalized exponential; g=i excluded | Normalized log removes imaginary constant | R04 |
| 3.5, line 454: The derivative Herglotz formula | Nonunit g(0); constant function | Differentiation cancels normalizing constant | None |
| 3.6, line 460: The phase in the complex quotient identity | G=i and G=2i | Required phase is G(0)/abs(G(0)) | R01 |
| 3.7, line 466: Radial smoothing of the quotient multiplier | Boundary zero g=z-1; zero function separately | Smoothing avoids claiming closed-disc zero-freeness | None |
| 3.8, line 472: Nevanlinna’s quotient representation | g=0,1,large constant; ε>0 | Logarithmic rather than norm bound is consistent | R04 |
| 3.9, line 478: Optimality of the quotient bound | h(0)=1; zeros of h on circle; constant g | Jensen gives the stated lower bound across isolated zeros | None |
| 4.1, line 497: The Gauss hypergeometric equation | a=0,-1; b=c=1; c=0 excluded | True but needlessly narrowed to nonterminating numerator parameters | R04,R06 |
| 4.2, line 503: The descended inverse differential equation | N=2 substitution x=u² | Chain differentiation gives coefficient 1-1/N | None |
| 4.3, line 509: The two hypergeometric solutions | N=2 leading terms 1 and sqrt(x) | Branch and independence requirements retained | None |
| 4.4, line 515: The normalized inverse-ratio germ | N=2 first hypergeometric coefficients 3/8 and 1/8 | J2=u+u³/4+O(u^5); third derivative 3/2 | R01 |
| 4.5, line 534: Matching the actual covering inverse | Positive derivative a; rotation by i | Inverse prefactor a^-1 and descent prefactor a^-N correct | R04 |
| 4.6, line 540: Zero-balanced hypergeometric continuation | a=1/2; k=0,1; principal/continued logarithm | Gamma normalization and -2 Euler-constant sign correct | None |
| 4.7, line 548: Uniform digamma coefficient control | a=1/4,3/4; k=1 and large k | Reciprocal sum positive; decreases in both variables | None |
| 4.8, line 554: Uniform zero-balanced remainder | N=2; tiny fixed M0; a endpoints; x→0 | Constants may depend on M0; parameter derivative needed | None |
| 5.1, line 573: The explicit Gamma radius | N=1,2,3; N→∞ | Level-one totalization is zero; eligible levels positive | R01 |
| 5.2, line 592: Positivity of the Gamma radius | All Gamma arguments at N=2 and limit N→∞ | Arguments positive under N≥2 | None |
| 5.3, line 598: The alternative Gamma expression | N=2,3; duplication/reflection | Gamma expressions agree | None |
| 5.4, line 604: The boundary limit of the inverse ratio | u→1 along real inverse branch | Boundary identification depends on missing cusp comparison | R08 |
| 5.5, line 610: The conformal radius of the punctured plane | N=2; arbitrary source phase | Norm and radius equality phase-independent | R04 |
| 5.6, line 616: The local log-Gamma Taylor series | z=0; coefficient of z and z²; abs(z) approaching 1 | Euler sign and convergence radius correct | None |
| 5.7, line 622: The odd-zeta radius series | Odd powers 3 and 5; even-power cancellation | Coefficients ζ(3)/2 and 3ζ(5)/8 correct | None |
| 5.8, line 628: The positive radius expansion | First omitted exponential term at N^-6; N=2 | Positive ζ(3)²/8 term supports strict remainder | R04 |
| 6.1, line 647: The symmetric ideal polygon | N=2 ideal quadrilateral | Area 2π(N-1) correct | None |
| 6.2, line 653: The primitive cusp translation | N=2 primitive translation; nonprimitive multiple | Width tied to full stabilizer, not merely one translation | None |
| 6.3, line 659: The free deck-group presentation | N=2 free rank two; extra relation absent | Presentation consistent with twice-punctured plane | None |
| 6.4, line 665: The power-map stabilizer group | N=2 quotient; elliptic fixed point i | Exact quotient order N; rotation is not a deck map | None |
| 6.5, line 686: The largest invariance group of the power cover | Zero-set lift and identity; branched descended map | Power invariance distinguished from deck group | None |
| 6.6, line 692: The fundamental quadrilateral | N=2 area π; matrix at τ=2i | Real matrix induces inverse disc rotation | R01 |
| 6.7, line 698: The half-rotation involution | z=0; s squared equals a root rotation | Involution and omitted-value denominator consistent | R04 |
| 6.8, line 704: The index-two triangle supergroup | N=2 area π/2; antiholomorphic reflection | Orientation-preserving supergroup and index two retained | None |
| 7.1, line 738: The disc-local pole-counting function | 1/z; constant one; pole at boundary radius; n=0 | Centre log r negative; boundary contribution zero | R10 |
| 7.2, line 757: The disc-local characteristic | Constants, z, 1/z, zero function | T(1/z)=0 by cancellation | R10 |
| 7.3, line 776: Pole-counting positivity at a regular centre | Centre pole excluded; interior and boundary poles | Nonnegative count requires regular centre | None |
| 7.4, line 782: Vanishing of the local pole count | Scalar spike; pole strictly inside; pole on boundary | Iff correctly concerns open disc and punctured order | R04 |
| 7.5, line 798: The disc-local Jensen identity | f=z,1/z,c; germ identically zero excluded | Trailing coefficient handles signs and centre values | None |
| 7.6, line 804: The local first main inversion identity | f=cz^k for positive/negative k | Difference equals log abs(c), not assigned centre value | None |
| 7.7, line 810: Translation bound for proximity | a=0; constant f; zeros on integration circle | Absolute translation error log⁺abs(a)+log 2 is valid | None |
| 7.8, line 816: The translated local first main theorem | f-a=c z^k; f identically a excluded | Trailing-coefficient sign matches inversion identity | R04 |
| 7.9, line 822: The local characteristic power law | n=0; f=0; centre pole | Both pole count and proximity scale correctly | None |
| 7.10, line 828: Radial monotonicity of holomorphic proximity | Constants; z; zeros inside smaller circle | Holomorphic hypothesis excludes pole-count obstruction | None |
| 8.1, line 847: Uniform cusp asymptotics of the inverse ratio | N=2 and N→∞; k=0 coefficient | Euler sign repaired relative to source printing | None |
| 8.2, line 853: Height near a small cusp value | Cusp approach; a± endpoints | Height and logarithmic scale consistent | None |
| 8.3, line 859: Disc diameter of a transformed horoball | Identity matrix; negative lift; translated horoball | Diameter 2/(1+D(a²+c²)); radial bound consistent | None |
| 8.4, line 867: Shimizu for the power-map group | c=0 and c≠0; full power group versus deck group | Rotated argument controls missing a-entry case | None |
| 8.5, line 875: The paper-specific exceptional cusp set | z=0; large F; rotation preserves radius | Large values lie in sS, not S; radius-only Check does not test S | R01,R12 |
| 8.6, line 897: Excluding the cusp horoballs | r→0 and r→1; large-level threshold | Threshold and radial exclusion used in stated range | None |
| 8.7, line 905: The large-N maximum growth bound | N below threshold excluded; arbitrary source phase | Maximum estimate uses large N only | R04 |
| 9.1, line 924: The inverse-square kernel mean | r=0 limit and r→R; w=R | Kernel mean 1/(R²-r²) correct | None |
| 9.2, line 930: Boundary L1 control of the logarithm | g=1 and normalized exponential | Mean-zero real log gives twice the positive mean | None |
| 9.3, line 936: The logarithmic mean estimate | H=0,1; small positive-measure support | Entropy maximum 1/e handles zero-measure limit | None |
| 9.4, line 942: The zero-free logarithmic derivative estimate | g=1; small r; r→R | All guards explicit; constant case has nonnegative RHS | R04 |
| 9.5, line 948: Uniform transfer from small radii | r below/above 1/4; r=3/4 | ρ<R and R-ρ≥(1-r)/4 | None |
| 9.6, line 954: The logarithmic derivative of the omitted-value function | Near-zero omitted-value function; small r | Outer radius remains larger than evaluation radius | None |
| 9.7, line 960: The pivot rational function | x=0,1,2; N=2 | Arithmetic zero at pole is not analytic extension | R01,R10 |
| 9.8, line 979: The pivot partial-fraction identity | N=2,x=2 | Partial fractions sum to 4/3 with factor 1/N | None |
| 9.9, line 985: The pivot chain identity | z=0; F=az+O(z^(N+1)) | Both sides lead with -a^N z^N | None |
| 9.10, line 991: The pivot characteristic lower bound | Small r; lower bound may be negative | Additive log 4 consistent with local first main theorem | None |
| 9.11, line 997: Effective mean growth at fixed omitted sets | N=2 and compact small-radius interval | Effectivity remains an explicit owned target; asymptotic alone insufficient | Primary KR16 uncertified |
| 9.12, line 1005: Equivalence of the three mean estimates | f=F^N at zero; translate by one | Trailing coefficient at omitted value has norm one | R13 |
| 9.13, line 1011: The logarithmic derivative at the omitted value one | g=1-F; sign of derivative | Norm discards minus sign; zero-free normalization holds | None |
| 9.14, line 1017: The pole divisor of the covering logarithmic derivative | Simple zero at origin and other cover zeros | Pole orders one on both sides | None |
| 9.15, line 1023: The covering derivative reciprocal bound | Small radius; F/F′ holomorphic | No false nonnegative counting assumption at centre pole | None |
| 9.16, line 1029: The pivot characteristic upper bound | At zero all three product factors holomorphic | Pivot chain and sum of means give one T term | None |
| 9.17, line 1035: The large-N mean-growth estimate | N=2 absorption boundary; large-N outer circle | N/(N-1)≤2; large-level threshold retained | None |
| 9.18, line 1041: Completing the finitely many small levels | Empty finite list if N0=2; nonempty list otherwise | Maximum with large-level constant handles both cases | None |
| 9.19, line 1047: Uniform mean growth of the covering powers | N=2; r→0,1; phase changes; three maps | Uniformity and normalization agree with CDT theorem | R04 |

### API inventory

Each explicitly backticked API member in an API bullet was reviewed under the parent target above.

| Target | API member | README line |
|---|---|---|
| 0.1 | `LinearEquation.mk` | 99 |
| 0.1 | `LinearEquation.initialJet` | 100 |
| 0.1 | `LinearEquation.companion` | 101 |
| 0.1 | `LinearEquation.IsSolution` | 102 |
| 0.5 | `MeromorphicBasisMonodromy.basis` | 151 |
| 0.5 | `MeromorphicBasisMonodromy.finitePoleBound` | 152 |
| 0.5 | `MeromorphicBasisMonodromy.identityMonodromy` | 153 |
| 1.2 | `PointedCover.rotation_unique` | 198 |
| 1.2 | `PointedCover.based_lift` | 199 |
| 1.2 | `PointedCover.deriv_ne_zero` | 200 |
| 1.3 | `conformalRadius.coverDerivative` | 218 |
| 1.3 | `conformalRadius.positive` | 219 |
| 1.3 | `conformalRadius.riemannMap` | 220 |
| 1.3 | `conformalRadius.affineChange` | 221 |
| 1.6 | `RootsCover.mapZero` | 250 |
| 1.6 | `RootsCover.omitsRoots` | 251 |
| 1.6 | `RootsCover.halfPlane` | 252 |
| 1.6 | `RootsCover.derivativeOrientation` | 253 |
| 1.9 | `PowerDescent.rootEquation` | 282 |
| 1.9 | `PowerDescent.mapZero` | 283 |
| 1.9 | `PowerDescent.derivative` | 284 |
| 1.9 | `PowerDescent.rootIndependence` | 285 |
| 1.9 | `PowerDescent.ramification` | 286 |
| 2.1 | `schwarzian_affine` | 328 |
| 2.1 | `schwarzian_expanded` | 329 |
| 2.1 | `schwarzian_comp_apply` | 330 |
| 2.1 | `schwarzian_moebius` | 331 |
| 3.1 | `blaschkeFactor.interior` | 410 |
| 3.1 | `blaschkeFactor.boundary` | 411 |
| 3.1 | `blaschkeFactor.normOnCircle` | 412 |
| 3.1 | `blaschkeFactor.discAutomorphism` | 413 |
| 3.2 | `finiteBlaschke.empty` | 429 |
| 3.2 | `finiteBlaschke.mul` | 430 |
| 3.2 | `finiteBlaschke.normOnCircle` | 431 |
| 3.2 | `finiteBlaschke.strictDisc` | 432 |
| 4.4 | `inverseRatio.formula` | 521 |
| 4.4 | `inverseRatio.mapZero` | 522 |
| 4.4 | `inverseRatio.derivativeZero` | 523 |
| 4.4 | `inverseRatio.equivariant` | 524 |
| 5.1 | `gammaRadius.formula` | 579 |
| 5.1 | `gammaRadius.positive` | 580 |
| 5.1 | `gammaRadius.alternative` | 581 |
| 5.1 | `gammaRadius.tendsto` | 582 |
| 6.4 | `PowerStabilizer.containsDeck` | 671 |
| 6.4 | `PowerStabilizer.generators` | 672 |
| 6.4 | `PowerStabilizer.discConjugate` | 673 |
| 6.4 | `PowerStabilizer.deckIndex` | 674 |
| 6.8 | `TriangleSupergroup.generators` | 712 |
| 6.8 | `TriangleSupergroup.index` | 713 |
| 6.8 | `TriangleSupergroup.triangle` | 714 |
| 6.8 | `TriangleSupergroup.orientation` | 715 |
| 7.1 | `discCounting.poleSum` | 744 |
| 7.1 | `discCounting.globalComparison` | 745 |
| 7.1 | `discCounting.restriction` | 746 |
| 7.1 | `discCounting.power` | 747 |
| 7.2 | `discCharacteristic.eq` | 763 |
| 7.2 | `discCharacteristic.globalComparison` | 764 |
| 7.2 | `discCharacteristic.holomorphic` | 765 |
| 7.2 | `discCharacteristic.power` | 766 |
| 8.5 | `ExceptionalCuspSet.mem` | 881 |
| 8.5 | `ExceptionalCuspSet.horoballContainment` | 882 |
| 8.5 | `ExceptionalCuspSet.rotatedLargeValues` | 883 |
| 8.5 | `ExceptionalCuspSet.radiusInvariant` | 884 |
| 9.7 | `pivotMap.formula` | 966 |
| 9.7 | `pivotMap.companion` | 967 |
| 9.7 | `pivotMap.poleSet` | 968 |
| 9.7 | `pivotMap.coverComposition` | 969 |

### Named Lean declarations and context

All declarations are in `TauCetiRoadmap.ConformalMappingPartII`, within a noncomputable section, with standard complex/real structures. There are no ambient `variable`, `include`, universe or custom-instance blocks. Every relevant binder is in the signature or a real structure field. No sorry-backed data definition occurs.

| Lean line | README section | Declaration | Variable and hypothesis context | Adversarial result |
|---|---|---|---|---|
| 27 | 0.1 | `LinearEquation` | Ω:Set ℂ, n:ℕ; positiveOrder, openDomain, connectedDomain, analytic coefficients | Zero order excluded; connected includes nonempty |
| 35 | 0.1 | `LinearEquation.initialJet` | Ω,n,E,y:ℂ→ℂ,x:ℂ; output Fin n→ℂ | Order-three x² jet gives second derivative 2 |
| 40 | 0.1 | `LinearEquation.IsSolution` | Ω,n,E,y; AnalyticOnNhd plus equation | Zero solves; constant one fails y′+y=0 |
| 47 | 0.2 | `LinearEquation.initial_value` | Ω,n,E,x∈Ω,v:Fin n→ℂ | Uniqueness is eventual equality; no global-extension uniqueness |
| 59 | 0.4 | `LinearEquation.global_initial_value` | Ω,n,E,explicit SimplyConnectedSpace Ω,x∈Ω,v | Uniqueness EqOn Ω; standing hypothesis retained |
| 91 | 1.2 | `PointedCover` | Ω:Set ℂ,a:ℂ; actual UnitDisc/domain covering and surjectivity | Identity/dilation accepted; square/disconnected target rejected |
| 102 | 1.3 | `conformalRadius` | Ω:Set ℂ,a:ℂ; real sInf of derivative norms | Empty set totalized, geometric scope qualified |
| 107 | 1.4 | `PointedCover.extremal` | Ω,a,F,IsOpen Ω,f differentiable/mapsTo,based at a | Constant/rotation/contraction; unique based lift only on disc |
| 142 | 1.6 | `RootsCover` | N:ℕ; extends PointedCover, N≥2, positive real derivative | N=0,1 impossible; quarter-turn fails orientation |
| 148 | 1.6 | `RootsCover.exists_cover` | N:ℕ,explicit 2≤N | N=2; missing general parent theorem R05 |
| 152 | 1.9 | `RootsCover.power_descent` | N,F:RootsCover N | G derivative a^N; uniqueness on disc; nonzero zero ramified |
| 178 | 2.1 | `schwarzian` | f:ℂ→ℂ,x:ℂ; totalized derivatives/division | Affine 0; square -3/(2x²); reciprocal 0 away from 0 |
| 183 | 2.2 | `schwarzian_comp_apply` | f,g,x; analytic at g(x),x; both derivatives nonzero | Composition of squares and identity check squared weight |
| 190 | 2.8 | `roots_inverse_schwarzian` | N,F,w,x; omitted-root,analytic inverse germ,w(x) in disc | N=2,x=0 gives 3/2; inverse branch hypotheses sufficient |
| 206 | 3.1 | `blaschkeFactor` | a,z:ℂ; norm-one branch else native rational formula | a=0,1,-1; no interior interpretation outside closed disc |
| 210 | 3.2 | `finiteBlaschke` | k:ℕ,a:Fin k→ℂ,n:Fin k→ℕ,z:ℂ | Empty, zero multiplicity, boundary-only, double zero |
| 229 | 3.4 | `herglotz_log` | g:ℂ→ℂ,R>0,analytic near closed ball,zero-free,g(0)=1 | Constant one; normalized exponential; phase i excluded |
| 239 | 3.8 | `quotient_representation` | g analytic near closed unit ball,ε>0 | Zero and large constants; logarithmic bounds |
| 255 | 4.4 | `inverseRatio` | N:ℕ,u:ℂ; two native hypergeometric values | Only germ interpreted; N=2 cubic coefficient 1/4 |
| 263 | 4.1 | `gauss_equation` | a,b,c,x:ℂ; a,b,c avoid nonpositive integers; norm x<1 | R06 removes excessive a,b restrictions |
| 272 | 4.5 | `inverseRatio.cover_inverse` | N,F:RootsCover N; no hidden phase | Two germ identities; prefactor reciprocal complex derivative |
| 286 | 5.1 | `gammaRadius` | N:ℕ; real Gamma and real powers | N=1 zero; N=2,3 explicit values; limit 1 |
| 293 | 5.5 | `roots_conformal_radius` | N≥2,F:PointedCover of roots complement at 0 | No orientation needed for norm; phase invariance correct |
| 300 | 5.8 | `gammaRadius.positive_expansion` | No outer variables; exists C>0,∀N≥2,exists E>0 | Strict positive sixth-order remainder; finite low levels allowed |
| 317 | 6.7 | `half_rotation_involution` | N,F:RootsCover N,z in disc | At zero 1=1; positive half-turn differs by root rotation from matrix convention |
| 337 | 7.1 | `discCounting` | f:ℂ→ℂ,r:ℝ; closed-ball divisor, real finsum | Centre correction log r; no geometric claims outside 0<r<1 |
| 343 | 7.2 | `discCharacteristic` | f:ℂ→ℂ,r:ℝ; native proximity plus local count | 1/z cancellation; constants and identity |
| 348 | 7.4 | `discCounting.zero_iff` | f meromorphic on disc,centre order nonnegative,0<r<1 | Boundary pole and scalar spike do not break stated iff |
| 354 | 7.8 | `local_first_main_translation` | f meromorphic on disc,a:ℂ,order(f-a,0)≠top,0<r<1 | Signed trailing-coefficient correction; identically a excluded |
| 378 | 7.4 | `scalarSpike` | z:ℂ; equality branch at zero | Actual value 2, punctured germ 1; discontinuous and meromorphic |
| 392 | 8.5 | `ExceptionalCuspSet` | N,F:RootsCover N,M:ℝ; includes norm z<1 | Zero outside for M>0; large values lie in rotated set |
| 407 | 8.7 | `large_n_max_growth` | No outer variables; ∃C>0,N0≥2,∀N≥N0,F,r,z on sphere | Phase-independent; small levels intentionally excluded |
| 415 | 9.7 | `pivotMap` | N:ℕ,x:ℂ; totalized rational expression | N=2,x=0,1,2; pole versus assigned value |
| 426 | 9.4 | `normalized_log_derivative` | g,R>0,analytic and zero-free on closed ball,g(0)=1,0<r<R | Constant g=1; all denominators guarded |
| 437 | 9.19 | `uniform_mean_growth` | No outer variables; ∃C>0,∀N≥2,F,0<r<1 | All three means; no silently dropped uniformity binders |

### Anonymous Lean declaration inventory

All 35 examples are admitted, so every row requires R01. The claims were checked mathematically; no row is recorded as a proved Lean test. The layer and explicit parameter block below are the complete ambient context, together with the actual hypothesis clauses in the example.

| Lean line | Layer | Explicit parameter block | Test and result |
|---|---|---|---|
| 66 | 0 | `{Ω : Set ℂ} (E : LinearEquation Ω 1) (ha : ∀ x ∈ Ω, E.coefficient 0 x = 0) {y : ℂ → ℂ} (hy : E.IsSolution y)` | Zero coefficients in order one force constants on the connected domain. Mathematical claim consistent; proof missing. |
| 72 | 0 | `{Ω : Set ℂ} (E : LinearEquation Ω 2) (ha : ∀ j x, x ∈ Ω → E.coefficient j x = 0) {y : ℂ → ℂ} (hy : E.IsSolution y)` | In order two the affine solution and its unscaled jet agree. Mathematical claim consistent; proof missing. |
| 78 | 0 | `{Ω : Set ℂ} (E : LinearEquation Ω 3)` | In order three, the unscaled second derivative is two, not one. Mathematical claim consistent; proof missing. |
| 82 | 0 | `None` | A pole cannot be an analytic coefficient at an ordinary point. Mathematical claim consistent; proof missing. |
| 85 | 0 | `None` | Identity continuation around a puncture does not exclude an essential singularity. Mathematical claim consistent; proof missing. |
| 123 | 1 | `None` | The identity disc map is a pointed holomorphic cover. Mathematical claim consistent; proof missing. |
| 127 | 1 | `None` | Ramification at zero prevents the square map from being a disc cover. Mathematical claim consistent; proof missing. |
| 131 | 1 | `None` | The unit-disc radius fixes the normalization. Mathematical claim consistent; proof missing. |
| 134 | 1 | `None` | Dilation multiplies the radius by its norm. Mathematical claim consistent; proof missing. |
| 137 | 1 | `None` | A once-punctured plane fails the two-omitted-point hyperbolicity hypothesis. Mathematical claim consistent; proof missing. |
| 162 | 1 | `None` | At N=2 the omitted set consists of exactly the two indicated roots. Mathematical claim consistent; proof missing. |
| 165 | 1 | `{N : ℕ} (F : RootsCover N)` | The root-one normalization is a boundary limit and an interior omission. Mathematical claim consistent; proof missing. |
| 170 | 1 | `{N : ℕ} (F : RootsCover N)` | A quarter-turn keeps the derivative norm but violates positive real orientation. Mathematical claim consistent; proof missing. |
| 197 | 2 | `(x : ℂ)` | An affine map has zero Schwarzian. Mathematical claim consistent; proof missing. |
| 200 | 2 | `{x : ℂ} (hx : x ≠ 0)` | The square map detects both the sign and the factor three halves. Mathematical claim consistent; proof missing. |
| 214 | 3 | `(z : ℂ)` | At zero the factor is the identity. Mathematical claim consistent; proof missing. |
| 217 | 3 | `(z : ℂ)` | The removable boundary factor is a constant, including at the cancelled pole. Mathematical claim consistent; proof missing. |
| 220 | 3 | `(z : ℂ)` | Empty and boundary-only zero data do not give open-disc-valued functions. Mathematical claim consistent; proof missing. |
| 225 | 3 | `(z : ℂ)` | Positive multiplicity changes the actual product, not merely its zero set. Mathematical claim consistent; proof missing. |
| 247 | 3 | `{R : ℝ} (hR : 0 < R) {z : ℂ} (hz : ‖z‖ < R)` | The missing phase is visible on a constant unimodular function. Mathematical claim consistent; proof missing. |
| 278 | 4 | `None` | The germ has zero constant coefficient and derivative one. Mathematical claim consistent; proof missing. |
| 281 | 4 | `None` | The cubic coefficient 1/4 rules out replacing J_2 by the identity germ. Mathematical claim consistent; proof missing. |
| 307 | 5 | `None` | Levels two and three have the indicated explicit Gamma values. Mathematical claim consistent; proof missing. |
| 311 | 5 | `None` | The totalized level-one value is not a positive hyperbolic radius. Mathematical claim consistent; proof missing. |
| 324 | 6 | `None` | The displayed real rotation matrix acts by the inverse disc rotation in the standard left action; τ=2i detects the sign, whereas the fixed point i cannot. Mathematical claim consistent; proof missing. |
| 362 | 7 | `{r : ℝ} (hr : 0 < r) (hr1 : r < 1)` | A centre pole gives a negative local counting function. Mathematical claim consistent; proof missing. |
| 366 | 7 | `{a : ℂ} (ha : a ≠ 0) (ha1 : ‖a‖ < 1)` | A pole on the circle has zero weight and invalidates a closed-disc criterion. Mathematical claim consistent; proof missing. |
| 370 | 7 | `{r : ℝ} (hr : 0 < r) (hr1 : r < 1)` | The holomorphic identity has zero characteristic below radius one. Mathematical claim consistent; proof missing. |
| 374 | 7 | `{r : ℝ} (hr : 0 < r) (hr1 : r < 1)` | The centre-pole counting term cancels its proximity. Mathematical claim consistent; proof missing. |
| 381 | 7 | `None` | The point value differs from its punctured-germ limit. Mathematical claim consistent; proof missing. |
| 384 | 7 | `{r : ℝ} (hr : 0 < r) (hr1 : r < 1)` | Zero divisor and pole count do not imply pointwise analytic regularity. Mathematical claim consistent; proof missing. |
| 396 | 8 | `{N : ℕ} (F : RootsCover N) {M : ℝ} (hM : 0 < M)` | Zero is outside the exceptional set for every positive M. Mathematical claim consistent; proof missing. |
| 400 | 8 | `{N : ℕ} (F : RootsCover N) {M : ℝ} (hM : 0 < M) {z : ℂ} (hz : ‖z‖ < 1) (hlarge : Real.exp M + 1 < ‖F.toFun z‖)` | Large values enter the rotated set, rather than the small-value set itself. Mathematical claim consistent; proof missing. |
| 418 | 9 | `None` | A concrete nonzero input pins the rational expression. Mathematical claim consistent; proof missing. |
| 421 | 9 | `None` | A totalized field value at a root does not remove its genuine analytic pole. Mathematical claim consistent; proof missing. |

### Check coverage

| README Check block line | Parent section | Bullet count | Review |
|---|---|---|---|
| 25 | Supplier agreement | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 43 | Supplier agreement | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 104 | 0.1 | 6 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 123 | 0.2 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 155 | 0.5 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 202 | 1.2 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 223 | 1.3 | 4 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 255 | 1.6 | 4 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 288 | 1.9 | 4 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 333 | 2.1 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 415 | 3.1 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 434 | 3.2 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 526 | 4.4 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 584 | 5.1 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 676 | 6.4 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 717 | 6.8 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 749 | 7.1 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 768 | 7.2 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 792 | 7.4 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |
| 886 | 8.5 | 3 | Mathematical assertions checked; R12 for radius-only test |
| 971 | 9.7 | 3 | Mathematical assertions checked; Lean coverage subject to R01/R10 |

### Verified source locator groups

A group counts once even when cited by several targets. These are locator/content checks, not claims that every generalized target is stated verbatim by the source. Unowned generalizations and incorrect locators are findings above.

Legal source identifiers: CDT is the [author-hosted published offprint](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf); DLMF15, DLMF15norm and DLMF5 are [§15.8](https://dlmf.nist.gov/15.8), [§15.2](https://dlmf.nist.gov/15.2) and [§5.7](https://dlmf.nist.gov/5.7). Tsu52 is the [publisher's open paper](https://www.jstage.jst.go.jp/article/jjm1924/21/0/21_0_1/_article), AS92index the [UBC institutional scan](https://personal.math.ubc.ca/~cbm/aands/), and TeschlODE the [author's permitted preliminary book](https://www.mat.univie.ac.at/~gerald/ftp/book-ode/ode.pdf). All source downloads used the sources service; no source text is reproduced here.


| Source | Locator | Extracted source lines | Scope verified |
|---|---|---|---|
| CDT | Corollary 2.0.5 and pole-clearing proof, p.636 | CDT line 489, CDT line 502 | Meromorphic basis and finite algebraic pole clearing; not an ODE IVP source |
| CDT | Lemma 2.3.1 and proof, pp.639–641 | CDT line 711, CDT line 735 | Quotient representation, finite zero divisor, radial smoothing |
| CDT | Remark 2.3.3, p.641 | CDT line 886 | Jensen lower bound |
| CDT | Remark 5.0.1 and Definition 5.1.1, p.667 | CDT line 2316, CDT line 2342 | Cayley and pointed covering normalization; not a proof of general uniformization |
| CDT | Lemma 5.1.2, p.668 | CDT line 2357 | Rotation equivariance and nonvanishing derivative |
| CDT | Theorem 5.1.4, equations (5.1.5)–(5.1.6), p.668 | CDT line 2382, CDT line 2392 | Gamma radius and strictly positive asymptotic remainder |
| CDT | Lemma 5.1.8, equation (5.1.9), p.669 | CDT line 2420 | Inverse second-order equation |
| CDT | Remark 5.1.10 and (5.1.11), pp.669–670 | CDT line 2423, CDT line 2435 | Schwarzian normalization and quotient of solutions |
| CDT | Accessory equations (5.1.13)–(5.1.14), p.670 | CDT line 2498, CDT line 2514 | Formula and infinity constraints; primary Hempel unverified |
| CDT | Symmetric accessory calculation, pp.670–671 | CDT line 2524, CDT line 2530 | m0 and coefficient -(1/2+1/(2N)) |
| CDT | Definition 5.1.15, p.671 | CDT line 2552 | Power descent; not unramified at every zero |
| CDT | Lemma 5.1.16 and (5.1.17)–(5.1.19), pp.671–672 | CDT line 2560, CDT line 2615 | Transformed ODE, hypergeometric solutions, inverse prefactors |
| CDT | Lemma 5.1.20, p.672 | CDT line 2654 | Connection formula, with DLMF normalization and parameter guards checked separately |
| CDT | Proof of Theorem 5.1.4, pp.672–673 | CDT line 2669, CDT line 2681, CDT line 2731 | Boundary ratio, Gamma simplification and log series |
| CDT | Proposition 5.2.1, p.674 | CDT line 2795 | Primitive cusp translation, ideal polygon and free generators |
| CDT | Definition 5.2.3, p.674 | CDT line 2830 | Power invariance subgroup |
| CDT | Corollary 5.2.4, p.675 | CDT line 2835 | Full invariance group and quadrilateral |
| CDT | Lemma 5.2.6, p.675 | CDT line 2848 | Half-rotation identity |
| CDT | Remark 5.2.8, p.675 | CDT line 2857 | Index-two group and triangular fundamental region |
| CDT | Lemma 5.2.9, p.676 | CDT line 2870, CDT line 2878, CDT line 2898 | Uniform cusp approximation; README corrects printed Euler sign and coefficient index |
| CDT | Lemma 5.2.12, pp.676–677 | CDT line 2901 | Height estimate and large-level threshold |
| CDT | Lemma 5.2.16, p.677 | CDT line 2939 | Transported horoball diameter bound; exact diameter also checked algebraically |
| CDT | Lemma 5.2.18, p.678 | CDT line 2957 | Large-level maximum growth; README uses rotated exceptional set |
| CDT | Theorem 6.0.1, p.679 | CDT line 3017 | Three uniform means and effective absolute constant |
| CDT | §6.1.1 and Lemma 6.1.2, p.679 | CDT line 3030, CDT line 3047 | Local count, characteristic and regular-centre criterion |
| CDT | Equations (6.1.3)–(6.1.5), pp.679–680 | CDT line 3054, CDT line 3067, CDT line 3069 | Trailing-coefficient correction and translation error |
| CDT | Lemma 6.1.7, p.680 | CDT line 3084 | Normalized logarithmic derivative estimate |
| CDT | Equations (6.1.9)–(6.1.12), pp.680–681 | CDT line 3104, CDT line 3118, CDT line 3125, CDT line 3127 | Herglotz, derivative kernel and inverse-square mean |
| CDT | Proof of Lemma 6.1.7, p.681 | CDT line 3134, CDT line 3160 | L1 logarithm control and entropy constant |
| CDT | §6.2.2 and (6.2.3), p.682 | CDT line 3221, CDT line 3232 | Equivalence and pivot lower bound |
| CDT | Equations (6.2.4) and (6.2.7), p.682 | CDT line 3236, CDT line 3243 | Partial fractions and chain identity; factor 1/N checked independently |
| CDT | Corollary 6.2.9, p.683 | CDT line 3253 | Small-radius transfer and omitted-power logarithmic derivative |
| CDT | Corollary 6.2.11 and (6.2.13), pp.683–684 | CDT line 3279, CDT line 3359 | Reciprocal derivative and pole divisors; README corrects outer-radius misprint |
| CDT | Equations (6.2.15)–(6.2.16), p.684 | CDT line 3420, CDT line 3435, CDT line 3438 | Pivot upper bound and absorption |
| DLMF15 | Equation 15.8.10 | DLMF15 line 516, DLMF15 line 518, DLMF15 line 520 | m=0,b=a zero-balanced continuation with stated branch |
| DLMF15norm | Equation 15.2.2 | DLMF15norm line 145, DLMF15norm line 147 | Regularized normalization; restoring Gamma(2a) |
| DLMF5 | Equation 5.7.3 | DLMF5 line 127, DLMF5 line 129 | Log-Gamma after combining log(1+z) |
| DLMF5 | Equation 5.7.6 | DLMF5 line 254, DLMF5 line 256 | Digamma reciprocal series and sign |
| Tsu52 | Theorem 11, printed p.25 | Tsu52 line 606, Tsu52 line 610, Tsu52 line 615 | Fixed punctured sphere asymptotic; formula also checked against rendered page |
| AS92index | Equation 6.1.33, printed p.256 | Rendered PDF page 73; no completed extraction | Log-Gamma series; expansion of log(1+z) gives the stated form |
| AS92index | Equation 15.3.10, printed p.559 | Rendered PDF page 207; no completed extraction | Ordinary zero-balanced formula, branch guard and Gamma factor |
| TeschlODE | Author preliminary version, §1.2, (1.18), p.7 | TeschlODE line 438 | Companion-coordinate reduction; repair reference, interpreted over ℂ with Chapter 4 |
| TeschlODE | Author preliminary version, §4.3, Theorem 4.7 and proof, p.130 | TeschlODE line 6234, TeschlODE line 6243 | Complex linear path continuation and global simply connected existence/uniqueness; repair reference |

## Not verifiable

- **Hempel, Hem88:** The primary Theorem 3.1/Lemma 3.3 text could not be fetched legally through the sources service; the DOI and publisher endpoint returned HTTP 403. CDT's invocation and displayed formulas were checked, but this does not certify Hempel's exact hypotheses. One missing-reference entry is retained for this work.
- **Kraus–Roth, KR16:** The sources service classified the DOI as paywalled/uncertified. No primary text was read and no new missing-reference request is made for it. CDT supplies the two endpoint statements independently; the package's effective fixed-level proof remains a development target, not a verified extracted algorithm.
- **Abramowitz–Stegun extraction/edition:** The legal UBC scan obtained through the sources service was read as page images: 6.1.33 on printed p.256 and 15.3.10 on printed p.559. Both formula numbers and the formulas match the citations. The complete OCR extraction did not finish (service exited 143), so no extracted line numbers are asserted. The scan is the tenth printing, not a separately inspected 1992 Dover physical copy; the two cited formula locators agree. No missing-text request remains for these checked formulas.
- **Lean elaboration:** Not run under the read-only/no-build brief. Binder inspection and pinned declaration reads do not certify parser, elaborator or eventual proof completion.
- **Proof completion:** The review checks statements and dependency ownership. It does not establish full uniformization, parameter-uniform analytic continuation estimates, or constructive numerical constants by a formal proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f9d9ca6a0b672a58aae8b50578d7a7541e8284f1", "job": "RT-ConformalMappingPartII~1a", "model": "gpt-6-astra", "worker": "chris-2"} -->
