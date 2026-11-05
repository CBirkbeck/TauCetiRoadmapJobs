# Repair report: GeometryOfNumbersAndQuadraticArithmeticPartII

## F01 (P2) — applied

Lean completion theorem and its import → README-only §2.1 target, API and Checks. Deleted its README Lean-name claim. The CRT/cofinality argument remains valid for arbitrary Dedekind domains, including the empty product; the number-ring specialization is compatible with pinned `TauCeti.integralSemilocalEquiv`. Evidence: CDHHLMNNS-III-v4 line 2068 and lines 2087–2091.

## F02 (P2) — applied

Three coordinate definitions and the finite Witt-presentation theorem → prose definitions, API and Checks in §4.1; deleted their four Lean-name claims and unused Witt imports. The summary actually lists explicit Witt arithmetic among its endpoints, contrary to one review witness. Nevertheless, this 32-class local calculation is excluded from the acceptance file as a small computed value.

## F03 (P2) — applied

Field restriction/transfer theorem → supplier application in §5.3, retaining the ordered basis, functional, kernel, image and Checks. Deleted its Lean-name claim and unused transfer import. General exactness remains requested from QuadraticFormInvariants Layer 9 through gap:quadratic-extension-witt-exactness. The integral restriction kernel/cokernel remains a headline whose missing carrier is named in the module docstring.

## F04 (P2) — applied

Independent Eisenstein arithmetic proofs → pinned cyclotomic imports in Scope and Exact supplier contracts. Section 5.1 now targets the completion identification and retains its four arithmetic Checks. Deleted the rounding and norm-equation proof route. The five cited declarations exist at the pin; `ClassGroup.equivPic` supplies the PID-to-Picard comparison.

## F05 (P2) — applied

Repeated, inaccurate claims of discrimination → specific statements of what each Check tests. Repaired every repeated tail in §§0.3, 0.4, 2.1 and 3.1. Absolute-trace discrimination remains on the 𝔽₄ example; ramification-multiplicity discrimination remains on ℤ[i]. Recomputed the residue, trace, empty-product and two-image-quotient examples; their numerical values are unchanged.

## F06 (P2) — applied

Compound gap → gap:derived-localization-completion-square and gap:poincare-change-of-rings-criterion, both assigned to GeometryOfNumbersAndQuadraticArithmetic §6.8a. README contracts and §2.2 Needs agree with the plan. The first states bounded-torsion hypotheses; the second retains all five change-of-rings hypotheses, involution-compatible coefficients and saturated K₀ controls. Replaced the undefined source nickname with CDHHLMNNS-II-v5 and updated its manifest usage.

## F07 (P3) — applied

Number-field-only parity theorem → every Dedekind domain with fraction characteristic different from two, with canonical target indexed by its finite dyadic prime set. Removed §3.2 from Needs. Retained d=0,1,2,3 and Eisenstein Checks; added the DVR ℤ[t]_(2), whose residue 𝔽₂(t) is infinite and imperfect. Evidence: CDHHLMNNS-III-v4 lines 2099–2109 and the componentwise rank argument.

## F08 (P3) — applied

Misattributed decomposition locator → proof of Proposition 2.3.9 ii), p.45, CDHHLMNNS-III-v4 line 2068, and proof of Corollary 2.3.10, p.45, lines 2087–2091. The general CRT/cofinality proof remains in §2.1; the latter source passage supplies its number-field use rather than a separate general theorem.

## F09 (P3) — applied

Unrelated §2.3 locator → symmetrization norm from GeometryOfNumbersAndQuadraticArithmetic §6.8a, through HermitianKTheoryOfPoincareCategories §§3.4, 4.5 and 6.6. Section 0.1 gives the polar/half-diagonal identities directly. Its distinct L₀ identifications cite CDHHLMNNS-III-v4 line 1896 under Dedekind hypotheses and line 2050 for quadratic theory. The existing characteristic-two and nonfree-projective Checks remain.

## F10 (P3) — applied

Perfect-field parity attribution → KTheoryFiniteLocalFields §1.7, in its own contract. Sign periodicity → HermitianKTheoryOfPoincareCategories §1.6 `bordism_invariant_periodicity`, both in its contract and §2.4 Needs. Hilbert reciprocity → GlobalQuadraticForms §4.4, both in its contract and §5.2 Needs. Each destination was read in the admissible supplier copy.

