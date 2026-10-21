<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/96#issuecomment-6309095982 -->
Review (codex) of c00c3c5

Verdict: needs_changes

1. **F01** (P2) Import existing formal residue and point-expansion theory

   **Location.** `packages/ColemanIntegrationPartII/README.md:186`, §2.0: “a uniformizer identifies its completed local ring with κ(x)[[z]] and its meromorphic differential germs with κ(x)((z))dz”. Also the formal-substitution proof at `:194`, monomial integration at `:218`, and the supplier lists at `:196` and `:220`.

   **Claim.** The package includes general completed-local expansions and formal residue calculus among its own residue/germ constructions, without naming their existing owners. The proof sketches reconstruct formal substitution and primitive calculus from coefficients. The logarithmic extension and index adapters are new, but these underlying objects and theorems are already planned on main. This violates the import-by-object principle.

   **Witness.** `TauCetiRoadmap/AlgebraicCurves/README.md:887` assigns completed-local expansions and traced residues to Layer 9. `TauCetiRoadmap/FormalLaurentPuiseux/README.md:142` states the formal residue pullback formula; `:160` states residue-zero primitives. Neither roadmap appears in this package's supplier contracts.

   **Exact repair.** Add ownership deferrals and exact supplier contracts for AlgebraicCurves Layers 5 and 9 and FormalLaurentPuiseux L1–L3. Import the completed-DVR/point expansions, geometric residues and proper residue theorem from AlgebraicCurves; import formal substitutions, derivative rules, residue transport and residue-zero primitives from FormalLaurentPuiseux. Rewrite §2.0 to retain only the additional analytic finite-map and formal/analytic comparison adapters. Its meromorphic residue agreement should use ColemanIntegration L0.11 `annulusResidue_laurentSeries`, rather than claim that agreement as an additional underlying theorem. In §§2.1–2.3 use the imported formal calculus to construct the new polynomial-logarithm extension, degree-one presentation and double index. Keep their genuinely new signatures and Checks. Add the corresponding `*Needs:*` citations and rerun the dependency check. Both additional owners are on main, so no upward dependency or gap is required. Do not narrow the mathematical statements or delete the new logarithmic/index theory.

2. **F02** (P3) Mirror the characteristic-p negative control in Lean

   **Location.** `packages/ColemanIntegrationPartII/README.md:228`: “Characteristic p would also make d(z^p)=0.” The related proved examples are at `packages/ColemanIntegrationPartII/Suggested.lean:75` and `:87`.

   **Claim.** This Check is statable on the file's own real-bodied `LogarithmicFunctions` and `differential`, but neither example tests it. The first example assumes characteristic zero; the second uses ℚ throughout. Thus the README's negative control for the constant-kernel hypothesis has no Lean mirror.

   **Witness.** Over `ZMod 2`, take `F = (HahnSeries.single 2 1, 0)`. Its differential is zero, while coefficient 2 proves F is not any scalar pair `(HahnSeries.single 0 c, 0)`.

   **Exact repair.** Add the computed characteristic-two derivative and the non-scalar assertion as conjuncts of an existing example block, preserving the two-example limit. Prove them from the actual `differential` definition and singleton coefficient/derivative identities, without an admitted example or option override. Make the README Check name this concrete field and monomial. The mathematical theorem's `[CharZero k]` hypothesis is already correct and should remain.

Two findings: one P2 blocker and one P3 Check omission. The extension's scope is appropriate; the ownership defect is locally repairable and does not warrant rejecting the roadmap. No supplier gaps are declared. No package implementation, metadata or source-manifest entry was changed during this review.

## Previous findings and repairs

The requested previous review, `packages/ColemanIntegrationPartII/reports/REV-PKG-ColemanIntegrationPartII.md`, is absent. The available repair report, `packages/ColemanIntegrationPartII/reports/FIX-PKG-ColemanIntegrationPartII~2.md`, records F01 and F02, both as applied. The following checks independently verify those repairs; the absent review's precise wording cannot be reconstructed.

