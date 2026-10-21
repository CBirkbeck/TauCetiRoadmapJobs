# ColemanIntegrationPartII package report

The package contains `packages/ColemanIntegrationPartII/README.md`, `Suggested.lean`, `metadata.toml` and the updated source manifest. The README was generated from `design/plan.json` before prose editing: all 7 layers, 45 targets, 139 design API entries, 159 design Checks, proof sketches, dependencies and layer examples survive. Three further Checks describe affine specialization. The upstream shape was compared with `TauCetiRoadmap/StableReduction/README.md`, `TauCetiRoadmap/JacobianChallenge/README.md` and `TauCetiRoadmap/RigidAnalyticGeometry/README.md` on main, commit `0e8b058a97cc4f9401d2679313e0e937761c1024`.

## Changes and mathematical limits

No accepted mathematical target was narrowed or replaced. The two accepted scope repairs remain explicit: natural integration covers every closed subfield of ℂ_p, including varieties defined over ℂ_p without a finite-field model; the nonsplit good-reduction boundary example uses t²+1 over 𝔽₃, with eigenvalue −3, rather than a ramified generic quadratic point. All finite-model, compactness and finite-trace arguments retain finite K/ℚ_p. The source's p>2 convention is retained only for the Vologodsky comparison, not imposed on the Colmez existence theorem.

The package makes these implementation-facing distinctions precise:

- The formal degree-one logarithmic space is represented by k((z)) × k as a module, with a real map to k((z))[L]. Componentwise product of pairs is not multiplication of logarithmic functions. Its differential, primitive existence, scalar kernel, residue and polynomial injectivity receive named signatures in §2.1.
- The formal `doubleIndex` has a real residue-coefficient formula. §2.2 explicitly names its diagonal-zero and Laurent-first laws; its first-slot additivity and scalar constant-change law are represented in Lean.
- The affine universal value space and branch evaluation are named in §7.1. The coefficient algebra is stated over arbitrary commutative rings; the natural integration theorem still has its closed-field hypotheses. The specialization signature does not pretend to construct integration on arbitrary data.
- The source manifest's Besser–de Jeu locator now includes Definition 7.7 and Proposition 7.8 and the formal logarithm passage, rather than leaving their exact locators only in the README.

The notation repair replaces all 76 TeX-style subscript and superscript occurrences in the README with ASCII code notation, preserving their mathematical values. The identifier repair adds five signatures already specified in the README: `LogarithmicFunctions.residue_zero_iff`, `doubleIndex_ext`, `UniversalAffine.specialize_zero`, `UniversalAffine.specialize_add` and `UniversalAffine.specialize_tower`. The other eight flagged identifiers concern transported annular indices, full triple-index primitive data or holomorphic natural integrals. Their mathematical meanings and missing-carrier boundaries are explained in Lean docstrings; no substitute declaration is introduced. No design target, Check, source, supplier or ownership boundary changes.

No additional false identity was found in the accepted mathematical catalogue. In particular the signed graph bridge, inverse-length pairing, annular valuation correction, full scalar trace and labelled auxiliary constants were checked directly. These are mathematical checks and specifications, not formal proofs of the roadmap.

The README cannot supply Lean carriers absent from the pins: analytic logarithmic algebras, actual full-coefficient Coleman functions and forms, the semistable Čech comparison, integration torsors, and the multigraph flag/cochain comparison remain construction targets in the README. The heavy end theorems are not encoded as weaker surrogates in `Suggested.lean`. That file records the readily stated formal-local and affine-value interfaces only; its omission of heavy signatures is not a restriction of the README's scope. Its local definitions are tested in at most two proved blocks each, with related assertions bundled. All other Checks retain their full mathematical statements in the README.

The later intended consumer descriptions do not certify those consumers' implementations. `PadicHodgeRegulators` and `EllipticRegulators` supply no premise. No whole-curve triple pairing from unrelated component choices is claimed.

## Source checks

