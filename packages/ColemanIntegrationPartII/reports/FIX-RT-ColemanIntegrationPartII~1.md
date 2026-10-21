# ColemanIntegrationPartII repair report

Finding IDs below retain their source IDs. The first four sections refer to `RT-ColemanIntegrationPartII_r1a`; the next eight refer to `RT-ColemanIntegrationPartII_r1b`. The reviews contain twelve distinct findings, with no duplicate mathematical claim requiring a shared verdict.

## F01 (P2) — applied

Review a. Missing formal coefficient-extension signature → `Annulus.doubleIndex_scalarExtension` on `HahnSeries.map`, with explicit characteristic-zero field binders. README §2.3 states that signature; the definition docstring reserves the missing-carrier qualification for analytic transport. Coefficient extraction, finite coefficient convolution and differentiation commute with the embedding.

Evidence: Mathlib pin `Mathlib/RingTheory/HahnSeries/Basic.lean`, `HahnSeries.map` (line 142); `Mathlib/RingTheory/LaurentSeries.lean`, `derivative_map` (line 184); besser-dejeu2012 lines 2243–2249. No annular carrier is needed for this assertion.

## F02 (P2) — applied

Review a. `tripleIndex_congr` in §6.1 depending on §6.2 → the same target in §6.2, following `tripleIndex_laws`. Section 6.1 constructs the sum with chosen global primitives; §6.2 proves independence before congruence. No exported name changes.

Evidence: besser-dejeu2012 lines 2533–2547 construct the chosen end-sum and then prove auxiliary independence; lines 2548–2558 give residue cancellation.

## F03 (P3) — applied differently

Review a. Residue-only derivative test → full derivative equality as well. Added proved degree-two/reversal values and nonconstant Laurent-second and two-Laurent residue witnesses within the existing example blocks. The universal second-slot reduction becomes the named target `doubleIndex_laurent_second`, rather than an example proved from an admitted theorem.

The permitted fallback is needed because the pinned Laurent derivative API lacks the product-rule/integration-by-parts theorem required for a short universal proof. FormalLaurentPuiseux L2–L3 owns that calculus. The target has explicit characteristic-zero hypotheses; its proof is not used by either example. For F=z+2L and g=z⁻¹, dF=(1+2z⁻¹)dz, both B(F,g) and −Res(g dF) equal −1. With F=z the same values test the two-Laurent specialization. Evidence: besser-dejeu2012 lines 2243–2249.

## F04 (P2) — applied

Review a. Finite p-adic K in §§7.1–7.2 → every closed K⊆ℂ_p, with λ,λ′∈K and algebraic endpoints in a finite extension inside ℂ_p. The proper holomorphic proof uses geometric Albanese/abelian logarithms and injective coefficient descent; §4.0e supplies its finite-field specialization. Added the transcendental-j elliptic Check.

Evidence: colmez1998 line 2957 fixes closed-field scope; lines 3079–3121 include geometric varieties without finite models; lines 3147–3159 and 3213–3214 give the branch-independent invariant primitive. Semistable models, finite-field traces and compactness retain their finite-K hypotheses.

## F01 (P1) — applied differently

Review b. Implicit higher-dimensional existence within `albaneseReduction` → explicit local `NaturalIntegration.properAlbanese_exists`, `properAlbanese_functorial` and `properAlbanese_baseChange`, with exact hypotheses, construction and three Checks. The rational-form comparison uses that target. Neither a fictitious supplier theorem nor a restriction to curves is introduced.

The original scope contract already assigned higher-dimensional existence to §4.0b; the review correctly identified insufficient mathematical detail in its construction. The repair uses maximal morphisms to abelian targets, dimension bounds, rational-map extension and pointed descent. Serre's algebraic construction avoids requiring an unplanned general Picard-scheme construction. Evidence: serre1959 lines 83–179, 180–205 and 431–481; colmez1998 lines 2083–2110. JacobianChallenge Layer F supplies only the curve comparison; the pinned `IsAlbanese` supplies the predicate and uniqueness, not general existence. No supplier gap or external ownership decision is needed.

## F02 (P2) — disputed

Review b. No axiom is added and no uniqueness statement is narrowed. The claimed unconstrained quadratic example is constrained by the existing axioms; §4.0c also explicitly includes coefficient-extension compatibility.

