# Review of OperatorAlgebraDynamics (pull request #1137 at b15a0d4)

**Verdict:** needs changes

This is an incremental re-review of the 34 lines of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` that changed since 53ad990: the Tau Ceti contract bullet at lines 419–430 and the HeisenbergImprimitivity, CompactQuantumMetricSpaces and OperatorKTheory bullets of Downstream consumers at lines 3437–3475. `Suggested.lean` has not changed: `git diff --stat 53ad990 HEAD` on it is empty. Tau Ceti is pinned at 2fd255d9, both on this branch and on main.

## R01 (P3) — An open pull request rewrites this `Suggested.lean`, and no merge order is stated

Carried forward unrepaired from R03 of the review at 53ad990, which was R08 of the review at 2ccd93b. The job directory holds no repair report, so there is no recorded reason for leaving it.

Location: the pull request description. Its revision-dependencies line reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". Nothing else in the description mentions #1187.

Claim: the description states a merge order for every open pull request that changes this roadmap.

Witness: `scratch/overlaps.md` reports that #1137 and #1187 conflict in `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`. #1187 is at 66ed0d4 and pins Tau Ceti at ab00ba392. It edits main's version of this file at lines 46, 56 and 63, changing `_root_.ContRepresentation.IsUnitary` to `ContRepresentation.IsUnitary`. This pull request replaces that file wholesale.

Repair: state the order in the description. Either #1187 merges first and this branch is rebased on it, or this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk.

## Previous findings

- R01 — repaired: lines 419–429 now give `ContRepresentation.integratedOperatorL1` with its file `TauCeti/RepresentationTheory/Continuous/Integrated/Basic.lean`. That declaration exists at the pin (line 144), so the r20 finding was mistaken: line 1253 was already correct, and the added file locator is accurate.
- R02 — repaired: lines 3448–3475 say that HeisenbergImprimitivity §3.1, CompactQuantumMetricSpaces (through §3.1 and K7.5) and OperatorKTheory K7.5 consume the instance of D1–D2.CentralTwists at `A=ℂ`, trivial action, `ω=c` and counting Haar measure.
- R03 — not repaired: the description still reads "which merge first: #1097, #1771, #1015, #863" and says nothing about #1187. It is carried forward as R01.

## Verified sound

**Gate, dependency check, elaboration.**

- My run of the gate on this head reports every check at 0, then `OK`. The worker's gate at this head also passes the targeted build (`build=0`). The diff of `origin/main...HEAD` outside the folder is empty.
- The dependency check prints `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings and nothing else (lines 94, 107, 122, 194, 213, 229, 250, 271, 282, 299, 315, 337, 361). It took 15 s.
- The file is byte-identical to 53ad990, so three results of the review at 53ad990 still hold:
  - the one-tactic probe: none of the 13 closes;
  - the `#check @name` comparison of all 16 declarations against `scratch/signatures.md`: no section binder is lost;
  - the headline table: everything statable is stated, and docstring lines 45–71 name the missing carrier of each headline that is not.

**Pinned declarations opened for the changed text** (Tau Ceti 2fd255d9, Mathlib at the manifest pin):

- `TauCeti/RepresentationTheory/Continuous/Integrated/Basic.lean:144`: `ContRepresentation.integratedOperatorL1`, of type `(G →₁[μ] 𝕜) →L[𝕜] E →L[𝕜] E`, given by `∫ f g • π (.ofAdd g) v ∂μ`. Its hypotheses:
  - strong continuity `hcont` and a uniform bound `hbdd`;
  - `[AddMonoid G] [R1Space G] [BorelSpace G]` and `[μ.InnerRegularCompactLTTop]`;
  - the bound `‖π(f)‖ ≤ C‖f‖₁` (line 191).
- `TauCeti/Analysis/CStarAlgebra/Action/Covariant/Integrated.lean:222`: `integratedOperator_eq_coefficient_mul_integratedOperatorL1`. It says `P.integratedOperator μ f = P.coefficient a * (P.group.restrict …).integratedOperatorL1 … (toL1 φ)` when `f g = φ g • a`, with `G` retagged as `Additive G`. This is the "scalar operator on the right" that line 427 describes, and line 317 cites the lemma above it.
- `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:49`: `ContRepresentation.IsUnitary`.
- Mathlib `MeasureTheory/Measure/Regular.lean:46, 56`: Haar measures, and inner regular measures, are `InnerRegularCompactLTTop`.

