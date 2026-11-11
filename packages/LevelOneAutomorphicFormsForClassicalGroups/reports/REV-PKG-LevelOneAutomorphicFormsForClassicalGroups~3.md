<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13155#issuecomment-6783390941 -->
Review (codex) of 2bd363c

Verdict: needs_changes

1. **F01** (P2) Archimedean purity is used to assert finite-place temperedness

   **Location:** README lines 451–452: “numbers of absolute value one by purity (§1.5)”.

   **Claim:** Every finite Satake root of every member of Π_alg has absolute value one, as a consequence of the supplied purity theorem.

   **Witness:** AutomorphicFormsOnReductiveGroups #1037, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:832`, §5.5 concerns archimedean purity. AutomorphicLFunctionsAndLocalFactors #924, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1622`, supplies the strict bound `p^(−1/2)<|α|<p^(1/2)`.

   CT20 line 554 concerns the weights at infinity, not this finite-place assertion. Tai17 lines 2350–2354 explicitly allow the unbounded finite local parameters. For the local implication, take an unramified unitary complementary series with roots `p^(1/4),p^(−1/4)`: their product is `1`, but at `p=2` the larger absolute value is approximately `1.189207`, not `1`. This is a counterexample to the proposed local inference, not a claimed global counterexample to Ramanujan. The repaired supplier contract at README lines 244–249 already states the correct distinction.

   **Exact repair:** Remove absolute value one from this API bullet. Retain nonzero roots, determinant one, and the Jacquet–Shalika strict bounds, citing AL.3.3.8 and adding it to the Needs line. Keep §1.5 as archimedean purity. Add the complementary-series example as a negative control for the inference from unitarity to temperedness. At `p=2` both test roots satisfy the repaired bounds, and their tensor root `√2<2` satisfies the `c=1` explicit-formula input. Do not restrict primes or add a Ramanujan hypothesis to Π_alg.

2. **F02** (P1) The stated image of the highest-weight map contains nonregular vectors

   **Location:** README lines 627–630: “an inverse exactly on three images: integral vectors of odd length `m ≥ 3`”.

   **Claim:** The integrality and length conditions alone describe the three images inside W_m.

   **Witness:** `w=(0,0,0)` belongs to W₃ and satisfies the stated integral, odd-length condition. The Sp₂ formula forces `λ₁=w₁−1=−1`, which is not dominant. The genuine weight `λ₁=0` gives `(1,0,−1)`.

   W_m was defined without regularity, and the preceding assertion that outputs are regular does not restrict the subsequently asserted image equality. This also matters when §3.16 uses the inverse to choose the classical group and coefficient. Repeated half-integral vectors cause the analogous issue in the odd-orthogonal case.

   **Exact repair:** Say that these are precisely the **regular** vectors in W_m satisfying the respective integrality and length conditions, retaining the type-D outer-orbit convention and the separate rank-one case. Add `(0,0,0)` as a negative-control Check. With regularity, integral positive coordinates in type C decrease by at least one and end at least at one; subtracting `(n,…,1)` yields a dominant nonnegative λ. The test vector is now excluded, and `(1,0,−1)` still maps back to `λ=0`.

3. **F03** (P2) The multiplicity denominator needs a positive multiplicity

   **Location:** README lines 850–852: “`π₁, …, π_m` … `J_F(U²) ≤ A_F/m`”.

   **Claim:** The multiplicity bound and the averaging proof apply to a family of m distinct classes without a stated lower bound on m.

   **Witness:** At `m=0` the family and common-parameter premise are vacuous. Take `U=I₂₃` and `ℓ=487/50`: §5.4 gives `J_{F_ℓ}(U²)>0`, while ordinary `A/0` is undefined and Lean's totalized real division gives `0`.

   The averaging vector `m⁻¹Σπ_i` is zero in that instance, so §2.7 supplies only `0≥0`; it cannot produce the displayed bound on U. Other uses, including the repaired §5.1 and admissible quadruples, explicitly require positive multiplicities, but §2.8 itself does not.

   **Exact repair:** Quantify “an integer `m≥1`” before the family. Add the empty family as the negative control, explaining that it bounds no prescribed U. The existing `m=2` example still yields `A_F/2`; at `m=0` the repaired premise is false, so no division or unsupported conclusion remains.

4. **F04** (P1) The even-orthogonal global multiplicity is missing from the character average

   **Location:** README lines 1403–1407, especially “`|S_ψ|⁻¹ Σ_{s ∈ S_ψ} ε_ψ(s) Σ_ρ ⟨s, ρ⟩ EP(ρ ⊗ V_λ^∨)`”; also the normalization of κ at lines 1425–1430.

   **Claim:** Averaging packet characters alone recovers the discrete-spectrum contribution, with the stated outer-orbit convention in even SO.

   **Witness:** Tai17 line 2387 makes `m_ψ=2` in even SO when every `n_i d_i` is even. Equation (4.1.2), Tai17 line 2407, retains this factor; line 2414 separately defines the outer-orbit EP average.

   The cited supplier agrees: ModularityAndLanglandsExtensions #1180, `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:2051`, §3.17 explicitly retains m_ψ. In particular, use the known rank-eight class `O^even(24,18,10,4)[1]` for SO₈. It is simple, so `S_ψ=1`, and `m_ψ=2`. Its positive infinitesimal weights are `(12,9,5,2)`, corresponding to `λ=(9,7,4,2)`. For an outer pair of cohomological discrete series, only the representative with this infinitesimal character contributes to this λ; the two EP values are `1` and `0` (`q(SO(4,4))=8`). Tai17's averaged EP is therefore `1/2`. The actual selected-orbit contribution is `2·(1/2)=1`; the displayed character average contributes `1/2`. Outer averaging does not cancel the missing multiplicity.

   **Exact repair:** Multiply the character average by `m_ψ`, defining it to be `2` exactly in the stated even-SO case and `1` otherwise, with Tai17's outer EP convention retained. Replace the trivial-component-group Check by `m_ψ` times the total outer-averaged EP. Define κ in §3.16 consistently as the simple parameter's **full global contribution**, namely `m_ψ` times the outer-averaged packet EP sum (or give an explicitly equivalent individual-representation convention). The SO₈ witness then gives `1=1` per selected orbit. SO₃ still has `m_ψ=1` and `κ=−1`. No new supplier is needed.

