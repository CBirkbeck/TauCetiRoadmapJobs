<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15109#issuecomment-6882167782 -->
Review (codex) of 65b46d1

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) No 1-cells does not mean dimension zero

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:1118`: “a path-connected CW complex without `1`-cells is a point.”

   **Claim:** The justification of `gd G = 0 ↔ G = 1` asserts that absence of 1-cells alone forces a path-connected CW complex to be a point. It needs absence of every positive-dimensional cell.

   **Witness:** The standard CW structure on S² has cell counts `(1, 0, 1)` in degrees `(0, 1, 2)`. It is path-connected, has no 1-cells, and has `H₂(S², ℤ) = ℤ`; a point has `H₂ = 0`.

   **Exact repair:** Replace the whole bullet by: “`gd G = 0` exactly when `G` is trivial: a nonempty path-connected zero-dimensional CW complex has exactly one 0-cell, and the point is a `K(1, 1)`.” Add a Check distinguishing absence of 1-cells from dimension zero using S², and mirror that Check in plan target 5.1. Keep the existing, correct `eq_zero_iff` API statement in the plan.

   **Retest:** The point has counts `(1, 0, 0, …)` and gives `gd 1 = 0`. S² has a 2-cell and is excluded from the repaired premise. A two-point zero-dimensional complex fails path-connectedness. Thus neither countermodel satisfies the repaired premise. This is a missing hypothesis in the explanatory assertion, not a request to weaken the headline theorem.

One P2 finding: the explanation of geometric dimension zero drops the hypothesis excluding higher-dimensional cells. The headline theorem itself is correct. All five findings from round 6 are repaired. This is a design review: no `Suggested.lean` exists; elaboration is **not available (this lane does not elaborate)**. No claim of a successful Lean build is made.

## Verified sound

The review read all nine layers, all 51 plan targets and their 159 tests, the conventions, contracts and consumer statements. It compared the README with the plan, checked the five previous repairs first, and recomputed the sampled targets and the sections the earlier report had summarized without supplying its own computed rows. No reliance was placed on the unavailable round-5 table. The compact table below records one row per target, including all 15 seeded targets, all headline targets and the new finding.

No maintainer notes were supplied. The review found no second copy on main, route-specific restriction, computational algorithm, new supplier cycle, copied source passage, or duplicate ownership requiring a change. The intended arbitrary commutative coefficient ring is preserved; integral-only results are identified. The zero ring is handled separately, and the natural-number subtraction in duality is guarded by `k ≤ n`.

### Previous findings, in order

Locations below are in `packages/FinitenessAndDualityOfGroups/design/README.md` unless the plan is named.

| Previous finding | Repaired passage, quoted | Independent retest | Status |
|---|---|---|---|
| F01: coefficient qualifiers in 6.6 | 1459: “over every nonzero `R`”; 1465: “over `ℤ` (indeed over every nonzero `R`, 6.4)” | For `G = 1`, `H⁰ = R`, `H₂ = 0`; dimension two fails when `R ≠ 0`. For `F₂/ℤ`, `H¹ = ℤ²`, whereas twisted rank-one coinvariants are `ℤ` or `ℤ/2`. Over `0` every group involved is zero. Both corresponding plan tests agree. | repaired |
| F02: non-directed union test | plan target 2.5, test `Z2_cyclic_subgroups`: “each of hd_ℤ ≤ 1, while hd_ℤ ℤ² = 2” | `sup_v hd_ℤ⟨v⟩ = 1`, but `H₂(ℤ², ℤ) = ℤ` and `hd = 2`. Independent coordinate axes have no cyclic upper bound. The README already uses this test. | repaired |
| F03: action on the kernel's dualizing module | 1411: “`(g·f)(p) = g f(g⁻¹p) g⁻¹`” | For `g ∈ N`, N-linearity reduces this to `f(p)g⁻¹`. For the Klein bottle, `(t·d)(a) = −a`, of augmentation `−1`, so `w(t) = −1` and `H²(K, ℤ) = ℤ/2`. The plan agrees. | repaired |
| F04: localized Swan theorem | 1571: “`ℤ_(p) ⊗ P ≅ (ℤ_(p) G)^m`” | Brown1974 line 1315 is the localization form. A lift of the mod-p isomorphism has finitely generated cokernel with zero reduction; Nakayama kills it. Projectivity then splits off the kernel, whose reduction is zero too. For `P = ℤG`, each form has rank one. | repaired |
| F05: consumer locator and asserted dependency | 2083: “MotivicStructuresInModuliOfCurves §2.1”; 2085: “can cite them” | `packages/MotivicStructuresInModuliOfCurves/README.md:337` has that section; its Needs at 341 does not cite this roadmap. The new wording asserts an instance, not an existing edge. The plan agrees. | repaired |

The extra changed PosetHomotopyAndSubgroupComplexes sentence also agrees with its open head, PR #2296, `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:100`: the relevant Brown theorem is outside its scope. The repair report marks no finding “not actionable”.

Pattern searches covered the remaining negative coefficient claims, directed-union examples, right/left actions, occurrences of localization/completion, and downstream dependency assertions. In particular, 1.4, 1.6 and 1.7 keep their nonzero-ring qualifiers; 7.5's Nakayama step is applied over the commutative local coefficient ring. The new conjugation formula respects N-linearity and composition: `(g·f)(yp) = y(g·f)(p)` and `g·(h·f) = (gh)·f`. No additional occurrence of those five repaired defects was found.

### Adversarial mathematics

Write `C_m` for the cyclic group of order m, `F_r` for the free group of rank r, and `K` for the Klein bottle group. “Retain” means these computations do not require a change; it does not certify an unread source.

| Statement | Instances tried and values computed on both sides | Result / change |
|---|---|---|
| 1.1 module colimit criterion | `A = k[x₁,x₂,…]`, `M = k`: `colim Hom_A(k,A/(x₁,…,x_i)) = 0`, while `Hom_A(k,k) = k`; degree-zero comparison injective, not onto. For `M = ℚ` and the system `ℚ/(1/i!)ℤ`, projection classes in the Hom colimit stay nonzero although the target colimit is zero. For `M = 0`, both sides are zero in every degree. | retain; separates finite generation from finite presentation |
| 1.2 finiteness types | `1` has free ranks `(1)`; `ℤ` has `(1,1)` with differential `t−1`. Over `0`, all terms are zero and FL holds. `C₂/ℤ` has `H^{2i} = ℤ/2` for `i ≥ 1`, hence FP∞ but not FP. Over `ℚ`, the trivial module is projective of dimension one; a finite free `ℚC₂` resolution would have even alternating dimension, so it is not FL. | retain |
| 1.3 base change | For `ℤ→𝔽₂`, the resolution of `ℤ` remains `0→𝔽₂[t±¹]→(t−1)𝔽₂[t±¹]→𝔽₂→0`. For `C₂`, FP is false over ℤ and true over ℚ; descent is not asserted. Base change to zero gives zero complexes. | retain |
| 1.4 low degrees | `F₂` has resolution ranks `(1,2)`; its normal subgroup `ker(F(a,b)→ℤ)` has abelianization `⊕_ℤ ℤ` and fails FP₁ for `R ≠ 0`. Over zero, both groups are FL. | retain |
| 1.5 finiteness criterion, headline | `G = ℚ`, `R ≠ 0`, `n = 1`: each `R[ℚ/(1/i!)ℤ]^ℚ = 0`, but colimit invariants are R, so comparison is `0→R`. In the product test, `(1−[1/j!])_j` maps to zero but cannot be generated by a single finite set of augmentation differences. At `n = 0`, invariants comparison is injective and product-coinvariants comparison onto. At `R = 0`, both maps are `0→0`. | retain |
| 1.6 finite index | `ℤ≤C₂×ℤ`, index two: FP∞ true for both over ℤ; FP true only for ℤ. Over ℚ both have finite projective dimension one. Infinite-index normal closure in F₂ has FP₁ false against FL true upstairs. `H = G` gives identical types. | retain |
| 1.7 extensions and products | `ℤ²` has ranks `(1,2,1)` from tensoring `(1,1)`. Lamplighter group is generated by `(δ₀,t)`, quotient ℤ is FL, base `⊕_ℤ C₂` is not finitely generated: FP₁ true upstairs and false on the kernel for nonzero R. Over zero all are FL. | retain |
| 1.8 tree splittings | `C₄*_{C₂}C₆`: all vertex and edge groups FP∞, hence amalgam FP∞. `n = 0`: `n−1 = 0`; `n = ⊤`: `n−1 = ⊤`. Free ranks 0 and 2 give resolution ranks `(1,0)` and `(1,2)`. `BS(1,2)` has a length-two free resolution by the tree construction. | retain |
| 2.1 dimensions | `1`: `(cd,hd)=(0,0)`; `ℤ/R≠0`: `(1,1)`, detected by `H¹=H₁=R`; `C₂/ℤ`: `(⊤,⊤)`. Over zero every dimension is zero. | retain |
| 2.2 dimension comparison and FP | `ℤ²/R≠0`: `H²(G,RG)=R`, other group-ring cohomology zero, `cd=hd=2`. `G=ℚ, R=ℤ`: `hd=1<cd=2`, excluding FP. `C₂/ℤ`: positive cohomology of `ℤC₂` vanishes but `cd=⊤`, so finite cd is essential. | retain |
| 2.3 subgroups | `2ℤ≤ℤ`: `1=1`; `ℤ≤C₂×ℤ`: `1<⊤` over ℤ, `1=1` over ℚ because index two is invertible. Over zero the equality is `0=0`. | retain |
| 2.4 extensions | `ℤ²`: `2≤1+1=2`; `K/𝔽₂`: HNN comparison is `1−(−1)=0`, so `H²=𝔽₂` and `cd=2≤2`. `C₂×ℤ/ℤ`: upper bound `⊤+1=⊤`. | retain |
| 2.5 directed unions | `ℚ=⋃(1/i!)ℤ`: `sup hd=1=hd ℚ`; telescope gives `cd≤2`, and `Ext¹_ℤ(ℚ,ℤ)≠0` gives `cd=2`. For union of cyclic subgroups of `ℤ²`, `sup hd=1<2`; the family is not directed. | retain |
| 2.6 free and amalgam dimensions | `F₂/R≠0`: `cd=hd=1`. `C₄*_{C₂}C₆/ℚ`: bound `max(0,0,1)=1`, attained. `BS(1,2)` bound is 2 over nonzero R; over zero the bound is 1 and actual cd is 0. | retain |
| 2.7 torsion dichotomy | `C₂/ℤ[1/2]`: averaging gives cd 0. `C₂/(ℤ/6)`: `H²=(ℤ/6)/2(ℤ/6)=ℤ/2`, hence cd ⊤ although `2≠0`. `C₆/ℤ[1/2]`: prime 3 gives cd ⊤. Over zero, even infinite ℤ has cd 0, excluding the converse without nontriviality. | retain |
| 2.8 continuous/discrete bound | Discrete `ℤⁿ`: `Hⁿ(ℤⁿ,ℤ/p)=ℤ/p`, both dimensions n. `C₂`: both ⊤ using 2-primary coefficients. `1`: both zero. | retain |
| 3.1 signed tensor induction | `H=1`, `G=C₂`, `F=(Rx→Ry)`, `dx=y`: `d(x⊗x)=y⊗x−x⊗y`. Signed swap gives `ds=sd`; unsigned swap gives difference `2(y⊗x−x⊗y)`, nonzero over ℤ and zero over 𝔽₂. Total length is `2=2·1`. An equivariant contraction requires `2k=1`, unlike the R-linear contraction. | retain |
| 3.2 Serre, headline | `ℤ²≤K`, index two: `cd=2=2`. `dℤ≤ℤ`: `1=1`. `ℤ≤C₂×ℤ`: `1≠⊤`, excluded by torsion. `cd H=0` with G torsion-free forces `H=1`, G finite and hence G=1, giving `0=0`. | retain |
| 4.1 virtual dimension | Finite G: `vcd=0`, using H=1; `C₂×ℤⁿ`: `vcd=n` against integral cd ⊤. `C₄*_{C₂}C₆→C₁₂` is onto and injective on factors; free kernel has index 12 and cd 1. `⊕_ℕ C₂`: no torsion-free finite-index subgroup, value ⊤. | retain |
| 4.2 virtual inheritance | `C₂≤C₂×ℤ`: `0≤1`; index-two ℤ: `1=1`. Extension `C₂×ℤ`: `1≤0+1`; `2ℤ◁ℤ`: `1≤1+0`. If either factor's vcd is ⊤ the extension bound has right side ⊤. | retain |
| 4.3 rational vanishing | `C₂×ℤ`: `cd_ℚ=1=vcd`; over 𝔽₂, the split projection to C₂ gives nonzero cohomology in every degree, so `cd=⊤>1`. Finite G over ℚ gives `0=0`. | retain |
| 4.4 virtual types and homological type | Finite G has trivial finite-index subgroup, FL and total integral homology ℤ. The index-12 free subgroup of the amalgam has `H₀=ℤ,H₁=ℤ²,H_{≥2}=0`. `ℚ` and `C₂×ℚ` have vcd 2 but their torsion-free finite-index ℚ has `H₁=ℚ`, not finitely generated. | retain |
| 5.1 geometric dimension | Point: `gd1=0`; rose of rank two: `gdF₂=1`; torus: `gdℤ²=2`; `C₂`: gd ⊤. But S² has zero 1-cells and `H₂=ℤ`, against the asserted point's `H₂=0`. Two points have dimension zero but fail path-connectedness. | R01: add the missing dimension-zero hypothesis |
| 5.2 cellular bounds | Torus cell ranks `(1,2,1)` give `cd_Rℤ²≤2`, equality for nonzero R and value zero over 0. Point gives `0≤0`. For nontrivial finite groups integral cd and gd are both ⊤. A finite presentation supplies the low-dimensional cells after adjoining higher cells to obtain K(G,1). | retain |
| 5.3 Eilenberg–Ganea, headline | `G=1,ℤ²,ℤ³`: `gd=0,2,3≤max(3,cd)=3`. `C₂`: `⊤≤⊤`. At n=3, the 2-skeleton preserves π₁, its cover is simply connected, and attaching 3-cells along a basis of H₂ kills H₂ without changing π₁. | retain |
| 5.4 proper acyclic actions | Finite G, Γ=1, W=point: Z=point, stabilizer order `|G|=[G:Γ]`. For `C₂×ℤ`, Z is line×line, dimension `2=2·1`; stabilizers C₂ on diagonal, trivial elsewhere. `ℤ^(ℕ)` contains every ℤⁿ, so cd is ⊤ and cannot admit such a finite-length free resolution. | retain, conditional on declared gap |
| 6.1 duality definition | `ℤ`, `e=[t]`: `H¹→H₀` sends x to x(t); `2[t]` gives multiplication by 2 over ℤ and fails. Finite G with invertible order: `M^G→M_G` has averaging inverse. Zero ring: every map is `0→0`, allowing every n as explicitly stated. | retain |
| 6.2 consequences | `ℤ`: `D=R[t±¹]/(t−1)=R`, flat, cd=hd=1. For `F₂`, dual differential `a↦((s−1)a,(t−1)a)` is right-linear; its image contains `((s−1)t,(t−1)t)`, whereas the reversed-factor model does not. Over a field D has infinite dimension; for finite G with invertible order D has rank one in degree zero. | retain |
| 6.3 criterion, headline | `ℤⁿ`: group-ring cohomology `R` in degree n and zero elsewhere, with R flat. `ℤ*ℤ²/ℤ`: cd 2 but `H¹` contains `ℤG≠0`, so criterion fails. `C₂/ℤ`: FP fails. Over 0, both sides hold with D=0 for every n. | retain |
| 6.4 Poincaré duality | `ℤⁿ`: orientation 1, D=R. Klein bottle over ℤ: `w(t)=−1`, `H²=ℤ/2`; trivial orientation would give ℤ. Over 𝔽₂, `−1=1`. `F₂/ℤ`: `H¹=ℤ²` cannot equal rank-one twisted coinvariants. Zero ring has free rank-one module 0 and every dimension. | retain |
| 6.5 inheritance | `dℤ≤ℤ`: transfer sends the top generator to the generator, not d times it. `1≤C₂/ℚ`: H₀ transfer is multiplication by 2, an isomorphism. Klein extension: `(t·d)(a)=−a`, augmentation −1; `N=G` gives `D_{G/N}=R` and the existing action on D_N. | retain; F03 repaired |
| 6.6 manifolds | Torus gives D=R, dimension n. Sphere π₁=1 has `H⁰=R→H₂=0`, not bijective for nonzero R; over 0 both vanish. Doubled-point circle has π₁=F₂ and `H¹(F₂,ℤ)=ℤ²`, inconsistent with PD₁'s coinvariants `ℤ` or `ℤ/2`. | retain; F01 repaired |
| 7.1 Hattori–Stallings rank | `P=RG`: identity coefficient 1, others 0. Trivial module over `ℚS₃`: values on identity/transpositions/3-cycles are `(1/6,1/2,1/3)`, sum 1. Restriction of `RG` to 1 has rank `|G|=|G|·1`. Over 0 all values vanish. | retain |
| 7.2 projective character | Regular ℚS₃: traces `(6,0,0)`. The averaging summand has trace 1, equal to centralizer orders `(6,2,3)` times `(1/6,1/2,1/3)`. For the C₃-character ω, inverse-class formula gives `3·ω/3=ω`; forward class gives wrong `ω⁻¹`. Over `ℚ×ℚ`, projective summand `(1,0)` has projective trace `(1,0)`, versus native free-basis trace 0. | retain |
| 7.3 rational Swan | `P=(ℤG)²`: `rank_ℤP=2|G|`, both formulas give m=2. `P=0`: m=0. Trivial ℤ over C₂ is not projective, has character 1 at the involution and rational dimension 1 rather than an even free dimension. | retain |
| 7.4 local/mod-p Swan | `P=ℤG`: rank one over `ℤ_(p)G`, `ℤ_pG` and `𝔽_pG`, including p=2 dividing order. `P=0`: all ranks zero. Trivial ℤ over C_p has coefficient rank 1 versus the free rank multiple p and is excluded by projectivity. Nakayama gives kernel=cokernel=0 for the lifted isomorphism. | retain; F04 repaired |
| 7.5 Hom from projectives | `Γ` finite, Γ′=1, `P=ℤΓ,V=K`: `Hom_ℤ(ℤΓ,K)=K^Γ`, regular rank 1. `Γ=ℤ`, Γ′=Γ, `P=ℤΓ,V=K_λ`: Hom dimension 1 for every λ. Replacing P by nonprojective trivial ℤ and λ≠1 gives dimension `0≠1`. | retain |
| 8.1 Wall finiteness | Infinite-free contractible pair `(F→id F)` has homology zero and replacement D=0. Over `k[x₁,…]`, a resolution of k has H₀=k finitely generated but k not finitely presented, so no finite-free degree-zero/one replacement exists; noetherianity excludes it. For bounded D, projection `D_i→D_i/B_i` at i>n forces `H_i=0` and splits `B_{i−1}`. | retain |
| 8.2 finite group complexes | C=ℤC₂ in degree zero: `χ(C)=2=2χ(C_G)` and involution trace 0. Trivial ℤ gives `1≠2·1` and is not projective. Two-cell free rotation of circle gives `χ=2−2=0=2·0`. | retain |
| 8.3 Euler conventions | `1`: both invariants 1; `ℤ`: `1−1=0`; `F₂`: `1−2=−1`; `ℤ²`: `1−2+1=0`. `C₂`: `χ_ℚ=1`, `χ=1/2`, no χ̃. `ℚ`: rational homology dimensions `(1,1)`, so χ_ℚ=0 despite failure of FP₁. | retain |
| 8.4 Euler characteristic, headline | For `1≤C₂`, `1=2·(1/2)` and denominator 2 is nonzero. For free index-12 kernel of `C₄*_{C₂}C₆`, `χ_ℚ=1−2=−1`, so `χ=−1/12`. Taking further index d multiplies numerator and denominator by d, preserving the quotient. | retain |
| 8.5 twists | ℤ with one-dimensional λ≠1: cochain map `λ−1` invertible, H⁰=H¹=0. With λ=1 dimensions `(1,1)`, sum 0 again. `F₂/K`: dimensions `(1,2)`, sum −1 over every field, including 𝔽₂ and 𝔽₃. `C₂/ℚ`: `1≠1/2`, excluded by integral FP. | retain |
| 8.6 extensions, headline | `F₂×F₃`: E₂ dimensions `(1,3;2,6)`, total dimensions `(1,5,6)`, Euler `2=(−1)(−2)`. `C₂×ℤ`: `0=(1/2)·0`. Klein bottle: `0=0·0`. The selected subgroup's image must lie in a torsion-free finite-index quotient subgroup; arbitrary torsion-free subgroups need not have torsion-free images. | retain |
| 8.7 equivariant Euler, headline | Amalgam: `1/4+1/6−1/2=−1/12`, versus wrong edge sign `11/12`. `C₂*C₃`: `1/2+1/3−1=−1/6`. Rank-r free group: `1−r`; `BS(1,2)`: `0−0=0`. Sign twist ε: `χ(ker ε)−χ(T)=2χ(T)−χ(T)=χ(T)` when ε is nontrivial. | retain |
| 8.8 Smith/Floyd | Reflected four-vertex circle: `(χX,χX^G,χX/G)=(0,2,1)`, hence `0+1·2=2·1`; free rotation gives `0+0=2·0`. Point with C₃: `1+2·1=3·1`. Empty set gives `0=0`. Infinite-dimensional free E(C₂) has χ=1, refuting divisibility without the dimension bound. Δ[0] has unnormalized `d₁=0,d₂=1`, normalized ranks `(1,0,…)`. | retain |
| 8.9 denominators, headline | Amalgam finite orders `{1,2,3,4,6}` have lcm 12, `12χ=−1`; maximum 6 would give −1/2. C₂*C₃ has `6χ=−1`. Finite G: `mχ=|G|/|G|=1`. If stabilizer order h divides m dividing |Q|, orbit order `|Q|/h=(|Q|/m)(m/h)`, so d divides every orbit size. | retain |
| 9.1 Gorenstein projectivity | `G=C_p,H=1,R=𝔽_p`: all restricted modules are vector spaces, so projective; trivial module has a periodic totally acyclic resolution. `H=G`: projective implies GP. `G=ℤ,H=G,M=R≠0`: pd=1 and `Ext¹_{RG}(R,RG)=R≠0`, so neither projective nor GP. Zero module satisfies both conditions. | retain |
| 9.2 complete resolutions | C₂/ℤ alternating `1−s,1+s`: `(1−s)(1+s)=0`, kernels equal the opposite images, including after Hom into free modules. For G=1, a split contractible completion exists. For finite cd, the high syzygy is projective and the complete resolution contracts. | retain |
| 9.3 Farrell functor | C₂ with ℤ coefficients: Hom differentials alternate 0 and 2, giving `(Ĥ⁻¹,Ĥ⁰,Ĥ¹,Ĥ²)=(0,ℤ/2,0,ℤ/2)`. With ℤC₂ coefficients both alternating kernels equal images and all groups vanish. For ℤ all vanish by the contractible complete resolution. | retain |
| 9.4 comparison, headline | C₂, n=0: `ℤ→ℤ/2` onto with kernel 2ℤ. C₂×ℤ, n=1: both groups ℤ/2 for k≥2. Amalgam, even k≥2: kernel of `ℤ/4⊕ℤ/6→ℤ/2` has order 12 and generator (1,1); odd groups zero. Finite cd case gives zero Farrell groups for every coefficient. | retain |
| 9.5 Tate comparison | C₂/ℤ: both sides `(ℤ/2,0,ℤ/2,0)` at degrees `(0,1,2,−1)`. G=1: both zero. Regular coefficients: norm image equals invariants and augmentation image equals norm kernel, so both sides vanish. | retain |

### Sources: seeded sample

There are no additional author-flagged unverified locators. All eleven cited works have manifest entries. The six available texts were read from the supplied legal cache; no source was fetched and the manifest was unchanged. The five uncertified works were not requested again. Generalizations from integral sources to arbitrary R are justified by the roadmap's explicit routes, rather than attributed to a source at broader generality than it states.

| Seeded target | Text and locator examined | Result |
|---|---|---|
| 1.2 | BieriEckmann1973 §4.1, p.116, line 540; BieriEckmann1974 §3.3, p.81, line 286; Brown1974 §3, p.236, line 345; Serre1971Bourbaki 1.2, p.338, line 55 | Integral FP/FF/FL terminology supported. The roadmap distinguishes FP∞ from finite projective dimension. Brown OCR loses part of the definition; other passages and the pinned IsFPD definition supply the distinction. |
| 1.6 | BrownGTM87 §VIII.5 | Settled uncertified; source not read. Restriction-of-scalars proof checked at the pin. |
| 4.2 | BrownGTM87 §VIII.11 | Settled uncertified; intersections and extension argument checked mathematically. |
| 4.4 | Brown1974 §3 Definition and Proposition 1, pp.237, lines 359–384 | Exactly the stated finite homological type, with every torsion-free finite-index subgroup; virtual FP implication and finite-index invariance supported. |
| 5.2 | Serre1971Bourbaki 1.2, p.338, line 55; Brown1975 §3, p.134, lines 216–231 | Serre supplies the finite cellular-resolution instance; Brown discusses finite-type complexes and chain finiteness. The general arbitrary-R statement follows from the cited cellular-resolution supplier, not from an assertion that Serre treats every ring. BrownGTM87 §VIII.7 unread. |
| 6.2 | BieriEckmann1973 Proposition 1.2, p.106, line 159; Proposition 1.6, p.107, line 210; Lemma 1.3, pp.106–107, line 178; BieriEckmann1974 Proposition 2.1, p.77, line 148; Brown1975 Corollaries 1–2, p.134, lines 205–215 | The integral consequences match. R-flatness is proved using all induced coefficients; it is not confused with torsion-freeness over an arbitrary ring. |
| 6.3 | BieriEckmann1973 Theorem 2.3, p.110, line 317; Theorem 4.5, p.118, line 612 | Finite cd, all free coefficients, top cap-product condition and flatness are retained in the general criterion. The FP criterion is supported over ℤ, with the arbitrary-R route stated. |
| 6.5 | BieriEckmann1973 §1.5, p.108, lines 238–253; Proposition 1.8, p.109, line 269; Theorems 3.2–3.3, p.112, lines 383–399; Theorem 3.5, pp.114–115, lines 468–483 | Finite-index transfer, torsion-free ascent over ℤ, extension theorem and ambient conjugation action match. The new left-action formula is the inverse-convention translation of the source's right action. |
| 8.1 | Brown1974 §1 Lemma, pp.231–232, lines 136–164 | Noetherianity, projective terms, finite homology, test on finitely generated M and projective top quotient all match. The initial free replacement need not stay free at its truncated top. |
| 8.2 | Brown1974 Theorem 1 and Swan theorem, pp.231–232, lines 125–172 | Finite-dimensional chain complex, finite G, projectivity, Euler multiple and nonidentity Lefschetz vanishing all match. |
| 8.4 | Brown1974 Theorem 3 and following definition, pp.237–238, lines 388–424 | Finite cd, normal finite-index subgroup and integral homology finiteness are present; the finite-index denominator is positive. Wall1961 and Serre1971Prospects remain uncertified. |
| 8.5 | Brown1974 Theorem 4 and Corollary 1, pp.238–239, lines 425–451; Appendix A Theorem 7, pp.260–261, lines 1284–1355 | The main-text characteristic-zero qualification is expressly acknowledged; Appendix A supports the extension to every field. |
| 8.9 | Brown1974 §6 Corollary 1 of Theorem 5, p.243, lines 603–614 | Finite homological type, lcm and prime-power reformulation agree; the weaker power-of-m result is attributed separately to Serre. |
| 9.1 | BrownGTM87 §X.2; Farrell1977 | Both settled uncertified. Finite-index induction/coinduction and Ext-orthogonal splice route checked independently. |
| 9.4 | BrownGTM87 §X.3; Farrell1977 | Both settled uncertified. High-tail comparison, boundary surjectivity and universal-coefficient vanishing criterion checked independently. |

Additional source comparisons: 1.1 and 1.5 against Brown1975 lines 78–114 and 189–205; 2.1 and 4.1 against Serre1971Bourbaki lines 40–42 and 77–86; 6.1 against BieriEckmann1973 lines 116–135; 7.3 against Brown1974 lines 168–172; 7.4 against lines 1311–1320; 7.5 against lines 1284–1355; and 8.8 against Floyd1952 Theorems 2.3–2.4, pp.140–142, lines 110–176, facts (3.4)–(3.6), p.144, lines 261–267, and Theorems 4.2/4.4, pp.145–146, lines 292–348. The simplicial-set application uses normalized permutation chains to justify the chain argument, rather than dropping the topological hypotheses of Floyd's topological theorem.

### Pinned library and duplication evidence

The pins read were Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches used objects as well as proposed names: finite projective resolutions, pseudo-coherence, group-ring modules, complete resolutions, projective traces, cellular classifying spaces, directed unions and normalized chains. Ambiguous short-name matches were resolved in their namespaces. Representative declarations and the substantive distinctions checked are below; paths start at each pinned library's source root.

| Declaration or object opened | Pinned file and line | What was checked |
|---|---|---|
| Representation/module conversion | `Mathlib/RepresentationTheory/Basic.lean:142`, `:191` | Native carriers for group-ring modules; no substitute free predicate is needed. |
| Group cohomology and homology | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183`, `:202`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:226`, `:246` | Derived-functor comparisons exist; the roadmap does not own their construction. |
| Projective dimension | `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean:53` | Dimension bound is native; group-specific cd is its specialization. |
| Pseudo-coherence | `TauCeti/Algebra/Module/PseudoCoherent/Basic.lean:89`, `:133`, `:205`, `:320`, `:375` | Degree zero is finite generation, degree one finite presentation, infinity all finite stages; kernel criterion includes the free finite module. |
| Restriction and exact sequences | `TauCeti/Algebra/Module/PseudoCoherent/RestrictScalars.lean:155`; `TauCeti/Algebra/Module/PseudoCoherent/TwoOutOfThree.lean:109`, `:125`, `:143` | Applicable over the noncommutative group algebra; these are imported, not reproved as generic module targets. |
| Finite projective dimension with finiteness | `TauCeti/Algebra/Module/PseudoCoherent/FiniteProjectiveDimension.lean:69`, `:102`, `:108`, `:153` | IsFPD contains the finite-free resolution and projective syzygy; dimension alone does not supply finite generation. |
| GP carrier and Ext vanishing | `TauCeti/Algebra/Homology/TotallyAcyclic/Abelian.lean:113`, `:224`; `TauCeti/Algebra/Homology/TotallyAcyclic/Abelian/Ext.lean:93` | Total acyclicity includes Hom into projectives, not merely exactness. Layer 9 adds the finite-index group theorem, not a second GP definition. |
| Frobenius structure | `TauCeti/Algebra/Homology/TotallyAcyclic/Abelian/Frobenius.lean:195` | Existing GP exact structure is the supplier. |
| Projective trace | `TauCeti/LinearAlgebra/Trace/Projective.lean:72`, `:96`, `:118`, `:158` | Finite projectivity, cyclicity, comparison with free trace and base change; the `ℚ×ℚ` countermodel excludes using free-basis trace indiscriminately. |
| Swan comparison | `TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean:58` | Finite group, prime p, finite projective modules and rationalized isomorphism. It supplies the completed comparison, not the new localized conclusion without the Nakayama argument. |
| Localization and Nakayama | `Mathlib/RingTheory/Localization/AtPrime/Basic.lean:55`, `:105`; `Mathlib/RingTheory/Nakayama.lean:117` | Local coefficient ring, finite generation, ideal in the Jacobson radical. The argument does not apply the commutative lemma to the noncommutative group ring. |
| CW hypotheses | `Mathlib/Topology/CWComplex/Classical/Basic.lean:135`; `Mathlib/Topology/CWComplex/Classical/Finite.lean:40`, `:49` | Finite dimensionality is distinct from absence of 1-cells; finite type is a separate condition. |
| Manifold separation | `Mathlib/Geometry/Manifold/ChartedSpace.lean:141`, `:236`; `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777` | A charted-space/manifold class does not itself supply Hausdorffness. The roadmap explicitly retains it. |
| Cover lifting | `Mathlib/Topology/Homotopy/Lifting.lean:489` | Simply connected source and local path connectedness are actual hypotheses. |
| Torsion convention | `Mathlib/Algebra/Group/Monoid.lean:552`; `Mathlib/GroupTheory/OrderOfElement.lean:911` | Commuting-power convention agrees with absence of nontrivial finite-order elements for groups; the rational/integral dimension distinction remains. |
| Normalized chains | `Mathlib/AlgebraicTopology/SimplicialSet/Homology/Nondegenerate.lean:43`, `:86`, `:167`, `:182`, `:200`, `:252` | Basis by nondegenerate simplices, homotopy equivalence, functorial map, dimension vanishing; the unnormalized complex is not falsely treated as bounded. |

### Cross-roadmap ownership and supplier resolution

The board index and the supplied open-head index were read before searching. The roadmap service's object search and head reads were used, together with main and the local supplier designs. Main contains no FinitenessAndDualityOfGroups roadmap. The overlap report has no second copy, conflicting head, dropped cited id, revision-only id or dropped outgoing id to repair. Its three closest-roadmap lists have four distinct names (the results/headings list is empty); both revisions of the two repeated names were read. The following table records the resolved contracts, rather than treating the resolver's five leads as missing declarations.

| Supplier or nearby roadmap | File/section resolved | Ownership result |
|---|---|---|
| ClassifyingSpaces, main; revisions PR #1807 and #1808 | `TauCetiRoadmap/ClassifyingSpaces/README.md:173` (Stage 2 item 10), `:224`, `:238` (Stage 4 items 16–17) | K(G,1), universal covers and cellular resolutions belong here. Both open revisions explicitly map former stages/items: #1807 mapping at 107, 127, 137, 156–159; #1808 at 118, 133, 140, 154–158. The old citations are preserved; neither revision is a new supplier dependency. |
| AlgebraicTopology, main; revisions PR #1807 and #1808 | `TauCetiRoadmap/AlgebraicTopology/README.md:1739` (§4.7), `:2491` (§6.3), `:2873` (§6.4), `:3219` (§8.1), `:3334` (§8.3), `:3413` (§8.5), `:3618` (§8.7), `:3971` (§8.11a) | CW/homology, Hurewicz/Whitehead, duality and simplicial replacement are foundational suppliers. The dimension bound on replacement is the declared gap, not silently attributed to the existing statement. |
| FreeGroupsAndLimitGroups, main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:863` (§4.5), `:906` (§4.7), `:937` (§4.8), `:950` (§4.9) | Owns Bass–Serre actions and tree constructions; present roadmap owns the ensuing finiteness and dimension estimates. The no-inversions and HNN conventions agree. |
| CohomologyOfGroups, earlier board design | `packages/CohomologyOfGroups/design/README.md:620`, `:663`, `:687`, `:800`, `:900`, `:959`, `:978`, `:1007`, `:1172`, `:1339`, `:1484`, `:1529`, `:1569` | Resolved §§1.2, 1.4, 1.5, 2.3, 3.2, 3.4–3.6, 4.6, 5.2, 6.1–6.3: quotient actions, Shapiro, comparisons, spectral sequences, tree sequences, cap products, UCT and transfer. Scope at 74 excludes the present roadmap's dimension/duality/Euler/Farrell theory. The tree splitting is only over k, as used here. |
| SpectralSequencesAndConvergence; PartII PR #2307 | `TauCetiRoadmap/SpectralSequencesAndConvergence/README.md`, §§3.4, 5.3; `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/README.md`, scope | Generic convergence and Euler bookkeeping stay with the base; PartII's filtered and comparison machinery is not duplicated. In the base, §3.4 has the bounded Euler identity and §5.3 retains finiteness in each total degree. |
| SchemeKTheoryOperations PR #1229 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md`, §6.7, heading at 2510 | The directed group-homology colimit statement occurs inside this long section despite its sheaf-oriented heading. It is present at this head and supports arbitrary commutative coefficients. No missing-supplier finding. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1295`, `:1322` (§F.10.3) | Owns generic Hattori–Stallings trace. The present roadmap specializes to the group algebra and conjugacy classes; left modules use the opposite-ring conversion. |
| ProfiniteCohomology, main | `TauCetiRoadmap/ProfiniteCohomology/README.md:2919`, `:2930` (Layer 11) | Owns continuous dimension and invariants; present discrete dimension comparison consumes it. |
| GorensteinHomologicalAlgebra PR #323 | `TauCetiRoadmap/GorensteinHomologicalAlgebra/README.md:15` | Owns generic GP theory and excludes complete group cohomology; the finite-index GP theorem and Farrell functor here are group-specific extensions. |
| SheafTheoreticSmithTheory PR #1734 | `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md:6` | Étale/sheaf Smith theory is distinct from the classical finite-dimensional simplicial Smith/Floyd target here. |
| BordismFormalGroups, main | `TauCetiRoadmap/BordismFormalGroups/README.md`, §F.6.4 | Completed group algebras and Morava-group applications use continuous theory. This is not a second owner of the discrete Farrell construction. |
| PosetHomotopyAndSubgroupComplexes PR #2296 | `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:100` | Its scope excludes the p-fractional Euler theorem. Ordinary finite-poset Euler results are distinct. |
| Downstream instances | `TauCetiRoadmap/FuchsianOrbifolds/README.md:740`; `TauCetiRoadmap/ArithmeticKTheory/README.md`, §3.2; `TauCetiRoadmap/BianchiModularForms/README.md`, §9.3; `packages/MotivicStructuresInModuliOfCurves/README.md:337` | Orbifold, arithmetic-group, Bianchi and mapping-class instances do not become upward supplier edges. The revised Motivic wording says “can cite”, correctly. |