All six cited works were readable in the operator's legal source cache. No new source acquisition or missing-reference request was necessary. No extracted passage was copied into the package. The cached preprint numbering is used where it differs from an unspecified publication version.

| Claims checked | Exact passage read | Assessment |
| --- | --- | --- |
| Graph complex, adjoint, harmonic decomposition and metric extension | besser2017 line 528, line 537, line 545, line 553, line 768; besser-zerbes2017 line 99 | Unit-length assertions are direct; rational lengths follow by the stated rational-rank and constant-current arguments. |
| Degree-one logarithmic space, double index and orientation | besser2017 line 402, line 414, line 421, line 428; besser-dejeu2012 line 2232, line 2243 | Formal coefficient model, residue order and scalar shifts agree. |
| Curve Čech, graph retraction, geometric monodromy, cup and correction | besser2017 line 583, line 609, line 611, line 627, line 646, line 654, line 671, line 700, line 738, line 747 | Split separated hypotheses and the ordered cup comparison are retained; metric scaling is explicitly derived. |
| Wide-open double pairing and reciprocity | besser2017 line 492, line 503; besser-dejeu2012 line 2594; besser-zerbes2017 line 212 | Proper cup projection and imported rigid weights provide the stated radical and spectrum consequences. |
| Arbitrary geometric abelian logarithm and open quotient | colmez1998 line 3079, line 3102, line 3113, line 3147 | Torsion, rather than compactness or finite index over ℂ_p, is the correct hypothesis for the extension argument. |
| Abelian primitives and rational-form Albanese reduction | colmez1998 line 3169, line 3183, line 3193, line 3376, line 3399; algebraic Albanese discussion line 2095 | Traced logarithmic descent is a characteristic-zero averaging consequence. The arbitrary-overfield spanning claim remains limited to finite algebraic fields of definition. |
| Closed-field natural integration | colmez1998 line 246, line 2957, line 2982, line 2986, line 2996, line 3413 | Affine universal values, naturality and closed-field descent support the full coefficient scope; uniqueness is a property of the natural theory, not differentiation alone. |
| Principal-divisor reciprocity, finite degree and projection | besser2005 line 355, line 358, line 365, line 369, line 376 | The 2003 preprint of the 2005 work is cited by its own numbering. Nonzero functions, separated supports and positive finite degree are explicit. |
| Harmonic realization and annular interpolation | besser-zerbes2017 line 74, line 88, line 108, line 130, line 218; besser2017 line 807 | Equality on smooth residue domains is separated from the nonconstant valuation correction on connecting annuli. |
| Triple existence, compatible choices, simple poles and pullback | besser-dejeu2012 line 2251, line 2277, line 2299, line 2327, line 2413, line 2430, line 2529 | Opposite pair shifts, differentiated third slot and transport of all auxiliary data agree. |
| Global triple, reciprocal eigenvalue and actual-form relations | besser-dejeu2012 line 2533, line 2546, line 2576, line 2591, line 2769, line 2776 | Global auxiliary cancellation does not quotient out constants in the function slots; actual-form relations precede the descended pairing. |
| Branch and Tate witnesses | colmez1998 line 3950; besser-zerbes2017 line 245, line 265 | v_p(p)=1, final jump −log(q), positive valuation denominator and branch cancellation agree. |
| Restricted Vologodsky comparison | vologodsky2001 line 51, line 195, line 1806 | The p>2 restriction belongs to this comparison only. |

Trace, rational-length and descent consequences are cited as consequences of these ingredients, not assigned invented source theorem numbers.

## Duplication sweep and ownership

The sweep searched mathematical objects in all main roadmap READMEs and Lean files, including completed folders, and read the relevant native definitions at both pinned commits. Repository code search located the library files; those files were then read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches for integration, annular indices and graph harmonic/cochain objects found no additional owner of the kept end theorems. Searches that returned real harmonic analysis or Coleman's operator transform were excluded by object, not by name alone. Negative search results are bounded search evidence, not a proof of absence of every equivalent theorem.

