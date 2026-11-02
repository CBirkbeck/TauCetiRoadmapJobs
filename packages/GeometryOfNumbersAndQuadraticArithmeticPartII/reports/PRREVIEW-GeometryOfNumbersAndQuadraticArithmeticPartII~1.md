# Review of GeometryOfNumbersAndQuadraticArithmeticPartII (pull request #1691 at d851306)
**Verdict:** needs changes

## R01 (P2) — State the finite-field Arf extension theorem on native carriers

**Location:** `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean:19`, referring to `README.md:160–166` in the same folder. The docstring says: “the Arf extension-degree law: native quadratic scalar extension `QuadraticForm.baseChange` requires invertibility of two”.

**Claim:** This is given as a reason the headline cannot be stated. The restriction on that particular constructor is real, but the required carriers already exist. One can quantify the scalar-extended quadratic form on the native tensor product, characterize it by its values on `1 ⊗ v`, and assert existence together with the absolute-trace law. This tests actual scalar extension, without an opaque map, an arbitrary predicate, or an assumed conclusion. The missing law is essential to the distinction between the two residue arrows in §5.4.

**Witness:** `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:158`, root declaration `baseChange_ext`, determines a quadratic extension from its values on `1 ⊗ v` without invertibility of two. The signature below elaborates at the pins with only its `sorry` warning.

**Exact repair:** Add the scalar-extension/Arf-degree headline to `Suggested.lean`, name it in README §0.4, and remove its “not statable” entry. For example, the following tested signature uses precisely the symplectic-basis convention of the existing classification theorem:

```lean
open scoped TensorProduct

theorem arf_scalar_extension
    {k l V : Type*} [Field k] [Fintype k] [CharP k 2]
    [Field l] [Fintype l] [CharP l 2] [Algebra k l]
    [Algebra (ZMod 2) k] [Algebra (ZMod 2) l] [IsScalarTower (ZMod 2) k l]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (q : QuadraticForm k V) (n : ℕ) (b : Module.Basis (Fin n × Bool) k V)
    (hee : ∀ i j, QuadraticMap.polar q (b (i, false)) (b (j, false)) = 0)
    (hff : ∀ i j, QuadraticMap.polar q (b (i, true)) (b (j, true)) = 0)
    (hef : ∀ i j, QuadraticMap.polar q (b (i, false)) (b (j, true)) =
      if i = j then 1 else 0) :
    ∃ Q : QuadraticForm l (l ⊗[k] V),
      (∀ v, Q ((1 : l) ⊗ₜ[k] v) = algebraMap k l (q v)) ∧
      Algebra.trace (ZMod 2) l
        (∑ i : Fin n, Q ((1 : l) ⊗ₜ[k] b (i, false)) *
          Q ((1 : l) ⊗ₜ[k] b (i, true))) =
      Module.finrank k l • Algebra.trace (ZMod 2) k
        (∑ i : Fin n, q (b (i, false)) * q (b (i, true))) := by
  sorry
```

The scalar-extension equation determines Q uniquely by `baseChange_ext`. The vectors in the displayed sum are the native basis `b.baseChange l` (`Mathlib/LinearAlgebra/TensorProduct/Basis.lean:63,73`). Polarizing that equation transports the three symplectic identities, so Q has perfect polar; no nonsingularity or construction hypothesis is being omitted. This is an existential theorem about an actual quadratic form, not sorry'd data. Add the usual mathematical declaration docstring when incorporating it.

**Repair instance:** For k=𝔽₂, l=𝔽₄ and q=x²+xy+y², the left trace is Tr(1)=0 and the right side is 2·1=0. For the identity extension they are 1 and 1; for n=0 they are 0 and 0. Thus the proposed statement retains the even-degree vanishing, identity map, and zero-dimensional cases. Elaboration is evidence of statability, not a claimed formal proof of this theorem.

## Verified sound

:robot: Independent AI review. Read all 23 numbered target sections, their API lists, Checks, examples and dependencies; inspected all 106 lines of `Suggested.lean`. The review found one acceptance-test omission and no counterexample to the retained mathematical statements. The numerical tests below supplement the source and proof-route review; they do not prove the universal statements by testing.

**Gate and scope.** The worktree is at the specified full head. The outside-folder diff is empty and the final worktree status is clean. The worker's gate reports every check passing, including the targeted build, style scanners, metadata, imports, stray files and dependency check. Independently ran the prescribed direct Lean elaboration: success, exactly three `declaration uses sorry` warnings at lines 53, 84 and 97. No project file was changed. The normative Writing a roadmap checklist and CONTRIBUTING guidance were read; main-branch `Completed/IntegralLattices`, `QuadraticFormInvariants` and `GlobalQuadraticForms` were used for shape and ownership comparisons.

The independent dependency command, with the prescribed content, order and movable arguments, returned exactly:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. All 23 target-level Needs lines and the supplier contracts were read. The citation resolver reported no missing roadmap citations or Lean names; its own notice says it did not inspect the pinned Lake libraries, so library verification below was performed directly.

