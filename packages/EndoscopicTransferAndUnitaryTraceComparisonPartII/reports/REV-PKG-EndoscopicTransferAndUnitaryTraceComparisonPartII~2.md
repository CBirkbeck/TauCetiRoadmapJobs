# Review of EndoscopicTransferAndUnitaryTraceComparisonPartII (package, round 2)

**Verdict:** needs changes

Three findings: one P2 and two P3. All five previous findings are repaired. The new blocking finding is a dropped hypothesis in the generalized nilpotent descent statement, not a failure of the final fundamental lemma. The four reviewed package files were left unchanged.

## R01 (P2) — Descent must zero the split-factor coordinates

**Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:568`: “at the truncated arguments u=(v_a,0), u*=(0,u_b*) with u_b* cyclic on the b-block”.

**Claim.** These arguments define the generalized nilpotent distribution of §3.2 for every separable disjoint block spectrum, and satisfy the stated descent identity.

**Witness.** Xiao18 line 150 requires zero vectors on split factors; Lemma 5.1, line 1015, retains that condition. For F=ℚ₃, E=ℚ₃(√2), a=2,b=1, the quotient integrand below takes 1 and 0 on one coset.

**Exact repair.** Keep the full cyclic vectors for the determinant identity. For the distribution, separately decompose F[x_a] and F[x_b] into field factors, set Σ=S₁(a), retain v_i only for i∈S₁(a), and retain the covectors only for i∈S₁(b). Set both coordinates to zero on every factor outside S₁. State the descent identity for these arguments, using precisely §3.2's distributions in each block. Carry that choice into §3.6's proof route. Do not impose S₂=∅: the mixed case is needed in the general endoscopic comparison. Add the mixed-factor negative control below. With the corrected u=0 in that instance, the old test gives 0 at both representatives; a test supported near the zero vector instead gives 1 at both. The determinant identity and the factor |D_ab|⁻¹ remain unchanged.

## R02 (P3) — A consistent dictionary change does not reverse the full operator

**Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:824`: “the opposite dictionary would give the opposite sign”.

**Claim.** Replacing U_i↦−T_i by U_i↦T_i in every rank reverses ξ_X(e_(1,0)).

**Witness.** With the opposite dictionary H₂(e_(1,0))=T_(1,0), but H₁(e₁)=−T₁. Applying both inverse rank-one transforms still gives −(e₁⊗e₀+e₀⊗e₁), exactly the original value.

**Exact repair.** Replace the last clause by an explicit distinction between a consistent change and a mixed convention: changing all dictionaries leaves ξ_X unchanged; changing H₂ alone while retaining the old H₁ inverses gives the opposite sign. The Check can discriminate against that mixed convention. Keep the preceding value and the examples on line 828. Tested on e_(1,0), both consistent choices give the negative sum; the mixed choice gives the positive sum. More generally, simultaneous sign substitution commutes with the Levi substitution, so it cancels in the conjugated operator. The rank-one and rank-two Checks of H itself in §2.3 remain valid.

## R03 (P3) — Two retained definitions lack their API lists

**Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:437` and `:749`: “Define ξ_F on the spherical Hecke algebra”; “let c_n,d∈H_n,E be the indicator”.

**Claim.** The two new objects are specified with their required definition APIs.

**Witness.** Between headings §§2.2 and 2.3, and between §§4.8 and 4.9, there are three Checks each but no API bullet list.

**Exact repair.** Add prose API bullets without inventing Lean names. For ξ_F give the domain H_n,F, codomain H_a,F⊗H_b,F, normalized descent and determinant twists, its Satake substitution, and the base-change square. For c_n,d give the integral determinant-shell support and finite double-coset expansion, c_n,0=1_K, the displayed Satake formula, its contraction grade and its Levi degree decomposition. These are the existing mathematical assertions reorganized as the required APIs. Preserve the Checks. Their numerical tests remain q⁻¹X² on either route through the square and, at a=b=1,d=2, X²+XY+Y² on either side of the degree decomposition.

## Previous findings, checked individually

The prior report is `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/reports/REV-PKG-EndoscopicTransferAndUnitaryTraceComparisonPartII.md`; the repair report is `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/reports/FIX-PKG-EndoscopicTransferAndUnitaryTraceComparisonPartII~2.md`. None of its findings was marked not actionable.

| Prior finding | Repaired passage in README | Status and verification |
|---|---|---|
| F01, stale pins | Lines 39,43: “At the pinned Mathlib, consume”; “At the pinned Tau Ceti, consume” | Repaired. No hash remains. All eleven named library declarations were opened at the manifest pins, listed below. |
| F02, quotient side | Line 221: “over the coset space H_X∖(U(W₁)×U(W₂))” | Repaired. Left translation cancels t₁⁻¹Xt₂=X. The nonabelian rank-two right-coset counterexample still fails, as it should. |
| F03, consumer overclaim | Line 836: “No other roadmap names this roadmap as a supplier.” | Repaired. Fresh roadmap-name search returned no match on main or any open head. GanGrossPrasadUnitaryGroups names the base roadmap for its relative contracts. |
| F04, norm criterion | Line 43: “a nonzero element of the bottom field is a norm exactly when the inertia degree divides its normalized valuation” | Repaired. The pinned theorem quantifies x:Kˣ. For degree two the valuations 0,1,2 give norm, nonnorm, norm. |
| F05, rank zero | Line 25: “and as the one-point spaces X_0 and Herm(V_0) of §§2.1 and 4.7” | Repaired. Empty determinant and self-density are 1; one orbit and one self-dual overlattice; the only nonzero grade is zero. |

Pattern searches covered the other occurrences of RO, quotient integration, the norm criterion, rank zero, consumer assertions and pin wording. No recurrence of F01–F05 was found. R01–R03 are new findings, not re-raised settled findings.

## Verified sound

### Scope and principles

Read all 36 numbered sections, their APIs, Checks, proof routes and dependency lines, the conventions and supplier contracts, the six layer examples/dependencies, and all source-correction paragraphs. For unchanged material, the previous report's numerical rows supply the permitted baseline; narrative-only coverage was not treated as evidence. In particular §§1.4, 3.1 and 4.5 received explicit computations below, and the new source sample was read afresh. The prior rank-one descent row did not test a split factor of E⊗F F_i; R01 supplies that missing adversarial instance.

The roadmap extends its base at symmetric-space endoscopy. It imports ordinary endoscopy, Hermitian carriers and lattice theory, Satake/descent, quotient measures, and Weil operators instead of reconstructing them. Its spherical theorems retain residue characteristic two; the general determinant identity retains ramified E. No algorithm, copied source passage, sorry'd data, set_option, route-specific prime restriction or upward supply was found. The organization uses mathematical objects, not chapter names: contraction feeds relative transfer, the spherical module feeds descent/Weil reductions, these feed the unit theorem, and the final algebraic operator uses the earlier Fourier module. It does not assert unrestricted relative transfer or full-module orbital transfer.

### Seeded source sample: all 15 locators read

No locator is labelled unverified by the author. All five cited works have a single certified manifest entry; the arXiv version/pagination is explicit where it differs from publication pagination. No source fetch or manifest alteration was necessary.

| Target | Source text opened, with pagination | Verification |
|---|---|---|
| 0.3 invariant quotients | Leslie25 lines 556–581, Proposition 2.1 and Lemma 2.2, p.14 | Quotient by the second unitary group and then both groups; characteristic coefficients. The direct polynomial proof in the README works after splitting and descends. No rational-surjectivity claim. |
| 0.7 relative orbital integrals | Leslie25 lines 611–616, equation (2.3), p.15; lines 657–671, Lemma 2.5, p.16 | Left quotient and integrand agree. Regularity and compatible torus measures retained; convergence justified through contraction/cutoff. |
| 0.8 pushforward | Leslie25 lines 640–651, equation (2.4), p.16; Leslie19 lines 742–743 and 1379–1393, Proposition A.3, pp.25–26 | Compact invertible support, local sections and onto image; general support is only relatively compact in the ambient Hermitian space. |
| 1.1 relative data | Leslie25 lines 801–822, §2.3, p.20 | Ordinary datum plus two form labels, direct-sum symmetric representation and its contraction. Positive block ranks avoid the source's rank-zero count error. Split étale exclusion is correct. |
| 1.4 transfer relation | Leslie25 lines 842–848, Definition 2.10, p.21 | Matching identity AND unmatched-zero clause, with the stated direction of Δ_rel. |
| 1.5 invertible-support transfer | Leslie19 lines 699–739, Proposition 4.5, p.15, and lines 1379–1393, Proposition A.3; Leslie25 lines 849–850, p.21 | Source supports the restricted existence theorem. The README's compact invariant cutoff makes the invertible extension/lifting argument precise. |
| 3.1 orbit torsor | Leslie25 lines 1554–1586 and 1612–1623, Proposition 4.5/Lemma 4.6, pp.35–36; Xiao18 lines 486–504 and 929–946, Proposition 3.8/Lemma 4.6, pp.11–12,20 | Both-form union, norm quotient, complementary-coordinate character; S₁=∅ gives one orbit, not two. |
| 3.4 additive descent | Leslie25 lines 1685–1705, Definition 4.9, p.38, and 1755–1815, p.39 | No modulus half in additive definition; change of variable supplies |det m₁|^b and gives the twisted normalized group descent. |
| 3.5 factors/Jacobian | Xiao18 lines 1014–1029, Lemma 5.1, pp.21–22; lines 147–150, hypotheses before (2), p.4; lines 1175–1187, p.24 | Determinant sign correction is correct. The descent source expressly retains the split-factor zero condition; README drops it: R01. |
| 3.7 Weil action on the sum | Leslie25 lines 1910–1914, Proposition 5.1, p.41, and 1960–1968, p.43; BP21 lines 297–303, 337–338, 366–381, pp.6–8 | Agreement on intersection gives a well-defined action on the sum. BP21 uses the sum for the defect. Trace kernel is bilinear. |
| 4.2 cyclic pushforward | Leslie25 lines 1258–1296, Lemma 3.11, pp.29–30 | Positive Gram pushforward, unit computation and module convolution. §4.1 correctly reconciles the minus sign by a norm-minus-one unit. |
| 4.5 augmented spherical transfer | Leslie25 lines 1920–1924 and 2000–2008, Proposition 5.2/Theorem 5.3, pp.42–43 | All positive ranks and other-form zero component; reduction through §3.8 and independent product comparison. |
| 4.8 determinant degrees | Leslie25 lines 1297–1376, Proposition 3.12, (3.9)–(3.10), pp.30–31 | q^(d(n−1))h_d, degree convolution and block sum. q is the F-residue cardinality, so q_E=q². |
| 4.9 equivalence | Leslie25 lines 1248–1255, Corollary 3.10, p.29; Lemma 2.5, lines 657–671 | The README correctly quantifies all four form-label pairs simultaneously; a single image does not cover the ordinary target. |
| 4.10 FJ fundamental lemma | Leslie25 lines 856–875, Theorem 2.12, p.21; Proposition 3.12 above; lines 4019–4058, §11.2, p.86 | Unramified characteristic-zero local fields, hyperspecial volume one, reference tensor unit and three zero components. No odd-residue restriction. |

### Computed adversarial table

Here q≥2, π is a uniformizer and all test values use the specified volume-one normalizations unless a row explicitly rescales them. Rows give actual values; excluded inputs are identified rather than silently admitted. The table includes every seeded target, the five headlines, the repaired statements and all newly affected targets. The unchanged numerical checks also document how the previous review's evidence was used.

| Statement | Instances tried | Values computed on both sides / wrong model | Result / change |
|---|---|---|---|
| Conventions and F04/F05 | Unramified degree two; v(x)=0,1,2; n=0; q=2 | 2 divides 0, not 1, divides 2; N(π)=π². Empty determinant=1, empty density=1, one orbit. q_E=4, abs(π)_E=1/4. | Repaired statements agree. q=1 and characteristic-p fields are outside scope. |
| 0.1 block representation | Rank one X=1; split (g,h)=(2,1) | δ²=−I and δ*=−δ; (A,B)=(1,1) maps to (2,1/2), product 1. Wrong second action gives product 4. | Correct. |
| 0.2 contractions | Forms ⟨1⟩,⟨ε⟩; standard diag(1,π); split (1,0) | At 1, −ε⁻¹ on both contractions; standard charpoly=(T+1)(T+π²) on both; split product and contraction=0. | Correct; square charpoly identity is imported. |
| 0.3 quotient | Split A=0,B=1 and A=1,B=0; section (−Z,I) | Both invariant values=0 but orbits differ; −(−Z)I=Z; Z=diag(1,π) gives T²−(1+π)T+π. | Correct; determinant alone loses 1+π. |
| 0.4 regularity | Rank-one z=0,1; split A=diag(1,0),B=I | Block charpolys T², T²+1, T²(T²+1); zero eigenvalue gives a double zero root. | Correct; no zero determinant division used. |
| 0.5 torsor | Unramified rank one; split fibre at T≠0 | −1 lifts, −π does not; split fibre (u,−T/u) has product −T and a free transitive F× action. | Algebraic torsor does not imply F-point surjectivity. |
| 0.6 cutoffs/lifts | f=1_O_E, B=O_F×; chart volume 2 | Cutoff is 1_O_E×; integral of (1/2)1_(B×J)=1_B, versus 2·1_B without normalization. | Correct; vol(J)>0. |
| 0.7 / F02 | X=diag(1,π), h=(I,w), t=diag(u,1) with u≠1 in U(1) | Left translation gives Y=[[0,1],[π,0]] twice; right translation gives [[0,u⁻¹],[πu,0]]≠Y. Measure factors (1,1,2) and (2,3,4) give 1/2 and 3/2. | Left quotient repair correct. |
| 0.8 pushforward | Rank-one lattice and unit-lattice tests | At t=−π^(2j), j≥0, value=1; odd/negative valuations give 0. Unit-lattice test gives 1 exactly at v(t)=0. | General support accumulates at zero; invertible-support result is correct. |
| 0.9 orbital comparison | X=1,π,π⁻¹ | Relative values (1,1,0); ordinary values at −1,−π²,−π⁻² also (1,1,0). Torus measure times 2 gives (1/2,1/2,0) on both. | Correct. |
| 1.1 data | a=b=1 over a field; split E | Four label pairs; at nonnorm β, second contraction at 1 is −β⁻¹ instead of −1. Split dual-center dimensions are 2 and 1, so proper block datum is not elliptic. | Correct. |
| 1.2 factor | a=b=1; difference π, unit, zero | Nice factors −q⁻¹,1; zero difference is excluded by ambient regularity. At q=2 first value=−1/2. | Correct. |
| 1.3 sums | C₂ with orbital values 2,5 | Stable sum 7; nontrivial weighted sum −3; moved base gives 3=(−1)⁻¹(−3). | Correct. |
| 1.4 transfer | q=2, source κ-value A=2; unmatched orbit | Required target −A/q=−1, not 2; unmatched target must be 0, not 1. Adding a stable-null test changes B to B+0=B. | Both conditions independently tested. |
| 1.5 invertible transfer | Rank-one unit support; target chart vol=2 | Pushforward 1_O_E×→1_O_F×; 1_O_E has values 1 at π^(2j) tending to zero; normalized lift integrates to 1_B rather than 2·1_B. | Restricted hypothesis necessary; no general smooth-transfer overclaim. |
| 2.1 spherical module | n=0,1; d=±1; j=0,1 | n=0 basis size 1. Rank-one Hecke action e_j→e_(j+2d); e_−1 and e_1 both nonzero, disjoint from e_0. | Negative coweights and both forms retained. |
| 2.2 base change / R03 | a=b=1, q=2 | Square after q^−1/2 substitution and substitute after square both give X²/2. Z₁Z₂ under ξ_E gives XY/4. BC(T_(1,0),E)=T_(2,0),F−T_(1,1),F. | Mathematics correct; add API list. |
| 2.3 Fourier headline | Rank one j=1; rank two λ=(1,0),(2,0),(1,1) | ê₁=−U→T. Rank two transforms are √q(U₁+U₂), q(U₁²+U₂²)+(q+1)U₁U₂, −U₁U₂. Hence H₂(e_(1,0))=−T_(1,0),F; cyclic grade transforms to q(T₁²+T₂²). Module ranks at n=0,1,2 are 1,2,4. | Retains prior computed Fourier rows. No claim that H(e_λ)=T_λ in every rank. |
| 3.1 torsor | S₁ empty, size one, size two | Norm-quotient sizes 1,2,4. For ζ=(ε,1), κ_{1}=1 and κ_{2}=−1; complement reversal interchanges them. | Correct, including split E_i inside a nonsplit E/F. |
| 3.2 regularized distribution | Rank-one vector shells O×,πO×,O | Tate values 1,−1,1/(1+q^−s) at s=0=1/2. Split-factor vector entries in its definition are 0. | Definition correct; §3.5 must use it consistently. |
| 3.3 inversion | r=0,1,2; rank-one v=1 then π | Character-table products I,2I,4I. Reference/other orbital values (1,0) invert to 1/2; rescaling gives ω=−1,G=−1/2, product 1/2. | Averaging factor necessary. |
| 3.4 additive descent | a=b=1, m₁=π; integral matrix/vector test | Additive measure factor q⁻¹; twisted normalized factor abs(m₁)^1/2 abs(m₂)^1/2 δ_P^1/2=abs(m₁)=q⁻¹. Lattice descent at integral vectors gives 1, at a nonintegral coordinate 0. | Correct. |
| 3.5 ordered determinant | a=b=1; ℚ₃(√3), x_a=0,x_b=1 | D=−1, cyclic determinant=1; η((−1)D)=1 whereas η(D)=−1. For D=π unramified, off-block modulus=q⁻¹, inverse Jacobian=q. | Sign and Jacobian correct. |
| 3.5 mixed-factor descent / R01 | F=ℚ₃,E=F(√2), x=diag([[0,2],[1,0]],1), a=2,b=1 | F[x]=E×F, S₁={b}; D=−1 and full cyclic determinant=−1. At g=I and g=diag(3,3,1) the proposed inner integrand gives 1 and 0 on the same G/T coset. | Invalid without split-factor truncation. Corrected u=0 gives (0,0) for that test and (1,1) for the zero-vector positive control. |
| 3.6 reduction | Two nonsplit scalar blocks | r_n=2=1+1; 2⁻²=(2⁻¹)(2⁻¹). Reference/reference term plus three zero terms. For D=π the factor is −q⁻¹, not −1. | Correct normalization; carry R01's general arguments into the route. |
| 3.7 sum action | Two decompositions differing by C; trace kernel at 1,1,1 | W_GL C−W_U C=0. If intersection=0, nonzero A−B is outside it. Tr(2)=4=2+2; norm gives 4≠1+1. | Correct extension and bilinear kernel. |
| 3.8 Weil reduction | q(a)=π and unit; n(π⁻¹), opposite n(−π) | On supported defect ψ(tπ)=1 for t∈π⁻¹O; a unit admits ψ(tq(a))≠1. Product of three unipotents is [[0,π⁻¹],[−π,0]]; diagonal conjugation scales t by π⁻² and exhausts F. | Correct; integral projector has p²=p without division by 2. |
| 4.1 sign transport | N(c)=−1; X=diag(1,π); ramified ℚ₃(√3) | r₋(cX)=diag(1,π²)=r₊(X); a norm-one scalar instead gives negative diagonal. Ramified unit norms modulo 3 are squares, so −1=2 is excluded. | Correct unramified scope. |
| 4.2 cyclic embedding | Rank-one shells d=1,−1, odd target valuation | Pushforwards and cyclic images e₂,e_−2; both vanish at odd valuation. | Correct. |
| 4.3 product contraction | vol K_m=1,2; m=0 | Integral gives φ,2φ respectively; trivial-group integral gives φ. Ω(I,γ₂)=ω(γ₂), and rank-one factor=η(1)=1. | Correct normalized contraction. |
| 4.4 adjacent-rank headline | n=1, φ=1_(π^dO_E×) | Both sides are 1_(π^(2d)O_F×); at odd valuation both 0; ω=1. | Correct boundary and factor. Higher-rank input is the declared independent gap. |
| 4.5 augmented transfer | n=1, unit scalar x, v=v*=1; φ=π-shell | Normalized linear integral over units=1, unitary integral=1; other test=0. Raw singular germ=1/2. Matrix shell π on E gives valuation 2 on both sides; valuation 1 gives 0. | Correct; regular and singular values not conflated. |
| 4.6 cyclic headline | φ=1_K and c_2,1 | Unit pair e₀ and e₀⊗e₀. Degree-one E shell gives e₂⊗e₀+e₀⊗e₂. Rank-one e₁ is outside the even-index span. | Correct cyclic scope. |
| 4.7 lattice grades | n=0,1,2; Gram diag(π²,1),πI₂ | Rank zero count=density=1. Rank-one grades −1,0,1,2 give 0,e₀,0,e₂. Rank-two overlattice counts 1,q+1 give e_(2,0)+(q+1)e_(1,1). At q=2 counts are 1,3. | Correct finite grades; whole positive-rank function noncompact. |
| 4.8 degrees / R03 | a=b=1, d=0,1,2 | 1→1; q(Z₁+Z₂)→X+Y; q²h₂→X²+XY+Y². General exponent d(n−1)−bd_a−ad_b=d_a(a−1)+d_b(b−1). | Correct formula; add API list. |
| 4.9 equivalence | Four label images; grade 2; source doubled on single (π,1) datum | At valuations (2,0) target=1, at (1,1) target=0. Odd/even pair cannot match even source determinant, so single-datum assertion survives doubling, but reference identity demands 2 rather than 1. | Simultaneous quantifier is necessary and present. |
| 4.10 FJ headline | a=b=1, four labels; q=2, difference π | Targets (tensor unit,0,0,0); nice factor −1/2. Grade 2 gives two tensor terms, each coefficient 1. | Correct endpoint statement; R01 affects the proposed general descent input. |
| 5.1 operator headline / R02 | e₀,e_(1,0),e_(1,1),e_(2,2); q=2 | Values e₀⊗e₀, −(e₁⊗e₀+e₀⊗e₁), −(1/2)e₁⊗e₁, (1/4)e₂⊗e₂. Consistent opposite dictionaries give the SAME values; changing only H₂ reverses the degree-one value. | Main formulas correct; repair the convention-discrimination Check. |

For reproducibility of R01, put O=ℤ₃, e₁=(1,0,0), and use the compact locally constant test

`f(z,v,l)=1_(x+3M₃(O))(z) · 1_(e₁+3O³)(v) · 1_(O²×O×)(l)`.

The upper block has polynomial T²−2, so E⊗F E is split; the lower block is the scalar 1. The full reference vector (1,0,1) has cyclic matrix [[1,0,2],[0,1,0],[1,1,1]], determinant −1. The proposed truncated vector is e₁ and covector is e₃*. In §3.2's inner integral T₁ acts only on the last coordinate. At g=I the covector test restricts t to O× and the integral is 1. At g=diag(3,3,1), which centralizes x and represents the same coset, the vector is 3e₁ and the test is 0. The extra twist is η(det g)=η(9)=1, so it cannot fix the discrepancy. With the repaired vector u=0 the first test vanishes for both; replacing its vector factor by 1_(3O³) gives 1 for both. This tests both exclusion of the wrong arguments and well-definedness of the repaired ones.

### Pinned library and acceptance-test audit

The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the following declarations and their surrounding binders, rather than relying on the prior report's older pins:

| Library file and line | Declaration and checked content |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43` | `Matrix.conjTranspose`: transpose then entrywise star, including rectangular matrices. |
| `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:45` | `Matrix.IsHermitian`: exactly Aᴴ=A; no nondegeneracy, field or topology bundled. |
| Same file, lines 286,290 | `Matrix.isHermitian_mul_conjTranspose_self`, `Matrix.isHermitian_conjTranspose_mul_self`: rectangular Hermitian products under the displayed star-ring assumptions. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`, `:279` | `Matrix.charpoly`, `Matrix.charpoly_mul_comm`: determinant of TI−A and equality for square AB/BA over the commutative coefficient ring. |
| `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312` | `MvPolynomial.hsymm`: sum over degree-n symmetric multisets; empty-variable positive degrees vanish, degree zero is 1. |
| `Mathlib/Algebra/MvPolynomial/Monad.lean:67` | `MvPolynomial.bind₁`: the algebra substitution map `aeval f`. |
| `Mathlib/Analysis/Calculus/Implicit.lean:452`, `:465` | `HasStrictFDerivAt.implicitFunction`: complete nontrivially normed field, complete source, finite-dimensional target and full derivative range. Line 159 is the different `ImplicitFunctionData.implicitFunction`, not this declaration. The package cites the correct name. |
| `TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126`, `:158` | `TauCeti.map_normUnits_unitFiltration`, `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`: unramified hypotheses; all filtration depths; x:Kˣ and divisibility of valuation. |
| `TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean:14` | Arithmetic p-local integral Hecke ring and polynomial generators; does not supply the analytic spherical module, orbital integrals or Hironaka transform. |

Object searches at both pins for spherical Hecke/Satake, orbital integrals, Jacquet–Rallis, Friedberg–Jacquet and Hironaka found no carrier implementing these analytic comparisons. The other Satake hits are `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:15`, about roots of a classical newform Euler polynomial. Generic matrix, integral and group carriers alone do not make the headline comparisons statable with a few simple definitions.

The five README headlines are §4.10 (FJ unit theorem), §4.6 (cyclic spherical endoscopy), §4.4 (adjacent-rank Jacquet–Rallis), §2.3 (Hironaka isomorphism) and §5.1 (full Fourier-defined operator). All five are named in the module docstring, with the missing analytic Hecke, orbital-image, matching/factor or Fourier carriers. No statable headline is replaced by an abstract algebra identity. `Suggested.lean` has one `import Mathlib`, one module docstring, the correct namespace, and zero declarations. Thus the one-tactic probe covers **all zero sorried theorems**; the binder-signature check covers **all zero declarations**. Neither has a hidden sample or a failed attempt. No padding, sorry'd definition, placeholder Prop, admitted example or set_option exists.

Ran `lake env lean` on the package's `Suggested.lean` from the content checkout: **exit 0, no output, no warnings and no errors**. No TauCeti import needed building. No Lean process was left running.

### Supplier resolution, ownership and order

Every cross-roadmap citation was resolved anew. Open-head text from `roadmaps show` has a one-line wrapper; the repository line numbers below exclude it.

| Supplier / location | Resolution |
|---|---|
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md`, PR #999 | §§1.1 (166), 1.4 (288), 1.5 (323), 1.14 (555), 1.17 (638), 2.1 (688), 2.4 (764), 2.9 (891), 2.11 (948), 2.12 (979), 3.3 (1141), 4.7 (1855), 4.9 (1912). Crossed-module cohomology, inv, pure-form torsor, centralizers/characters, Lie quotient, orbital sums, transfer and base change all present. §2.12 still has odd unramified hypotheses; the broader formula is correctly a declared gap. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`, PR #851 | §2.7 (703): `IntegralHermitianLattice.ofCarrier` at 705 and `.dual` at 716; §2.9 (769), `SignedHermitianSpace` and `signedHermitianAdjoint` at 773; §3.2 (879) densities, including dyadic analytic theory. The reported unresolved `.ofCarrier` is a roadmap target here, not a missing pinned declaration. Its Hironaka/Siegel-series space differs from X_n. |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, PR #792 | §2.2 (1773), *quotient-measure* (1852) explicitly imports the quotient measure, integrable Weil formula, scaling and stages from AnalyticNumberTheoryPartII §5.3k and adds invariant-Radon uniqueness. The consumed interface is still present; no missing-supplier claim. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, PR #1688 | §SR.4.1 (3191), *satake-isomorphism* (3252); §SR.4.3 (3355), *parabolic-descent* (3422). Normalized descent and the two positive determinant-exponent twists produce q⁻ᵇ and q⁻ᵃ. This is stated for GL_n(E); the F-field analogue in §2.2 is an explicit variant. |
| `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md`, PR #1063 | §2.1 (402), `weilIndex` at 404; §2.5 (520), `weil_generators` at 522; §3.2a (606), `splitHermitianOscillator` at 608. Polar pairings, Weyl scalar and split carrier agree with the contracts. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:640`, main | RG2.0 *smooth-group-analytic-charts*: characteristic-zero local analytic group charts and Jacobians. No F-point-surjectivity assertion is inferred from smoothness alone. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3174`, main | §1.24, affine continuous-semilinear Galois descent; finite Galois splitting of the invariant-ring calculation satisfies its continuity requirement. |