There are **zero additional target removals** relative to the accepted catalogue. Its existing exclusions were preserved, and the following table lists every imported object family excluded from construction here. The README records these boundaries in Scope and ownership and the exact supplier contracts; no deleted-target stubs appear in its layers.

| Excluded construction | Exact owner consumed | Extension kept here |
| --- | --- | --- |
| P-adic fields, completion and algebraic closure | Mathlib `Padic`, `Padic.normedField`, `PadicAlgCl`, `PadicComplex`, `PadicComplex.norm_extends'`, `.isUltrametricDist`, `.charZero`, `.isAlgClosed`; `Mathlib/NumberTheory/Padics/{PadicNumbers,Complex}.lean` | Natural integration, not a new coefficient field. |
| Native multigraph and loop incidence | Mathlib `Graph`, `Graph.IsLoopAt`, `Graph.ext`, `Graph.banana`; `Mathlib/Combinatorics/Graph/Basic.lean` | Two-flag rational-length cochains with the native incidence comparison. |
| Simple-graph matrix Laplacian | Mathlib `SimpleGraph.lapMatrix`, `.lapMatrix_mulVec_apply'`; `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean` | Multigraph cochain theory and its comparison to D−A. |
| Simple-graph cochain quotient and universal property | Tau Ceti `SimpleGraph.oneCochains`, `.coboundary`, `.FirstCohomology`, `.FirstCohomology.lift`, `.FirstCohomology.mk_eq_mk_iff`, `.FirstCohomology.congr`; `TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean` | Value-preserving module/quotient bridge and signed chain comparison. |
| Coefficient maps and graph relabelling on that quotient | Tau Ceti `SimpleGraph.oneCochainsMap_coboundary`, `.firstCohomologyMap`, `.oneCochainsRelabel_coboundary`, `.firstCohomologyRelabel`; `Cohomology/Map.lean` and `Cohomology/Relabel.lean` | Transport through the comparison, not another simple-graph functor. |
| Formal Laurent derivative | Mathlib `LaurentSeries.hasseDeriv_coeff`, `.derivative`, `.derivative_map`; `Mathlib/RingTheory/LaurentSeries.lean` | Formal logarithmic degree-one space and indices. |
| Field trace, tower and embedding sum | Mathlib `Algebra.trace`, `.trace_algebraMap`, `.trace_trace`; `Mathlib/RingTheory/Trace/Defs.lean`; root `trace_eq_sum_embeddings`, `Trace/Basic.lean` | Integration and scalar-index trace identities. |
| Restricted-series norm and completeness | Tau Ceti `MvPowerSeries.norm_eq_gaussNorm` and the complete restricted-series instance; `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean` | Additional analytic coefficient/connection comparisons. |
| Albanese universal-property predicate | Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese`, `.homEquiv`, `.uniqueUpToIso`; `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean` | Higher-dimensional proper existence and rational-form comparison on that predicate. |
| Analytic Laurent algebra and base analytic logarithm algebra | ColemanIntegration L0.A1–L0.A2, L0.11–L0.12, L0.15–L0.23 | Formal/general-coefficient logarithmic extensions and index subspace. |
| Good-reduction Coleman construction and algebraic coefficient extension | ColemanIntegration L1.2–L1.3, L1.17–L1.19 including L1.17a, L1.43 | Full analytic coefficient extension, natural integration and semistable realization. |
| Continuous Galois action and Ax–Sen–Tate | PadicPeriodRings §§1.1–1.2 | Adapter to a specified closed subfield and normalized primitive descent. |
| Finite-field abelian logarithm and extension of its points to ℂ_p | AnabelianGeometryAndNonabelianChabauty §5.8 | Logarithms for abelian varieties themselves defined over arbitrary ℂ_p coefficients, with finite-model agreement. |
| Generic rigid comparison, finite dimensionality and component weights | PadicDifferentialEquationsAndRigidCohomology RD.4.31–RD.4.33, RD.5.76, RD.6.1, RD.6.86, RD.6.88, RD.6.92 | Curve semistable Čech/graph comparison and index-dependent cup projection. |
| General compactification | ResolutionOfSingularitiesCharacteristicZero §6.2 | Proper Albanese/rational-form comparison. |
| Rigid spaces and analytification | RigidAnalyticGeometry §§1.3, 2.3, 6.2, 8.1 | Coleman component/end and differential comparisons. |
| Nodal models, refinement, all-genus reduction and marking separation | StableReduction Layers 0–2, 4–5, 7, 9 | Independence of the integration realization built from these models. |
| Curve Jacobian and pointed Abel–Jacobi | JacobianChallenge Layers D–F | Natural-integration and compact point-topology bridge. |
| Point-level Tate uniformization | EllipticCurves Layer 4 | Normalized differential, valuation charts and integral witness. |

The pinned Hahn-series multiplication file was additionally read for `HahnSeries.single_mul_single` and `HahnSeries.coeff_mul_single`; these are arithmetic ingredients of the proved formal tests, not new target lemmas. Native polynomial operations evaluate the affine values; no polynomial evaluation theory is rebuilt.

The two specified open roadmap heads were checked independently of main: ArithmeticDynamics `ec203d1216012fcfc468c2def825006d8ea59da5` and ErdosProgressionPowers `42053a57c08415a9ec0808d442eb654702586215`. Neither constructs the index or natural integration objects. ArithmeticDynamics §3.58 `noRationalFiveCycle` consumes the two named EffectiveDiophantineMethods targets; its genus-two rank-one application is a downstream use. ErdosProgressionPowers has no integration supplier role.

The direct open supplier sections were read at heads ColemanIntegration `acaaf506f3822fc5c8211345cb48f6b1cb00656c`, PadicPeriodRings `e37c9fb3ff76bd2b8fb3e48a5dcb421dfba2899e`, PadicDifferentialEquationsAndRigidCohomology `c01dad49213cd0dd3c7b72b6023a0ce912a5e315`, ResolutionOfSingularitiesCharacteristicZero `7f4bd21732080caa7af07328917421939f6c7cd9`, and AnabelianGeometryAndNonabelianChabauty `59d989dd138cd28b4a4643ab233c04ad6d62aa34`. For the last head the file endpoint returned an empty content field; the nonempty blob with SHA `7989600f1e2f0ed195c7771e1743f202d9eaff1c` was fetched and its §5.8 read. These are new-roadmap suppliers allowed by the merge order, not progress revisions substituted for existing roadmaps.

No notion was newly moved down from a later roadmap. The accepted design already owns the additional component, coefficient, comparison, reciprocity and descent interfaces; they are retained here. No consumer is used to supply its own prerequisite.

## Adversarial pass

Each target row covers its main claim, every attached design API, definition properties, proof interfaces and Checks. The rows are direct mathematical substitutions and domain checks. Field hypotheses exclude the zero ring and positive-characteristic coefficient fields; residue characteristic 2 and 3 remains allowed. The additional Lean declarations are audited separately below. All needed field/characteristic hypotheses in admitted signatures are explicit binders, not unused section variables.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Coefficient conventions | ℚ₂, ℚ₃, ℂ_p; completed maximal unramified field; nonclosed ℚ̄_p | Natural theory has full closed-field scope; finite-model and compactness assertions stay finite. Nonclosed fixed-field assertion fails as recorded. | Preserve the accepted distinction. |
| Logarithm, valuation and affine conventions | Branch difference 2; p; e=2 uniformizer; valuation-ring unit; zero slope | Changes 2, 1, 0, 0. v_p=ν_π/e is necessary. | Add real affine-value definitions and two bundled tests. |
| Graph and Čech conventions | Values 2,5; xy=π with f=x; global overlap representative zero; total coboundary | d=−3, residue=1=−d(ord); χ of a global form is its jump; coboundary class zero. | None. |
| Cup, double index, triple choice and trace conventions | B(1,L), B(L,1); paired overlap (2,3,5,7); auxiliary shift 1; α²=π | Values 1,−1,−11,−Res(dF); trace of α² is 2π whereas trace of α is zero. | Add coefficient-form double-index tests. |
| §1.1 cochains and all six APIs | Empty graph; isolated vertices; one loop; length 1/2 with c=2,d=3; reversal | Zero edge space; loop harmonic value 1; pairing 12 and divergences ±4; signed simple-graph comparison gives opposite differential. | None. |
| §1.2 decomposition and all four APIs | Tree; triangle (3,0,0); two isolated vertices; characteristic 3 triangle; ℚ₃ | Harmonic part (1,1,1), exact part (2,−1,−1); componentwise constants; characteristic-3 intersection excluded. | None. |
| §1.3 subdivision and both APIs | Jump 6 split 1/3 and 2/3; one piece; added tail; zero pieces | Jumps 2 and 4; sum, weighted energy and residue product preserved; zero pieces excluded. | None. |
| §2.0 residue transport and both APIs | z=t²; z=t⁻¹; identity; constant map; quadratic point; infinite negative tail | Residues 2,−1,1; constant map excluded; scalar residue 1 traces to 2; analytic family need not be a bounded-below formal series. | None. |
| §2.1 logarithmic functions and all four design APIs | 2+3L; scalar; L; L²; characteristic-p z^p | Residue 3; scalar kernel; L² outside degree one; characteristic-p kernel failure excluded. | Specify real coefficient and polynomial maps; name formal primitive/kernel/residue targets. |
| §2.1a general analytic coefficients and both APIs | ℚ₂ L²/2; ℚ₃ L³/3; u=az; closed annulus boundary | Derivatives L dz/z and L² dz/z; chosen logarithmic lift required; boundary convergence can fail. | None. |
| §2.2 double index and all four design APIs | (1,L), (L,1), (z,z⁻¹), (L,L), scalar pair; constant shifts | Values 1,−1,−1,0,0; shift a Res(dG)−b Res(dF). | Name diagonal-zero and Laurent-first signatures. |
| §2.3 pullback and both APIs | Degree 2; identity; reversal; embedding; zero-degree constant map | Scaling 2,1,−1; common branch and positive degree essential. | None. |
| §3.0a cover and both APIs | Smooth model; ordinary node; self-node; separated poles | One-core case; residues ±1; self-node requires subdivision into distinct neighboring domains. | None. |
| §3.0b full coefficients and all three APIs | Transcendental α in (1−αz)⁻¹; scalar; log z; discwise indicator | Full analytic data exceed finite tensor sums; kernel is one scalar; indicator fails continuation. | None. |
| §3.0c comparison and all four APIs | Positive genus smooth model; total coboundary; diag(1,q), Ne₂=e₁; unramified quadratic ℚ₂ | χ=N=0 does not erase proper H¹; Nφ=qN; q=4 admits identity coefficient lift whereas q=2 does not. | None. |
| §3.1 wide-open sum and all four APIs | Zero form; no ends; rational core; proper cup value 1 | Zero, zero, zero, one; global residue cancellation removes common constants only. | None. |
| §3.1a reciprocity and all three APIs | Analytic exact; logarithmic unit; G_m; degree-two t²+1 over 𝔽₃ | Radical and projection behave as stated; nonsplit eigenvalue −3 squares to 9; excludes 1/3. | Preserve corrected nonsplit witness. |
| §3.2 harmonic family and all five APIs | Bridge jump 2; smooth fibre; cyclic jump 1; loop | Component constants kill bridge jump, not cycle; one global scalar ambiguity. | None. |
| §3.3 correction and both APIs | (c,d,rη,rω)=(2,3,5,7); reversal; single-component shift | Correction −11, unchanged by reversal; both sides react equally to local constants. | None. |
| §3.4 corrected pairing and all four APIs | ℙ¹, empty Z; good reduction; cup value 1; total coboundary; subdivision | Values 0, component value, 1, 0; Čech representatives retain proper classes. | None. |
| §3.5 operator laws and iterate API | N=0; symplectic plane; identity operator; residue degree two | Scaling q and cancellation 1−1; arbitrary identity fails q≥2; enlarged geometric Frobenius is an iterate. | None. |
| §4.0 geometric logarithm and all four APIs | Dimension zero; torsion point; small nonzero tangent vector; transcendental-j Legendre curve | Values 0,0,v; no finite-model assumption; local inverse is not global. | None. |
| §4.0a abelian primitive and all four APIs | Zero variety; invariant form; df; traced logarithm; finite extension | Zero; logarithm evaluation; exact value; averaged trace needed, with no extension-degree factor in base change. | None. |
| §4.0b Albanese reduction and all eight APIs | A¹; G_m; point; dt/(t²−2) over ℚ₃; dt at infinity; transcendental pole over ℂ | Exact/log parts differ; quadratic trace needed; averaging divides by degree; algebraic span misses transcendental poles. | None. |
| §4.0c natural theory and all eight APIs | A¹ endpoints 0,1; G_m endpoints 1,p; equal endpoints; arbitrary ℂ_p variety; completed unramified field; ℚ̄_p | Values 1,T,0; genuine geometric coefficients covered; closed-field descent valid in stated scope; nonclosed fixed-field example fails. | Preserve full closed-field repair and unbased-constant warning. |
| §4.0d reciprocity and all five APIs | Constant nonzero f; f=0; ℙ¹ with dt and (t−a)/(t−b); z=t²; identity | Constant divisor zero; zero function excluded; divisor value a−b; ramification factor 2; identity degree 1. | None. |
| §4.0e Jacobian bridge and all three APIs | Genus zero; multiplicative elliptic curve; noncompact K× valuation | J=0 in genus zero; J(K) remains compact in bad reduction; noncompact valuation prevents general vanishing assertion. | None. |
| §4.1 logarithmic residue and orthogonality API | f=x at xy=π; scalar; zero function | Residue 1=−d(ord); scalar residue zero; zero function excluded. | None. |
| §4.2 harmonic identification and both APIs | Tree; cycle; df; dlog f; Tate valuations 1/3 and 2/3 | Smooth-residue comparison holds; corrections −1/3 and −2/3 are not a common constant on a connecting annulus. | None. |
| §4.3 interpolation and both APIs | F_tail=2,c=6,t=1/3; reversal; zero jump; ramification two | Both orientations give 4; refined jumps 3,3 sum to 6; normalized valuation changes by inverse ramification. | None. |
| §4.4 point sum and both APIs | Empty poles; holomorphic forms; second-kind classes with cup 1; exact form | Holomorphic sum zero agrees with isotropy; second-kind sum detects cup; exact contribution zero. | None. |
| §5.1 choice data and all five APIs | Three L with half squares; all zero functions; off-diagonal constants; incompatible pair (1,0) | Half-square equations hold; zero functions permit opposite constants; (1,0) fails for G=0,H=L, while (1,−1) is valid. | None. |
| §5.2 triple characterization and all four APIs | (1,1;L); (z,z;z⁻²); (z,z⁻¹;L); three L with half squares | Values 1,−2,1,0; 3 is invertible even in ℚ₃; common labelled choices are necessary. | None. |
| §5.3 choice law and simultaneous-change API | (L,0;L); shift 1 or 2; zero residue; unused F,G pair | Values/change −1,−2,0; unused pair has no effect. Bare zero function does not erase choice data. | None. |
| §5.4 simple poles and normalization API | (2+L,3;L); all half squares; u=az with lift δ | Values 6,0; constant coefficient shifts by −δ; transported full formula is invariant. | None. |
| §5.5 degree law and composition API | Degree 2; identity; reversal; shifted pulled-back primitive | Factors 2,1,−1; extra shift contributes the residue error; degrees multiply. | None. |
| §6.0 actual-form relation theorem and both APIs | Analytic gη; nonzero symbol; G dC | Symbols zero, nonzero, zero respectively; an arbitrary free-symbol relation does not suffice. | None. |
| §6.1 global triple and all three APIs | Zero functions; rational core; G=1 with B_U(F,H)=1 | Values 0,0,1; cannot factor through the differential class of G. Congruence uses subsequent global-choice independence. | None. |
| §6.2 global laws and all three APIs | Global shift; single-end shift with residues ±1; G↦G+2 | Global shifts cancel; single-end shift gives −1; second-slot constant can contribute 2. | None. |
| §6.3 q-eigenclass vanishing and iterate API | Zero class; q=2 over ℚ₂; q=4 over unramified quadratic; G=1 without other eigencondition | Zero class allowed; both eigenconditions required; functional has eigenvalue 1/q, not q. | None. |
| §6.4 actual-form pairing and all three APIs | P(F,dH); G dC; G dH+H dG=d(GH) | Recovers B_U; zero form gives zero; actual relation theorem supplies expression independence. | None. |
| §7.0 Tate chart bridge and both APIs | n=1,2,3; q=1; p=2; z↦z/q | Loop/parallel flags retain period; q=1 excluded; differential unchanged, logarithm shifts by −log q. | None. |
| §7.1 branch transport and both design APIs | Same branch; exact form; p; e=2 uniformizer; units; shifted local primitive | Changes 0,0,2,1,0; local double index can change by 1. | Add honest scalar specialization signatures and three Checks. |
| §7.2 holomorphic independence and zero-coefficient API | ℙ¹; elliptic curve; nonproper G_m | Values zero, abelian logarithm, λ respectively; properness cannot be dropped. | None. |
| §7.3 coefficient trace and all three APIs | L=K; equal endpoints; K-defined form; quadratic α²=π; tower | Identity, zero, degree factor, nonmultiplicativity; trace transitivity retained. | None. |
| §7.4 divisors and all four APIs | [t²−π]−2[0] with t dt; zero divisor with no K-point; single quadratic point | Integral π; zero independent of a point; quadratic point degree 2 and nonzero-degree basepoint dependence. | None. |
| §7.5 traced indices and all five APIs | Quadratic residue 1; infinity; rational point; empty support; coefficient products | Traced values 2,−2,identity,0; only the full scalar index is traced. | None. |
| §7.6 descent and all three APIs | Good reduction; ramified support splitting; common refinement; quadratic constant field | Intrinsic single/double values agree; constant-field scalar 1 traces to 2; no arbitrary whole-curve triple construction. | None. |
| §7.7 Tate normalization and both APIs | q=p³ with log p=1; n=1,2; q=1; p=2 | Jump −1; q-period and branch terms cancel; denominator n positive; no odd-prime restriction. | None. |
| Formal `LogarithmicFunctions`, `differential`, `toPolynomial` | Scalar pairs; (0,1); (2,3); coefficient of L² | Differential 0, z⁻¹, 3z⁻¹; L² excluded by coefficient 2; no norm hypothesis used. | Real bodies throughout. |
| `formal_primitive`, `differential_eq_zero_iff`, `differential_residue`, `toPolynomial_injective` | w=0; w=z⁻¹; negative monomials; characteristic-p kernel counterexample | Correct residue supplies logarithmic coefficient; nonzero integer denominators need characteristic zero; polynomial injectivity only needs the field hypothesis. | All hypotheses explicitly bound in each declaration. |
| `doubleIndex_self`, `doubleIndex_add_left`, `doubleIndex_laurent_first`, `doubleIndex_add_constants` | Zero/scalar/log pairs; Laurent negative monomial; both constant shifts | Alternation/additivity and residue rule have the stated order; opposite constant terms agree with the source. | Characteristic-zero binders explicit; no analytic claim on the formal carrier. |
| `LogarithmicFunctions.residue_zero_iff` | Scalar pair; L; Laurent z and z⁻¹; 2+3L | Residues 0,1,0,0,3; the zero-residue criterion is equivalent to a zero logarithmic coefficient. | Add the formal signature with explicit field and characteristic-zero binders. |
| `doubleIndex_ext` | Zero arguments; (1,L); (L,1); (L,L); arbitrary Laurent parts | The Laurent-first rule fixes the first cross-term; alternation fixes the reversed cross-term and the logarithm diagonal. Bilinearity determines the pairing on all pairs. | Add the uniqueness signature on native bilinear maps; its hypotheses impose only alternation and the restricted residue rule. |
| `UniversalAffine.specialize_zero`, `specialize_add`, `specialize_tower` | Zero ring; zero parameter; pairs (1,2),(3,4) at parameter 2; identity homomorphism; reduction ℤ→ℤ/2ℤ | Values 1 and 16=5+11; coefficient transport gives 0 on both sides modulo 2. The logarithm parameter must be transported with the coefficients. | Add signatures over arbitrary commutative rings, with the ring homomorphism explicit. |
| `UniversalAffine`, `specialize`, `branchTransport_affinePolynomial` | Zero ring; any commutative ring; zero slope; slopes 1 and 1/2 over ℚ | Algebra works even in zero ring; ramified witness gives 1; no hidden finite-dimensional, completeness or prime assumption. | Broad scalar algebra separated from field integration scope. |

## Lean elaboration outcome

**Not compiled. Elaboration is not available:** the supplied elaboration command is literally `not available (say so in the report)`, and the brief authorizes no executable Lean command. No Lean or Lake command was run and no process was left running.

`Suggested.lean` has one `import Mathlib`, no other imports, 14 admitted theorem declarations with 14 `sorry` tokens, 6 proved `example` blocks, no admitted examples, no admitted data and no `set_option`. Each example unfolds the roadmap's own definitions and uses arithmetic of the pinned carriers; no example calls an admitted target. The two formal test blocks cover scalar/log derivative separation, residue 3 and exclusion of L². The double-index blocks cover its three sign values, diagonal and scalar zeros, Laurent-first rule and a nonzero constant-change witness. The affine blocks cover zero/exact values and the two ramification slopes.

The exact number of emitted `sorry` warnings is **unavailable**, because there was no elaboration. Fourteen is the static admission count, not an observed warning count. There are no compiler messages to quote. In particular no claim is made that compilation succeeded or that `sorry` would be its only warning. Elaboration of the tests and `#check @name` inspection of the elaborated types remain unverified; binder scope was checked from the explicit source signatures.

