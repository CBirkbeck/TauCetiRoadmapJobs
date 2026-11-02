# Review of GeometryOfNumbersAndQuadraticArithmeticPartII (pull request #1691 at 8b6e704)
**Verdict:** accepted

:robot: Independent AI incremental re-review of 51 changed lines since d851306. No new findings. Acceptance is conditional on the four declared supplier contracts and means ready for a human's final approval.

## Previous findings

- R01 — repaired: `Suggested.lean:83–103` states `arf_scalar_extension` on native tensor products; `README.md:164–193` gives its construction, trace law and discriminating Checks. The obsolete “not statable” entry is gone. No new defect was found.

## Verified sound

**Scope and gate.** Reviewed all changed passages in `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md` and `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean`, and the uses of §0.4 in §§3.2, 4.2–4.3 and 5.4–5.5. Unchanged mathematical checks are carried from the [previous review][previous], explicitly marked below. This is not a second full source audit.

Confirmed HEAD `8b6e704bb5a00f23de86e4767122835a6bb86e80`; both the outside-folder diff and worktree status are empty. Read the repository's Writing a roadmap checklist and CONTRIBUTING, and main's Completed/IntegralLattices and QuadraticFormInvariants for shape and ownership. The worker's gate, including its build, passed. Independently reran the gate: every emitted counter was zero, ending in OK. The rerun did not emit a build counter, so also ran the targeted build independently: success, 8984 jobs, four expected `sorry` warnings.

Direct `lake env lean` elaboration succeeded with only `sorry` warnings at lines 53, 83, 111 and 124. A scratch copy containing `#check @name` for all four declarations also elaborated. Comparing those types with the README found zero dropped binders: finite fields, characteristic two, compatible algebra structures, finite-dimensional space, basis and all three polar identities remain in the new signature. The four theorem goals each resisted `simp`, `rfl` and `infer_instance` in a scratch probe requiring the tactic to close the goal. The pinned declarations inspected below provide no single lemma proving the new existential scalar-extension/Arf theorem. No padding, sorry'd data, stand-in carrier, extra import or option override was introduced.

The independent dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1544 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. All 23 target-level Needs lines were read. The citation resolver, against main fa41b37 and the supplied open-head index, found no unresolved roadmap citations or Lean names; its library disclaimer was addressed by opening the pinned sources directly.

**Why the repair is sound.** The polynomial in `README.md:168` is defined on the coordinates of `b.baseChange l`. On `1 ⊗ v` its value is the image of q(v), because the symplectic identities determine the cross terms. Its polar matrix is the same invertible block matrix over l. Agreement on every `1 ⊗ v`, rather than merely the basis vectors, determines a quadratic map by the pinned `baseChange_ext`. If a is the original Arf sum, the extended sum is ι(a); trace transitivity followed by the trace of a base-field scalar gives Tr(l/𝔽₂)(ι(a))=[l:k]·Tr(k/𝔽₂)(a). Finite fields ensure all the needed finite/free module instances. The existential statement asserts construction of an actual quadratic form; it does not assume the conclusion or quantify over an unconstrained stand-in. It permits n=0 and arbitrary finite extension degree.

**Pinned declarations freshly inspected.** Mathlib is pinned to `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti to `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. File paths in this table are relative to those libraries.