**Cross-roadmap citations resolved for the changed text** (heads from `roadmaps list`, 2026-11-08; file line numbers):

- OperatorKTheory, #866 at 1377338:
  - Scope lines 48–51: "OperatorAlgebraDynamics owns the scalar twisted group C*-algebras `C*(L,c)` …".
  - Contract lines 172–182 and 236–248: the instance at ℂ, trivial action, scalar normalized ω, counting measure.
  - Lines 1828–1850, "### 7.5": consumes `W_x`, which is D2.CentralTwists' `V_x`, together with `τ=E=⟨δ_0,·δ_0⟩`, `α_χ=Ad(M_χ)`, point-norm continuity and the universal property.
  - Lines 1850–1866: K7.5's own content, the bicharacter `ρ(x,y)=c(x,y)conj(c(y,x))`, the centre and simplicity.
  - The bullet at 3464–3475 matches all of this.
- CompactQuantumMetricSpaces, #1155 at 7db4c19:
  - Lines 94–98, 299–308 and 1537 take the algebra, trace, gauge average and full=reduced theorem from HeisenbergImprimitivity §3.1.
  - Lines 103–106, 309–315 and 1509 take only point-norm continuity from OperatorKTheory K7.5.
  - The bullet at 3454–3463 describes this route correctly.
- HeisenbergImprimitivity, #1149 at a9eeb6e: §3.1 is at line 440 and uses the same conventions:
  - `(λ_c(x)h)(y)=c(x,y−x)h(y−x)`, `τ(f)=f(0)` and `α_γ(δ_x)=γ(x)δ_x`;
  - the star `conj(c(−x,x))conj(f(−x))`, computed below.

**Ownership by object.** `roadmaps grep -i 'twisted group C\*-algebra'` over the open heads and main finds four roadmaps:

- this roadmap, the owner, with its single-owner list at lines 71–78;
- OperatorKTheory, which consumes from here;
- CompactQuantumMetricSpaces, which consumes through HeisenbergImprimitivity and OperatorKTheory;
- HeisenbergImprimitivity.

This roadmap is the owner: it is on main, HeisenbergImprimitivity is not in the merge order, and OperatorKTheory has already repointed. #1097 also changes this roadmap, and the description orders it first.

**Seeded sample.** None of the five seeded targets lies in the changed passages, so their verification at 53ad990 carries over:

- D2.BoundedSequenceTranslation, now at line 1693;
- D2.SequenceToeplitz at 1777: `arici-mesland2019` lines 103–127 re-read; relations (3) and extension (4) are as cited;
- the saddle flow at 1865;
- D5.Fields at 2378;
- the concrete Cuntz families.

No README locator is flagged as unverified.

**Remarks on text this change does not make wrong (no change asked):**

- HeisenbergImprimitivity at a9eeb6e still builds `C*(L,c)` in §3.1 (lines 442–465). Its Scope (lines 30–39) says no roadmap on main owns it. Line 3453 states the settled contract, and the repointing belongs to #1149.
- The K7.5 enumeration at 3474–3475 leaves out the identification `A_θ≅C*(ℤ²,c)` that K7.5 also exports (OperatorKTheory lines 1867–1871). No ownership claim conflicts with it.
- The contract bullet's "additive group", "Banach space" and "inner regular on compact sets" are narrower than the pin's `AddMonoid`, normed `E` and `InnerRegularCompactLTTop`. Every consumer here meets the narrower form.

**Adversarial table.** The first five rows are new and cover the changed statements. The other rows are carried from the review at 53ad990 (r20), with their computed values; the README line numbers in those rows are r20's, and README lines after 416 sit 9 lines higher at this head.