5. **F05** (P3) The theta coefficient docstring uses the wrong Fourier index

   **Location:** Suggested lines 108–110: “The Fourier coefficient at the matrix `T`”.

   **Claim:** Summing tuples with Gram matrix T gives the Fourier coefficient indexed by T.

   **Witness:** README §8.6 identifies this value with the coefficient at `T/2`. The displayed exponential is `exp(πi tr(Tτ))=exp(2πi tr((T/2)τ))`; a diagonal Gram entry `2` has Fourier index `1`, not `2`.

   CT19a line 1069 uses the same Gram-over-two convention. The implementation and the nonvanishing theorem already use the correct summation and `q^{Gram/2}`; this is a documentation inconsistency, not a failed Lean theorem.

   **Exact repair:** Change the declaration docstring to “the Fourier coefficient at `T/2`, indexed here by its integral Gram matrix `T`”. Keep the definition and theorem unchanged. The Gram-entry test then reads index `1` on both sides.

Five findings: two P1, two P2 and one P3; four blocking. The scope is repairable. The original Lean file elaborates with only its four `sorry` warnings, and none of its four theorems closed under the padding probes. Elaboration does not establish the mathematical assertions in the README.

Locations abbreviated as README or Suggested below mean `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md` and `packages/LevelOneAutomorphicFormsForClassicalGroups/Suggested.lean`. Source line numbers refer to the supplied legal extractions, not to repository copies of those texts.

## Previous findings, checked individually

The preceding repair report marks all twelve findings applied, including R12 applied differently. None is marked not actionable. I read the changed statements, their Checks and their uses elsewhere, rather than relying on that assessment.

| Previous finding | Repaired passage in README | Assessment and test |
|---|---|---|
| R01, explicit-formula input | Contract: “a specialization of that statement with `c = 1`”; §2.1: “for every `c ≥ 0`” | **Partly repaired across the package.** The adapter, its supplier names and its Needs are repaired: tensor roots are bounded by `p`, and compact support permits `c=1`. The same unavailable finite-place purity claim remains in §1.1; new R01 below. |
| R02, Gram diagonal | §2.9: “`β_ii = A_F/m_i − J_F(U_i²) − (B_F/4) δ_i (1 − ε(U_i²))`” | **Repaired.** At `U=I₀=1+e`, `U²=2+2e`, epsilon is `−1`; for `B=4` the retained term is `−2`. The realized self-dual simplification is separately justified. |
| R03, negation | §4.4: “For `d_G` even (`Sp_{2n}` and `SO_{2n}`), `P ↦ P^−` is an involution of `P(G)`” | **Repaired.** Odd SO₃ sends `(X−1)³` to `(X+1)³`, with forbidden odd `a₂=3`; Sp₂ sends `(X−1)²` to `(X+1)²`, with allowed `a₂=2`. No odd-dimensional quotient remains. |
| R04, cutoff | §5.1: “a real `c ≥ A_{F_ℓ}/m`”; “`S_U ⊂ S`” | **Repaired.** The proof now explicitly uses `J(U²)≤A/m≤c`. The empty cover at `c=−1` fails this hypothesis because `A=8ℓ/π²>0`. Exclusions outside S also apply outside each S_U. |
| R05, omitted exceptions | §2.19: “For `n = 0` the second parameter is `1`, of rank one”; §5.8: “At `A` no exclusion is made”; §7.7: “`Δ₁₁[12] ⊕ [25]`” | **Repaired.** Rank one retains parameter `1`; the GRH survivor has rank `16`; the genus-24 parameter has dimension `49` and is separated before the three-block restriction. |
| R06, neighbour pairing | §6.3: “The reciprocal weights belong to the function space only.” | **Repaired.** In the rank-16 example, `12870·405=18225·286=5212350`. Reciprocal weights give `286/9` and `18225/286`, which are unequal. The reciprocal pairing now belongs to the dual function space. CL14 line 2349 supports the basis convention. |
| R07, Golay/Conway ownership | §8.4: “identified with the Mathieu group by CFSGBasicProperties P2-L” | **Repaired.** Main P2-L supplies the coordinate-compatible Golay–Mathieu identification and Conway comparison, including norm scaling. The group order is imported from SporadicOrders. Only the alternating-form construction remains here. |
| R08, missing face | §2.11: “omitting both singleton faces” | **Repaired.** For `[[1,2],[2,1]]`, the positive-cone minimum is `1`, whereas the full-support least eigenvalue is `−1` with a mixed-sign eigenvector. Omitting both singletons loses the minimum; omitting only one does not. The added `diag(0,1)` control distinguishes the two faces individually. |
| R09, removable value | §2.1: “`4 = (∫ 1_{[−1,1]})²` at `ξ = 0`, the removable value” | **Repaired.** The triangle's integral is `4`; the punctured sine quotient tends to `4`, whereas totalized `0/0` would give `0`. At `ξ=1/2` the transform is `0`. |
| R10, primary factors | §4.7: “If `t ≠ ±1`”; “`(a, b, Q) = (2, 0, 1)`” | **Repaired.** After removing all primary factors at `t=1` and `t=−1`, both evaluations of Q equal `1`. The unremoved expressions instead give `(4,0)` and `(0,4)`. |
| R11, theta normalization | §6.4: “The normalization is fixed by the constant coefficient” | **Repaired.** Uniform scaling by `1/\|O(E₈)\|` preserves the Siegel-operator relation but changes the constant from `1` to `1/696729600`. The Check now says this correctly. |
| R12, locators | §§3.11–3.12: “(5.2.4)–(5.2.7)” and “(5.2.8) and (5.2.10), with the congruences (5.2.9)”; §§7.8–7.9: “Table 6” and “Table 5” | **Repaired.** CT20 lines 1872–1902 include the dimension identity and the even-generator formulas; the odd-generator formulas and congruence follow. The unnumbered EP display is identified as such. The two classification tables and the manifest's equation range agree with the recorded manuscript version. |

