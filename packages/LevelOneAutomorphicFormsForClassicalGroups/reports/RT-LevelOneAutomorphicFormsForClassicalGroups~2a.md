<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13155#issuecomment-6862001278 -->
Red team round 2 pass a (codex) of c038ca8

Verdict: needs_changes

1. **F01** (P2) The dimension supplier contract drops nonnegative weight

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:186`: “for even `k`, the rank ... is `k/12` ... and `k/12 + 1` otherwise.”

   **Claim:** Even integral weights satisfy this dimension formula; the conventions allow negative integral weights.

   **Witness:** At `k = −24`, the displayed right side is `−1`, while `M₋₂₄ = 0`. `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:262` explicitly binds `(k : ℕ)`; its negative-weight branch is separate.

   **Exact repair text:** “For a nonnegative even integer `k`, `ModularForm.dimension_level_one` gives rank `⌊k/12⌋` when `k ≡ 2 mod 12`, and `⌊k/12⌋ + 1` otherwise. For negative integral weights the modular-form space is zero.”

   **Retest:** `k = −24` now uses the zero-space clause; `k = 0, 2, 12` gives respectively `1, 0, 2`. Division by the discriminant still uses integer weight `k − 12`.


2. **F02** (P1) The scalar packet-character input is not supplied or declared

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:73`: “with the packet character of that module requested from the same section (Exact supplier contracts)”; also §§3.9, 3.11–3.12, lines 1486–1553.

   **Claim:** The scalar packet-character calculations have the requisite local character theorem available from ModularityAndLanglandsExtensions §3.22.

   **Witness:** `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:2163` says “Packet character18.3 is separate.” CT20 lines 1773 and 1817 explicitly use that additional theorem. Neither the eight plan gaps nor the README contracts request it.

   The occurrence/multiplicity theorem does not determine the pairing: on a component group of order two, both characters have the same value at the identity and different values at its generator. The alternating-sign identity in §3.9 cannot identify which character the actual representation carries. The later formulas similarly use this missing identification, not merely packet membership.

   **Exact repair:** Add to the ModularityAndLanglandsExtensions contracts:

   > What ModularityAndLanglandsExtensions must provide (gap:scalar-lowest-weight-packet-character): for `g ≥ k ≥ 1` and a real Arthur parameter satisfying all decomposition, infinitesimal-character and occurrence hypotheses of its §3.22, the Whittaker-normalized component-group pairing of the scalar lowest-weight module `ρ_k^(g)` is the character of Mœglin–Renard Proposition 18.3, transported from their highest-weight convention by contragredience, with the dependence on the Whittaker sign `δ = ±1` retained (CT20 §5.2.2, introduction and derivations of (5.2.3)–(5.2.10)).

   Add the same slug, supplier `ModularityAndLanglandsExtensions`, section `3.22`, and that needs sentence to the plan's `gaps`. Add this input to the *Needs* of §§3.9, 3.11 and 3.12. Keep this roadmap's restriction and simplification to global level-one component groups; the new supplier contract concerns the local character before restriction.

   **Retest:** For `g=k=12`, `Δ₁₁[12] ⊕ [1]`, the imported character evaluates on the nontrivial global generator to `(-1)^(24/4)=1`. Membership alone permits either sign; the new input selects `1` and supports the comparison with `εψ=1`.

3. **F03** (P3) The checks apply R_k to objects outside its declared domain

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1427`: “For `k ≥ 1` and `π ∈ Π_alg` say that `π` satisfies `(R_k)`”; line 1439: “`U = 1 + e + I₂` … satisfies `(R_k)`”.

   **Claim:** The three checks of this definition are instances of its predicate.

   **Witness:** Their arguments are formal Weil representations, not classes in `Π_alg`. The first has motivic weight two and dimension four; §5.3 permits only the trivial class below weight eleven. Thus it cannot be realized in the stated domain.

   **Exact repair:** Replace the first paragraph by:

   > For `k ≥ 1` and an effective `U ∈ K∞`, define `(R_k)(U)` by requiring that every weight is at most `k−1`, each nonzero weight has multiplicity one, the zero weight has multiplicity at most three, and the coefficients of `1` and `e` are each at most two. For `π ∈ Π_alg`, write `(R_k)(π)` for `(R_k)(L(π∞))` (CT20 §5.2, condition (R)).

   **Retest:** At `k=2`, `1+e+I₂` has weights `1,0,0,-1`, with character coefficients `1,1`, so passes; at `k=1` it fails the weight bound. `3·1` fails the character bound, and `2I₁` fails nonzero-weight simplicity. All three checks now have actual arguments in the predicate's domain.

4. **F04** (P3) The repaired central-order proof points to the preceding page

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2626`: “CL14 IX, proof of Proposition 3.38, p. 322”.

   **Claim:** The evaluation at `ℓ = log 4` used for the central-order bound is on printed page322.

   **Witness:** CL14 lines12326–12340, between the printed page322 footer (line12325) and page323 footer (line12360), give inequality(3.6) and its ten negative values at log4. The evaluation is on page323.

   **Exact repair:** Replace that proof locator with “CL14 IX, proof of Proposition 3.38, p. 323”. Keep page322 for the proposition's statement at line2617.

   **Retest:** The ten values on page323 are all strictly negative (largest approximately−0.05), so the cited page supports the proposed contradiction to `r ≥ 2`. This is a locator defect in the a/F03 repair, not a failure of its restored mathematical generality.

## Verification of the previous findings

All fifteen earlier findings were marked applied, not “not actionable”. Each mathematical defect is repaired at this head; S04 identifies a page error in the new proof locator. Quotations below are from the current package README; the new contract defects above are not reversals of those repairs.

