# ColemanIntegrationPartII design repairs

## F01 (P2) — applied

Finite-K natural integration → natural integration over every closed K⊆ℂ_p, with inclusion compatibility, an explicit ℂ_p export, normalized primitive descent and a closed-subfield adapter to PadicPeriodRings. Added transcendental-j, completed-unramified, finite-specialization and nonclosed-field Checks. Kept compactness, finite trace and semistable realizations at finite K/ℚ_p. Synchronized summary, conventions, supplier contracts, APIs, dependencies, JSON and source locators.

## F02 (P3) — applied

Unspecified quadratic boundary → ℙ¹ over 𝔽₃ minus t²+1, with K=ℚ₃, or its separated unramified wide-open lift. Frobenius is 3 times transposition on geometric residues: eigenvalue −3, square 9. Added generic t²−3 as the ramified negative control. Preserved the general qζ spectrum and reciprocal exclusion; synchronized `doublePairing_nonsplit_spectrum` in JSON.

## Evidence and ownership

F01 is supported by colmez1998 line 2957 (closed coefficient field), line 2986 (natural integration axioms), line 2996 (existence and uniqueness), and line 246 (geometric equivariance and closed-field descent with the logarithm variable fixed). The affine value space occurs at colmez1998 line 2989. Geometric abelian and Albanese primitives are supported by colmez1998 line 3193 and line 3399. These statements justify generalizing §4.0c without extending the finite-K compactness argument of §4.0e.

Read `TauCetiRoadmap/PadicPeriodRings/README.md` §§1.1–1.2 at head `e37c9fb3ff76bd2b8fb3e48a5dcb421dfba2899e`. Its `padicComplex_fixed_closure_eq` quantifies over closed Galois subgroups and identifies their fixed points with the completed algebraic fixed field. The added adapter specifies H_K, its closedness, and the identification of that completion with the given closed K. Normalizing a geometric primitive at a K-point then makes its descent statement precise. Ax–Sen–Tate remains owned by PadicPeriodRings. For uniqueness over a non-locally-compact K, the added open-quotient target restricts the geometric torsion theorem; this restriction is also the argument at colmez1998 line 3102. It asserts torsion rather than finite index.

For the new non-finite coefficient Check, K is the closure of ℚ_p^{nr}. Its residue field is infinite, so its valuation ring is not compact. It properly contains ℚ_p^{nr}: the latter has countably infinite dimension over ℚ_p and is the union of its finite-dimensional closed proper subspaces, so completeness would contradict Baire. Exact integration of αdt therefore tests coefficients outside every finite unramified stage. The transcendental-j Check uses the actual geometric logarithm, evaluated on a small nonzero tangent vector, and needs no finite model.

F02 follows from `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md` §RD.6.92, lines 14638–14651 at head `c01dad49213cd0dd3c7b72b6023a0ce912a5e315`: its boundary D_k is on the special fibre. Over 𝔽₃, t²+1 is irreducible and separable. The residue sequence identifies H¹ with {(a,−a)} inside the two geometric boundary coordinates; 3 times transposition sends (1,−1) to (−3,3). Its square is multiplication by 9. Conversely t²−3 is Eisenstein over ℚ₃ and reduces to a repeated root, so generic degree two alone does not specify the claimed Frobenius action.

Read the main-branch StableReduction, JacobianChallenge and RigidAnalyticGeometry READMEs for form and supplier boundaries. Read the open ArithmeticDynamics §3.58 and ErdosProgressionPowers scope: neither supplies integration. Their existing consumer descriptions require no change. PadicPeriodRings introduces a new roadmap folder and is earlier in `merge-order/ORDER.txt` (line 16, before the existing last supplier AnabelianGeometryAndNonabelianChabauty at line 127). No ownership move, supplier gap or merge-order edit is needed.

The pins in `lake-manifest.json` are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched by the coefficient and Albanese objects, then read `Mathlib/NumberTheory/Padics/Complex.lean` and `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean` at those pins. The former provides the completed algebraically closed coefficient field; the latter provides `IsAlbanese`, its factorization and uniqueness, rather than the primitive comparison. The new coefficient contract cites the exact pinned Mathlib declarations. The newer Tau Ceti `NumberTheory/Padics/Complex.lean` search result does not exist at the pin and is not consumed. The pinned Tau Ceti tree has no Coleman or Vologodsky integration module.

All six cited texts remain legally readable at their cached versions. `sources.toml` retains all acquisition metadata and adds precise Colmez closed-field locators and its §4.0d use. No new work is cited, no missing text was found, and no references request was necessary. No source passages were copied.