## Verified sound

### Extent, principles and shape

I read all 110 numbered targets, their API bullets, Checks, proof-route inputs and Needs lines, together with the conventions, supplier contracts, metadata, manifest and all eight Lean declarations. I checked the twelve repairs above and searched the remaining text for their patterns. The computed prior-round rows are reused only where identified below; assertions merely summarized in that review were reread and tested here, including the even-SO contribution.

This is a new level-one synthesis with general constructions preceding finite classifications, not a replacement for an existing roadmap. The general explicit formula, Arthur classification, lattice carrier, Golay/Conway identifications and Zassenhaus theorem have named earlier owners. No good-prime-only replacement is used in the spinor obstruction: its local hypothesis quantifies over every prime, including 2. The computational suppliers own numerical verification machinery; this roadmap's claims are inequalities, covers, exclusions and mathematical classifications, not executable algorithms.

The eight layers have mathematical titles and Examples/Dependencies sections; the order is justified by the actual inputs (positivity before exclusions, packet contributions before count recovery, geometric masses before classifications, and theta maps before their applications). There is no instruction to follow a source's chapter arrangement. I compared the shape with main ThetaSeries, Rank24LatticeConstructions and CFSGBasicProperties. Definition blocks retain APIs and at least three Checks. The incorrect hypotheses/convention descriptions found in this pass are the findings above. No copied source passages, local paths, HTML anchors, job labels or pull-request narrative were found in the roadmap prose. “Packet” denotes an Arthur packet, not process residue. `metadata.toml` gives `topic = "math.NT"`.

### Seeded source sample

All fifteen requested targets were checked against readable text, with the version recorded in the manifest. CT20 locators below use the accepted manuscript, whose late statement numbering differs from the published article; the manifest explicitly records that distinction. Page numbers here are printed pages, not PDF page indices.

| Target | Source and locator read | Result |
|---|---|---|
| 2.1 Even tests and POS | CT20 §2.3, pp.15–16, line 636 onward; AnalyticNumberTheoryPartI §1.3 and §1.8 for the admissibility adapter | Evenness, Mellin/Fourier conversion, strip and POS agree. The triangle's removable value is repaired. |
| 2.14 Forced self-duality | CT20 Remark 2.10, p.20, line 848 | Monotonicity on the nonnegative cone retains `B_F≥0` and admissibility of both quadruples. |
| 3.1 Level-one Arthur parameters | CT20 §5.1, (5.1.1), pp.39–40, lines 1610–1643; Tai17 §4.1.1, line 2338 | Distinct pairs `(π_i,d_i)`, block dimensions, self-dual type and algebraicity agree. A class can occur at different lengths. |
| 3.9 Case-I character | CT20 §5.2.2, (5.2.2)–(5.2.3), p.44, lines 1795–1836 | Floor signs, even-length exponent and independence of the sign choice agree. |
| 3.11 Even generators in H | CT20 (5.2.4)–(5.2.7), pp.45–46, lines 1864–1902 | The shortened H2 list, dimension identity, distinguished-block cases and sign independence agree. |
| 3.16 Triangular recovery | CT20 Key fact 2, p.9, line 360; Tai17 §4.1.2, pp.307–312, lines 2397–2598 | Lower-rank induction and nonzero simple contribution are supported. The package must retain m_ψ in its normalization: R04. |
| 4.1 Torsion masses | CT20 §1.4, (1.4.3)–(1.4.5), pp.9–10, lines 381–425; current AutomorphicSpectralTheory §6.20 | Grouping the imported elliptic terms defines the masses. Full versus connected centralizers must be read with the supplier's component factor; see the calculation below. |
| 5.1 Covers and exclusions | CT20 §§2.4.3–2.4.5, pp.21–23, line 881 onward; §4.1, pp.35–37, line 1432 onward | The abstract implication follows with the newly explicit cutoff and known-set inclusion. It does not adopt the source's executable procedure as a target. |
| 5.6 Thirteen top-simple classes | CT20 Theorem 3, p.6, lines 242–250 | The thirteen listed classes agree. The package correctly limits weight uniqueness to ranks 4, 6 and 10, correcting the source's blanket final sentence. |
| 5.7 Repeated-top alternatives | CT20 Proposition 4.1, p.35, lines 1424–1431; proof pp.36–37, lines 1491–1507 | The range, symplectic self-dual alternative and exceptional dual pair agree; `U_exc∉V`, giving 182 possible parameters and at most 183 classes. |
| 6.7 Harmonic theta map | CT20 §5.4, (5.4.1), p.54, lines 2230–2243; CL14 V §4.1, Proposition-Definition 4.4, pp.145–146, lines 5547–5566 | Mass weighting on assignments and unweighted `[L,P]` agree; positive determinant weight gives cuspidality. |
| 7.10 Four weight-thirteen forms | CT20 Corollary 1, p.4, line 139, and Table 5, pp.59–60 | Exactly genera 8, 12, 16 and 24; each space is one-dimensional. Parameter dimensions recomputed below. |
| 8.8 Harmonic realization | CT20 Proposition 5.12, p.55, lines 2248–2257; BoechererNote pp.1–3, lines 1–127 | The four rank-24 realizations and the additional rank-16 genus-eight realization agree; all five order sums are zero. |
| 8.13 Stable Siegel operator | CT20 Corollary 5.15(1), p.57, lines 2326–2338 | Domain is genus `g+1`, target genus g, with `g≥2k`; the equality boundary is included. |
| 8.14 Stable theta isomorphism | CT20 Corollary 5.15(2), p.57, lines 2329–2338 | Requires `k≡0 mod4`; full-rank Fourier coefficients give injectivity, and the boundary follows using the Siegel operator. |

The other repaired locators were checked as indicated in the repair table. CT19a formula (1), Proposition 1.4, Theorem 2 and Proposition 4.1 were also opened for all three lattice headlines: lines 26, 283, 105 and 1052 respectively. The seven manifest entries have distinct keys and cover the seven reference entries. No new source was needed and no manifest entry was changed. KT87 remains the settled uncertified source; it was not requested again.

