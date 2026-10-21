# ArithmeticDynamics repair report

Finding headings retain the original review IDs: the first block refers to RT-ArithmeticDynamics~1a and the second-review supplement to RT-ArithmeticDynamics~1b. Cross-reference prefixes a- and b- distinguish the reviews. Overlapping claims are settled once: b-R01 in a-R14, b-R05 in a-R05, b-R08 in a-R04, and b-R09 in a-R07.

## R01 (P1) — applied

Unqualified Möbius invariance → invariance for continuous-potential mass-zero measures, with the atomic diagonal correction stated explicitly, including mixed empirical/continuous measures. Added δ₀−δ₁ under z↦2z, giving 0→2 log 2. For finite supports away from poles the correction is Σ aᵢ² log|γ′(xᵢ)|, obtained by expanding the kernel transformation and using Σaᵢ=0.

## R02 (P1) — applied

Uniform potential convergence → distributional convergence; weak signed-measure convergence also requires bounded total variation. Added the oscillatory compactly supported counterexample and the positive-background-curvature specialization. The guard matches §2.3(ix); on a compact sphere distributional convergence plus bounded variation extends to continuous test functions by density.

## R03 (P1) — applied

Fixed-projective uniform approximation → a separate §4.3a boundary-topology completion over number fields and one-variable function fields. Added compactification independence, analytic realization, nef/integrable classes, pullback, intersections, normalized heights and projective comparison, with three Checks. §4.4 consumes these named milestones. Evidence: yuan-zhang-adelic-v9 lines 1291–1330, 3105–3125, 6607–6652.

## R04 (P1) — applied

Nonexistent TropicalAndBerkovichArithmetic supplier → ArithmeticDynamics §§2.2–2.3. This also settles second-review R08. The analytic carrier and disc-point constructions are the existing internal targets; no external supplier was added.

## R05 (P1) — applied differently

Retired DT slugs → DiophantineApproximationAndTranscendence §§0.2, 0.3 and 2.4, with the five actual height declarations and an exact unit-equation contract. Also settles second-review R05. Removed the duplicate contract. The proposed §2.3 rational theorem is insufficient for arbitrary coefficients; §2.4’s algebraically closed characteristic-zero finite-rank theorem, specialized after embedding, is the correct input.

## R06 (P1) — applied

Abstract elliptic good reduction in arbitrary coordinates → integral Weierstrass model with unit discriminant, with no exclusion of residue characteristic 2. Both assertions changed. Added y²+y=x³ at 2 and y²+125y=x³ at 5. Direct Sylvester determinants give 729 and 729·5²⁴; the latter lift is normalized but has bad reduction.

## R07 (P1) — applied

Layer 6 power-map construction → §0.27a; multiplier application follows §0.33. Updated Layer 2 consumers and build description. Also settles second-review R09: the rational-function-field height construction moved to §0.27b, before the Layer 1 specialization Check. Existing degree, resultant, composition, base-change and height APIs were retained.

## R08 (P1) — applied

Unqualified point-height field independence → ground-field-indexed point heights for arbitrary adelic measures; fixed Galois-stable finite-set heights still commute with extension. Added the local-Galois-invariant subclass, its extension API and three Checks, including conjugation at real places. Updated the corresponding metric-height and global-intersection comparisons. The centered-circle heights are ½ log 2 over ℚ and 0 over ℚ(i).

## R09 (P1) — applied

Unprovided supplier classification → internal Picard, global-section and generating-section prerequisites, followed by named forms-to-morphism comparisons and classification including constants. SchemeAndStackFoundations §0.3 supplies only the carrier/charts. The projective universal property is Stacks Tag 01NE; Picard is Tag 0BXJ; sections are Tag 01XT. Added constant, identity and base-point Checks.

## R10 (P1) — applied

Half of the Lattès height identified with Tau Ceti’s height → Lattès height equals native Point.canonicalHeight divided by the coordinate-field degree. O((O)) has half this value. Added the non-torsion point (3,5) on y²=x³−2 over ℚ. The pinned canonicalHeight definition is the full x-height doubling limit, without ½.

## R11 (P1) — applied

Mutually dependent composite statements → independent local equation/Jacobian comparison (§3.66a), marked-monodromy transitivity (§3.67), then geometric-integrality/descent assembly (§3.70). Each has its own prerequisites. Removed the global comparison from monodromy’s construction and proof. The local comparison follows monic factorization and local transversality, not global connectedness.

## R12 (P1) — applied

§6.86’s self-link → §6.28 integral primitive presentation and §6.51 primitive-root transport, retaining §6.70 specialization. The whole-field embedding now cites its actual construction inputs.