Ownership searches used `roadmaps grep` by object over main and the indexed open heads, together with local package searches and the supplied board-package index. Closest open roadmaps were read: GanGrossPrasadUnitaryGroups #1404, `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:146`–154, places its relative analytic contracts on the base supplier; AutomorphicLFunctionsAndLocalFactorsPartII #1756, its README Scope at line 5, owns doubling and local factors; ExceptionalThetaCorrespondencesForG2 #1736, its README Scope at line 5, owns exceptional theta models. None owns this X_n spherical module or the FJ lattice theorem. The base and Metaplectic scopes agree with the ownership split above. No fully qualified declaration collision is possible in this empty Lean namespace.

The supplied overlap report lists no conflicting head, dropped cited id, id defined only in an open revision, or removed target requiring a numbering map. Its five vocabulary neighbors were checked, rather than treating “no overlaps” as a mathematical ownership proof. No upward edge or two-way ownership was found. Main's SchemeAndStackFoundations and ReductiveGroupsPartII were also the two house-style examples read; revisions of existing roadmaps were not substituted for their main versions.

All seven gap slugs agree between the README's Exact supplier contracts and the plan's top-level gaps. They have named earlier suppliers and precise source/normalization interfaces: jr-local-comparison, jr-weil-descent, jr-product-base-change, unitary-factor-all-quadratic, hermitian-field-classification, unramified-hermitian-lattice-orbits, unramified-unit-vector-transitivity. The first three are distinct local comparison, descended-action and independent spherical-comparison inputs; they are not the relative FJ conclusion. The remaining four cover the stated wider unitary factor/classification or integral isometry/transitivity results, not a second lattice/density carrier. The independent product proof must not assume the FJ theorem. Their absence today is a declared contract, not a finding.