### Adversarial table with computed values

“Carried” means the earlier review supplies the displayed computed values and the corresponding mathematical text is unchanged. Those rows are not claims to have rerun large enumerations. All repair and finding witnesses, the new even-SO test and the seeded-target tests without such prior evidence were checked in this round. Inapplicable tests such as a zero coefficient ring for a rational positive-definite lattice are excluded by the actual carriers, not silently assumed away.

| Statement or convention | Instances tried | Values on the two sides | Result / change |
|---|---|---|---|
| §1.1 finite Satake roots | Unitary unramified roots at p=2 | Product `1`; largest modulus `2^(1/4)=1.189207…`, rather than `1`; tensor maximum `√2<2` | R01; correct c=1 bound survives. |
| §§1.2,1.8 real epsilon conventions | `I₁₁I₁₅=I₂₆+I₄`; `I₁₇` | `i²⁷i⁵=1`; `i¹⁸=−1` | Same-type versus opposite-type signs distinguished. |
| §1.9 inverse | `(0,0,0)` and `(1,0,−1)` | Recovered λ values `−1` and `0`; dominance false and true | R02. |
| §2.1 transform convention | s=`0,1/2,1`; triangle ξ=`0,1/2` | Fourier arguments `−i/(4π),0,i/(4π)`; triangle values `4,0` | Correct conversion and repaired removable value. |
| §§2.1–2.2 kernel | ℓ=1; kernel at 0 and boundary 1 | `A=8/π²≈0.810569`; `g″(0)=−π²`, `g″(1)=0` | Compact C² adapter is compatible with c=1. |
| §§2.6–2.8 multiplicity | Zero F; m=2; empty family m=0 | Zero F gives `0=0`; m=2 bound is `A/2`; m=0 gives `J(I₂₃²)>0` versus totalized RHS `0` | R03; the empty family cannot be averaged to mass one. |
| §§2.9,2.14 | `U=I₀`, δ newly 1, B=4; epsilon +1 control | `U²=2+2e`, epsilon `−1`, diagonal change `−2`; epsilon +1 change `0` | Repaired diagonal and sampled monotonicity agree. |
| §2.11 support minimization | `[[1,2],[2,1]]`; `diag(0,1)` | Full-support eigenvalues `−1,3`, singleton minima `1,1`; second matrix face minima `0,1` | Dropping both faces loses first minimum; dropping the zero face changes second minimum `0→1`. |
| §§2.12–2.15 cone and compression (carried) | Off-diagonal ±2, diagonal 1; one block of size 2 | `(1,1)` values `−2,6`, determinant both `−3`; expanded/compressed minima `−1,−1/2`, lifted form value both `−t²/2` | Negativity, not normalized minimum, is preserved. |
| §2.19 Miller | Trivial rank one; odd family endpoint | Parameter `1`, rank `1`; required bound `J(1)≤A`, not `J(1)>A` | Exception retained; nontrivial vanishing starts at rank 2. |
| §§2.20–2.21 elliptic dictionary (carried) | Weights `12,23,24,54` | Cusp dimensions `1,0,2,4`; odd motivic weights through 53 number 27 | Correct; elliptic dimension theorem is imported. |
| §3.1 Arthur parameter | `Δ₁₇[8]⊕[9]⊕[7]⊕[1]` | Standard dimension `16+9+7+1=33`; three odd blocks give component size `2³/2=4` | Distinct block-length convention and determinant relation pass. |
| §3.4 lowest-weight criterion (carried) | `(g,k)=(1,0),(2,(1,1)),(3,(1,0,0))` | EHW tests `0≥0`, `1≥0`, `0≥1/2` false | Trivial, singular-unitary and nonunitary cases separated. |
| §3.9 case I | `g=k=12`, `Δ₁₁[12]⊕[1]`; sign identity | Dimension `25`; `χ=(−1)^6=1=ε`; at ε=−1,a=1 floor/product both `−1` | Sample passes with parity hypotheses. |
| §3.11 case H | `g=16,k=13`, Δ₁₇[8] plus three odd blocks | Remove 4 from `12,…,1`, obtaining length `11=k′−1`; even-block sign `(−1)^4=1`; trivial block `r+2e₊+2e₋=1` | Sample's shortened-index convention passes. |
| §3.12 zero characters (carried) | Distinguished zero block `2·1` | Multiplicities `(1,e)=(2,0)`, not `(1,1)`; floor signs at ±1 are `1,−1` | Uses characters, not merely the number of zero weights. |
| §§3.15–3.16 even SO | Rank-8 simple class, λ=`(9,7,4,2)` | `m_ψ=2`, `S_ψ=1`; outer average `(1+0)/2=1/2`; true contribution `1`, displayed contribution `1/2` | R04; correct κ must include global multiplicity. |
| §3.16 SO₃ control | k=0,5 | `κ=−1`; counts `0,1`; EP `−0+1=1`, `−1+0=−1` | Simple/remainder decomposition survives repair. |
| §4.1 centralizer convention | q=`x₁x₃+x₂²`, γ sends `(x₁,x₂,x₃)` to `(−x₃,−x₂,−x₁)` | `γ²=1`, `det γ=1`, `γᵀBγ=B`; rational centralizer component index `2`; connected product `1/2` gives mass `1/4` | The definition groups the imported full geometric terms, so retains the factor. See explanation below. |
| §4.4 negation | Identity in SO₃ and Sp₂ | `a₂:0→3` invalid, versus `0→2` valid; SO₃ has 5 indices, Sp₂ quotient 3 | Repaired parity restriction passes. |
| §§4.6–4.7 spinor conversion | Order-four/order-three rotations; minus identity on a plane | Determinants `(1+γ)/2` are `1/2,1/4`; `Q(−1)=2,1`; ratios both `1/4`; minus-primary factor is `disc(q)` | Imported spinor convention and local adapter agree. |
| §4.7 and Lean regular form | Rank 0; hyperbolic plane; sum of two squares; `x₁x₃+x₂²` | Polar determinants `1,−1,4,−2`; regularity `true,true,false,true` | Real definition distinguishes regular from merely nondegenerate over ℚ. |
| §4.7 and Lean obstruction | Rank 1 q=x²; endpoint t=±1; `Φ₁Φ₆` | SO₁ identity has Q=1; endpoint Q evaluations `(1,1)`; `Φ₆(−1)=3` is not an integer square | Rank 0/1 and all-prime hypotheses behave correctly; endpoint repair passes. |
| §§4.8–4.9 index counts (carried) | Even degrees 2 through 16 | Negation quotient counts `3,12,32,92,219,530,1158,2521` | Corrected degree-14 count retained. |
| §§4.11–4.12 SO₃ masses | Five-row character matrix; displayed mass vector | Determinant `288`; multiplying `(-1/12,1/4,1/3,0,0)` gives `(1/2,−1/2,−1/2,−1/2,−1/2)` | Recovery, sign and forbidden orders agree. |
| §§4.13–4.18 range checks (carried) | Sp₁₄,Sp₁₆ systems | `974<1158`, `1427<2521`, `2521−766=1755`, `1086≥766`; SO₃ total mass `1/2` | Dimension checks pass; large external matrices not regenerated. |
| §5.1 covers | m=2 and cutoff c; negative cutoff c=−1 | `J≤A/2≤c`; negative cutoff has zero PD candidates but `A>0` | Repaired premise rejects the false empty-cover instance. |
| §5.3 weight≤22 (carried) | Δ₂₁,₁₃ and Sym²Δ₁₁ | Ranks `4,3`; weights `±21/2,±13/2` and `−11,0,11`; 27 known classes through weight 24 | Existence and exclusion inputs kept separate. |
| §5.6 thirteen classes | All four rank groups | `2+3+7+1=13`; the two rank-two classes have the same weights | Sample passes; uniqueness correctly excludes the rank-two pair. |
| §§5.4–5.7 repeated top | U_exc, V, and duality | `dim U_exc=14`; `187−6=181`; parameters `181+1=182`; class bound `181+2=183`; dual orbit sizes `1,2` | Sample agrees with corrected outside-known-set interpretation. |
| §§5.8–5.10 (carried, repaired exception retested) | A; four weight-24 survivors | `dim A=16`; survivor ranks `13,13,16,16`; `1260−1256=4`; 16 known classes in 15 blocks | Retained A and regularity restrictions pass. |
| §6.3 neighbours | E₈,p=2; two rank-16 classes | Neighbour count `(2⁴−1)(2³+1)=135`; weighted cross-products both `5212350` | Correct basis pairing; reciprocal values unequal as above. |
| §6.4 normalization | E₈; uniformly mass-scaled theta family | Constant terms `1` versus `1/696729600`; both scaled Siegel-operator sides `1/696729600` | Repaired Check distinguishes normalization from compatibility. |
| §§6.5–6.10 first occurrence (carried) | E₈ at genus 8; Δ₁₁[12] at genus 12 | Added block lengths `9,1`; dimensions `7+1+9=17`, `24+1=25` | Uses actual target genus; source degree stays 0 or 12. |
| §6.7 harmonic map | `(n,ν)=(24,1),(16,5)`; ν=0 | Weights both `13`; supported value `\|O(L)\|P` times mass factor yields P; ν=0 E₈ constant `1` | Sample passes; only positive ν gives the claimed cusp image. |
| §§6.11–6.12,8.7 orders | All five Böcherer products | Orders `(0,0,0,−1,1)`, `(0,0,0,0,0)`, `(0,0,0,−1,1)`, `(0,−4,−4,−1,9)`, `(0,−12,−12,−1,25)` each sum to `0` | Finite nonzero leading values; central nonvanishing is supplied, not inferred from sign. |
| §§7.1–7.3 regular dimensions (carried) | Genus 1; g=2 k=10,11; g=8,9 | Dimensions `dim S₁₂=1`, `1,0`; needed dual dimensions `17,19` versus available 17 | All regular weights in genus≤8, not just a small-weight proxy. |
| §§7.4,7.8–7.9 tables (carried) | All regular block shapes; all displayed rows | 198 shapes identifying the two Δ₂₃ classes, 223 distinguishing them; 58 passing shapes; nonscalar rows `3+7+4+5+4+6=29`; scalar rows total `32` | Repaired table locators agree; no new enumeration claim. |
| §7.7 exceptional branch | Genus-24 parameter; rejected Δ₁₁[6] | `2·12+25=49`; rejected sign `(−1)^3=−1≠1` | Exceptional two-block parameter separated before restriction. |
| §7.10 four forms | Genera 8,12,16,24 | Standard dimensions `17,25,33,49`; genus24 has zero multiplicity 3, ±12 once, ±1…±11 twice | Source sample and all four parameters agree. |
| §8.1 Eichler basis (carried) | Weights 4,8,12, including genus0 | Genus0 image dimension `1`; stable dimensions `1,2,24`; weight12 cumulative sequence ends `…20,22,23,24` | Surjectivity follows by the stated induction; no Φ-surjectivity assumed circularly. |
| §§8.3–8.5 orientations | S₃ and A₃ on three letters; Leech degrees 0,1,8,24,25 | Top invariants `0,1`; one S₃ two-subset orbit but invariant dimension `0`; Leech dimensions `1,0,1,1,0` | Alternating signs, not orbit count alone, determine invariants. |
| §8.5 / Lean rooted vanishing | Zero space; norm-two rank-one root; rooted Niemeier | Positive-degree invariant dimensions `0,0,0`; reflection gives `a=−a`, hence `a=0` over ℚ | General root-span theorem needs no positivity assumption. |
| §8.6 / Lean nonvanishing | Four normalized invariant forms | Coefficient magnitudes `4157776806543360000`, `49893321678520320000`, `41577768065433600000`, `8315553613086720000` | All nonzero; rational line scaling proves the stated arbitrary nonzero-form version. |
| §8.6 coefficient index | Gram diagonal entry 2 | Exponential `exp(2πiτ)=q`, index `1`; claimed index T would be `2` | R05 docstring correction only. |
| §§8.8–8.10 harmonic realization | Rank16 genus8; rank24 genus9 | Source/image/kernel dimensions `2,1,1`; genus9 alternating source and target both `0` | Image is not confused with whole source. |
| §§8.11–8.14 stable range | k=0; k=2,g≥4; (k,g)=(4,8),(8,16) | Constant space `1`; obstructing sign `−1≠1`; source/target dimensions `1=1`, `2=2`; full E₈ Gram coefficient `696729600` versus `0` for a nonisometric lattice | Stable boundary and injectivity pass; no subtraction underflow. |

