# Review of SchattenClassesAndSchurMultipliers (design, round 3)

**Verdict:** needs changes

Reviewed the 1,810-line design README, all 44 targets and their API/Checks in plan.json, the 16-entry sources manifest, the previous review and repair report. There are 11 findings: five P1, two P2 and four P3. The two declared supplier gaps are not findings. This is a design review; there is no Suggested.lean. Elaboration: **not available (this lane does not elaborate)**. No Lean process was started.

## Previous findings, checked first

The previous report numbers these F01–F07. None was marked not actionable.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01, compact-endpoint compression | Partly repaired | README 410: “for `1 ≤ p < ∞` and every bounded `X`”; 414: “the extended-gauge bound holds for compact `X`”. The theorem is repaired: identity compressions have finite-p gauges tending to ∞, whereas their operator norms tend to 1. The newly added Check still says the norm is 1 for **every** rank α, including 0; R08 fixes that small residual issue. |
| F02, column/row Check | Repaired | README 1474: “`f = Σ_k 1_{I_k} E_{k1}`”; 1479: “equal to `1/2` at `Q = I₁ ∪ I₂`”. For N=4 the squared column and row suprema are 3/4 and 1/2; the claimed square roots 0.866 and 0.707 are correct. The previous Rademacher example is gone. |
| F03, compact-support density | Repaired | README 1236: “continuous compactly supported functions are dense in `L²(μ)`”; 1237: “That density needs no normality of `X`”. The three named compact/open/Urysohn lemmas have exactly the required hypotheses. Approximation in S₁ of rank-one operators supplies every S_q, including q=∞. |
| F04, rectangular trace | Repaired | README 604: “one-space formula on the disjoint union `Ω ⊔ Ω'`”. Zero extension gives AC⊕0; E₁₂,E₂₁ give trace 1 on both sides. The gap still asks only for the one-space formula. |
| F05, infinite amplification domain | Repaired | README 502: “on all of `S₂(H ⊗ L)` when `‖T‖₂ < ∞`”. The finite-block domain remains available for arbitrary linear T. The new finite-rank-pairing route avoids incorrectly treating 1⊗P_F as finite rank. The sum of squared input norms can be finite while the output sum is infinite for unbounded T. |
| F06, comparison with C3.2 | Repaired | README 804: “when `‖S_M‖_∞ < ∞`”; 805: “exactly when `‖S_M‖_{cb,∞} < ∞`”. The same qualification occurs at 510–513 and 896–897. Transposition on K(ℓ²) has norm 1 and unbounded amplification norms, so both qualifications matter. |
| F07, downstream consumer | Repaired | The NoncommutativeGeometry bullet and plan consumer are absent. The downstream list at 1768–1781 describes extensions/applications, rather than claiming that the existing roadmap imports this one. |

All changed passages and the corresponding patterns elsewhere were read. In particular, the new d=0 amplification clause led to R03; the revised density proof was checked at the pin, not accepted from the repair report. Earlier computed rows were used only for unchanged assertions actually computed there; the sampled targets and all new findings were recomputed below. Rows saying merely “as recorded” were not treated as evidence.

## R01 (P1) — The cited conditional expectation is zero on the allowed inputs

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:171, 666, 928–931, 942–944; plan.json targets 2.4, 5.1 and 5.2. The contract calls `MeasureTheory.condExp` “the conditional expectation, defined when `μ` is σ-finite on the sub-σ-algebra”.

**Claim:** The native function implements the σ-finite L²-kernel and L∞-symbol conditional expectations used in these equalities.

**Witness:** Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean:101–107,171 sets nonintegrable inputs to zero. On ℕ with counting measure, full σ-algebra and symbol 1, it returns 0. Thus §5.2 gives 1=0; §5.1 with A=B=E₀₀ gives 1=0.

**Exact repair:** Retain arbitrary σ-finite spaces. Use `condExpL2` for the kernel projection in §2.4. For symbols, supply an explicit L∞ extension: on an increasing exhaustion by finite-measure sets measurable in the smaller σ-algebra, apply native `condExp` to the restricted integrable functions, prove compatibility, and glue the classes. State its agreement on L¹∩L∞, contractivity, preservation of measurable bounded functions, tower and L²-product/pairing laws. Place this adapter before its consumers and make its ownership and prerequisites explicit; it is not supplied by the cited `condExp` alone. Alternatively cite an exact existing supplier providing that extension. Do not narrow the roadmap to finite measures.

Retest on counting measure: the extension sends 1 to 1, giving norm 1=1 and trace 1=1. For §2.4 also test u(j)=1/(j+1), k(i,j)=u(i)u(j): k∈ℓ²(ℕ²) but k∉ℓ¹; native condExp returns 0 while condExpL2 onto the full σ-algebra returns k. Add both negative controls and mirror the corrected contracts in plan.json.

## R02 (P1) — The imported norming element has its factors reversed

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:298, consumed at 452–453: “norming element `u*|X|^{p−1}/‖X‖_p^{p−1}`”.

**Claim:** For X=u|X|, this element norms the bilinear trace pairing.

**Witness:** X=E₁₂, p=2 gives u=E₁₂, |X|=E₂₂ and u*|X|=0. Hence Tr(XY)=0≠1=‖X‖₂. TauCetiRoadmap/NoncommutativeIntegration/README.md:457 on main repeats the erroneous order; resolving the citation does not validate its formula.

**Exact repair:** Consume the supplier's duality and cyclicity, but use `Y=|X|^{p−1}u*/‖X‖_p^{p−1}` for nonzero X and 1<p<∞. State the zero case separately and use u* at p=1. Explicitly obtain finite-rank norming tests at p=1 by truncating X: u* need not be compact, so density in S∞ cannot directly approximate it in operator norm. In the witness, corrected Y=E₂₁ and Tr(XY)=1. For X=diag((j+1)⁻²), the finite-rank p=1 tests give partial sums tending to π²/6 although u*=I is noncompact. Add the matrix-unit Check and record the supplier correction without editing the supplier here.

## R03 (P1) — Stabilisation does not preserve the norm for a zero auxiliary space

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:801–803; plan.json target 3.6: “for every σ-finite `(Ω', ν)` … `‖S_{M'}‖_{cb,p} = ‖S_M‖_{cb,p}`”.

**Claim:** The equality holds even for ν=0, which the conventions expressly allow.