| File and line | Declaration or hypotheses inspected | Consequence |
| --- | --- | --- |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:146` | `QuadraticMap`, `QuadraticForm` | Homogeneity and a bilinear companion; perfectness and finite dimensionality are additional hypotheses, supplied here. |
| `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127` | `QuadraticForm.baseChange`, within the invertible-two section | This constructor is unavailable in characteristic two; the repair does not call it. |
| `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:158` | root `baseChange_ext` | Uniqueness on all `1 ⊗ v` has no invertible-two hypothesis. |
| `Mathlib/LinearAlgebra/TensorProduct/Basis.lean:63`, line 73 | `Module.Basis.baseChange`, `baseChange_apply` | The extended basis vectors are exactly `1 ⊗ b i`; no characteristic restriction. |
| `Mathlib/RingTheory/Trace/Defs.lean:71`, lines 110, 137 | `Algebra.trace`, `trace_algebraMap`, `trace_trace` | The trace law uses finite/free modules and the scalar tower, all available for the stated finite fields. |
| `TauCeti/LinearAlgebra/QuadraticForm/BaseChange.lean:50`, line 218 | standing invertible-two binder; `QuadraticForm.polar_baseChange_tmul` | This API also needs invertible two and does not already provide the characteristic-two result. |

Object searches of the pinned quadratic-form directories, the roadmap search service, main, board packages and supplied sibling checkouts found no competing general finite-characteristic-two extension/Arf theorem or duplicate fully qualified name. The new name occurs in this roadmap's copies only. The existing 𝔽₂ Arf classification remains owned by HermitianKTheoryOfPoincareCategories §7.9; this roadmap owns its stated extension to all finite characteristic-two fields. No ownership move or additional supplier is needed.

**Supplier citations re-resolved.** Existing roadmaps were read on main; new-roadmap suppliers were read with `roadmaps show`. These are the section witnesses, with paths relative to the roadmap repository. The repair adds only pinned Mathlib inputs to the existing dependency direction.

| Supplier README | Sections and line witnesses | Contract checked |
| --- | --- | --- |
| `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md` | §3.4, line 498; §7.9, line 1179; §§1.6,4.5–4.6,6.6, lines 304,600,627,1017 | Projective quadratic Witt carrier, 𝔽₂ Arf classification and field computations; supplied polar/surgery comparisons. The 𝔽₂ theorem does not state the new finite-extension trace law. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` | §§6.1a,6.2–6.5,6.8a–6.9,6.10a, lines 2252,2358,2446,2497,2574,2934,3071,3173 | Shared spectra, exact and derived forms, residue shift −1, localization/overrings, integer comparisons. |
| `TauCetiRoadmap/ArithmeticKTheory/README.md` | §§1.1–1.3,2.2,3.5, lines 515,558,600,736,1247 | Number-field localization and Picard inputs; inverse-ideal convention; Dedekind tables and actual completion square. |
| `TauCetiRoadmap/QuadraticFormInvariants/README.md` | Layers 4,6,9, lines 1338,1600,2797 | Native Witt theory in characteristic different from two, dyadic local classification and transfer. |
| `TauCetiRoadmap/GlobalQuadraticForms/README.md` | §4.4 and §§8.1–8.3, lines 443,875,892,901 | Hilbert product formula and number-field classification/injectivity, with the rank-zero qualification retained. |
| `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` | §1.7, line 300 | Symmetric rank-parity map on 𝔽₂→𝔽₄ is the identity; it is not quadratic Arf base change. |
| `Completed/IntegralLattices/README.md`; `TauCetiRoadmap/IntegralLattices/README.md` | Layer 5, line 327; milestones 1I,1L, lines 693,728 | E₈, half-norm and signature-divisibility inputs remain separate from the new finite-field extension law. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | §§0.12–0.15,0.21, lines 969,1032,1068,1090,1394 | Henselization, smooth lifting, Popescu and G-rings; the ideal-adic regularity extension remains a declared gap. |
| `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` | §§11.3–11.4,11.15, lines 2403,2426,2634 | Dense K₀-image criterion and localization; no K₀-surjectivity shortcut. |

The four gap slugs and their needs sentences still match `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/design/plan.json` and README lines 55,57,71,85: `derived-localization-completion-square`, `poincare-change-of-rings-criterion`, `quadratic-extension-witt-exactness`, `henselian-pair-completion-regular`. Each names its supplier and exact hypotheses. They are unchanged by the repair; the previous precision/minimality assessment carries forward. Acceptance remains conditional on these declared contracts, not on undeclared prerequisites.

**Source sample and affected consumers.** The changed §0.4 locator was reopened at CDHHLMNNS-III-v4 line 2072 and line 2095, Corollary 2.3.10, printed p.45: it supplies the finite characteristic-two Arf identification. The new extension law is explicitly derived from the polynomial and pinned trace theorems, rather than attributed verbatim to that corollary. Reopened Example 2.3.14, printed pp.46–47, CDHHLMNNS-III-v4 lines 2150–2205, for the affected §5.4 and §5.5 diagrams. Its quadratic identity arrow is contradicted by Tr(1)=0 for 𝔽₄/𝔽₂; the README's correction is preserved.