For §4.1, the first defining clause is grouping the terms of the expressly imported geometric formula; it is not an independently chosen connected-centralizer volume. AutomorphicSpectralTheory #925, `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3220`, gives `c_γ⁻¹ vol(H_γ(ℚ)\H_γ(𝔸)) O_γ` with connected H_γ. CT20 line 401 uses full centralizers. In the SO₃ example above, `diag(−1,1,−1)` commutes with γ and restricts to a reflection of its negative-eigenspace, so the rational component index is 2. Thus grouping the supplied terms gives the correct order-two mass `1/4`, not `1/2`. This check does not require a separate package repair. By contrast §3.15 writes an explicit second equality, and that equality actually omits m_ψ.

### Headline coverage, elaboration and padding

| README headline group | Acceptance-file disposition |
|---|---|
| Spinor characteristic-polynomial obstruction, §4.7 | `spinor_charpoly_obstruction`, stated on native matrices and p-adic rings with four simple support definitions across the file. All primes quantified. |
| Leech invariant dimensions, §8.5 | `finrank_invariantAlternatingForms_of_rootless`, with evenness, unimodularity, positivity, rank 24 and absence of roots explicit. |
| Root-span vanishing, §8.5 | `invariantAlternatingForms_eq_bot_of_roots_span`, on native integral lattices, with spanning hypothesis and g>0. |
| Harmonic Leech nonvanishing, §8.6 / CT19a Theorem 2 | `exists_thetaCoefficient_ne_zero_of_rootless`, asserting an actual nonzero Gram coefficient for every nonzero invariant form. This is enough to state nonvanishing without inventing a Siegel-form carrier. |
| Exact normalized Q_g coefficient | Named as not statable in the docstring: Conway coordinates, normalized ω and the Q_g lattices are absent. |
| CT20 classifications in weights≤22,23,24; Miller and repeated-weight vanishing; cone inequality | Named as not statable: no native adelic cuspidal GL_m representation/Rankin–Selberg carrier. |
| CT20 regular Siegel dimensions, 29 nonscalar and 32 scalar rows, four weight-13 cusp forms | Named as not statable: no native higher-genus Siegel modular/cusp-form carrier. |
| Torsion-class mass recovery tables | Named as not statable: no native elliptic Arthur Lefschetz trace/orbital-integral carrier. |
| Eichler basis, harmonic realization and alternating theta isomorphism | Named as not statable: missing Siegel forms and higher-genus theta-map carriers. |
| Stable dimensions, stable Φ and stable theta isomorphism | Named as not statable with the same missing carriers. |