Overlap check: read ClassifyingSpaces (main and PRs #1807/#1808), AlgebraicTopology (main and PRs #1807/#1808), FreeGroupsAndLimitGroups (main), and SpectralSequencesAndConvergencePartII (#2307), together with the base SpectralSequencesAndConvergence; owners are respectively K(G,1)/cellular resolutions, CW and manifold topology, Bass–Serre theory, filtered comparison machinery, and generic spectral-sequence convergence/Euler identities. This roadmap owns the group-specific finiteness, dimension, duality, Euler and Farrell results built from them.

The dependency command prescribed in the brief returned:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

Every Needs line and supplier contract was read. There is no UPWARD or CYCLE line. The sole declared gap, `simplicial-replacement-dimension`, has the same slug in the plan and README, names AlgebraicTopology §8.11a, and asks precisely for preservation of an upper dimension bound N under CW-to-simplicial replacement. That strengthening is absent from the existing supplier statement, is needed in 5.4, and is a minimal contract, not an unowned prerequisite. It does not account for the needs-changes verdict.

### Shape, acceptance-test scope and source independence

The README's summary, scope, conventions, supplier contracts, reading guide, nine mathematical layers, examples, dependencies, consumers and references follow the requested form. The three main examples read for shape were ClassifyingSpaces, AlgebraicTopology and FreeGroupsAndLimitGroups. The plan has 12 definition-kind targets, each with an API and at least three tests; each of the 51 targets has hypotheses, source locators and dependencies. Tests include wrong models rather than merely restating definitions. R01 concerns a false explanatory assertion despite the correct planned API. No process residue, computational procedure or source-chapter layer title requiring repair was found.

Headline inventory from the summary and end results: homological finiteness criteria (1.5), Serre's finite-index theorem (3.2), Eilenberg–Ganea (5.3), the duality criterion (6.3), rational Euler characteristic and index independence (8.4), multiplicativity (8.6), equivariant Euler formula (8.7), denominator theorem (8.9), and Farrell comparison/vanishing (9.4). All nine are included in the computed table. This design has no Suggested.lean, so there are zero sorried theorems to probe. Import shape, sorry'd data, set_option, lost section binders, declared-name matching and headline coverage in Lean cannot yet be tested. No definition-like Lean signature is being accepted as a substitute for a headline. Elaboration: **not available (this lane does not elaborate)**; therefore no “sorry is the only warning” assertion is made. These package-stage checks are not findings against an absent design-stage file.

There are 129 source-key occurrences before References: Brown1974 35, BieriEckmann1973 28, BrownGTM87 22, BieriEckmann1974 13, Brown1975 8, Serre1971Bourbaki 7, Serre1971Prospects 6, Farrell1977 5, Floyd1952 3, EilenbergGanea1957 1, Wall1961 1. This is a reproducible occurrence count, not a count of distinct theorems.

Brown1974 has the largest share. Its contents at lines 36–57 were compared with the roadmap. Its finite-action §§1–2, finiteness §3, Euler §§4–5, finite-subgroup §6 and Appendix A do not map one-to-one to successive roadmap layers: §3 is distributed across Layers 1, 2 and 4; part of §6 is used in 5.4; Appendix A supplies Layer 7; Layer 8 uses source §§1, 4, 5, 2 and 6. The mathematics forces 8.2 to depend on 8.1, 8.4 on 8.2/8.3, 8.5 on 8.4, 8.6 on 8.4/8.5, and 8.9 on 8.8/8.4/5.4. Projective character theory in Layer 7 precedes its Euler uses. The run is not the source's expository order. Independent Serre, Bieri–Eckmann, Brown1975 and Floyd sources are used for their respective results.

For wording, the eleven readable seeded passages and nine additional passages listed above were compared with the six available sources. The shared terms and formulas are mathematically forced; no copied sentence, translated passage, clause-by-clause paraphrase, imported table, figure or exercise list was found. The explicit coefficient extensions and chain-level routes were also checked for dependence on a source-specific hypothesis. This is not a wording certification for the five unread works.

Source independence: 20 target passages compared with 6 sources; no non-forced shared expression found. Largest share Brown1974, 35 of 129 source-key occurrences; contents compared with Brown1974: independent. BrownGTM87's text and contents and the other four settled uncertified texts were unavailable, so their wording was not certified.

## Not verifiable

- BrownGTM87: settled uncertified. In particular the sampled locators VIII.5 (1.6), VIII.11 (4.2), VIII.7 (5.2), X.2 (9.1) and X.3 (9.4) could not be checked against its text or printed pages. Its table of contents was not available in the supplied cache. Independent mathematical tests are not source certification.
- Farrell1977: settled uncertified; the comparison/vanishing and construction locators could not be verified in the paper.
- EilenbergGanea1957, Wall1961 and Serre1971Prospects: settled uncertified; cited results were assessed mathematically but the published wording/numbering/pages were not inspected. No new request was made for any settled source.
- OCR loses symbols in parts of Brown1974's definitions and proofs (notably lines 349–351, 360 and 412), and some BieriEckmann1973 formulas. Those exact damaged symbols cannot be certified from the extraction alone. Readable neighboring statements, other cited papers and explicit mathematical arguments were used, without treating missing OCR as source text.
- Suggested.lean does not exist at this design stage. Elaboration and mechanical `#check`/one-tactic probes are not available in this lane. All reported algebraic computations are mathematical checks, not Lean test output.

## Source issues

- **Misprint** in BieriEckmann1974 at proof of Theorem 3.4, printed p.82 (line 334): the source says the duality conclusion follows from reference [2], Theorem 4.6; it should be reference [2], Theorem 4.5, the duality criterion; affects the proof.
- **Misprint** in BieriEckmann1974 at remark after Theorem 3.4, printed p.82 (line 337): the source says its comparison is with Theorem 4.3; it should be Theorem 3.4; affects nothing.

## For the human reviewers

- BrownGTM87 supplies 22 of 129 source-key occurrences; its text and contents could not be read. Its wording and arrangement were not tested directly. The dominant source, Brown1974, was tested.
- Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects remain settled uncertified. This review does not reopen those source decisions or certify their unread wording.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "65b46d1f6fc8e82f3ba8e5f5ba399071dbc9ac8a", "job": "REV-DESIGN-FinitenessAndDualityOfGroups~7", "model": "gpt-6-astra", "worker": "chris-4"} -->
