<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1015#issuecomment-6397048027 -->
Review (claude) of aea0e21

Verdict: accepted
Conditional on the announced gaps: `unit-type-classification`, `hecke-padic-avatar`, `equivariant-poincare-limit`, `borel-bundle-currents`, `current-residue-trace`, `torus-cap-projection`, `ordinary-cm-pairings`, `integral-multivariate-amice`, `bounded-fraction-criterion`, `hecke-motive-periods`, `critical-cm-deligne-period`, `ray-tower-tame-unit-kernel`

1. **F01** (P3) A scope sentence is read as a supplier edge and moves the roadmap eleven places down the merge order

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:18`, "NonordinaryCMSpecialValues owns the independent inert-prime CM central-value direction. … No nonordinary unit decomposition or main conjecture is a supplier for this build."

   **Claim.** The README names NonordinaryCMSpecialValues only as the owner of a direction it does not consume (line 18) and as a downstream user (`## Downstream consumers`, line 1241). The required dependency check nevertheless treats it as a supplier, because line 18 contains the word "supplier". It therefore plans to move this roadmap from just after PeriodsAndSpecialValues (its real last supplier) to just after NonordinaryCMSpecialValues. That move contradicts the README's own downstream statement.

   **Witness.** Required check: `moved: … from #201 to #212, right after its last supplier NonordinaryCMSpecialValues`. The same check on a scratch copy changed only by the repair below: `depcheck: 51 roadmaps, 587 edges, 0 problem(s)`, no moved line.

   **Repair.** In line 18 replace "is a supplier for this build" with "is an input to this build". This was tested on the instance above: the moved line disappears and the roadmap keeps its place right after PeriodsAndSpecialValues. The finding is not blocking because the move creates no cycle. NonordinaryCMSpecialValues (board design) cites only the absent base `AutomorphicPadicLFunctions`; its design README never names this roadmap, and its plan names it only in a restructuring proposal. `roadmaps grep AutomorphicPadicLFunctionsPartII` finds no citation on main or at any open head. On the board, only the ColemanPowerSeriesPartII design cites it, and that design is at line 284 of `merge-order/ORDER.txt`, below both positions.

