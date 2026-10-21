# Repair report: ColemanIntegrationPartII

## F01 (P2) — applied

Ordinary definitions → `noncomputable def` for `LogarithmicFunctions.differential`, `LogarithmicFunctions.toPolynomial` and `Annulus.doubleIndex` in `packages/ColemanIntegrationPartII/Suggested.lean`. Their bodies, types and theorem signatures are unchanged. Pinned `HahnSeries.single` uses classical decidability; multiplication uses classical finite antidiagonals. The change acknowledges these dependencies without replacing the mathematical constructions.

## F02 (P3) — applied

The polynomial-image exclusion alone → generator computations plus the retained exclusion. The existing example now proves the images of `(single 0 2, 0)` and `(0, 1)` are `Polynomial.C (single 0 2)` and `Polynomial.X`. Its docstring and README §2.1 Checks agree. Both computations unfold the definition; besser-dejeu2012 line 2232 supplies the formal polynomial-logarithm setting.

## Evidence and consistency

At Mathlib commit `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, inspected on GitHub:

- `Mathlib/RingTheory/HahnSeries/Basic.lean:191`, `HahnSeries.single`, uses scoped classical decidability in its body. Specializing the exponent to integers does not replace that captured decision procedure.
- `Mathlib/RingTheory/HahnSeries/Multiplication.lean:56` opens a noncomputable section; `HahnModule.instSMul` at line 175 constructs convolution from finite support antidiagonals. The multiplication instance at line 395 uses that construction.
- `Mathlib/RingTheory/LaurentSeries.lean:94` opens a noncomputable section; `LaurentSeries.hasseDeriv` at line 116 and `LaurentSeries.derivative` at line 176 supply the existing derivative, which remains imported.
- `HahnSeries.single_zero_one` in `Mathlib/RingTheory/HahnSeries/Multiplication.lean:75` identifies the logarithmic generator's coefficient with the Laurent-series unit. Together with zero preservation and the polynomial constant-map laws, it gives the two new `simp [toPolynomial]` proofs. Extracting polynomial coefficient 2 still gives 0 on the image and 1 on `X²`.

The zero map passes the old exclusion because `X²` is nonzero over the Laurent-series field over ℚ. It fails both new computations. A map that forgets the logarithmic coefficient fails the second computation. Thus F02 detects two distinct incorrect constructions, rather than testing only the derivative.

The formal coefficient decomposition and differentiation agree with besser-dejeu2012 line 2232 (published §7, pp. 355–356), and the residue-first double-index convention agrees with besser2017 line 421 and besser-dejeu2012 line 2243. No new source is cited, and no manifest entry needs alteration. All six existing manifest sources have readable certified cached extractions; no missing-reference request is needed.

Read the main roadmaps `TauCetiRoadmap/JacobianChallenge/README.md`, `TauCetiRoadmap/StableReduction/README.md` and `TauCetiRoadmap/RigidAnalyticGeometry/README.md` for shape and ownership context. The only README edits are the two Checks in §2.1. ColemanIntegration L0.20–L0.23 supplies the analytic polynomial-logarithm algebra; its L1.17a concerns algebraic coefficient extension. The formal coefficient-pair embedding and full analytic coefficient extension here retain their separate ownership.

The open ArithmeticDynamics README was read through its GitHub blob, including §3.58 and its EffectiveDiophantineMethods ED.3/ED.4 contracts. The open ErdosProgressionPowers introduction and ownership contracts were also inspected. Neither supplies the local logarithmic algebra repaired here. The pinned Tau Ceti simple-graph cohomology file still uses target divided by source in `SimpleGraph.coboundary`; the opposite additive differential and signed comparison in this roadmap remain explicit. No supplier contract, ownership boundary or dependency changes.

## Adversarial mathematics pass

Each row covers the subsection's target, named API, defining identities and associated conventions. These are mathematical boundary checks and source comparisons, not Lean execution or proofs of the planned constructions. The two findings require no change to a theorem's hypotheses or conclusion.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 length cochains | Empty graph; isolated vertex; loop; one edge of length 1/2; reverse orientation | Empty cochains vanish; loop flags cancel; d(2,5)=−3; pairing of 2 and 3 is 12; divergence of 2 is ±4. | None |
| §1.2 harmonic decomposition | Tree; cyclic triangle (3,0,0); two isolated vertices; characteristic 3 | Harmonic part is (1,1,1); exact part (2,−1,−1); disconnected ambiguity is componentwise. The characteristic-3 counterexample is excluded by CharZero. | None |
| §1.3 subdivision | Identity; jump 6 split in length ratio 1:2; attached tree; zero length | Jumps 2 and 4 preserve total, weighted energy and residue product; a tree has zero current. Strict positivity excludes zero denominators. | None |
| §2.0 residues and germs | z=t²; z=t⁻¹; identity; constant map; quadratic residue; infinite negative tail | Residue factors are 2, −1 and 1. Constant maps are excluded; trace of residue 1 is 2; formal germs require finite principal part. | None |
| §2.1 logarithmic functions and embedding | Scalar 2; L; 2+3L; L²; zero and Laurent-only candidate maps; characteristic-p monomial | Images of the two generators are C(2) and X; coefficient 2 excludes X². Residue of d(2+3L) is 3. Characteristic zero protects the constant kernel. | F01, F02 |
| §2.1a analytic coefficients | ℚ₂; ℚ₃; residue characteristic zero; open versus closed annulus | Half-square and third-power primitives differentiate correctly. Interior radii absorb inverse-integer growth; a closed boundary need not. | None |
| §2.2 double index | (1,L); (L,1); (z,z⁻¹); (L,L); scalar shifts | Values 1, −1, −1 and 0; change is a Res(dG)−b Res(dF). The differentiated slot and sign agree with the sources. | F01 |
| §2.3 double transport | Degrees 1 and 2; reversal; coefficient embedding | Multipliers 1, 2 and −1; coefficient extraction commutes with the embedding. Branch transport remains required. | None |
| §3.0a component cover | Smooth fibre; ordinary node; self-node; pole at node | Smooth case is the supplied cover; subdivision separates the self-node domains. Pole separation excludes the incompatible support. | None |
| §3.0b full analytic coefficients | Transcendental geometric series; scalar; logarithm; residue-disc indicator | Full analytic coefficients exceed finite tensor sums. Scalars have zero derivative; logarithms do not; unrelated locally constant indicators fail Coleman continuation. | None |
| §3.0c cohomology and operators | Smooth positive genus; total coboundary; diag(1,q), Ne₂=e₁; residue field 𝔽₄ | Proper cohomology survives χ=N=0; coboundaries vanish; Nφ=qN. Identity coefficient lift over 𝔽₄ requires a power of 4. | None |
| §3.1 wide-open double sum | Zero form; rational core; proper holomorphic forms; second-kind cup value 1 | Zero and rational cases give 0; the second-kind example gives 1. A universal zero pairing fails. | None |
| §3.1a reciprocity | Analytic exact form; logarithmic unit; G_m; degree-two boundary over 𝔽₃ | Exact and logarithmic-unit classes are radical. The nonsplit boundary eigenvalue −3 squares to 9; 1/q remains absent. | None |
| §3.2 harmonic primitives | Bridge jump 2; smooth fibre; cyclic jump 1; self-node | A component shift kills the bridge jump, while a cyclic period survives. The normalized object has one common constant ambiguity. | None |
| §3.3 correction | (c,d,rη,rω)=(2,3,5,7); reversal; one component shift | Correction is −11 and reversal preserves it. A component shift changes both sides consistently. | None |
| §3.4 corrected pairing | ℙ¹ with empty boundary; good reduction; second-kind cup 1; exact form | Values are 0, the component pairing, 1 and 0 respectively. Proper classes require the stated Čech carrier. | None |
| §3.5 Frobenius and monodromy | N=0; symplectic plane; identity operator; residue-degree-two extension | diag(1,q) scales by q; skew-adjoint terms cancel. Identity fails q-scaling on a nonzero pairing. Extension requires the stated iterate. | None |
| §4.0 geometric logarithm | Dimension zero; torsion point; small tangent vector; transcendental-j elliptic curve | Values are 0, 0 and v. Arbitrary ℂ_p-defined varieties require the additional theorem, rather than finite-model point extension. | None |
| §4.0a abelian primitives | Zero variety; invariant form; df; normalized quadratic trace | Primitive is the group logarithm pairing or f as appropriate. Normalized trace needs 1/2, which exists over ℚ₂. | None |
| §4.0b Albanese reduction | Point; A¹; G_m; dt/(t²−2) over ℚ₃; transcendental pole | Exact and logarithmic terms are distinct. The quadratic trace recovers the nonsplit form. Finite-algebraic spanning does not include a transcendental pole. | None |
| §4.0c natural integration | dt on A¹; dlog on G_m; equal endpoints; arbitrary ℂ_p variety; completed unramified field; nonclosed algebraic closure | Values 1, T and 0 distinguish the theory. Closed-field descent handles noncompact coefficients; dropping closedness invalidates the fixed-field identification. | None |
| §4.0d principal reciprocity | Nonzero constant f; f=0; (t−a)/(t−b) with dt; z=t² | Constant case vanishes; f=0 is excluded. Divisor integral and infinity residue are a−b, with opposite local-index sign. Pullback counts ramification 2. | None |
| §4.0e Jacobian bridge | Genus zero; split multiplicative elliptic curve; valuation on K× | Jacobian integral vanishes in genus zero. Proper J(K) is compact in bad reduction too; the noncompact valuation example cannot imply vanishing. | None |
| §4.1 rational logarithms | xy=π with f=x; scalar; zero function | Residue is 1=ord_head−ord_tail=−d(ord). Scalars give zero; zero is excluded from dlog. | None |
| §4.2 harmonic identification | Tree; cycle; exact and logarithmic forms; Tate valuations 1/3 and 2/3 | Smooth-residue comparison holds with one common constant; annular corrections −1/3 and −2/3 prevent whole-wide-open constant agreement. | None |
| §4.3 annular values | F_tail=2, c=6, t=1/3; reversal; quadratic refinement | Both orientations give 4; refined jumps 3+3 recover 6. Constant annular correction fails the Tate test. | None |
| §4.4 point-sum | Empty support; holomorphic forms; proper second-kind classes; cycle | Holomorphic sum is 0, compatible with isotropy. Second-kind representatives give the ordered cup value; cycles retain the graph correction. | None |
| §5.1 labelled primitive data | Three L functions with half squares; zero functions; opposite constants; incompatible (1,0) choice for (0,L) | Half squares and opposite shifts satisfy the equations. The incompatible pair sums to 1 rather than 0. Labels retain independent choices. | None |
| §5.2 local triple index | (1,1;L); (z,z;z⁻²); (z,z⁻¹;L); three half squares | Values are 1, −2, 1 and 0. Division by 3 is valid over ℚ₃. | None |
| §5.3 auxiliary changes | (L,0;L); shifts 1 and 2; zero residue; unused pair change | Changes are −1 and −2. Zero residue kills the relevant error; the F,G pair has no effect. | None |
| §5.4 simple-pole formula | (2+L,3;L); three half squares; u=az | Values 6 and 0; the bare constant coefficient changes by −log(a), while the fully transported expression agrees. | None |
| §5.5 triple transport | Degree 2; identity; reversal; extra auxiliary constant | Multipliers 2, 1 and −1. An untransported primitive constant contributes the residue error. | None |
| §6.0 actual-form relations | Analytic coefficient; nonzero symbol; G dC | Analytic symbols and G dC vanish. A nonzero symbol prevents an actual zero form; free-symbol bilinearity alone is insufficient. | None |
| §6.1 global triple sum | Zero triple; rational core; G=1 with B_U(F,H)=1 | Values 0, 0 and 1 distinguish actual functions from differential classes. Global choice independence is supplied by §6.2. | None |
| §6.2 cancellation | Global shift; one-end shift with residues ±1; G↦G+2 | Global errors cancel, but the one-end shift gives −1. Ordinary scalar addition contributes 2 when B_U=1. | None |
| §6.3 eigenclass vanishing | Zero eigenclass; q=2; residue extension to q=4; G=1 and arbitrary F | Both eigenclass conditions are needed. The resulting functional has eigenvalue 1/q; extension uses iteration. | None |
| §6.4 Coleman form pairing | 1·dH; G dC; G dH+H dG | Values reduce to B_U, zero, and the same value in equal actual-form presentations. The relation theorem is essential. | None |
| §7.0 Tate differential | q=p³; loop and parallel-edge cases; q=1; p=2 | Final gluing subtracts log(q) and preserves dz/z. Positive valuation excludes q=1; flag charts retain small n. | None |
| §7.1 branch specialization and Lean affine API | Slope 1; slope 1/2; slope 0; equal branches; zero ring; ring homomorphism | Changes from 0 to 2 are 2, 1 and 0. The algebraic law is distributivity, valid in every commutative ring and compatible with coefficient maps. | None |
| §7.2 proper holomorphic forms | ℙ¹; elliptic curve; nonproper G_m | Proper examples have branch slope zero; G_m from 1 to p has value λ. Properness cannot be omitted. | None |
| §7.3 coefficient trace | Identity extension; equal endpoints; ramified quadratic at p=2; α²=π | Trace of a base value is degree times that value. Tr(α)=0 but Tr(α²)=2π; trace is not multiplicative. | None |
| §7.4 divisor integration | Zero divisor; b−a; quadratic point minus 2[0] with t dt; wrong degree | Values 0, I(a,b), and π. Subtracting only one rational point leaves degree 1 and basepoint dependence. | None |
| §7.5 traced local sums | Rational point; quadratic point; empty support; trace of products | Local 1 traces to 2 at the quadratic point; infinity contributes −2. Only the complete scalar index is traced. | None |
| §7.6 realization descent | Good reduction; ramified splitting; common refinement; quadratic constant field; unrelated component choices | Intrinsic integral values agree. Constant-field scalar 1 traces to 2. Unrelated component triple choices need not cancel. | None |
| §7.7 Tate normalization | q=p³, log(p)=1; n=1,2; q=1; p=2 | Harmonic jump is −1; F(z)=log(z)−ν_p(z) is q-periodic and branch independent. n>0 excludes division by zero. | None |

Source comparisons for this pass included besser2017 line 402, line 421, line 492, line 528, line 553, line 583, line 609, line 646, line 654, line 700, line 738 and line 777; besser-dejeu2012 line 2232, line 2277, line 2299, line 2413, line 2430, line 2546, line 2591 and line 2769; besser-zerbes2017 line 74, line 88, line 99, line 108, line 130, line 142 and line 245; colmez1998 line 246, line 2957, line 2986, line 2996, line 3079, line 3113, line 3147, line 3169, line 3193, line 3376 and line 3399; besser2005 line 355, line 358, line 365 and line 369; vologodsky2001 line 51 and line 1806. Metric and trace consequences remain identified as derived statements. The p>2 convention is retained only for the Vologodsky-preprint comparison.

## Check outcomes

- **Lean elaboration: not available.** No Lean command was run. The new proof scripts were checked against the pinned definitions and simplification lemmas at source level; successful elaboration and the absence of diagnostics beyond `sorry` warnings are not certified.
- **Dependency direction:** the prescribed `gate --depcheck` command, with README `packages/ColemanIntegrationPartII/README.md`, name `ColemanIntegrationPartII` and order `merge-order/ORDER.txt`, exited 0. Complete output:

  ```text
  depcheck: 3 roadmaps, 19 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line occurred. This is the gate's stated three-roadmap scope, not a claim that all remote supplier implementations were checked.
- **Static Lean/README agreement:** 240 Lean lines; one import, `import Mathlib`; six definitions/abbreviations with real bodies; fourteen theorem declarations; six example blocks; zero declaration names missing from README; zero admitted examples; zero admitted data; zero `set_option` commands. No example block was added, so the two-example limit for each kept definition is preserved. No declaration was renamed, added or deleted, and no theorem binder or docstring required adjustment.
- **File checks:** `git diff --check` exited 0. `metadata.toml` and `sources.toml` parse as TOML. Both remain unchanged. The edits are confined to the two authorized package files and this requested report; the worklist is in the authorized scratch area.
- **Maintainer consequences:** both findings are applied. No supplier gap, ownership move, merge-order change or changed downstream declaration name is introduced. No commit, push or GitHub write was performed. The fourteen admitted targets still require future proofs, and an independent review remains necessary.