**Source sample: 15 of 15 requested targets examined.** Page numbers below are the printed pages in the specified arXiv version, not journal pagination. “Supports” includes the explicit derivation in the README where a source supplies the general theorem rather than the new coordinates.

| Sample target | Text opened and locator | Hypothesis/map check and outcome |
| --- | --- | --- |
| 0.1 Integral Witt comparison | CDHHLMNNS-III-v4 line 1896, Proposition 2.3.1 proof, p.41; line 2050, Proposition 2.3.9 proof, p.44 | Quadratic L₀ comparison and Dedekind symmetric L₀ comparison have separate hypotheses. Full polar and its half-diagonal inverse were recomputed; supports. |
| 0.2 Integral Witt injection | CDHHLMNNS-III-v4 line 2226, Corollary 2.3.16 proof, p.48; line 2240, Remark 2.3.17, p.48 | Saturated Lagrangian descent; characteristic-not-two quadratic injection; characteristic-two zero symmetrization. The README does not infer injectivity of the latter zero map; supports. |
| 1.2 Local and global residue diagrams | CDHHLMNNS-III-v4 line 1899, p.41; line 1960, Remark 2.3.5, p.42; line 1904, Corollary 2.3.2, pp.41–42 | Arbitrary DVR residue field permitted; global assumption supplies finite residues and Pic/2. Scharlau citation remains uncertified; the available paper states the general global-field result. |
| 2.1 Dyadic completion | CDHHLMNNS-III-v4 line 2068 and line 2087, p.45 | Product over distinct dyadic primes, not ramification multiplicities. CRT plus cofinal exponents provides the R-algebra comparison; empty product checked. |
| 2.4 Complete quadratic rigidity | CDHHLMNNS-III-v4 line 2000, Proposition 2.3.7, pp.43–44; line 2019 | Both signs and degree-one kernel comparison are retained. Wall-1973 is not certified directly; source III specifies its use. |
| 3.1 Dyadic correction | CDHHLMNNS-III-v4 line 2044, Proposition 2.3.9, pp.44–45 | Total cokernel, hence sum of images, not intersection or just one image. Supports. |
| 3.2 Number-field quadratic table | CDHHLMNNS-III-v4 line 2072, Corollary 2.3.10, p.45 | Number field, finite dyadic set, Arf coordinates, finite 2-group and exact extension retained; no splitting. |
| 3.3 Dyadic parity obstruction | CDHHLMNNS-III-v4 line 2099, Remark 2.3.12, pp.45–46 | Independent rank parities modulo constant global rank; no residue finiteness needed. The d=0 and d=1 qualifications are correct. |
| 3.4 Quadratic localization | CDHHLMNNS-III-v4 line 2206, Remark 2.3.15, p.47; line 1807, Remark 2.2.8, pp.39–40 | Nondyadic hypothesis, finite-support sum and coefficient shift retained. The source's phrase about odd residue characteristic needs the characteristic-zero correction recorded below; the README already states the right scope. |
| 4.1 Dyadic Witt coordinates | CDHHLMNNS-III-v4 line 2120, Example 2.3.13, p.46; line 2175, Example 2.3.14, p.47 | Order 32 and abstract group supported; explicit generators verified by local invariants. The README correctly repairs the source's annihilator generator. |
| 4.2 Integral signature | CDHHLMNNS-III-v4 line 2110, Example 2.3.13, p.46 | E₈ generates quadratic integer group; symmetrization multiplies signature/8 by eight. Direct enumeration of its stated polynomial gives 136 zeros, as required. |
| 5.1 Eisenstein dyadic place | CDHHLMNNS-III-v4 line 2150, Example 2.3.14, p.46 | Completion is unramified quadratic. The README adds the indispensable irreducible-reduction argument missing from the source's inference. |
| 5.2 Eisenstein symmetric Witt group | CDHHLMNNS-III-v4 line 2159, Example 2.3.14, p.46 | Group ℤ/4 supported. Its generator and completed order were checked through signed determinant and local Hasse invariants. |
| 5.3 Unramified restriction | CDHHLMNNS-III-v4 line 2168 and line 2175, Example 2.3.14, p.47 | Same uniformizer, symmetric residue identity, field kernel/cokernel and trace-zero transfer. Lam remains uncertified; the corrected coordinates are checked independently below. |
| 5.5 Eisenstein L-groups | CDHHLMNNS-III-v4 line 2183, Example 2.3.14, p.47; line 2044, Proposition 2.3.9 | Example 2.3.14 does not state the README's corrected answer. Recomputing its two images and transfer gives Wq(R)=0 and A(R)=ℤ/4; source errors are recorded below. |

Also read the nonsampled source routes: second residue at CDHHLMNNS-III-v4 line 1690 and line 1840; characteristic-two table at line 1936; arithmetic fracture at line 1976; henselian reduction at line 2023; Wall-1970 line 104, line 132 and line 155 (Lemma 1, p.427; Theorem 2, pp.428–429); CMM line 892 (Theorem 3.15, p.21) and line 1659 (Remark 5.6, p.39); CDHHLMNNS-II-v5 line 5253 through line 5274 (Proposition 4.5.5, pp.108–109, continuing on p.110); Stacks line 6106 and line 6126 (tags 0AH2/0AH3, printed pp.130–131). Wall's extraction loses some displayed symbols, but its theorem, hypotheses, quadratic quotient and error-squaring conclusion are readable and agree with source III's account. No source passage was copied into this report.