2. **F02** (P3) A Conventions locator points into the proof of Theorem 3.5

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:30`, "(KS-v4, §§2.4, 3.2–3.4, pp.22–23,33–39, KS-v4 lines 961, 1383, 1486, 1506)".

   **Claim.** Each line pointer supports a convention fixed in this paragraph (cap, orientation, current pairing, Hermitian form). Line 1383 supports none of them. This is the round-2 F04 pattern, found once more in text no repair touched.

   **Witness.** KS-v4 line 1383 is inside the proof of Theorem 3.5, p.32 (§3.1), outside the cited sections and pages. The unit-torus coordinates r₁,…,r_(d−1) that the paragraph orients are at KS-v4 line 1444, p.33 (§3.2).

   **Repair.** Replace "1383" with "1444". The other three pointers are correct: 961 is Proposition 2.27 (p.22), 1486 is Definition 3.9 (p.34) and 1506 is Definition 3.11 (p.35).

Two findings, both P3 (non-blocking). All four round-2 findings are repaired, and the repairs were checked by direct computation. The repaired text introduces no new mathematical defect. The two analytic headline theorems elaborate with only the two `sorry` warnings. They pass the numerical theta-identity test in dimensions one and two and are not padding. The acceptance is conditional on the twelve declared supplier gaps listed in `review.json`.

## Previous findings (round 2), checked first

The repair commit changed only `README.md` (66 lines) and the docstring of `Suggested.lean`; `merge-order/ORDER.txt` was not edited. No round-2 finding was repaired by a merge-order move. The roadmap is still at line 202, right after PeriodsAndSpecialValues. The moved line above was already present in round 2. The repair report's quoted dependency-check output omits it; the actual output is quoted below. No finding was marked not actionable, so there is nothing to re-raise.

| Finding | Status | Repaired passage (quoted) and independent check |
| --- | --- | --- |
| F01 (P1) unsigned interpolation | **Repaired** | README:1212 "(Ω_p^α(Ω_p∨)^β)⁻¹∫_(G_f)χ(g)dμ_f(g)=ε(d,β)·𝒩_(α,β)(…)"; README:1156 smoothed formula with ε(d,β)·(Nc−χ(c)⁻¹); README:1193 "M(χ)=Ω_p^α(Ω_p∨)^β·ε(d,β)·𝒩_(α,β)(…)"; §§4.3, 7.1 and 7.4 now state that the sign is carried through. Recomputed at χ((λ))=λ⁻⁴ on ℚ(i), c=(7): ε(1,0)=−1 and δ_c(χ)=49−2401=−2352, so εδ_cU=+2352U, and U≠0 (factors 80/81, (12−24i)/5, (632−24i)/625 and Local=1 are all nonzero). ε(1,1)=ε(2,0)=+1, so no single global sign could replace ε. |
| F02 (P1) missing conductor-one translation | **Repaired** | README:1159 "Define μ_(O_L,c,c′)=δ_(Art(c′))*μ^raw_(O_L,c,c′). This translation is an integral bounded automorphism, and it changes that factor to χ(c′)(χ(c′)⁻¹−1)=1−χ(c′)". Recomputed the four-term distribution (KS-v4 lines 2494–2498) with the homothety E(0;c⁻¹Λ)=χ(c)⁻¹E: it gives (χ(c′)⁻¹−1)(Nc−χ(c)⁻¹). At c′=(3) the raw factor 80 becomes 80/81 after translation; the signed raw multiplier 188160 becomes 62720/27=2352·80/81; a twist with ψ(c′)=−1 turns −82 into 82/81. Convolution with δ_g multiplies a character moment by χ(g). |
| F03 (P1) whole-theta divisibility | **Repaired** | README:760 "This is a statement about the selected critical coordinates. The integral descent of weighted ray-quotient measures is the separate theorem of §8.3"; README:1153 "ν_(f,c,Γ₀) belongs to m·Meas(G_f,O_(ℂ_p))". The dyadic negative control (README:953, 1017) and the quotient model (README:1186) are added. The new theorem was checked to be true (row §8.3 descent below), and the dyadic curve data were recomputed. |
| F04 (P3) two line pointers | **Repaired** | README:132 "Theorem 1.1, p.7, KS-v4 line 289 … Definition 1.2, pp.7–8, KS-v4 line 324; Notation 1.3 and Proposition 1.5, p.8, KS-v4 lines 342, 357"; README:1245 "KS-v4 lines 2625, 3009". Opened lines 289, 296–322, 324, 342, 357 (page 7 starts at 288, page 8 at 335) and 3009 (Theorem 5.22, p.65). The same pattern elsewhere: one more slip, R02. |

## Verified sound

### Adversarial table

Coverage: the two Lean headlines, the fifteen sampled targets, and every target the repair touched or that a finding touches. For text no repair touched I rely on the round-2 table, whose rows all carry computed values. The rows below are newly computed in this round.

| Statement | Instances tried | Values computed on each side / wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| `kronecker_meromorphic_continuation` (§3.4) | d=1, h=1, Λ=ℤ[i], z=w=0, ν=0 and ν=1 | Σ′(m²+n²)^(−s)=4ζ(s)L(s,χ₋₄): value at 0 is 4(−½)(½)=−1 (finite, so analytic at 0); residue at 1 is 4·π/4=π. At ν=1 the terms at λ and −λ cancel, so K¹≡0 is analytic at d. Convergence needs exponent \|ν\|−2Re s<−2d (`ZLattice.summable_norm_sub_rpow`), i.e. Re s>d+\|ν\|/2, as in the Lean statement | Sound | — |
| `kronecker_functional_equation`: the theta identity behind it | d=1, h=3, Λ=ℤ(1+0.3i)+ℤ(0.2+1.7i), z=0.21−0.37i, w=0.13+0.44i, t=0.83, ν=0,1,2,3; d=2, h=(2,0.7), generic non-product lattice, ν=(0,0),(1,0),(0,2),(1,1), t=1.1 | Truncated sums agree to within 5·10⁻¹⁶ (d=1, ν=0: 0.24276640+0.00019712i on both sides). Wrong models: phase Im H(z,w) instead of Im H(w,z) gives an error of 0.23; Lebesgue instead of metric covolume gives an error of 0.49 | Sound | — |
| Residue at d and the alternating dual | d=1, h=2, Λ=ℤ[i] | Im(2ℓm̄)∈ℤ for m=1,i gives Λ*=½ℤ[i]; vol_H=2·1=2; π/(Γ(1)·2)=π/2, the residue of 2^(−s)K_(h=1) | Sound | — |
| Pointwise exclusions | d=1, ν=0, z=w=0, s=0 | `Complex.Gamma_neg_nat_eq_zero` gives the total value 0, while M has residue −1 at 0, so the exclusion of Gamma poles is necessary | Sound | — |
| §0.3 invariants (sample) | ℚ(ζ₃), Γ=μ₆, weight 3σ, M=R/(2); a=β=0 | ζ₆³=−1≡1 mod 2: invariants are all of R/(2) for a nontrivial weight; over torsion-free R the invariants are 0. The determinant gives weight −1 | Sound; torsion-free hypothesis essential | — |
| §1.1 trace-zero (sample) | 3-point kernel; dyadic D=E[15]∖e | (2,−1,−1) sums to 0; restricting it off e gives −2. Dyadic: 24·8−192+8·0=0 over 224=24+192+8 points | Sound | — |
| §1.2 residue / trace (sample) | d=1, Γ=1, two-point D | H⁰(A,F)=0 and H¹≅R (Corollary 2.17); trace sends (1,−1) to 0 and (1,1) to 2 | Sound | — |
| §1.4 derivatives (sample) | z²; z₁z₂ | ∂²z²=2 against divided-power coefficient 1; the (1,1) derivative of z₁z₂ is 1 | Sound | — |
| §2.1 specialization (sample) | d=1, Γ=1, a=b=0; S₃ on ℤ³ | The value is the augmentation; S₃ invariants {(r,r,r)} have rank 1, not 3 | Sound | — |
| §2.6 degrees (sample) | d=1,2,3 | Coherent degree d−1: 0,1,2; de Rham degree 2d−1: 1,3,5 | Sound | — |
| §3.2 differential sign (sample) | d=1 at (1,0); d=2 at (2,0) | (−1)^(3d−1−p−q)=−1 and −1. Stokes with a test of degree N−p−q−1 gives (−1)^(deg η+1), the same values | Sound | — |
| §3.6 current = class (sample) | h=(2,−1,−1) | Zero Fourier mode Σh(t)=0, matching KS-v4 line 1821 (φ₀=0). (A+v)⁻²=A⁻²−2vA⁻³+…, so the b=0 and b=1 coefficients have opposite signs (the source's expansion at lines 1866–1875 omits (−1)^b) | Sound | — |
| §5.3 partial L (sample) | χ=N | w=2 and χᵘ=1 give ζ_L(s−1). Euler denominator 1−Nv^(1−s); the wrong shift gives 1−Nv^(−s−1) | Sound | — |
| §5.4 critical descent (sample, repaired) | d=1, O_f×=μ₂, Γ₀=1; dyadic datum α=2, β=0 | λ↦−λ acts freely on the evaluation set (x∉D, x fixed by −1), so EK₁=2·(μ₂-orbit sum) termwise for large Re s. Dyadic case: Σ_D h(t)x(t)=2·Σ over 112 pairs, with x(t) 2-integral for odd-order torsion. A ℤ₂-coordinate 1 would give ½ | Sound; whole-theta claim gone | — |
| §5.6 differences (sample) | χ(c)=2, Nc=7 | χ(c)Nc−1=13 against the atom 13/2. χ(c)·χ(b)[Nc·E−E(c⁻¹)] equals χ(c)Nc·L(b)−L(bc), as in KS-v4 line 2466 | Sound | — |
| §5.7 new Check | χ=λ⁻⁴, c=(7), c′=(3) | Raw 80·(49−2401)=−188160; times 1/(2401·81) gives −1280/1323=(80/81)(49/2401−1); 1323=3³7² lies in ℤ[1/441] | Sound | — |
| §5.8 Shimura (sample) | ℚ(i); ℚ(i,√(1+i)) | Exponent [L:K]=1 and 2 | Sound | — |
| §5.9 Deligne (sample) | L_f(χ,0)=0, c⁺≠0 | 0/c⁺=0 lies in Qbar but not in Qbar× | Sound | — |
| §6.3 dyadic negative control | y²+xy=x³−x²−2x−1, ℚ(√−7), p=2 | b₂,b₄,b₆,b₈=−3,−4,−4,−1; c₄=105; Δ=−343; j=−3375; the only affine 𝔽₂-point is (0,1), so #E=2 and a₂=1; X²−X+2≡X(X−1). The reduced differential has residue −1≡1≠0, contradicting a 2-divisible expansion | Sound | — |
| §7.1 moments (sample, touched) | (1+T)^m; d=1, a=3, β=0 or 1 | δ_m has k-th moment m^k; signed coordinates −6E against +6E (ε=−1, +1). Dyadic: μ=2η would make θ=2·Amice(η), contradicting residue 1 | Sound | — |
| §7.4 new Check | A=2, B=3, v=5, w=7 | −(10+21)=−31 on both sides; dropping the sign gives +31 | Sound | — |
| §4.3 / Conventions ε | (d,\|β\|)=(1,0),(1,1),(2,0),(3,0),(5,0) | ε=−1,+1,+1,+1,−1. The source's printed factor (−1)^(d(d−1)/2) is +1,+1,−1,−1,+1, so the README's correction factor is (−1)^(\|β\|+1) | Consistent | — |
| §8.1 local factor (sample) | 𝔽₃ quadratic character | (ζ₃⁻¹−ζ₃⁻²)/3=−i/√3; the positive kernel gives +i/√3; for unramified χ, c=b=1 and Local=1 | Sound | — |
| §8.3 signed smoothed formula | ℚ(i), p=5, f=(3), χ=λ⁻⁴, c=(7) | U_(3)={1}: i−1, −2, −i−1 ∉ 3ℤ[i]. εδ_cU=(−1)(−2352)U=2352U; (2+i)⁴=−7+24i gives 1−(−7+24i)/5=(12−24i)/5 and 1−(2−i)⁻⁴=(632−24i)/625 | Sound | — |
| §8.3 descent theorem (new) | Torsion T ⊂ U_f, weighted measure λ=N_Σ(t)⁻¹μ_Eis | The moments give (φ_ζ)_*μ=N_Σ(ζ)μ for φ_ζ(t,s)=(ζ⁻¹t,ζs), hence λ is T-invariant, and q_f(t⁻¹,s) is constant on T-orbits. T acts freely on units, so with a clopen fundamental domain the pushforward lies in \|T\|·Meas. For f≠O_L prime to p, p∤\|tors U_f\| (ζ≡1 mod f forces f to divide (1−ζ)); the free index is covered by the subgroup law. Model: δ₁−δ₋₁ takes 1+4ℤ₂ to ½ after halving, while the weighted pushforward is 2δ_[1] and gives δ_[1] | True and well posed | — |
| §8.3 subgroup law / API | [U_f:Γ₀]=2, [Γ₀:Γ₁]=3; family relations | 2η/2=6η/6=η. δ_bδ_cδ′_(c′)M is symmetric in (b,c), and also under the exchange (b′,c′) | Sound | — |
| §8.4 M | same χ | M=−Ω_p⁴U and δ₇M=2352Ω_p⁴U; on C_p the average p⁻¹Σδ_g gives 1/p | Sound | — |
| §8.5 headline formula | ε at β=0,1; scaling u=2 at p=5, α_σ=2 | −U and +2352U after smoothing; both sides scale by 1/4 | Sound | — |
| Scope line 18 (R01) | dependency check | 588 edges with a moved line; 587 edges with no moved line after the rewording | P3 | R01 |

Arithmetic unit groups are abelian, so the nonabelian test (S₃) is applied only to the generic equivariant comparison. Rank 0 and h=0 are excluded by the explicit `hd` and `hh` binders, whose junk values (`Real.log 0 = 0`) would otherwise give a false denominator of 1.

### Seeded source sample (KS-v4, 85-page arXiv v4; printed page = PDF page, checked at the page-end numerals)

| Target | Opened at | Hypotheses and support |
| --- | --- | --- |
| 0.3 | Proposition 1.5, p.8, line 357; Corollary 1.14, p.11, line 503 | The source assumes R in a number field; the README adds R-torsion-free modules, as the μ₆ countermodel requires. Matches |
| 1.1 | Definition 2.18, p.19, line 836; Notation 2.19, p.20, line 849; Definition 2.26, p.22, line 938; proof of Theorem 4.10, p.53, lines 2490–2498 | Étale δ and δ∨, D=ker δ or ker δ minus e, two-auxiliary pullback. Matches |
| 1.2 | Corollary 2.17, p.19, line 821; Proposition 2.32, p.26, line 1106; Corollaries 2.33–2.35, pp.26–27 | Vanishing below d, lci Ext computation, and the lim/R¹lim step that the README routes to a declared gap. Matches |
| 1.4 | Definitions 2.21 (p.20, line 879) and 2.23 (p.21, line 901) | a-th derivative into TSym^a Ω¹⊗P̂♮⊗Ω^d. Matches |
| 2.1 | Definition 2.24, p.21, line 918; (2.3.3)–(2.3.4), lines 912–916; Remark 2.25, p.22 | Affine base, Γ-fixed torsion section, φ♮ étale, collapse to group cohomology. Matches |
| 2.6 | Remark 2.37, p.29, line 1266 | Field base of characteristic zero, degree 2d−1. The source only remarks that this "can be shown" and gives no proof; the README makes it an owned target with a proof route. Supported as a statement |
| 3.2 | Definition 3.9 and Corollary 3.10, p.34, lines 1486–1496; Corollary 3.22, p.41, line 1891 | Bidegree (d−p,2d−1−q) tests and the form-to-current quasi-isomorphism. The README adds the sign and the normalisation explicitly. Matches |
| 3.6 | Definition 3.19, p.39, line 1789; Theorem 3.20, p.39, line 1795; Corollary 3.22, p.41 | ∇″φ=δ_f vol and the class identification; the binomial sign is corrected (Source issues). Matches |
| 5.3 | Lemma 4.2 and (4.1.2)–(4.1.3), p.47, heading at line 2215 (README cites 2213, two lines earlier in the same lead-in) | χ(b)Nb^(−s)E(1,s;fb⁻¹,O_f×) with the zero term omitted. Matches |
| 5.4 | Theorem 4.9, p.50, line 2353; (4.3.1), p.50, line 2366 | h ∈ R[1/Nc][D]^(0,O_f×), target ring R[1/(fN(bc))]. The README adds the torsion-free descent that the source's proof skips. Matches |
| 5.6 | Corollary 4.13, p.52, line 2463 | χ(c)Nc·L(b)−L(bc) and the χ(b) denominator argument (line 2473). Matches |
| 5.8 | §4.5, (4.5.1), p.53, line 2518; Corollary 4.14, p.54, line 2534 | Norm-pullback type and exponent [L:K]. Matches |
| 5.9 | Corollary 4.15, p.54, line 2551; Remarks 4.16 (p.54) and 4.17 (p.55) | The criticality of the restricted motive is assumed. The source writes Qbar×; the README correctly allows zero (Source issues). Matches |
| 7.1 | Proposition 5.20, p.65, line 2991; Definition 5.21, line 3004; Theorem 5.22, pp.65–66, line 3009 | Exponent Ω_p^(a+1); the measure corresponds to θ_Γ for torsion-free Γ (the §5.1 standing assumption, line 2611). Matches |
| 8.1 | (5.6.1), p.72, line 3332; Definition 5.26, p.73, line 3373 | F extended by 1 at trivial Σ-components; (c)b decomposition with c∈P_f. The README adds λ≡1 mod f, which the source's definition of χ_fin needs. Matches |

The repaired pointers were also opened: lines 3417 (p.74), 3468 ((5.7.1), p.75), 3507 (p.75), 3514 (p.76), 3681 (Step 3, p.78), 836/870 (pp.19–20) and 2941 (Definition 5.16, p.64); all are correct. The author flagged no locator as unverified. Every other `KS-v4 line N` pointer in the README was mapped to its line: all land on the named result or in its lead-in, except R02. BKO-2021 line 70 (p.944) supports the inert supersingular boundary. Both manifest texts were readable from the sources cache. No source was fetched and `sources.toml` is unchanged.

### Lean form and elaboration

- `lake env lean` on the package `Suggested.lean`, run from the content checkout (main 5f173a7; Mathlib 6b7abb3, Tau Ceti a91d3aa per `lake-manifest.json`), exited 0 in 11 s. There were exactly two warnings, both "declaration uses `sorry`", at lines 63 and 86. No `TauCeti.*` import is used, so no object build was needed.
- A scratch copy with `#check @name` for all four declarations elaborated with exit 0. The types agree with §§3.3–3.4: `0 < d`, `∀ i, 0 < h i`, `DiscreteTopology Λ`, `IsZLattice ℝ Λ`, the alternating-dual iff for Λd, the Gamma and pole exclusions, and the punctured-neighbourhood residue. `ZLattice.covolume Λ MeasureTheory.volume` is product volume. All binders are explicit, so no section variable is lost, and nothing changed. Two proved scratch `example`s confirmed `hermitianPairing` is conjugate-linear in its second argument (H(1,i)=−i) and that `kroneckerTerm` is 0 on the omitted branch.
- Padding probe: each theorem was tried with `simp`, `rfl` and `infer_instance` (all three fail). In a separate clean file `exact?` also fails for both. An earlier combined file let `exact?` reuse error-admitted copies, so that result was discarded. Neither theorem is padding, and the two definitions are the formulas the headlines need.
- One `import Mathlib`; no `set_option`, `lemma`, sorried data, admitted `example`, `#eval`/`#print`/`#synth` or process comment. All four names occur in the README. `roadmaps grep` finds none of them on main or at any open head.