| Earlier finding | Current passage and location | Recomputed witness | Status |
|---|---|---|---|
| a/F01, orbit-sum sign | §8.4, line 3014: “Sign changes act diagonally on wedge monomials, not on orbit sums” | A singleton orbit sum after an octad sign change has 8 coefficients `−1`, 16 coefficients `+1`; it is neither the original sum nor its negative. The claim is now on monomials. | repaired |
| a/F02, rank zero | §1.3, line 562: “with `n ≥ 1`”; §3.16, line 1660: “`SO₁` is the trivial group” | `EP(SO₁)=1`, rank-zero cuspidal count `0`, no simple parameter; excluded from triangular theorem, retained with Levi base value `1`. | repaired |
| a/F03, central-order generality | §6.11, line 2617: “for every self-dual `π ∈ Π_alg` of motivic weight at most 22” | Among eleven classes, only `Δ₁₇, Δ₂₁` have sign `−1`, hence order `1`; the other nine have order `0`. CL14 lines 12315–12340 cover this full range. | partly repaired: mathematical scope fixed; proof locator S04 |
| a/F04, rank check | §4.11, line 1975: “`[[1,0,0],[0,1,0]]`” | Rank `2`, nullity `1`; both `(0,0,0)` and `(0,0,1)` map to `(0,0)`. Full row rank does not imply uniqueness. | repaired |
| a/F05, numerical table reuse | §4.9, line 1906: “`P(SO_{2n}) = P(Sp_{2n})`”; §8.7, line 3114: “computing the orders from the definitions” | Negation orbits in degree 14: `(2257+59)/2=1158`. Five order totals: `0+0+0−1+1=0`, all zero, `0+0+0−1+1=0`, `0−4−4−1+9=0`, `0−12−12−1+25=0`. | repaired; structural formulas replace the tables |
| a/F06, polynomial coefficients | Conventions, line 129: “irreducible algebraic representation” | `g=1,k=−1` gives `det⁻¹`; `(1,−1)` gives `det⁻¹⊗Sym²`; `(1,0)` is polynomial. The text now distinguishes algebraic from polynomial. | repaired |
| a/F07, spanning before theta | §6.2, line 2399: “needs the theta map and is the last target of §6.4” | At `g=9,k=4`, `θ(E₈)` has constant coefficient `1`, whereas the cusp space is `0`. The spanning assertion now follows the definition of its map. | repaired |
| a/F08, shifted poles | Contract, line 285: “at `s = iσ` and `s = 1 + iσ`” | For `(1,\|·\|^{2i})`, `σ=−2`, so poles `−2i,1−2i`; trivial central characters in `Π_alg` force `σ=0`. The supplier agrees. | repaired |
| a/F09, duplicated regular criterion | §3.5, line 1402: “occurrence criterion of ModularityAndLanglandsExtensions §3.21 … which is imported” | `Δ₁₁[2]⊕[3]` has dimension `7`, weights `±6,±5,±1,0`, matching `(7,7,4)`, but odd block length `3` excludes the module. Supplier §3.21 states the criterion. | repaired |
| a/F10, grouping check | §4.1, line 1727: “infinitely many rational conjugacy classes” | Involutions in split `SO₃` have one geometric class and rational square-class invariants; the grouped mass is `1/4`. The nonidentity unipotent has upper-right entry `r` in its rth power, never `0` for positive r. | repaired |
| a/F11, nonmonic character rule | §4.10, line 1932: “monic of degree `d_G`” | `2(X−1)²` has elementary symmetric values `(1,2,1)` but signed coefficients `(2,4,2)`; excluded. For `(X−1)²` the two lists coincide. | repaired |
| b/F01, nonexistent printed tables | §4.18, line 2088: “unique solutions of the rational systems” | CT20 lines 515–525 refer elsewhere for values. The package now specifies systems; at `SO₃` their values are `−1/12,1/4,1/3`, summing to `1/2`. | repaired |
| b/F02, neighbour locators | §6.3, line 2443: “CL14 III §3.1, pp. 63–64” and “III §3.2, p. 64” | CL14 lines 2402,2449,2469–2470: directed counts `18225,12870`; ratio `18225/12870=405/286`. | repaired |
| b/F03, incomplete Needs | Lines 510,1144,1381,1833,2376,2476,2605 now name the previously omitted suppliers | AF supplies actual automorphic representations and real modules; interval arithmetic supplies certified scalars; non-neat descent handles the level-one stabilizers; Weil/theta modules supply the two theta maps. These added IDs exist at the heads checked. | repaired; S02 is an additional missing input |
| b/F04, gamma constant | §2.6, line 914: “apply §1.8 to `κ⁻¹Λ₁` and `κ⁻¹Λ₂`” | For `I₁₁`, `κ=2(2π)^(−11/2)≈0.000081478`; for `1`, `κ=1`. Removing the same nonzero constant preserves zeros, poles and the functional equation. Main AnalyticNumberTheoryPartI §1.8 has no general prefactor in (iv). | repaired |

## Verified sound

Read all 3,303 README lines and all 162 Lean lines: 110 numbered target sections, 367 Check bullets, four definitions and four theorem declarations. The following tables record the mathematical instances, rather than treating the successful signature extraction as a truth test. Numerical certificate claims are distinguished below from small computations independently reproduced here. All fifteen previous findings were retested. The checks and locator audit expose S01–S04; there is no additional Lean-signature or padding finding.

### Lean declaration and context register

All eight declarations are in `TauCetiRoadmap.LevelOneAutomorphicFormsForClassicalGroups`. There are no inherited section variables or `include` clauses. The supplied elaborated types were compared with every explicit binder; no binder has disappeared. I did not run Lean, in accordance with the read-only/no-build instruction. In the table, V may inhabit any universe; its scalar field is always ℚ. The arbitrary-ring definition does not assert the characteristic-two scheme comparison.

| Declaration; README target | Full context beyond the displayed arguments | Computed instances and values on both sides | Result/change |
|---|---|---|---|
| `IsRegularIntegralForm`; 4.7 | `{n : ℕ}`, integer n×n matrix c; no instances beyond native matrix/ring structures | Empty matrix: determinant `1`, even branch true. `c=(1)`: polar determinant `2`, odd branch true. Hyperbolic c: determinant `−1`, true. `diag(1,1)`: determinant `4`, false. | Correct real definition; distinguishes unit half-discriminant from perfect polar pairing. |
| `specialOrthogonalPoints`; 1.3,4.7 | `{n : ℕ}`, c integral, `R : Type u`, `[CommRing R]` | Identity: determinant `1`, q(x)=q(x). Rank one over ℤ: `−1` preserves x² but determinant `−1`, excluded. Hyperbolic diagonal `(p,p⁻¹)` over ℚp preserves xy but is not integral. Zero ring: unique matrix, `0=1` and `q=0`, included; no scheme claim there. | Correct set-valued predicate. |
| `spinor_charpoly_obstruction`; 4.7 | Explicit regularity hc, a,b naturals, rational Q, `Q(1)Q(−1)≠0`; every prime p with `[Fact p.Prime]`; local γ and characteristic-polynomial equality after both coefficient maps | n=0,Q=1,a=b=0: conclusions `1=1²` twice. `Φ₁Φ₆`: `Q(−1)=3`, odd valuation at 3, so local premise fails. `Φ₁Φ₄`: value `2`, odd valuation at 2, fails. `Φ₁Φ₃`: value `1`, obstruction passes. Rank-one identity: a=1,Q=1 gives `1=1²`. | Correct; p=2 retained. Monicity and degree follow from the local characteristic-polynomial premise. |
| `invariantAlternatingForms`; 8.5 | V, `[AddCommGroup V] [Module ℚ V]`, `L : IntegralLattice V`, g natural | g=0: constant alternating maps, invariance `a=a`, dimension 1. Root line and g=1: reflection gives `ω(x)=ω(−x)=−ω(x)`, hence 0. V=0,g>0: every alternating map is 0. | Correct submodule; no positivity silently assumed. |
| `thetaCoefficient`; 8.6 | Same V and instances, lattice L, `{g}`, rational alternating form ω, rational g×g T; no positive-definiteness binder | Root line with norm `2x²`, g=1,T=(2): tuples `±1`, coefficient `a−a=0`. T=(−2): empty sum `0`. g=0: one empty tuple, coefficient `ω(())`. Scaling ω by 2 doubles each coefficient. | Correct finsum. Finiteness is asserted only for positive-definite L. |
| `finrank_invariantAlternatingForms_of_rootless`; 8.5 | V and instances; L; explicit even, unimodular, positive, finrank=24 and no norm-two vectors; all g | Average polynomial coefficients give dimensions `1` at g=0,8,12,16,24; `0` at g=1,2,25. For g=1, `−1` independently forces 0. Removing rootlessness admits rooted Niemeier lattices with g=24 invariant dimension 0 instead of 1. | Correct hypotheses and rational coefficient field. |
| `invariantAlternatingForms_eq_bot_of_roots_span`; 8.5 | V and instances; L; explicit span of norm-two vectors = top; `{g}` and `0<g` | On root tuples, reflection in first root changes evaluation from a to −a, so a=0. Even a degenerate form `diag(2,0)` has roots `(±1,b)` spanning ℚ² and the argument still gives 0. At g=0 invariant constants have dimension 1, explaining the strict hypothesis. | Correct generality beyond positive-definite lattices; not a one-lemma restatement. |
| `exists_thetaCoefficient_ne_zero_of_rootless`; 8.6 | Same five lattice hypotheses as finrank theorem; g in `{8,12,16,24}`; explicit invariance and ω≠0 | Put C=`8315553613086720000`. In source normalization the four absolute coefficients are `C/2,6C,5C,C`, all nonzero (g=8 uses C/10 embeddings times 5). General nonzero ω is a nonzero rational multiple, preserving nonvanishing. ω=0 gives all coefficients 0 and is excluded. | Correct full coefficient nonvanishing, not a numerical stand-in. |