The original requested `lake env lean` elaboration was run from the pinned content checkout on the absolute package filename. It exited 0, with precisely four declaration-uses-sorry warnings, at Suggested lines 80, 123, 136 and 148. All five individually imported Tau Ceti object modules were available; no build or pin change was necessary. The file uses the pinned module syntax `public import Mathlib` and only five used Tau Ceti modules. There is no `set_option`, sorry'd data, free-Prop stand-in, admitted example or extra API theorem.

A scratch copy tried `simp`, `rfl`, `infer_instance` and `assumption` separately under `solve` for **each of the four theorems**. All four exhausted the alternatives and failed. Reading the near-match declarations found no one-library-lemma `exact` proof: generic Spin-group membership, scalar finrank, root-pairing forms and circle Fourier coefficients do not assert any of these four results. There is no padding finding and no missing statable headline identified.

A second scratch copy appended `#check @name` for **all eight declarations** and elaborated successfully with only the four original sorry warnings. The explicit types agree with the corresponding README mathematics, with no lost section binder. `hpos`, `huni`, `hev`, `hrank`, `hroot`, the root-span hypothesis, nonzero ω and the genus restrictions are present where required. No signature was changed. R05 concerns the support definition's explanatory index, not its elaborated type. The README's eight attributed Lean identifiers resolve to these declarations; mathematical notation such as Π_alg is not treated as an additional Lean declaration.

### Pinned declarations opened and duplication by object

The following are actual files at the pins. The carrier's real fields and hypotheses were inspected, not inferred from names.