### Headline theorems

README headlines: the unique coherent residue class (§1.3); refined integral evaluation and the polylogarithm comparison (§§2.4–2.6); continuation and functional equation (§3.4); the current comparison and the explicit class (§§3.6, 4.3); regularised integrality (§5.7); Shimura algebraicity (§5.8); the weak Deligne relation (§5.9); the integral Eisenstein measure (§7.1); signed bounded interpolation with descent and uniqueness (§§8.3–8.5). Only §3.4 is statable on native carriers, and it is stated. The other eight are named in the module docstring with their missing carriers. The repair updated the §8 entry to "Signed bounded ray-class interpolation, integral unit-index descent …", which matches the README. At the pins there is still no abelian scheme with CM, no CM period datum, no ray class field or Galois tower, and no multivariate integral Amice carrier, so the docstring's claims hold. No stand-in is used.

### Pinned-library declarations opened (file:line at the pins)

`Mathlib/NumberTheory/NumberField/CMField.lean:69` (`IsCMField`: totally complex and quadratic over the maximal real subfield); `Units/DirichletTheorem.lean:373, :415`; `Algebra/Module/ZLattice/Summable.lean:236` (hypothesis r<−finrank); `ZLattice/Basic.lean:433`; `ZLattice/Covolume.lean:72, :98`; `NumberTheory/Padics/Measure/Basic.lean:40` (top-level `AbstractMeasure := C(X,R) →L[R] E`, with no mass or norm axiom), `:97, :105`; `Measure/Monoid.lean:98, :115`; `Measure/AmiceTransform.lean:157` (ℤ_p coefficients on ℤ_p only); `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:352` (0<Re b); `Analysis/MellinTransform.lean:90`; `Gamma/Basic.lean:319` (0<Re s), `:344`; `TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean:416, :568` (namespace `TauCeti.Comodule`); `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60` and `Shift.lean:273` (namespace `TauCeti.GlobalNumberFields.HeckeCharacter`). All 21 citations resolve to the stated declaration.