| Seeded target | Evidence retained or reopened this round |
| --- | --- |
| 0.1 Integral Witt comparison | Previous review: CDHHLMNNS-III-v4 lines 1896,2050, pp.41,44; unchanged. |
| 0.3 Second residue | Previous review: CDHHLMNNS-III-v4 lines 1690,1840, pp.37,40; unchanged. |
| 1.1 Characteristic two table | Previous review: CDHHLMNNS-III-v4 line 1936, p.42; unchanged. |
| 1.2 Local and global residue diagrams | Previous review: CDHHLMNNS-III-v4 lines 1899,1904,1960, pp.41–42; unchanged. |
| 2.1 Dyadic completion | Previous review: CDHHLMNNS-III-v4 lines 2068,2087, p.45; unchanged. |
| 2.2 Arithmetic fracture | Previous review: CDHHLMNNS-III-v4 line 1976, p.43, and CDHHLMNNS-II-v5 lines 5253–5274, pp.108–110; unchanged. |
| 3.1 Dyadic correction | Previous review: CDHHLMNNS-III-v4 line 2044, pp.44–45; unchanged. |
| 3.2 Number field quadratic table | Reopened CDHHLMNNS-III-v4 lines 2072–2096, p.45; finite-field Arf coordinates agree with the added theorem. |
| 3.3 Dyadic parity obstruction | Previous review: CDHHLMNNS-III-v4 line 2099, pp.45–46; unchanged. |
| 3.4 Quadratic localization | Previous review: CDHHLMNNS-III-v4 lines 1807,2206, pp.39–40,47; unchanged. |
| 4.3 Dyadic integral Witt group | Previous review's local invariant computation retained; extension law does not change the 𝔽₂ generator or its polar c+4u. |
| 5.2 Eisenstein symmetric Witt group | Previous review and reopened CDHHLMNNS-III-v4 line 2159, p.46; symmetric group and rank-parity map unchanged. |
| 5.3 Unramified restriction | Previous review and reopened CDHHLMNNS-III-v4 lines 2168–2182, p.47; symmetric restriction remains distinct from quadratic extension. |
| 5.4 Eisenstein Arf base change | Reopened CDHHLMNNS-III-v4 line 2163, pp.46–47; freshly computed quadratic arrow 1↦0, while the new ζ-plane has trace 1. |
| 5.5 Eisenstein L-groups | Reopened CDHHLMNNS-III-v4 lines 2183–2205, p.47; retained corrected quadratic rows 0,0,ℤ/2,ℤ/4, using the additional local image. |

**Headline inventory.** The four statable headlines are the §0.4 finite-field Arf classification and scalar-extension degree law, and the §4.1 additive ℚ₂ Witt coordinates and multiplication-by-c formula. All four are stated. The module docstring still names the integral comparison/injection and line-valued residue theory; symmetric Dedekind/global/DVR L-tables; general arithmetic fracture and complete/henselian quadratic rigidity; total-cokernel extension, number-field table, parity and localization; integral dyadic/E₈ comparisons; and Eisenstein groups and maps as requiring integral Witt, general noncommutative quadratic/Poincaré or periodic L-spectrum carriers. Removing the obsolete claim about the scalar-extension constructor correctly leaves the noncommutative lifting limitation. No headline was replaced by a weaker test.

**New adversarial calculations.** Here H=xy, B=x²+xy+y² and ζ²+ζ+1=0. Binary finite-field arithmetic was computed modulo x²+x+1, x³+x+1, x⁴+x+1 and x⁶+x+1. The 𝔽₄ embeddings into 𝔽₁₆ and 𝔽₆₄ use a root of x²+x+1. These tests support, rather than prove, the universal theorem; its proof route is given above.

