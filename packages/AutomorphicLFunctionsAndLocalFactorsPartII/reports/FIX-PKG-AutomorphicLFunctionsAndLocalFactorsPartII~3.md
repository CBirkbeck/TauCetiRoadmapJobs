# Repair report: automorphic L-functions and local factors, Part II

## F01 (P1) — applied

Swapped compact labels → coordinates (J, conjugate J′), generator (−m+a_χ;m−b_χ), and dual label (m−a_χ;−m+b_χ). Recomputed both branch labels, the χ₀⁻¹ opposite twist, projection vectors and §§4.8–4.10 fiber I_EHLS(χ_u⁻¹,t−n/2). Added phase i=i and positive-Levi 1/16=1/16 Checks; updated the unitary L-character comparison. Evidence: EHLS lines 3351–3386 and 3680–3683.

## F02 (P1) — applied

Returning character χ⁻¹ → χʷ=(χ^c)⁻¹. Section 2.4 now types both intertwining maps, both inverse composites and the ψ reversal; GU retains its separate multiplier transport. Section 3.4 tracks χ⁻¹→χ^c and its dual-factor comparison. Angular test: χʷ(i)=i, whereas χ⁻¹(i)=−i. The direct Levi calculation in §1.3 proves the character operation is involutive.

## F03 (P2) — applied

Unrestricted exactness → contravariant continuous-functional exactness on the finite-length wave-front-bounded Serre category and its quotient. Specified the dual and inverse neutral-character conventions, synchronized the plan contract, and placed §5.2's constituents in that category before exactness. Added (2,2) versus (4) prefix-sum control. Evidence: GGS17 lines 118–121, 233–252 and 1310–1326; MODELS lines 219–222.

## F04 (P2) — applied

Vague support → successive order-k derivatives, terminal-space dual and orbit vanishing. Split globalization into prescribed classical and controlled GL-test contracts with compatible centers and explicit permitted ramification; updated §§10.5–10.6 and the cancellation example. Unspecified square-factor pole criteria → the two partial factors, exact essential-duality exclusion and half-plane, with shifts in §8.5. All needs sentences match the plan.

## F05 (P2) — applied

Arbitrary-field attribution to the complex supplier → three pinned general-field Weyl declarations. Section 4.4 now constructs the coefficient-field Cauchy isomorphism, complementary projectors and normalized highest-line maps on those carriers; complex highest weights remain a complex comparison. Updated ownership, supplier contracts, proof inputs and Layer 4 dependencies. Added E=ℚ(i) projector ranks 3,1 and dimension 10=9+1.

## F06 (P3) — applied

Unspecified field and conductors n≥1 → ℚ₂ and one character of each conductor n≥2. Section 5.2 computes extra K(m)-fixed dimensions max(m−1,0), retains Whittaker dimension 1 and infinite length, and records the trivial conductor-one quotient. The general admissible (k,c) definition and the separate finite-length assertion for ρ_c(τ) are unchanged.

## F07 (P3) — applied

Joint CPS94 locator pp.161–164 → pp.161–165 in §10.3, References and sources.toml. The direct bound now cites CPS94 lines 272–283 and the inverse bound lines 298–311, after the p.165 marker at CPS94 line 296. No mathematical statement was weakened.

## Checks and file boundaries

- Required elaboration: `lake env lean` on `packages/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean`, supplied to Lean by absolute command argument and run from the pinned content checkout, exited 0 with no output or warnings. No Tau Ceti module is imported, so no object-file build was needed. Nothing remains running.
- Expanded signatures: Suggested.lean has zero declarations. I enumerated every declaration and compared that empty list with the README; the required `#check @name` scratch-file audit therefore has an empty domain. There is no missing binder to repair and no new or deleted Lean name. The file retains one `import Mathlib`, one module docstring, the prescribed namespace, and no admitted data, examples, padding or options.
- Headline audit: all seventeen groups in that docstring still identify the correct README sections and their missing smooth/Casselman–Wallach, automorphic, theta, induced-family or Whittaker carriers. Native polynomial and Weyl modules make the supporting Cauchy calculation statable, but do not state the holomorphic branching or critical-integral headlines. No replacement scalar theorem was introduced.
- Source manifest validation: `packages/AutomorphicLFunctionsAndLocalFactorsPartII/sources.toml: 0 problem(s)`. Two preliminary invocations used the source checker CLI incorrectly (missing positional target, then README as a TOML target); the corrected manifest-target invocation above exited 0. These were invocation errors, not source-validation failures.
- Citation resolver: no cross-roadmap citation or Lean name found nowhere. Its remote snapshot was main 5f173a7 and 362 indexed open heads; its warning that it cannot inspect local pinned Lake packages was addressed by direct local source inspection. The supplied content checkout is 8888d45; its existing main roadmaps were read there, not replaced by revisions of those roadmaps at open heads.
- Formatting verification: `git diff --check` exited 0. The statement audit has 62 numbered-target rows, 130 distinct API-law rows and 21 supplier-contract rows, in addition to the conventions.
- JSON comparison against the starting package: every top-level key other than `gaps` is identical; all six legacy G-records are identical. All 21 slugged supplier contracts have exactly the same supplier and needs sentence in README and plan. metadata.toml and Suggested.lean are unchanged. Only README.md, sources.toml, the allowed gaps and this report changed.
- No gate failures were listed in the brief. No tooling, merge order, other package, source extraction, pin, issue or pull request was edited; no commit was made.

The required dependency check, with the supplied order and `--movable`, exited 0:

```text
depcheck: 51 roadmaps, 590 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The repaired package retains its existing layers and all-place scope.

## Source and ownership verification

GGS17 was fetched through the sources service from arXiv:1502.06483v5 and recorded once under its existing bibliographic identity. Its Theorems E–F, Corollary G and proof were read directly at GGS17 lines 219–252 and 1310–1326; pages and numbering refer to v5. No missing-reference request remains. CFK22, KAP23 and YAM14 remain settled uncertified citations; their primary proofs were neither read nor requested again.

The decisive other passages were read directly: EHLS lines 3281–3437 (dual compact types, factors and branching), 3442–3574 (operators and rational projection), 3675–3699 (critical section and nonvanishing); MODELS lines 94–128 and 194–222 (model, derivatives and exactness); CFK lines 1721–1729 (square factors), 1792–1828 (two globalization applications); CPS94 lines 256–311 (both convergence directions). The corrections follow the displayed coordinate formulas, rather than treating a source's differently labeled compact type as an identification.

The new rational inputs were checked at Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039:

| Declaration / source location | Actual coefficient hypotheses and limit |
|---|---|
| TauCeti.YoungTableau.weylModule, TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:130 | Commutative ℚ-algebra; image of a rational Young symmetrizer on a tensor power. This supplies a module value, not a functor on arbitrary modules. |
| TauCeti.weylModuleOfShape, same file:429; TauCeti.weylRepOfShape:441 | Same coefficients, row-superstandard shape choice and its GL action. |
| TauCeti.isIrreducible_weylRepOfShape_iff, TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Irreducible.lean:160 | Field, characteristic zero; irreducible iff the row count is at most n. |
| TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/SchurWeyl.lean:20 | Character decomposition over characteristic-zero fields; it does not construct the required two-factor polynomial Cauchy isomorphism. |

The native Mathlib claims were checked at pin 6b7abb3c7686292736be2955bd3eb9ebf63b456a in their cited files: block constructor/multiplication at lines 45/213; conjugate transpose at line 43; Hermitian predicate at line 44; trace at line 43; AddChar at line 70; Lipschitz/Spin at lines 61/292. The Tau Ceti Clifford-group comparison at TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/CliffordGroup.lean:138 retains finite dimension, invertible 2, nondegeneracy and a represented unit. No new import was added merely to catalogue those inputs.

Ownership searches used the required `roadmaps grep` by object across main and the indexed open heads, followed by `roadmaps show` for relevant suppliers, and `rg` across board package READMEs and designs. Searches covered orbit support, generalized Whittaker functors, wave-front bounds, controlled globalization, rational Young symmetrizers and polynomial Cauchy decomposition. The existing constructors belong to their named suppliers; the field-compatible matrix-polynomial specialization and its holomorphic comparison remain §4.4 of this package. No second Weyl-module constructor or general representation category was planned here. Related GanGrossPrasadUnitaryGroups and OverconvergentAutomorphicForms material does not own this polynomial/holomorphic comparison. ClassicalGroupsPartII's rational GSp direction does not supply it. No declaration collision is possible in the empty acceptance namespace.

All cross-roadmap contracts were re-opened at the available main copy or, for new roadmaps absent there, their indexed heads:

| Supplier | Resolved sections and boundary |
|---|---|
| ReductiveGroups; OrthogonalSpinGroups | Main Layer 7 and Layers 0–1: parabolics, Levi, orthogonal/Clifford carriers and vector actions. Main ReductiveGroups 10A gives scalar extension of rational representations; it does not normalize this Cauchy map. |
| RepresentationTheory/ClassicalGroups | Main conventions at line 28 and Layers 2–3 at lines 216/237: complex theory only. The general-field inputs above replace that over-attribution. |
| ReductiveGroupsPartII | RG2.0.1–0.2, RG2.0a, RG2.4, RG2.5.1–5.2: topological points, restriction of scalars, local decompositions and L-groups of supplied reductive groups. Concrete Hermitian/GSpin extensions remain explicit gaps. |
| SmoothRepresentationsOfLocalGroups | SR.0.4, SR.2.1–2.3, SR.3.3, SR.4; SR.5.2 segment-representations and SR.5.3 mirabolic-derivatives/highest-derivative-adapter. No general orbit comparison is inferred from ordinary Jacquet exactness. |
| AutomorphicFormsOnReductiveGroups | §§2.1–2.7, 3.4–3.5, 4.1–4.3, 5.3–5.4, 6.1–6.2. Section 4.2 concerns actual cuspidal occurrences, not the two prescribed-local existence contracts, which remain gaps here. |
| AdelicAlgebraicGroups | §§0.1–0.4, AA.1, §§2.2–2.3: restricted products, measures, points and quotient integration with their countability/local-compactness conditions. |
| GL2AutomorphicRepresentationsAndTransfer | R16.1.8: full finite-image local prescriptions, trivial infinity, auxiliary finite ramification and possible growth of order. It is not used to prescribe arbitrary supercuspidal representations. |
| AutomorphicLFunctionsAndLocalFactors | Representation prerequisites, AL.0–AL.4 and period interfaces in AL.5: scalar/vector Fourier theory, Tate/GJ/GL pair factors, Satake bounds, isobaric sums and their strong multiplicity one. Section 10.3's fixed-twist testing family remains distinct. |
| AutomorphicSpectralTheory | §§1.1–1.4, 2.1–2.6, especially 2.3a/2.4/2.4a/2.5; §4.14a; Layer 4; §5.12. Discrete-data unitary-axis regularity is present; the additional bounded Whittaker, residual-support and normalizer inputs remain named contracts. |
| EndoscopicTransferAndUnitaryTraceComparison | §5.1 uses the same residual Speh block; §10.29 defines nongeneric GL products from ordered Langlands data. Its global endoscopic transfer is not an input to this transfer proof. |
| GeometryOfNumbersAndQuadraticArithmetic | §2.9's initial field-with-involution carrier and adjoint are general; its local classification retains odd residue characteristic. Only the carrier is used generally. |
| MetaplecticAutomorphicForms | §3.2a, §§3.3/3.3b and 3.5–3.7, §3.15, §6.2, §§6.10a–6.11: split pairings, oscillator/theta, finite-place MVW, Siegel family and classical standard factors. Real MVW and the exact EHLS comparisons remain their stated separate targets. |

Ownership against separately named open pull requests without supplied files was not checked beyond the authorized indexed object search; no separate checkout was sought. The available main files, indexed roadmap heads and board package files were searched as described above.

## Adversarial mathematics pass

These are computed falsification controls on the stated objects and hypotheses, not proofs of the analytic targets or a substitute for independent review. Every numbered target is represented below; the following API table separates its individual laws. Values at poles are compared as germs and orders. In formulas below ν denotes the norm character, and a regular nonzero test value may be scaled to 1 for linearity controls.

| Statement | Instances tried and computed values on both sides | Result; change |
|---|---|---|
| Conventions: fields, norms, coefficients | ℚ₂/ℚ₃ give q=2/3; ℂ/ℝ gives norm(2)=4; split (2,1/2) has norm 1. q=1, characteristic-p base fields and the zero ring fail the hypotheses. | Compatible; retain dyadic places. |
| Conventions: empty/rank-zero and scalar domain | U(0)=1; multiplier-recording GU(0)=Gₘ. In F×F, (1,0)(0,1)=0, so the split algebra is not a field. Empty product=1. | Compatible; no false field instance or s/0. |
| Conventions: variables, duals and meromorphic orders | s_U=1/4 gives z=3/4→1/4 and s_U→−1/4. s_G=1/2 gives s_E=0. Germ t⁻¹/t⁻²=t. | Compatible; no numerical ∞/∞. |
| 0.1 doubled form | h=[1], cross-pairing of (1,−1),(1,1) is 2; (3,1)→(1,2)→(3,1). Rank zero gives the zero space. | Pass; unchanged. |
| 0.2 modulus | n=1,B=2,λ=1 gives 1/4; B=2,λ=4 gives 1. Inverse convention gives 4 in the first case. | Pass; unchanged. |
| 0.3 degree/determinant | Sp₂→3, SO₃→2; GSpin₅ scalar tI₄ has determinant t⁴=(t²)². | Pass; unchanged. |
| 1.1 induction | n=1,s=0,B=2 gives half-modulus 1/2. An extra norm twist gives 4·1/2=2. | Pass; unchanged. |
| 1.2 Godement section | p=diag(9,1),s=0, trivial characters: covariance=3; Haar×2 makes a value 3 into 6; Φ=0 gives 0. | Pass; unchanged. |
| 1.3 continuation/Weyl transport | χ=norm^i at B=2 gives 4^i→4^(−i)→4^i. χ(z)=z/abs(z) gives i→i at i; s=1/4→−1/4. | Pass; preserve both character tests. |
| 2.1 divided period | Pairing 2, Z=6 gives I=3; scaling dual by 3 gives pairing 6, Z=18, I=3. Pairing 0 prohibits division. | Pass; unchanged. |
| 2.2 denominator | q=2: d₀=1, d₁(0)=2, d₂(0)=(4/3)(2/3)=8/9; wrong quadratic sign gives 8/3. | Pass; unchanged. |
| 2.3 spherical formula | X=1/2,Y=1/3 gives Z=5/2, d=6/5, dZ=3=Euler numerator. | Pass; unchanged. |
| 2.4 inverse intertwiner | Angular χ: χʷ(i)=i versus χ⁻¹(i)=−i; (χʷ)ʷ(i)=i. Norm character gives 4^i→4^(−i)→4^i. | Pass after typed-map repair. |
| 3.1 global pairing | S₃ standard plane: v=(1,−1,0), ℓ=x₃ gives ℓ(v)=0 and ℓ((23)v)=−1. | Pass; translated coefficient need not vanish. |
| 3.2 MVW | U(1) weight 2 at exp(iπ/4): i→−i. GL₂(ℝ), 2R_(π/2): inverse-transpose=R_(π/2)/2; after diag(1,−1) conjugation it is R_(−π/2)/2. | Pass; inner adjustment retained. |
| 3.3 Garrett map | Order-three χ gives output ζ₃ and dual ζ₃², distinct; zero section gives 0; section×2 gives twice the period. | Pass; unchanged. |
| 3.4 unitary completion | Original twist χ⁻¹, returning twist χ^c. At χ=z/abs(z), χ⁻¹(i)=χ^c(i)=−i; conjugation/duality supplies the dual χ factor. | Pass after character comparison. |
| 4.1 positivity | a=b=1: κ=(1;−1) has gap 2 and μ=(0,0); (0;0) has gap 0<2. a=0 gives cohomological degree 0. | Pass; unchanged. |
| 4.2 scalar model | n=1,m=3,a_χ=2,b_χ=0: generator (−1;3), central value z²=i at exp(iπ/4). Old swapped generator gives z⁻²=−i. J_χ(1)=1. | Pass after compact-label repair. |
| 4.3 injection | Generator evaluation is 1≠0; its phase is i on both source and image after F01. The zero map has value 0. | Pass after propagated type correction. |
| 4.4 Cauchy | u=d=2 over ℚ(i): dimension 10=9+1, tensor projector ranks 3,1. u=0,d=0 gives dimension 1; u=0,d>0 gives 0. Noncommuting shear pullback at I is [[1,−1],[−1,2]]. | Pass after field-supplier repair. |
| 4.5 branching | n=2,a=b=1,m=3,a_χ=2,b_χ=0,r=1,s=0 gives generators (−2;3) and (−1;4). Transported dual (−3;2)+2=(−1;4). Central sums 1+3=4, so z=exp(iπ/8) gives i, not −i. | Pass after both branch/twist repairs. |
| 4.6 raising | r=(1,1) gives Δ₂([[1,2],[3,4]])=−2; Δ₁²=1. Weighted degree 2 versus unweighted differences 1. Empty partitions give operator 1, degree 0. | Pass; labels propagated. |
| 4.7 projection | At degree zero choose the generator as target vector: coefficient P=1. Rescale target vector by 3: P=1/3. Both are nonzero in E; zero projection gives 0. | Pass with corrected opposite vector and E-form. |
| 4.8 critical section | m=3,a_χ=2,b_χ=0,n=1: t=2,s_crit=3/2; J_χ(m(2,1))=1/16=(1/2)4^(−3/2). Phase gives i=χ_u⁻¹(z), not χ_u(z)=−i. | Pass after inverse character and parameter repair. |
| 4.9 nonvanishing | Scalar disk m=2: 2π∫₀¹r dr=π≠0; zero paired vector yields 0 and is excluded. | Pass; uses the repaired fiber. |
| 4.10 algebraicity | Disk m=2 gives π⁻¹I=1; Haar×2 gives 2; compact signature ab=0 gives period power 1. Rescaling by π breaks the prescribed E-normalization. | Pass; fiber and rational inputs propagated. |
| 5.1 unipotent character | k=3,c=1 with x=1,z=2,x′=3,z′=4: adjacent trace 10; top-right cross term 4 contributes 0. k=1 gives trace 0, character 1. | Pass; unchanged. |
| 5.2 models | k=1,c=2: determinant-character model dimension 1, generic Whittaker dimension 0. Over ℚ₂ conductor-one character count 0; n≥2 contributes 0,1,2,3 fixed lines at m=1,2,3,4. | Pass after bounded exactness and conductor repair. |
| 5.3 root elimination | k=2,c=3,l=1: exponent (6−2−3+1)/2=1; norm 1/2 gives factor 1/2. Equal l,c−l at c=2 still permutes (1,2,3,4)→(1,3,2,4). | Pass; unchanged. |
| 5.4 geometry | k=1 gives U=1; Sp₂,k=2 entries 1,2 give ψ(3). GSpin₂ has center dimension 2, distinguished center dimension 1, quotient dimension 1. | Pass; unchanged. |
| 5.5 sections | s=1/2 gives norm factor 1; (1−2⁻ˢ)⁻¹ has a pole at 0 and fails entire/polynomial conditions. | Pass; unchanged. |
| 5.6 estimates | Spherical GL₂ W(ϖ^m)=q^(−m/2)(m+1) for m≥0, 0 for m<0. Opposite SL₂ integral has tail exponent −1 at chamber boundary, hence logarithmic divergence, and exponent less than −1 inside. | Pass; positive chamber needed. |
| 6.1 integral | k=1 inner mass-one integral is evaluation; central factors 2 and 1/2 give descent multiplier 1, not 2. | Pass; unchanged. |
| 6.2 continuation/nonzero data | SO₂ trivial spherical data, q=2,s=1: L=4,b=4/3,Z=3. Zero section instead gives 0. | Pass; existence is not universal nonvanishing. |
| 6.3 multiplicity one | Open-orbit equal irreducibles give Hom dimension 1; distinct irreducibles give 0. Degree-zero conormal vanishing alone leaves higher delta derivatives uncontrolled. | Pass as boundary control; complete distribution proof remains a target. |
| 6.4 normalized operator | λ(s)×exp(s) changes C by exp(2s−1), giving exp(−1) at 0. Reflection sends 1/4→3/4→1/4. | Pass; unchanged. |
| 6.5 gamma | c=2,k=1,s=1, trivial characters: θ=2 over ℚ₂ and 1 over ℚ₃. Sp₀ Tate gamma at q=2,s=2 is −3/4, not 1. | Pass; unchanged. |
| 6.6 identities | ψ_b with N=3,k=1,b=2 over ℝ has norm factor 1 at s=1/2 and 2^(3/2) at s=1; reflection twice gives s and dual twice gives π. | Pass; central factors retained. |
| 6.7 factors | P=1−2X has P(0)=1 and reciprocal value 2 at X=1/4. An empty Sp GL block retains L(s,τ); twists ±1/4 give two shifted factors. | Pass; unchanged. |
| 6.8 normalizer | c=2 has square arguments 2s and 2s+1. GL₁ exterior square has dimension 0 and factor 1; Sp adds standard argument s+1. | Pass; unchanged. |
| 6.9 holomorphy | SO₂ trivial tempered L=(1−q⁻ˢ)⁻² has a pole at 0, outside Re(s)>0. Removing a negative-shift factor leaves L(s+a), a>0. | Pass; strict/boundary distinctions retained. |
| 6.10 stability | Deep ramified GL₁ twist has L=1. GSpin₅ has standard determinant χ²; a candidate determinant χ would not meet the stability hypothesis. | Pass; primary CFK22 proof remains uncertified. |
| 7.1 auxiliary integral | k=1,c=2 exponent s+1/2; k=2,c=1 exponent s−1/2. Uncut k=c=1 shell tails demand Re(s)>0 and Re(s)<0 simultaneously. | Pass; retain Schwartz data. |
| 7.2 auxiliary equation | GL₁ sign, k=2 gives −1; k=3 gives +1. GL₂ sign∘det at −I₂ gives +1. | Pass; central rather than determinant evaluation. |
| 7.3 common divisor | P=1−X/2 gives pole order 1 at X=2. Family t⁻¹,t⁻² has common pole order 2 and quotients t,1. exp(s) adds order 0. | Pass; multiplicity and unit ambiguity retained. |
| 7.4 RS domination | L_RS=t⁻¹, auxiliary divisor=t⁻²: quotient L_RS/auxiliary=t is entire; reverse quotient=t⁻¹ has a pole. | Pass; direction retained. |
| 7.5 open chart | Root exponent k=2,c=3,l=1 is 1; determinant norm 1/2 gives 1/2 and inverse convention gives 2. | Pass; unchanged. |
| 7.6 attainment | Z=t⁻²,L=t⁻¹ gives orders −2≤−1 and quotient t⁻¹. s_G=1/2 gives supplier variable 0. | Pass; poles in the quotient allowed. |
| 8.1 Speh series | c=1 gives ρ₁(τ)=τ; s_G=3/4 gives s_E=1/4. Section×2 doubles every convergent summand. | Pass; imported residual datum retained. |
| 8.2 constant term | c=2,c′=1 gives M₁ region Re(s)>−1/2 and normalized M₂ region Re(s)>0. Raw ratio L(2s)/L(2s+1) has the displayed numerator direction. | Pass; unchanged. |
| 8.3 residual exponents | c=2,Re(s₀)=1/4 gives first exponent −3/4, tail≤1/4, partial sums≤−3/4,−1/2. At 0 final bound=0. | Pass; boundary uses its separate input. |
| 8.4 holomorphy | τ=1, θ ramified quadratic: at a unit with θ(u)=−1, norm(u)^it=1 for every t, so no essential duality. θ=1 admits t=0. | Pass; unchanged. |
| 8.5 normalizer holomorphy | τ=χ=1 on GL₁: Sym² factor has pole at u=1, excluded by duality; exterior factor=1. Ramified nontrivial χ excludes the norm twists. At c=2,s=1/2 arguments are 1,2 and Sp argument 3/2. | Pass after exact contract and shifts. |
| 9.1 unfolding | SO₂ local values give (4/3)·3=4. Zero cusp vector gives 0; k=1 gives U=1. | Pass; unchanged. |
| 9.2 completion | Move good factor 2 into S: multipliers 1/2 and 2 give 1. Rational b=2 gives norm product 2·1/2=1; real-only idele gives 2. | Pass; unchanged. |
| 9.3 equation/strips | SO₂ trivial completion Λ(s)²=Λ(1−s)² with epsilon 1. Its pole at 1 prevents invocation of the entireness-dependent strip bound. | Pass; no growth conclusion from equation alone. |
| 9.4 entireness | ord Q=−1, ord(b^S Z)=0 implies ord L=1≥0. Reversing the inequality would give the wrong conclusion. | Pass; unchanged. |
| 10.1 weak transfer | Sp₂ identity class yields (1−T)³ and degree 3; allowing two finite exceptions still requires every infinite infinitesimal character. | Pass; unchanged. |
| 10.2 coarse transfer | GL₂ trivial and Steinberg share {ν^(1/2),ν^(−1/2)}; (1−x)/(1−1/x)=−x. Their ordinary Whittaker dimensions are 0 and 1, and L-factors differ. | Pass; support is not isomorphism. |
| 10.3 converse | N=2 tests {1}; N=3 tests {1,2}. N=3,σ₀=1 gives inverse bound q²; a unitary test exponent <1/2 requires Re(s)>5/2 for the direct product. | Pass; CPS94 locator expanded. |
| 10.4 transfer | Over ℚ₂ conductor m≥4 has square conductor m−1≥3; at odd residue characteristic deep conductor m is preserved. A ramified η²χ cannot equal an unramified norm twist. | Pass; unchanged. |
| 10.5 isolation | T={v₁}, extra test place w common-good: v₁ cancels by stability, w by §6.8, leaving 0 uncontrolled factors away from v₀. A ramified test at v₁ would leave 1. | Pass after controlled-test contract. |
| 10.6 local existence | GL blocks of total rank l add 2l to N₀. l=1 gives Sp₂ degree 1+2=3 and SO₃ degree 0+2=2. Unitary norm twist followed by its inverse has total exponent 0. | Pass after separate classical contract. |
| 10.7 general automorphic transfer | Empty GL block gives N=N₀; Sp₀ tail contributes degree 1 and SO₁ tail degree 0. With l=1 totals are 3 and 2. | Pass; no replanned cuspidal-support construction. |

### Individual API laws

A1, A2, … follow the prose-bullet order in each numbered target. Each row gives a computed control; “retain” means no additional edit resulted. Scalar tests use permitted regular data, and transport tests carry both a representation map and its inverse dual. They do not assert that arbitrary chosen scalars are actual Euler factors.

| Statement | Instances and values computed | Result; change |
|---|---|---|
| 0.1 A1 Gram matrix | h=[1] gives diag(1,−1); evaluation at (1,1) is 0. | Pass; retain. |
| 0.1 A2 inverse polarization | (5,1) maps to (2,3), and (2+3,3−2)=(5,1). | Pass; retain. |
| 0.1 A3 product embedding | diag(i,−1)²=diag(−1,1); separate similitude multipliers 4,1 fail to match. | Pass; retain. |
| 0.1 A4 isometry transport | Multiplication by −1 sends (x,±x) to (−x,∓x), still diagonal/antidiagonal respectively. | Pass; retain. |
| 0.1 A5 determination | Polarization coordinates (2,3), restrictions 2,3 give 2·2+3·3=13; zero restrictions give 0. | Pass; retain. |
| 0.2 A1 Levi | B=3,λ=1 gives diag(1/3,3), Δ=3,ν=1; λ=9 gives diag(3,3). | Pass; retain. |
| 0.2 A2 additive radical | n(i)n(3i)=n(4i); under X=iY the Hermitian coordinates are 1,3,4. | Pass; retain. |
| 0.2 A3 modulus | These Levi cases give 1/9 and 1; inverse modulus would give 9 in the first. | Pass; retain. |
| 0.2 A4 coordinates iff | Equal (3,1) yields identical matrices; changing λ to 9 changes the first entry from 1/3 to 3. | Both directions pass; retain. |
| 0.2 A5 factorization | Fixed diagonal with radical X=i gives its unique upper-right block; multiplication of i,3i gives 4i. | Pass; retain. |
| 0.3 A1 degrees | Sp₂,SO₂,SO₃,GSpin₂,GSpin₃ give 3,2,2,2,2. | Pass; retain. |
| 0.3 A2 central restriction | Nonspin gives 1; a spin character value χ(2)=i remains i on the distinguished central cocharacter. | Pass; retain. |
| 0.3 A3 determinant | Scalar tI₄ gives t⁴=(t²)²; n=1 spin standard determinant is χ. | Pass; retain. |
| 0.3 A4 pinned transport | Permuting diag(2,1/2,1) preserves dimension 3 and determinant 1. | Pass; retain. |
| 1.1 A1 covariance | n=1,B=2,s=0: 1/2; replacing χ=1 by norm gives 2. | Pass; retain. |
| 1.1 A2 compact carrier | One compact function with value 3 at identity has value 3 in both s=0 and s=1 fibers. | Pass; retain. |
| 1.1 A3 restriction | Multiplier factor at ν=1 is 1; n=s=1,ν=4 gives 2. | Pass; retain. |
| 1.1 A4 extension | Compact value 3 extends to 3/2 at B=2,s=0; compact value 0 extends to 0. | Pass; retain. |
| 1.1 A5 equality | Equal compact values 3,3 extend to 3/2,3/2; values 3,6 extend to 3/2,3. | Both directions pass; retain. |
| 1.2 A1 linearity | Test-section values 2 and 4 sum to 6; zero Schwartz data give 0. | Pass; retain. |
| 1.2 A2 covariance | Trivial χ, n=1,s=0,p=diag(9,1) gives square-root factor 3. | Pass; retain. |
| 1.2 A3 translation | (0,x)diag(3,1)=(0,x); right translations by diag(3,1),diag(2,1) compose to diag(6,1). | Pass; retain. |
| 1.2 A4 extensionality | Equal Schwartz functions have difference 0 and section difference 0; rescaling Haar by 2 instead doubles the section. | Pass; retain. |
| 2.1 A1 trilinearity | Three scalars 2,3,4 multiply an initial value 1 to 24. | Pass; retain. |
| 2.1 A2 divided identity | I=3,pairing=2 gives Z=6; pairing 0 is excluded. | Pass; retain. |
| 2.1 A3 Haar | Haar×2 sends (Z,I)=(6,3) to (12,6). | Pass; retain. |
| 2.1 A4 transport | Map×3 with dual×1/3 preserves coefficient multiplier 1 and Z. | Pass; retain. |
| 2.2 A1 parity | At q=2 the two factors are 4/3,2/3; product 8/9 rather than 8/3 with the wrong sign. | Pass; retain. |
| 2.2 A2 recurrence | d₁(1/2)=4/3, new factor 2/3, d₂(0)=8/9. | Pass; retain. |
| 2.2 A3 inverse twist | χ(ϖ)=2 gives χ⁻¹(ϖ)=1/2; at norm argument 1/4, Euler arguments are 1/2 versus 1/8. | Pass; retain. |
| 2.2 A4 empty product | Zero factors multiply to 1; n=0 does not enter s/n. | Pass; retain. |
| 3.2 A1 automorphism | For noncommuting shears g,h, transpose-inverse satisfies θ(gh)=θ(g)θ(h), and θ²(g)=g; ordinary inversion reverses order. | Pass; retain. |
| 3.2 A2 dual | U(1) weight 2 at exp(iπ/4) gives i; pullback and dual give −i. | Pass; retain. |
| 3.2 A3 diagonalization | Swapping diag(3,1/3) gives diag(1/3,3); both traces are 10/3. | Pass; retain. |
| 3.2 A4 functor | Scalar intertwiners 2,4 compose to 8; pullback twice returns those same values. | Pass; retain. |
| 3.3 A1 pairing | Zero section gives period and pullback pairing 0; permitted regular value 1 gives 1 on both descriptions. | Pass; retain. |
| 3.3 A2 bilinearity | Section×2 and vector×4 give value multiplier 8. | Pass; retain. |
| 3.3 A3 critical Hecke compatibility | A specialized eigenvector with eigenvalue 3 retains eigenvalue 3 under the identified critical map; order-three output has ζ₃, not ζ₃². | Scope control passes; retain. |
| 3.3 A4 occurrence transport | Embedding×3 and dual×1/3 give multiplier 1. | Pass; retain. |
| 4.1 A1 generator | κ=(2;−1) yields generating weight (−2;1); p⁻ sends its generator to 0. | Pass; retain. |
| 4.1 A2 dual | Restricted dual sends (−2;1) back to (2;−1) and exchanges the two annihilating tangent summands. | Pass; retain. |
| 4.1 A3 cohomology | a=b=1 gives degree 1 and dimension 1; compact a=0 gives degree 0. | Pass; retain. |
| 4.1 A4 universal map | Generator value 3 extends PBW monomials 1,x to 3,3x; generator 0 gives the zero extension. | Pass; retain. |
| 4.1 A5 determination | Extensions with generator 3 agree on x² as 3x²; generator 4 gives 4x² instead. | Pass; retain. |
| 4.2 A1 image | Repaired generator gives J_χ(1)=1 and phase i; swapped compact generator gives −i. | Pass; repaired. |
| 4.2 A2 cocycles | Scalar z=w=i gives J(zw)=−1=iw and J′(zw)=−1=(−i)(−i). | Pass; retain. |
| 4.2 A3 GU character | ν⁰,ν¹ at ν=4 give 1,4; both at ν=1 give 1. | Pass; separate multiplier retained. |
| 4.2 A4 coordinate transport | Identity transport preserves J(1)=1; central phase transport gives i on both sides of the repaired equivariant map. | Pass; type propagated. |
| 4.4 A1 Cauchy/base change | Degree 2 over ℚ and ℚ(i) has the same ranks: 10=9+1. At degree zero both sides have dimension 1. | Pass; explicit map target added. |
| 4.4 A2 projectors | swap²=1 gives ((1±swap)/2)²=(1±swap)/2 and P₊P₋=0; ranks 3,1 sum to 4. Δ_(1,1) has diagonal coefficient 1. | Pass; explicit field-linear projectors added. |
| 4.4 A3 normalization | Δ₂=X₁₁X₂₂−X₁₂X₂₁ has rational coefficients 1,−1 before and after scalar extension; πΔ₂ has coefficients π,−π outside ℚ(i). | Pass; explicit rational normalization added. |
| 4.6 A1 symbol | r=(1,1), matrix [[1,2],[3,4]] gives Δ₂=−2, competing Δ₁²=1. | Pass; label propagated. |
| 4.6 A2 field | Determinant coefficients 1,−1 lie in ℚ⊂E; no transcendental scalar enters. | Pass; supplier repaired. |
| 4.6 A3 degree | r=(1,1) has degree 2; r=0 gives degree 0. | Pass; retain. |
| 4.6 A4 algebra map | Abelian tangent variables give [x,y]=0 and xy=yx; PBW sends x+y to x+y and xy to xy. | Pass; retain. |
| 4.6 A5 recovery | Symbols Δ₂ and Δ₁² differ by values −2 versus 1 on the test matrix; identical polynomials give symbol difference 0. | Pass; retain. |
| 4.8 A1 section | Empty partitions,B=3,g=1 gives f=3·1·1=3. | Pass; fiber propagated. |
| 4.8 A2 fiber | Inverse χ_u gives phase i; at m(2,1) the section and normalized covariance both equal 1/16. | Pass; repaired. |
| 4.8 A3 scaling | B=1→3 changes section value and integral by factor 3. | Pass; retain. |
| 4.8 A4 E scaling | B=3,a=2 gives B′=6, section values 3→6 and doubled local integral. | Pass; retain. |
| 4.8 A5 compact determination | In the repaired fiber, compact values 1,2 extend in ratio 2; equal values extend equally. | Pass; fiber propagated. |
| 5.1 A1 character | For ψ(x)=exp(2πix), traces 1/4 and 1/4 give ψ(1/2)=−1=i·i. | Pass; retain. |
| 5.1 A2 stabilizer | k=2,c=1, equal scalars preserve ψ(1/4)=i; ratio 2 gives ψ(1/2)=−1. | Both directions pass; retain. |
| 5.1 A3 ordinary Whittaker | c=1,k=3, adjacent entries 1/4,1/4 yield −1 in both formulas. | Pass; retain. |
| 5.1 A4 identity | Adjacent trace 0 gives ψ(0)=1. | Pass; retain. |
| 5.1 A5 ψ scaling | b=2 and trace 1/4 give −1, whereas b=1 gives i. | Pass; retain. |
| 5.2 A1 coefficient | Normalize W(1)=1 and choose ψ(u)=i; then W(u)=i. | Pass; retain. |
| 5.2 A2 stabilizer character | k=1,c=2, τ=sgn and g=diag(−1,1) give τ(det g)=−1 in both realizations. | Pass; retain. |
| 5.2 A3 λ scaling | λ×3 changes W(1)=1 to 3. | Pass; retain. |
| 5.2 A4 kernel | For 1⊕σ and λ on the first factor, (1,0) maps to function 1, (0,v) to 0; λ ignores the second factor. | Pass; retain. |
| 5.2 A5 equality | Vectors (1,0),(1,v) give the same constant function 1 but distinct preimages. | Both directions of function extensionality pass; retain. |
| 5.2 A6 distinguished constituent | k=1,c=2 has length 1, functional dimension 1. In a bounded exact sequence, dimensions add; a total dimension 1 allows exactly one constituent with nonzero functional space. | Pass; bounded-exactness use repaired. |
| 5.3 A1 split integral | k=1 singleton integration with mass 1 sends unit vector value 1 to 1. | Pass; retain. |
| 5.3 A2 restriction | That irreducible line has one nonzero subrepresentation, and the restricted functional still has value 1. | Pass; retain. |
| 5.3 A3 surjection | Map from the unit line with image value 1 spans the one-dimensional target; zero map has image dimension 0. | Pass; retain. |
| 5.3 A4 twist | Exponent 1 at k=2,c=3,l=1 sends norm 1/2 to 1/2, not 1. | Pass; retain. |
| 5.4 A1 embedding kernel | GSpin₂ kernel has distinguished-center dimension 1, versus full-center dimension 2; Sp/SO kernel is trivial. | Pass; retain. |
| 5.4 A2 character transport | Trace 1/4 gives ψ=i and transported ψ⁻¹=−i. | Pass; retain. |
| 5.4 A3 graph in Levi | At g=1 the conjugated graph element is δ·1·δ⁻¹=1 with off-Levi coordinates 0; δ alone need not have those coordinates 0. | Pass boundary control; retain. |
| 5.4 A4 simultaneous conjugation | Coordinate swap sends diag(3,1/3) to diag(1/3,3); determinant remains 1 and pushed-forward volume multiplier is 1. | Pass; retain. |
| 5.5 A1 covariance | At s=1/2 norm twist=1; true modulus 9 contributes half-modulus 3. | Pass; retain. |
| 5.5 A2 common carrier | Compact vector value 2 at identity remains 2 in fibers s=0,1. | Pass; retain. |
| 5.5 A3 polynomial generation | Standard section×(1+2⁻ˢ) has value 2 at s=0; ×(1−2⁻ˢ)⁻¹ instead has a pole. | Pass; retain. |
| 5.5 A4 extension | Compact zero extends to 0; compact unit gives value 3 at the preceding modulus-9 Levi. | Pass; retain. |
| 5.5 A5 determination iff | Equal compact values extend equally; unit and doubled compact values give extensions in ratio 2. | Both directions pass; retain. |
| 6.1 A1 multilinearity | Three input scalars 2,3,4 give multiplier 24. | Pass; retain. |
| 6.1 A2 central descent | Central multipliers 3 and 1/3 give 1; dropping the reciprocal gives 3. | Pass; retain. |
| 6.1 A3 measures | Inner Haar×2, outer Haar×4 give integral multiplier 8. | Pass; retain. |
| 6.1 A4 transport | Vector×3, dual×1/3 give matrix-coefficient multiplier 1. | Pass; retain. |
| 6.4 A1 target | 1/4→3/4→1/4 and τ→χ_π⁻¹τ∨→τ, since χ_π⁻¹(χ_π⁻¹τ∨)∨=τ. | Pass; retain. |
| 6.4 A2 normalization | Functional values 3 before and after M* match; replacing M* by 2M* gives 6 and fails. | Pass; retain. |
| 6.4 A3 scalar | Values λ=3 and transformed raw value=4 force C=3/4. | Pass; retain. |
| 6.4 A4 uniqueness | a·4=b·4=3 forces a=b=3/4; zero functional gives 0=0 and would determine neither. | Pass; retain. |
| 6.4 A5 naturality | Transport map×3 and functional×1/3 preserve comparison value 3. | Pass; retain. |
| 6.5 A1 identity | At nonzero regular Z normalized to 1, doubling the section doubles both sides; at zero section both sides are 0. | Pass; retain. |
| 6.5 A2 uniqueness | γ·1=γ′·1 gives γ=γ′; testing only Z=0 would yield no scalar determination. | Pass; retain. |
| 6.5 A3 tails | q=2,s=2 gives Sp₀ gamma −3/4; SO₀/SO₁ tails give 1. | Pass; retain. |
| 6.5 A4 isomorphisms | Vector/dual scalars 3,1/3 preserve the defining functional ratio with multiplier 1. | Pass; retain. |
| 6.7 A1 reciprocal | X=1/4,P=1−2X gives P=1/2,L=2. | Pass; retain. |
| 6.7 A2 product | Two norm exponents ±1/4 give L(s+1/4)L(s−1/4); empty Sp tail supplies one L(s,τ), not 1. | Pass; retain. |
| 6.7 A3 epsilon | For regular functional values γ=2,L=3,Ldual=4, ε=3/2 and ε·4/3=2. | Pass; retain. |
| 6.7 A4 transport | Normalized P has constant 1 in both realizations; ×2 instead has constant 2 and fails normalization. | Pass; retain. |
| 7.1 A1 integral | k=2,c=1,s=1/2 gives determinant exponent 0; coefficient×2 and model×4 give multiplier 8. | Pass; retain. |
| 7.1 A2 convolution | A compact convolution test of total mass 1 preserves constant value 1; mass 3 yields value 3 in the same linear span. | Pass boundary control; retain. |
| 7.1 A3 limiting families | k=1,c=2 gives exponent s+1/2; c=1,k=2 gives s−1/2. Uncut k=c=1 requires positive and negative Re(s) simultaneously. | Pass; retain. |
| 7.1 A4 transport | Paired realization scalars 3,1/3 give integral multiplier 1. | Pass; retain. |
| 7.3 A1 entire quotients | Divide {t⁻¹,t⁻²} by t⁻² to get {t,1}. | Pass; retain. |
| 7.3 A2 attainment | At t=0 those two quotients give 0,1; exactly the second detects maximal order. | Pass; retain. |
| 7.3 A3 defect | Product divisor t⁻² and target divisor t⁻¹ give defect t, with value 0 at the origin. | Pass; retain. |
| 7.3 A4 representative | exp(s) has order 0 everywhere, whereas multiplying by t changes the order at 0 by 1. | Both directions pass; retain. |
| 8.1 A1 series | Section 0 gives all summands 0 and sum 0; ×2 doubles each summand. | Pass; retain. |
| 8.1 A2 local datum | c=1 gives ρ₁=τ; s_G=1/2 gives determinant exponent s_E=0. | Pass; retain. |
| 8.1 A3 shift | s_G=5/4 gives s_E=3/4; omitting the shift gives the wrong 5/4. | Pass; retain. |
| 8.1 A4 equivariance | Section scalar 2 gives 2E; two translations by g,h give translation by gh in every summand. | Pass; retain. |
| 9.1 A1 open orbit | k=1 inner U is trivial; SO₂,q=2,s=1 yields unfolded local integral 3. | Pass; retain. |
| 9.1 A2 Euler identity | b=4/3,Z=3 gives L=4; omitting b gives 3. | Pass; retain. |
| 9.1 A3 measure | One local measure×3 multiplies the global factorization and that local factor by 3. | Pass; retain. |
| 9.1 A4 trilinearity | Three scalars 2,3,4 give multiplier 24. | Pass; retain. |
| 9.2 A1 completion | Partial value 3 and correction 4 give total 12. | Pass; retain. |
| 9.2 A2 independence | Moving factor 2 gives (3/2)·8=12, still 12. | Pass; retain. |
| 9.2 A3 additive character | Rational b=2 has norm product 1; an idele with only real component 2 has norm 2. | Pass; retain. |
| 9.2 A4 uniqueness | Two agreeing convergent germs have difference 0; adding constant 1 changes that difference to 1 already on the initial region. | Pass; retain. |
| 10.1 A1 good match | Sp₂ identity Satake class has standard polynomial (1−T)³ on both sides. | Pass; retain. |
| 10.1 A2 infinity | For dual-torus exponents (u,0,−u), standard infinitesimal data are that same ordered multiset; u=1 gives (1,0,−1), differing from (0,0,0). | Pass control; retain. |
| 10.1 A3 isomorphism | Permuting diag(2,1,1/2) keeps degree 3, trace 7/2 and determinant 1. | Pass; retain. |
| 10.1 A4 witness | S={v₁,v₂} allows 2 finite exceptions; adding one infinite infinitesimal-character mismatch violates the separate infinite requirement. | Pass; retain. |
| 10.2 A1 tests | Trivial GL₂ and Steinberg have the same support and test gammas; their ordinary Whittaker dimensions 0,1 distinguish their isomorphism classes. | Pass; retain. |
| 10.2 A2 multiplicativity | Matching two test factors a,b yields matching product ab; omitting b leaves one unknown factor. | Pass; retain. |
| 10.2 A3 support | Shared support {ν^(1/2),ν^(−1/2)} gives cancellation (1−x)/(1−1/x)=−x. Rank N=1 would give zero lower-rank tests. | Pass; N≥2 converse retained. |
| 10.2 A4 transport | Paired scalars 3,1/3 give factor multiplier 1. | Pass; retain. |

### Supplier-contract controls

| Statement | Instances and computed values | Result; change |
|---|---|---|
| hermitian-unitary-groups | Rank 0 gives U=1, GU=Gₘ; distinct multipliers 1,4 act identically on the zero vector space. | Compatible; retain explicit multipliers. |
| gspin-group-schemes | Hyperbolic Q(x,y)=xy has Q(1,1)=1, a represented unit. In dimension 2 distinguished center dimension is 1 versus full-center dimension 2. | Compatible; retain c≥2. |
| classical-support-quotient | Rank-one GL-supported induction has exponents a,−a; Weyl reflection interchanges them and preserves their unordered pair. | Compatible; retain quotient hypothesis. |
| rectangular-orbit-support | Highest derivatives 2,2 reach rank 0 from 4; terminal line dual has dimension 1. Generic GL₄ first highest derivative 4 fails the stipulated order 2. | Repaired. |
| standard-archimedean-transfer | Sp₂ standard degree is 3 and determinant 1; odd orthogonal SO₃ standard degree is 2. | Compatible; retain. |
| opposite-unipotent-estimate | SL₂ tail at Re(s)=0 is abs(x)⁻¹, divergent; at Re(s)=1/2 it is abs(x)⁻², integrable. | Compatible; retain open chamber. |
| real-chevalley-contragredient | On ℝ×, C(x)=x⁻¹ takes abs(x) to abs(x)⁻¹; identity C instead leaves abs(x). | Compatible; retain Cartan inversion. |
| prescribed-classical-supercuspidal-globalization | Ω_v₀=ω_(σᵘ) gives central ratio 1; a proposed Ω_v₀=−ω_(σᵘ) at a central element would give −1 and cannot globalize that local component. A norm twist u followed by −u has exponent 0. | Repaired; compatible Ω required. |
| controlled-gl-test-globalization | T={v₁}; central character unramified at v₁ has unit restriction 1, as does an unramified test there. At common-good auxiliary w, §6.8 compares arbitrary generic tests; uncontrolled factor count away from v₀=0. | Repaired; extra ramification located explicitly. |
| archimedean-wavefront-whittaker | χ∘det on GL₂ has zero-orbit support (1,1), generalized functional dimension 1 and regular-orbit functional dimension 0. | Compatible; retain. |
| archimedean-induced-wavefront | Two GL₁ character orbits (1),(1) induce to orbit (2), while a GL₂ determinant character has orbit (1,1), not (2). | Compatible; induction/constituents distinguished. |
| archimedean-derivative-models | k=1,c=2 determinant character has successive order-one pre-derivatives and terminal line dimension 1; regular GL₂ top order is 2. | Compatible; retain highest-order hypothesis. |
| archimedean-degenerate-derivative | k=1 sends χ∘det on GL_c to χ∘det on GL_(c−1); c=1 terminates at the one-dimensional GL₀ space. | Compatible; retain. |
| archimedean-whittaker-exactness | In bounded category for O=(2,2), prefixes 2,4 fit; orbit (4) has prefix 4>2. For two copies of a one-dimensional model functional, exact split sequence gives dimensions 1,2,1 in reverse order. | Repaired; continuous inverse-character dual convention explicit. |
| eisenstein-pole-cuspidal-detection | c=1 constant term is f+M(s)f; regular f plus a t⁻¹ intertwiner contribution has pole order −1, unchanged by f. | Compatible; retain hypotheses on support. |
| speh-cusp-normalized-intertwiner | c′=1 gives region Re(s)>0 and normalizing ratio L(2s+1)/L(2s); inverse ratio belongs to the raw operator. | Compatible; retain. |
| twisted-square-normalizers | τ=χ=1 on GL₁ gives Sym² factor ζ^S with pole at 1 and fails duality exclusion; exterior-square factor is 1. Ramified χ has some unit value ≠1, excluding every norm twist. | Repaired. |
| hermitian-residual-support | Rank-one constant residue has support exponent ρ; its Hermitian dual exponent −ρ lies in the same Weyl orbit {ρ,−ρ}. | Compatible; retain. |
| automorphic-constituent-support | Cuspidal π uses P=G,λ=0; SL₂ constant uses Borel exponent ρ in the positive chamber. | Compatible; retain. |
| gamma-supercuspidal-support | GL₂ trivial and Steinberg yield the same support. N=1 gives empty test ranks, so distinct GL₁ characters would pass vacuously if N≥2 were dropped. | Compatible; retain lower bound. |
| nongeneric-pair-epsilon-character-change | N=k=1 gives ω_Π(b)ω_τ(b)abs(b)^(s−1/2). Trivial GL₂ support ν^(±1/2) gives norm exponent 2s−1 and central product 1. | Compatible; retain. |

## Maintainer consequences

The old slug `controlled-supercuspidal-globalization` is replaced by `prescribed-classical-supercuspidal-globalization` and `controlled-gl-test-globalization`, both assigned to AutomorphicFormsOnReductiveGroups §§2.5–2.7 and 4.2. Other repaired slugs are unchanged. Supplier implementation remains work of those named roadmaps; these refinements do not claim their future theorems exist now. There are no changed Lean declaration names for another roadmap to update.

Consumers of Layer 4 must use the new dual labels and χ₀⁻¹ opposite twist, and the fiber I_EHLS(χ_u⁻¹,t−n/2); its standard L-character in this package's inverse-character normalization is χ_u. Consumers of the unitary inverse intertwiner must use (χ^c)⁻¹. No consumer folder was edited. The immutable legacy G1–G6 records remain as directed; their administrative treatment is outside these seven findings.

No new unread primary proof is presented as certified. Analytic construction, distribution vanishing, the specialized theta comparison and the general rational Cauchy maps remain mathematical targets, with the stated hypotheses and sources. The computations above test their normalizations and boundary cases; independent review remains necessary.