## F11 (P3) — applied

Access-history wording → mathematical locator in §5.2: CDHHLMNNS-III-v4, Example 2.3.14, p.46, line 2159, with the proof using GlobalQuadraticForms §§8.1–8.3. No mathematical claim changes. A whole-file search found no other occurrence of that process narrative.

## Checks and signatures

- Required elaboration, from the pinned content checkout, on `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean`: **exit 0, empty output, no warnings**. Its only import is `import Mathlib`; no Tau Ceti object build was required.
- Before deletion, a single scratch file appended `#check @name` for all six actual declarations and elaborated successfully: **exit 0**, with precisely the three original admitted-theorem warnings. Compared every elaborated type with its README statement: the completion theorem retained the commutative Dedekind and nonzero-two hypotheses; the three coordinate definitions and presentation retained the invertible-two binder; restriction retained the field/algebra, finite-dimensionality, basis and two basis equations. No binder repair was needed. The supplied signature inventory's eight entries included two parser artifacts, not declarations.
- After deletion, a mechanical declaration scan found **zero declarations**. The final signature scratch file therefore contains no `#check @name` lines and also elaborated with **exit 0, empty output**. All six deleted names are absent from README and Suggested.lean. No new Lean names were introduced.
- The module docstring inventories the remaining headline theorems and their missing carriers. In particular, integral metabolic Witt groups, characteristic-two quadratic Witt groups, general anti-structure quadratic refinements, Poincaré categories and periodic L-spectra are not supplied by the pinned field Witt carrier. The carrier in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:218` explicitly requires a field and invertible two. Native quadratic maps have no perfect-polar or finite-projectivity hypothesis built into their structure (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:146,317`); native quadratic base change requires invertible two (`TensorProduct.lean:39,127`).
- The arithmetic scratch calculation completed with **exit 0**: all 32 Witt coordinate invariants are distinct; all 32 multiplication formulas hold; the annihilator has eight elements and the image four. It enumerated all 256 E₈ vectors and computed the transfer determinant using exact rational arithmetic. The computed values appear below.
- Dependency command with the specified configuration, package name, order and `--movable`: **exit 0**, with exact output:

```text
depcheck: 49 roadmaps, 559 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Citation resolution: **exit 0** against main `bfaaff1` and the 352-head index of 2026-10-25T05:45:13Z; no cross-roadmap citation or Lean name was found nowhere. The resolver did not inspect pinned Lake packages, so the native names were additionally opened in the local pins.
- JSON comparison with the initial plan: every top-level field except `gaps` is identical; the existing quadratic-extension gap is identical. Every gap has `slug`, `needs`, `supplier`, `section`, a matching README contract with identical needs, and a matching Needs use.
- No additional gate failures were supplied. Final whitespace, allowed-file and path checks are recorded below.

## Source and ownership verification

Read the main-branch GlobalQuadraticForms and QuadraticFormInvariants roadmaps as shape examples, and the main SchemeAndStackFoundations sections. Sources were read from the supplied legal cache; all seven cited works already have unique manifest keys. Wall-1973, Lam-2005 and Scharlau-1985 remain settled `uncertified` entries, cited only by locator. No source was renamed, reopened or requested, and no additional work needed fetching.

The central source passages read were CDHHLMNNS-III-v4 lines 1690–1704, 1789–1798, 1807–1870, 1881–1906, 1936–1965, 1976–2109, 2110–2207 and 2226–2243; CDHHLMNNS-II-v5 lines 5250–5277 and 5281–5318; Wall-1970 lines 104–169; CMM lines 1659–1674. They support the hypotheses and source distinctions used in the repairs. The ordinary/derived completion comparison and the coefficient criterion are separate inputs, not consequences assumed from the fracture target.

Cross-roadmap citations were checked by section and object in these admissible copies:

| Supplier | Copy and sections read |
| --- | --- |
| GeometryOfNumbersAndQuadraticArithmetic | New-roadmap head `465728d`; §§6.2–6.5, 6.8a, 6.9.1–6.9.3, 6.10a, 6.11 |
| HermitianKTheoryOfPoincareCategories | New-roadmap head `5a6365d`; §§1.6, 3.4, 4.5–4.6, 6.6, 7.9 |
| ArithmeticKTheory | New-roadmap head `76f1a28`; §§1.1–1.3, 2.2, 3.5 |
| KTheoryFiniteLocalFields | New-roadmap head `afe02e8`; §1.7 |
| GeneralAlgebraicKTheory | New-roadmap head `e0552fe`; §§11.3–11.4, 11.15 |
| StableHomotopyKTheory | New-roadmap head `00bfbf7`; §§5.5, 5.7–5.9 |
| QuadraticFormInvariants | Main; Layers 4, 6, 9, including the transfer boundary |
| GlobalQuadraticForms | Main; §4.4 and §§8.1–8.3 |
| SchemeAndStackFoundations | Main; §§0.14–0.15, 0.21; its revision request is not a dependency |
| IntegralLattices | Main milestone 1I, and Completed/IntegralLattices Layers 1–5; its revision requests are not dependencies |

The roadmap index search covered object descriptions, not just proposed names: Poincaré–Verdier and localization–completion squares, Scharlau exactness, Arf/absolute trace, local Witt coordinates, rank parity and Eisenstein arithmetic. Board-package searches used the same objects. Revision requests for existing roadmaps were distinguished from new roadmap suppliers; existing-roadmap contracts were checked on main. No new carrier or foundational theorem was assigned here. The two completion/criterion gaps retain the existing foundational owner; the quadratic-extension gap retains QuadraticFormInvariants Layer 9. Local arithmetic coordinates and the general dyadic obstruction remain this Part II's arithmetic specialization. No new fully qualified Lean declaration is assigned.

For F04, opened all five cyclotomic declarations in `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:126`, `PID.lean:34`, `Three.lean:50`, `Ideal.lean:291,311`, and `ClassGroup.equivPic` in `Mathlib/RingTheory/PicardGroup.lean:876`. Also checked the completion, full-polar, field-Witt, residue, transfer and classification contracts at their pinned definitions. The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` from the content manifest.

