# Design repair report: ColemanIntegrationPartII

## F01 (P1) — applied

Finite-K point extension treated as supply for every A/ℂ_p → new §4.0 `NaturalIntegration.abelianLogCp`, with analyticity, identity differential, uniqueness, homomorphism and finite-model comparisons. Updated §4.0a, supplier contracts and manifest; added four Checks including transcendental j. Evidence: AnabelianGeometryAndNonabelianChabauty §5.8 assumes finite K; colmez1998 line 3079, line 3113 and line 3147 explicitly cover the additional case.

## F02 (P2) — applied

Unrestricted geometric spanning → full equality over k̄/k, and only the algebraically defined logarithmic span over arbitrary algebraically closed E/k. Updated statements, apparent-pole removal and proof sketches; added the transcendental-pole Check. The proof chooses decomposition over k̄ before descent and uses a separable Vandermonde matrix. Evidence: colmez1998 line 3376 and line 3399; residue at α distinguishes the spans.

## F03 (P3) — applied

Layer 7's “imported universal single-integration theorem” → “the universal single-integration theorem of §4.0c” in `packages/ColemanIntegrationPartII/design/plan.json`, agreeing with the README. Its target is internal; prerequisite edges required no change.

## Mathematical verification

All verdicts were checked directly. AnabelianGeometryAndNonabelianChabauty §5.8 at commit `59d989dd138cd28b4a4643ab233c04ad6d62aa34`, `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:6833`, fixes A/K with K/ℚ_p finite; its following ℂ_p construction extends that A's points. The added target covers varieties outside this class and compares with the existing theorem whenever a finite model exists. The source's argument for varieties without a finite model is explicit at colmez1998 line 3113; open-quotient torsion is Theorem II.1.9, printed pp. 76–77, colmez1998 line 3079, and logarithm existence/uniqueness is Lemma II.1.13, printed p. 78, colmez1998 line 3147. No compactness or finite-index assertion for A(ℂ_p) is used.

For the scope Check, t≠0,1 and characteristic zero make E_t smooth. Its displayed j is a nonconstant rational function over ℚ_p. If j(t) were algebraic over ℚ_p, clearing denominators would make t algebraic over an algebraic extension of ℚ_p, a contradiction. Every variety admitting a finite p-adic field model has algebraic j. This also excludes a finite model up to isomorphism.

For the logarithmic span, choose L=k(θ) finite separable. The matrix of embeddings on 1,θ,…,θ^{[L:k]−1} has determinant a product of nonzero differences of conjugates. Applying its inverse to Tr(θ^j dlog f) recovers every conjugate dlog f after scalar extension. Over k̄ every rational function has finitely many algebraic coefficients, giving full spanning. Over arbitrary E this argument covers only rational functions defined over finite algebraic extensions of k. On ℙ¹ all such functions have algebraic pole support; E-linear combinations remain regular at a transcendental α, whereas dt/(t−α) has residue 1 there. The algebraic comparison over E remains general; p-adic primitive assertions retain their p-adic coefficient hypotheses.

The geometric reduction and moving ingredients were read at colmez1998 line 3376 through line 3412. The finite-field-of-definition and averaging argument is explicitly an additional characteristic-zero consequence, not an unrestricted quotation of that source. All six manifest texts were readable in their legal cached versions. The added source locators use the existing certified Colmez entry; acquisition fields are preserved. No source fetch, missing-reference record or waiver was needed.

## Supplier and duplication checks

Read main-branch `TauCetiRoadmap/StableReduction/README.md`, `TauCetiRoadmap/JacobianChallenge/README.md` and `TauCetiRoadmap/RigidAnalyticGeometry/README.md` for shape and ownership. Read the abelian logarithm supplier at the commit above, and the relevant open-roadmap texts: ArithmeticDynamics §3.58 at `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`, and ErdosProgressionPowers scope/contracts at `e101259371172a32b3dd13e926676ae33b6af5cd`. Their open heads were verified. Neither provides the missing ℂ_p logarithm or an integration prerequisite. ArithmeticDynamics remains an indirect consumer through EffectiveDiophantineMethods; ErdosProgressionPowers supplies no edge.

Read `lake-manifest.json` and discovered objects through GitHub code search before reading the pinned declarations:

| Pin and file | Evidence and effect |
| --- | --- |
| Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/RingTheory/Trace/Basic.lean:249` | `trace_eq_sum_embeddings` assumes finite dimension, separability and algebraically closed target. It supports the trace identity for every E in F02, independently of the spanning claim. |
| Same Mathlib pin, `Mathlib/RingTheory/Trace/Defs.lean:110` and line 137 | `Algebra.trace_algebraMap` gives the degree factor; `Algebra.trace_trace` requires both finite free tower stages. Characteristic-zero finite field extensions meet these conditions. The design consumes them. |
| Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84` | `IsAlbanese` bundles a pointed factorization property; `IsAlbanese.homEquiv` supplies its equivalence. It supplies neither the analytic logarithm nor the rational-form comparison. |

