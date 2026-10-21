# Design repair report: ColemanIntegrationPartII

## F01 (P1) — applied

Untraced rational-logarithmic reduction over arbitrary k → geometric reduction over algebraically closed k and the descended trace subspace over general characteristic-zero k. Added its named API, quadratic-pole and exact/nonlogarithmic Checks, traced abelian rigidification, and primitive rationality/finite-extension independence before §4.0c. The all-prime, arbitrary-reduction theorem retains its generality.

## F02 (P2) — applied

Arbitrary positive p-power q → q=(#κ_K)^r, r≥1, with identity coefficient lift. Propagated through §§3.0c, 3.1a, 3.5 and 6.3, including iterates. Named the scalar-extension/geometric-iteration comparison; added the unramified quadratic control and corrected the nonsplit boundary Check for even iterates.

## F03 (P2) — applied differently

Uncertified supply direction → explicitly recorded failing dependency gate. Registration remains outstanding: ColemanIntegrationPartII is absent from `merge-order/ORDER.txt`. This job forbids editing that file or contacting external services to change it. The maintainer must register it after all suppliers, including AnabelianGeometryAndNonabelianChabauty, and rerun the gate. No success is inferred from absent UPWARD/CYCLE diagnostics.

## F04 (P3) — applied

Secondary reciprocity invocation → primary arXiv math/0301029v1 Proposition 3.4 and Lemmas 3.5–3.7, pp. 8–9. Named finite-map degree scaling, differential-trace projection and rational-line reduction before reciprocity. Retained the 2017 application. Fetched and recorded the primary work with its actual version numbering.

## F05 (P3) — applied

“Unit u” → u∈O_K×, equivalently v_p(u)=0, in the README and plan Check. Retained p as the field-unit negative control and 1 as a valuation-ring-unit positive control. The branch-transport formula is unchanged.

## Verification of the findings

| Finding | Evidence read and mathematical conclusion |
| --- | --- |
| F01 | colmez1998 line 602 restricts the geometric algebraic background to algebraically closed characteristic-zero fields; colmez1998 line 3396 gives the geometric decomposition; colmez1998 line 3399 gives apparent-pole extension and independence; colmez1998 line 246 treats descent separately. For α²=2 over ℚ₃, the two conjugates of (1/(2α))dt/(t−α) sum to dt/(t²−2). Its geometric residue 1/(2α) lies outside ℚ₃. Rational exacts have residue zero and base-field scalar logarithmic derivatives have base-field residues. Thus the original claim fails, while the traced version passes. Normalized Galois averaging proves both directions of the descended quotient comparison. |
| F02 | Read PadicDifferentialEquationsAndRigidCohomology §RD.6.1 at c01dad49213cd0dd3c7b72b6023a0ce912a5e315, including `linearFrobenius`, `linearFrobenius_eq_pow` and `linearFrobenius_baseChange`. Its identity coefficient lift requires identity residue action. In 𝔽₄, a root β of β²+β+1 has β²≠β and β⁴=β. For residue degree f, Q_L=Q_K^f, so F_L=F_K^f after the comparison; a fixed q=Q_K^r acts trivially on κ_L precisely when f divides r. besser2017 line 779 and besser-dejeu2012 line 2612 support the operator/pairing consequences. |
| F03 | Direct read of `merge-order/ORDER.txt` confirms absence. The delivered design README is the input of the exact required command. Exit 1 is an unresolved registration failure, not a false positive. |
| F04 | Legally fetched arXiv v1 through the sources service. besser2005 line 355 is Proposition 3.4; besser2005 line 358 gives the rational-line logarithmic test; besser2005 line 365 is the finite-map degree formula; besser2005 line 369 is the projection formula; besser2005 line 376 reduces reciprocity to ℙ¹ and its residue theorem. besser-zerbes2017 line 161 uses different published numbering. The mathematical conclusion is sound. |
| F05 | colmez1998 line 3952 gives the valuation coefficient of the universal logarithm, normalized at p in colmez1998 line 3954. Substitution gives change 2 at p and 0 at 1. The original word “unit” was ambiguous in K×. |

The early descent proof is part of §§4.0a–4.0b. It constructs the finite-field rigidified primitive from the traced square cocycle and proves compatibility with the geometric construction. A discrepancy with zero differential and zero second difference is locally constant additive modulo a scalar; compactness of A(K) makes its image finite and hence zero. This avoids introducing an additional completed-field fixed-point theorem as an unowned prerequisite. It uses no §7.3 result to construct §4.0c.

## Supplier, library and source audit

Read the main-branch shapes of `TauCetiRoadmap/StableReduction/README.md`, `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and `TauCetiRoadmap/JacobianChallenge/README.md`. No layer was reorganized. The only added subspace and API statements serve the reviewed reduction, descent, Frobenius and reciprocity gaps.

At the pins in `lake-manifest.json`, searched the library objects and read `Mathlib/RingTheory/Trace/Basic.lean`, `Mathlib/RingTheory/Trace/Defs.lean` and `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean` on GitHub. `trace_eq_sum_embeddings` requires finite dimensionality and separability with an algebraically closed target; `Algebra.trace_trace` requires both finite free stages of the scalar tower. All occur for the finite characteristic-zero extensions used here. The native `IsAlbanese` is a universal-property predicate, not the higher-dimensional existence or rational-form comparison. The added differential/logarithmic quotient statements are not replacements for these library declarations.

Read the open ArithmeticDynamics head 1921611a7a96ac19fb15c2b1291b35958c3ef0cb, §3.58, and the ErdosProgressionPowers head e101259371172a32b3dd13e926676ae33b6af5cd, scope and fixed-length finiteness contracts. Neither supplies integration. Their consumer relationship and the rank 1<2 condition remain unchanged. No new supplier or ownership move from a later roadmap was introduced.

All six manifest sources are legally available. The new primary text is recorded under `besser2005`, with authors, title, publication year 2005, arXiv-v1 version note and v1 locators; the preprint itself is dated 2003. No missing reference remains. The delivered manifest initially lacked this entry despite its presence in the reviewer's environment, so the service added it here. Existing acquisition metadata was preserved. No source passage was copied.

## Adversarial mathematics pass

Each row covers the target and every attached API entry in `design/plan.json`, including its hypotheses, domains, normalization and choice laws. The table covers all 44 targets and 131 API entries; the new descended logarithmic subspace is additionally distinguished inside §4.0b. These are mathematical checks, not formal proofs. All graph/local coefficients remain characteristic zero; zero rings, characteristic-p constant kernels, zero denominators and q=1 are excluded by the stated hypotheses.

| Statement (all attached API) | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 `Graph.LengthCochains` (6) | Empty graph, isolated vertices, loop flags, one edge 2→5, length 1/2 | d=−3, divergence ±4 for c=2, pairing 12; sign bridge is negative in degree one. | None |
| §1.2 `Graph.harmonic_exact_decomposition` (4) | Tree, disconnected vertices, triangle over ℚ₃ and characteristic 3 | Triangle (3,0,0) splits as (1,1,1)+(2,−1,−1); characteristic 3 is excluded; potentials have one constant per component. | None |
| §1.3 `Graph.harmonic_subdivision` (2) | Jump 6; lengths 1/3,2/3; m=1; attached tree | Jumps 2,4 preserve total and weighted product; m=0 is excluded. | None |
| §2.0 `Annulus.residueTransport` (2) | z=t², inverse parameter, quadratic point, infinite negative tail | Residues 2,−1; residue 1 traces to 2; unrestricted analytic series are not formal germs. | None |
| §2.1 `Annulus.LogarithmicFunctions` (4) | 2+3L, constants, L², ℚ₂, characteristic p | Residue 3; L² outside degree-one space; characteristic p fails the constant-kernel assertion and is excluded. | None |
| §2.1a `AnnulusLogRing.generalCoefficients` (2) | L²/2 over ℚ₂, L³/3 over ℚ₃, open versus closed annulus | Derivatives L dz/z and L² dz/z; interior radius margin absorbs integer denominators. | None |
| §2.2 `Annulus.doubleIndex` (4) | 1,L; z,z⁻¹; two constants; constant shifts | Values 1,−1,0; shift A Res dG−B Res dF fixes order and signs. | None |
| §2.3 `Annulus.doubleIndex_pullback` (2) | Degree 1, z=t², reversal, scalar trace | Index 1 becomes 2 or −1; constant map excluded. | Reciprocity recorded as a consumer |
| §3.0a `Semistable.colemanCover` (2) | Smooth model, xy=π, subdivided self-node | One core in good reduction; residues ±1; a loop requires separate chart domains. | None |
| §3.0b `ColemanWideOpen.fullAnalyticExtension` (3) | Scalar, log z, transcendental analytic coefficient, disc indicator | Constant kernel is scalar; full analytic coefficients exceed algebraic tensor coefficients; disc indicators fail Coleman rigidity. | None |
| §3.0c `Curve.semistableDeRhamComparison` (4) | Smooth positive genus, total coboundary, diag(1,q), unramified quadratic over ℚ₂ | χ=N=0 need not kill H¹; Nφ=qN; 𝔽₄ excludes q=2 with identity coefficients. Residue degree f changes geometric Frobenius to an f-th iterate. | F02 |
| §3.1 `ColemanWideOpen.doublePairing` (4) | Rational core, second-kind cup 1, primitive constants | Global residue cancellation kills constants; local value 1 alone does not survive the global rational sum. | None |
| §3.1a `ColemanWideOpen.doublePairing_reciprocity` (3) | ℙ¹, cup 1, dlog z, nonsplit degree-two boundary, positive iterates | Exact and boundary classes are radical; degree-two boundary eigenvalue is (−1)^r q; 1/q remains absent. | F02, including the boundary iterate Check |
| §3.2 `Semistable.HarmonicPrimitiveData` (5) | Tree, cycle, zero form, component shifts | Tree jump zero; c changes by −d a; a nonzero cyclic harmonic jump remains. | None |
| §3.3 `Semistable.auxiliaryDoubleIndex_formula` (2) | c=2,d=3,rη=5,rω=7; reversal; one-component shift | Correction −11, preserved under reversal; independent component constants can alter an unnormalized point sum. | None |
| §3.4 `Semistable.correctedDoublePairing` (4) | ℙ¹ with Z empty, proper cup 1, swapped arguments | Zero cohomology gives 0; second-kind representatives give 1; alternating sign changes −11 to 11. | None |
| §3.5 `Semistable.correctedDoublePairing_phi_N` (1) | N=0; symplectic diag(1,2); square; unramified quadratic coefficients | Scaling 2 squares to 4; identity cannot scale a nonzero pairing by q≥2. Same q requires the residue hypothesis. | F02 |
| §4.0a `NaturalIntegration.abelianPrimitive` (4) | Dimension 0; invariant form; df; K→L; locally constant additive discrepancy | Based df is f−f(a); invariant differential uses abelianLog. Trace averaging preserves a K-defined expression. Zero derivative plus the square identity kills the additive discrepancy on compact A(K). | F01: traced square, finite-field splitting and early descent |
| §4.0b `NaturalIntegration.albaneseReduction` (8) | A¹, G_m, point, proper curve, quadratic nonsplit poles, double pole at infinity | Tr((1/(2α))dlog(t−α))=dt/(t²−2); untraced k-log span fails. dt is exact but not logarithmic on ℙ¹. Averaging quadratic K-data needs 1/2. | F01: geometric quotient, descendedLogForms and primitive descent |
| §4.0c `SingleIntegral.naturalIntegration` (4) | dt from 0 to 1; dlog t from 1 to p; zero form; nonsplit quadratic poles | Values 1,T,0; local derivative alone permits spurious disc constants. Early descent gives the K-value before any model comparison. | F01: construction consumes the new early descent |
| §4.0d `Curve.naturalIndexReciprocity` (5) | Constant f; f=(t−a)/(t−b), ω=dt; z=t²; constant map | Divisor integral a−b; infinity contribution b−a; ramification multiplies local index by 2. Covering degrees are nonzero in characteristic zero, including at p=2. | F04: primary locator and finite-map proof steps |
| §4.0e `Curve.jacobianIntegrationBridge` (3) | Genus 0, elliptic curve, compact H, noncompact additive K | Compact locally constant additive image is finite and zero; identity on noncompact K does not satisfy local constancy. Temporary point is required. | None |
| §4.1 `Semistable.dlog_residue_is_exact` (1) | f=x at xy=π; nonzero constant; f=0 | Residue 1=ord_head−ord_tail=−d(ord); f=0 excluded; harmonic pairing with weighted exact residue vanishes. | None |
| §4.2 `Semistable.harmonicPrimitive_eq_singleIntegral` (2) | Tree, cycle, df,dlog f, Tate valuations 1/3 and 2/3 | Agreement on smooth residue domains; annular corrections −1/3 and −2/3 rule out a whole-annulus constant comparison. | Uses repaired natural integration; theorem unchanged |
| §4.3 `Semistable.singleIntegral_on_annulus` (2) | F_tail=2,c=6,t=1/3; reversal; quadratic refinement | Value 4 in both orientations; subdivision gives jumps 3,3. Valuation scale changes by ramification. | None |
| §4.4 `Semistable.globalDoublePairing_eq_pointSum` (2) | Z empty on holomorphic forms; second-kind cup 1; graph cycle | Holomorphic point sum 0; proper second-kind value 1; cyclic correction retained. | None |
| §5.1 `Annulus.TripleIndexData` (5) | All L with half squares; zero functions; pair constants (1,0) and (1,−1) | Half squares satisfy products; (1,0) fails for the zero product, while opposite shifts preserve the labelled datum. | None |
| §5.2 `Annulus.tripleIndex` (4) | 1,1;L; z,z;z⁻²; three L; characteristic 3 versus ℚ₃ | Values 1,−2,0; division by 3 is valid in ℚ₃; arbitrary local auxiliary choices cannot be forgotten. | None |
| §5.3 `Annulus.tripleIndex_changeConstant` (1) | L,0;L with auxiliary shift 1; residue 0; shift 2 | Values −1 and 0 for changed versus zero auxiliary data; shift 2 gives −2. | None |
| §5.4 `Annulus.tripleIndex_simplePoles` (1) | 2+L,3;L; half squares; u=az | Value 6; all L value 0; parameter constant shifts by −δ and the full formula compensates. | None |
| §5.5 `Annulus.tripleIndex_pullback` (1) | z=t²; identity; reversal; shift only one pulled-back auxiliary entry | 1 becomes 2 or −1; function pullback without auxiliary pullback fails by the residue term. | None |
| §6.0 `ColemanWideOpen.formSymbolRelations` (2) | Analytic gη; nonzero [dG]⊗η; G dC=0 | Symbols 0, nonzero,0; relations belong to the actual Coleman product module, with no free-symbol substitution. | None |
| §6.1 `ColemanWideOpen.tripleIndex` (3) | Rational wide open; all zero functions; restrictions | Rational global sum 0, with global compatible primitives; local arbitrary constants need not cancel. | None |
| §6.2 `ColemanWideOpen.tripleIndex_laws` (3) | Cup 1 with G shifted by 2; global auxiliary shift; one-end shift | Global function shift contributes 2; auxiliary global shift cancels; isolated end shift can contribute −1. | None |
| §6.3 `ColemanWideOpen.tripleIndex_frobenius_vanishing` (1) | Zero eigenclass; q=2 over ℚ₂; 𝔽₄ coefficients; G=1 counterexample; reciprocal functional | Zero class allowed; q=4 needed over unramified quadratic coefficients; dropping a q-eigenclass hypothesis permits value 1. Functional eigenvalue is 1/q. | F02: residue condition, both eigenclass hypotheses and iterate law retained |
| §6.4 `ColemanWideOpen.colemanFormPairing` (3) | P(F,dH); G dC; two equal actual-form presentations | Recovers B_U; zero form gives 0; product relations are killed through the actual symbol theorem. | None |
| §7.0 `TateCurve.uniformizationDifferential` (2) | Tate n=1,2,3; q=1; p=2 | Pullback dz/z on genuine Tate charts; loops and parallel edges are needed; q=1 excluded. | None |
| §7.1 `SingleIntegral.branchTransport` (2) | λ=0 to 2; u=p; v_p(ϖ)=1/2; u=1; zero form | Changes 2,1,0,0 respectively; being invertible in K alone does not imply zero change. | F05 |
| §7.2 `SingleIntegral.properHolomorphic_branchIndependent` (1) | ℙ¹ regular form; elliptic invariant form; nonproper G_m | Zero on ℙ¹; branch-free abelian logarithm for proper curves; dlog t on G_m gives λ. | None |
| §7.3 `SingleIntegral.coefficientTrace` (3) | L=K; a=b; quadratic α²=π; degree n extension; tower | Trace of extended K-value multiplies by n; Tr α=0 but Tr α²=2π; all finite p-adic extensions are separable. | Early descent is supplied before this coefficient-trace theorem |
| §7.4 `Curve.divisorSingleIntegral` (4) | D=[t²−π]−2[0], ω=t dt; D=0; nonzero-degree divisor | Value π; zero divisor gives 0 without K-point; degree 2 point minus one rational point fails basepoint cancellation. | None |
| §7.5 `Curve.tracedLocalIndexSum` (5) | Quadratic local residue 1; infinity; rational point; quadratic scalar α | Trace 2 cancels residue −2; trace acts on the scalar index, not independently on its factors. | None |
| §7.6 `Curve.integrationRealization_descent` (3) | Good reduction; ramified quadratic support; two refinements; quadratic constant field | No graph term in good reduction; trace 1=2 over quadratic constants; unrelated local triple choices still obstruct a global bad-reduction triple claim. | None |
| §7.7 `TateCurve.singleIntegral_normalization` (2) | q=p³, log p=1; n=1,2; p=2; q=1 | Cyclic jumps −1; F(qz)=F(z); branch terms cancel using v_p=ν_π/e; q=1 excluded by n>0. | None |
| Conventions: graph sign, node parameter, cup order, triple shift, branch and trace | 2→5; xy=π with f=x; (2,3,5,7); shift 1; ramification e=2; quadratic trace | d=−3; residue +1; correction −11; triple change −1; branch change 2/e=1; scalar trace 1=2. Every denominator is nonzero in the stated field. | F02 and F05; other conventions retained |

## Check outcomes

The required dependency command was run against `packages/ColemanIntegrationPartII/design/README.md` with name ColemanIntegrationPartII and `merge-order/ORDER.txt`, using the configuration specified in the brief. Exit code: **1**. Complete diagnostic output:

```text
NOT IN ORDER: ColemanIntegrationPartII (insert it after its last supplier)
depcheck: 3 roadmaps, 10 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. The missing registration prevents successful direction certification. This is not a tooling false positive. The package-root README is not delivered in this design package; its future packaging check remains a maintainer task, and no substituted package-root success is claimed.

The consistency check exited **0**:

```text
README/plan consistency: PASS; 44 targets, 131 attached API entries, 150 Checks; all statement, hypothesis, proof and Check texts match.
Internal prerequisites: PASS; 111 edges, all earlier targets; no cycle or forward edge.
Manifest: PASS; 6 sources with required bibliographic/acquisition fields; arXiv-v1 reciprocity locator recorded.
Definition Checks: PASS; all 12 definition targets have at least three; descendedLogForms has named closure/splitting/tower APIs and positive, negative and nonsplit Checks in §4.0b.
Lean: NOT RUN; no Suggested.lean supplied or permitted for editing; no Lean command authorized.
Forbidden content scan: PASS
```

`git diff --check` exited 0 with no output. No Lean elaboration was run: `Suggested.lean` is absent, outside the permitted edit set, and no Lean command is authorized by this brief. The added heavy geometric statements remain README targets; there is no admitted data or forced substitute signature.

## Maintainer consequences

The unresolved item is external merge-order registration (F03). This report does not mark it complete. After registration, rerun the prescribed design-path gate; at packaging run the corresponding gate on the actual package-root README.

No exported name was deleted or renamed. `albaneseReduction_rationalForms` now means the geometric untraced quotient or the general descended-logarithmic quotient with the stated field hypotheses. The Frobenius constructors and iterate APIs carry the residue-cardinality condition. Consumers of those signatures must retain it and distinguish scalar extension from geometric iteration. New supporting names are `NaturalIntegration.descendedLogForms`, `descendedLogForms_add`, `descendedLogForms_smul`, `descendedLogForms_split`, `descendedLogForms_tower`, `abelianPrimitive_descent`, `albaneseReduction_primitiveDescent`, `semistableDeRhamComparison_baseChange`, `naturalIndexReciprocity_finiteDegree`, `naturalIndexReciprocity_projection` and `naturalIndexReciprocity_rationalLine`. Final all-prime integration, divisor and arbitrary-reduction realization contracts are unchanged. No commit or GitHub write was made.