Source evidence: colmez1998 line 2957 makes K any closed subfield. Definition II.1.3 at lines 2986–2995 lists local analyticity, differential, linearity, Chasles, exact/logarithmic evaluation and algebraic naturality; Theorem II.1.4 at lines 2996–2997 asserts existence and uniqueness for precisely that notion. The introductory observation at lines 256–258 says that descent from ℂ_p alone does not finish this theorem; it does not restrict the later theorem's uniqueness assertion.

A direct proof defeats the proposed witness even over a fixed K=ℚ₃. Put L=K(α), α²=2, and let T be the norm-one torus of L/K. The map s(t)=(t−α)/(t+α) is K-defined into T, and the invariant form η=(1/(2α))dlog s is K-defined: conjugation negates both factors. Its pullback is dt/(t²−2). Algebraic naturality and linearity applied to the group law force a based integral of η to be additive. The group T(K) is compact, since norm-one elements of this unramified extension are units. Two such locally analytic additive primitives with the same derivative differ by a locally constant homomorphism, whose finite image in K+KT is zero. Thus the integral is forced. Its value from a to b is

`Tr_{L/K}((1/(2*alpha))*log_univ((b-alpha)/(a-alpha)))`.

The already-stated coefficient-extension law gives the same conclusion immediately by splitting the form over L and applying linearity and `singleIntegral_exact_log`. Consequently the absence of a K-rational logarithmic decomposition supplies no freedom to choose its integral. Adding an independent traced-logarithm axiom would weaken the uniqueness target supported by Theorem II.1.4.

## F03 (P3) — applied

Review b. Asserted closure identification → explicit regular-extension/compositum argument proving L_K=K∩ℚ̄_p⊆K, followed by both closure inclusions and the supplied fixed-closure theorem. Added the pinned unique-norm-extension declaration to the Mathlib contract and §4.0c dependencies. The theorem's hypotheses and conclusion are unchanged.

Evidence: `spectralNorm_unique_field_norm_ext`, Mathlib pin `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean`, line 770, applies to the algebraic extension Kℚ̄_p/K because K is complete. Since K∩ℚ̄_p is relatively algebraically closed in K and characteristic is zero, regularity gives linear disjointness from ℚ̄_p. Extended automorphisms are isometric and extend to the completion. PadicPeriodRings §1.2 then gives the two required inclusions, as in colmez1998 lines 246–249.

## F04 (P2) — applied differently

Review b. No Layer 1 Lean milestone → real-bodied `Graph.simpleDivergence`, signed `Graph.simple_laplacian`, and `Graph.simple_harmonic_exact_decomposition` on the pinned cochains, with one-edge, isolated-vertex and triangle witnesses in two proved example blocks. README §§1.1–1.2 identify these signatures as native simple-graph specializations of the full metric multigraph targets.

Divergence is written as a vertex sum over adjacent heads, equivalently the outgoing-dart sum; this avoids a redundant finite-dart encoding. The decomposition uniquely quantifies the harmonic/exact pair, not a potential, which has componentwise constant ambiguity. Native cochain multiplication denotes addition after `Multiplicative.toAdd`. The single added Tau Ceti import is its actual cohomology module. Evidence: pinned `Cohomology/Basic.lean` lines 54–99; besser2017 lines 528–558.

## F05 (P3) — applied differently

Review b. Unqualified kernel/rank proof → exact pinned kernel suppliers plus a positive-rational-length multigraph extension by parallel edges, subdivision and rational matrix rank. The simple-graph theorem is consumed, not reproved.

The suggested repair overstated the pin's generality: `lapMatrix_ker_basis` and `card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` are over ℝ; only the quadratic-form criterion is stated for a linearly ordered field with `IsStrictOrderedRing`. The contract now records those actual hypotheses. Positive rational conductances become integer parallel-edge multiplicities after common scaling; replacing each edge by two half-length edges yields a simple graph. Eliminating the new potentials recovers the scaled original Laplacian. Field extension preserves rational matrix rank. Evidence: Mathlib pin `LapMatrix.lean` lines 209–217 and 277–289.

## F06 (P3) — applied

Review b. Four admitted polynomial-evaluation restatements → deleted `specialize_zero`, `specialize_add`, `specialize_tower` and `branchTransport_affinePolynomial`. Kept the real affine definitions and two example blocks; the second now proves the generic commutative-ring subtraction identity. README §7.1 consumes the native polynomial evaluation API and retains the geometric branch theorem.