| Changed statement or dependent claim | Instances tried | Values computed on both sides / discriminating values | Result; change |
| --- | --- | --- | --- |
| §0.4 / `arf_scalar_extension`: degree law and added Check | B over 𝔽₂→𝔽₂,𝔽₄,𝔽₈ | Target trace of 1: 1,0,1; degree times source trace: 1,0,1. Zero counts: 1,7,1. | Pass; previous R01 repaired. |
| Same law over a non-prime base field | x²+xy+ζy² over 𝔽₄→𝔽₄,𝔽₁₆,𝔽₆₄ | Target traces: 1,0,1; [l:k]·Tr(ζ): 1,0,1. Zero counts: 1,31,1. | Pass; covers degrees 1,2,3 with k≠𝔽₂. |
| §0.4 polynomial construction and agreement on 1⊗V | All 16 planes ax²+xy+by² over 𝔽₄, each of the three extensions above | 256 restriction evaluations per extension: Q(1⊗v)−ι(q(v))=0 in all 768 cases; 16 trace comparisons per extension give 0 differences in all 48. | Pass; actual construction retained. |
| §0.4 extended symplectic basis and perfectness | One plane, two orthogonal planes, zero pairs | Polar block [[0,1],[1,0]], determinant 1; two-block determinant 1; zero adjoint is 0→0. Target and scalar-extended source polars agree. | Pass; all three pairing hypotheses retained. |
| §0.4 uniqueness and added negative control | H versus zero form over 𝔽₄ | Values at e,f,e+f are (0,0,1) versus (0,0,0); equality on basis vectors alone admits the wrong form, equality on every vector excludes it. | Pass; `baseChange_ext` applies. |
| §0.4 zero-dimensional Check | n=0, degrees 1,2,3 | Tensor product 0, empty Arf sum 0; both sides 0 for all three degrees. | Pass; no rank-positive restriction introduced. |
| §5.4 dependent quadratic and symmetric arrows | 𝔽₂→𝔽₄; B and the new ζ-plane | Tr(1)=0=2·1; Tr(ζ)=1; B(ζ,1)=0. Symmetric line still has rank parity 1→1. | Pass; the two arrows remain different. |

**Carried adversarial calculations.** The following 51 rows reproduce the unchanged-statement values from the previous report; each row cites that report. The one old row asking for the missing extension headline is replaced by the fresh rows above. No unperformed numerical recheck is implied.