| Native object | File and line opened | What it supplies, and what it does not |
|---|---|---|
| Integral lattice | `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`, finite-dimensionality theorem at 121 | Full finitely generated ℤ-lattice in a rational space and integral symmetric form; positivity and nondegeneracy are not structure fields. |
| Even, unimodular, positive | `TauCeti/LinearAlgebra/IntegralLattice/Even.lean:67`; `Unimodular.lean:61`; `Signature.lean:171` in the same directory | Even norms; equality with the dual; positivity. The unimodular API derives nondegeneracy. These are explicit headline hypotheses, not assumed from the carrier. |
| Norm and root set | `TauCeti/LinearAlgebra/IntegralLattice/Norm.lean:78` and 221 | Norm is B(x,x), roots have norm 2. |
| Lattice isometries | `TauCeti/LinearAlgebra/IntegralLattice/Isometry/Basic.lean:77`; `Isometry/Group.lean:102` | Form-preserving equivalence carrying the full lattice to the lattice; group of self-isometries. |
| Golay code and rooted construction | `TauCeti/InformationTheory/Coding/Binary/Golay/Basic.lean:66`, 136, 563, 606, 662; `TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Golay/Basic.lean:33` | Code rank12, Type II, enumerator and minimum distance8; Construction A is a rooted rank24 control, not Leech. |
| Symplectic integral model | `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:120` and 213; `Smooth.lean:93` in that directory | Group scheme, matrix-point comparison and smoothness over the base ring. |
| Spinor norm | `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:98` | Orthogonal group homomorphism to unit square classes for a nondegenerate field-valued form; not the integral all-prime obstruction. |
| Quadratic matrix adapter | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1154` | `Matrix.toQuadraticForm'` on native matrices. The two short package predicates specialize native operations; they do not reconstruct a group scheme. |
| Characteristic polynomial, matrix rank | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`; `Mathlib/LinearAlgebra/Matrix/Rank.lean:134` | Determinant of the characteristic matrix; finrank of the linear-map range. |
| P-adic types and embedding | `Mathlib/NumberTheory/Padics/PadicIntegers.lean:71` and 145; `PadicNumbers.lean:545` | The p-adic rings/fields with prime hypothesis, and the integral-to-field ring homomorphism used in the headline. |
| Alternating maps and dimensions | `Mathlib/LinearAlgebra/Alternating/Basic.lean:67`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | Multilinearity plus equal-input vanishing; `Cardinal.toNat` of rank. Finiteness here comes from the native full lattice, not from finrank itself. |
| Finitely supported sum | `Mathlib/Algebra/BigOperators/Finprod.lean:96` | The generated additive definition `finsum` is zero for infinite support. Positive-definiteness makes the headline's fixed-Gram summation finite. |
| Cyclotomic polynomials | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227` | Native polynomial, including its totalized n=0 value 1; polynomial indexing here uses positive cyclotomic orders. |
| Analytic scalars/support | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:121`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:287`; `Mathlib/Topology/Algebra/Support.lean:215` | Zeta, complex Gamma, and compactness of the closed support; the last is not an implicit smoothness condition. |
| Elliptic dimension input | `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:65` and 262 | `CuspForm.discriminantEquiv` and `ModularForm.dimension_level_one`; genus one, with their weight hypotheses. Not higher-genus Siegel dimensions. |
| Rayleigh input | `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean:266` | A local extremum supplies an eigenvector; it does not choose the least eigenvalue. The roadmap's additional cone analysis is genuine work. |
| Near-matches excluded | `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:293`; `Mathlib/Analysis/Fourier/AddCircle.lean:297`; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:251` | Spin-submonoid membership and Fourier integrals on compact tori do not prove the spinor obstruction or harmonic Leech nonvanishing. |

Object searches covered both pinned libraries, roadmap main, the indexed open heads and the accessible board packages. In particular no higher-genus Siegel modular-form or adelic cuspidal GL_m carrier was found at the pins. No declaration from another roadmap with the same fully qualified package name was found. Short-name coincidences, such as MetaplecticAutomorphicForms' Jacobi `thetaCoefficient`, have different namespaces and different coefficient domains; they are not ownership collisions.

### Supplier resolution, order and open overlaps

The cross-roadmap resolver reported no unresolved citation or attributed Lean name. I also opened the supplier sections: the resolver alone would not detect R01 or R04. Main and completed IntegralLattices are **different files**; the carrier comes from Completed, whereas §4G comes from the active main roadmap. The unqualified §4.6 in the Zassenhaus contract is this package's adapter, confirmed by its actual §4.6 and Needs line; it is not a claim about the supplier's mapping-torus §4.6.

| Supplier checked | Sections consumed and concrete witness location |
|---|---|
| AutomorphicFormsOnReductiveGroups #1037 | §§2.2,2.4–2.5,3.2,3.4–3.5,4.2,5.1,5.5,6.7–6.8,7.2,7.2a,7.4–7.5; `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:446`, 737, 832, 1218. Two declared gaps below. |
| AutomorphicLFunctionsAndLocalFactors #924 | AL.1.4, AL.3.2.3, AL.3.3.8, AL.3.6–3.7, AL.3.9.2; `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1531`, 1620, 1760. |
| AnalyticNumberTheoryPartI, main | §§1.3,1.8; `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:985`, 1112. The generic formula is supplied, its Rankin–Selberg specialization belongs here. |
| SmallRamificationAndAbelianVarietyBaseCases #970 | §§1.5–1.7; `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:443`, 474, 518. Compact kernel and strip positivity imported. |
| AutomorphicSpectralTheory #925 | §§4.4–4.5,4.10,6.9,6.17,6.19–6.20; `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2328`, 3020, 3220. Rational volume remains a declared gap. |
| ModularityAndLanglandsExtensions #1180 | §§3.4,3.8,3.15,3.17,3.20–3.22 and standing trace premises; `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1850`, 2047, 2161. R04 concerns failure to carry its multiplicity factor. |
| AutomorphicBundles #1069 | §§11.1–11.2,11.9,11.16,12.10–12.11,12.13,12.15; `TauCetiRoadmap/AutomorphicBundles/README.md:3788`, 4056, 4295, 5074. |
| MetaplecticAutomorphicForms #1063 | §§0.15,2.4c,3.1,3.4–3.5,3.7,3.10,3.21,5.1,5.6,6.14; `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:896`, 1722. Böcherer's exact image criterion is the declared extension. |
| SymplecticReidemeisterTorsionModSquares #1645 | §4.1; `TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/README.md:751`. Primary-space formula agrees with native spinor norm and includes arbitrary dimension. |
| GeometryOfNumbersAndQuadraticArithmetic #851 | §2.4, especially 2.4.2; `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:593`. Nondyadic unimodular proper-stabilizer statement; dyadic inclusion is declared separately. |
| OrthogonalTamagawaAndLatticeMass #1222 | §§3.1,4.1–4.2; `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md:457`, 508, 534. Lattice masses/classification are different from this package's signed torsion masses. |
| ComputationalNumberTheory #1408 | §§4.1–4.7,4.17,4.17a,4.18,4.26,4.29–4.34,5.1; `TauCetiRoadmap/ComputationalNumberTheory/README.md:2151`, 2191, 2570, 2678. Intrinsic analytic interpretation remains here. |
| IntegralLattices, main/completed | `Completed/IntegralLattices/README.md:162`, Layer1; `TauCetiRoadmap/IntegralLattices/README.md:1722`, §4G. Rank-eight uniqueness is §6C, line2054, also referenced by the rank-classification supplier. |
| Rank24LatticeConstructions, main | Layer6, `TauCetiRoadmap/Rank24LatticeConstructions/README.md:312`; scope line16 excludes harmonic theta and Mathieu/Conway identifications. |
| ThetaSeries, main | Layers1,5,8; `TauCetiRoadmap/ThetaSeries/README.md:673`, 942. Genus-one scalar theta theory is supplied, not replanned. |
| AlgebraicCodingTheory and SporadicOrders, main | Layer5 at `TauCetiRoadmap/AlgebraicCodingTheory/README.md:240`; Layer1 at `TauCetiRoadmap/SporadicOrders/README.md:280`. |
| CFSGBasicProperties, main | P2-L, `TauCetiRoadmap/CFSGBasicProperties/README.md:530`. The Golay–Mathieu and Conway coordinate bridges are supplied; the average characteristic polynomial is a precise additional contract. |
| OrthogonalSpinGroups, main | Layer1 at `TauCetiRoadmap/OrthogonalSpinGroups/README.md:408`, with the pinned norm declaration above. |
| LieHighestWeight and ClassicalGroups, main | Layer6 at `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:773`; Layers3–5 at `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:237`, 272, 297. |
| ReductiveGroups, main | Layer9 at `TauCetiRoadmap/ReductiveGroups/README.md:3029`; the exact integral orthogonal comparison is declared as a gap. |
| ModularForms, main | Layers3–4 at `TauCetiRoadmap/ModularForms/README.md:632`, 670; elliptic eigenforms only. |

The eight gap slugs agree between `design/plan.json` and the exact-contract subsections: `sp2g-lowest-weight-modules`, `siegel-adelic-lift`, `gross-volume-rationality`, `same-type-pair-root-number`, `boecherer-theta-image`, `integral-spinor-norm-units`, `split-orthogonal-regular-form`, `conway-group-average-charpoly`. Each names an earlier owner and specifies the missing mathematical statement. None has supplier `none`. The nondyadic spinor statement, generic theta criterion and Conway-coordinate identification are already supplied and are not requested again by these gaps. The existence criterion and normalization data in a gap describe the same requested object, rather than unrelated deliverables. Their present absence is not a finding.

The required dependency command, with the supplied name, order, movable flag and content checkout, exited 0. Its output was:

```text
depcheck: 236 roadmaps, 2150 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. I did not edit the merge order. No forbidden supplier is consumed.