The native lattice structure at `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63` bundles a full finitely generated lattice and an integral symmetric form; it does not include positivity or nondegeneracy. `Signature.lean:171`, `Even.lean:67`, `Unimodular.lean:61`, `Norm.lean:78,221`, and `Isometry/Basic.lean:77` support exactly the separate predicates and isometries used here. In particular, the root-span theorem does not need a missing positivity hypothesis. `Isometry/Reflection.lean:74,101` supplies reflection evaluation, not the invariant-alternating-form theorem.

### Computed README register

Each row covers the target and its defining API/Checks. “Source-sized” means that the displayed arithmetic/range check is independent but the large enumeration or rank assertion is a source assertion, not a recomputed certificate. All other displayed equalities and inequalities were recomputed. Field, characteristic and finiteness scope matters: global forms are over ℚ with complex coefficients, local spinor arguments include ℚ₂, and the polynomial/exterior definitions use their stated integral/rational carriers. Inseparable fields, arbitrary DVRs, zero coefficient fields, nonreduced schemes and non-quasi-separated spaces are not quantified over by these targets.

| Target | Instances and computed values | Result/change |
|---|---|---|
| Conventions: coefficient representation | `(−1)` gives det⁻¹; `(1,−1)` gives det⁻¹ Sym² with weights `(1,−1),(0,0),(−1,1)` | Repaired polynomial/algebraic distinction holds. |
| Conventions: groups and dimensions | Sp₂: `(d,m)=(2,3)`; SO₃: `(3,2)`; SO₄: `(4,4)`; SO₁: m=0 and EP=1 | Positive-rank restriction is necessary and present. |
| Conventions: Weil/Fourier normalizations | I₀=1+e has dimension 2; Γℝ(s)Γℝ(s+1)=Γℂ(s); ξ=i/(4π) gives s=1 | Factors 2 and 4π agree across uses. |
| Mathlib dimension contract | k=−24 gives formula −1 versus actual 0; k=0,2,12 gives 1,0,2 | S01. |
| 1.1 Cuspidal spectrum | Trivial PGL₁: rank1, weight0. Δ: rank2, weights ±11/2. At p=2, complementary-series roots multiply to1 and have absolute values 1.1892,0.8409 within (0.7071,1.4142) | No finite temperedness overclaim. Read the characters of ℂ× as the restriction of the Weil parameter. |
| 1.2 Weil ring | I₁²=I₂+1+e: dimensions 4=2+1+1; I₂₃² contains I₄₆ outside bound23; e²=1 | Correct parity filtration and I₀ convention. |
| 1.3 Integral models | Odd ternary polar determinant −2; hyperbolic determinant −1; diag(p,p⁻¹) not integral | Odd regularity and prime2 are retained. |
| 1.4 Factors | ε(I₁₁)=i¹²=1, det=e¹²=1; ε(e)=i; ΓℝΓℝ(·+1)=Γℂ | Multiplicative versus additive operations consistent. |
| 1.5 Purity | w(Δ₁₁)=11; w(Sym²Δ₁₁)=22; w(1)=0; dual pair gives two classes and one infinity type | Correct distinction between local self-duality and global self-duality. |
| 1.6 Regular vectors | `(1,0,0,−1)` passes; `(1,1,−1,−1)` fails; `(1/2,0,−1/2)` has difference1/2 and fails; `3·1` and `1+2e` have identical weights but differ | Regularity guards reconstruction. |
| 1.7 Counts | Rank1 fibre `(N,N⊥)=(1,1)`; weight23 rank2 `(2,2)`; a dual pair adds `(2,0)`, even difference2 | Finite-fibre and parity claims coherent. |
| 1.8 Type/root numbers | ε(I₁₁I₁₅)=i³²=1; ε(I₁₇)=−1; 2I₁ admits symmetric and alternating forms | Simple-weight hypothesis is necessary for type inference. |
| 1.9 Weight dictionary | Sp₂ λ0→(1,0,−1); SO₃ λ0→(1/2,−1/2); inverse of (0,0,0) would be −1; SO₄ λ=(1,±1) has same outer-orbit image | Inverse restricted to regular image. |
| 2.1 Test class | Triangle transform at0=4, not totalized0/0=0; zeros with Reρ=0,1 give Imξ=−1/(4π),+1/(4π); exp(−abs x) fails c=1 | Compact support makes the stated class admissible. |
| 2.2 Odlyzko functions | g(0)=1; g″(0)=−π²; g″(±1)=0; at ℓ=1, A_F=8/π²≈0.810569 and A_G≈0.8202>A_F | C² extension, convolution factor and strip conversion consistent. |
| 2.3 J and bilinear form | F=(1−x²)³ on [−1,1]: J(1−e)≈+0.225483645 versus unsigned integral −0.225483645; B(1,1)=J(1), not2J(1) | Leading minus and multiplication correct. |
| 2.4 Eight scalars | At ℓ=1, second=fifth=8/π²≈0.810569; pole values→0 as ℓ→0; J(1)=(J(I₀)+J(1−e))/2 | Correct separation of the F/G data. |
| 2.5 Bilinear forms | Distinct Δ₂₃ classes: δ=0 though identical infinity types; pair (Δ₁₇,1): e⊥=1; at p=2,k=1, coefficient is F(log2)log2/√2 | No extra factor2 in Bf. |
| 2.6 Explicit formula | F=0 gives 0=0; trivial pair poles have residues −1,+1 and pole sum2A; I₁₁ prefactor≈0.000081478; twist2i poles−2i,1−2i | Correct half-zero term and repaired normalization. |
| 2.7 Cone inequality | Δ₁₇−1 has cross coefficient−2; trivial class gives A−J(1)≥0; zero vector gives0 | Nonnegative-cone restriction is used. |
| 2.8 Multiplicity | m=2 gives A/2; m=0 would give totalized0 and no bound, whereas averaging gives x=0 | m≥1 present; classes, not parameters, counted. |
| 2.9 Gram matrix | U=I₀: U²=2+2e, ε=−1, diagonal A−J(2+2e)−B/2; pair1,e has ε=i and is inadmissible | Root-term guard includes the diagonal. |
| 2.10 Least eigenvector | diag(1,2): values1 at e₁,2 at e₂; e₂ is maximum, not minimum; dimension1 sphere values equal its sole eigenvalue | Adds a real conclusion beyond the pinned eigenvector theorem. |
| 2.11 Face criterion | diag(1,−1): min−1 on {2}; matrix[[1,2],[2,1]] has least eigenvalue−1 but cone minimum1; diag(0,1): min0 | Supports and strict positivity are correctly separated. |
| 2.12 Two coordinates | a=c=1,b=−2: q(1,1)=−2; b=2: q=6; b=−1: q(1,1)=0 | Determinant−3 alone cannot decide cone negativity. |
| 2.13 Equal coordinates | β=identity gives every unit vector value1; duplicated two-block kernel with A=1 gives β=[[0,−1],[−1,0]], minimum−1 at equal coordinates | Strict negativity excludes the identity counterexample. |
| 2.14 Self-duality flags | ε=−1 changes off-diagonal entry by −B/2; x=(1,1) changes q by−B, x=(1,−1) by+B; ε=1 changes0 | Order is only on the nonnegative cone. |
| 2.15 Compression | Expanded I₂−ones has minimum−1; compressed entry1/2−1=−1/2; lift t→(t/2,t/2) gives q=−t²/2 | Preserves sign, not minimum value. |
| 2.16 Enclosures | q[[1,−2],[−2,1]](1,1)=−2; interval[−.01,.01] includes+.01 | Strict upper endpoint<0 and nonnegative witness are needed. |
| 2.17 Exclusion | For −F₁ and U=1, β=−C; prime contribution F₁(log2)log2/√2≈0.0399754>0, so β<0 although1 exists | POS prevents the false exclusion. |
| 2.18 Covers | B=I,c=1 in ℕ² gives (0,0),(1,0),(0,1); B=0 gives infinitely many; signed x reverses entrywise comparison | Positive definiteness and effective cone retained. |
| 2.19 Miller | n=0 even-rank branch rank2; n=12 rank26; odd branch n=0 gives rank1 trivial and is excluded | Endpoints agree with 1<N<27. |
| 2.20 Elliptic bound | w11→dimS₁₂=1; w23→dimS₂₄=2; even w gives odd classical weight and dimension0 | Weight shift w+1 correct. |
| 2.21 Repeated PGL₄ | w23 known set2; w53 known set dimM₄₂=4; odd integers1…53 number27 | Corrected multiplicities; certification is source-sized. |
| 3.1 Arthur sums | Δ₁₇[8]+[9]+[7]+[1] dimension33; Δ₁₁[12]+[25] dimension49; Δ₁₁[1] has wrong type | Distinct pairs can share a cuspidal constituent. |
| 3.2 Component/epsilon | One odd block gives group1; three odd blocks give order4; SK generator ε=i^(w+1) | Even generators and relation retained. |
| 3.3 Multiplicity | SK: local−1 versus (−1)^(k−1), equality exactly for even k. Unramified quadratic SL₂ parameter: component order2, two packet members, one spherical | No singleton-packet assumption. |
| 3.4 Lowest weight | g1k0: eigenvalues0,±1 distinct, but trivial module; g2(1,1): bound1≥0; g3(1,0,0): bound0≥1/2 false | Unitarity criterion and discrete-series range separated. |
| 3.5 Regular packet | Δ₁₁[2]+[3] matches k=(7,7,4), but dodd3≠1; SK gives character−1 | Imported criterion; repaired ownership. |
| 3.6 Bounded condition | Formal U=1+e+I₂ at k2 passes coefficient tests; at k1 bound1≤0 fails; 3·1 and2I₁ fail other tests | S03 repairs predicate domain. |
| 3.7 Cases I/H | g=k=12 gives H1 length1 with e¹²=1; g=k=13 gives H2 length3 with e¹²=1; lengths differ2 | Predicates distinguish the branches. |
| 3.8 Occurrence | Δ₁₁[12]+[1] gives dimension25 and three zeros; positive shifted segment0…11 once,11>0; real δ₁[2]+1 has same infinitesimal character for k1,2 but only k2 occurs | Criterion stronger than infinitesimal character. |
| 3.9 Case-I character | ε=−1,a1: floor−1/2=−1 gives−1; ε=1,a3: floor3/2=1 gives−1; k12 block gives(−1)^6=1 | Algebra correct; local identification missing, S02. |
| 3.10 Compact remainder | g16k13 H2: k′12, removed length9, dimension33−9=24=2k′, determinant e¹²=1 | Dimension/type bookkeeping consistent. |
| 3.11 Even generators | Trivial class: r1+0+0=1; g16k13 H2 removes weight4 from12…1, so weight3 moves from position10 to9, flipping parity | Renumbering essential; S02 for character input. |
| 3.12 Odd generators | a1,δ(−1)^(k′−1)=±1 gives floor0 or−1 and signs+1/−1; 2·1 has zero multiplicity2 but no e | Zero-character distinction correct; S02. |
| 3.13 Independence | g=k12,Δ₁₁[12]+[1]: I andH1 each give(−1)^6=1; ε=i¹²=1 | Agreement test survives; requires S02 to identify actual characters. |
| 3.14 EP | SO₃,k0:1; k5:−dimS₁₂=−1; deleting residual would change first to0 | Residual included. |
| 3.15 Packet EP | SO₈ λ=(9,7,4,2): one outer member has EP1, other0, average1/2, mψ2 gives1; wrong character contribution0 | Correct outer averaging and multiplicity factor. |
| 3.16 Triangular counts | SO₃:κ−1,R=δk0 gives1 at0,−1 at5; Δ₁₇[2]+Δ₁₇[4]+[1] dimension13 uses one repeated class | Induction uses dual dimension; rank0 excluded. |
| 4.1 Geometric masses | SO₃ identity mass−1/12; involutions: one geometric class, infinitely many rational square classes, grouped1/4; unipotent powers have entriesr≠0 | Finite-order and geometric grouping distinctions hold. |
| 4.2 Rationality | ζ(−1)=−1/12; order4 mass0; ζ(2)=π²/6 is outside the specified critical range | Signed rational, not positive, masses. Declared volume gap retained. |
| 4.3 Levi terms | SO₃,k0: T_ell=−1/12+1/4+1/3=1/2; proper term1/2; total1=EP. Rank0 Levi value1 | Consistent base and residual terms. |
| 4.4 Polynomial indices | Degree2: five polynomials, three negation orbits; odd SO₃: five indices, no negation quotient; negative of Φ₁³ is Φ₂³ with odd a₂=3 | Both determinant parity and d_G used. |
| 4.5 Fibres | Two-class SO fibre with equal trace t gives trace sum2t and coefficient m, not mt; nontrivial central character pairs t and−t giving0 | Fibre cardinality is not negation-orbit size. |
| 4.6 Spinor formula | Plane γ=−1 gives disc(q); order3 gives Q(−1)=1; order4 Euclidean rotation gives det((1+γ)/2)=1/2, same square class as2; Q(1)Q(−1)=4~1 | Square-class factors and parity correct. |
| 4.7 Obstruction | SO₃ Φ₁Φ₆ gives3 nonsquare, Φ₁Φ₃ gives1 square; hyperbolic t=±1 requires Q=1, not evaluation0 of unfactored polynomial | All primes and nonzero evaluation premise retained. |
| 4.8 Filter | Φ₄(−1)=2 fails, Φ₆(−1)=3 fails, Φ₅(−1)=1 passes when a1 even though Φ₅(1)=5 | Only required side tested for each a,b. |
| 4.9 Sizes | Degree2 `(5+1)/2=3`; degree4 `(19+5)/2=12`; degree14 `(2257+59)/2=1158`; division by2 alone gives1128.5 | Negation fixed points included; larger enumerations source-sized. |
| 4.10 Characters | Sp₂ λ2 at identity: e₁²−e₂=4−1=3; SO₃ λ2:9−3−1=5; nonmonic2(X−1)² gives mismatching lists | Monicity and orthogonal factors repaired. KT87 uncertified. |
| 4.11 Linear recovery | 2×3 matrix[I₂ 0]: rank2, two solutions0,e₃; SO₃ three columns versus three equations | Column rank, not row rank, is required. |
| 4.12 SO₃ | k0 order4 character sin(π/4)/sin(π/4)=1; wrong denominator gives√2/2. k5 formula11/12+1/4+1/3−1/2=1 | Normalization correct. |
| 4.13 Coarse recovery | SO₁₅ rows1924>columns1339; Sp₁₄ rows974<columns1158, deficit184 | Counts consistent; full ranks source-sized, not inferred merely from row count. |
| 4.14 Known classes | 11+13+3=27 classes; two Δ₂₃ classes share one block, hence26; dimS₂₄=2 versus dimS₂₃=0 | Distinct classes retained. |
| 4.15 Refined recovery | Sp₁₄ 1274×1158; SO₁₆ 1810×992; SO₁₇ 3477×2948; lowering cutoff removes16 rows (3477−3461) | Size consistency; rank certificates source-sized. |
| 4.16 Easy/hard | p3,S={1,2}: fails0∈S; p2,S={1,3}: passes1∈S; p2,S={2,3}: fails; singleton passes | Three discriminating formal index conditions. |
| 4.17 Sp₁₆ | 2521−766=1755 easy orbits; hard matrix1086×766 can have full column rank; unrefined1427<2521 | Rank/easy local evaluation source-sized. |
| 4.18 Values | SO₃ masses−1/12,1/4,1/3 are all nonzero; exceptional counts6+6=12; Sp₁₆ exceeds n≤7 | Repaired source claim; no extrapolated nonvanishing. |
| 5.1 Covers | c=−1,B positive gives no effective candidates despite actual trivial class; required c≥8ℓ/(mπ²)>0 excludes this | Cutoff premise closes vacuity. |
| 5.2 Bounded finiteness | B=I on ℕ² at c1 gives three vectors; B=0 infinitely many; weight24 lies outside bound23 | Positive-definite assertion/rational witness is source-sized. |
| 5.3 Weight≤22 | Rank totals: trivial1, Δ rank2, Δ₂₁,₁₃ rank4, Sym²Δ rank3; below11 only1; 1+5+4+1=11 | Stated classification matches CT20 Theorem3. |
| 5.4 Residuals | U_exc has seven two-dimensional summands, rank14; repeated I₂₃ rules out top simplicity; 187 belongs to one-class cover, not two-class cover | Finite exclusions source-sized; domain labels correct. |
| 5.5 Exceptional fibre | Bound at m3 rules out size≥3; involution on a size2 fibre with no fixed point gives one dual pair, not a mixed fibre | Self-duality exclusion and cardinality bound are distinct. |
| 5.6 Top-simple23 | Rank distribution2+3+7+1=13; two rank2 classes have equal I₂₃ | No uniqueness-by-weights claim. |
| 5.7 Repeated-top | 181 possible singleton fibres plus one possible pair gives at most183 classes on182 parameters | Necessary alternatives, not existence. |
| 5.8 GRH | Remaining A has8 summands×dimension2=16; dual-pair flagδ0,m2; one surviving parameter versus0 if all were excluded | Conditional hypothesis retained; certificates source-sized. |
| 5.9 Weight24 rank bound | 16 classes in15 blocks; regular self-dual even weight has orthogonal sign+1 | Four surviving candidates are not asserted to exist. |
| 5.10 Weight24 | Rank7 weights±12,±8,±4,0 correspond to Sp₆; ranks11,13,15 require Sp₁₀,Sp₁₂,Sp₁₄ | Generality limited to regular self-dual case. |
| 6.1 Boundary operator | Genus1 constant term: Δ↦0,E₄↦1; g=k gives ζ(s)²; weight0 constant1↦1 | Correct source/target and kernel. |
| 6.2 Vanishing | g9,k13 odd×odd→0; g9,k4 has9>8 so cusp0; g24,k12 has equality24=24 so strict theorem does not decide | Cusp versus whole space correctly separated. |
| 6.3 Lattice/Hecke pairing | E₈ mod2 isotropic lines=(16−1)(8+1)=135; cross products12870×405=18225×286=5212350; reciprocal products differ | Free basis uses automorphism weights, functions reciprocal weights. |
| 6.4 Theta | Zero tuple coefficient1; rescaling by E₈ order gives1/696729600≠1 despite commuting with Φ; g9,k4 dimension1; g5,k2 dimension0 | Normalization fixed independently of Φ; spanning now after definition. |
| 6.5 First occurrence | E₈ degree0 with θ₀=1; rank16 difference θ₀=0, θ₁…θ₃=0, θ₄≠0, so degree4 | First occurrence does not equal target genus. |
| 6.6 Pluriharmonics | ν1,g1 gives n linear coordinates; ν1,g=n+1 gives alternating space0; g2,ν3 gives p(tX)=t⁶p(X) | Determinant exponent gν correct. |
| 6.7 Harmonic theta | n24,ν1 weight13; rank-deficient tuples give alternating coefficient0; ν0,E₈ gives constant coefficient1, noncuspidal | Cusp assertion requires positive determinant weight. |
| 6.8 Small lattices | Δ₁₁[4]+[7]+[1] dimension16; rank24 block[15] gives g₀=(23−15)/2=4; cumulative multiplicities end24 | Eigenparameter/degrees source-sized; no reownership of lattice classification. |
| 6.9 Rallis | E₈ atg8: [7]+[1]+[9] dimension17; replacingg byg₀0 would demand negative block length; rank24,g12 givesΔ₁₁[12]+[1] dimension25 | Correct direction in both branches. |
| 6.10 Higher lifts | E₈ g8 satisfies8>0 and8>7; 2g+1=17>g+g₀+1=9>n8 | Strict inequalities and added block consistent. |
| 6.11 Central orders | εΔ₁₇=εΔ₂₁=−1 gives order1; εΔ₁₉,₇=i²⁸=1 and εΔ₂₁,₁₃=i³⁶=1 give order0; trivial completed value≈−3.98≠0 | Full eleven-class statement repaired. |
| 6.12 Böcherer | Arguments n/2−g=0,4,0,−4,−12; g16 denominator order4 gives reciprocal−4, total0; reversing sign gives8 | Gamma factors and denominator distinguished; conditional specialization to parameters named in7.10. |
| 7.1 Discrete spectrum | g1,k12: one class/line; k24: two; singular theta lifts can have residual long block | Multiplicity versus eigenline count consistent. |
| 7.2 Regular formula | g2,k10 SK sign−1=−1 gives1; k11 sign−1≠+1 gives0; k20 dimM5−dim boundary2=3, split into1 simple+2 SK+0 | Full candidate list needed. |
| 7.3 All weights g≤8 | g8 uses dual dimension17 and Sp₁₆ masses; g9 uses19 and would need Sp₁₈ | Range matches available masses; not bounded k₁. |
| 7.4 Regular enumeration | 29 nonscalar+29 scalar parameters=58; k_i=a_i+i; distinguishing two Δ₂₃ classes introduces25 rejected candidates | Source-sized exhaustive enumeration. |
| 7.5 Case I | Δ₁₁[12]+[1] dimension25, character(−1)^6=1, epsilon i¹²=1 | g=k12 case included. |
| 7.6 Case H1 | g14,k13: pair root number ε(I₁₁(I₂₂+e))=ε(I₃₃+2I₁₁)=i³⁴i²⁴=−1 versus local1; k2,6 odd-pair sign−1 versus1 | Rejections coherent; first occurrence used independently. |
| 7.7 Case H2 | g16,k13: omit4; remainder positive weights12…5,3,2,1 and double0; g24 parameter dimension49 survives separate branch | Repeated trivial blocks and exceptional branch retained. |
| 7.8 Nonscalar list | (13,10,7)−(1,2,3)=(12,8,4); (11,11,7,7) gives(10,9,4,3); counts3+7+4+5+4+6=29 | Genus2 example sits at(14,8), outside bound13. |
| 7.9 Scalar counts | g4,k12 has two distinct parameters with weights11,10,9,8; successive weight12 cusp dimensions sum23, plus genus0 constant1 gives24 | Classes not weights counted; singular g24k13 retained. |
| 7.10 Weight13 | g8 positive weights12…5 plus0, dimension17; g24 has±12 once,±1…±11 twice,zero3:2+44+3=49 | Four genera and all other vanishing agree. |
| 8.1 Eichler | g0 θ↦constants1; ranks8,16,24 provide low weights4,8,12; weight16,g14 counterexample outside scope | No general theta-surjectivity overclaim. |
| 8.2 Dimensions | Weight8 dimensions1 for g<4,2 for g≥4; weight12 cumulative values atg0,4,12 are1,6,24 | Initial constant and first-occurrence counts agree. |
| 8.3 Exterior orbits | S₃ on3 letters: degree2 and3 invariants0; A₃: each1; ℤ through3-cycle dimensions(g0…4)=1,1,1,1,0; g0 empty orbit1 | Handles nonabelian, cyclic and infinite acting groups via finite image. |
| 8.4 Mathieu forms | Singleton after octad sign has8 minus/16 plus coefficients; monomial in codeword meets every codeword evenly, sign+1; C+{p} meets complement in1, sign−1 | Repaired monomial argument. |
| 8.5 Niemeier invariants | Root line reflection forcesa=−a→a0; Leech polynomial coefficients atg0,8,12,16,24 all1; trivial group degree1 gives coefficient−24 and dimension24 | Average sign and rooted/rootless distinction correct. |
| 8.6 Coefficients | C/10 embeddings×5=C/2 atg8; C/3×18=6C atg12; C×5 atg16; C atg24; nonorientable source coefficienta=−a→0 | Embeddings, not unmarked sublattices, counted. |
| 8.7 Five orders | Tuples `(0,0,0,−1,1)`, `(0,0,0,0,0)`, `(0,0,0,−1,1)`, `(0,−4,−4,−1,9)`, `(0,−12,−12,−1,25)` each sum0 | Recomputed from factor rules, not copied as the proof. |
| 8.8 Realizations | 24/2+1=13=16/2+5; latter onlyg8 | Two constructions have same weight; lattice nonvanishing independent of classification. |
| 8.9 Rank16 source | Δ₂₁,₁₃[4] dimension4×4=16; Δ₁₇[8] dimension2×8=16; source dimension2, target1, second line maps0 | No inference of source dimension from target. |
| 8.10 Alternating isomorphism | g9:0→0; g25:exterior0→cusp0; g8:one-dimensional source with nonzero coefficient→one-dimensional target | Injectivity/surjectivity have required nonzero input. |
| 8.11 Stable parameters | k2,g4: local sign(−1)^1=−1 versus global1; H2 would requireg≤2 butg≥4; I would require1>g−2≥2 | Necessity4∣k; excludesk0 separately. |
| 8.12 Stable dimensions | k0 allg dimension1, includingg0; k1,2,3 stable dimension0; k4,g8 dimension1 | Constant boundary handled. |
| 8.13 Stable Φ | k4,g8 uses cusp atg9=0, equal dimensions1; k0 map1→1; g=2k−1 lacks strict vanishing | Threshold and direction correct. |
| 8.14 Stable theta | k4,g8:1→1; k8,g16:2→2; k0:g0 lattice maps1; full-rank coefficient `card O(L)` is a positive integer | Injectivity uses actual lattice isometries, not normalization1. |