**Adversarial values.** Here H=xy, B=x²+xy+y², ζ²+ζ+1=0, u=⟨1⟩, v=⟨1,−2⟩ and c=⟨1,3⟩. Zero groups are written 0, whereas group orders are positive integers. The table covers every numbered target, all three Lean headlines, the omitted headline, and the conventions and auxiliary definitions used by them. Finite-field and ℚ₂ computations were independently implemented with exact finite arithmetic and rational arithmetic; structural examples were checked from the stated maps and supplier identifications.

| Statement | Instances tried | Values computed on the two sides / discriminating values | Result; change |
| --- | --- | --- | --- |
| Conventions: full polar, perfect adjoint, zero carrier | q=x² over ℚ and 𝔽₂; zero module; integral b=2xy | bq(1,1)=2 over ℚ, 0 over 𝔽₂; zero adjoint 0→0 bijective; multiplication by 2 on ℤ has cokernel ℤ/2, not 0 | Correct; none |
| Conventions: Lagrangian and rank | H over 𝔽₂; B over 𝔽₂ | H has vanishing line span(1,0), dimension 1=2/2; B has no nonzero zero, so maximum vanishing dimension 0≠1 | Correct; none |
| Conventions: difference and suspension signs | identity maps on ℤ; negative-sign degrees 2 and 0 over ℤ | difference(1,1)=0, difference(2,1)=1; sum(1,1)=2; positive comparison degrees 0 and −2 give ℤ and 0 | Correct; none |
| Conventions: symmetric/native quadratic comparison | bilinear ⟨1⟩ over ℚ | unital diagonal map gives x² and polar 2xy; inverse polar gives x²/2 and polar xy; ratio of comparisons is ⟨2⟩ | Correct; none |
| Conventions: signed determinant and stabilization | c and c⊥⟨1,−1⟩ | ranks 2,4; plain determinants 3,−3; signed determinants −3,−3; Hasse signs +1,−1, agreeing with multiplier (3,−1)₂=−1 | Correct; none |
| 0.1 Polarization and inverse | b=xy over ℚ; B over 𝔽₂ | polar(x²/2)(1,1)=1=b(1,1); Arf(B)=1 but symmetric class of polar(B)=0 | Correct with two-unit hypothesis; none |
| 0.1 Projective carrier and functorial API | I=(2,1+√−5) over ℤ[√−5]; H⊥H | I²=(2), I∨=(1/2)I, so x↦x/2 identifies I with I∨; H⊥H has block polar H⊕H and rank-four adjoint determinant 1 | Correct; does not replace projective by free |
| 0.2 Symmetric injection and characteristic-two comparison | ⟨1⟩ over ℤ→ℚ; H over 𝔽₂[t]; R=K | signatures 1→1; symmetric class σ(H)=0 and unit-line rank parity 1; field extension map x↦x, kernel {0} | Correct; none |
| 0.3 Rank-one residues | ⟨3⟩,⟨2⟩,⟨4⟩ at 2; ⟨6⟩ at 3 | valuations 0,1,2 give 0,⟨1⟩,0; v₃(6)=1 and unit 2 give ⟨2⟩, not ⟨1⟩ | Correct; none |
| 0.3 Coordinate change | ⟨5⟩ at 5 with π=5 and π′=10 | coefficients 1 and 1/2=3 mod 5; multiplying by 2 changes 3 back to 1; 2 and 3 are the same square class | Correct line-valued convention; none |
| 0.3 Additivity, support and ramification | ⟨2⟩⊥⟨2⟩; ⟨6⟩ over ℚ; ℤ→ℤ[i] | at 2, 1+1=0 in ℤ/2; support of ⟨6⟩ is {2,3}; v_(1+i)(2)=2 so ramified boundary image is 0 rather than residue-field identity 1 | Correct; none |
| 0.4 Arf definition and classification | 0,H,B over 𝔽₂; B and x²+xy+ζy² over 𝔽₄ | zero counts 1,3,1 over 𝔽₂; Arf values 0,0,1. Over 𝔽₄ zero counts 7 and 1, traces Tr(1)=0 and Tr(ζ)=1 | Correct; none |
| 0.4 Both directions of Lean iff | H⊥H, B⊥H, B⊥B over 𝔽₂ | trace pairs (0,0),(1,0),(1,1); zero counts 10,6,10; half-dimensional vanishing subspace exists: yes,no,yes | Correct; none |
| 0.4 Unequal dimensions and zero dimension | 0 vs H; 0 vs B; 0 vs 0 | traces (0,0),(0,1),(0,0); required dimensions 1,1,0; actual vanishing dimensions 1,0,0 | Correct; none |
| 0.4 Basis independence | H over 𝔽₄; standard basis and ((1,1),(ζ,ζ²)) | polar pairings both 1; raw sums 0,1; absolute traces 0,0 | Correct; raw-sum invariant excluded |
| 0.4 Extension-degree law; R01 | B over 𝔽₂→𝔽₂, 𝔽₄, 𝔽₈ | traces of 1 are 1,0,1; degree times original Arf gives 1·1=1, 2·1=0, 3·1=1 | Mathematics correct; add missing Lean headline |
| 1.1 Characteristic-two global table | 𝔽₂[t], 𝔽₂(t), 𝔽₂[t,t⁻¹] | Pic/2=0 in all three; ∂t⟨t⟩=1 before inverting t; t-component absent afterwards; field prime set empty | Correct; none |
| 1.2 DVR table | ℤ_(2), ℤ_(3), 𝔽₂[[t]] | first two positive-sign rows: (Ws,ℤ/2,0,0), (Ws,0,0,0); equal-char-two rows (Ws,0,Ws,0); ∂⟨π⟩=⟨1⟩ in each case | Correct; does not require completeness |
| 1.2 Global residue/Picard maps | ℤ and 𝔽₃[t]; principal divisor (3) | Pic/2=0; d=1 and 0; symmetric rows (ℤ,ℤ/2,0,0) and (Ws,0,0,0); principal class maps to 0, inverse principal class also 0 | Correct; none |
| 2.1 Completion comparison | ℤ, ℤ[1/2], ℚ, ℤ_(3) | completions ℤ₂,0,0,0; corresponding products have one,zero,zero,zero factors; all unit-ideal quotients are 0 | Correct; none |
| 2.1 Ramification and projection API | ℤ[i], ℤ[ζ₃], two split factors | ramification/residue degrees (2,1) and (1,2), each one factor; exponent subsequences 2m,m cofinal; maps x↦(0,0),(0,1) agree only on first projection | Correct; none |
| 2.2 Fracture and K₀ controls | ℓ=1; ℤ at 2; ℤ/4 at 2; even-Euler subcategory | squares R→0 over R→0 and ℤ/4→ℤ/4 over 0→0; difference on diagonal 1 is 0; K₀ image 2ℤ excludes class 1 | Correct; no deletion of controls |
| 2.3 Quadratic isometry lifting | H,B over ℤ₂; J=0; 𝔽₂[ε]/ε² | H polar determinant −1 is a unit; B residue Arf=1 versus H=0; J=0 gives identity lift; order-ε correction leaves error in ε²=0 | Correct; none |
| 2.3 Exclude symmetric rigidity | symmetric lines 1,3 over ℤ₂ | both reduce to line 1; square-class ratio 3 mod 8 is not 1, so they are not isometric | Correct negative control; none |
| 2.3 Anti-structure sign and multiplication order | φ=xy, u=−1 over ℚ; upper-triangular plane; transpose on M₂(ℚ) | rank-one φ+Tφ=0 versus 2xy if u omitted; plane determinants +1 for u=−1 and −1 for u=1; α(E₁₂E₂₁)=E₁₁, reversed product E₁₁, unreversed product E₂₂ | Correct; noncommutative case retained |
| 2.4 Complete rigidity | ℤ₂→𝔽₂; dual numbers→𝔽₂; J=R | quadratic four rows (ℤ/2,0,ℤ/2,0) on residue model; unit ideal permits separated completeness only for R=0, both spectra 0; symmetric orders 16→2 exclude symmetric analogue | Consistent with source theorem; none |
| 2.5 Henselian rigidity and nonlocal approximation | (ℤ₂,(2)); dual numbers; henselization of (ℤ[x],(2)) | quadratic rows as above; ε²=0; quotient H/2H=𝔽₂[x] has distinct maximal ideals (x),(x+1), so H is not local | Correct; ideal-adic G-ring contract needed |
| 3.1 Sum-of-images definition | D=ℤ/4, global image {0,2}, quadratic image {0} or D | quotients ℤ/2 and 0; in first case 0,2↦0 and 1,3↦1; intersection quotient would incorrectly have order 4 | Correct; none |
| 3.1 Cokernel-on-cokernels and factoring | same D; map D→ℤ/2; either image surjective | killing both images gives the same two cosets as successive cokernels; reduction mod 2 factors, identity D→D does not; a surjective image gives quotient order 1 | Correct universal property; none |
| 3.2 Number-field quadratic rows | ℤ, ℤ[1/2], Eisenstein ring | d=1,0,1; Lq₂=ℤ/2,0,ℤ/2; A orders 1,1,4; Pic/2=0 gives Lq₃=A in these instances | Correct; no general splitting inferred |
| 3.3 Parity surjection | d=0,1,2,3 | vector-group orders 1,2,4,8; diagonal orders 1,2,2,2; quotient orders 1,1,2,4; (1,0) not in {(0,0),(1,1)} | Correct boundary qualifications; none |
| 3.3 Infinite imperfect residue example | ℤ[t]_(2)[(1+√17)/2] | discriminant 17 is a unit; reduction x²−x−4=x(x+1); two residue fields 𝔽₂(t); t has odd t-valuation so is nonsquare; parity quotient order 2 | Correct; no finite/perfect shortcut |
| 3.4 Nondyadic localization | S=∅,{3},{2} over ℤ; infinite S | empty cofiber 0; at 3 both completions ℤ₂; at 2 a proposed sequence would inject ℤ/2=Lq₂(ℤ) into 0 since adjacent residue π₃=0 | Correct negative control; finite-support sum retained |
| 4.1 Additive coordinates, first Lean headline | all 32 triples (a,b,e) | 8·2·2=32 pairwise different stabilized local invariant tuples; orders u,v,c are 8,2,2; zero triple gives 0 | Correct; none |
| 4.1 Multiplication, second Lean headline | all 32 triples | c(au+bv+ec) and ac+4bu have equal stabilized local invariants for all 32; kernel exactly (a even,b=0), size 8; image {0,c,4u,c+4u}, size 4 | Correct; none |
| 4.1 Nonzero product and Hasse sign | cv,4u,H⊥H over ℚ₂ | rank 4 in each; determinant square classes all 1; Hasse signs +1,+1,−1. Individual cv symbols (3,−2),(3,−6),(−2,−6) are +1,−1,−1 | Correct; supports source correction |
| 4.1 Alternate generators | c vs ⟨1,−5⟩; ⟨1,−3⟩ vs 2u+c | −5/3≡1 mod 8; after stabilization both latter forms have determinant class 3 and Hasse +1; c²=0 and 2c=0 | Correct; none |
| 4.1 Junk coefficients and residues | a=8,b=2 in cyclic carriers; u,c,v | cyclic values 0,0; second residues 0,0,1, so the integral kernel contains u and excludes v | Correct; none |
| 4.2 E₈ half-norm refinement | graph arms 2,4,1; roots and adjacent roots | q(eᵢ)=1; q(eᵢ+eⱼ)=1 when adjacent, polar −1; 256 vectors give 136 zeros and 120 ones, 136=128+8; signature/8=8/8=1 | Correct; no use of zero full-norm reduction |
| 4.3 Integral dyadic group | residue kernel and Arf-one polar | kernel {b=0}, order 16; section −v=v, order 2; diag(2,3/2) has signed determinant −3 and Hasse −1, matching c+4u rather than c | Correct; none |
| 4.3 Integer obstruction and comparison | images ⟨u⟩ and ⟨c+4u⟩ | orders 8 and 2, intersection order 1, sum order 16; A(ℤ)=0; E₈ mod 2 Arf=0, so global quadratic reduction is zero | Correct; none |
| 5.1 Eisenstein local arithmetic | x²+x+1 mod 2; comparison x²+x+2 | values 1,1 versus 0,0 at 0,1; first irreducible, second split; derivatives 1; discriminants −3,−7 odd; local degrees (e,f,g)=(1,2,1),(1,1,2) | Correct; discriminant alone insufficient |
| 5.1 Units and norms | a+bζ with norm 1 | a²−ab+b²=1 at exactly (±1,0),(0,±1),(1,1),(−1,−1); six units, square subgroup order 3, quotient order 2 | Correct; none |
| 5.2 Symmetric Eisenstein group | 0,u,2u,3u,4u | (parity,signed determinant)=(0,1),(1,1),(0,−1),(1,−1); −1 nonsquare in E; 4u and H⊥H have Hasse +1 over E, versus opposite signs over ℚ₂ | Correct order 4; none |
| 5.3 Restriction and transfer exactness | ℚ₂→E and ℤ₂→O | kernel ⟨c,4u⟩ order 4; field image order 8, integral image order 4; both cokernels order 8; symmetric residue arrow 1↦1 | Correct with declared exactness contract |
| 5.3 Transfer normalization | λ,−λ,λ/2 and ordinary trace | on (1+s)² values 2,−2,1; λ-transfer of ⟨1⟩ has matrix [[0,1],[1,0]], class 0; ordinary trace gives diag(2,−6), signed determinant class 3≠1 | Correct; rules out wrong functional |
| 5.3 Sign-sensitive transfer | line ⟨s⟩ | λ gives diag(1,−3)=2u+c; −λ gives diag(−1,3)=6u+c; difference 4u≠0 | Correct; sign fixed |
| 5.4 Quadratic residue arrow | B and x²+xy+ζy² over O | Tr(1)=0, Tr(ζ)=1; qB(ζ,1)=0; new polar [[2,1],[1,2ζ]] has signed determinant 1−4ζ | Correct zero old arrow, nonzero new class |
| 5.4 Separation of local and global images | t,0,2u in Ws(O) | N(1−4ζ)=21≡5 mod 8 nonsquare; N(1)=N(−1)=1 square; t has order 2 and differs from both 0 and 2u | Correct intersection {0}; none |
| 5.5 Transfer matrix and extra quotient | displayed 4×4 matrix | determinant 21; direct rational elimination gives diag(1,−4,1/4,−21), square-rescaling gives diag(1,−1,4,−21/4); Witt remainder ⟨1,−21⟩=c since −7≡1 mod 8 | Correct; none |
| 5.5 Degree-zero kernel and degree-three group | Ws(O), global image, quadratic image | Ws(O) order 32 (4·8); image sum order 4·2=8; kernel of Wq(O)⊕Ws(R)→Ws(O) order 1; ann(c)/⟨c⟩ order 4 with generator 2u of order 4 | Correct: Wq(R)=0, A(R)=ℤ/4 |
| 5.5 and worked L-tables | ℤ,ℤ[1/2],ℤ[ζ₃] | quadratic rows (ℤ,0,ℤ/2,0), (Wq,0,0,0), (0,0,ℤ/2,ℤ/4); symmetric rows (ℤ,ℤ/2,0,0), (Ws,0,0,0), (ℤ/4,ℤ/2,0,0) | Consistent with images and supplied tables; none |