## Adversarial mathematics pass

Values involving future Witt/L-theory carriers are mathematical computations using the specified supplier contracts, not claims of Lean proofs. Finite enumerations use the normalized Hilbert formula, square classes and local classification. In comparing Witt classes of different dimensions, representatives are first stabilized to equal dimension by hyperbolic planes and both determinant and Hasse sign are recomputed.

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: perfect polar and rank zero | ℤ line 2xy; zero module; 𝔽₂ line x² | Adjoint 2 has cokernel ℤ/2, hence fails perfection; 0→0 is invertible; polar of x² is 0 on a nonzero line | Exclusions and zero convention agree | None |
| Conventions: metabolic versus hyperbolic | 𝔽₂ symmetric matrix [[0,1],[1,1]]; quadratic xy | First coordinate is its own perpendicular and has value 0; the pairing is not alternating, whereas polar(xy)=[[0,1],[1,0]] | Direct-summand Lagrangians, not hyperbolic isometry alone, give the quotient | None |
| Conventions: zero ring and field | R=0; R=ℚ | Only rank-zero module over 0, hence both Witt groups 0; ℚ has no nonzero primes and C=0 | Zero and empty families agree | None |
| Conventions: suspension and sign | ℤ, negative-sign degrees 2 and 0 | Positive degrees 0 and −2 give ℤ and 0; replacing subtraction by the wrong unperiodized indexing would miss the suspension convention | Agrees with supplier periodicity | F10 citation |
| Conventions: difference boundary | Identity maps, pairs (1,1),(2,1) | Differences 0 and 1; sums 2 and 3 | Difference is the correct boundary | None |
| Conventions: tensor identification versus half-diagonal | ℚ, b(x,y)=xy | Unital quadratic polynomial x² has polar 2xy; inverse-polar polynomial x²/2 has polar xy; scaling factor ⟨2⟩ | Two comparisons remain distinct | F09 explanation |
| Conventions: signed determinant | Rank 0; line ⟨1⟩; hyperbolic diagonal ⟨1,−1⟩ | Plain determinants 1,1,−1; signed determinants 1,1,1 | Parity exponent is correct | None |
| Tau Ceti Hilbert normalization | (−1,−1), (2,5), (−1,2) | Exponents 1,1,0 modulo two give −1,−1,+1 | Matches all later calculations | None |
| §0.1 comparison definition | ℚ half-diagonal; 𝔽₂ Arf-one plane | Polar(x²/2)(1,1)=1; Arf-one polar is alternating and Witt-zero, although quadratic class is 1 | Construction is not an unconditional isomorphism | F09 |
| §0.1 orthogonal sums, isometries and scalar extension | Two copies of xy; 𝔽₂→𝔽₄ | Polar matrix is H⊕H both before and after extension; swapping summands preserves it; 0 maps to 0 | Functorial and additive laws agree | None |
| §0.1 half-diagonal inverse | ℚ, b=xy; q=x² | polar(b(x,x)/2)=xy; polar(q)(x,x)/2=(2x²)/2=x² | Both inverse identities hold | F09 |
| §0.1 projective carrier | ℤ[√−5], I=(2,1+√−5) | I²=2R, I∨=I/2, and x↦x/2 identifies I with I∨; no free basis exists | Carrier includes the required rank-one projective | None |
| §0.2 symmetric injection and characteristic-two zero map | ℤ unit line; 𝔽₂[t] polar(xy); R=K | Signatures 1→1; hyperbolic polar gives 0→0 while the unit line has parity 1; field map is identity | Kernel and zero-map claims agree | None |
| §0.3 second residue definition | ℤ_(2), coefficients 3,2,4 | Valuations 0,1,2 give residues 0,⟨1⟩,0 | Rejects coefficient reduction and mere divisibility | F05 tails |
| §0.3 retained unit square class | ℤ_(3), coefficient 6 | Removing π=3 leaves 2; nonzero square classes in 𝔽₃ are represented by 1,2, so residue is ⟨2⟩ | Nonsquare coefficient survives | F05 tail |
| §0.3 square invariance and finite support | ⟨2⟩ versus ⟨8⟩ over ℚ; ⟨6⟩ | Valuations 1 and 3 both give ⟨1⟩ at two; ⟨6⟩ has support only at 2,3 with residues ⟨1⟩,⟨2⟩ | Parity and direct-sum support agree | None |
| §0.3 uniformizer coordinate | ℤ_(5), ⟨5⟩, π=5 and π′=10 | Unit coordinates 1 and 1/2=3 mod five; ⟨3⟩=⟨2⁻¹⟩⟨1⟩ | Line-valued boundary is fixed | None |
| §0.3 ramified comparison | ℤ→ℤ[i], 2=−i(1+i)² | Generic image has even valuation and residue 0; residue-field extension alone sends 1→1 | Linking comparison is essential | F05 tail |
| §0.4 Arf definition and F₂ normalization | xy; x²+xy+y²; zero form | Arf sums 0,1,0; anisotropic-plane values at the three nonzero vectors are 1,1,1 | Hyperbolic, anisotropic and zero cases separate | F05 tails |
| §0.4 perfect-polar restriction | 𝔽₂ line x²; plane xy | Polar ranks 0 and 2; determinants 0 and 1 | Nonzero quadratic map alone is insufficient | F05 tail |
| §0.4 absolute trace and extension law | 𝔽₂→𝔽₄; coefficients 1,ζ | Tr(1)=1+1=0; Tr(ζ)=ζ+ζ²=1; degree 2 sends Arf 1→0, degree 1 sends 1→1 | Trace, not raw sum, gives the extension map | None |
| §0.4 basis independence | q=xy over 𝔽₄, standard basis and ((1,1),(ζ,ζ²)) | Second basis has polar 1 and q-values 1,1; raw sums 0 and 1, absolute traces 0 and 0 | Raw basis independence fails; traced law holds | None |
| §0.4 addition and metabolic criterion | Two Arf-one planes; 𝔽₄ plane x²+xy+y² | 1+1=0 and diagonal subspace is a Lagrangian; q(ζ,1)=ζ²+ζ+1=0 | Both directions of the invariant test agree | None |
| §1.1 characteristic-two global table | 𝔽₂[t], 𝔽₂(t), 𝔽₂[t,t⁻¹] | Pic/2=0 in all three, hence odd groups 0; ∂_(t)⟨t⟩=1 in the first ring, with no t-prime in the latter two | Two-periodic and localization claims agree | None |
| §1.2 DVR residues | ℤ_(2), ℤ_(3), 𝔽₂[[t]] | Residues of ⟨2⟩,⟨3⟩,⟨t⟩ have parity 1; degree-one groups are ℤ/2,0,0 respectively | Distinguishes fraction and residue characteristics | None |
| §1.2 global residue and Picard normalization | ℤ; 𝔽₃[t]; principal divisor (3) | Pic/2=0; d=1 and 0 give degree-one groups ℤ/2 and 0; [(3)]=0 and its inverse is also 0 | Matches supplied cokernel maps | None |
| §2.1 completion definition and CRT | ℤ; ℤ[i]; exponent m=1,2 | ℤ quotients ℤ/2,ℤ/4; Gaussian quotients use powers (1+i)²,(1+i)⁴ with one factor, not two | Cofinal exponents retain ramification | F01, F08; F05 tails |
| §2.1 empty product | ℤ[1/2], ℚ, ℤ_(3) | (2)=R; every R/(2^m)=0 and C=0; empty product has one element | Unit-ideal completion is the zero ring | F05 tail |
| §2.1 residue degree and projections | ℤ[ζ₃]; product of two completions | One factor with residue cardinality 4; tuples (0,0),(0,1) have first projections 0,0 and second projections 0,1 | Residue degree is not factor count; all projections are necessary | F04, F05 |
| gap:derived-localization-completion-square | (R,ℓ)=(ℤ,1),(ℤ/4,2),(ℤ,2) | Squares are R→0 over R→0; R→R over 0→0; ℤ→ℤ₂ over ℤ[1/2]→ℚ₂; in each case the indicated upper left is the derived pullback | Separate completion input is consistent, including bounded torsion | F06 split |
| gap:poincare-change-of-rings-criterion | f=id on ℤ, M=N=ℤ, S powers of 2, m=1 | Coefficient map is id; cofiber map ℤ/2→ℤ/2 is id; Tate boundary 0→ℤ/2 is zero; identity preserves the control 2ℤ | Five hypotheses include the coefficient and control data | F06 split |
| §2.2 fracture and K₀ control | ℓ=1; ℤ/4 at ℓ=2; even-Euler subcategory of Dᵇ(k) | Controlled bottom category is Perf(R) at ℓ=1; localized categories are zero for ℤ/4; Euler classes 2 and 1 lie inside and outside 2ℤ | Empty localization and density do not erase controls | F06 explicit contracts |
| §2.3 anti-structure definition | Commutative α=id,u=1; quadratic representative φ(x,y)=x₁y₂ | Tφ(x,y)=x₂y₁; (φ+Tφ) has matrix [[0,1],[1,0]], determinant −1 | Bilinearization is the full polar | None |
| §2.3 quadratic lifting | ℤ₂ planes xy and x²+xy+y²; 𝔽₂[ε]/(ε²); J=0 | Residue Arf values 0 and 1 prevent an isometry; error ε is sent to ε²=0; J=0 returns the original isometry | Prescribed residue isometry and completeness matter | None |
| §2.3 symmetric negative control | ℤ₂ lines ⟨1⟩,⟨3⟩ | Equal residue coefficient 1, but ratio 3 mod eight is not 1, hence nonsquare | Symmetric lifting would be false | None |
| §2.4 complete rigidity | ℤ₂/(2); dual numbers/(ε); J=R | Quadratic residues ℤ/2,0,ℤ/2,0 on both sides; dual-number reduction has those same groups; separated J=R forces R=0 | General signs and integral rigidity remain | F10 supplier citation |
| §2.4 symmetric negative control | ℤ₂→𝔽₂ | Symmetric Witt orders 16→2, not an isomorphism | Does not assert symmetric rigidity | None |
| §2.5 henselian rigidity | (ℤ₂,(2)), (𝔽₂[ε]/(ε²),(ε)), J=0 | Quadratic tables on reductions agree; ε²=0, but 2^n≠0 for every n in ℤ₂; J=0 gives identity | Nilpotence is not required | None |
| §3.1 quotient definition | D=ℤ/4, global image 2D, quadratic image 0 or D | Sum-quotient orders 2 and 1; intersection-quotient order in the first case is 4 | Uses the sum of images | F05 tails |
| §3.1 universal property and zero representatives | D=ℤ/4, quotient by 2D | Representatives 0,2 map to 0; 1,3 map to 1; parity kills 2D and factors uniquely to ℤ/2, while id_D does not | Both directions of factoring and zero-class criteria agree | None |
| §3.1 either image can kill the quotient | D=ℤ/4, image pairs (D,0),(0,D),(0,0) | Quotient orders 1,1,4 | Each surjectivity Check has its actual scope | F05 tails |
| §3.1 quotient functoriality | Commuting quotient diagram, doubling D=ℤ/4 with subgroup 2D | 1↦2↦0 and [1]↦[2]=0; identity sends [1]↦[1] | Maps arise from the comparison diagram, not unrelated groups | None |
| §3.2 number-field table and finiteness | ℤ, ℤ[1/2], ℤ[ζ₃] | d=1,0,1; degree-two orders 2,1,2; A-orders 1,1,4 | Finite two-primary quotients agree; no splitting chosen | None |
| §3.3 parity map definition | A quotient from d=2 components | Completed quadratic ranks give (0,0); global unit line gives (1,1); single-factor unit gives (1,0) | Map descends and is onto the diagonal quotient | F07 generality |
| §3.3 parity quotient cardinalities | d=0,1,2,3 | Vector counts 1,2,4,8; diagonal-image counts 1,2,2,2; quotient counts 1,1,2,4 | Exponent d−1 is used only when d≥1 | F07 boundary scope |
| §3.3 non-number-field and imperfect residue | R=ℤ[t]_(2); residue t | I={(2)}, quotient order 1; t is not a square in 𝔽₂(t), since v_t(t)=1 | No finite or perfect residue hypothesis is needed | F07 new Check |
| §3.4 nondyadic localization | ℤ with S empty, {(3)}, {(2)} | Empty term 0; at 3 both completions are ℤ₂; at 2 the proposed sequence would force ℤ/2=0 in degree two | Dyadic negative control excludes the false extension | None |
| §4.1 coordinate definition and uniqueness | All (a,b,e)∈ℤ/8×ℤ/2×ℤ/2 | 32 distinct stabilized parity/determinant/Hasse triples; (0,0,0),(1,0,0),(0,1,0) give 0,u,v | Local arithmetic statement stays in README | F02 |
| §4.1 cyclic orders and wraparound | 8u,4u,2v,2c; coefficients 8,2 | 8u=0,4u≠0,2v=2c=0; quotient coefficients 8 mod8 and 2 mod2 both give 0 | Orders and coordinate reductions agree | F02 README-only definitions |
| §4.1 multiplication, ideal and annihilator | All 32 coordinates; c·u,c·v,c² | c,4u,0; 32/32 formulas agree; image {0,c,4u,c+4u} has four elements; annihilator a even,b=0 has eight | Incorrect annihilator generator v is excluded | None |
| §4.1 alternative binary classes | c=⟨1,3⟩, ⟨1,−5⟩, ⟨1,−3⟩ | −5/3≡1 mod8; first two classes agree; ⟨1,−3⟩=2u+c and its product with c is 0 | Alternative generator is valid | None |
| §4.2 E₈ half-norm | Simple root; adjacent roots; all 256 vectors | q(e_i)=1; q(e_i+e_j)=1 and polar=−1; Gram determinant 1; 136 zeros and 120 ones give Arf 0 | Half-norm, not diagonal reduction, is required | None |
| §4.2 supplied integer invariants | E₈ and bilinear unit line | Signatures 8 and 1; quadratic E₈ invariant 8/8=1; symmetrization sends 1→8; unit line would require 1/2 integrally | Normalizations match suppliers | None |
| §4.3 integral kernel and polar image | u,c,v and polar of x²+xy+y² | Residues 0,0,1; kernel order 16; polar diagonal ⟨2,3/2⟩=c+4u≠c; u and c+4u span all 16 classes | A(ℤ)=0 | None |
| §4.3 residue section | ⟨−1,2⟩=−v | −v=v since 2v=0; residue 1; double is 0 | Section has the required order | None |
| §5.1 ring/completion consequence | t²+t+1 modulo 2; order of 2 modulo 3 | Polynomial values 1,1; 2²≡1 but 2≠1 mod3, so f=2; e=1 and [E:ℚ₂]=2, residue cardinality 4 | Imported arithmetic determines O | F04 |
| §5.1 units and inertness negative control | Norm a²−ab+b²=1; ℚ(√−7) | Six solutions (±1,0),(0,±1),(1,1),(−1,−1), three unit squares; t²+t+2 reduces to t(t+1), splitting an unramified prime | Keeps units and separate inertness Check | F04 |
| §5.2 Eisenstein symmetric group | 0,u,2u,3u,4u | Parity/signed-determinant pairs (0,1),(1,1),(0,−1),(1,−1); −1 nonsquare in E; 4u hyperbolic after even local degree | Order four and completed injection agree | F10, F11 locators |
| gap:quadratic-extension-witt-exactness and §5.3 field instance | a=−3; x=c,4u,u; λ(1)=0,λ(s)=1 | c,4u restrict to 0; u has order four after restriction; transfer of ⟨1⟩_E is the hyperbolic matrix [[0,1],[1,0]], hence 0 | Exactness application is consistent; remains a supplier gap | F03 README-only instance |
| §5.3 integral restriction | Symmetric residue 𝔽₂→𝔽₄; integral source | Rank parity 1→1; source order 16, kernel order 4, image order 4, cokernel order 8 | Integral kernel/cokernel agrees with field comparison | None |
| §5.4 zero quadratic base change | 𝔽₂ Arf-one plane over 𝔽₄ | Tr(1)=0 and q(ζ,1)=0; Wq(ℤ₂)→Wq(O) sends 1→0 | Symmetric residue identity cannot replace this map | None |
| §5.4 additional local image | Polar [[2,1],[1,2ζ]]; comparison with 2u | Signed determinant 1−4ζ has norm 21≡5 mod8; signed determinant −1 of 2u has norm 1 | t≠0, t≠2u, so the two subgroups intersect in 0 | None |
| §5.5 transferred quadratic image | Displayed four-by-four matrix | Determinant 21; diagonal ⟨1,−1,4,−21/4⟩ leaves ⟨1,−21⟩=c since −7≡1 mod8 | Transfer sends t to c, not c+4u | None |
| §5.5 final obstruction and L-tables | Eisenstein ring, d=1 and Pic=0 | A=⟨2u,c⟩/⟨c⟩=ℤ/4; degree-zero intersection 0; symmetric table ℤ/4,ℤ/2,0,0; quadratic table 0,0,ℤ/2,ℤ/4 | Matches all worked examples | None |
| Worked-example assembly | ℤ, ℤ[1/2], Eisenstein ring | A-orders 1,1,4 and degree-two orders 2,1,2; ℤ quadratic generator has local Arf 0 despite global symmetric image 8 | No example contradicts its table or normalization | None |