The overlap inventory reports no other head changing this roadmap, no dropped cited identifier and no identifier defined only by an open revision. The five closest heads were checked by object:

- SiegelModularForms #1714 explicitly imports this package's unweighted and harmonic even-unimodular theta maps: `TauCetiRoadmap/SiegelModularForms/README.md:125` and 352–360. Its broader lattice/level construction does not re-own those specializations. This package does not import that later roadmap.
- OrthogonalTamagawaAndLatticeMass #1222 owns genus mass and lattice classification, not the signed geometric torsion coefficients; see its §§3.1,4.1–4.2 above.
- AutomorphicLFunctionsAndLocalFactorsPartII #1756 owns doubling integrals, local normalizations and their comparisons; `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:5` and its scope distinguish those from the canonical factors imported here from the base roadmap.
- ModularityAndLanglandsExtensions #1180 owns the general Arthur theory; this package specializes it to level one and computes the holomorphic characters. The ownership is single-directional, though R04 drops a supplied factor.
- AutomorphicSpectralTheory #925 owns the general Lefschetz trace formula; this package groups and determines its particular torsion coefficients.

The board package index was read before searching. AnalyticNumberTheory at board #123 is an index supplying no new theorem (`packages/AnalyticNumberTheory/README.md:7`); LogicAndDefinabilityInNumberTheory at board #164 owns definability/motivic integration (`packages/LogicAndDefinabilityInNumberTheory/README.md:7`), not the constructions here. The listed LawrenceVenkateshMethod body could not be read at its supplied head; this limitation is recorded below, not interpreted as nonexistence.

## Not verifiable

- **KT87:** settled `uncertified` in the manifest. Its determinantal-character formulas at pp.466–511 could not be checked against an open full text. I did not reopen the settled request or invent a theorem number.
- **Full numerical exclusion archives and large mass matrices:** the paper statements, supplied normalizations, small witnesses and previously computed table counts were checked. The thousands of rational interval witnesses and the full large linear systems were not independently regenerated. The report does not certify that regeneration.
- **LawrenceVenkateshMethod board #345:** the README request at the head in the board package index returned HTTP 404. Its package body was therefore not compared for ownership; no claim that the roadmap exists nowhere is made.

No additional unread legal source was needed for the five findings. No new missing-source request was created.

## Source issues

- **Misprint** in CT20 at Theorem 3, printed p.6: the source says the simple top weight is 23; it should be 23/2 in its unitary normalization; affects a stated result.
- **Error** in CT20 at Theorem 3, printed p.6: the source says all thirteen classes are determined by their weights; it should exclude the two rank-two classes sharing weights ±23/2; affects a stated result.
- **Misprint** in CT20 at §1.4 after (1.4.5), printed p.10: the source says rationality uses Artin values at nonnegative integers; it should use nonpositive critical integers; affects nothing.
- **Error** in CT20 at §4.1, printed p.36: the source says none of the six multiplicity-free residual parameters has a self-dual class; it should retain the known rank-ten class at the first parameter; affects the proof.
- **Error** in CT20 at §5.2.1, printed p.42: the source says distinct infinitesimal weights are equivalent to k_g>g; it should assert the forward implication from k_g>g, since the trivial lowest-weight module has distinct weights too; affects a stated result.
- **Misprint** in CT20 at Remark 5.3, printed p.45: the source says H2 forces k≥2 while its argument excludes k=2; it should state k≥3, equivalently k′≥2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2bd363c5cd32e25a24afd05c1455d6feb39623f5", "job": "REV-PKG-LevelOneAutomorphicFormsForClassicalGroups~3", "model": "gpt-6-astra", "worker": "chris-8"} -->