Evidence: Mathlib pin `Mathlib/Algebra/Polynomial/Eval/Defs.lean`, `eval_C`, `eval_X`, `eval_add`, `eval_map`; `Mathlib/Algebra/Polynomial/Eval/Coeff.lean`, `hom_eval₂`. Distributivity proves the difference law, including the zero ring.

## F07 (P3) — applied

Review b. Named nonexistent consumers and dependency-check narrative → a mathematical downstream-consumer paragraph. Deleted the two locator-selection explanations from References. ArithmeticDynamics and ErdosProgressionPowers are not asserted to consume this package.

Evidence: ArithmeticDynamics §3.58 consumes EffectiveDiophantineMethods ED.3/ED.4; ErdosProgressionPowers' finiteness argument consumes its stated rational-point inputs. Neither supplies a prerequisite here. No supplier or mathematical target was deleted by this prose repair.

## F08 (P3) — applied differently

Review b. Bare Proposition 52 citation → qualification in §4.0c, References and `sources.toml` that its proof uses the rank-two case of Conjecture 1 established by Colmez. The comparison retains the preprint's p>2 convention; the all-prime construction continues to use Colmez directly.

Evidence: vologodsky2001 line 1806 states the comparison, and line 1810 identifies the established rank-two input. This is proof provenance, not an additional unresolved-conjecture hypothesis.

**Check outcomes.**

- Elaboration of `packages/ColemanIntegrationPartII/Suggested.lean`: **not available**, as specified in the brief. No Lean command was run; example proofs and theorem types were inspected against the pinned source declarations. No claim of successful elaboration is made.
- The prescribed dependency gate exited **0** with exactly:

```text
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The gate does not inspect internal subsection order; that was checked separately for the moved congruence theorem.

- `git diff --check`: exited **0**, no output.
- Submission-format checks: the flagged README superscript uses ASCII code notation; `Graph.harmonic_exact_decomposition`, `Graph.harmonic_subdivision` and `SingleIntegral.properHolomorphic_branchIndependent` occur in the Lean module docstring with their missing-carrier explanations. No mathematical signature changed. The dependency gate was rerun and returned the exact output above; elaboration remains unavailable.
- Static checks: every retained/new Lean declaration name appears in README; all four deleted names leave both README and Lean; one `import Mathlib` and one used pinned Tau Ceti module; no `set_option`, admitted data or admitted examples. The file has 21 named declarations and eight proved example blocks, with no more than two per kept definition. All theorem assumptions are explicit in their signatures.
- `sources.toml`: parsed successfully; all seven works have complete citation/provenance fields and certified legal acquisitions. Serre was acquired through the sources service from Numdam. The initially unresolved title search was resolved by its archive URL; no reference remains missing.

**Adversarial mathematics pass.**

Every row covers the definition and all its API targets in that subsection. Common prefixes are suppressed within rows; the displayed suffix lists include embedded targets. “Valid” means the stated mathematical identities survived the listed instances and hypothesis inspection, not that their Lean proofs have been implemented. Formal/analytic carrier boundaries and standing hypotheses were checked in addition to the numerical witnesses.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Coefficient conventions and universes | p=2,3; arbitrary characteristic-zero k; zero ring for affine values; K=ℂ_p and completed unramified field | Formal and analytic scopes differ explicitly; no finite-K compactness over ℂ_p | Closed-field branch exports |
| Graph signs and metric conventions | f=(2,5); opposite flags of a loop; c=2,d=3,ℓ=1/2 | d=−3, pinned coboundary=3; loop divergence 0; energy 12 | Native signed witnesses |
| Node, Čech, monodromy and cup conventions | xy=π; f=x; F_tail=2,c=6,t=1/3; α∪β=1 | Residue 1; value 4 both directions; χ of a global form is its jump; N_ℓ uses ℓ | Valid |
| Logarithm and triple-choice conventions | e=2, branch change 2; half-square at p=2; three equal L slots at p=3 | Log change 1; d(L²/2)=L dz/z; T(L,L;L)=0 | Added algebraic branch witness |
| Frobenius and trace conventions | q=1; ℚ₂ versus unramified quadratic; α²=π | q=1 excluded; degrees 2/4; Tr(α)=0, Tr(α²)=2π | Valid |
| §1.1 `LengthCochains`, mk, ext, div_d_adjoint, map, simple_laplacian, simpleCochainsEquiv; `simpleDivergence`, `simple_laplacian` | Empty graph, isolated vertex, one edge, loop, parallel edges, reversal, same-sign invalid cochain | Opposite-dart cancellation and signed native bridge hold | B-F04 |
| §1.2 `harmonic_exact_decomposition`, harmonicProjection, changePotential, rationalLaplacian_rank, simpleCohomologyEquiv; `simple_harmonic_exact_decomposition` | Triangle (3,0,0), tree, two isolated vertices, characteristic-3 triangle, ℚ₃ | Triangle harmonic part (1,1,1); characteristic 3 excluded but ℚ₃ allowed; potentials not unique | B-F04–F05 |
| §1.3 `harmonic_subdivision`, comp, residue | Jump 6 split 1/3,2/3; m=1; a loop; attached tree | Jumps 2,4; energy and residue sum preserved; m=0 excluded | Valid |
| §2.0 `residueTransport`, degree, germ | z=t², identity, reversal, constant map, quadratic point, infinitely negative analytic family | Residues 2,1,−1; trace 2; constant map and unbounded negative formal expansion excluded | Valid |
| §2.1 `LogarithmicFunctions`, mk, ext, differential, toPolynomial, injective, formal_primitive, differential_eq_zero_iff, differential_residue, residue_zero_iff, changeParameter | Scalars, L, 2+3L, X², z² over ZMod 2; u=az(1+h) | Derivative 3z⁻¹; logarithmic residue recovers coefficient; characteristic-zero kernel necessary | A-F03 |
| §2.1a `generalCoefficients`, primitive, base | L²/2 over ℚ₂, L³/3 over ℚ₃; open/closed annulus; scalar lift δ | Characteristic zero permits division; interior-radius margin absorbs integer denominators; closed-boundary assertion excluded | Valid |
| §2.2 `doubleIndex`, self, laurent_first, laurent_second, ext, add_left, reverse, add_constants | 1,L both orders; L,L; scalar pair; z,z⁻¹; z+2L,z⁻¹; shift first constant by 1 | Values 1,−1,0,0,−1,−1; constant shift +1; integration-by-parts sign correct | A-F03 |
| §2.3 `doubleIndex_pullback`, scalarExtension, shrink | Identity embedding; characteristic-zero coefficient extension; z=t², z=t⁻¹; common end domain | Values 1,2,−1; coefficient extraction commutes with embeddings; orientation retained | A-F01, A-F03 |
| §3.0a `colemanCover`, restrict, refinement | One smooth component; xy=π; self-node after subdivision | Opposite residues +1,−1; loop cannot be represented by F_v−F_v | Valid |
| §3.0b `fullAnalyticExtension`, ker, integrate, map | Transcendental α in (1−αz)⁻¹; scalar; log z; residue-disc indicator | Full coefficients exceed finite tensor sums; scalar kernel excludes locally constant indicators | Valid |
| §3.0c `semistableDeRhamComparison`, exact, cup, operators, baseChange | Good reduction; global form f_e=0; total coboundary; diag(1,q), Ne₂=e₁; residue degree 2 | χ=N=0 can coexist with nonzero proper H¹; Nφ=qN; geometric extension uses iteration | Valid |
| §3.1 `doublePairing`, eq_sum, constant_independent, restrict, wideOpen_residue_sum_zero | Zero differential, no ends, rational core, proper second-kind cup=1 | End sums cancel global constants; positive genus need not vanish | Valid |
| §3.1a `doublePairing_reciprocity`, analyticExact, logUnit, qRadical | G_m; rational core; degree-two boundary over 𝔽₃; q=2 | Boundary eigenvalue −3 allowed; reciprocal 1/2 excluded; q-eigenclasses radical | Valid |
| §3.2 `HarmonicPrimitiveData`, mk, ext_mod_constant, linear, jump_change, jump_class | Bridge jump 2; one smooth component; cyclic jump (1,1,1) | Subtract head constant 2; c↦c−da; nonzero cycle cannot be erased | Valid |
| §3.3 `auxiliaryDoubleIndex_formula`, edgeReverse, changeConstants | c=2,d=3,r_η=5,r_ω=7; reversal; one component shift | Correction −11 both orientations; componentwise constant independence not asserted | Valid |
| §3.4 `correctedDoublePairing`, eq_aux, cup, refinement, ext | ℙ¹, empty Z, proper second-kind cup=1, tree attachment, subdivision | Proper H¹ uses Čech classes; graph normalization and residue terms preserve comparison | Valid |
| §3.5 `correctedDoublePairing_phi_N`, phi_iterate | N=0; symplectic diag(1,q); arbitrary identity; ℚ₂ to unramified quadratic | Scales q; N skew-adjoint; identity fails for q≥2; geometric extension scales 4 | Valid |
| §4.0 `abelianLogCp`, openQuotient_torsion, unique, functorial, ofFiniteModel | Dimension 0, torsion point, small nonzero vector, transcendental-j E_t | Zero on torsion, local derivative identity, no finite-model restriction or compactness assumption | Valid |
| §4.0a `abelianPrimitive`, differenceSplitting, square, invariant, descent | Zero variety/form; df; invariant form; non-K additive constant; averaged quadratic trace | Based exact primitive descends; square and differential rigidifications eliminate discwise ambiguity | Valid; B-F02 disputed |
| §4.0b `properAlbanese_exists`, functorial, baseChange | Spec k, ℙ², ℙ¹, pointed curve, abelian surface, missing rational point | Zero, Jacobian, or identity as appropriate; no pointed map without point | B-F01 |
| §4.0b `albaneseReduction`, rationalForms, removeApparentPoles, functorial, primitiveDescent; `descendedLogForms`, add, smul, split, tower | A¹ dt; G_m dlog t; ℚ₃ quadratic poles; exact dt not logarithmic; transcendental pole over ℂ | Trace averaging restores dt; nonsplit logarithm belongs; only finite-algebraic-definition span is claimed after transcendental extension | Valid |
| §4.0c `naturalIntegration`, universalAffine, baseChange, goodReduction, exact_log, cp | I(0,1;dt), I(1,p;dlog t), constant endpoints, E_t, completed unramified coefficients | Values 1,T,0; theory includes genuinely geometric data and nonlocally compact fields | A-F04; B-F02 disputed; B-F08 |
| §4.0c `closedFieldFixed`, geometricPrimitiveDescent, abelianOpenQuotient | K=ℚ_p, ℂ_p, completed maximal unramified field; nonclosed ℚ̄_p; unbased constant | Invariants exactly closed K; ℚ̄_p fails closedness; normalization essential; torsion quotient suffices | B-F03 |
| §4.0d `naturalIndexReciprocity`, principal, constants, finiteDegree, projection, rationalLine | Constant/nonconstant f, f=0; P¹ dt with (t−a)/(t−b); map t²; colliding supports | Integral a−b, infinity index b−a; ramification factor 2; zero f/collisions excluded | Valid |
| §4.0e `jacobianIntegrationBridge`, natural, compact, moving | P¹; split multiplicative elliptic curve; valuation on K× | Compactness survives bad reduction over finite K; noncompact K× supplies negative control | Valid |
| §4.1 `dlog_residue_is_exact`, orthogonal_harmonic | xy=π and f=x; nonzero constant; f=0 | Residue 1=−d(ord); constants give zero; no logarithm of zero | Valid |
| §4.2 `harmonicPrimitive_eq_singleIntegral`, divisor_eq, goodReduction | Tree, cycle, df,dlog f; Tate q=p³ at valuations 1/3,2/3 | Smooth-residue comparison valid; entire-overlap constant comparison fails | Valid |
| §4.3 `singleIntegral_on_annulus`, reverse, baseChange | 2+6/3; c=0; boundary continuation; quadratic subdivision | Value 4; reverse 8−4=4; refined jumps 3,3 | Valid |
| §4.4 `globalDoublePairing_eq_pointSum`, exact, constants | Empty Z; second-kind cup=1; global constant shifts | Holomorphic restriction isotropic; proper cup recovered by second-kind representatives | Valid |
| §5.1 `TripleIndexData`, mk, ext, changeConstant, pullback, linearCombination | Three L functions; zero functions; mixed zero/L auxiliary entries (1,0) vs (1,−1) | Half-square and opposite-shift equations correct; unrelated constants fail | Valid |
| §5.2 `tripleIndex`, unique, symm, threeTerm, meromorphic | T(1,1;L); T(z,z;z⁻²); T(L,L;L); T(z,z⁻¹;L) | Values 1,−2,0,1 with common transported data | Valid |
| §5.3 `tripleIndex_changeConstant`, changeBoth | F=L,G=0,H=L and shift 1; residue 1 shift 2; unused F,G pair | Changes −1 and −2; F,G shift has no effect; zero bare function need not force zero | Valid |
| §5.4 `tripleIndex_simplePoles`, zeroConstantPrimitives | F=2+L,G=3,H=L; half squares; u=az | Value 6; c_u(log z)=−δ; constant term alone not invariant | Valid |
| §5.5 `tripleIndex_pullback`, comp | Degree 2, identity, reversal; transport functions but alter an auxiliary entry | Values 2,1,−1; untransported auxiliary shift leaves residue error | Valid |
| §6.0 `formSymbolRelations`, kernel, restrict | Analytic coefficient g; GdC=0; nonzero [dG]⊗η | Analytic tensors have zero symbol; actual product equality is essential | Valid |
| §6.1 `tripleIndex`, eq_endSum, globalChoices | Zero data; rational wide open; T(F,1;H) when B(F,H)=1 | Values 0,0,1; differential-class quotient would be false | A-F02 |
| §6.2 `tripleIndex_laws`, congr, add_const_second, const_third, restrict | Global shift versus shift at one of residues +1,−1; constant 2 in second slot | Global shift cancels; local shift changes by −1; second-slot change 2 | A-F02 |
| §6.3 `tripleIndex_frobenius_vanishing`, iterate | Zero class; q=2; F with B(F,H)=1,G=1 without eigencondition; residue extension | Reciprocal functional eigenvalue 1/q; zero classes admitted; omitted eigencondition fails | Valid |
| §6.4 `colemanFormPairing`, unique, relation, restrict | 1·dH; GdC; GdH+HdG=d(GH) when in domain | Generator values 1 and 0; genuine form relations descend | Valid |
| §7.0 `uniformizationDifferential`, pullback, charts | q=p³; n=1,2; q=1; p=2 | dlog(z/q)=dz/z; loops and parallel edges retained; q=1 excluded | Valid |
| §7.1 `branchTransport`, comp, exact; `UniversalAffine`, specialize | λ′=λ; zero form/ring; p; valuation-unit 1; e=2; generic affine pair | Changes 0,2,0,1; generic difference (λ′−λ)B | A-F04; B-F06 |
| §7.2 `properHolomorphic_branchIndependent`, universalCoefficient_zero | P¹, arbitrary closed K; E_t/ℂ_p; G_m as nonproper control | Holomorphic proper slope zero; G_m slope 1; finite model unnecessary | A-F04 |
| §7.3 `coefficientTrace`, tower, singleIntegral_galois, primitive_galois_average | L=K; a=b; ramified quadratic p=2; K-defined form; α²=π | Trace multiplies K-values by degree; is not multiplicative; normalized averaging required | Valid |
| §7.4 `divisorSingleIntegral`, split, ext, add, baseChange | [t²−π]−2[0] with t dt; D=0 without K-point; degree-2 point minus one rational point | Value π; degree zero removes basepoint; last divisor has degree 1 and fails | Valid |
| §7.5 `tracedLocalIndexSum`, split, tower, congr, bilinear; tracedEndIndexSum | Quadratic local scalar 1; infinity residue −2; rational point; empty Z | Trace 2; sum 0; whole index is traced | Valid |
| §7.6 `integrationRealization_descent`, commonExtension, divisor, wideOpenIndex_galoisDescent | Good reduction; nonsplit quadratic support; unrelated component triple shifts; quadratic constant field | Intrinsic integral preserved; no global bad-reduction triple pairing fabricated; scalar 1 traces to 2 | Valid |
| §7.7 `singleIntegral_normalization`, q_periodic, branch | q=p³, log p=1; n=1,2; q=1; p=2 | Jump −1; q-periodicity and branch terms cancel; division by n=0 excluded | Valid |

The complete Lean signature inspection gives explicit `[Field k] [CharZero k]` on both graph theorems and every characteristic-zero local-index theorem; the field-embedding theorem also explicitly binds both fields. `simpleDivergence` needs only a finite vertex type and an additive commutative group. `toPolynomial_injective` needs only a field. `UniversalAffine` is a pair for any type and `specialize` is over a commutative ring. There are no section variables that could silently disappear. The eight example blocks independently test the new definitions and do not invoke admitted local targets.

**Maintainer notes.**

No merge-order change, supplier relocation, supplier gap, external write or commit was made. General Albanese existence remains owned by this package, now as explicit targets. The original geometric targets retain their names; only `tripleIndex_congr` changes subsection. The four deleted scalar names are listed under review b F06 above. Searches of the content repository and both specified sibling roadmaps found no references to those names. Their mathematical laws remain available from native polynomial evaluation and the proved affine example. The independent review remains necessary, especially because Lean elaboration was unavailable.