| Finding recorded by repair report | Repaired passage | Result |
| --- | --- | --- |
| F01, noncomputable constructions | `packages/ColemanIntegrationPartII/Suggested.lean:37`, `:43`, `:114`: `noncomputable def differential`, `noncomputable def toPolynomial`, `noncomputable def doubleIndex` | Repaired at source level. The three real bodies remain intact. At the Mathlib pin, `HahnSeries.single` uses scoped classical decidability and multiplication is in a noncomputable section. Elaboration was unavailable. |
| F02, polynomial comparison tests | `packages/ColemanIntegrationPartII/README.md:226`: `toPolynomial (single 0 2, 0) = Polynomial.C (single 0 2)`; `:227`: `toPolynomial (0, 1) = Polynomial.X` | Repaired. Both equalities occur in the proved example at `packages/ColemanIntegrationPartII/Suggested.lean:87`, alongside exclusion of `X²`. The zero map fails the first equality; the Laurent-only map fails the second. |

Neither recorded repair is marked not actionable. The findings below are new, not re-raised settled findings.

## Verified sound

### Coverage and principles

Read all four package files, all 45 numbered README subsections and their named API statements, all 45 `*Needs:*` lines, the seven layer dependency summaries, all 240 Lean lines, and both entries in the repair report. The README contains 164 Check bullets in its numbered sections. Each definition subsection has at least three; the named embedded definitions, including descended logarithmic forms and affine specialization, have APIs and positive/negative or computed examples.

Read the main-branch roadmaps JacobianChallenge, StableReduction and RigidAnalyticGeometry for shape and ownership. The package has the requested opening, ownership, conventions, exact supplier contracts, build paragraph, seven layers with Examples and Dependencies, downstream consumers and references. No route-specific prime restriction, computational algorithm, whole-roadmap replanning, copied source passage, process identifier, LaTeX delimiter, `set_option`, admitted data or `lemma` declaration was found. Formal theory keeps characteristic-zero fields; analytic general-coefficient extensions remain distinct from the supplied complete-subfield theory. Finite-field compactness and semistable arguments are explicitly restricted to finite extensions of ℚ_p. The Vologodsky preprint comparison alone retains its p>2 hypothesis.

The package extends ColemanIntegration's good-reduction theory instead of replacing it. It does not claim a choice-independent whole-curve triple pairing from unrelated component primitives. Formal Laurent series and arbitrary analytic Laurent families remain distinct. The ownership exception is R01.

### Seeded source verification

All six manifest sources have readable certified cached extractions. Read the text at every sampled locator, including the surrounding hypotheses and printed page markers. There are no author-flagged unverified locators or uncertified/waived entries. No additional source acquisition was necessary. In the table, “derived” means the package gives an extension or consequence of the cited result; it is not attributed to a nonexistent theorem in the source.