## R13 (P2) — applied

Unrestricted residue reconstruction → N≥1. Periodicity threshold max bᵢ → 1+max bᵢ, with empty-family/all-zero-step conventions. Added N=0 and singleton-at-threshold negative controls. At N=0 the residue condition is empty even for powers, which fail eventual periodicity by unbounded gaps.

## R14 (P2) — applied

Powers of 2 → powers of every p≥2; complex affine coefficients → any characteristic-zero field in both Lean and README. Also settles second-review R01. The coefficient-field embedding remains part of the proof, not a restriction of the endpoint.

## R15 (P2) — applied

Added `polynomialOrbits_commonIterate` (§6.84) and `polynomialLine_returnTimes` (§6.90) on existing polynomial/orbit/iteration carriers. Both retain arbitrary characteristic-zero fields; the return theorem permits constant polynomials. Evidence: ghioca-tucker-zieve-2008 lines 83–97. Every new Lean name occurs in the README.

## R16 (P2) — applied

Dimensionless ℙ¹-only UBC definition → `UniformBoundednessConjecture N d D` and `UniformBoundednessProperty N d D C` for polarized degree-d endomorphisms of ℙᴺ. Retained N in monotonicity; elliptic applications specialize N=1. The earlier polarized-morphism theory and SchemeAndStackFoundations §0.3 provide the general projective carriers.

## R17 (P2) — applied

Obsolete list-state argument → predicate `fun x ↦ orbitRepeatsWithin f S (|S|+1) x`, with classical decidability for Finset.filter. The filter remains the finite-orbit characterization, with the original soundness and completeness hypotheses.

## R18 (P2) — applied

PoonenConjecture alone → PoonenConjecture plus rank J(C₁(3₂))(ℚ)≤1, with the curve equation and §3.89 owner stated in the short API. The promoted owner already carries this assumption; the short statement now agrees with it.

## R19 (P2) — applied

Characteristic-zero-only endpoint → rational maps in every characteristic, polynomials except (2,2), and the exceptional image Rₙ⋊Rₙ×. Extended the critical-divisor, first-level and orbit prerequisites; retained characteristic zero explicitly on the quadratic Kummer Check. Evidence: juul-generic-iterates lines 65–90, 353–359, 438–449, 585–608, 661–699.

## R20 (P3) — applied

Both height-bound constants zero → upper constant 0, lower constant −log 2 over ℚ; exact doubling follows separately from the power-height identity. The pinned `Height.logHeight_eval_ge` retains Nat.card of the output coordinates, equal to 2 here.

## R21 (P3) — not actionable in this package: sources.toml is excluded from permitted edits

The missing manifest is confirmed. Only TauCetiRoadmap/ArithmeticDynamics/README.md and TauCetiRoadmap/ArithmeticDynamics/Suggested.lean are authorized package edits; creating TauCetiRoadmap/ArithmeticDynamics/sources.toml would violate that boundary. Source-service provenance and fetch results were retained in scratch for the maintainer. The board manifest and scratch provenance remain available for a separately authorized registration.

## R22 (P3) — applied

Consolidated Morton’s examples to prove all four sign pairs and H(0,0)=−2, retaining the denominator counterexample. Added an integer-translation exceptional-set example and changed the AP example to the union of the evens with {1}. No kept definition has more than two example blocks.

## R23 (P3) — applied

Locally constant normalized potential off the Julia set → harmonic but varying on the explicit Fatou segment: for z²+p⁻² and 1<r<p, g(ζ₀,r)=log p−log r. The escape rate is log p; subtracting log⁺r produces the variation. The Hölder assertion is retained.

## R24 (P3) — applied

Alleged Misiurewicz equation → periodic-critical equation, with strictly preperiodic sets defined using exact preperiod m≥2 and period n≥1. Added D=2,n=2 giving c=0,−1. Direct substitution yields P_c³(0)−P_c(0)=(c²+c)². The equidistribution application retains nonempty Galois-stable sets and finite repetitions.

## R25 (P3) — applied

Negative infinity logarithm → positive infinity logarithm in the finite degree sum, giving the stated product formula. Added g=t: both that sum and log|t|∞ equal 1. This construction is now §0.27b.

## R26 (P3) — applied

Positive quadratic discriminant factor for all n → n≥1, with the n=0 factor −4 and f=X²+1 negative control. The general discriminant recursion is unchanged: at n=0 its sign is required, whereas the even exponent removes it for positive n.

# Second-review supplement

## R02 (P2) — applied differently