## Adversarial mathematics pass

Each target row covers its statement, attached APIs and Checks. The table records mathematical substitutions and dependency checks, not completed formal proofs. Characteristic-zero fields exclude the zero ring and positive/equal residue-characteristic coefficient-field counterexamples; finite geometry and topology hypotheses remain explicit where used.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Coefficient conventions | ℚ₂, ℚ₃, ℂ_p, completed ℚ_p^{nr}, nonclosed ℚ̄_p | Natural theory includes closed non-finite fields; compactness and finite-trace sections still require finite K | F01 |
| Logarithm and valuation conventions | λ′−λ=2; p; ramified uniformizer with e=2; valuation-ring unit | Changes are 2, 1 and 0 respectively; v_p=ν_π/e | None |
| Graph, Čech and cup conventions | Edge values 2,5; xy=π; f_e=0; reverse both inputs | d f=−3; Res(dx/x)=1=−d(ord); χ is the jump; cup order retained | None |
| Index and trace conventions | B(1,L), B(L,1); auxiliary shift 1; quadratic α²=π | Values 1,−1; triple change −Res(dF); Tr(α²)=2π while Tr(α)=0 | None |
| §1.1 cochains and APIs | Empty graph; isolated vertices; loop; edge of length 1/2 with c=2,d=3 | Zero edge module; componentwise constants; loop divergence 0; energy 12 and divergences ±4 | None |
| §1.2 decomposition and APIs | Tree; cyclic triangle (3,0,0); disconnected graph; characteristic 3 | Harmonic triangle part (1,1,1); exact part (2,−1,−1); characteristic-3 failure excluded, ℚ₃ allowed | None |
| §1.3 subdivision and APIs | Jump 6 split in proportions 1/3,2/3; identity subdivision; attached tree | Jumps 2,4 add to 6; energy preserved; tree current zero; zero lengths excluded | None |
| §2.0 residue transport and APIs | z=t²; z=t⁻¹; identity; constant map; quadratic point; infinite negative tail | Residues 2,−1,1; constant map excluded; residue 1 traces to 2; formal comparison needs finite principal part | None |
| §2.1 logarithmic subspace and APIs | 2+3L; scalar; L²; z^p in characteristic p | Residue 3; scalar kernel; L² outside degree one; characteristic p excluded | None |
| §2.1a analytic coefficients and APIs | L²/2 over ℚ₂; L³/3 over ℚ₃; u=az; closed annulus boundary | Derivatives L dz/z and L² dz/z; chosen logarithm shifts L; open-radius margin required | None |
| §2.2 double index and APIs | (1,L); (L,1); (z,z⁻¹); two scalars; shifts A,B | Values 1,−1,−1,0; change A Res(dG)−B Res(dF) | None |
| §2.3 double pullback and APIs | Degree 2; identity; reversed orientation; scalar embedding | Factors 2,1,−1; coefficient extension preserves the scalar index | None |
| §3.0a Coleman cover and APIs | Smooth model; node; self-node; separated poles | One-core good-reduction case; opposite node residues; subdivision keeps distinct adjacent domains | None |
| §3.0b full coefficients and APIs | Transcendental α in (1−αz)⁻¹; scalar; log z; discwise indicator | Full analytic coefficients exceed finite tensor sums; scalar kernel; indicator fails Coleman continuation | None |
| §3.0c cohomology comparison and APIs | Positive genus with smooth model; total coboundary; φ=diag(1,q), Ne₂=e₁; residue 𝔽₄ | Proper H¹ survives χ=N=0; coboundary killed; Nφ=qN; identity coefficient lift uses q=4 over unramified quadratic ℚ₂ | None |
| §3.1 wide-open double pairing and APIs | Zero form; rational core; proper holomorphic forms; second-kind cup 1 | Values 0,0,0,1; global constant cancellation uses total residue zero | None |
| §3.1a reciprocity and APIs | Exact form; logarithmic unit; G_m; t²+1 over 𝔽₃; t²−3 over ℚ₃ | Radical and reciprocal exclusion persist; nonsplit eigenvalue −3 squares to 9; ramified generic point is different data | F02 |
| §3.2 harmonic primitives and APIs | Bridge jump 2; smooth fibre; cyclic jump 1; loop | Vertex constants kill bridge jump, not the cycle; ambiguity is one global scalar | None |
| §3.3 correction and APIs | c=2,d=3,rη=5,rω=7; reversal; one component constant shift | Correction −11; reversal preserves it; both sides respond to component shifts | None |
| §3.4 corrected pairing and APIs | ℙ¹ with Z empty; good reduction; second-kind cup 1; exact class | Values 0, component pairing, 1,0; full proper cohomology uses Čech representatives | None |
| §3.5 operators and API | N=0; symplectic plane; iterates; identity endomorphism; residue extension | Scaling q and cancellation 1−1; identity fails when q≥2; geometric residue extension iterates Frobenius | None |
| §4.0 geometric abelian logarithm and APIs | Dimension 0; torsion; small exp(v); finite model; transcendental-j curve | Values 0,0,v; finite-model comparison has no degree factor; arbitrary ℂ_p models included | None |
| §4.0a abelian primitives and APIs | Zero variety; invariant form; df; traced logarithm; finite extension | Invariant primitive is logarithmic group pairing; df integrates exactly; trace averaging uses inverse degree | None |
| §4.0b Albanese reduction and APIs | A¹; G_m; point; nonsplit quadratic residues; transcendental pole; dt at infinity | Exact and logarithmic parts distinct; quadratic trace needed; algebraic-closure spanning does not include transcendental-coefficient poles | None |
| §4.0c natural theory and all eight APIs | A¹; G_m; equal endpoints; ℂ_p transcendental-j curve; completed unramified field; ℚ̄_p; finite K | Values 1,T,0; geometric log pairing; αdt integrates to α; nonclosed fixed-field assertion fails; finite specialization unchanged | F01 |
| §4.0d reciprocity and APIs | Constant f; f=0; ℙ¹ with dt and (t−a)/(t−b); z=t²; identity | Constant sum 0; f=0 excluded; divisor value a−b; ramification factor 2; identity degree 1 | Explicit general ℂ_p input |
| §4.0e Jacobian bridge and APIs | Genus 0; multiplicative elliptic curve over finite K; noncompact K× | J trivial in genus 0; proper J(K) compact in bad reduction; valuation on K× prevents unrestricted vanishing | Finite-K scope retained |
| §4.1 logarithmic residues and API | f=x at xy=π; nonzero scalar; f=0 | Residue 1 equals −d(ord); scalar gives zero; logarithm of zero excluded | None |
| §4.2 harmonic comparison and APIs | Tree; cycle; df; Tate valuations 1/3,2/3 | Smooth-residue comparison holds; annular differences −1/3,−2/3 are not a common scalar | Finite-K scope retained |
| §4.3 annular interpolation and APIs | F_tail=2,c=6,t=1/3; reverse coordinate; quadratic refinement | Value 4 in both orientations; refined jumps 3,3 recover total 6 | None |
| §4.4 point sum and APIs | Empty poles; holomorphic forms; second-kind proper classes; graph cycle | Holomorphic sum zero matches isotropy; second-kind sum detects cup; cycle correction required | None |
| §5.1 labelled data and APIs | All L with half squares; zero functions; pair constants (1,0) and (1,−1) | Half squares satisfy equations; zero functions allow opposite constants; (1,0) fails product relation | None |
| §5.2 triple index and APIs | (1,1;L); (z,z;z⁻²); (z,z⁻¹;L); three L | Values 1,−2,1,0; division by 3 valid in ℚ₃ | None |
| §5.3 choice law and API | (L,0;L); shifts 1 and 2; zero residue; F,G pair shift | Values change −1,−2,0; F,G choice irrelevant; local value retains other auxiliary dependence | None |
| §5.4 simple-pole formula and API | (2+L,3;L); three half squares; u=az | Values 6,0; constant coefficient shifts by −log a, while full transported expression is invariant | None |
| §5.5 triple pullback and API | z=t²; identity; reversal; extra auxiliary shift | Factors 2,1,−1; unrelated auxiliary shift produces the residue error | None |
| §6.0 actual-form relations and APIs | Analytic gη; nonzero symbol; G dC | Analytic symbol zero; nonzero symbol excludes a zero actual form; G dC=0 | None |
| §6.1 global triple and APIs | Zero data; rational core; G=1 with B(F,H)=1 | Values 0,0,1; ordinary constants survive despite d1=0 | None |
| §6.2 global laws and APIs | Global auxiliary shift; one-end shift; G↦G+2 | Total residue cancels global shift; one-end change can be −1; scalar addition can contribute 2 | None |
| §6.3 Frobenius vanishing and API | Zero eigenclass; q=2 over ℚ₂; q=4 over its unramified quadratic extension; G=1 | Both eigenclass hypotheses needed; functional eigenvalue is 1/q, not q | None |
| §6.4 Coleman-form pairing and APIs | P(F,dH); G dC; product-rule relation | Gives B(F,H); zero form gives zero; actual relations preserve presentation independence | None |
| §7.0 Tate differential and APIs | n=1,2,3; q=1; p=2; z↦z/q | Loops and parallel edges retained; q=1 excluded; dlog invariant under gluing | None |
| §7.1 branch transport and APIs | u=p; e=2 uniformizer; u=1; df | Branch change 2 gives 2,1,0,0; all auxiliary data transported | None |
| §7.2 holomorphic proper integration and API | ℙ¹; elliptic curve; G_m | Values zero, abelian logarithm, and λ respectively; properness needed for branch independence | None |
| §7.3 coefficient trace and APIs | L=K; a=b; scalar defined over K; quadratic α²=π; tower | Identity, zero, degree factor; Tr(α)=0, Tr(α²)=2π; trace composes | Finite extension scope retained |
| §7.4 divisor integral and APIs | [t²−π]−2[0] with t dt; zero divisor without K-point; nonzero degree | Values π and 0; nonzero degree leaves basepoint term | None |
| §7.5 traced indices and APIs | Quadratic local residue 1; infinity; rational point; empty support | Traced values 2,−2; rational trace identity; empty sum zero; trace whole index scalar | None |
| §7.6 realization descent and APIs | Good reduction; ramified support splitting; common refinement; quadratic constant field | Intrinsic finite-K integral compares models; constant-field descent uses trace; no arbitrary whole-curve triple pairing | Finite-K scope retained |
| §7.7 Tate normalization and APIs | q=p³, log p=1; n=1,2; q=1; p=2 | Jump −1; q-period and branch terms cancel; denominator n=0 excluded | None |