| Sampled target | Text read and locator verdict |
| --- | --- |
| §1.3 Subdivision with a fixed metric | besser-zerbes2017 line 99 and line 108, p. 3; besser2017 line 768, pp. 15–16. Equal subdivisions have jumps c/m; arbitrary positive rational lengths and energy preservation are derived by constant current and summation. The package retains the fixed metric and m>0. |
| §2.1 Functions with one logarithmic term | besser2017 line 402, Definition 3.1, p. 9; besser-dejeu2012 line 2232, §7, printed pp. 355–356. The formal coefficient field has characteristic zero; derivative image, scalar kernel and degree-one subspace match. The polynomial embedding is the package's light presentation. R01 concerns its prerequisite ownership, not the formula. |
| §2.2 The alternating local index | besser2017 line 421 and line 428, Definition 3.2 and Lemma 3.3, p. 9; besser-dejeu2012 line 2243, Definition 7.1, p. 356. Differentiated slot, alternation and the two opposite constant-shift signs agree. |
| §3.1 The end-sum on a wide open | besser2017 line 492 and line 503, Definition 3.8 and Proposition 3.9, p. 11; line 516, Remark 3.10. Global primitives, finite ends, end orientation and compatible shrinking agree. Proper holomorphic forms giving zero do not imply that the proper cohomology pairing is zero. |
| §3.1a Cohomology and wide-open reciprocity | besser2017 line 503 through line 515, p. 11; besser-dejeu2012 line 2594 through line 2620, p. 362; besser-zerbes2017 line 212, p. 4. Exact/rational-core vanishing, proper projection, q-radical and logarithmic-unit claims are supported by these ingredients. Nonsplit qζ eigenvalues use the explicitly imported rigid Gysin/weight contracts; this is a derived extension of the split spectrum argument. |
| §3.5 Frobenius and monodromy compatibility | besser2017 line 754 through line 784, Proposition 4.12(4), pp. 15–16. Scaling is q; monodromy is skew-adjoint. The package uses its constructed operators, χφ=χ, Nφ=qN, χN=N and N²=0; it does not repeat the source proof's unnecessary reference to the later Corollary 5.3. |
| §4.0b Reduction to the Albanese | colmez1998 line 3376 and line 3399, Lemmas II.1.26–II.1.27, pp. 83–85; line 602 for algebraically closed characteristic-zero scope; line 1938 through line 2100, §I.5, pp. 45–49; line 246 for descent. Proper Albanese and rational forms are the correct objects. Traced logarithmic descent is explicitly derived, and the package correctly distinguishes algebraic closure from an arbitrary transcendental overfield. |
| §4.0e Jacobian differentials and topology | colmez1998 line 3147 and line 3213, Lemma II.1.13 and Remark II.1.18, pp. 78–79; besser-zerbes2017 line 142 through line 150, pp. 3–4. The integral/logarithm comparison is supported. The open compact subgroup and moving arguments are additional spelled-out topology steps, not literal quotations from those lines. Finite K, a temporary point and additivity are retained. |
| §4.2 Smooth residue domains | besser-zerbes2017 line 74 through line 88, Theorem 1.1, p. 2, and line 130 through line 218, §§1–2, pp. 3–5. Harmonic normalization and the principal-divisor comparison match. Extension to p=2 uses the independent Colmez theory, not the p>2 Vologodsky preprint. |
| §4.3 Valuation term | besser-zerbes2017 line 108, Corollary 1.2, p. 3. The sign is plus cν_π(x), with ν_π(π)=1; the package's tail/head convention and reversal computation agree. |
| §5.2 Local triple index | besser-dejeu2012 line 2277, Proposition 7.3, pp. 356–357; line 2327, Lemma 7.5, pp. 357–358; the construction through equation (7.6), p. 359. Linearity transports choices; reduction requires the middle argument Laurent. Labels and nonzero auxiliary constants at zero functions are retained. |
| §5.4 Local normalization | besser-dejeu2012 line 2413 and line 2430, Definition 7.7 and Proposition 7.8, pp. 359–360. All three differentials must have at most simple poles. Both negative primitive-constant terms and parameter dependence of the constant coefficient match. |
| §5.5 Orientation, parameter and degree | besser-dejeu2012 line 2524 and line 2529, §8 and Lemma 8.1, p. 361. The source explicitly pulls back auxiliary data. General maps, formal substitutions, orientation and scalar variants follow from uniqueness and the residue degree law. Positive degree ensures division is legal. |
| §6.0 Actual Coleman-form relations | besser-dejeu2012 line 2769 and line 2784, Lemma 9.1 and Proposition 9.2 proof, p. 364. The symbol takes values in H¹⊗Ω¹, and the multiplication kernel lies in analytic-function tensors. The package states a theorem about actual forms rather than imposing a relation on unrelated symbols. |
| §7.4 Divisors without a basepoint | besser-zerbes2017 line 142, §2, p. 4, together with colmez1998 line 246, Remark 2(iv), pp. 2–3. The closed-point/trace formulation is a derived descent statement. Counting all embeddings gives degree Σ n_x[κ(x):K]; Chasles and degree zero remove the temporary point. |