### Cross-roadmap citations and ownership

`roadmaps resolve` (main 5f173a7, 362 open heads) reports no unresolved citation or local Lean name. Supplier sections opened:

- On main: GlobalNumberFields Layers 2, 7, 9, 10 (`TauCetiRoadmap/GlobalNumberFields/README.md:273, 453, 502, 525`); ClassFieldTheory Layers 7, 11–13 (lines 1312, 1683, 1724, 1799); ThetaSeries items 1A, 1E, 1F, 2A, 2C (lines 432–507); SchemeAndStackFoundations §§2.6, 2.7, 2.19, 2.20, 2.23 (lines 3437–4558); AlgebraicTopology Stages 5, 6, 8 (lines 849, 946, 1602); DifferentialGeometry Layers 0, 1, 5; Hyperfunctions HF2.AnalyticPreparation.CurrentResolution (line 251); PadicMeasuresIwasawaAlgebras §§0.1, 1.2, 1.7, 2.1, 2.2, 3.1. The §1.2 convolution and Dirac evaluation, and the §2.1 weighting with naturality under pushforward, support the new Artin-translation citation in §8.3.
- At open heads: ComplexMultiplicationAndExplicitReciprocity §1.3 and `cmHodgeEigenspaces` (head 0c6c6e2, line 432: inverse cotangent action); AbelianSchemesAndArithmeticModuliPartII P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4, P4.1–P4.3 (fe15b14); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.7, R07.1.9, R07.1.13 (34f4657); ComplexComparisonPartII C1.1, C5.1, C5.4 (2d50a88; C5.4 contains `CurrentCalculus`); AutomorphicLFunctionsAndLocalFactors AL.0 and AL.1 with the four quoted subsection titles (5d22a23); PeriodsAndSpecialValues PS.0, PS.1 (a651410).
- Merge order: every new-roadmap supplier is above line 202 (lines 46, 57, 96, 135, 186, 201), and the main-branch suppliers impose no order. The README does not cite the base `AutomorphicPadicLFunctions`, which exists nowhere (settled in the round-1 repair).
- Ownership: object searches for Katz/CM Eisenstein measures, Eisenstein–Kronecker classes and Kings–Sprang constructions on main, the open heads and the readable board packages found no competing general construction. ModularIwasawaMainConjectures treats Katz functions as external inputs. DirichletPadicLFunctions handles Dirichlet characters, a different object. This roadmap owns the general CM measure and the new weighted-quotient descent, which are specific to these residue measures.
- Note for the maintainer, not a finding against this package: the board package AutomorphicCongruences (head 08f531f, line 111) declares `gap:katz-cm-padic-l` with supplier PadicFamilies. That gap asks for Katz's two-variable function for an imaginary quadratic field at a split odd prime, which is a special case of §8.5 here. PadicFamilies at head #1019 plans no CM measure. Rerouting that gap to this roadmap's §8.5 respects the order: AutomorphicCongruences is at line 248, below this roadmap.