The prescribed dependency command returned:

```text
depcheck: 236 roadmaps, 2138 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The merge order was not edited.

### Shape and policy checks

Six mathematical layers, 36 numbered targets; each has a Needs line and at least three Checks (range 3–7), and every layer ends with Examples and Dependencies. The required top-level sections are present. Two explicit definitions lack the required API lists (R03). No backticked identifier is presented as this roadmap's own Lean declaration: all identifiers resolve to the eleven library declarations or the seven supplier targets listed above; file paths and the expression `Matrix.IsHermitian A` are not declaration claims. No Lean name is absent from the README because the Lean file declares none.

The roadmap contains no machine paths, pull-request numbers, HTML anchors, review/process residue, LaTeX delimiters, algorithmic procedures or `lemma` declarations. Source-correction labels identify mathematical errata, not workflow stages. `metadata.toml` is the math.NT topic; `sources.toml` records exactly the five cited works and the inspected versions. No source entry was removed, rewritten or added.

## Not verifiable

- No seeded source text was unavailable. The report certifies the cited arXiv pagination, not an independently compared Annals or Duke pagination; the manifest already makes that distinction.
- Hironaka99 is an OCR scan. This round retains the prior review's explicitly computed rank-one/rank-two transform and orbit-volume rows; it does not claim to have newly resolved the absolute-value glyph in equation (2.3) that the prior report could not resolve. This is not a new source request or a fabricated normalization check.
- The independent spectral proof in Leslie25 Part 2 is an input of gap:jr-product-base-change, not reconstructed here. Its theorem statement and final contraction into §11.2 were readable and checked. Acceptance after repair would still depend on the seven declared supplier contracts.

## Source issues

The following previously recorded issues were encountered or numerically reconfirmed in this pass. R01 is a dropped source hypothesis in the package, not an error in Xiao's Lemma 5.1.

- **Misprint** in Leslie25 at Remark 4.4, printed p. 35: the source says the transfer appendix contributor's surname is Gordan; it should be Gordon; affects nothing.
- **Misprint** in Leslie25 at proof of Proposition 4.8, printed p. 38: the source says the Hermitian augmented test has matrix factor φ; it should have matrix factor φ∗e_0; affects nothing.
- **Error** in Leslie25 at §5.1, printed p. 40: the source says the Hermitian Fourier kernel uses the norm of the pairing; it should use its trace with self-dual measure; affects the proof.
- **Error** in Leslie25 at proof of Proposition 4.8, printed p. 39: the source says spherical base change has only even-entry coweights; it should allow the nonzero −(q−1) coefficient on the rank-two (1,1) coset; affects the proof.
- **Error** in Leslie25 at Theorem 4.7, printed p. 36: the source says the raw germ is the unaveraged character sum; it should include 2^(−#S₁) with volume-one raw germs; affects a stated result.
- **Error** in Xiao18 at inversion before Theorem 4.7, printed pp. 20–21: the source says inversion uses the character sum without averaging; it should divide by the torsor cardinality 2^#S₁; affects a stated result.
- **Gap** in Leslie25 at proof of Proposition 5.2, printed p. 43: the source says the defect is acted on in the intersection of orbital images; it should first extend the agreeing actions to their sum; affects the proof.
- **Misprint** in Xiao18 at proof of Theorem 6.1, printed p. 24: the source says the ordered cyclic ratio is η(D_ab); it should be η((−1)^(ab)D_ab) with the stated block volume order; affects a stated result.
- **Gap** in Leslie25 at Proposition 4.8, printed pp. 37–38: the source says the spherical hypothesis is in rank n; it should also assume it in the two block ranks used by the proof; affects the proof.
- **Error** in Leslie25 at §2.3, printed p. 20: the source says there are two Hermitian representatives in every rank; it should restrict that count to positive rank, with one at rank zero; affects a stated result.
- **Misprint** in Leslie25 at Lemma 1.8, printed p. 12: the source says the centralizer of an endomorphism of V is taken in U(W); it should say U(V); affects nothing.
- **Misprint** in Leslie25 at §2.2.3, printed p. 19: the source says the embedding in the endoscopic triple is η; it should retain ξ, with η reserved for the quadratic character; affects nothing.
- **Misprint** in Leslie25 at the opening of §3, printed p. 22: the source says the initial reduction has an unresolved proposition reference; it should refer to Proposition 3.12; affects nothing.
- **Misprint** in Leslie25 at §4.1.2, printed p. 32: the source says the Hermitian invariant uses powers of x; it should use powers of its input endomorphism y; affects nothing.
- **Misprint** in Leslie25 at §4.1.4, printed p. 33: the source says the Hermitian block embedding has upper-left entry x; it should have upper-left entry y; affects nothing.
- **Misprint** in Leslie25 at Lemma 3.1, printed p. 23: the source says the E-parabolic modulus uses F-absolute values; it should use normalized E-absolute values on its E-valued determinants; affects nothing.
- **Gap** in Leslie25 at Proposition 4.8, printed p. 38: the source says its four-form sign combination is supplied by Xiao's construction; it should explain the conversion from Xiao18 Theorem 6.1's second-form-dependent signs; affects the proof.