Also read colmez1998 line 2957 through line 3009 for the closed-field coefficient scope and natural-integration axioms, line 3079 through line 3121 for arbitrary geometric abelian varieties and torsion open quotients, and line 3169 through line 3214 for cocycle splitting and rigidified abelian primitives. Read besser2005 line 355 through line 380 for principal-divisor reciprocity and finite-map projection; the package uses the preprint's actual Proposition 3.4 numbering. Read vologodsky2001 line 51, line 187 through line 195 and line 1806: p>2 is standing there, finite extension is Theorem B(4), and Proposition 52 compares single integration with Colmez. No unread text is being treated as verified.

### Adversarial mathematics pass

Each row covers the subsection's defining equations, headline, named API, proof dependencies and conventions, not merely its title. The tests are hand calculations and mathematical checks, not executions of Lean. Nonapplicable cases are excluded by the explicit field, characteristic-zero, positivity, separability, smoothness, connectedness or finiteness hypotheses. No additional mathematical counterexample was found. “None” in the change column means no mathematical repair was identified, not that the planned theorem has been formally proved.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 LengthCochains and API | Empty graph; isolated vertex; loop; edge length 1/2; reversed flags | Empty C¹=0; loop current has zero divergence; c=2 gives ±4 divergence. Pairing 2 with 3 gives 12. d(2,5)=−3, opposite the pinned coboundary. | None |
| §1.2 Decomposition, projection, rank and quotient bridge | Tree; two components; triangle (3,0,0); characteristic 3 | Triangle splits into (1,1,1)+(2,−1,−1); two isolated vertices have two constants. In characteristic 3 a nonzero exact harmonic cochain shows why CharZero matters. Positive rational weights keep rank after scalar extension. | None |
| §1.3 Subdivision laws | Jump 10 split in lengths 2/5,3/5; identity; attached tree | Jumps 4,6 have sum 10; energy 16/(2/5)+36/(3/5)=100 at original length 1; tree current vanishes. | None |
| §2.0 Residues and germs | z=t³; z=t⁻¹; quadratic residue field; infinite negative support | Residues scale by 3 and −1; trace of 1 is 2. Infinite negative analytic tails cannot enter the formal carrier. Mathematical laws are sound, underlying ownership is not. | R01 |
| §2.1 LogarithmicFunctions, differential, embedding and API | L, scalar 2, z⁻², L², z² over 𝔽₂ | dL=z⁻¹; a primitive of z⁻² is −z⁻¹; coefficient 2 excludes X² from the embedding. In 𝔽₂, z² is a non-scalar with zero derivative. | R01 prerequisite imports; R02 test |
| §2.1a General analytic coefficients | ℚ₂, ℚ₃, residue-characteristic-zero norm; closed boundary | Half-square/third-power primitives are valid in characteristic zero. Inverse-integer growth is polynomial and absorbed by interior radii; closed-boundary convergence is not promised. | None |
| §2.2 Double index and uniqueness | (1,L), (L,1), (z,z⁻¹), (L,L), scalar shifts | Values 1,−1,−1,0. Bilinear decomposition determines the pairing; shifts give a Res(dG)−b Res(dF). | None |
| §2.3 Double transport | Identity, degree 3, reversal, coefficient embedding | B(1,3L)=3; reversal gives −1; no degree-zero division. Trace is used on coefficients, not as a multiplicative map. | R01 prerequisite import |
| §3.0a Component cover | Smooth model; ordinary node; self-node; poles meeting nodes | Smooth case reduces to the supplied construction; self-nodes require subdivision. Separated pole support excludes the incompatible node case. | None |
| §3.0b Full coefficients | Transcendental geometric series; scalar; log; disc indicator | Powers of a transcendental coefficient span infinitely over K; full coefficients exceed finite tensor sums. dlog is nonzero and unrelated disc constants violate continuation. | None |
| §3.0c Čech, χ,N,φ,cup and extension APIs | Global form; coboundary; positive genus with no graph; 𝔽₄ coefficients | χ gives the stated jump and kills coboundaries. Graph-only cohomology misses proper classes. Identity coefficient lift over 𝔽₄ needs a power of 4; extension distinguishes iteration from scalar extension. | None |
| §3.1 End-sum and restriction | Zero differential; rational core; second-kind pair of cup value 1 | Constant changes cancel by total residue; rational pairing is 0; second-kind pair has value 1. Newly removed regular discs contribute zero. | None |
| §3.1a Reciprocity and spectrum | Analytic exacts; dlog z; degree-two boundary over 𝔽₃ | Exacts and logarithmic units are radical. The anti-diagonal boundary eigenvalue is −3, whose square is 9; 1/3 is absent. | None |
| §3.2 Harmonic primitive data | Bridge jump 5; one component; loop after subdivision; cycle | A component shift removes the bridge jump; a cycle period survives. Uniqueness is one common constant because the graph is connected. | None |
| §3.3 Auxiliary correction | c=2,d=3,rη=5,rω=7; reversal; one component shift | Correction −11 stays −11 under reversal; individual component shifts can change both sides. No premature choice independence. | None |
| §3.4 Corrected pairing and APIs | Empty Z on ℙ¹; proper positive genus; exact representative | ℙ¹ gives 0; Čech representatives retain the full proper cup product; exact classes vanish. Metric factors cancel the inserted length in N_ℓ. | None |
| §3.5 Operator laws | Symplectic plane, φ=diag(1,q), Ne₂=e₁; N=0; φ=id | Scaling q and cancellation 1−1 hold. Identity fails the scaling for q≥2; the statement uses constructed operators. | None |
| §4.0 Geometric logarithm | Zero variety; torsion; small nonzero tangent; transcendental j | Values 0,0,v distinguish the logarithm. Arbitrary ℂ_p-defined varieties need the additional existence theorem; finite-model point extension alone is insufficient. | None |
| §4.0a Abelian primitives and splitting | Invariant form; df; zero variety; quadratic descent | Invariant primitive is logarithmic and branch independent; df has primitive f modulo affine constants. Normalized trace requires division by 2, legal over ℚ₂. | None |
| §4.0b Albanese and LogDesc APIs | Point; A¹; G_m; dt/(t²−2) over ℚ₃; transcendental pole | Exact dt and logarithmic dt/t are distinct. Quadratic trace gives dt/(t²−2). A pole at transcendental α cannot be generated by finite-algebraic-field rational logarithms. | None |
| §4.0c Natural integration and descent APIs | Equal endpoints; A¹ dt; G_m dlog; completed unramified field; nonclosed field | Values 0, b−a, T. Closed-field descent handles noncompact coefficients. Dropping closedness gives ℚ̄_p with trivial stabilizer but fixed field ℂ_p. Uniqueness is for a natural theory, not arbitrary primitives. | None |
| §4.0d Principal reciprocity and projection | Constant nonzero f; f=0; (t−a)/(t−b), ω=dt; degree-two map | Constant case is zero; f=0 excluded. Infinity residue equals a−b, opposite its local-index contribution. Ramification multiplicity 2 is retained. | None |
| §4.0e Jacobian/topology bridge | Genus 0; multiplicative elliptic reduction; noncompact K× | Genus-zero map is trivial. Proper J(K) remains compact in bad reduction; a locally constant homomorphism to additive K vanishes. The valuation on K× is the excluded noncompact counterexample. | None |
| §4.1 Rational logarithms | xy=π, f=x; f constant; f=0 | Residue 1 equals ord_head−ord_tail=−d(ord); constants give zero; zero function is excluded. Metric orthogonality uses the corresponding weighted exact cochain. | None |
| §4.2 Harmonic identification | Tree; cycle; df,dlog f; Tate valuations 1/3,2/3 | Smooth-residue agreement holds modulo one constant; whole-annulus constant agreement fails with corrections −1/3,−2/3. | None |
| §4.3 Annular formula | F_tail=2,c=6,t=1/3; reverse; m=2 | Both orientations give 4; refinement jumps 3+3 recover 6; m>0 prevents division by zero. | None |
| §4.4 Point-sum | Z empty; holomorphic pair; second-kind pair; cycle | Holomorphic isotropy gives 0; second-kind representatives recover ordered cup; graph correction remains necessary. | None |
| §5.1 Labelled primitive data | Three L's; all zero; opposite shifts; incompatible (1,0) for (0,L) | Half squares satisfy products and derivatives; zero functions allow opposite off-diagonal constants. (1,0) fails the product equation; (1,−1) passes. | None |
| §5.2 Triple characterization and APIs | (1,1;L), (z,z;z⁻²), (z,z⁻¹;L), three L's | Values 1,−2,1,0. Equal labels do not erase auxiliary choices; division by 3 is legal in ℚ₃. | None |
| §5.3 Primitive changes | F=L,G=0,H=L; shifts C=1,2; unused pair | Values change by −1,−2; F,G pair has no effect; zero residue removes the relevant change. | None |
| §5.4 Simple-pole normalization | (2+L,3;L); half squares; u=az | Values 6 and 0. Constant coefficient changes by −δ; transported full expression is invariant. Higher-order poles are excluded. | None |
| §5.5 Triple transport | Degree 2; identity; reversal; added primitive constant | Multipliers 2,1,−1; forgetting transport of one primitive contributes the residue error. | None |
| §6.0 Actual-form relations | Analytic coefficient; nonzero symbol; G dC | Analytic tensors have zero symbol; nonzero symbol precludes zero actual form; scalar C gives zero. Kernel containment is a substantive realization theorem. | None |
| §6.1 Global triple definition | Zero triple; rational core; G=1 on positive genus | Values 0,0,B_U(F,H). The latter can be 1, disproving descent to three differential classes. | None |
| §6.2 Global laws | Global primitive shift; single-end shift; G↦G+2 | Global residues cancel; a single-end shift need not. With B_U=1 the ordinary constant addition changes T_U by 2. | None |
| §6.3 q-eigenspace vanishing | Zero classes; q=2; quadratic residue extension; arbitrary F,G=1 | Both eigenclass hypotheses are necessary. The induced functional has eigenvalue 1/q; extension uses the specified iterate and q^f. | None |
| §6.4 Actual-form pairing | 1·dH; G dC; two presentations of a product differential | Values B_U,0 and equal values respectively. Actual relations, not free-symbol bilinearity, justify descent. | None |
| §7.0 Tate differential/charts | q=p³; n=1,2; q=1; p=2 | Final gluing subtracts log q and preserves dz/z; flags/subdivision retain small n. q=1 is excluded by positive valuation. | None |
| §7.1 Branch and affine APIs | Zero ring; arbitrary commutative ring; slopes 0,1,1/2; equal branches | Distributivity proves the algebraic law without domain assumptions. Branch change 2 gives 0,2,1. The value space does not claim to construct an integral. | None |
| §7.2 Proper holomorphic integration | ℙ¹; elliptic curve; G_m | Proper holomorphic values have slope zero; G_m integral from 1 to p equals λ. Properness is necessary. | None |
| §7.3 Trace and averaging | Identity extension; ramified quadratic at p=2; α²=π; equal endpoints | Base values trace to degree times the value; Tr α=0, Tr α²=2π. Averaging divides by degree; specialized primitive constants are K-valued. | None |
| §7.4 Divisor integral APIs | Empty support; b−a; quadratic point minus 2[0]; nonzero degree | Values 0,I(a,b),π for t dt. Wrong degree leaves a basepoint term. Embeddings count each geometric point once. | None |
| §7.5 Traced local/end sums | Rational and quadratic points; empty Z; trace of a product | Trace 1 is 1 or 2; quadratic infinity contribution −2 cancels. Tracing inputs separately gives a false product identity. | None |
| §7.6 Realization descent | Good reduction; ramified splitting; common refinement; quadratic constant field | Values agree through the intrinsic integral. Constant-field trace doubles scalar 1. Unrelated whole-curve triple choices remain excluded. | None |
| §7.7 Tate normalization | q=p³, λ=1; q multiplication; branch change; n=1,2 | F=log z−ν_p(z), jump −1. Both two-term differences vanish. Positive n and characteristic zero justify all denominators. | None |

