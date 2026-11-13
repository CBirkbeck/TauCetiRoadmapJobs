# Review of AmenableTracesOnCStarAlgebras (pull request #2260 at da19de9)

**Verdict:** needs changes

## R01 (P2) — The nonunital tensor functional has no unit to evaluate

**Location:** `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/README.md:720`: “`μ_τ` is a positive functional on the star algebra `A ⊙ Aᵒᵖ` with `μ_τ(1) = 1`”.

**Claim:** This API includes nonunital algebras. Transporting the GNS space through unitization does not put an identity in `A ⊙ Aᵒᵖ`, or make its product representation unital.

**Witness:** For `A=c₀`, `τ=Σₙ≥₁2⁻ⁿδₙ`, every tensor's diagonal vanishes at infinity, so no tensor is an identity. For truncations `e_m`, `μ_τ(e_m⊗e_m)=1−2⁻ᵐ`, not `1`.

**Repair:** Replace the API sentence by: “For every A, μτ is positive and μτ(a⊗bᵒᵖ)=τ(ab). If A is unital, μτ(1)=1. Otherwise it is the restriction of μτ̃ on Ã⊙Ãᵒᵖ, where μτ̃(1)=1.” Explicitly restrict both unital-homomorphism claims in §1.4 to unital A; retain nonunital star homomorphisms on A. Add the c₀ truncation computation as the negative control.

## R02 (P2) — Nuclear maps have been restricted to contractions

**Location:** `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/README.md:1588` and `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/Suggested.lean:314`: “A map `θ : A → B` between C*-algebras is nuclear (`IsNuclearMap`) when … by composites … of c.p.c. maps”.

**Claim:** This defines nuclear contractions, excluding general nuclear completely positive maps supplied by CStarAlgebras C6.1. The stated identification with that supplier loses its positive-scaling clause.

**Witness:** `θ=2·id_ℂ` is nuclear. Every c.p.c. composite satisfies `‖βα(1)‖≤1`, hence `‖βα(1)−2‖≥1`; `F={1}`, `ε=1/2` refutes `IsNuclearMap θ`. See `TauCetiRoadmap/CStarAlgebras/README.md:1278` on main.

**Repair:** Keep the general name and define it by positive scaling: there exists `C>0` such that, for every finite `F` and `ε>0`, c.p.c. maps `α:A→M_n`, `β:M_n→B` satisfy `‖C • β(α(a))−θ(a)‖<ε` for all `a∈F`. Match §5.1 and the docstring to this definition and cite C6.1's scaling equivalence. Add `2·id_ℂ`: choose `C=2`, `n=1`, `α=β=id`; the error is zero.

## R03 (P2) — Matrix trace uniqueness has two owners

**Location:** `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/README.md:745`: “Prove that for `k ≥ 1` `tr_k` is the unique tracial state of `M_k`”.

**Claim:** V0 already supplies the normalized matrix-trace state and V3 supplies uniqueness of the algebraic trace up to scalar. Changing from finite-dimensional operators to `CStarMatrix` does not create a new mathematical ownership boundary.