## Dependency and consistency checks

All 113 design `target:` prerequisites resolve to earlier targets in the accepted layer order. The API congruence statement at §6.1 explicitly uses the later choice-independence theorem §6.2, while the definition of the sum used to prove that theorem does not use congruence. No internal mathematical cycle results. The graph pairing precedes harmonic identification; natural reciprocity does not assume that identification; actual-form relations precede descent of the Coleman-form pairing.

Every design target name and API name occurs in the README, and every design Check remains present. The new formal and affine Lean declaration names are documented at §§2.1, 2.2 and 7.1. Metadata matches the one-topic TOML shape of the main roadmap folders, with `topic = "math.NT"`.

After the repair, the installed text scanners were run without a build. Their output was:

```text
gate ColemanIntegrationPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 OK
```

The prescribed dependency gate was run on `packages/ColemanIntegrationPartII/README.md`, with name ColemanIntegrationPartII and `merge-order/ORDER.txt`. Exit status 0; output verbatim:

```text
depcheck: 3 roadmaps, 19 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This gate covers the supplied main/open-head context; it is supplemented by the direct supplier-section checks above and inspection of their merge-order direction. It is not represented as an exhaustive check of every remote roadmap's transitive dependencies.

Only the specified package deliverables were edited. Design inputs, the content checkout, the merge order and tooling were left unchanged. No source-access blocker or suspicious instruction was found.