The fourteen Lean theorem signatures were additionally checked independently: formal primitive existence divides all coefficients except exponent −1; the derivative kernel follows coefficientwise in characteristic zero; residue recovers the second coordinate; coefficient 0 and 1 prove polynomial injectivity; the double-index identities follow from residue integration by parts and the Laurent/logarithm decomposition; the four affine specialization laws follow from ring distributivity and homomorphism laws. All required hypotheses occur in the declarations themselves. There is no discarded section-variable hypothesis or hypothesis that merely assumes its conclusion.

### Duplication and supplier audit

The object audit searched the main roadmaps and sibling packages for Albanese/Jacobian objects, local expansions, residues, logarithms, graph cochains, harmonic decompositions and indices. It inspected FormalLaurentPuiseux L1–L3 and AlgebraicCurves Layers 5/9 rather than only searching for this package's new names. This produced R01. No duplicate owner was found for the retained double/triple indices, metric multigraph extension, natural integration or their comparison theorems.

At Mathlib commit `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, inspected the cited files for Graph and loops, simple-graph LapMatrix, p-adic fields and ℂ_p, Laurent/Hahn series and differentiation, and field trace. In particular `Mathlib/RingTheory/LaurentSeries.lean:176` supplies `LaurentSeries.derivative`; `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:125` supplies the sum of vertex-minus-neighbor differences; `Mathlib/RingTheory/Trace/Defs.lean:137` requires finite free stages for trace transitivity; `Mathlib/RingTheory/Trace/Basic.lean:249` supplies the separable embedding sum at the root namespace. These are imported rather than redeveloped. The broader rational-length multigraph theorem is a genuine extension of the simple-graph floor.

At Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, inspected `TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean`, `Map.lean` and `Relabel.lean`. The supplied coboundary is target/source, so the package correctly negates the additive differential in the chain bridge while preserving cochain values in the quotient bridge. Inspected `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84`, `:109`, `:173`: the existing predicate, hom equivalence and uniqueness are used, not replaced. Inspected `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:88` and `:151` for the norm and completeness hypotheses. No pinned local-index implementation was identified by the object search.

The following remote roadmaps were read at their open heads, not inferred from pull-request descriptions. Supplier references in the package use names and sections, not pull-request numbers.

| Supplier or context | Head inspected | Contract check |
| --- | --- | --- |
| ColemanIntegration | `acaaf506f3822fc5c8211345cb48f6b1cb00656c` | L0.A1–A2, L0.11–12, L0.15–23; L1.2–3, L1.17–19, L1.17a, L1.43. Analytic logarithmic rings and algebraic coefficient extension have the advertised scope. Full analytic extension is an additional target here. |
| PadicPeriodRings | `e37c9fb3ff76bd2b8fb3e48a5dcb421dfba2899e` | §§1.1–1.2 actually name the continuous Galois action and fixed-closure theorem. The closed-field adapter is separately owned here. |
| AnabelianGeometryAndNonabelianChabauty | `59d989dd138cd28b4a4643ab233c04ad6d62aa34` | §5.8 covers arbitrary reduction over finite K and all ℂ_p-points of the same K-defined variety. The package correctly supplies arbitrary ℂ_p-defined varieties separately. |
| PadicDifferentialEquationsAndRigidCohomology | `c01dad49213cd0dd3c7b72b6023a0ce912a5e315` | RD.4.31–33, RD.5.76, RD.6.1, RD.6.86/88/92 exist and supply the stated comparisons, finiteness, iterated linear Frobenius and boundary qζ spectrum. |
| ResolutionOfSingularitiesCharacteristicZero | `7f4bd21732080caa7af07328917421939f6c7cd9` | §6.2 constructs a smooth projective SNC compactification of a smooth quasi-projective variety, preserving the given open. The package does not assume a projective compactification of an arbitrary whole non-quasi-projective input. |
| ArithmeticDynamics | `85e78c07dcc361ead6505c970a1181deee483819` | §3.58 has the named rational-five-cycle target and consumes the two EffectiveDiophantineMethods contracts. It supplies nothing to this package. |
| ErdosProgressionPowers | `42053a57c08415a9ec0808d442eb654702586215` | Its scope and rational-point finiteness application do not own the local index theory or supply a premise here. |

On main, StableReduction Layers 4–5 supply regularization/common resolutions, Layer 7 explicitly includes genera zero and one, and Layer 9 separates markings without using the later stability inequality for that first step. RigidAnalyticGeometry §§1.3, 2.3, 6.2, 8.1 retain quasi-separatedness for global extension. JacobianChallenge D–F supplies the pointed Jacobian/Albanese and base change; this package owns its additional differential/integration/topology bridge. EllipticCurves Layer 4 is genuinely point-level, with nonzero q and positive valuation; the differential/chart comparison remains new here.

Manually checked every supplier citation against the permitted order and every internal `*Needs:*` line against the build. The earlier pairing layers do not consume the later harmonic identification. The conditional choice laws in the triple-index existence proof are proved from the characterization before being exported in §5.3; this is not a cycle. No upward citation or cycle was found. No ownership was moved to a later roadmap. R01 requires importing earlier owners, not moving them.

The prescribed dependency command exited 0. Its complete output was:

```text
depcheck: 3 roadmaps, 19 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The command's three-roadmap scope is recorded literally; it is not a certification of all remote supplier implementations. No tooling or merge-order file was edited.