**Witness:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:651` and `:1264` on main own these results; PR #2242 retains them at `:672` and `:1285`. On `M₂`, both descriptions give `τ(e₁₁)=1/2`, `τ(e₁₂)=0`.

**Repair:** Delete the independent trace-state/uniqueness proof target and route in §1.5. In scope and supplier contracts, import V0 and V3 through the matrix/operator identification. Keep the real-bodied `matrixTrace` needed by the headlines and the genuinely additional normalized 2-norm comparisons and bimodule identification. State the transported agreement `tr₂(e₁₁)=1/2` as a Check.

## Verified sound

Here `AT`, `QD`, `UAT` denote the three trace properties; `T/F` are truth values. Rows naming Lean declarations cover all 23 admitted headlines; the other rows cover every numbered README target, including all 15 seeded targets.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| §1.1 tracial states, polarization, compactness | `M₂`, vector state; `c₀`, `δₙ` | `tr₂(e₁₂e₂₁)=tr₂(e₂₁e₁₂)=1/2`; vector state: `1≠0`; `δₙ→0`, limit norm `0` | Traciality separates models; nonunital compactness excluded | — |
| §1.2 trace kernel and faithfulness | `ℂ²,pr₁`; `M₂,tr₂` | Kernels `0⊕ℂ`, `{0}`; `tr₂(e₁₂)=0` but `tr₂(e₁₂*e₁₂)=1/2` | Linear kernel differs from trace kernel | — |
| §1.3 unitization and ideal extension | `ℂ,id`; ideal `M₂⊕0` | `τ̃(1_Ã−1_A)=0`; ideal extension `γ(x,λ)=tr₂(x)`, `γ(0,1)=0` | Unital input loses faithfulness; ideal extension normalized | — |
| §1.4 GNS and right action | `M₂,tr₂`; `ℂ²,pr₁` | Right `e₁₂ᵒᵖ` sends `ê₁₁→ê₁₂`; wrong `Jπ(e₁₂)J` sends it to `0`; second GNS algebra `ℂ` | Opposite and conjugation conventions agree | — |
| §1.4 tensor functional | `c₀`, weights `2⁻ⁿ`, truncations `e_m` | `μ(e_m⊗e_m)=1−2⁻ᵐ`; no domain element `1`; unitized value `1` | Missing unital hypothesis | R01 |
| §1.5 matrix trace and 2-norm | `k=0,1,2`; `x=e₁₂,y=e₂₁` | `tr₀=0`; `tr₁(1)=tr₂(1)=1`; `‖e₁₁‖₂=1/√2`; `‖xy‖₂=1/√2>1/2=‖x‖₂‖y‖₂` | Correct normalization; trace-state target duplicated | R03 |
| §1.6 finite-dimensional trace approximation | `ℂ²`, weights `(1/3,2/3)` and `(1,0)` | `diag(a,b,b)` gives exact trace; multiplicities `(N,1)` give dual error `2/(N+1)` | Zero-weight block needs approximation, not exact embedding | — |
| §1.7 norming states | `S={pr₁,pr₂}` versus `{pr₁}`, `a=(0,1)` | Suprema `1=‖a‖` and `0<‖a‖=1`; convex hulls full simplex versus one vertex | Both directions distinguish failure | — |
| §2.1 c.p.c. unitalization | `φ=½id_ℂ`; `φ(a)=VaV`, `V=diag(1,.1)` | `h=1/√2`, `ψ=id`; second old defect `.99`, new defect `1`, bound `.99+17(.0099)=1.1583` | Unitalization needs stated error term | — |
| §2.2 multiplicativity defects | Vector compression of `M₂` | `d(e₁₂)=0`, `d(e₂₁)=1`; `φ(e₁₂e₂₁)−φ(e₁₂)φ(e₂₁)=1` | Adjoint defect cannot be omitted | — |
| §2.3 finite-rank compression | `P=e₁₁`, `T=e₁₂` | `‖[T,P]‖²_HS=1=0+1`; operator-norm square `1=max(0,1)` | Sum versus maximum distinguished | — |
| §2.4 prescribed trace | `h=diag(1/3,2/3)`, `T=e₁₂` | `tr₃φ(e₁₁)=1/3`; product trace `1/3`; wrong maximum multiplicity yields `2/3` | Minimum multiplicity required | — |
| §2.5 bidual normal extension | `δ₁` on `c₀`; an ultrafilter functional | Normal extension on tails: `0→0`; ultrafilter on increasing truncations: `0→1` would fail | Normality distinguishes extensions | — |
| §3.1 three trace properties | Identity on `M₂`; zero algebra; scaled scalar maps | Identity defects `0`, recovery error `0`; zero has no state; wrong scaling at `1` gives error `1−1/m` | Genuine matrix approximations distinguished | — |
| §3.2 `isAmenableTrace_unitization_iff` | `ℂ,id`; norm-control witness `a=1,λ=−1/2` | Both sides `(AT,QD,UAT)=(T,T,T)`; unitized element norm `1/2`, error `δ`, ratio `2δ` | Factor-two dual bound required | — |
| §3.3 inclusions, convexity and closure | Full `C*(F₂)`, regular trace | Finite-quotient trace at `g≠e` eventually `0`; limit `AT=T`, `UAT=F` | Weak-star closure cannot be asserted for UAT | — |
| §3.4 pullback | Corner `M₃→M₄` versus unital scalar inclusion | Pullback norm `3/4` versus `1`; unnormalized corner restriction is not a state | Normalization hypothesis effective | — |
| §3.5 tensor permanence | `tr₂⊗tr₂`; `F₂` canonical trace tensored with `tr₂` | Tensor matrix-unit trace `1/4`, 2-norm `1/2`; second trace `AT=F` by restriction | Tensor carrier omission documented | — |
| §4.1 hypertrace definition | Diagonal `ℂ²⊂M₂`, densities `diag(t,1−t)` and all-entries `1/2` | First centrality difference `0`; second `ψ(e₁₁e₁₂)=1/2`, `ψ(e₁₂e₁₁)=0` | Centrality distinguishes wrong extension | — |
| §4.2 hypertrace to matrices | `h=I₂/2`, `φ=id_M₂` | Prescribed trace equality, defect `0`, trace-class commutator `0` | Estimate `0≤0` attained | — |
| §4.3 tensor and bimodule forms | `M₂`, opposite algebra represented by transpose | For `Σeᵢⱼ⊗eⱼᵢᵒᵖ`, `μ=2`, spatial norm `2`; omitting opposite gives norm `1` | Opposite convention essential | — |
| §4.4 `isAmenableTrace_iff_exists_isHypertrace` | `M₂,tr₂`, identity representation | `AT=T`, hypertrace `tr₂`, centrality difference `0` | Both sides T | — |
| §4.4 `isAmenableTrace_iff_exists_ucp_extension` | `ℂ²,pr₁` in diagonal `M₂` | GNS `ℂ`; `Φ(T)=T₁₁`, `Φ(1)=1`, `Φ(diag(a,b))=a` | Both sides T; nonfaithful trace allowed | — |
| §4.4 `isAmenableTrace_iff_norm_sum_le` | `M₂,tr₂`, preceding tensor | Functional absolute value `2`, operator norm `2`; empty sum `0≤0` | Bound attained | — |
| §4.5 `isAmenableTrace_of_isFoelnerTrace` | Circle multiplication, rank-n Fourier projections | `‖[M_z,P_n]‖²_HS=2`; divided by rank `2/n→0`; compressed trace `0=τ(z)` | Følner implies AT in this instance | — |
| §4.5 `isAmenableTrace_iff_isFoelnerTrace` | Circle; finite `ℂ²` with weights `(1/3,2/3)` | Circle both T; commuting finite projections give only `0,1/2,1`, excluding `1/3` | General-position hypothesis excludes counterexample | — |
| §4.6 injectivity and normality definitions | `M₂`; zero Hilbert space; weighted `ℓ∞` trace | Identity projection norm `1`; zero projection norm `0`; weighted truncations `1−2⁻ᵐ→1`; ultrafilter values `0` | Zero algebra injective, but has no state | — |
| §4.6 `isAmenableTrace_iff_isInjective` | `M₂,tr₂`; `L(F₂)⊕ℂ,pr₂` | First `(AT,injective)=(T,T)`; second `(T,F)`, trace kernel contains `L(F₂)` | Faithfulness excludes second instance | — |
| §5.1 nuclear-map definition | `2id_ℂ`; corrected positive scaling | Old approximation error at `1` at least `1`; required `<1/2`; scaled factorization error `0` | Supplier generality lost | R02 |
| §5.1 weak nuclearity and commuting ranges | `B(ℓ²)` compressions; `β=id_M₂`, `yₖₗ=eₗₖ` | Compressions fix `e₀₀` eventually; weak nuclear T, nuclear F; noncommuting formula has output norm `2`, input norm `1` | Commutation hypothesis necessary | — |
| §5.2 `isUniformAmenableTrace_iff_isInjective` | `M₂,tr₂`; regular trace on full `C*(F₂)` | First `(UAT,injective)=(T,T)`; second `(F,F)`, though `AT=T` | Uniform and ordinary amenability distinguished | — |
| §5.2 `isUniformAmenableTrace_iff_isAmenableTrace_gns` | Weighted `c₀` trace; add ultrafilter to its extension | Normal extension has mass `1`; modified extension agrees on `c₀` but has mass `2`, recovery error at least `1` | Normality excludes false extension | — |
| §5.3 `isUniformAmenableTrace_of_isNuclearMap_id` | `M₂`; compact operators on infinite-dimensional Hilbert space | `M₂` identity defect `0`, UAT T; compact rank-one projections have equal weight, forcing weight `0`, no state | Nonunital empty trace space allowed | — |
| §5.4 `isAmenableTrace_tfae_of_isNuclearMap` | Reduced `C*_r(F₂)`, canonical trace; `M₂` | Four conditions `(F,F,F,F)` and `(T,T,T,T)`; GNS map into `B(H)` nuclear T for first | Range `M_τ` is essential | — |
| §6.1 domination and Radon–Nikodym support | `γ=(pr₁+pr₂)/2`, `τ=pr₁`, `s=1/2` | `sτ≤γ`; derivative `e₁₁`, support `e₁₁`, GNS vector scaling `√2` | Positive domination parameter required | — |
| §6.2 `isAmenableTrace_convexCombination_iff` | `C*_r(F₂)⊕ℂ`, regular trace and scalar character | Mixture at `0<t<1`: AT F, conjunction F; endpoint `t=0`: AT T | Strict weights necessary | — |
| §6.2 `isUniformAmenableTrace_convexCombination_iff` | Same direct sum and mixture | Interior UAT F, conjunction F; endpoint scalar trace UAT T | Strict weights necessary | — |
| §6.3 `isAmenableTrace_of_normalized_comp` | Corner `M₃→M₄` | Correct `c=3/4` gives `tr₃(1)=1`; wrong `c=1/2` gives mass `3/2` | Trace-state hypothesis fixes scale | — |
| §6.4 `isAmenableTrace_of_comp_surjective` | Full→reduced `C*(F₂)`; `ℂ³→ℂ²` | First AT `T→F`, so no c.p.c. section; second UAT `T→T` with nonfaithful descended state | Splitting and faithfulness distinctions respected | — |
| §6.5 `isAmenableTrace_of_comp_ideal` | `M₂⊕0⊂M₂⊕ℂ` | Extension `γ(x,λ)=tr₂x`; `γ(0,1)=0`; both AT and UAT T | Ideal extension normalized without faithfulness | — |
| §7.1 `isQuasidiagonalTrace_of_commute` | Lebesgue trace on `C[0,1]` | Point evaluations: product defect `0`, average of coordinate `(n+1)/(2n)→1/2`; interval averages recover trace exactly | QD and UAT both T | — |
| §7.2 AF definition and `isQuasidiagonalTrace_of_isAF` | CAR algebra; compact operators; `C[0,1]` | CAR stage defect `0`, trace error `0`; compacts AF T with no states; `C[0,1]` AF F | Nonunital and non-AF controls separated | — |
| §7.3 generated algebra and `amenable_tfae_generatedCStarAlgebra` | Trivial group, `S₃`, `F₂` | First two four conditions T; `F₂` all F; normalized regular trace `λ_e=1`, `λ_(12)=0`; `(12)(23)=(123)≠(132)` | Nonabelian convention tested | — |
| §8.1 QD definitions and `exists_isQuasidiagonalTrace_of_isQuasidiagonal` | `ℂ²`; nonunital suspension of `O₂` | Diagonal model defect `0`, induced weights `(1/2,1/2)`; suspension QD T, trace-state set empty | Unital nonzero hypothesis effective | — |
| §8.2 states of QD algebras | `ℂ²`, state weights `(1/3,2/3)` | Density `diag(1/3,2/3)` gives value `1/3` at `e₁₁`; normalized trace gives `1/2` | Arbitrary matrix states needed | — |
| §8.3 `isQuasidiagonal_of_isQuasidiagonalTrace` | `ℂ²` faithful midpoint trace; Toeplitz quotient trace | First QD T, norm `max(‖a‖,‖b‖)`; second QD trace T, faithful F, algebra QD F | Faithfulness excludes second instance | — |
| §8.4 `amenable_of_isQuasidiagonal_generatedCStarAlgebra` | `ℤ`, `S₃`, `F₂` | `(QD,amenable)=(T,T),(T,T),(F,F)` | Both finite and nonamenable controls | — |
| §8.5 `subalgebra_isAF_simple` | `M₃` corner in CAR; nonsimple `ℂ²` | Corner trace mass `3/4`, normalized `tr₃` faithful; `pr₁` on nonsimple `ℂ²` kills `(0,1)` | Simplicity and normalization effective | — |

- Sources: 15 seeded targets checked at accessible locators; 3 cached texts read; 5 settled unavailable works listed below; no new reference request.
- Source witnesses: brown2006 lines 378, 403, 466, 486, 530, 558, 589, 662, 793, 807, 973, 1097, 1274, 1317, 1423, 1469, 1952; tikuisis-white-winter2017 lines 362, 458; schafhauser2020 lines 69, 82.
- Pins: 7 declaration witnesses opened at `Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean:51`, `TauCeti/Analysis/CStarAlgebra/Action/KMS/Basic.lean:237`, `TauCeti/LinearAlgebra/Matrix/Trace/Duality.lean:31` and `:52`, `TauCeti/Analysis/Matrix/Frobenius.lean:106`, `TauCeti/Analysis/VonNeumannAlgebra/Adjoin.lean:38` and `:59`.
- Suppliers: 6 named roadmap contracts resolved on main; 0 upward edges or cycles; main and open ownership searches found the duplication in R03.
- Gate: all worker checks passed, including targeted build; independent `lake env lean` passed with exactly 23 `sorry` warnings and no other warnings.
- Signatures: all 46 declarations independently checked with `#check @name`; 4 flagged binder omissions require no missing hypothesis; 0 signature changes. All 23 single-tactic probes failed to prove their target; no padding found.
- Headlines: 23 admitted theorem declarations cover the statable end results; 2 omitted results explicitly name missing carriers in the module docstring.
- Change and shape: 40 numbered targets, 8 layers; PR describes a new 2908-line folder; 0 removed declarations, 0 outside-folder changes; no second copy or dropped supplier ID found.