Object searches for abelian varieties and logarithms in both libraries returned no matching integration theorem. These negative discovery results are not an exhaustive semantic-equivalence claim. The finite-K logarithm is supplied by its roadmap, and its theorem is not replanned. No supplier gap, new external supplier or ownership move from a later roadmap was introduced.

## Adversarial mathematics pass

Each subsection row covers its headline and all attached API statements, including construction, functoriality and uniqueness clauses. The complete pass covered 45 targets, 135 API entries and 155 Checks. The convention rows also test signs, scales and domains outside individual target blocks. These are mathematical checks of planned statements, not a claim of formal proofs.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: coefficients and domains | p=2,3; characteristic p; zero ring; zero rational function; empty graph | Characteristic-zero fields exclude zero rings and characteristic-p constant-kernel failures. Nonzero rational functions and positive degrees/lengths exclude undefined logs and zero denominators. | None |
| Conventions: valuation and orientation | λ′−λ=2; ramification e=2; edge reversed; xy=π with f=x | Branch change at π is 1; dlog x has residue 1=ord_head−ord_tail; opposite flags cancel on loops. | None |
| Conventions: pairing order and auxiliary data | B(1,L), B(z,z⁻¹); c=2,d=3,rη=5,rω=7; shift I_{G dH} by 1 | Values 1,−1,−11; triple change −1 when Res(dF)=1. Ordered cup uses α first. | None |
| Conventions: trace and divisors | Quadratic α²=π; residue 1; quadratic closed point | Tr(α)=0, Tr(α²)=2π; residue contribution and closed-point degree are 2. | None |
| §1.1 cochains and all APIs | Empty graph; isolated vertices; loop; f=(2,5); ℓ=1/2,c=2 | d=−3, divergences ±4, loop divergence zero; kernel constants are componentwise. | None |
| §1.2 decomposition and APIs | Triangle (3,0,0); tree; two isolated vertices; characteristic 3 | Harmonic part (1,1,1), exact part (2,−1,−1); characteristic-3 intersection is excluded, ℚ₃ remains allowed. | None |
| §1.3 subdivision and APIs | Jump 6; lengths 1/3,2/3; m=1; attached tree | Jumps 2,4; total and weighted energy preserved; tree current zero. | None |
| §2.0 residue transport and APIs | z=t²; z=t⁻¹; quadratic residue; infinite negative analytic tail | Residues 2,−1; traced residue 2; arbitrary analytic families need not be formal Laurent germs. | None |
| §2.1 logarithmic subspace and APIs | 2+3L; constant; L²; characteristic p | Residue 3; scalar kernel; L² outside degree one; characteristic p excluded. | None |
| §2.1a coefficient extension and APIs | L²/2 over ℚ₂; L³/3 over ℚ₃; closed boundary | Derivatives L dz/z and L² dz/z; division is in a characteristic-zero field; convergence requires open interior radii. | None |
| §2.2 double index and APIs | (1,L),(L,1),(z,z⁻¹); both constants | Values 1,−1,−1,0; shifts give A Res(dG)−B Res(dF). | None |
| §2.3 index transport and APIs | Degree 1,2; reversal; coefficient embedding | Values scale by 1,2 and −1; a constant map is outside the finite positive-degree hypothesis. | None |
| §3.0a component cover and APIs | Smooth fibre; xy=π; self-node | One core in good reduction; paired residues ±1; subdivision preserves loop information. | None |
| §3.0b full analytic algebra and APIs | Transcendental α in (1−αz)⁻¹; log z; residue-disc indicator | Full analytic coefficients exceed algebraic coefficient tensors; nonconstant indicators fail Coleman rigidity. | None |
| §3.0c cohomology comparison and APIs | Positive-genus good reduction; total coboundary; diag(1,q); 𝔽₄ | χ=N=0 does not imply H¹=0; χ kills coboundaries; Nφ=qN; squaring is not identity on 𝔽₄, fourth power is. | None |
| §3.1 end double sum and APIs | Zero form; rational core; proper cup 1 | Values 0,0,1; local nonzero terms cancel globally; global constants cancel by residue sums. | None |
| §3.1a reciprocity and APIs | Analytic exact; dlog z; nonsplit quadratic boundary | Exact and q-boundary classes are radical; boundary eigenvalue (−1)^r q never equals 1/q. | None |
| §3.2 harmonic data and APIs | Bridge jump 2; cyclic (1,1,1); zero form | Bridge killed by component shift; cyclic jump survives; only one global scalar ambiguity. | None |
| §3.3 correction and APIs | (2,3,5,7); edge reversal; one component shift | Correction −11 unchanged by orientation; arbitrary component shifts can change both sides. | None |
| §3.4 corrected pairing and APIs | ℙ¹; smooth reduction; second-kind cup 1; α,β exchanged | Values 0; no graph term in good reduction; second-kind cup 1 retained; graph correction changes sign. | None |
| §3.5 operator laws and APIs | N=0; diag(1,2); square; identity | Scaling 2, then 4; skew-adjoint terms cancel; arbitrary identity fails q≥2 scaling. | None |
| §4.0 geometric logarithm and APIs | Dimension 0; [n]x=0; small exp(v); finite L/K; transcendental-j E_t | Values 0,0,v and embedded supplied log; E_t is outside finite-model scope but included here. Torsion quotient replaces any compactness argument over ℂ_p. | Added general theorem and four Checks for F01 |
| §4.0a abelian primitive and APIs | Zero A; df; invariant form; finite extension; E_t | Exact primitive f; invariant primitive pairs with the correct logarithm; extension is not degree scaling. | Uses §4.0 over arbitrary ℂ_p |
| §4.0b Albanese and descended logarithmic APIs | A¹; G_m; point; α²=2 over ℚ₃; dt at infinity; transcendental α | Exact/log terms distinguished; quadratic trace yields dt/(t²−2); dt is outside logarithmic span; transcendental pole defeats unrestricted spanning. | Algebraic-closure equality and restricted E-span for F02 |
| §4.0c natural integration and APIs | I(0,1;dt); I(1,p;dlog t); equal endpoints; quadratic form | Values 1,T,0 and traced quadratic logarithm. Discwise constants do not supply naturality. | Uses repaired upstream statements |
| §4.0d reciprocity and APIs | Constant f; f=0; z=t²; ℙ¹ with dt and (t−a)/(t−b) | Constant case zero; zero f excluded; ramification 2 retained; infinity residue a−b gives divisor integral a−b. | None |
| §4.0e Jacobian bridge and APIs | Genus 0; split multiplicative elliptic curve; compact H; K× | Proper rational-point groups compact; locally constant additive maps on H vanish; valuation on noncompact K× is nonzero. | None |
| §4.1 logarithmic residues and API | f=x at xy=π; nonzero scalar; zero f | Residue 1=−d(ord); scalar residue zero; zero f excluded. | None |
| §4.2 harmonic identification and APIs | Tree; cycle; df; Tate valuations 1/3,2/3 | Smooth-residue equality holds; whole-annulus correction varies by −1/3,−2/3. | Uses repaired upstream statements |
| §4.3 interpolation and APIs | F_tail=2,c=6,t=1/3; reversal; quadratic refinement | Both expressions give 4; two jumps 3 recover 6; valuation scales agree after ramification. | None |
| §4.4 point-sum and APIs | Empty pole set; holomorphic forms; second-kind cup 1; cyclic graph | Zero holomorphic sum agrees with isotropy; proper pairing need not vanish; cycle correction essential. | None |
| §5.1 auxiliary data and APIs | All L with L²/2; zero functions; opposite shifts | Pair sums and derivatives hold; (1,0) for zero product fails, (1,−1) works. | None |
| §5.2 triple index and APIs | (1,1;L); (z,z;z⁻²); (z,z⁻¹;L); three L | Values 1,−2,1,0; characteristic zero permits division by 3 also over ℚ₃. | None |
| §5.3 choice changes and API | (L,0;L); shift C=1,2; residue zero | Changes −1,−2,0; unused F,G choice has no effect. | None |
| §5.4 simple-pole expression and API | (2+L,3;L); all half-squares; u=az | Values 6,0; constant term alone changes by −log a or −δ; transported full index remains invariant. | None |
| §5.5 pullback and API | z=t²; identity; reversal; shifted pulled-back primitive | Factors 2,1,−1; altered auxiliary constant adds the explicit residue error. | None |
| §6.0 actual-form relations and APIs | Analytic gη; nonzero [dG]⊗η; G dC | Symbols 0, nonzero,0; nonzero symbol prevents a zero actual form. | None |
| §6.1 global triple and APIs | Zero triple; rational core; G=1 with B(F,H)=1 | Values 0,0,1; not determined by three differential classes. | None |
| §6.2 global laws and APIs | Global auxiliary shift; first-end-only shift; G↦G+2 | Global change cancels; local change can be −1; ordinary constant contributes 2 when B=1. | None |
| §6.3 Frobenius vanishing and API | Zero eigenclasses; q=2 over ℚ₂; q=4 over unramified quadratic; G=1 | Both eigenclass conditions matter; reciprocal functional eigenvalue is 1/q. | None |
| §6.4 actual-form pairing and APIs | P(F,dH); G dC; two product-rule presentations | Recovers B; zero form pairs to zero; actual multiplication relations are essential. | None |
| §7.0 Tate charts and APIs | n=1,2,3; q=1; p=2 | Loops and parallel edges retained; q=1 excluded; q multiplication preserves dz/z. | None |
| §7.1 branch transport and APIs | u=p; ramification 2; u=1; ω=0 | Branch change 2 gives 2,1,0,0; valuation-ring units correctly distinguished. | None |
| §7.2 proper holomorphic integration and API | ℙ¹; elliptic curve; G_m | Proper values branch independent; nonproper G_m gives λ. | None |
| §7.3 trace and APIs | Identity extension; equal endpoints; quadratic α²=π; tower | Degree factor on embedded scalars; Tr(α)=0, Tr(α²)=2π; composition is linear trace. | None |
| §7.4 divisor integral and APIs | [t²−π]−2[0] with t dt; zero divisor; nonzero degree | Value π; empty sum zero; nonzero degree leaves basepoint dependence. | None |
| §7.5 traced indices and APIs | Quadratic residue 1; infinity; rational point; empty set | Values 2,−2; rational trace identity; empty sum zero; whole index scalar traced. | None |
| §7.6 realization descent and APIs | Good reduction; ramified splitting; common refinement; quadratic constant field | Intrinsic integration compares models; larger constant field uses trace; no whole-curve arbitrary triple sum. | Layer dependency wording corrected for F03 |
| §7.7 Tate normalization and APIs | q=p³, log p=1; n=1,2; q=1; p=2 | Cyclic jump −1; F(qz)=F(z); branch terms cancel with v_p=ν_π/e; n=0 excluded. | None |