**Witness:** Let Ω be one point of mass 1, M=1 and ν=0. Then ‖S_M‖_{cb,2}=1, while L²(μ⊗ν)=0 and ‖S_{M'}‖_{cb,2}=0. The repaired §1.4 already computes the zero-dimensional amplification as zero.

**Exact repair:** Require L²(ν)≠0 (equivalently ν≠0 in this σ-finite setting) for equality of the cb norms, and state the zero auxiliary case with value 0. For finite dimension use d≥1 for the M_d notation, or explicitly define the d=0 level as the zero map as §1.4 does. Keep the infinite-dimensional assertion unchanged. The repaired formula gives 0 for ν=0 and 1 for a one-point auxiliary probability space. Add the zero-auxiliary negative control. The omission is also present in the cited source Remark 1.6, recorded below.

## R04 (P1) — The finite factorisation proof uses the wrong complex pairing

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:1060–1063: “`ψ_{ij} = α_i a_{ij} β_j`” and “`|Σ ψ_{ij} M_{ij}| = |⟨α, S_M(a) β⟩|`”.

**Claim:** These absolute values agree for complex unit vectors under the declared conjugate-first convention.

**Witness:** Take α=(1,i)/√2, β=(1,1)/√2, a=I₂, M=diag(1,i). The left side is |(1+i²)/2|=0; the displayed inner product is |(1+(-i)i)/2|=1. All stated vector and operator norm bounds hold.

**Exact repair:** Replace the first vector in the inner product by its coordinatewise conjugate: `⟨conj α,S_M(a)β⟩`. Its norm is still 1 and the argument concludes. Alternatively require α,β nonnegative real and justify absorbing their phases into a. The conjugated-vector version gives 0=0 on the witness. Add this two-coordinate convention Check to §6.3. Pisier's bilinear factorisation at pisier-grothendieck-2012 line 3544 is correct; the error is its conversion to this roadmap's sesquilinear notation.

## R05 (P2) — Layer 10 omits its positive-dimension hypothesis

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:1444–1446, 1498–1501, 1554–1557. The layer starts “`H` is a complex Hilbert space” but places no restriction on n; §10.2 says “`‖·‖_{BMO}` is a norm on `S₂`”.

**Claim:** Definiteness, diagonal-strip convergence and the interpolation theorem hold at n=0 as well.

**Witness:** On ℝ⁰, L²=ℂ, U_z=1, A=1 has BMO norm 0 but Schatten norm 1; J_kA=0 for every k. With p=4 and Ψ(z)=exp(−Rz), §10.4 asserts exp(−R/2)≤4C₀exp(−R), impossible uniformly in R.

**Exact repair:** Add n≥1 to the Layer 10 standing hypotheses, matching plan.json targets 10.1–10.4, and state the excluded n=0 computation as a negative control. The plan already has the required hypothesis; it must be in the README too. For n=1 the diagonal is null and constant multiplication operators are Hilbert–Schmidt only when zero, restoring the two arguments used here.

## R06 (P2) — Smoothness alone does not give a bounded Schur symbol

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:1604–1611, 1641–1649, 1697–1700; plan.json 11.1 `hms_sup`, 11.2 and 11.4. The API asserts “`M` defines a class in `L^∞(ℝⁿ × ℝⁿ)`”.

**Claim:** Every C^{σ_n} symbol off the diagonal gives an L∞ class and the S₂ multiplier used subsequently, even when its extended HMS gauge is infinite.

**Witness:** For n=1 take M(x,y)=x. It is smooth and has HMS gauge ∞, but ess sup|M|=∞. With u(x)=1_[1,∞)(x)/x and v=1_[0,1], u⊗v* has HS norm 1; multiplication of its kernel by M has infinite L² norm.

**Exact repair:** Keep the extended HMS gauge defined on all symbols of the stated smoothness. Qualify the L∞ membership assertion by finite HMS gauge. At §11.2's intertwining and §11.4 explicitly require bounded M and the finite one-sided derivative bound used by the corresponding column or row argument; full finite HMS suffices for both. Retain the valid general bounded-N definition of the twisted L² map. Do not use a total-function “norm” of a nonmember to manufacture an S_M. Mirror the hypotheses in plan.json. M=x remains a valid infinite-gauge negative control and no longer produces an S₂ endomorphism; M=1 has gauge 2 and multiplier norm 1.

## R07 (P1) — The proposed non-Toeplitz example has infinite HMS gauge in dimension two

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:1758–1760: “each derivative of the argument gains a factor `(⟨x⟩ + ⟨y⟩)^{−1}` … so `|||M||| < ∞`”.

**Claim:** M(x,y)=φ((x−y)/(⟨x⟩+⟨y⟩)) satisfies the theorem for every smooth φ with bounded derivatives and every n≥1.

**Witness:** Set n=2, φ(t)=sin(t₁), x=0, y=(R,0), D=1+√(1+R²). Then ∂²_{x₁}M=[sin(R/D)+R cos(R/D)]/D². Its weighted magnitude R²|∂²M| is 5.703,54.598,540.901 at R=10,100,1000 and tends to ∞.

**Exact repair:** Replace the all-dimensional example by, for example, M(x,y)=exp(−|x|²−|y|²). It is non-Toeplitz; every derivative is a polynomial times that Gaussian, so multiplication by any required |x−y|^k remains bounded. At x=0,y=(R,0), its weighted second derivative is 2R²exp(−R²), whose maximum is 2/e, not a growing sequence. Retain the original expression only as a negative control in dimension two, or with separately proved sufficient hypotheses; do not restrict the roadmap's theorem to n=1.

## R08 (P3) — Several Checks contradict the explicit zero-space convention

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:423–429, 528, 783–786, 1017–1018; plan.json 1.1 and 1.4. Examples include “`‖1‖_∞ = 1`” on ℂ^d and “`‖P_α‖ = 1` for every `α`”.

**Claim:** Identity and compression maps always have norm 1.

**Witness:** For d=0, α=0, H=0, μ=0 or an empty finite index type, the relevant operator is zero, with norm 0. README 430,532,791 and §6.1's empty-index clause already require that value.

**Exact repair:** Add d≥1, α≥1, H≠0, μ≠0 and nonempty ι at the respective norm-one Checks, preserving their explicit norm-zero companions. The “pinching is not the identity” comparison additionally needs m≥2 and H≠0. Test d=0/1 and α=0/1: norms 0/1. Mirror the corrections in the plan's Check text. This is the remaining defect in F01's added Check; it does not invalidate the repaired compression theorem.

## R09 (P3) — A BMO Check uses functions outside its carrier

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:1450,1483; plan.json 10.1: “`z ↦ U_z` (unitary valued) has `‖·‖_{BMO^c} ≤ 1`”.

**Claim:** This is a Check for the S₂(H)-valued locally square-integrable function space just defined.

**Witness:** On H=L²(ℝ), every U_z is unitary with singular values all 1; ‖U_z‖₂²=Σ_j1=∞. Thus z↦U_z is not S₂(H)-valued, even though its operator norm is 1.

**Exact repair:** Replace it by z↦exp(2πiz)e for a rank-one projection e (or explicitly a finite-dimensional unitary model). The replacement has pointwise HS norm 1; over an interval of length 1 its mean is 0 and column mean square is e, so its BMO seminorm is exactly 1. Keep the constant S₂-valued function Check with seminorm 0.

## R10 (P3) — The within-layer build order has a forward prerequisite

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:1663: “`*Needs:* §2.1, §10.2, §11.3`”; plan.json target 11.2 lists `target:11.3`.

**Claim:** Targets are presented in build order, but §11.2's localised intertwining proof already consumes §11.3's kernel estimates.

**Witness:** §11.3 at README 1665–1693 needs only Plancherel and derivatives, while §11.2 explicitly needs it. The printed order is 11.2,11.3; the dependency order is 11.3,11.2. There is no mathematical cycle, so reordering suffices.

**Exact repair:** Put the parameter-uniform Littlewood–Paley estimates before the twisted-map/intertwining target, adjusting numbering and all internal references in README and plan.json. Alternatively split the definition from its later intertwining theorem and place that theorem after the estimates. Verify every target prerequisite precedes its consumer. The roadmap has no external citing id identified by the overlap search, but preserve a mapping if a renumbered id has acquired consumers.

## R11 (P3) — The analytic-family normalisation needs a zero-constant branch

**Location:** packages/SchattenClassesAndSchurMultipliers/design/README.md:1558–1561: “`Ψ(z) = C_∞^{z−1} C₂^{−z} T(U |A|^{pz/2})`”.

**Claim:** This proof family works under the stated bounds, which allow C₂=0 or C_∞=0.

**Witness:** T=0, C₂=C_∞=0 satisfies both hypotheses, but the formula uses negative and imaginary powers of 0; it cannot give the asserted holomorphic normalised family. The intended inequality itself is 0≤0.

**Exact repair:** First handle A=0, C₂=0 and C_∞=0 directly. At C_∞=0 use definiteness of matrix BMO (with R05's n≥1) to conclude T(A)=0 on finite-rank inputs. Then use the displayed family only for A≠0 and strictly positive endpoint constants, or replace them by C_j+ε and pass to ε↓0. State finite nonnegative constants explicitly. The zero-map test now uses the direct branch; positive constants retain the existing exponent calculation.

## Verified sound

### Principles, scope and shape

The scope develops a general σ-finite library and distinguishes compact S∞ from the existing B(H) endpoint. No route-specific good-case shortcut, algorithm, copied source passage, re-planning of the existing Schatten families, or forbidden supplier was found. The greedy measurable-set exhaustion and small matrix calculations are mathematical proofs/Checks, not computational algorithms. The layer names are mathematical and do not name source chapters. The different dependencies of kernels, multipliers, factorisation, atomlessness, continuous restrictions and transference explain the main organisation; R10 addresses a genuine local ordering defect.

There are 11 layers, 44 numbered targets, 44 Needs lines, 11 Examples and 11 Dependencies endings. The 16 definition/construction targets have APIs and at least three listed Checks each; R08–R09 identify defective Checks rather than accepting their counts alone. All README and plan statement/API/Check text was read. Source entries and the baseline pins agree with the checkout: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. No design-stage sorry'd data, set_option, computational implementation or source text copied into a deliverable was introduced. The reviewed README has no PR ids or machine paths.

Three main-branch examples were read for shape and conventions: TauCetiRoadmap/NoncommutativeIntegration/README.md:1–100, TauCetiRoadmap/CStarAlgebras/README.md:1–35 and TauCetiRoadmap/BanachSpaceTheory/README.md:1–52.

### Adversarial table

These are computed witnesses, not elaboration results. The table includes all 15 sampled targets, all six summary headlines, every target touched by a finding, and the additional repaired/proof-route interfaces. General arguments such as density or Fatou were checked with the displayed inputs and their hypotheses; a test is not a proof of the full theorem.

| Statement | Instances | Computed values on the two sides | Result / change |
|---|---|---|---|
| §1.1 extended gauge and compression | I on ℓ²; P_d; diag(1/(j+1)); zero | For finite p: ∞=lim d^{1/p}; extended ∞-gauge: ∞ versus lim‖P_d‖=1. Harmonic diagonal: HS²=π²/6, trace gauge=∞, op norm=1. P₀ norm=0. | Repaired theorem sound; R08 for P₀ Check. |
| §1.2 norming / contract | X=E₁₂,p=2; X=diag((j+1)⁻²),p=1 | Wrong Y=E₂₁E₂₂=0 gives trace 0 versus norm 1; corrected E₂₂E₂₁=E₂₁ gives 1=1. Trace pairings with P_d are Σ_{j<d}(j+1)⁻²→π²/6. | R02. |
| §1.3 compact interpolation | T(A)=2A; p₀=2,p₁=∞,θ=1/2; A=I₂; equal ∞ endpoints | pθ=4; left 2·2^{1/4}=2.378414; right 2^{1/2}2^{1/2}·2^{1/4}=2.378414. Constant ∞ couple gives 2‖A‖=2‖A‖. | Statement sound; when both endpoints are ∞ use the constant couple, not a finite-p closure argument. |
| §1.4 amplifications and repairs | transpose M₂; id; unbounded T with ‖B_k‖₂≤2^{-k}, ‖TB_k‖₂≥1 | Flip has op norm 1; partial transpose has norm 2. At p=2 both norms 1. For k≥1 input squared sum≤1/3, output sum≥Σ1=∞. Zero-dimensional tensor gives 0. | F05/F06 repaired; R03 checks propagation of the zero case. |
| §2.1 kernels | E₁₂; min(x,y); constant kernel; zero measure | T_{1_(1,2)}δ₂=δ₁. ∫∫min(x,y)²=2∫₀¹y²(1−y)dy=1/6=Σ((j+1/2)π)⁻⁴. Constant kernel HS norm=1; zero measure=0. | Sound. |
| §2.2 kernel calculus | A=iE₁₂,C=E₂₁; D_f,D_g; disjoint union | AC=iE₁₁ and trace i; kernel integral i·1=i. Adjoint kernel is −i at (2,1). D_fAD_g entry is i f₁g₂. Zero extension product has diagonal (i,0), same trace i. | F04 repaired. |
| §2.3 transpose | iE₁₂; [[1,1],[0,0]]; D_i | Transpose iE₂₁ versus adjoint −iE₂₁. Both rectangular-row/column matrices have singular values √2,0. D_i^T=iI versus D_i*=−iI. | Sound; no conjugation confused with transposition. |
| §2.4 changes and projection | ν=2μ on a point; full σ-algebra on counting ℕ; k=u⊗u with u_j=(j+1)⁻¹ | U=√2, adjoint=1/√2 in weighted coordinates; transformed kernel is 2k. Full L² projection returns k, norm π²/6; native condExp returns 0 since Σ_{ij}|k_ij|=∞. | Change-of-measure convention sound; R01 for projection API. |
| §§3.1–3.2 algebra headline | M=[[1,2],[3,4]]; M=i1_(1,2); zero | HS operator norm=4 at E₂₂; S_M* has symbol −i1_(1,2), whereas the symbol for operator adjoints is −i1_(2,1). S_M(E₁₂)*=−iE₂₁=S_Mtilde(E₂₁). Zero measure: 0=0. | Sound. |
| §3.3 finite-rank norming and limits | one-point M=2; M_k=1/k; elementary f=2,g=3 | Supremum ratios and pairing suprema are 2=2. Limiting multiplier norm 0=lim1/k. Elementary norm=6=2·3. | Sound with native S₂-bounded multiplier; no arbitrary discontinuous T used in the density argument. |
| §3.4 finite indices | upper triangular mask on M₂; empty type | For A=[[√2,1],[−1,√2]]/√3, A*A=I; truncated Gram eigenvalues 4/3,1/3, so ratio 2/√3≈1.154701. Empty matrix has norm 0. | Sound. |
| §3.5 cb norm | [[1,2],[2,1]]; p=2; block off-diagonal E₁₂ | Complete-isometry decomposition gives upper bound 3/2+1/2=2; E₁₂ gives lower bound 2. Constant amplification preserves E₁₂; δ_ij pinching sends it to 0. | Sound for nonzero carrier and m≥2; R08 qualifies Check. |
| §3.6 stabilisation | one-point M=1; auxiliary mass 0 or 1; ℕ auxiliary | Norms (original,stabilised)=(1,0),(1,1),(1,1), respectively. | R03. |
| §3.7 restriction | μ=δ₀+δ₁,ν=δ₀,M=[[1,2],[2,1]] | Restricted norm 1≤2, strict. Equivalent weighting on both points preserves 2. Transposed triangular mask has same 2/√3. | Sound. |
| §§4.1–4.2 duality/interpolation headline | M=1_(1,2),A=E₁₂,B=E₂₁; triangular mask | Correct trace pairing 1=1; without transposing symbol right pairing 0. Triangular norm at 2 is 1, at 1,∞ is 2/√3; p=4 upper bound (2/√3)^{1/2}=1.074570. | Sound. |
| §4.3 repaired weak-* extension | constant symbol and diagonal symbol on ℕ | Both send I to I; sending all noncompact operators to 0 instead gives 0 and is incompatible with P_d→I weak-*. Norms=1. | F06 repaired. |
| §§5.1–5.2 expectations | full σ-algebra on counting ℕ,φ=1; two-point averages | Native condExp gives norm equality 1=0 and trace 1=0. With correct expectation, 1=1. Finite averages: 3/2≤2; 3/4≤2/√3; 1/4≤1. | R01; finite-measure examples sound. |
| §5.3 ambient σ-algebra | four equal points, two blocks, block symbol [[1,2],[2,1]] | On the two-point quotient cb norm=2; on four points it is amplification by J₂, cb norm=2. | Sound after R01's API repair; the finite-measure Lévy step meets integrability. |
| §6.1 Schur-product headline | PSD [[2,1],[1,1]]; indefinite [[1,2],[2,1]]; empty | PSD eigenvalues (3±√5)/2>0 and every multiplier norm=2. Indefinite eigenvalues 3,−1; norm 2 differs from diagonal max1; S_M(J)=M is not positive. Empty norms=max∅=0. | Sound; R08 for unqualified norm-one example. |
| §§6.2–6.4 factorisation headline | [[1,2],[2,1]]; diagonal ℕ; complex ψ witness | With a=√(3/2), b=1/√2, take ξ₁=(a,b), ξ₂=(a,−b), η₁=(a,−b), η₂=(a,b). Squared norms2; diagonal inner products1, off-diagonal2; factorisation product2=multiplier norm2. ξ_i=η_i=e_i gives diagonal symbol norm1. Complex ψ: 0 versus1, corrected0=0. | Characterisation sound; R04 fixes proof convention. |
| §6.4 separable factorisation route | K kernel=1+s(x)s(y) on [0,1]; countably generated symbol algebra | T_K eigenvalues1,1, HS norm√2=‖K‖₂ but op norm1. Ultraproduct pairing equals ∫∫conj(u)vM; strong measurability confines each factor's essential range to a separable span. | Confirms HS-isometry wording and why merely op-isometric kernels would be wrong. |
| §7.1 atomlessness | counting {1,2}; Lebesgue [0,1]; cocountable probability; zero | Counting singleton mass1 cannot split at1/2. Lebesgue [0,t] has mass t; n=3 gives1/3 each. Cocountable singleton mass0 but whole-space mass1 and all subsets0/1. Zero has no positive-mass atom. | Sound; standard-Borel hypothesis is needed for the null-singleton comparison. |
| §§7.2–7.3 atomless headline | two equal cells; n equal refinements; triangular symbol at p=2 | Two-cell averaging: constant3/2 versus multiplier norm2. n equal subcells realise M⊗J_n exactly. Triangular symbol L∞ norm1 gives ordinary and cb S₂ norms1=1. Zero measure gives0=0. | Sound with correct expectation; no claim that null singletons suffice. |
| §8.1 finite-support approximation | δ₀; Lebesgue [0,1], f(x)=x,F(x,y)=xy, midpoints | For N midpoints, average x=1/2 exactly and product average xy=1/4 exactly, matching both integrals. Zero measure uses empty sum0. | Sound; product approximation follows on compact supports. |
| §8.2 continuous-symbol headline and repaired density | μ=δ₀+δ₁ with symbol [[1,2],[2,1]]; e^{i(x−y)}; diagonal indicator | Sup finite restrictions=2=global norm; character norms1=1. Noncontinuous diagonal indicator has global norm0 versus finite restrictions1. With linear ramps of width ε on [0,1], L² error²=2ε/3≤4ε; rank-one S₁ error≤‖u−u'‖‖v‖+‖u'‖‖v−v'‖→0. | F03 repaired, including q=∞; continuity necessary. |
| §9.1 Toeplitz definitions | m=e_a,cos(2πa·),1_{0}; translation t | e_a(x−y)=e_a(x)conj(e_a(y)), norm1. Cos factorisation norm1. Point symbol1_{0} gives0 a.e. Conjugated translate kernel is m(x−t−y)k_A(x,y), the claimed sign. | Sound. |
| §9.2 Fourier definitions | e_a; modulation e_s; bilinear transpose | F(e_sf)(ξ)=Ff(ξ−s), so T_m(e_sf)=e_sT_{m(·+s)}f. T_{e_a}f(x)=f(x+a), reflected multiplier gives f(x−a). Bilinear integral is ∫m(ξ)Ff(ξ)Fg(−ξ), giving transpose m(−·). Norms1. | Sound; pointwise matrix Schatten norm, not matrix-entry ℓᵖ, is used. |
| §9.3 compressions | g=1_[−1/2,1/2],F=[−R,R]; polar factorisation | TrΛ_F=|F|·sinc(0)=2R=|F|‖g‖₁. HS²=∫sinc(u)²(2R−|u|)_+du≤2R. g=uv has u*u=v*v=|g|, giving product HS bound |F|‖g‖₁. | Sound; at p=∞ these compressions are compact because g is L². |
| §9.4 Gaussian route | n=1,R=1,T=.1 or10; p=1,∞ | p=∞ pairing masses (1+T²)^{-1/2}=.995037,.099504; p=1 masses (1+T^{-2})^{-1/2} are exchanged. For interior p, ∫f_Rg_R=‖f_R‖_p^p=1 and ‖g_R‖_{p'}=1. | Previous repair sound. |
| §9.5 transference headline | m=0,1,e_a,cos; all p; reflection | cb equalities0=0,1=1,1=1,1=1. Reflected character translates by −a and original by+a, but both are isometries. Compression pairing gives |Q_R|^{-1}TrΛ(g)Λ(h)→∫tr(gh). | Sound on ℝⁿ; source group hypotheses are not silently removed. |
| §10.1 repaired BMO | partition column,N=3,4; two-valued rank-one function | Column²=1−1/N=2/3,3/4; row²=1/2,1/2. For indicator half-circle times e, mean square=e/4 and norm1/2. Original unitary-valued example has HS²=∞. | F02 repaired; R09 replaces invalid carrier. |
| §10.2 matrix BMO | n=0,A=1; n≥1; dilation | n=0: BMO0 versus operator/S₂ norm1. For t>0, U_zD_t=D_tU_{z/t}; scalar phase under translations cancels exactly. For n≥1, commuting HS multiplier must be0. | R05; covariance signs sound. |
| §10.3 strip/periodisation | n=2,k=0,x=(.05,.05),y=(.95,.95); n=1,k=0 | Distance .9√2≈1.272792≥1 but labels equal0, so torus mean equals entry, not0. For n=1 same cell distances<1 and J₀ kills entries. Lower frequency bound: 2^{-k}−2√n8^{-k}≥2^{-k}/2 iff4^k≥4√n. | Source defect correctly repaired in the design; R05 for n=0. |
| §10.4 interpolation | Ψ=e^{-Rz},n=0,p=4; T=0; finite rank with ‖A‖_p=1 | n=0: e^{-R/2} versus4C₀e^{-R}. T=0 gives0≤0 but normalising inverse powers are invalid. Positive constants: Ψ(2/p)=C∞^{2/p−1}C₂^{-2/p}T(A); boundary L² norm≤1. | R05,R11. |
| §11.1 HMS gauge | sign(x−y),n=1; ξ/√(1+ξ²); x | Gauges2; 2+4/(3√3)≈2.769800; ∞ respectively. Last symbol has essential supremum∞ and cannot define S_M on all S₂. | R06; derivative-order Checks σ₁,σ₂,σ₃,σ₄=1,2,2,3 correct. |
| §11.2 twisted maps | N=1; N=f(x); column frequency x−y; row frequency y−x | Norm1 for identity. Left multiplication commutes with right E: D_f(AE)=(D_fA)E. M_c(x,x−y)=M(x,y); M_r(y−x,y)=M(x,y), using σ(A)(z)=π(A)(−z). | Signs sound; R06 fixes regularity/boundedness for intertwining; R10 fixes order. |
| §11.3 scaling | N=1,n=1,σ=1,j=0,1 | Weighted kernel-square factors1,1/2; unweighted gradient factors1,8; weighted gradient factors1,2. These are 2^{j(n−2σ)},2^{j(n+2)},2^{j(n+2−2σ)}. At σ=n/2 the high-frequency geometric series is Σ1=∞. | Sound for a fixed smooth cutoff; its derivative constants must be retained when choosing C_n. |
| §11.4 BMO endpoint | M=1; M=sin(y₁); column derivative chain | M=1: ‖S_MA‖BMO≤‖A‖, RHS2C_n‖A‖. For sin(y₁), D_x part1, D_y part∞. ∂ξM_c=−∂yM, row analogue swaps variables. | One-sided nature sound with R06's bounded-symbol requirement. |
| §11.5 HMS headline | M=1; p=2,3,3/2; sign(x−y),n=1 | M=1 has norm1,gauge2; at p=2 RHS8C_n, hence C_n≥1/8. p²/(p−1)=4,9/2,9/2, respectively. Sign symbol gauge2 yields finite interior-p bounds. | Headline sound; no endpoint p=1,∞ assertion. |
| Layer 11 example | n=2,sin profile; Gaussian replacement | Original weighted second derivatives5.703,54.598,540.901 at R10,100,1000. Gaussian replacement has corresponding supremum2/e≈.735759. | R07. |

### Source verification

All 15 seeded targets were checked at the supplied cached line locators. The citations designate the versions read in sources.toml, not an assumed published renumbering. There were no additional “unverified” open-text locators to chase; the nine explicitly uncertified works are accounted for under Not verifiable. All 16 cited works have manifest keys; no source entry was changed or added.

| Sampled target | Text opened and result |
|---|---|
| 1.3 | lafforgue-delasalle-2011 lines 174–190,246–252, printed pp.5–6, and cgpt-2023 lines 485–492, printed p.9: compact S∞ and the interpolation identification. Lafforgue–de la Salle's reversed p,q identity is a source misprint already corrected in §4.2. The precise arbitrary-map/endpoint version is derived using the cited NoncommutativeIntegration contracts. |
| 2.1 | lafforgue-delasalle-2011 lines 219–232, printed p.6: σ-finite L² kernel identification via Hilbert tensors. Rectangular surjectivity is explicitly the roadmap's consequence of the embedding gap plus rank-one density, not misattributed to the supplier. Reed–Simon remains uncertified. |
| 2.2 | lafforgue-delasalle-2011 Remark 1.2, lines 239–243, printed p.6, has the bilinear product trace. The rectangular variant is now derived on the disjoint union. Other kernel identities follow from the integral convention and Fubini; they are not separate numbered assertions in Remark 1.2. |
| 2.3 | lafforgue-delasalle-2011 lines 226–230,244, printed p.6, and pisier-grothendieck-2012 Remark 13.4, lines 2086–2089, printed p.42: bilinear transpose convention and finite-dimensional norm/cb-norm distinction agree. |
| 3.3 | lafforgue-delasalle-2011 lines 233–238,397–413,433–438, printed pp.6,10–11; cgpt-2023 lines 226–229, printed p.5. These support restriction to S₂∩S_p, unique extension and the finite-rank pairing/limit route. |
| 3.4 | lafforgue-delasalle-2011 lines 213–218, printed pp.5–6; pisier-grothendieck-2012 lines 767–772, printed p.14: entrywise multiplication and diagonal factors. The exact triangular 2×2 calculation was recomputed separately. |
| 3.5 | lafforgue-delasalle-2011 Lemma 1.5, lines 254–259, printed p.6, with (2),187–189; cgpt-2023 lines 217–219, printed p.5. Amplification is by the all-ones symbol, not δ_ij. |
| 6.1 | pisier-grothendieck-2012 lines 767–772 supplies the diagonal multiplier form, not the whole positive-symbol theorem. The full cited Paulsen/Horn–Johnson locators are uncertified. Native Matrix.PosSemidef.hadamard/kronecker plus the explicit sum-of-diagonal-conjugations proof support the stated extension and exact norm; positivity itself is imported. |
| 7.1 | lafforgue-delasalle-2011 lines 487–488, printed p.12, gives the atom convention; its proof at 513–515 uses equal-measure splitting. The roadmap supplies the arbitrary-t exhaustion argument. Its positive-mass requirement correctly excludes null sets, unlike the literal source wording. Tau Ceti's standard-Borel result is narrower and is only used for the comparison. |
| 8.2 | lafforgue-delasalle-2011 Theorem 1.19, lines 524–588, printed pp.13–15; cgpt-2023 lines 232–238, printed p.5; caspers-delasalle-2015 Theorem 3.1,282–296, printed p.6. Hypotheses, support and finite restrictions agree. The roadmap's non-strict ≤C formulation avoids the literal strict-bound error in the first and third texts. |
| 9.1 | cgpt-2023 lines 59–66, printed p.2; caspers-delasalle-2015 lines 28–30, printed p.1; lafforgue-delasalle-2011 Notation 2.1,597–599, printed p.15. The first two use row-minus-column; the last uses g⁻¹h, hence column-minus-row on ℝⁿ. Passing to the transposed/reflected symbol converts it to the explicit convention here; the roadmap states that conversion. Translation, dilation and mollification signs were checked. |
| 9.2 | cgpt-2023 lines 60–74,250–251, printed pp.2,6; lafforgue-delasalle-2011 (3),193–199, printed p.5; caspers-delasalle-2015 lines 26–41, printed p.1. Matrix-level norms agree with the semifinite Lᵖ definition. The p=∞ and L²-domain formulation here is explicit rather than inferred from the finite-p source definition. |
| 9.5 | caspers-delasalle-2015 Theorem 4.2,485–522, printed p.10; Theorem 5.2,543–625, printed pp.11–12; Corollary 5.3,626–629, printed p.12; cgpt-2023 (FS),71–72; neuwirth-ricard-2011 Theorem 2.7,516–531, printed p.11. Caspers–de la Salle assumes φ∈M_CB A(G); Theorem 5.2 has 1<p<∞. Here the separate Euclidean Gaussian/compression/mollification targets supply the L∞-symbol and endpoint extensions. Neuwirth–Ricard is correctly labelled discrete-amenable, not used as a theorem about ℝⁿ. |
| 10.2 | cgpt-2023 lines 264–289, printed p.6, gives conjugation and column/row BMO; the restriction to S₂ and definiteness use positive dimension. R05 records the missing README hypothesis. |
| 10.3 | cgpt-2023 lines 348–454, printed pp.7–9, including all of Lemma 1.3's small/large-cube argument, and 504–507, printed p.10. The roadmap's thresholds repair the mean-zero/frequency-separation omission. Cube diameter≈4^k times frequency≥2^{-k}/2 gives oscillatory-average bound O(2^{-k}); coordinate displacement≤2√n8^{-k} gives the small-cube error O(2^{-k}). |

Additional passages read for changed or vulnerable routes: pisier-grothendieck-2012 (3.9)–(3.10),656–665, Proposition 3.3,781–795 and Remark 23.4,3541–3545; caspers-delasalle-2015 Lemma 4.1,449–484, Theorem 5.1,529–542 and bilinear pairing638–642; cgpt-2023 Lemma 1.4,471–484, Theorem A,149–154, (2.5),595–608, the localisation discussion668–680 and estimates704–718,767–798,866–894,967–972,995–1046; mei-2007 Lemma 6.1,3218–3230. The latter supports the dyadic semifinite interpolation setting; the broader filtration/sharp-constant contract remains a declared supplier obligation, not a claim that Mei states it verbatim.

### Supplier resolution and order

Every Needs line and supplier contract was read. Main-branch suppliers were used as main-branch suppliers; open revisions were inspected for overlaps, not substituted for main contracts.

| Supplier | Resolved location and consumed content |
|---|---|
| OperatorTheory/OperatorIdeals, main | TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:144,168–196,220–226,473,540–570: OI-A12, A23, A25–A30, A38–A40, B80, C01–C14. The approximation numbers are zero-indexed; B80 is B(H), so compact S∞ is a distinct endpoint. Parts B–C provide HS/trace gauges, not an integral kernel inverse. |
| VonNeumannAlgebras, main | TauCetiRoadmap/VonNeumannAlgebras/README.md:1006–1014,1299–1310,5183–5186: V2.RectangularL2 includes arbitrary spaces and the σ-finite identification with μ.prodν; V4.Core supplies canonical trace/duality and S₂≅K⊗conj(H); V13b supplies the Hilbert ultraproduct. No separability premise was silently imported. |
| NoncommutativeIntegration, main | TauCetiRoadmap/NoncommutativeIntegration/README.md:§1.3–§1.5,453–462,498–513,566–601,878–886,1243–1264,1423–1439: density, Hölder, Schatten identification, duality, regularised complex interpolation, Riesz–Thorin, probability-space Bochner identification, finite-tracial martingale theory. R02 is a real false supplier formula, not a missing section. |
| CStarAlgebras, main | TauCetiRoadmap/CStarAlgebras/README.md:435–448,918–938: C1.6 compact operators and C3.2 finite cb supremum/Smith's lemma; the transpose witness matches §1.4. Finite matrix levels of K(H) are obtained by finite block decomposition. |
| BanachSpaceTheory, main | TauCetiRoadmap/BanachSpaceTheory/README.md:380–396, B4.0: Bochner density for a finite-variation absolutely continuous vector measure into a reflexive space; complex targets handled through the real space, no target separability assumption. The L∞ bound in this roadmap follows from variation≤Cμ. |
| AutomorphicSpectralTheory, #925 | TauCetiRoadmap/AutomorphicSpectralTheory/README.md:239–251,262–280 at its supplied open head: §0.8 standard-Borel/separable-L² kernel embedding, §0.9 trace, §0.10 one-space product-kernel formula. The arbitrary σ-finite generalisation is expressly requested as a gap. |

Dependency check output:

```
candidate: SchattenClassesAndSchurMultipliers is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2061 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The missing merge-order entry is not a finding. The resolver reported no unresolved cross-roadmap citation; it also explicitly said it had not checked external Lean names against the pins, so the manual library audit below was necessary.

The two gaps match between plan.json and README: `sigma-finite-hilbert-schmidt-kernels` (AutomorphicSpectralTheory §0.8 and §0.10), and `semifinite-martingale-bmo-interpolation` (NoncommutativeIntegration Part II). Their hypotheses, norms and requested bounds are explicit. The first asks for HS isometry, not operator-norm isometry, and the rectangular trace is derived here. The second asks for the missing semifinite martingale interpolation with O(p), whereas main §8.4 is finite-tracial. Neither gap has supplier `none`, duplicates a pinned kernel/BMO construction, or introduces a supply cycle. Acceptance after repairs may be conditional on these two contracts.

### Pinned-library and duplication audit

The following declarations were located and opened at the pins (paths below are library-repository-relative). Native definitions were checked for their actual content: `lpMeas` bundles a.e. strong measurability, `condExpL2` is the orthogonal projection, `condExp` has the integrability guard of R01, `IsAtom` includes positive mass, and `NullSingletonClass` only controls singleton masses.

| Library file | Declarations and lines |
|---|---|
| Mathlib/MeasureTheory/Function/ConditionalExpectation/AEMeasurable.lean | `lpMeas`,88–93 |
| Mathlib/MeasureTheory/Function/ConditionalExpectation/CondexpL2.lean | `condExpL2`,68–70; local finite-measure integrability,78 |
| Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean | `condExp`,101; `condExp_of_not_integrable`,171; `ContinuousLinearMap.comp_condExp_comm`,357 |
| Mathlib/Probability/Martingale/Convergence.lean | `Integrable.tendsto_ae_condExp`,361–363; finite measure/real-valued context at244 |
| Mathlib/Analysis/Complex/Basic.lean | `Complex.reCLM`,152; `Complex.imCLM`,172 |
| Mathlib/MeasureTheory/Measure/Regular.lean | `InnerRegularCompactLTTop`,336; `MeasurableSet.exists_isCompact_lt_add`,821; finite Radon Regular instance902; `IsCompact.exists_isOpen_lt_add`,930 |
| Mathlib/Topology/UrysohnsLemma.lean | `exists_continuousMap_one_of_isCompact_subset_isOpen`,529–533, R₁ locally compact, no normality |
| Mathlib/MeasureTheory/Function/ContinuousMapDense.lean | `MemLp.exists_hasCompactSupport_eLpNorm_sub_le`,142; NormalSpace context67 and p≠∞ hypothesis144 |
| Mathlib/MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean | `NullSingletonClass`,31; deprecated `NoAtoms` alias35 |
| Mathlib/Analysis/Normed/Operator/Compact/Basic.lean | `IsCompactOperator`,69; `compactOperator`,256–261 |
| Mathlib/Analysis/Matrix/Order.lean | `Matrix.PosSemidef.kronecker`,188; `.hadamard`,214 |
| Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean | `CompletelyPositiveMap`,51–55, positivity at every CStarMatrix level |
| Mathlib/Analysis/CStarAlgebra/Matrix.lean | `Matrix.toEuclideanCLM`,101–106 |
| Mathlib/Analysis/Fourier/LpSpace.lean | `MeasureTheory.Lp.fourierTransformₗᵢ`,51–56, complete complex Hilbert-valued L² |
| Mathlib/Analysis/Complex/Hadamard.lean | `Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip`,592–596, bounded strip and holomorphic/continuous hypotheses |
| TauCeti/Analysis/OperatorIdeal/Family/Schatten.lean | `OperatorIdealFamily.schatten`,48; `gauge_schatten`,64; `lowerSemicontinuous_gauge_schatten`,81; `gauge_schatten_le_of_le`,93; `finiteSubmodule_schatten_le_of_le`,101; `schatten_isComplete`,109 (an instance, not a missing theorem) |
| TauCeti/Analysis/OperatorIdeal/Family/TraceClass.lean | `traceClass`,59; `schatten_one`,90 |
| TauCeti/Analysis/OperatorIdeal/Family/HilbertSchmidt.lean | `hilbertSchmidt`,65; `schatten_two`,112 |
| TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.lean | `ContinuousLinearMap.singularValue`,77–78, infimum over rank≤n approximants |
| TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Schatten.lean | `schatten`,68; `schatten_apply`,75–76; finite-dimensional hypotheses59–62 |
| TauCeti/Analysis/Fourier/L2Multiplier.lean | `Lp.fourierMultiplierCLM`,88; norm bound126; composition159; adjoint177; bounded a.e. convergence299, with countably generated filter |
| TauCeti/Analysis/Fourier/MihlinHormander.lean | `exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le`,300–306, smooth off0, positive dimension, 1<p<∞ |
| TauCeti/Analysis/Distribution/SchwartzSpace/LittlewoodPaley.lean | `ContDiffBump.littlewoodPaleyPiece`,87; derivative bound196–201, requiring smoothness off0 and a constant depending on the fixed bump |
| TauCeti/MeasureTheory/Measure/Atom.lean | `MeasureTheory.Measure.IsAtom`,59–61 |
| TauCeti/MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean | `exists_subset_measure_eq_of_nullSingleton`,115–118, StandardBorelSpace and finite measure of the set |

The remaining elementary carrier names in the plan prerequisites were located at the pins as well: Matrix.hadamard/Kronecker, CStarMatrix, WithLp, UnitAddTorus, Lp/eLpNorm/AEStronglyMeasurable, rnDeriv, MeasurePreserving, measure support, Fréchet derivatives, lp and geometric separation. Object searches distinguished Tau Ceti's group-cohomological Schur multiplier from this analytic one and Mathlib's Schwartz/distribution Fourier multipliers from L∞-symbol L² multipliers. The native matrix positivity theorem is consumed, not owned again; the finite cb/p-norm theorem is a genuine extension. No duplicate analytic Schur multiplier, matrix BMO or arbitrary σ-finite kernel inverse was found.

### Open-work and overlap audit

The supplied board-package index and open-roadmap index were read before ownership conclusions. The supplied overlaps file reports no conflicting head, no dropped cited id and no id available only in an open revision. A fresh `roadmaps overlaps` invocation cannot inspect this design-only name because it is not on main or in an open roadmap PR; that limitation does not contradict the supplied snapshot. No overlap finding was invented from the tool failure.

`roadmaps grep` was run over the indexed open heads and main by object: Schur multipliers, matrix/operator-valued BMO, Hilbert–Schmidt kernels, Haagerup factorisation, Fourier–Schur transference and Toeplitz symbols. Board README searches were also run. Hits for group-cohomological Schur multipliers are different objects. Kernel ownership resolves to AutomorphicSpectralTheory; operator ideals and trace ownership resolve to the suppliers above. The board-package index's three other review heads concern AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory, with no candidate analytic operator-theory owner.

The five closest open roadmaps were inspected at their heads:

- #1854, TauCetiRoadmap/BanachSpaceTheory/README.md:22–42 preserves B4.0 and former anchors explicitly; no dropped-id citation is produced. Its general Banach tensor/duality programme does not own this analytic Schur-multiplier theory. The contract here continues to cite main B4.0.
- #2164, TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/README.md:25–65 owns Sobolev gauge/connection and heat-flow theory, not Schatten multipliers or matrix BMO.
- #1771, TauCetiRoadmap/QuantumFoundations/README.md:20–29 imports trace class/approximation numbers and owns operational/spectral interfaces, not Schur multipliers.
- #1684, TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md:13–28,83–100 concerns Hardy compression T_a=P M_a|H² and Fourier-coefficient Toeplitz matrices. This is distinct from multiplying arbitrary operator kernels by m(x−y), as the reviewed scope says.
- #1842, TauCetiRoadmap/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:7–9,98–100 owns the representation-smooth refinement of Schatten ideals by commutators and imports the base ideals/trace. It does not own the kernel multiplier, cb norm or HMS theorem developed here.

No second owner or mutual handoff was found among these objects. No source, supplier, board or PR text was treated as an instruction, and no suspicious instruction affecting this review was encountered.

### Headline and acceptance-file audit

The six summary headlines are (1) the multiplier algebra and duality/interpolation laws, (2) the finite positive-symbol norm/cb theorem, (3) Grothendieck–Haagerup factorisation, (4) the atomless and continuous-symbol norm theorems, (5) Fourier–Schur transference, and (6) the HMS bound. Deep intermediate targets include finite factorisation §6.3 and matrix-BMO interpolation §10.4.

There is no Suggested.lean in this design package; this is not a missing-file finding at this stage. Thus no padding theorem, missing backticked Lean declaration, import-header violation, sorry'd data or set_option exists in an acceptance file to inspect. The one-tactic probe and #check binder audit are **not available**, not passed. At package stage the finite positive-symbol theorem and finite factorisation can be stated using matrices, matrix positivity, native finite-dimensional inner products and Tau Ceti's Schatten seminorm with a few real definitions; merely restating Matrix.PosSemidef.hadamard would be padding. The general kernel-defined headlines require a real kernel/operator carrier construction or explicit module-docstring non-statability explanations; no bare-Prop or arbitrary-map substitute is acceptable. This review does not pre-approve those future signatures.

## Not verifiable

- The nine settled uncertified works: reed-simon-1-1980 §VI.6; simon-trace-ideals-2005 Ch.1–3; gohberg-krein-1969 Ch.III; paulsen-2002 Ch.3/8; pisier-similarity-2001 Ch.5; horn-johnson-topics-1991 Ch.5; grafakos-classical-2014 Theorem6.2.7; musat-2003 Theorem3.1; jrwz-2020's sharp Burkholder–Gundy order. Their texts were not available legally in this run. They were not re-requested or presented as read. Open-source overlaps and direct arguments were checked where identified above; that does not certify the unread locators.
- Published-versus-preprint pagination/numbering was not independently compared. The manifest explicitly identifies the arXiv/HAL versions whose cached lines were read, including Lafforgue–de la Salle v3 and Mei v3.
- Elaboration, one-tactic probes and #check of future declarations: not available (this lane does not elaborate; there is no design-stage Suggested.lean).
- Numerical optimal values of the dimensional constants in the BMO/LP/HMS bounds were not certified. The required scale exponents, dimension dependence and oscillatory separation estimates were checked, not a best constant.
- A live overlaps computation for the design-only candidate is unsupported by the tool; the supplied overlap snapshot and the manually inspected main/open heads are the evidence used.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed p.6, line249: the source says S_q interpolates between S_p and S_p′ for 2≤p≤q; it should be S_p between S_q and S_q′ with the corresponding exponent equation; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed p.7, lines262–266: the source says every auxiliary σ-finite measure preserves the cb norm; it should be a nonzero auxiliary L² space, with the zero case giving norm zero; affects a stated result.
- **Misprint** in lafforgue-delasalle-2011 at Lemma 1.9 proof, printed p.8, line348: the source says the conjugation embedding has the ν-space as its target; it should be the μ-space; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4 atom convention, printed p.12, lines487–488: the source says an atom cannot split into two positive-measure sets without requiring positive mass itself; it should be a positive-measure set with that property; affects a stated result.
- **Error** in lafforgue-delasalle-2011 at Theorem 1.19, printed p.13, lines524–531: the source says strict bound C globally is equivalent to strict bound C on every finite restriction; it should be non-strict bounds, or a common strictly smaller uniform bound; affects a stated result.
- **Error** in caspers-delasalle-2015 at Theorem 3.1, printed p.6, lines282–289: the source says strict bound K globally is equivalent to strict bound K on every finite restriction; it should be non-strict bounds, or a common strictly smaller uniform bound; affects a stated result.
- **Error** in cgpt-2023 at §1.2 before Lemma 1.3, printed p.8, lines375–378: the source says strip removal makes the periodised operator mean zero for every k; it should require sufficiently large k, for instance 4^k≥√n; affects the proof.

For the strict-bound source issues, take the discrete space ℕ, counting measure and continuous symbol M(i,j)=1−1/(i+1), C=K=1. Every finite restriction has norm strictly below1; the whole multiplier has norm1. The reviewed roadmap already uses ≤ and needs no repair for these source errors.

- **Error** in lafforgue-delasalle-2011 at §2 opening, printed p.15, lines590–593: the source says σ-finiteness of Haar measure is equivalent to second countability; it should be second countability is sufficient, not necessary; affects nothing.

For this last source issue, an uncountable product of two-element groups is compact and not second countable, but its Haar probability measure has total mass 1. The roadmap works on ℝⁿ and does not use the erroneous converse.