| Statement | Instances tried | Values computed on the two sides / discriminating values | Result; change |
| --- | --- | --- | --- |
| Conventions: full polar, perfect adjoint, zero carrier | q=x² over ℚ and 𝔽₂; zero module; integral b=2xy | bq(1,1)=2 over ℚ, 0 over 𝔽₂; zero adjoint 0→0 bijective; multiplication by 2 on ℤ has cokernel ℤ/2, not 0 | Correct; none  Carried from [previous review][previous]. |
| Conventions: Lagrangian and rank | H over 𝔽₂; B over 𝔽₂ | H has vanishing line span(1,0), dimension 1=2/2; B has no nonzero zero, so maximum vanishing dimension 0≠1 | Correct; none  Carried from [previous review][previous]. |
| Conventions: difference and suspension signs | identity maps on ℤ; negative-sign degrees 2 and 0 over ℤ | difference(1,1)=0, difference(2,1)=1; sum(1,1)=2; positive comparison degrees 0 and −2 give ℤ and 0 | Correct; none  Carried from [previous review][previous]. |
| Conventions: symmetric/native quadratic comparison | bilinear ⟨1⟩ over ℚ | unital diagonal map gives x² and polar 2xy; inverse polar gives x²/2 and polar xy; ratio of comparisons is ⟨2⟩ | Correct; none  Carried from [previous review][previous]. |
| Conventions: signed determinant and stabilization | c and c⊥⟨1,−1⟩ | ranks 2,4; plain determinants 3,−3; signed determinants −3,−3; Hasse signs +1,−1, agreeing with multiplier (3,−1)₂=−1 | Correct; none  Carried from [previous review][previous]. |
| 0.1 Polarization and inverse | b=xy over ℚ; B over 𝔽₂ | polar(x²/2)(1,1)=1=b(1,1); Arf(B)=1 but symmetric class of polar(B)=0 | Correct with two-unit hypothesis; none  Carried from [previous review][previous]. |
| 0.1 Projective carrier and functorial API | I=(2,1+√−5) over ℤ[√−5]; H⊥H | I²=(2), I∨=(1/2)I, so x↦x/2 identifies I with I∨; H⊥H has block polar H⊕H and rank-four adjoint determinant 1 | Correct; does not replace projective by free  Carried from [previous review][previous]. |
| 0.2 Symmetric injection and characteristic-two comparison | ⟨1⟩ over ℤ→ℚ; H over 𝔽₂[t]; R=K | signatures 1→1; symmetric class σ(H)=0 and unit-line rank parity 1; field extension map x↦x, kernel {0} | Correct; none  Carried from [previous review][previous]. |
| 0.3 Rank-one residues | ⟨3⟩,⟨2⟩,⟨4⟩ at 2; ⟨6⟩ at 3 | valuations 0,1,2 give 0,⟨1⟩,0; v₃(6)=1 and unit 2 give ⟨2⟩, not ⟨1⟩ | Correct; none  Carried from [previous review][previous]. |
| 0.3 Coordinate change | ⟨5⟩ at 5 with π=5 and π′=10 | coefficients 1 and 1/2=3 mod 5; multiplying by 2 changes 3 back to 1; 2 and 3 are the same square class | Correct line-valued convention; none  Carried from [previous review][previous]. |
| 0.3 Additivity, support and ramification | ⟨2⟩⊥⟨2⟩; ⟨6⟩ over ℚ; ℤ→ℤ[i] | at 2, 1+1=0 in ℤ/2; support of ⟨6⟩ is {2,3}; v_(1+i)(2)=2 so ramified boundary image is 0 rather than residue-field identity 1 | Correct; none  Carried from [previous review][previous]. |
| 0.4 Arf definition and classification | 0,H,B over 𝔽₂; B and x²+xy+ζy² over 𝔽₄ | zero counts 1,3,1 over 𝔽₂; Arf values 0,0,1. Over 𝔽₄ zero counts 7 and 1, traces Tr(1)=0 and Tr(ζ)=1 | Correct; none  Carried from [previous review][previous]. |
| 0.4 Both directions of Lean iff | H⊥H, B⊥H, B⊥B over 𝔽₂ | trace pairs (0,0),(1,0),(1,1); zero counts 10,6,10; half-dimensional vanishing subspace exists: yes,no,yes | Correct; none  Carried from [previous review][previous]. |
| 0.4 Unequal dimensions and zero dimension | 0 vs H; 0 vs B; 0 vs 0 | traces (0,0),(0,1),(0,0); required dimensions 1,1,0; actual vanishing dimensions 1,0,0 | Correct; none  Carried from [previous review][previous]. |
| 0.4 Basis independence | H over 𝔽₄; standard basis and ((1,1),(ζ,ζ²)) | polar pairings both 1; raw sums 0,1; absolute traces 0,0 | Correct; raw-sum invariant excluded  Carried from [previous review][previous]. |
| 1.1 Characteristic-two global table | 𝔽₂[t], 𝔽₂(t), 𝔽₂[t,t⁻¹] | Pic/2=0 in all three; ∂t⟨t⟩=1 before inverting t; t-component absent afterwards; field prime set empty | Correct; none  Carried from [previous review][previous]. |
| 1.2 DVR table | ℤ_(2), ℤ_(3), 𝔽₂[[t]] | first two positive-sign rows: (Ws,ℤ/2,0,0), (Ws,0,0,0); equal-char-two rows (Ws,0,Ws,0); ∂⟨π⟩=⟨1⟩ in each case | Correct; does not require completeness  Carried from [previous review][previous]. |
| 1.2 Global residue/Picard maps | ℤ and 𝔽₃[t]; principal divisor (3) | Pic/2=0; d=1 and 0; symmetric rows (ℤ,ℤ/2,0,0) and (Ws,0,0,0); principal class maps to 0, inverse principal class also 0 | Correct; none  Carried from [previous review][previous]. |
| 2.1 Completion comparison | ℤ, ℤ[1/2], ℚ, ℤ_(3) | completions ℤ₂,0,0,0; corresponding products have one,zero,zero,zero factors; all unit-ideal quotients are 0 | Correct; none  Carried from [previous review][previous]. |
| 2.1 Ramification and projection API | ℤ[i], ℤ[ζ₃], two split factors | ramification/residue degrees (2,1) and (1,2), each one factor; exponent subsequences 2m,m cofinal; maps x↦(0,0),(0,1) agree only on first projection | Correct; none  Carried from [previous review][previous]. |
| 2.2 Fracture and K₀ controls | ℓ=1; ℤ at 2; ℤ/4 at 2; even-Euler subcategory | squares R→0 over R→0 and ℤ/4→ℤ/4 over 0→0; difference on diagonal 1 is 0; K₀ image 2ℤ excludes class 1 | Correct; no deletion of controls  Carried from [previous review][previous]. |
| 2.3 Quadratic isometry lifting | H,B over ℤ₂; J=0; 𝔽₂[ε]/ε² | H polar determinant −1 is a unit; B residue Arf=1 versus H=0; J=0 gives identity lift; order-ε correction leaves error in ε²=0 | Correct; none  Carried from [previous review][previous]. |
| 2.3 Exclude symmetric rigidity | symmetric lines 1,3 over ℤ₂ | both reduce to line 1; square-class ratio 3 mod 8 is not 1, so they are not isometric | Correct negative control; none  Carried from [previous review][previous]. |
| 2.3 Anti-structure sign and multiplication order | φ=xy, u=−1 over ℚ; upper-triangular plane; transpose on M₂(ℚ) | rank-one φ+Tφ=0 versus 2xy if u omitted; plane determinants +1 for u=−1 and −1 for u=1; α(E₁₂E₂₁)=E₁₁, reversed product E₁₁, unreversed product E₂₂ | Correct; noncommutative case retained  Carried from [previous review][previous]. |
| 2.4 Complete rigidity | ℤ₂→𝔽₂; dual numbers→𝔽₂; J=R | quadratic four rows (ℤ/2,0,ℤ/2,0) on residue model; unit ideal permits separated completeness only for R=0, both spectra 0; symmetric orders 16→2 exclude symmetric analogue | Consistent with source theorem; none  Carried from [previous review][previous]. |
| 2.5 Henselian rigidity and nonlocal approximation | (ℤ₂,(2)); dual numbers; henselization of (ℤ[x],(2)) | quadratic rows as above; ε²=0; quotient H/2H=𝔽₂[x] has distinct maximal ideals (x),(x+1), so H is not local | Correct; ideal-adic G-ring contract needed  Carried from [previous review][previous]. |
| 3.1 Sum-of-images definition | D=ℤ/4, global image {0,2}, quadratic image {0} or D | quotients ℤ/2 and 0; in first case 0,2↦0 and 1,3↦1; intersection quotient would incorrectly have order 4 | Correct; none  Carried from [previous review][previous]. |
| 3.1 Cokernel-on-cokernels and factoring | same D; map D→ℤ/2; either image surjective | killing both images gives the same two cosets as successive cokernels; reduction mod 2 factors, identity D→D does not; a surjective image gives quotient order 1 | Correct universal property; none  Carried from [previous review][previous]. |
| 3.2 Number-field quadratic rows | ℤ, ℤ[1/2], Eisenstein ring | d=1,0,1; Lq₂=ℤ/2,0,ℤ/2; A orders 1,1,4; Pic/2=0 gives Lq₃=A in these instances | Correct; no general splitting inferred  Carried from [previous review][previous]. |
| 3.3 Parity surjection | d=0,1,2,3 | vector-group orders 1,2,4,8; diagonal orders 1,2,2,2; quotient orders 1,1,2,4; (1,0) not in {(0,0),(1,1)} | Correct boundary qualifications; none  Carried from [previous review][previous]. |
| 3.3 Infinite imperfect residue example | ℤ[t]_(2)[(1+√17)/2] | discriminant 17 is a unit; reduction x²−x−4=x(x+1); two residue fields 𝔽₂(t); t has odd t-valuation so is nonsquare; parity quotient order 2 | Correct; no finite/perfect shortcut  Carried from [previous review][previous]. |
| 3.4 Nondyadic localization | S=∅,{3},{2} over ℤ; infinite S | empty cofiber 0; at 3 both completions ℤ₂; at 2 a proposed sequence would inject ℤ/2=Lq₂(ℤ) into 0 since adjacent residue π₃=0 | Correct negative control; finite-support sum retained  Carried from [previous review][previous]. |
| 4.1 Additive coordinates, first Lean headline | all 32 triples (a,b,e) | 8·2·2=32 pairwise different stabilized local invariant tuples; orders u,v,c are 8,2,2; zero triple gives 0 | Correct; none  Carried from [previous review][previous]. |
| 4.1 Multiplication, second Lean headline | all 32 triples | c(au+bv+ec) and ac+4bu have equal stabilized local invariants for all 32; kernel exactly (a even,b=0), size 8; image {0,c,4u,c+4u}, size 4 | Correct; none  Carried from [previous review][previous]. |
| 4.1 Nonzero product and Hasse sign | cv,4u,H⊥H over ℚ₂ | rank 4 in each; determinant square classes all 1; Hasse signs +1,+1,−1. Individual cv symbols (3,−2),(3,−6),(−2,−6) are +1,−1,−1 | Correct; supports source correction  Carried from [previous review][previous]. |
| 4.1 Alternate generators | c vs ⟨1,−5⟩; ⟨1,−3⟩ vs 2u+c | −5/3≡1 mod 8; after stabilization both latter forms have determinant class 3 and Hasse +1; c²=0 and 2c=0 | Correct; none  Carried from [previous review][previous]. |
| 4.1 Junk coefficients and residues | a=8,b=2 in cyclic carriers; u,c,v | cyclic values 0,0; second residues 0,0,1, so the integral kernel contains u and excludes v | Correct; none  Carried from [previous review][previous]. |
| 4.2 E₈ half-norm refinement | graph arms 2,4,1; roots and adjacent roots | q(eᵢ)=1; q(eᵢ+eⱼ)=1 when adjacent, polar −1; 256 vectors give 136 zeros and 120 ones, 136=128+8; signature/8=8/8=1 | Correct; no use of zero full-norm reduction  Carried from [previous review][previous]. |
| 4.3 Integral dyadic group | residue kernel and Arf-one polar | kernel {b=0}, order 16; section −v=v, order 2; diag(2,3/2) has signed determinant −3 and Hasse −1, matching c+4u rather than c | Correct; none  Carried from [previous review][previous]. |
| 4.3 Integer obstruction and comparison | images ⟨u⟩ and ⟨c+4u⟩ | orders 8 and 2, intersection order 1, sum order 16; A(ℤ)=0; E₈ mod 2 Arf=0, so global quadratic reduction is zero | Correct; none  Carried from [previous review][previous]. |
| 5.1 Eisenstein local arithmetic | x²+x+1 mod 2; comparison x²+x+2 | values 1,1 versus 0,0 at 0,1; first irreducible, second split; derivatives 1; discriminants −3,−7 odd; local degrees (e,f,g)=(1,2,1),(1,1,2) | Correct; discriminant alone insufficient  Carried from [previous review][previous]. |
| 5.1 Units and norms | a+bζ with norm 1 | a²−ab+b²=1 at exactly (±1,0),(0,±1),(1,1),(−1,−1); six units, square subgroup order 3, quotient order 2 | Correct; none  Carried from [previous review][previous]. |
| 5.2 Symmetric Eisenstein group | 0,u,2u,3u,4u | (parity,signed determinant)=(0,1),(1,1),(0,−1),(1,−1); −1 nonsquare in E; 4u and H⊥H have Hasse +1 over E, versus opposite signs over ℚ₂ | Correct order 4; none  Carried from [previous review][previous]. |
| 5.3 Restriction and transfer exactness | ℚ₂→E and ℤ₂→O | kernel ⟨c,4u⟩ order 4; field image order 8, integral image order 4; both cokernels order 8; symmetric residue arrow 1↦1 | Correct with declared exactness contract  Carried from [previous review][previous]. |
| 5.3 Transfer normalization | λ,−λ,λ/2 and ordinary trace | on (1+s)² values 2,−2,1; λ-transfer of ⟨1⟩ has matrix [[0,1],[1,0]], class 0; ordinary trace gives diag(2,−6), signed determinant class 3≠1 | Correct; rules out wrong functional  Carried from [previous review][previous]. |
| 5.3 Sign-sensitive transfer | line ⟨s⟩ | λ gives diag(1,−3)=2u+c; −λ gives diag(−1,3)=6u+c; difference 4u≠0 | Correct; sign fixed  Carried from [previous review][previous]. |
| 5.4 Quadratic residue arrow | B and x²+xy+ζy² over O | Tr(1)=0, Tr(ζ)=1; qB(ζ,1)=0; new polar [[2,1],[1,2ζ]] has signed determinant 1−4ζ | Correct zero old arrow, nonzero new class  Carried from [previous review][previous]. |
| 5.4 Separation of local and global images | t,0,2u in Ws(O) | N(1−4ζ)=21≡5 mod 8 nonsquare; N(1)=N(−1)=1 square; t has order 2 and differs from both 0 and 2u | Correct intersection {0}; none  Carried from [previous review][previous]. |
| 5.5 Transfer matrix and extra quotient | displayed 4×4 matrix | determinant 21; direct rational elimination gives diag(1,−4,1/4,−21), square-rescaling gives diag(1,−1,4,−21/4); Witt remainder ⟨1,−21⟩=c since −7≡1 mod 8 | Correct; none  Carried from [previous review][previous]. |
| 5.5 Degree-zero kernel and degree-three group | Ws(O), global image, quadratic image | Ws(O) order 32 (4·8); image sum order 4·2=8; kernel of Wq(O)⊕Ws(R)→Ws(O) order 1; ann(c)/⟨c⟩ order 4 with generator 2u of order 4 | Correct: Wq(R)=0, A(R)=ℤ/4  Carried from [previous review][previous]. |
| 5.5 and worked L-tables | ℤ,ℤ[1/2],ℤ[ζ₃] | quadratic rows (ℤ,0,ℤ/2,0), (Wq,0,0,0), (0,0,ℤ/2,ℤ/4); symmetric rows (ℤ,ℤ/2,0,0), (Ws,0,0,0), (ℤ/4,ℤ/2,0,0) | Consistent with images and supplied tables; none  Carried from [previous review][previous]. |