Imported SchemeAndStackFoundations §1.17’s three invariant/quotient predicates and retained the GIT existence and dynamical moduli construction. That supplier explicitly excludes general reductive quotient existence; cutting this scope or assuming the quotient would bypass required theory. Added the Silverman reference, legally fetched as math/9609212v1, Theorems 1.1–1.3 (silverman-moduli-1998 lines 131–177).

## R03 (P3) — applied

The multiplicity Check’s B≡2 and coefficient 1 → B≡3 and coefficient 2. In the centered coordinate g=−z+z², g²−z=−2z³+z⁴, so a(1)=1, a(2)=3 and a*(2)=2. The rest of the roadmap already uses this pattern.

## R04 (P3) — applied

Promoted the existing proved doubling example to `tateLimit_double` and deleted the admitted duplicate. The named normalization result is now proved, and its README name remains valid.

## R06 (P3) — not actionable in this package: RP.0 supplier outputs need their owner’s contract

Corrected spreading out to SchemeAndStackFoundations §0.9 `spreading_out_models`. Recorded `gap:rp-dominant-height` and `gap:rp-geometric-height-field` with supplier, section and exact needs in Scope. No unread supplier target was invented. The proposed inequality also requires generic finiteness: a positive-dimensional fibre disproves a lower bound for an arbitrary dominant map.

## R07 (P3) — applied

Nonexistent ConformalMapping milestone anchors → its actual Layers, L0 and Layers, L4 entries, in both supplier headers and consuming text. Read the corresponding main-branch layer descriptions.

## R10 (P3) — applied

Replaced the listed unresolved design slugs with section links to the actual owners: §§2.61, 3.38, 3.40–3.41, 3.70, 3.82, 3.88, 5.20, 5.29 and 5.43. ED.0’s unprovided output is recorded as `gap:ed-bounded-height-candidates`, rather than assigned a fictional target.

## R11 (P3) — applied differently

Added exact references for Silverman’s moduli paper, Benedetto–Ingram–Jones–Levy, DeMarco–Faber and Stacks. Replaced historical/background mentions by already cited sources actually carrying the claims: Yuan’s density statement, Gao–Ou, Morton, Ingram, Bell–Ghioca–Tucker, Call–Silverman, Favre and Yuan–Zhang. Removed the unused alternative DF2 locator. Newly checked version locators include Ingram Lemma 13, p.14, and BIJL Theorem 4.1, p.12.

## R12 (P3) — not actionable in this package: ED.0 supply requires its owner

Recorded `gap:ed-bounded-height-candidates`, naming EffectiveDiophantineMethods ED.0 and the finite-superset inclusion needed by §3.40. No unavailable supplier declaration or computational interface was invented. Changed the four “explicit supplier gap” descriptions of conditional mathematics to “explicit hypothesis”; the displayed rank/conjectural assumptions remain.

# Adversarial mathematics pass

| Statement family | Instances tried | Result | Change |
|---|---|---|---|
| Orbit, preperiodicity and iteration signatures | identity; constant; integer translation; quadratic tail 1→0→−1; power d=1 versus d≥2 | Positive periods and finite-orbit conventions distinguish the boundary cases. | Translation example added. |
| Homogeneous lifts, reduction and scheme comparison | degree zero; identity; Frobenius over finite fields; common-root pair; good versus scaled elliptic model | Point equality over a finite field does not classify morphisms; good reduction depends on coordinates. | Internal section/Picard prerequisites; integral-model guard. |
| Tate convergence, uniqueness and Northcott | zero height; expansion 0,1,2; stationary orbit; elliptic expansion 4 | Expansion guards and field-degree normalization retained. | Proved doubling named; Lattès factor corrected. |
| Potential theory and energy | zero measure; Gauss atom; type-I atoms; δ₀−δ₁; high-frequency smooth functions; ζ₀,r Fatou segment | Continuous-potential and variation hypotheses are indispensable. | Atomic correction; variation guard; harmonic nonconstant Check. |
| Dynatomic multiplicity and comparison | n=1,2; multiplier 0,1,−1; z²−3/4; all Morton sign pairs; origin; quotient denominator zero | g²−z has order 3; local smoothness and global transitivity are separate. | B=3; consolidated examples; acyclic comparison assembly. |
| Uniform boundedness and rational bounds | N=1 and general N; D=0; d=1 identity; nine-point quadratic; rank assumption | Dimension is a parameter; rank hypothesis cannot disappear in the short API. | General N definitions and corrected conditional bound. |
| Adelic heights and intersections | standard metric; constants; projective versus affine; function field; centered-circle noninvariant measure | Boundary completion is distinct; fixed-set and point-height extension differ. | Completion target and local-invariance subclass. |
| Critical divisors, arboreal and discriminant signatures | n=0,1,2,3; degree 1,2,3; characteristics 0,2,3; derivative-square, z^p+z and Frobenius cases | The homogeneous Jacobian loses critical data when the characteristic divides degree; n=0 retains its discriminant sign; characteristic-two generic polynomial group has order 32 at level 3, versus 128 for rational maps. | Positive-index Check; separable Wronskian critical divisor; general Juul chain and exceptional image. |
| Progression and orbit-intersection signatures | empty, finite, all naturals; isolated odd point plus evens; N=0; powers p≥2; affine roots of unity; constant polynomials | Reconstruction needs N>0; distinct-point infinitude and degree hypotheses retained. | Generalized signatures, proved AP example and polynomial endpoints. |
| Primitive transport and Lech assembly | L=ℚ; empty/zero marked set; algebraic and transcendental generators; integral versus unit marks | Explicit whole-field finite-generation and separability hypotheses retained. | Removed the self-edge. |
| Function-field and family heights | g=t, 1/t and constants; constant and moving sections; periodic critical c=0,−1 | Infinity sign and exact critical preperiod matter. | Sign and critical-parameter Checks. |