### Headline and padding audit

The README's end results are the cone inequality and Miller/repeated-PGL₄ exclusions; the packet/triangular count relation; complete mass recovery in the stated ranks; classifications through weights 22–24 and the GRH alternative; all regular Siegel dimensions through genus eight; low-weight nonscalar and scalar classifications; four weight-13 forms; Eichler spanning; Leech invariant forms and coefficient nonvanishing; harmonic realizations; and the stable dimension/operator/theta theorems.

The four statable lattice/spinor headlines are present. The module docstring names the other headlines and identifies the missing automorphic representation, Arthur-packet, trace-formula, genus-g modular-form or theta carriers. The exact normalized Leech coefficient is separately withheld because its coordinate normalization and Qg lattices are absent. General finrank facts, Fourier coefficients on an additive torus, matrix block projections, and the Clifford spin group from the near-match list do not prove these four statements. None is a one-tactic consequence, a boundary-only statement, an admitted datum, or a free-predicate replacement. All own Lean declaration names appear in the README. Imports are Mathlib and the five actual Tau Ceti lattice modules; no `set_option`, `lemma`, or admitted definition occurs.

### Suppliers, ownership and merge direction

Checked the 15 cross-roadmap contract groups (17 supplier headings including the two pinned libraries), using main for existing roadmaps and the supplied open-head inventory/current `roadmaps show` text for new roadmaps. Object searches included the real Weil ring, cone/Gram method, scalar packets, torsion masses and spinor norms, genus-g and harmonic theta maps, first occurrence, Leech alternating invariants and stable dimensions. The missing local character contract is S02; a resolver's successful name lookup does not certify that mathematical input.