The source checks behind these rows include besser2017 line 402, line 421, line 528, line 553, line 700, line 738 and line 807; besser-zerbes2017 line 74, line 88, line 108, line 218 and line 245; besser-dejeu2012 line 2232, line 2243, line 2277, line 2299, line 2430, line 2529, line 2546, line 2591 and line 2769; besser2005 line 355 through line 380; and vologodsky2001 line 51 and line 1806. The latter comparison retains p>2; the all-prime construction uses Colmez.

## Check outcomes

The prescribed dependency command used candidate `packages/ColemanIntegrationPartII/design/README.md`, `--only ColemanIntegrationPartII` and order `merge-order/ORDER.txt`, with the supplied configuration. Exit status: 0. Exact output:

```text
candidate: ColemanIntegrationPartII is not in the merge order yet; checked as if placed after AnabelianGeometryAndNonabelianChabauty (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 10 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The gate's three-roadmap count is supplemented by the supplier checks above.

The scratch consistency check parsed JSON/TOML and compared each target statement, API statement, Check and proof sketch with its README subsection, each layer dependency summary, all internal prerequisite edges and the definition Check minimum. Exit status: 0. Exact output:

```text
JSON/TOML parse: PASS; 6 certified sources
README/plan target, API, Check and layer-dependency agreement: PASS; 45 targets, 135 API entries, 155 Checks
Definition Check minimum: 12 definitions, all with at least three Checks
Internal target dependencies: 112 edges; all references exist and point to earlier targets
Absolute-path and set_option scan: PASS
```

`git diff --check`: exit 0, no output. The final changed-path check exited 0: `Changed-path restriction: PASS; 4 authorized files`. These are the three authorized design/source files and this requested report. The report scan exited 0: `Report absolute-path scan: PASS`. No Lean command was run: this design package contains no `Suggested.lean`, none is authorized for editing, and no elaboration command was supplied. There are no Lean binder or example changes to synchronize, and no claimed Lean build success.

## Maintainer notes

No existing target or API name was renamed or deleted. `descendedLogForms_split` retains its name with the corrected field-of-definition conditions. New names are `NaturalIntegration.abelianLogCp`, `abelianLogCp_openQuotient_torsion`, `abelianLogCp_unique`, `abelianLogCp_functorial` and `abelianLogCp_ofFiniteModel` in §4.0. Only the arbitrary-ℂ_p extension is added; the finite-K supplier's ownership is preserved. Existing §4.0a and all later consumers continue to use the same generality through this added prerequisite.

No edits to another roadmap, merge-order decision, external write or commit were made. All three findings are applied; no finding requires a human scope decision or a supplier gap.