## Source issues already reflected in the package

The review's three source-issue claims were also verified rather than adopted as instructions. No new correction is necessary for these passages:

- CDHHLMNNS-III-v4 lines 2160–2163 and 2202–2205 use the wrong quadratic residue arrow. Sections 0.4, 5.4, 5.5 and the worked-example table already use its zero value and the resulting quadratic groups 0,0,ℤ/2,ℤ/4. The independent trace computation above confirms these values.
- CDHHLMNNS-III-v4 lines 2180–2182 give the wrong annihilator generator. Section 4.1 already has ann(c)=⟨2u,c⟩, equivalently ⟨2u,⟨1,−3⟩⟩. The independent 32-coordinate calculation gives cv=4u≠0 and exactly eight annihilator elements.
- CDHHLMNNS-III-v4 lines 2156–2157 infer inertness from unramifiedness. Section 5.1 already checks irreducibility and retains ℚ(√−7) as the split negative control. Its proof inputs now come from pinned cyclotomic arithmetic.

## Maintainer consequences

The deleted Lean names are `dyadicCompletionDecomposition`, `q2V`, `q2C`, `q2Coordinates`, `q2WittRingPresentation` and `eisensteinFieldWittExactness`, all in this package's namespace. Their mathematics remains in README prose. Nothing in another roadmap was renamed or edited.

The old gap:derived-completion-poincare-criterion is replaced by two separate slugs; consumers of that planning identifier should use the appropriate new contract. Both remain requests to the existing foundational supplier, not assertions that its files now supply them. Gap:quadratic-extension-witt-exactness is unchanged. No merge-order change is requested, and no later roadmap becomes a supplier.

## Final scope checks

`git diff --check` completed with exit 0 and no output. The structural audit completed with exit 0: three matched gap contracts, unchanged non-gap plan data, zero Lean declarations, eleven individually headed findings of at most 60 words each, seven unique source entries, and no machine paths. A rational basis computation also gave the exact transfer diagonal (1,−1,4,−21/4), with every off-diagonal entry zero.

Only README.md, Suggested.lean, sources.toml, the top-level gaps list in design/plan.json, and this required report changed, all within `packages/GeometryOfNumbersAndQuadraticArithmeticPartII`. Metadata, other packages, tooling, merge order and content checkout files were not edited. No commit or network write was made; all elaborations finished.