For the 32-class calculation, forms of the same rank parity were first enlarged by hyperbolic planes to equal rank. The comparison then used valuation parity and the odd unit modulo eight for the determinant square class, and the product of the pairwise ℚ₂ Hilbert symbols for Hasse. This avoids treating the unstabilized Hasse invariant as a Witt invariant. The arithmetic script tested every coordinate triple in the multiplication identity, not only its three generators.

The finite-field calculation also searched for actual vanishing planes: over 𝔽₂ a basis for a Lagrangian in B⊥B is ((0,1,0,1),(1,0,1,0)); no independent isotropic orthogonal pair exists in B⊥H. Over 𝔽₄, B⊥H has 76 zeros and a vanishing plane spanned by (0,0,0,1),(1,ζ,0,0), agreeing with the now-equal trace coordinates. These checks cover both directions of the iff and unequal dimensions rather than just equality of two formulas.

**Pinned-library and duplication audit.** Pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following declarations and their surrounding hypotheses were opened directly; paths are relative to the respective library repository.

| Pinned file and line | Declarations / content inspected | Consequence for this review |
| --- | --- | --- |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:146,317,628,1056,1410` | `QuadraticMap`, `polarBilin`, `proj`, `Anisotropic`, `weightedSumSquares` | A quadratic map has homogeneity and a bilinear companion; perfect polar and finite projectivity are additional conditions. |
| `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:46`; `Prod.lean:55` | `QuadraticMap.Equivalent`, `QuadraticMap.prod` | Actual isometry and orthogonal sum carriers used by the Lean classification. |
| `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:39,127,158`; `Mathlib/LinearAlgebra/TensorProduct/Basis.lean:63,73` | `QuadraticForm.baseChange`, root `baseChange_ext`, `Module.Basis.baseChange`, `baseChange_apply` | The constructor needs invertible two; tensor-product forms, bases and uniqueness do not. This is the witness for R01. |
| `Mathlib/RingTheory/Trace/Defs.lean:71,110,137`; `Mathlib/FieldTheory/Finite/Trace.lean:49` | `Algebra.trace`, `trace_algebraMap`, `trace_trace`, finite-field `algebraMap_trace_eq_sum_pow` | Trace normalization and degree multiplication use the genuine field trace; zero-dimensional forms give empty sums. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:171,364`; `Algebra.lean:431` | `AdicCompletion`, `AdicCompletion.of`, `ofAlgEquiv` | Inverse-limit subtype, canonical map and algebra structure; the definition alone does not promise completeness for arbitrary ideals. |
| `Mathlib/RingTheory/Ideal/Quotient/Operations.lean:325` | `Ideal.quotientMulEquivQuotientProd` | Requires coprimality; used on distinct prime powers. |
| `Mathlib/RingTheory/ClassGroup/Basic.lean:347,353`; `Mathlib/RingTheory/PicardGroup.lean:876` | `ClassGroup.mk0_surjective`, `mk_eq_one_iff`, `equivPic` | Dedekind integral representatives, principal-class criterion, Picard comparison. No characteristic restriction added. |
| `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:126`; `PID.lean:34`; `Three.lean:50`; `Ideal.lean:291,311` | integral closure for a primitive prime root; `three_pid`; `Three.Units.mem`; inertia and ramification formulas | With conductor 3 and prime 2, order of 2 mod 3 is 2 and ramification is 1; six-unit and PID assertions match. |
| `Mathlib/Algebra/CharP/Invertible.lean:124` | `invertibleTwo` | Applies to ℚ₂, not to the finite characteristic-two carriers. |
| `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean:189`; `Witt/Ring.lean:218,288,386`; `Witt/FundamentalIdeal.lean:89` | `regularFormSetoid`, `WittRing`, `wittClass`, `WittRing.dimMod2`, `oneFoldPfisterClass` | WittRing needs a field with invertible two; its quotient kills hyperbolic classes. Pfister sign is ⟨1,−a⟩. The diagonal isometry setoid by itself is not a characteristic-two quadratic Witt group. |
| `TauCeti/LinearAlgebra/QuadraticForm/Witt/BaseChange.lean:211`; `Transfer/Witt.lean:147,186` | `WittRing.baseChange`, `scharlauTransfer`, `scharlauTransfer_baseChange_mul` | Native field restriction and additive transfer with nonzero functional and finite-dimensional extension; projection formula, not multiplicativity of transfer. |
| `TauCeti/NumberTheory/LocalField/QuadraticForm/PadicTwo.lean:150`; `Classification.lean:129`; `Hasse.lean:91` | `hilbertSymbol_padicTwo`, `RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq`, `localHasse` | Classification retains rank, valuation/local-topology and invertible-two hypotheses; Hasse convention agrees with the computed checks. |
| `TauCeti/RingTheory/DedekindDomain/AdicValuation/Completion.lean:367,434` | `HeightOneSpectrum.isAdicComplete_adicCompletionIntegers`, `residueFieldEquivAdicCompletionIntegers` | Complete local integers and residue comparison over arbitrary Dedekind domains, without residue finiteness. |
| `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63` | `TauCeti.IntegralLattice` | Rational ambient lattice, symmetric integral form and lattice condition; evenness/unimodularity are not automatic fields of the structure. |