### Declared gaps

All twelve slugs in the brief appear in `design/plan.json` and in the README's `## Exact supplier contracts`, with byte-identical needs sentences and the same suppliers (checked by script). Each supplier section exists where it is cited. No gap has supplier `none`, none asks for something this roadmap or an earlier one provides, and the repair added none. One minor point: §5.9's *Needs:* cites PeriodsAndSpecialValues PS.0 and PS.1 without the slug tags, but the contracts declare both gaps.

### Dependency check (required command, run unedited)

```text
moved: AutomorphicPadicLFunctionsPartII moved in the merge order from #201 to #212, right after its last supplier NonordinaryCMSpecialValues; checked as moved (the worker moves it there when it submits)
depcheck: 51 roadmaps, 588 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The moved line is a false positive from README line 18 (R01). If the move is applied, it creates no cycle with any supplier or consumer (see R01).

### Shape and policy

All headings follow the house form: Summary, Scope, Conventions, contracts by supplier, build paragraph, nine layers each ending in Examples and Dependencies, Downstream consumers, Worked examples and References. 44 targets. Every definition has its API list and at least three Checks; the repair added Checks only. No LaTeX delimiters, no process words, no pull-request numbers in the README, and no computational algorithm.

## Not verifiable

- Only part of the class-sign chain was re-derived. I recomputed the binomial sign of the inverse-power expansion and the propagation of ε through §§7.1, 7.4 and 8.3–8.5. For the contraction sign (−1)^(j+1)j!C behind the factor (−1)^(\|β\|+1) relative to KS-v4 Theorem 3.27, I rely on the round-2 computed rows (§3.5 contraction coefficients). The interpolation formula is therefore correct relative to the README's own current conventions, which were verified at the local level.
- The extraction drops some overlines (for example (z+λ)^µ at KS-v4 line 1512). Bars were inferred from the types and from the numerical theta test, not from glyphs.
- HigherHidaAndColemanTheory at head da88512 returned no README content, so ownership against that package's prose is not certified. As round 2 records, fourteen other indexed board packages were not readable either. AutomorphicCongruences and KatoEulerSystems were read; neither has a competing construction.
- de Shalit's argument, which KS cites for Step 2, was not opened. The package owns the uniform bounded division (§8.4) and does not rely on it.

## Source issues

- **Error** in KS-v4 at proof of Theorem 3.20, p.41: the source says the inverse-power expansion of (A+ℓ̃)^(−(j+1)) has coefficients (j+b)!/j! with no sign; it should carry (−1)^b; affects the proof.
- **Misprint** in KS-v4 at Proposition 3.13, p.35: the source says the functional-equation phase is exp(2πi⟨z,w⟩); it should be ⟨w,z⟩, as in its own theta identity three lines later; affects a stated result.
- **Error** in KS-v4 at Theorem 5.27, Step 1, p.74: the source says the kernel over the tame ray group is the local units modulo the closure of all global units; it should be the closure of units congruent to one modulo f; affects the proof.
- **Gap** in KS-v4 at Theorem 5.27, Steps 1 and 3, pp.74–78: the source says to use the Eisenstein measure for Γ=O_f×, which may contain roots of unity; §5.1 constructs it only for torsion-free Γ, so a torsion-free subgroup and quotient descent are needed; affects the proof.
- **Gap** in KS-v4 at Theorem 5.27, Step 1, p.76: the source says inserting Theorem 3.27 gives the stated unsigned expression; it should retain at least the class sign (−1)^(d(d−1)/2) printed in Theorem 3.27; affects the proof.
- **Gap** in KS-v4 at Theorem 5.27, Step 3, p.78: the source says the conductor-one measure has factor 1−χ(c′); the four-term distribution gives χ(c′)⁻¹−1, so a translation by c′ is needed; affects the proof.
- **Gap** in KS-v4 at Theorem 5.27, Step 4, p.79: the source says characterwise integrality and density make the quotient a measure; it should first establish a uniform bound or congruence criterion; affects the proof.
- **Misprint** in KS-v4 at Corollary 4.15, p.54: the source says the normalised L-value lies in Qbar×; it should be Qbar, since the value may vanish; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "aea0e21", "job": "REV-PKG-AutomorphicPadicLFunctionsPartII~3", "model": "opus", "worker": "fable-rev112"} -->