Additional source checks for these rows: besser2017 line 402, line 421, line 449, line 528, line 553, line 700, line 738 and line 807; besser-zerbes2017 line 74, line 88, line 108, line 142 and line 245; besser-dejeu2012 line 2232, line 2277, line 2299, line 2430, line 2529, line 2546, line 2591 and line 2769; besser2005 line 355, line 358, line 365 and line 369; vologodsky2001 line 51 and line 1806. The latter retains its p>2 comparison scope.

## Check outcomes

The prescribed dependency gate used candidate `packages/ColemanIntegrationPartII/design/README.md`, `--only ColemanIntegrationPartII`, order `merge-order/ORDER.txt` and the supplied configuration. Exit status 0; exact output:

```text
candidate: ColemanIntegrationPartII is not in the merge order yet; checked as if placed after AnabelianGeometryAndNonabelianChabauty (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 11 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurs. The new supplier edge is also checked against the supplier's actual section and its earlier order placement above.

The scratch consistency check parsed JSON/TOML and compared every target, API, Check, proof sketch and layer-dependency summary with the README; it also checked internal reference order and the existing reverse consumer lists. Exit status 0; exact output:

```text
JSON/TOML parse: PASS; 6 certified sources
README/plan target, API, Check, proof and layer-dependency agreement: PASS; 45 targets, 139 API entries, 159 Checks
Definition Check minimum: PASS; 12 definitions, each with at least three Checks
Internal target dependencies: PASS; 113 edges, all point to earlier targets; usedBy entries agree
Absolute-path and set_option scan: PASS
```

`git diff --check`: exit status 0, no output. Changed-path and report-path scans: PASS; only the three authorized design/source files and this requested report changed.

No Lean command was run. This design package has no `Suggested.lean`, none is authorized for editing, and no elaboration command was supplied. All changes are README targets on geometric or supplier-dependent carriers; there is no changed Lean signature or example to synchronize and no claimed Lean build result.

## Maintainer notes

No existing theorem or API name was renamed or deleted. `SingleIntegral.naturalIntegration` and `singleIntegral_baseChange` now quantify over closed subfields and their inclusions. The finite-K input used by harmonic realization, divisor traces and compactness is their specialization, so those consumers retain their hypotheses.

New API names in §4.0c are `singleIntegral_cp`, `singleIntegral_closedFieldFixed`, `singleIntegral_geometricPrimitiveDescent` and `singleIntegral_abelianOpenQuotient`. The ℂ_p finite-map proofs in §4.0d explicitly consume the first and third. PadicPeriodRings gains a consumer without any requested supplier change. The mathematical targets remain 45; four API statements and four Checks were added. There are no unresolved findings or external decisions. No commit, push, issue or pull-request write was made. Independent review remains required.