| Contract group | Resolved supplier content and mathematical comparison |
|---|---|
| AutomorphicFormsOnReductiveGroups | §§2.2,2.4,2.5; 3.2,3.4,3.5,4.2; 5.1,5.5; 6.7,6.8; 7.2,7.2a,7.4,7.5. Real/adelic carriers and CT algebraicity are separate from the two declared Sp gaps. |
| AutomorphicLFunctionsAndLocalFactors | Conventions, AL.1.4, AL.3.2.3, AL.3.3.8, AL.3.6.1–3, AL.3.7 and AL.3.9.2,4. The shifted-pole and pole-removed-strip statements match; no tempered finite-place hypothesis substituted. |
| AnalyticNumberTheoryPartI | Main §§1.3,1.8. Both gamma slope sums and the singular-part subtraction are required. The common κ division preserves them. |
| SmallRamificationAndAbelianVarietyBaseCases | §§1.5–1.7. Half-line integral4/π² gives whole-line8/π²; strip variable is s, transported to ξ with factor2π. |
| AutomorphicSpectralTheory | §§4.4,4.5,4.10,6.9,6.17,6.19,6.20. Residual spectrum retained. §6.20 explicitly supplies the component-index factor when using connected centralizers; §4.1 must be read as grouping that whole supplied summand. |
| ModularityAndLanglandsExtensions | §§3.4,3.8,3.15,3.17,3.20–3.22 and standing classification premises. §3.21 includes the regular character; §3.22 includes scalar occurrence but explicitly separates the character, S02. |
| AutomorphicBundles | §§11.1,11.2,11.9,11.16,12.10,12.11,12.13,12.15. Characteristic-zero vector coefficients and non-neat descent are available; negative determinant weights are algebraic. |
| MetaplecticAutomorphicForms | §§0.15,2.4c,3.1,3.4,3.5,3.7,3.10,3.21,5.1,5.6,6.14. Its global nonvanishing statement does not itself assert the particular Böcherer formula; that formula is correctly a declared gap. |
| SymplecticReidemeisterTorsionModSquares | §4.1, `zassenhaus_primary_formula`, line753: generalized minus-eigenspace formula, associated bilinear form, no determinant-one restriction. The package's later SO simplification is a genuine specialization. |
| GeometryOfNumbersAndQuadraticArithmetic | §2.4.2, lines593–595 of the supplied head: nondyadic unimodular stabilizer image, rank≥2. Rank1 SO is trivial; dyadic input separately declared. |
| OrthogonalTamagawaAndLatticeMass | §§3.1,4.1,4.2, lines457,508,534: masses and completeness/classification, not constructions. Rootless uniqueness is a consequence supplied here; the actual Leech lattice comes from the pin. |
| ComputationalNumberTheory | §§4.1–4.7,4.17,4.17a,4.18,4.26,4.29–4.34,5.1. Its slots1 and4 equal8ℓ/π² (zero-based indexing); §4.34 uses t/m, not t/√m. This roadmap identifies those numerical expressions with its intrinsic functionals and proves the cone converse. |
| IntegralLattices and companion main roadmaps | Completed lattice carrier; active §4G neighbour relation; Rank24LatticeConstructions Layer6; ThetaSeries Layers1,5,8; Completed AlgebraicCodingTheory Layer5; SporadicOrders Layer1; OrthogonalSpinGroups Layer1. Construction A's rooted lattice is not confused with Leech. |
| CFSGBasicProperties | Main P2-L, lines530 onward: code-action comparison, coordinate/norm bridge, Conway generators and order. The average characteristic polynomial is additional and declared as a gap. |
| RepresentationTheory and ReductiveGroups | LieHighestWeight Layer6, ClassicalGroups Layers3–5, ReductiveGroups Layer9. Classical character machinery is imported; identification with regular orthogonal integral models at2 is an additional declared gap. |