### Lean and file checks

`Suggested.lean` has one `import Mathlib`, six real-bodied definitions/abbreviations, fourteen admitted theorem signatures and six proved example blocks. It has no admitted example, admitted data, option override, empty proposition field, `#eval`, `#print axioms`, `#synth`, `True` placeholder or extra import. All twenty declaration names occur in the README. The scalar affine carrier is expressly an algebraic ingredient, not a weakened replacement for natural integration. Heavy geometric headlines correctly remain README targets.

All six example blocks were read. The repaired singleton polynomial calculations agree with the pinned `HahnSeries.single_zero_one` and polynomial simplification API. Their successful elaboration is not certified. R02 is the concrete missing negative-control mirror; it can be added without increasing the example-block count.

Both TOML files parse. The sources manifest has six versioned legal-source entries matching the six references. The reviewed package files remain unchanged.

## Not verifiable

- **Lean elaboration: not available.** The brief specifies no available elaboration command and permits no alternative Lean command. No Lean process was started. Accordingly neither successful elaboration nor “sorry is the only warning” is certified. Source-level signature and proof-script inspection is recorded separately above.
- **Original first-round review:** `packages/ColemanIntegrationPartII/reports/REV-PKG-ColemanIntegrationPartII.md` does not exist. F01/F02 were checked using the repair report and the actual repaired files; no claim is made about any unrecorded earlier finding.
- **Future proofs:** the fourteen admitted signatures and the README's planned constructions are not implemented proofs. The source and adversarial checks verify the stated contracts and witnesses, not completion of the library.

No cited source text was inaccessible, and no missing-reference request is needed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c00c3c56a4275345e397c2b6379280675ed1d7fb", "job": "REV-PKG-ColemanIntegrationPartII~2", "model": "gpt-6-astra", "worker": "chris-3"} -->