Object searches included Witt quotients, Pfister generators, local classification, restriction/transfer kernels, Arf invariants, integral forms, dyadic completion and quadratic rigidity. No native theorem matching any of the three retained headlines was found. The new ℚ₂ coordinate and multiplication statements genuinely add the explicit presentation; they are not the native local classification restated. Generic trace transitivity, tensor-basis transport, field Witt carriers, completions and transfers stay with their existing owners.

The open-roadmap search tool and direct searches of the supplied sibling checkouts and board packages were used. No other folder declares the three fully qualified headline names; hits in the package copy and this PR's checkout are copies of this same roadmap. The F₂ Arf theorem belongs to the hermitian supplier, while this roadmap extends it to all finite characteristic-two fields. ArithmeticKTheory owns the general Dedekind tables and total-cokernel extension; this roadmap consumes those and supplies explicit images and arithmetic quotients. No ownership move is required.

**Resolved supplier citations.** Main was used for existing roadmaps, rather than proposed revisions. For suppliers absent from main, the available new-roadmap head was inspected using `roadmaps show`. Numbers below refer to README lines (the show output's wrapper line is excluded).

| Supplier | Resolved sections and file/line witnesses | Consumed object and convention |
| --- | --- | --- |
| GeometryOfNumbersAndQuadraticArithmetic | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`, §6.1a at 2252; §§6.2–6.5; §6.8a at 2934; §6.9 at 3071; §6.10a at 3173 | Shared spectra and detection; exact Witt carriers; derived coefficients, norm and fundamental fibre sequence, localization and filtered colimits; residue shift −1, valuation overring and nonprincipal primes; integer tables with signature and signature/8. |
| HermitianKTheoryOfPoincareCategories | `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md`, §1.6 at 304; §3.4 at 498; §§4.5–4.6 at 600,627; §6.6 at 1017; §7.9 at 1179 | Classical quadratic quotient, surgery and controlled comparisons, symmetric Dedekind L₀, F₂ Arf and field calculations. Shift conventions agree after four-periodicity. |
| ArithmeticKTheory | `TauCetiRoadmap/ArithmeticKTheory/README.md`, §§1.1–1.3 at 515,558,600; §2.2 at 736; §3.5 at 1247 | Localized Picard/Steinitz inputs, inverse-ideal boundary convention, quadratic injection, both tables and actual completion pullback. Inverse class and class agree modulo 2. |
| QuadraticFormInvariants, main | `TauCetiRoadmap/QuadraticFormInvariants/README.md:1338,1600,2797`, Layers 4,6,9 | Native field Witt tensor/base change, local classification including ℚ₂ extensions, Scharlau transfer and projection formula. Its scope is characteristic different from two, not just positive odd characteristic. |
| GlobalQuadraticForms, main | `TauCetiRoadmap/GlobalQuadraticForms/README.md:875,892,901`, §§8.1–8.3; §4.4 and Layers 2–4 | Number-field local/global invariants, hyperbolicity and Witt injectivity, Hilbert product formula. No characteristic-two global-function-field claim is imported. |
| KTheoryFiniteLocalFields | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:300`, §1.7 | Perfect characteristic-two symmetric comparison sends the unit line to the unit line; it does not supply quadratic Arf base change. |
| Lattice suppliers, main | `Completed/IntegralLattices/README.md:35,67,327,363,382`; `TauCetiRoadmap/IntegralLattices/README.md:693,728`, milestones 1I,1L | Rational lattice/dual, half-norm, E₈ and signature divisibility. The modulo-two refinement computation is additional here. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:969,1032,1069,1090,1395`, §§0.12–0.15,0.21 | Henselization, quotient powers, Noetherianity, smooth lifting, Popescu, regular maps and G-rings. The local-completion statement does not subsume the declared ideal-adic gap. |
| GeneralAlgebraicKTheory | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:2403,2426,2634`, §§11.3–11.4,11.15 | Dense subcategories classified by K₀ image and ordinary localization; density does not imply K₀ surjectivity. |

All four declared gaps have matching slugs and needs sentences in `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/design/plan.json` and the target README at lines 55,57,71,85. Each has a named earlier supplier. Their hypotheses identify the missing results: bounded power torsion for the derived square; coefficient comparison, Ore, cofiber and Tate-boundary conditions for change of rings; nonsquare radicand and trace-zero nonzero functional for the quadratic-extension Witt sequence; Noetherian G-ring and ideal for completion/henselization regularity. The last contract supplies the two linked steps of the same henselian-to-complete argument. These contracts are not findings. Searches did not find the requested derived/Poincaré theorem, complete Witt exact sequence, or ideal-adic G-ring regularity already supplied at the pins or cited supplier sections. Any eventual acceptance remains conditional on these four declared contracts, as permitted by the brief.

**Headline inventory and Lean form.** The three included headlines are §0.4's complete finite-field Arf classification and §4.1's additive ℚ₂ presentation and multiplication-by-c formula. Other endpoint families are the integral comparison/injection/residue theory; characteristic-two and DVR L-tables; arithmetic fracture and complete/henselian quadratic rigidity; degree-three extension, finiteness, parity obstruction and nondyadic localization; integral dyadic comparison; and the Eisenstein symmetric group, restriction comparison, quadratic image and L-tables. The docstring identifies their absent integral Witt, general noncommutative quadratic/Poincaré or L-spectrum carriers. The integer L-tables and field computations are expressly supplied results, not new Lean targets. The E₈ 136-vector count remains a README Check of the integral refinement comparison. R01 concerns the explicitly named Arf extension headline whose native statement is available despite the constructor restriction.

A scratch copy with `#check @name` for each of the three declarations elaborated successfully. The finite field, characteristic, scalar algebra, finite-dimensional modules, bases and all six polar identities survive in the first type. The other two types retain the native Witt ring, the specified nonzero units and the finite cyclic coefficient types. No section binder was lost; no signature repair is needed for the three existing declarations.

In a separate scratch copy, each `sorry` was replaced by alternatives that require `simp`, `rfl`, or `infer_instance` to close the whole goal. All three declarations resisted all three tactics. Reading the pinned declarations supplied no single existing lemma with any of the three conclusions. No padding finding is raised. The original file has only `import Mathlib` and its used Tau Ceti module, no sorry'd data, no `set_option`, no admitted examples and no competing carrier definitions. README names and declared names agree. Definitions have their mathematical API and discriminating checks; all six layers have Examples and Dependencies sections.

## Not verifiable

- **Wall-1973**, Corollary 1, Lemma 1, Proposition 4 and Lemma 5: the manifest and brief settle this as uncertified publisher-only material. No new access request was made. CDHHLMNNS-III-v4 line 2019 states exactly how the degree-one surjections and kernel surjection enter Proposition 2.3.7, but that does not independently certify Wall's original proofs or pagination.
- **Lam-2005**, VI Theorem 2.29 and VII Theorem 3.5: settled uncertified AMS book; the recorded publisher lookup obtained no legal open text. CDHHLMNNS-III-v4 line 2094, line 2120 and line 2175 state the applications. Local invariant computations in this review verify the concrete ℚ₂ arithmetic; they do not certify the book's theorem numbering or the full general exactness theorem.
- **Scharlau-1985**, Chapter 6 §6, Theorem 6.11: settled uncertified Springer book; no new request. CDHHLMNNS-III-v4 line 1930 attributes the global-function-field extension to it. The cited book's original statement and page were not independently checked.

No other cited source is outstanding. The five available source texts were read from the supplied legal cache; no manifest was edited, no source was renamed, and no settled text was reopened for acquisition. The missing original texts above are verification limitations, not new supplier gaps or blocking findings.

## Source issues

- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.46 (line 2156): the source says avoiding the discriminant makes two prime; it should be irreducibility modulo two proves inertness, whereas avoiding the discriminant proves only unramifiedness; affects the proof.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.47 (line 2180): the source says the annihilator of ⟨1,3⟩ is generated by 2⟨1⟩ and ⟨1,−2⟩; it should be generated by 2⟨1⟩ and ⟨1,3⟩, equivalently 2⟨1⟩ and ⟨1,−3⟩; affects a stated result.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed pp.46–47 (line 2163 and line 2202): the source says quadratic base change preserves the residue generator, giving Eisenstein Lq₀=ℤ/2 and Lq₃=ℤ/4⊕ℤ/2; it should be quadratic base change is zero, and the additional local quadratic image gives Lq₀=0 and Lq₃=ℤ/4; affects a stated result.
- **Misprint** in CDHHLMNNS-II-v5 at Proposition 4.5.5(iv), printed p.109 (line 5262): the source says the second Ore pair uses the source ring; it should be the image multiplicative set paired with the target ring; affects the proof.
- **Misprint** in CDHHLMNNS-II-v5 at the note following Proposition 4.5.5, printed p.109 (line 5276): the source says condition iv is equivalent to the kernel-and-cokernel comparison; it should be condition iii, the cofiber-equivalence condition; affects nothing.
- **Misprint** in CDHHLMNNS-III-v4 at Theorem 2.2.4 proof, printed p.38 (line 1723): the source says the finite-subset colimit indexes subsets with the ambient set finite; it should be the indexing subset S′ that is finite; affects nothing.
- **Error** in CDHHLMNNS-III-v4 at Remark 2.3.15, printed p.47 (line 2211): the source says every nondyadic residue field has odd characteristic; it should be characteristic different from two, including zero, as for ℚ[t] at (t); affects the proof.