The eight named gap slugs agree exactly between README and `design/plan.json`; each has a named supplier, section and a single mathematical interface with its necessary normalization. They are accepted as future contracts, not reported for being unimplemented. None is supplied by the presently read pin at the requested scope. In particular the dyadic gap does not duplicate the nondyadic theorem, and the real module/adelization gaps are Sp statements rather than a second GL₂ adelization.

The closest-open ownership comparison is also consistent: `SiegelModularForms/README.md:125–136` imports this roadmap's §§6.4,6.7 and its level-one boundary results, then treats broader levels on its analytic carrier. The pointer remaining in §6.2 preserves its spanning citation after the repair. `Rank24LatticeConstructions/README.md:15–19` expressly excludes classification and harmonic theta series; `ThetaSeries/README.md:54–75` owns genus-one series and Poisson summation. OrthogonalTamagawaAndLatticeMass owns lattice-class completeness, not automorphic torsion masses. AutomorphicLFunctionsAndLocalFactorsPartII treats doubling integrals, classical standard factors and period comparisons, not these level-one classification/exterior-invariant targets.

The overlap with content submission #2285 is real: its README is the older package text, including the superseded orbit-sum check and scalar source numbering. It is not a second copy already on main. The worker must update that existing submission from this package before merging it; the old submission and repaired package must not be merged independently. No cited ID is reported dropped or defined only by an open revision. No duplicate fully qualified Lean declaration was found outside that older submission of the same roadmap.