Dependency check output: `depcheck: 212 roadmaps, 1880 edges, 0 problem(s)`.

Overlap check: read VonNeumannAlgebras (main and #2242), CompactQuantumMetricSpaces, QuantumFoundations, AnalyticNumberTheoryPartII, BanachSpaceTheory, CStarAlgebras and CStarClassification. Owners: states/GNS/operator traces, normality, standard form and injectivity—VonNeumannAlgebras; matrix trace state and uniqueness—VonNeumannAlgebras V0/V3 (R03); completely positive maps, tensor products, nuclearity, exactness and algebra quasidiagonality—CStarAlgebras; AF/UHF and dimension-group traces—CStarClassification; convex weak/norm closure—BanachSpaceTheory; trace approximation classes and their characterizations—this roadmap. CompactQuantumMetricSpaces and QuantumFoundations consume the common operator-algebra foundations; AnalyticNumberTheoryPartII owns no shared target. OperatorAlgebraDynamics and FactorRigidity were also read: reduced crossed products/canonical trace and group-factor injectivity remain theirs.

Source independence: 21 passages compared with 3 accessible sources; no nonmathematical copied wording or reused material identified. Largest share: brown2006, 77 of 101 source-key citations before References. Its contents (lines 27–54) were compared: no one-to-one chapter/section arrangement. Dependencies §2.4→§4.2→§4.4 and §4.4→§5.2→§6.2 explain the principal order; the roadmap separates approximation tools, characterizations and permanence across Brown's sections. Five settled unavailable texts were not compared directly.

## Not verifiable

- brown-ozawa2008, Chapter 6: source manifest records a waiver; net formulations could not be checked directly against this book.
- connes1976, Theorem 5.1: source manifest records a waiver; historical background locator not directly certified.
- paulsen2002, Chapter 3: source manifest records a waiver; background Schwarz-inequality locator not directly certified.
- pedersen2018, Chapter 3: source manifest records a waiver; background state-norm locator not directly certified.
- kirchberg1993, Theorem 7.5 and Proposition 7.1: settled uncertified primary source; brown2006 lines 1910–1917 provide secondary corroboration only.

## Source issues

- **Misprint** in brown2006 at Lemma 2.5, printed p. 11, line 488: the source says the approximation error is strictly less than ε times the norm for every element; it should be non-strict, or exclude zero; affects a stated result.
- **Error** in brown2006 at proof of Lemma 2.5, printed p. 11, lines 489–491: the source says every rational convex combination admits an exactly trace-preserving matrix embedding; it should be restricted to strictly positive block weights, approximating zero weights first; affects the proof.
- **Misprint** in brown2006 at proof of Proposition 3.5.1, printed p. 28, lines 1230–1233: the source says the chosen maps have defect below ε for every pair of algebra elements; it should be for pairs in the fixed finite set; affects the proof.
- **Misprint** in brown2006 at proof of Proposition 3.5.11, printed p. 33, lines 1464–1467: the source says Φ has domain A, then evaluates Φ on arbitrary operators; it should have domain B(H); affects the proof.

## For the human reviewers

- Five source texts remain settled waived or uncertified as listed above; direct wording checks against them were unavailable. The largest source, brown2006, and its contents were readable and compared.