## Not verifiable

- **Wall-1973**, Corollary 1, Lemma 1, Proposition 4 and Lemma 5: settled uncertified publisher-only text; the previous review's limitation remains. No acquisition request was reopened.
- **Lam-2005**, VI Theorem 2.29 and VII Theorem 3.5: settled uncertified AMS book; the previous publisher lookup yielded no legal open text. The concrete arithmetic is carried from the previous review, not a certification of the original book's numbering or proof.
- **Scharlau-1985**, Chapter 6 §6, Theorem 6.11: settled uncertified Springer book; original text/pagination remains uncertified.

No new reference is required by the repair. The changed claims were checked against the supplied legal source cache and pinned libraries; no source manifest or PR file was edited.

## Source issues

The source issues below are retained from the previous review. The Example 2.3.14 passages were reopened for this repair; the other entries are carried forward without repeating the full source audit.

- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.46 (line 2156): the source says avoiding the discriminant makes two prime; it should be irreducibility modulo two proves inertness, whereas avoiding the discriminant proves only unramifiedness; affects the proof.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.47 (line 2180): the source says the annihilator of ⟨1,3⟩ is generated by 2⟨1⟩ and ⟨1,−2⟩; it should be generated by 2⟨1⟩ and ⟨1,3⟩, equivalently 2⟨1⟩ and ⟨1,−3⟩; affects a stated result.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed pp.46–47 (line 2163 and line 2202): the source says quadratic base change preserves the residue generator, giving Eisenstein Lq₀=ℤ/2 and Lq₃=ℤ/4⊕ℤ/2; it should be quadratic base change is zero, and the additional local quadratic image gives Lq₀=0 and Lq₃=ℤ/4; affects a stated result.
- **Misprint** in CDHHLMNNS-II-v5 at Proposition 4.5.5(iv), printed p.109 (line 5262): the source says the second Ore pair uses the source ring; it should be the image multiplicative set paired with the target ring; affects the proof.
- **Misprint** in CDHHLMNNS-II-v5 at the note following Proposition 4.5.5, printed p.109 (line 5276): the source says condition iv is equivalent to the kernel-and-cokernel comparison; it should be condition iii, the cofiber-equivalence condition; affects nothing.
- **Misprint** in CDHHLMNNS-III-v4 at Theorem 2.2.4 proof, printed p.38 (line 1723): the source says the finite-subset colimit indexes subsets with the ambient set finite; it should be the indexing subset S′ that is finite; affects nothing.
- **Error** in CDHHLMNNS-III-v4 at Remark 2.3.15, printed p.47 (line 2211): the source says every nondyadic residue field has odd characteristic; it should be characteristic different from two, including zero, as for ℚ[t] at (t); affects the proof.

[previous]: packages/GeometryOfNumbersAndQuadraticArithmeticPartII/reports/PRREVIEW-GeometryOfNumbersAndQuadraticArithmeticPartII~1.md