The required dependency check was run read-only. Exact output:

```text
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The proposed S02 supplier already precedes this roadmap. `git diff --name-only origin/main...HEAD` lists eleven files, all under this package: README, Suggested, plan, sources and seven repair reports. No package-source file was edited during this review.

### Source-locator audit

Directly checked 49 locator groups below against seven legal cached texts. A group may contain consecutive equations or statements sharing one argument; this is not a claim of 49 independently proved theorems. KT87 remains the settled uncertified eighth source. Version notes correctly distinguish CT20's HAL numbering, CL14 v2, CT19a v1 and the vdG08 preprint pagination.

| # | Locator checked | Source witness | Outcome |
|---|---|---|---|
| 1 | CT20 §§1.2,2.1, algebraicity/purity | CT20 line554 | Restriction to ℂ×, weights, positive-real triviality. |
| 2 | CT20 §2.2, type | CT20 line601 | Regular/simple-weight type usage. |
| 3 | CT20 (1.4.3)–(1.4.5) | CT20 line401 | Full-centralizer mass convention and geometric grouping. |
| 4 | CT20 Theorems6–7 | CT20 line515 | Values referred to external data, not printed. |
| 5 | CT20 (2.3.1)–(2.3.5) | CT20 line633 | Gamma, prime and zero terms; factor1/2. |
| 6 | CT20 Proposition2.2 | CT20 line676 | POS and nonnegative coefficients. |
| 7 | CT20 Corollary2.3 | CT20 line705 | Distinct-class multiplicity and1/m. |
| 8 | CT20 Proposition2.5 | CT20 line782 | Nonempty principal faces. |
| 9 | CT20 Lemma2.6 | CT20 line789 | Local minimum implies least eigenvalue. |
| 10 | CT20 Example2.7 | CT20 line800 | b<0 and b²>ac, not determinant alone. |
| 11 | CT20 Lemma2.8 | CT20 line806 | Negative minimum and positive pole scalar. |
| 12 | CT20 Corollary2.9 | CT20 line830 | Source's equality of minima is false; package keeps only sign equivalence. |
| 13 | CT20 Remark2.10 | CT20 line848 | Cone-only flag monotonicity. |
| 14 | CT20 Proposition3.7 | CT20 line1245 | Regular quadratic forms and all-prime square obstruction. |
| 15 | CT20 §3.3, Table4/refinement | CT20 line1317 | Row/column counts, including corrected1158. |
| 16 | CT20 Remark3.10 | CT20 line1369 | Six zeros each in SO₁₃,SO₁₇; no Sp₁₆ assertion. |
| 17 | CT20 Proposition4.1 | CT20 line1424 | Exceptional dual pair versus181 singleton alternatives. |
| 18 | CT20 Lemma4.3 | CT20 line1519 | Regular self-dual weight24, rank≥13. |
| 19 | CT20 Proposition4.4 | CT20 line1557 | G-function scalar formulas and pole transform. |
| 20 | CT20 §4.3, Theorem4 proof | CT20 line1577 | GRH needed; one retained parameter. |
| 21 | CT20 §5.1 | CT20 line1610 | Distinct (π,d) pairs, not distinct π alone. |
| 22 | CT20 §5.2, lowest-weight modules | CT20 line1700 | Unitarity and discrete-series range; regularity converse corrected. |
| 23 | CT20 §5.2.1,(5.2.1) | CT20 line1734 | Odd block length1 criterion and regular packet character. |
| 24 | CT20 §5.2.2,(5.2.2)–(5.2.10) | CT20 line1773 | Uses additional MR18.3 character theorem, S02. |
| 25 | CT20 Remark5.3 | CT20 line1860 | H2 regularity and lower-weight endpoint. |
| 26 | CT20 §5.3.1 | CT20 line1962 | Regular enumeration and rejection signs. |
| 27 | CT20 §5.3.2, caseH1 | CT20 line2017 | k13,g14 sign mismatch and the trivial distinguished block. |
| 28 | CT20 Proposition5.14 | CT20 line2292 | Stable dimensions and divisibility4. |
| 29 | CT20 Corollary5.15 | CT20 line2326 | Siegel operator and theta isomorphism at equality g=2k. |
| 30 | CT20 Tables5–6 | CT20 line2343 | Positive-genus scalar/nonscalar parameter counts and the stated examples. |
| 31 | CT19a formula(1) | CT19a line26 | Five exterior-invariant dimensions, including g0. |
| 32 | CT19a Theorem2 | CT19a line105 | Coefficient ±n_g e_g and embedding stabilizers. |
| 33 | CT19a Proposition1.4 | CT19a line283 | Monomial sign changes, not scalar action on every orbit sum. |
| 34 | CT19a Definition1.5 | CT19a line306 | Form normalization and determinant pairing. |
| 35 | CT19a Proposition4.1 | CT19a line1052 | Root-reflection argument; g≥1. |
| 36 | CL14 III§3.1 | CL14 line2402 | Directed rank16 counts18225 and12870. |
| 37 | CL14 III§3.2 | CL14 line2469 | Ratio405/286 and weighted pairing. |
| 38 | CL14 IX Lemma3.15 | CL14 line11624 | Strip positivity via cosh denominator. |
| 39 | CL14 IX Proposition3.17 | CL14 line11662 | F-function scalar identities, including w0. |
| 40 | CL14 IX Proposition3.38 | CL14 line12315 | Central order for the full weight≤22 range. |
| 41 | CL14 TheoremF | CL14 line654 | Eleven classes and no rank restriction. |
| 42 | CL14 TheoremE | CL14 line559 | Rank24 standard parameters, including long trivial segments. |
| 43 | Tai17 §3.3.4, Theorem3.3.4 | Tai17 line2038 | Levi recursion, volume-one finite levels, trivial-group value1. |
| 44 | Tai17 Theorem4.2.3/Corollary4.2.4 | Tai17 line3105 | Regular infinitesimal character and even-SO outer averaging. |
| 45 | Mil02 Theorem1.6 | Mil02 line137 | 1<N<27 constant-coefficient cuspidal cohomology. |
| 46 | vdG08 Theorem9.1 | vdG08 line858 | Genus2 ring and dimensions in weights11,20. |
| 47 | vdG08 §5, Siegel operator | vdG08 line505 | Vector coefficient restriction, scalar specialization. |
| 48 | BoechererNote criterion | BoechererNote line14 | The five specialized parameters and the normalized ratio. |
| 49 | BoechererNote orders | BoechererNote line57 | The five total orders are zero; checked from the package's factor rules. |

The largest source share is CT20: 119 of 178 source-key occurrences before the References heading (each occurrence counted once, including repeated locators). Its contents at CT20 lines54–80 were compared with all eight layers. The correspondence is not a run through its contents: Layers1–2 use source §§1–2, Layer3 moves §5 packet theory ahead of geometric §3, Layer4 uses §3, Layer5 §4, Layer6 draws on CL14 and boundary/theta suppliers, and Layers7–8 combine §5 with CT19a. The dependency lines force packet/triangular recovery before the mass systems (§3.16→§4.11), coarse masses before the known classes (§4.13→§4.14), and first occurrence before singular cusp exclusions (§6.8→§7.6). No section is named after a source chapter.

For wording, the locator comparisons were supplemented by six distinct prose passages: §2.15's compression explanation against CT20 lines830–847; §3.9's sign explanation against CT20 lines1795–1836; §6.3's pairing check against CL14 lines2402–2470; §6.11's proof plan against CL14 lines12315–12340; the root-span theorem docstring against CT19a lines1052–1058; and §8.14's boundary argument against CT20 lines2331–2338. Shared formulas, mathematical names and forced hypotheses were separated from prose. No additional copied passage or clause-by-clause translation was identified. The repaired order rules and index-count formulas state the needed facts in a new form; the full source mass tables are not reproduced.

## Not verifiable

- KT87 Theorems1.1–1.3 remains uncertified as instructed. The low-rank character witnesses were computed, but the general determinant character formulas were not certified against that paywalled text. No renewed request is made.
- The thousands of interval certificates, ellipsoid-cover records and large full-column-rank matrices behind §§4.13–4.17 and §§5.2–5.10 were not recomputed. The report checks the published assertions, prerequisites, dimensions and small controls; it does not certify external data or numerical implementations. The inconsistent cover cardinalities in CT20's proof cannot be resolved from its printed text alone.
- The scalar packet-character input cannot be certified as supplied until S02's contract is declared. The existing eight gaps are accepted as contracts, not claimed implemented or proved by this audit.
- No Lean build or fresh elaboration was run. Binder checking uses the supplied eight elaborated signatures and the actual source at the pin. The source-locator ledger is explicit about the 49 groups directly checked; it is not a claim to have reproduced every proof in the cited monographs.

## Source issues

The following refer to the versions recorded in `sources.toml`, with printed manuscript page numbers for CT20 and CL14. They are source errata, not additional package findings.

- **Misprint** in CT20 at §1.4, SO₃ example, p.11, line468: the source says the character denominator is sin(2π/i); it should be sin(π/i), giving trace1 for k0,i4 rather than √2/2; affects a stated result.
- **Misprint** in CT20 at (2.4.5), p.18, line767: the source says the archimedean term repeats the first parameter in its two slots; it should be evaluated on the first and second parameters; affects the proof.
- **Error** in CT20 at Corollary2.9 and its preceding compression, p.20, lines830–847: the source says the square-root lift preserves the displayed form and negative minima coincide; it should use the reciprocal-multiplicity lift and assert equivalence of negativity, not equality of minima; affects a stated result.
- **Error** in CT20 at §2.4.7, p.25, lines1040–1042: the source says the elliptic comparison set has size1 at every nonzero weight through53; it should retain dim S_(w+1), which is2 at w23 and4 at w53; affects the proof.
- **Misprint** in CT20 at Table2 and §3.3, pp.28,33, lines1349,1358: the source says the degree14 symplectic negation-orbit count is1157; it should be1158, since (2257+59)/2=1158; affects a stated result.
- **Misprint** in CT20 at §3.3 footnote13, p.33, line1373: the source says the two-dimensional elliptic cusp space has weight23; it should have weight24; affects nothing.
- **Error** in CT20 at Proposition4.1 proof, p.36, lines1469–1470: the source says every other infinity-type fibre has at most one class; it should bound additional classes outside the known set, retaining the two known I₂₃ classes; affects the proof.
- **Misprint** in CT20 at Proposition4.1 proof, p.36, line1478: the source says the one-class cutoff uses the transform at i/π; it should use i/(4π), as in Corollary2.3; affects the proof.
- **Misprint** in CT20 at Proposition4.1 proof, p.36, lines1484–1491: the source says the187 residuals belong to the two-class cover; it should say the one-class cover U₁; affects the proof.
- **Gap** in CT20 at Proposition4.1 proof, p.36, lines1479,1485: the source says the cover has12230 elements, then subtracts187 from12293; it should give one certified cover cardinal consistently and the corresponding certificate count; affects the proof.
- **Error** in CT20 at Theorem4 proof, pp.38–39, line1579: the source says the exceptional dual pair uses self-duality flag2; it should use flag0 and multiplicity2; affects the proof.
- **Error** in CT20 at Theorem5 proof, p.38, line1546: the source says symplectic masses only through Sp₈ suffice for all rank≤16 counts; it should include Sp₁₀, Sp₁₂ and Sp₁₄ for odd dual dimensions11,13,15; affects the proof.
- **Error** in CT20 at §5.2, p.42, line1722: the source says the infinitesimal weights are distinct exactly when k_g>g; it should give that implication only, since g1,k0 has distinct weights0,±1; affects a stated result.
- **Misprint** in CT20 at Remark5.3, p.45, lines1862–1863: the source says k≥2 and then excludes k=2; it should state k≥3, equivalently k′≥2 in H2; affects nothing.
- **Misprint** in CT20 at §5.3.2, Rallis parameter relation, p.50, line2090: the source says the added segment depends on first occurrence g₀ for every genus g; it should depend on g, as Lemma5.7 does: n8,g8 gives an added segment of length9; affects a stated result.
- **Misprint** in CL14 at IX, discussion after Proposition3.39, p.324, line12371: the source says a parameter containing I₂₃ and one further I has dimension2; it should have dimension4; affects a stated result.

Source independence: 55 passages compared with 7 sources; no additional copied prose identified; largest share CT20, 119 of 178 source-key occurrences; contents compared with CT20: independent. KT87 wording was not testable, as its text remains uncertified.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c038ca8155d5847b20e97f42a9e001abd542d86d", "job": "RT-LevelOneAutomorphicFormsForClassicalGroups~2a", "model": "gpt-6-astra", "worker": "chris-33"} -->