This table records mathematical boundary checks, not a claim that an admitted Lean statement has been proved. Exact small polynomial/resultant computations were performed in scratch. Source texts were read only through the provided cache or the sources service. No fetched code was executed. Pinned Mathlib and Tau Ceti revisions were verified against the content manifest; the periodic-point, height-bound, canonical-height and finite-set APIs used by the changes were inspected. Object searches found no existing common-polynomial-iterate or finite-union-of-progressions endpoint in the relevant pinned dynamics/polynomial files. ErdosProgressionPowers was inspected read-only and supplies none of these dynamical interfaces.

# Validation and maintainer notes

The required final `lake build TauCetiRoadmap.ArithmeticDynamics.Suggested` exited 0. It compiled the pinned dependencies and all 16 proved examples; the roadmap module emitted only the expected admitted-theorem warnings:

```text
Build completed successfully (8988 jobs).
```

An earlier implementation check failed in the integer-translation example’s injectivity proof. Its unsuccessful tactic was replaced by integer subtraction cancellation and cast injectivity before the successful final build. The final file contains 15 definitions, 38 named theorems and 16 proved examples in 537 lines. All 53 definition/theorem names occur in the README. No example body contains `sorry`.

The integration gate before finalizing the commit exited 1 solely for the uncommitted README edit (`dirty=1`); all content counters were zero. The prescribed gate after the commit exited 0:

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The prescribed dependency-direction check exited 0, both before and after the commit:

```text
depcheck: 2 roadmaps, 6 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. `git diff --check` exited 0 without output; the final `git status --short` was empty. The exact rational arithmetic checks reproduced resultants 729 and 729·5²⁴, discriminants −4 and 512, the four Morton sign pairs and H(0,0)=−2, and the stated parabolic and critical-parameter identities.

Commit: `ec203d12`, on `roadmap/arithmetic-dynamics`, with message `ArithmeticDynamics: red-team repairs (correct hypotheses, generality, and supplier interfaces)`. This finalizes the existing repair commit with the integration corrections. Only TauCetiRoadmap/ArithmeticDynamics/README.md and TauCetiRoadmap/ArithmeticDynamics/Suggested.lean changed. No push or external write was performed; no validation process from this job remains running.

Names retained with changed binders: `not_isFiniteUnionAP_powers`, `linearSynchronizedIntersection`. `tateLimit_double` is retained with a proof. New headline names: `polynomialOrbits_commonIterate`, `polynomialLine_returnTimes`. Internal construction anchors moved from §6.2 to §0.27a and from §6.6 to §0.27b; the arbitrary-characteristic critical divisor is §5.6a; the Juul polynomial-locus construction precedes its first-level consumer at §5.17a. Searches of main and ErdosProgressionPowers found no consumers of the changed signatures or moved section numbers.

Three supplier gaps are recorded in TauCetiRoadmap/ArithmeticDynamics/README.md, Scope. Their machine-readable metadata `gaps` entries, and registration of TauCetiRoadmap/ArithmeticDynamics/sources.toml, require separately authorized edits: those files are excluded from this job’s allowance. This is the remaining maintainer action for a-R21, b-R06 and b-R12; no supplier output was invented to discharge it.

The source-service fetch records remain available for manifest registration. No missing-text request remains pending. Existing waived source entries, including Forster, remain settled; no waiver was inferred from the reviews. Zieve and Stoll source portions used in the repairs were also available legally in the cache. No source passages were copied into the repository or this report. The build verifies elaboration and the proved examples; it does not prove the admitted targets or replace the subsequent independent review.