| Statement (README line / Lean) | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `ContRepresentation.integratedOperatorL1` contract (419–429) | `G=ℤ`, `E=ℂ²`, `π(n)=diag(1,(−1)^n)`, counting μ, `f=δ_0+δ_1`; μ=0 | `π(f)=diag(2,0)`, `‖π(f)‖=2≤C‖f‖₁=1·2`; μ=0 gives `π(f)=0` | bound and formula as the pin states | none |
| "scalar operator on the right … scalar case of D1's integrated form" (426–429) | `A=ℂ`, coefficient `a↦aP` (P a projection commuting with U), `f=φ⊗a`; P=0 | `∫φ(g)aP U_g dg = (aP)·∫φU = coefficient(a)·L1(φ)`; P=0: both sides 0 | matches `Integrated.lean:222` | none |
| HeisenbergImprimitivity bullet, same conventions (3445–3453) | ℤ/2, `c(a,a)=−1`; `f=δ_a` | `λ_c(a)δ_0=c(a,0)δ_a=δ_a`; star: HI `conj(c(−a,a))conj f(−a)=−conj f(a)`; D1.CentralTwists `ω(a,a⁻¹)*conj f(a⁻¹)=−conj f(a)` (modular factor 1); `c(a,−a)=c(−a,a)=−1` | identical conventions | none (remark on #1149) |
| CompactQuantumMetricSpaces bullet (3454–3463) | `σ_Θ(p,q)=exp(πi pᵀΘq)`, Θ skew | `σ_Θ(0,q)=σ_Θ(p,0)=1` (normalized); `σ_Θ(p,−p)=exp(−πi pᵀΘp)=1`; `V_pδ_q=σ_Θ(p,q)δ_(p+q)=λ_Θ(p)δ_q` | the instance at `L=ℤᵈ`, `c=σ_Θ` | none |
| OperatorKTheory bullet: `V_x=W_x`, `E=τ`, `α̂_χ=Ad(M_χ)` (3464–3475) | general normalized c; `L=(ℤ/2)²`, `c=(−1)^(x₂y₁)`; unnormalized `c(0,0)=−1` | `V_xδ_y(z)=c(x,z−x)[z−x=y]`, so `V_xδ_y=c(x,y)δ_(x+y)`; `W_xW_yδ_z=c(y,z)c(x,y+z)δ=c(x,y)c(x+y,z)δ`; `⟨δ_0,V_xδ_0⟩=c(x,0)[x=0]=[x=0]=E(u_x)`; `M_χW_xM_χ*δ_z=conj χ(z)c(x,z)χ(x+z)δ_(x+z)=χ(x)W_xδ_z`; (ℤ/2)²: `W_(1,0)W_(0,1)=W_(1,1)`, `W_(0,1)W_(1,0)=−W_(1,1)`, the cocycle of D2.CentralTwists' trace Check; `c(0,0)=−1` gives `W_0=−1`, excluded by `ω(e,s)=1` (877) and `IsFactorSet` | all three identifications hold | none |
| `exists_integratedOperator` (Lean 94; 630), r20 | G=ℤ, `f=δ_0⊗a+δ_1⊗b`; μ=0 | `π(a)ξ+π(b)Uξ`, bound `(‖a‖+‖b‖)‖ξ‖`; μ=0 gives 0 | holds | none |
| Recovery of the pair (Lean 107; 722–726), r20 | H=ℂ, L=0; `A=ℂ²`, `L(x,y)=x` | 0 nondegenerate only on H=0; `π=L`, `U=1` | Williams 2.40 | none |
| Exact sequence (Lean 122; 727–731), r20 | `A=ℂ²`, `I=ℂ⊕0`; I=A; I=0 | kernel = first summand; quotient 0; first map from 0 | Williams 3.19 | none |
| `CentralCocycle.cocycle` (Lean 153), r20 | associativity of `U_rU_sU_t` | `π̃(ω(r,s)ω(rs,t))` = `π̃(α̃_r(ω(s,t))ω(r,st))` | the needed law | none |
| ℤ/2 cocycle and cochain (1024–1030), r20 | `ω(a,a)=−1`, `b(a)=i` | `ω^b(a,a)=1`; `(iδ_a)²=δ_e` | direction ω^b→ω | none |
| Amenable full=reduced (Lean 213; 1288–1297), r20 | ℤ; F₂ with `h=Σ` generators; `ρ=id⊕0` | trivial character 4 vs `‖λ(h)‖=2√3` | amenability needed | none |
| `transitive_commutant_scalar` (Lean 229), r20 | `I={p,q}` swap; I empty | off-diagonal killed, `d_p=d_q`; T=0 | scalar | none |
| Matrix units (1707; 1747), r20 | `Uδ_n=δ_(n+1)` | `E_ijδ_n=[n=j]δ_i`; opposite shift `δ_(2i−j)↦δ_i` | rank-one units | none |
| Band identity (1695–1699), r20 | band-N T | `Σ_k f_k(i)[i=j+k]=⟨δ_i,Tδ_j⟩` | holds | none |
| No characters (1737–1739), r20 | `p=M_(1_{2ℤ})` | `UpU*=1−p`, `χ(p)=½` | holds | none |
| Toeplitz corner (1804–1813), r20 | `e=M_(1_[0,∞))` | `eUeδ_n=δ_(n+1)`, `1−SS*` onto δ_0, `q(eUe)=z` | arici-mesland (3), (4) | none |
| Saddle flow (1856–1888), r20 | `B(0,δ)` | saturation `{|xy|<δ²/2}`; half-axes share branches | T₀, not T₁ | none |
| D5.Fields dimension and Borel (2426–2436), r20 | `N(x)` jumps at ½; non-measurable S | `E_10e_0∉span{e_0}`; coordinate `1_S` | as stated | none |
| Residue Cuntz family (Lean 361; 2794), r20 | n=1; n=2, `b_3` | `S_0=Id`; `S_0*b_3=0`, `S_1*b_3=b_1`, sum `b_3` | relations hold | none |
| Fourier iso ℤ/2 (Lean 299; 2091), r20 | `f=(f_0,f_1)` | `f̂=(f_0+f_1,f_0−f_1)`; `‖δ_e+δ_a‖=2` | holds | none |
| `C*(Ĝ)≅C₀(G)` direction (Lean 315; 2133), r20 | G=ℤ, `z^(−n)` | `t↦[t=n]` | ev as stated | none |
| Dual measure and inversion (2120, 2128), r20 | ℤ/n, ℤ/3 | `μ̂=(1/n)·counting`; conjugate gives `[x=1]` | as stated | none |
| LCAWeyl phase (Lean 346; 2212), r20 | ℤ/3 | `U_1VU_1*=conj(χ(1))V` | `conj(χ(s))` | none |
| V nondegenerate (2218), r20 | approximate identity | `≤sup‖V_χξ−ξ‖→0` | holds | none |
| Takai sign (2266), r20 | ℤ/3 | `Ad ρ_1≠Ad ρ_(−1)` | detects sign | none |
| `σ^ω̄_t=τ̄_(−βt)`, strip map (2888–2893), r20 | `M_2`, `K=diag(0,1)` | `e^(iβt)E_12` both sides; boundary values match V10 | sign right | none |
| Araki expansion, vector, `log Δ`, chain, cocycle (2952–3031), r20 | `M_n`, `Q=−βP` | `Ω^Q=e^(−β(K+P)/2)/√Z_K`; `JL(q)J=R(q)`; `Ω^(Q+Q')`; `u_t=diag(1,e^(iβt))` | holds | none |
| Perturbation sign, KMS identity (2937–2999), r20 | `K=diag(0,1)`, `P=−K`; `a=E_12` | trace = Gibbs of `K+P=0`; `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)` | consistent with pin | none |
| Tensor and zero temperature (3035–3046), r20 | Gibbs at β, 2β; `diag(0,0,1)` | product KMS only if `K_2` scalar; `(½,½,0)` | as stated | none |
| CAR KMS, Weyl signs and norm (3121–3215), r20 | `h₀=ε`; `V=ℝ²` | `1/(e^(βε)+1)`; ratio `e^(−ist)`; `‖W(f)−W(g)‖=2` | consistent | none |
| Ising, on-site, GHZ (3364–3379), r20 | `hσ_3`, `Jσ_3⊗σ_3` | threshold `1/(2+16e)`; `s−βe_Φ=p`; `0+log2≤2log2` | holds | none |
| Powers partition and estimate (Lean 250; 1589–1673), r20 | `F={b}`, ℤ | `wbw⁻¹=aba⁻¹`; ℤ fails with three translates; `≤‖x‖/√N` | two generators needed | none |
| Gauge ℤ/2, twisted trace (1543–1553), r20 | `γ(a)=−1`; `(ℤ/2)²` | `(x+α̂_γx)/2=x_0`; `C*(G,ω)≅M_2`, `τ=Tr/2` | as stated | none |
| Convolution direction, Gram matrix (700–820), r20 | ℤ/3 shift; `M_2` | `(f*g)(2)=e_0`; transposed has eigenvalue −1 | conventions pinned | none |

## Not verifiable

- Brown–Ozawa, Proposition 5.1.3; Cuntz 1977, §1; Bratteli–Robinson, vols. 1–2; Renault, LNM 793: the manifest records these as uncertified and cites them by locator. They are not in the changed passages, and the claims resting on them were checked by computation at 53ad990.
- The board package has no `design/plan.json`, so the gap slugs are declared only in the README; the change touches none of them.
- The job directory holds no repair report after 53ad990, so whether R03 of that review was marked not actionable, and why, could not be read.

## Source issues

- none
