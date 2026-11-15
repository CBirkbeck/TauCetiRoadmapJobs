<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15391#issuecomment-6888655488 -->
Review (codex) of 4505272

Verdict: accepted
Conditional on the announced gaps: `simplicial-replacement-dimension`, `order-complex-nerve-realization`

No package findings. Acceptance is conditional on the two declared AlgebraicTopology supplier contracts, `simplicial-replacement-dimension` and `order-complex-nerve-realization`. The five sources already settled as uncertified remain uncertified; acceptance does not certify their unread locators.

## Previous findings, checked first

| Previous finding | Status and repaired passage | Recheck |
| --- | --- | --- |
| F01, total rational Euler characteristic | **Repaired.** `packages/FinitenessAndDualityOfGroups/Suggested.lean:194`: “`Module.finrank` assigns `0` to each infinite-dimensional homology group, and `finsum` assigns `0` when infinitely many terms are nonzero.” | For `FreeGroup ℕ`, the finranks are `(1,0,0,…)`, so the definition returns `1`. The whole group and an index-two subgroup give normalized values `1` and `1/2`; `groupEulerChar` returns `0`. README Conventions, lines 185–196, agrees. |
| F02, partial-resolution endpoint | **Repaired.** `packages/FinitenessAndDualityOfGroups/Suggested.lean:69`: “exact at `R` and at `F_i` for `i < n`”. | At `n=0` only the augmentation is onto. At `n=1` exactness is required at `F₀`, not `F₁`. This matches `TauCeti.Huber.IsPseudoCoherentOver`, Basic.lean:89, and its `zero_iff`:133 and `one_iff`:205. |
| F03, mod-p Swan headline | **Repaired.** `packages/FinitenessAndDualityOfGroups/Suggested.lean:182` declares `exists_linearEquiv_tensorZMod`; README:1881 says “both sides being modules over the quotient `𝔽_p G` of `ℤG`”. | The signature includes finite `G`, finite projective `P`, the scalar tower and prime `p`. For `(ℤS₃)²`, the supplied rank is `m=2`, integral rank `12`, and both reductions have dimension `12`, including `p=2,3`. The trivial integral `C_p`-module, which would give `1=p·m`, is excluded by projectivity. |
| F04, allegedly missing downstream roadmap | **Not repaired; the repair worker's dispute is upheld.** README:2445 still names “MotivicStructuresInModuliOfCurves §2.1”. | `packages/MotivicStructuresInModuliOfCurves/README.md:337` really defines that section and proves rational vanishing using a torsion-free finite-index subgroup. `merge-order/ORDER.txt:350` places it after this package at line 319. The tool's failure to find a board-only package is not evidence of absence. No change is required. |

The added module-docstring entry and the changed §7.4 paragraph were reviewed together with the new signature. I searched the remaining package for the old Euler-characteristic convention, the erroneous exactness endpoint and omitted statable headlines; those patterns do not recur. There are no maintainer notes to adjudicate.

## Verified sound

### Coverage, principles and shape

I read the four authored files, the previous review and repair report, the board-package index, the open-roadmap index and the supplied overlap/citation/library leads. The mathematical pass covered all 51 numbered subsections. For unchanged, nonsampled statements I relied on the previous review only where its adversarial table records computed values; the 15 seeded sections, changed passages and headline signatures were checked again. The table below records this round's sampled and headline witnesses rather than repeating the entire earlier ledger.

The plan develops discrete-group finiteness, dimensions, duality, projective ranks, Euler characteristics and complete cohomology at their stated generality. It includes bad-characteristic, zero-ring, nonorientable and infinite-rank controls. It does not replace a general theorem by a convenient-prime case. No second copy of this roadmap is present on content main. The scope distinguishes the existing classifying-space, ordinary group-cohomology, continuous-cohomology, trace and spectral-sequence theories and consumes their owners.

There are nine mathematical layers, each with Examples and Dependencies. Definitions have prose API lists and at least three discriminating Checks; §1.6 has two Checks but introduces no definition. Every numbered target has a source locator and a Needs line or explicit local dependency context. I compared the shape with main's ClassifyingSpaces, AlgebraicTopology and ProfiniteCohomology roadmaps. No computational algorithm, copied source block, process residue, machine path, HTML anchor, sorry'd data, `lemma` declaration or `set_option` occurs in the package's acceptance test. Backticked names attributed to this package resolve to its 23 declarations, including names written with arguments. All 23 declarations are mentioned in the README.

The source service added the missing Hatcher2002 record for the explicitly cited Theorem 2C.5. Bibliographic fields were added to that new record; all 11 author-recorded entries retain their original values. No README, Lean, metadata or design-plan file was changed by this review.

### Computed adversarial pass

Here `C_m` denotes a cyclic group, `F_r` a free group, `K` the Klein-bottle group, and `A=C₄∗_{C₂}C₆`. Values outside a theorem's hypotheses are negative controls, not claimed conclusions. “Keep” means that the stated hypotheses exclude the failed variant and no repair is required.

| Statement | Instances tried | Computed values on the two sides, or defining property versus wrong model | Result / change |
| --- | --- | --- | --- |
| §1.2; repaired `IsOfTypeFPn` | `G=1`, `G=ℚ`; `n=0,1`; `R=ℤ,0` | The trivial module is cyclic, so `FP₀` is true for both groups. `FP₁(ℚ;ℤ)` is false because its augmentation ideal is not finitely generated. At `n=0` exactness at `F₀` would incorrectly demand a finite presentation. Over `0`, every term and kernel is `0`. | Endpoint and zero-ring conventions agree; keep. |
| §1.2; `FP`, `FP_∞`, `FL` | `1`, `ℤ`, `C₂` over `ℤ` | Lengths `0,1` give `FL` for `1,ℤ`. The periodic `C₂` resolution has rank `1` in every degree: `FP_∞=true`, `FP=false`, `cd=∞`. | Finite length and termwise finiteness are distinguished; keep. |
| §1.5 colimit criterion, both directions | `G=1`; `ℚ=⋃(1/j!)ℤ`; `n=0,1` | For `1`, the degree-zero comparison is identity and higher groups are `0`. For permutation modules on `ℚ/((1/j!)ℤ)`, each invariant module is `0`, whereas the colimit is the trivial module `R`; comparison is `0→R`, injective but not onto for `R≠0`. | Correct iso range `i<n` and injectivity at `i=n`; keep. |
| §1.5 product criterion, both directions | Same group; empty and singleton products | For `1`, `H₀(∏R)=∏R` and higher homology is `0`; the empty comparison is `0→0`. For `ℚ`, the family of augmentation elements `1−[1/j!]` gives a nonzero coinvariant class in the product killed by the comparison: no finite set of group differences kills all coordinates. | Detects the missing finite generation; keep. |
| §1.7 extensions/products | `ℤ→ℤ²→ℤ`; lamplighter base | Tensor resolution ranks are `(1,2,1)`, giving finite type on both factors and product. In `(⊕ℤ C₂)⋊ℤ`, the whole group is finitely generated but the base is not: the unrestricted converse for kernels is false. | Stated forward closure does not assert that converse; keep. |
| §2.1 dimensions; finite-group dichotomy | `1`, `C₂`, `S₃`; `R=ℤ,ℚ,𝔽₂,0` | `cd_R(1)=hd_R(1)=0`. For nontrivial finite groups over `ℚ`, both are `0`; `cd_ℤ(C₂)=∞` and `Hⁿ(C₂,𝔽₂)=𝔽₂` for every `n`. Over `0`, all cohomology is `0`, hence the least bound is `0`. | Unit-order and nonzero-ring distinctions hold; keep. |
| §2.5 directed unions | `ℚ=⋃(1/j!)ℤ`; cyclic subgroups covering `ℤ²` | Directed cyclic terms have `hd=cd=1`; `hd_ℤ ℚ=1`, `cd_ℤ ℚ=2=1+1`. Cyclic subgroups cover `ℤ²` but are not directed: their dimensions are `1`, while `hd_ℤ ℤ²=2`. | Both directedness and the extra cohomological degree matter; keep. |
| §3.1 signs | Two-term complex `Rx→Ry`, `dx=y`, `|x|=1` | `d(x⊗x)=y⊗x−x⊗y`; the signed swap sends `x⊗x` to `−x⊗x` and commutes with `d`. A sign-free swap gives a discrepancy `2(y⊗x−x⊗y)` over `ℤ`, but `0` in characteristic two. | Explains why the native sign-free construction is insufficient; keep. |
| §3.2 Serre headline | Index-two `ℤ²≤K`; `ℤ≤C₂×ℤ` | First pair: dimensions `2=2`, including nonabelian `K`. Second: `1≠∞`; the larger group has torsion. | Torsion-free binder is present; keep. |
| §4.1 virtual dimension | `S₃`, `C₂×ℤⁿ`, `n=0,1,2`; infinite elementary 2-group | Torsion-free finite-index subgroup gives `vcd=0` for `S₃`, and `0,1,2` for the three products, although their integral `cd` is `∞`. The infinite elementary 2-group has no such subgroup and gets `∞`. | Infimum, independence and empty-witness value agree; keep. |
| §4.3 rational vanishing | `C₂×ℤ` over `ℚ` and `𝔽₂` | `cd_ℚ=1=vcd`; over `𝔽₂` the split projection onto `C₂` gives nonzero cohomology in every degree, hence `cd=∞`. | Invertible-index assumption cannot be omitted; keep. |
| §4.4 virtual types/FHT | `C₂`, `F₂`, `F_ℕ` | For `C₂`, subgroup `1` has index `2`, finite resolution and finite homology. `F₂` has ranks `(1,2)` and finite type. `F_ℕ` has `vcd=1` but `H₁=ℤ^(ℕ)`, so finite homological type is false. | Finite `vcd` alone does not imply FHT; keep. |
| §§5.1,5.3 geometric headline | `1`, `ℤ`, `ℤ²`, `ℤ³`, `C₂` | `(gd,cd)=(0,0),(1,1),(2,2),(3,3),(∞,∞)`; bounds are respectively `0≤3`, `1≤3`, `2≤3`, `3≤3`, `∞≤∞`. `H₃(ℤ³,ℤ)=ℤ` excludes dimension `2`. | No claim that the unresolved `cd=2` case always has `gd=2`; keep. |
| §5.4 normalized chains | Simplicial point; product of interval models | Point: normalized ranks `(1,0,…)`, versus unnormalized ranks `(1,1,…)` with `d₁=0,d₂=id`. Two interval factors have maximum nondegenerate degree `2`, not infinite degree from degeneracies. | Dimension bound is used on normalized chains; keep. |
| §6.1 duality and fundamental class | `ℤ`, `1`, `S₃` over `ℚ`, zero ring | For `ℤ`, `H¹(ℤ,R)=R=H₀(ℤ,R)` and cap with the selected generator sends `1` to `1`; cap with zero sends `1` to `0`. For finite `S₃/ℚ`, degree-zero invariants-to-coinvariants is invertible, inverse averaging by `1/6`. For `R=0`, both sides vanish in every degree. | Actual cap class, not an arbitrary isomorphism, determines the definition; keep. |
| §6.3 duality criterion | `1`, `ℤ`, `ℤ²`; `C₂/ℤ` | Group-ring cohomology is `R` only in degrees `0,1,2`, respectively. `C₂` is not of integral type `FP` and has infinite cohomological dimension. | Finiteness and concentration conditions separate the finite torsion example; keep. |
| §6.4 abstract PD characterization | `ℤ²`; `K`; zero ring | Torus dualizing module is `ℤ`. For `K`, `H²(K,ℤ)=ℤ/2=H₀(K,ℤ_w)` with `w(t)=−1`; replacing `w` by `1` gives `ℤ`, not `ℤ/2`. Over `0` all dimensions satisfy the duality definition. | Orientation and coefficient range agree; keep. |
| §6.5 conjugation convention | `K=ℤ⋊_{−1}ℤ` | If `d(a)=1`, then `(t·d)(a)=−a`, of augmentation `−1`; the `a`-action augments to `+1`. Thus the dualizing character is `(1,−1)`, not `(1,1)`. | Matches the earlier right-to-left inversion convention; keep. |
| §6.6 closed aspherical manifolds | Torus; Klein bottle; `S²`; doubled-point circle | Torus has the expected rank-one orientation. Klein bottle gives `ℤ/2` in top untwisted cohomology. For `S²`, group `1` has `H⁰=R`, `H₂=0`: dimension-two cap fails for `R≠0`. Doubled-point circle is non-Hausdorff, has group `F₂`, and `H¹=ℤ²` versus possible twisted `H₀=ℤ` or `ℤ/2`. | Asphericity and explicit Hausdorffness exclude both counterexamples; keep. |
| §7.1 rank/character convention | Regular and trivial rational `S₃` modules; primitive `C₃` character `ω` | Regular rank has class values `(1,0,0)`; trivial rational rank `(1/6,1/2,1/3)`. The coefficient at `g⁻¹` for the `ω` eigenspace is `ω/3`, yielding trace `ω`; reversing the inverse gives `ω⁻¹`. | Identity coefficient, augmentation and inverse-class evaluation are distinct; keep. |
| §7.3 rational Swan headline | `P=(ℤS₃)²`, `P=0`, nonprojective trivial `ℤC₃` module | Ranks: `2·6=12`, `0·6=0`; rationalizations are regular powers of those ranks. The trivial module would require `3m=1`, impossible. | Projectivity excludes the wrong model; keep. |
| §7.4 repaired mod-p Swan headline | Same `S₃` example, `p=2,3`; regular `C_p`; zero module | Both reductions of `(ℤS₃)²` have dimension `12=2·6`, even when `p` divides the order. Regular `C_p` gives `p=1·p`, zero gives `0=0·p`. Trivial `C_p` reduction has dimension `1`, not a multiple of `p`. | Full prime range and scalar-tower/linearity conditions hold; keep. |
| §8.3 rational versus identity-class Euler values | `1`, `ℤ`, `F₂`, `C₂`, additive `ℚ` | Rational values are `1,0,−1,1,0`. Identity-class Euler values agree on the first three; for `C₂` the finite integral projective resolution does not exist, so that invariant is not defined there. | No accidental identification of `χ_ℚ(C₂)=1` with `χ(C₂)=1/2`; keep. |
| §8.3 repaired total-function convention | `F_ℕ` | Infinite-dimensional `H₁` has Lean finrank `0`; sum is `1−0=1`, not `0`. This is outside finite-total-dimensional hypotheses. | Both docstrings and README now agree; keep. |
| §8.4 independence and index headlines | `A₃≤S₃`, subgroup `1≤S₃`; `C₂×ℤ`; `F_ℕ` | `χ(S₃)=1/6`, `χ(A₃)=1/3=2·(1/6)`, `χ(1)=1=6·(1/6)`. Product with `ℤ` gives `0/2=0`. Outside FHT, `F_ℕ` supplies unequal quotients `1` and `1/2`, so definition returns `0`. | Positive finite index prevents division by zero; FHT prevents unequal quotient values; keep. |
| §8.5 twisted/class-valued extension input | Index-two subgroup `F₃≤F₂`; coefficients `ℚ,𝔽₂` | Over `ℚ`, `[H⁰]−[H¹]=[1]−[2·1+sgn]=−[regular]`, dimension `−2`. Over `𝔽₂`, class still has length `−2`, while traces of the regular module are `0`. | Positive-characteristic statement uses `G₀`, not trace determination; keep. |
| §8.6 extension headline | `F₂×F₃`; `K`; `C₂×ℤ` | Spectral-page dimensions `1,3,2,6` give total ranks `(1,5,6)` and `1−5+6=2=(−1)(−2)`. Klein bottle and finite-by-cyclic product give `0=0·0` and `0=(1/2)·0`. | Finite-support Euler argument and explicit virtual torsion-freeness retained; keep. |
| §8.7 action and amalgam headline | `A`; `C₂∗C₃`; Cayley tree of `F_r` | `1/4+1/6−1/2=−1/12`; index-12 free kernel has `5` vertices, `6` edges and `χ=−1`. `1/2+1/3−1=−1/6`; free action gives `1−r`. Wrong positive edge sign gives `11/12` in the first example. | Orbit signs and multiplicities agree; keep. |
| §8.7 HNN headline | Identity HNN extension of `ℤ`; `BS(1,2)` | Identity case is `ℤ²`, with `χ=0=χ(ℤ)−χ(ℤ)`; `BS(1,2)` has one vertex and edge orbit, giving `0−0=0`. | Correct subtraction and actual HNN carrier; keep. |
| §8.8 Smith and orbit counting | Reflection of simplicial circle; free cyclic actions on circle and finite orbits; `EC₂` | Reflection: `χ(X)=0`, two fixed vertices give `χ(X^G)=2`, quotient interval gives `1`; `0+2=2·1`. Three-point free `C₃` orbit gives `3=3·1`; empty set gives `0=3·0`. Contractible free `EC₂` would give `1=2χ(BC₂)`, but its dimension is infinite and excluded. | Prime-two, prime-three, empty and dimension controls pass; keep. |
| §8.9 denominator/common-multiple headline | `A`, `S₃`, `C₂×ℤ`; `m=0` in Lean formulation | `m=12` gives `12·(−1/12)=−1`; largest finite order `6` instead gives `−1/2`. `6·(1/6)=1`; `2·0=0` although denominator is `1`. If the common-multiple parameter is `0`, witness integer is `0`. | LCM is not maximum and need not equal reduced denominator; keep. |
| §8.9 prime-power headline | `A`; exponent `a=0` | Denominator `12` has prime-power factors `4,3`, realized by subgroups of the factors. For `p⁰=1`, the trivial subgroup has order `1`. Finite `S₃` has denominator `6` and subgroups of orders `2,3`. | Both directions of denominator criterion and boundary exponent hold; keep. |
| §§9.1–9.2 high-syzygy headline | `C₂`, subgroup `1`, `n=0`; `G=H=ℤ` | On `ℤ[C₂]`, alternating maps `1−s,1+s` compose to `1−s²=0`; image of each equals kernel of the next, as do their projective-dual maps. For `ℤ`, trivial module has projective dimension `1`, not Gorenstein dimension `0`; a bound `n=0` is therefore unavailable. | The subgroup-dimension bound is present, including at the endpoint; keep. |
| §§9.3–9.4 comparison and vanishing | `C₂`, `C₂×ℤ`, `A`, torsion-free `ℤ` | For `C₂/ℤ`, complete groups in degrees `−1,0,1,2` are `0,ℤ/2,0,ℤ/2`; degree-zero ordinary map is `ℤ→ℤ/2`, onto but not injective. For `C₂×ℤ`, every degree `≥2` gives `ℤ/2` on both sides. For `A`, even high degree gives `ℤ/12`, odd gives `0`; for `ℤ`, complete groups are `0`. | Strict comparison range and degree-zero indexing agree; keep. |
| §9.5 finite-group comparison | `C₂`, `1`, coefficients `RG` | Both constructions give `(ℤ/2,0,ℤ/2,0)` in degrees `(0,1,2,−1)` for `C₂/ℤ`; for `1` and for regular projective coefficients both give `0` in every degree. | Norm splice agrees with native Tate convention; keep. |

The untested categories in the generic rubric (ramified DVRs, nonreduced schemes, fans, inseparability) are not carriers of these statements. Applicable coefficient degeneracies, arbitrary-cardinality groups, natural-number endpoints, empty indexing types, the zero module and zero ring were retained in the checks above and the earlier computed rows.

### Seeded source sample and proof routes

I checked the readable source text, not just the bibliography. The table separates direct statements from coefficient extensions supplied by an argument in the roadmap. No source passage is reproduced here.

| Seeded target | Source evidence and conclusion |
| --- | --- |
| 1.2 | BieriEckmann1973 §4.1, p.116, lines 540–544; BieriEckmann1974 §3.3, p.81, lines 286–295; Brown1974 §3, p.235, lines 345–351; Serre1971Bourbaki §1.2, p.338, lines 55–58. The texts distinguish finite length from finite terms. The general `R` versions are explicitly the native module predicates. |
| 1.5 | Brown1975 Theorem 2, pp.130–131, lines 83–101, and its proof p.132, lines 147–157; BieriEckmann1974 Lemma 1.1 and Proposition 1.2, pp.75–76, lines 102–137. Truncation gives isomorphisms below `n` and the one-sided endpoint condition. The product-specialization argument and the separate `FP₁` clause are present. |
| 1.7 | BieriEckmann1974 Proposition 3.3, p.81, lines 298–313. The printed result treats integral `FP_∞/FP`; the package states the coefficient extension as its own proof using the extension spectral sequence and finite resolutions, rather than attributing the larger statement verbatim to that proposition. |
| 2.5 | BrownGTM87 §VIII.2 is settled uncertified. Independently resolved the directed-union homology input at SchemeKTheoryOperations §6.7 and checked the countable-telescope `+1` bound. Source-page certification remains unavailable. |
| 4.1 | Serre1971Bourbaki §1.4, pp.338–339, lines 69–81. The invariant is attached to a torsion-free finite-index subgroup and independence uses Serre's theorem. The empty-witness totalization is the roadmap's explicit convention. |
| 6.1 | BieriEckmann1973 Definition 1.1 and Lemma 1.3, pp.105–107, lines 110–195. The cap class, side of the dualizing action and all-module quantifier are retained. The source is integral; the roadmap's `R` definition and base arguments are stated separately. |
| 6.6 | Serre1971Bourbaki §1.4, p.338, lines 63–67; BieriEckmann1974 §3.2, p.80, lines 271–281. Closed aspherical manifolds supply the example. The coefficient/orientation extension is supported by the resolved twisted-duality and finite-CW supplier contracts, with Hausdorffness explicit. |
| 8.3 | Brown1974 §4, pp.236–237, lines 386–410, and its distinction of the naive characteristic at lines 82–83. The Hattori–Stallings part additionally cites unread BrownGTM87 §IX.2 and consumes the resolved trace supplier. The two Euler invariants are not conflated. |
| 8.4 | Brown1974 Theorem 3 and following construction, pp.236–237, lines 388–424; Serre1971Bourbaki p.339, lines 77–86. Finite cohomological dimension, normal finite index and finite generation are preserved. Wall1961 and Serre1971Prospects remain uncertified supplementary locators. |
| 8.6 | Brown1974 §4, Corollary 2, p.238, lines 452–463. The package keeps virtual torsion-freeness of the middle group as an independent hypothesis and supplies the finite-page spectral-sequence calculation. |
| 8.7 | Brown1974 §5, pp.238–242, lines 464–479, Proposition 2(i) at line 509, and Proposition 4 at lines 558–582. Finite orbit sets, acyclicity/resolution and the finiteness conditions on group and stabilizers appear in the package. The monomial orientation characters are accounted for in the proof. |
| 8.8 | Floyd1952 Theorems 2.3–2.4, pp.140–142, lines 110–176; facts (3.4)–(3.6), p.145, lines 261–267; Theorems 4.2 and 4.4, pp.145–146, lines 292–348. Brown1974 Theorems 2/2′ and their corollary, pp.233–235, lines 243–333, and Theorem 1′, p.232, lines 174–185. The roadmap acknowledges Floyd's topological hypotheses and gives the normalized permutation-chain proof for its simplicial-set formulation. |
| 8.9 | Brown1974 Theorem 5, Corollary 1, p.243, lines 603–610, including the empty family. The package's proper-action construction and orbit-divisibility argument explain the denominator bound; the earlier Serre power-of-`m` result is not substituted for Brown's sharper statement. |
| 9.4 | Farrell1977 and BrownGTM87 §X.3 are settled uncertified. Checked the supplied dimension-shifting route, comparison direction and numerical controls, but not the unavailable printed text. |
| 9.5 | Farrell1977 and BrownGTM87 §VI.3 are settled uncertified. Checked the native norm splice and positive-degree comparison; source-page certification is unavailable. |

For the newly repaired §7.4, Brown1974 Appendix A, p.261, lines 1311–1320 supplies the local reduction refinement, while p.232, lines 169–172 supplies the rational Swan theorem. The p-adic lifting result at the pin requires an isomorphism of rationalizations; §7.4 correctly obtains that from §7.3 before using it. Hatcher2002 Theorem 2C.5, p.182, lines 7920–7945 explicitly preserves the dimension in the skeletal replacement; its supplier still needs to export that bound.

### Lean elaboration, binders and padding

The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; these match the package's contracts.

From the content checkout I ran `lake env lean` on the package's `Suggested.lean`: exit `0`, no errors, exactly 14 warnings, all `declaration uses 'sorry'`. All five individual Tau Ceti imports already had object files. The file has the single `import Mathlib` followed by those used modules, nine real-bodied definitions and 14 theorem statements.

A scratch copy with `#check @name` for all 23 declarations also elaborated. I compared the elaborated types with the README: no binder was lost and no signature needed changing. In particular the two Swan statements retain finiteness, projectivity, scalar towers and primality where needed; Serre retains torsion-freeness; Euler statements retain FHT/virtual hypotheses and finite index; the Gorenstein statement retains the subgroup-dimension bound. The broader-universe definitions and `Type`-level headline specializations are explicitly scoped in the README.

For every one of the 14 sorried theorems I tried `simp`, `rfl` and `infer_instance` on a scratch copy, requiring the selected tactic to close the goal. All 42 probes failed to close their goal. The supplied near-match list was also inspected; its LeanSearch requests had failed, so I did not treat it as evidence of absence. Direct source searches and inspection found no single pinned lemma proving one of these headlines. Dimension/cardinality lemmas do not produce the missing group-module isomorphisms; the p-adic Swan theorem has a different base ring and assumes the rationalization isomorphism; generic Gorenstein splicing does not establish the high syzygy's Gorenstein projectivity. None of the 14 statements merely restates a definition, is a boundary theorem or mirrors a README Check.

| README headline | Acceptance-test coverage |
| --- | --- |
| Finiteness criterion §1.5 | `isOfTypeFPn_iff_colimit`:86 and `isOfTypeFPn_iff_piComparison`:97 |
| Serre §3.2 | `cohomologicalDim_eq_of_finiteIndex`:119 |
| Eilenberg–Ganea §5.3 | `geometricDim_le_max`:158 |
| Duality criterion §6.3, abstract PD characterization §6.4(b), closed aspherical manifolds §6.6 | Named in module docstring:37–42. Missing group cap-product carrier; the manifold theorem also needs the orientation-character interface. No arbitrary Prop or weakened substitute is inserted. |
| Swan §§7.3–7.4 | Rational `exists_linearEquiv_tensorRat`:168 and mod-p `exists_linearEquiv_tensorZMod`:182. Hattori–Stallings vanishing §7.3(a) is named at docstring:52–54 as lacking the noncommutative trace. |
| Euler independence/index §8.4 | `groupEulerChar_eq_div_index`:216, `groupEulerChar_subgroup`:223 |
| Extension multiplicativity §8.6 | `isVirtuallyOfTypeFP_and_groupEulerChar_eq_mul`:230 |
| Equivariant formula §8.7 | Amalgam `groupEulerChar_pushoutI`:241 and HNN `groupEulerChar_hnnExtension`:251. General action/monomial-complex carrier is explicitly missing at docstring:47–51. |
| Denominators §8.9 | `exists_int_eq_mul_groupEulerChar`:261 and `exists_subgroup_card_eq_of_dvd_den`:269 |
| Complete resolutions §9.2 | `isGorensteinProjective_opcycles`:281, using the native equivalence between high-syzygy Gorenstein projectivity and splicing a complete resolution |
| Farrell comparison §9.4 | Named at docstring:43–46; the actual complete-cohomology functor and comparison map are missing at the pins. |

All line numbers in the preceding table refer to `packages/FinitenessAndDualityOfGroups/Suggested.lean`.

### Pinned-library and duplication evidence

I opened the pinned declarations used by the README and the acceptance test, searching by objects as well as by proposed names. These are the principal boundaries where a mistaken duplicate or omitted hypothesis would change the verdict:

| Object and pinned file | Declarations/lines read; boundary checked |
| --- | --- |
| `TauCeti/Algebra/Module/PseudoCoherent/Basic.lean` | `Huber.IsPseudoCoherentOver`:89, `mono`:114, `zero_iff`:133, `one_iff`:205, `ker_of_projective`:364, successor characterization:375. The augmentation is surjective at every level; exactness at `F₀` starts at level 1. The roadmap specializes this native predicate rather than owning a second module predicate. |
| `TauCeti/Algebra/Module/PseudoCoherent/FiniteProjectiveDimension.lean` | `Module.IsFPD`:69, zero case:108, `isFPD_iff_hasProjectiveDimensionLE`:153. Finite free initial terms and the final projective syzygy encode finite projective resolutions. |
| `Mathlib/LinearAlgebra/Dimension/Free.lean`; `Mathlib/Algebra/Homology/EulerCharacteristic.lean` | `Module.finrank_of_not_finite`:276; `homologyEulerChar`:154. These supply the repaired infinite-dimensional convention, not the group-theoretic Euler characteristic. |
| `Mathlib/RepresentationTheory/Rep/Basic.lean`, `Rep/Res.lean`, `Rep/Iso.lean` | `Rep.trivial`:288, `Rep.res`:43, `equivalenceModuleMonoidAlgebra`:157. Actual trivial action, actual restriction and native group-ring module carrier are used. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` and `GroupHomology/Basic.lean` | Ext comparison:202, Tor comparison:246 and computation from a projective resolution. These supply ordinary group (co)homology, not a complete-cohomology functor. |
| Corresponding `Functoriality.lean` and `Shapiro.lean` files | Cohomology functor:534, homology functor:831; `groupCohomology.coindIso`:58, `groupHomology.indIso`:65. Comparison maps are attached to these functors, not arbitrary maps with their conclusion as a hypothesis. |
| `Mathlib/CategoryTheory/Limits/HasLimits.lean`; `Limits/Shapes/Products.lean` | `colimit.post`:490; `piComparison`:443. The directions are colimit-of-cohomology to cohomology-of-colimit, and homology-of-product to product-of-homology. |
| `TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean`; `GroupHomology/Transfer/Basic.lean` | Corestriction:136 and restriction/corestriction composite:165; homological transfer:79 and composite:121. Finite index and multiplication by index agree with the package. |
| `TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean` | `isZero_groupHomology_of_directed`:132 explicitly needs a nonempty directed family whose supremum is top. It is used for vanishing, not claimed to be the entire homology-colimit isomorphism. |
| `Mathlib/Topology/CWComplex/Classical/Basic.lean`; `Classical/Finite.lean` | Classical `CWComplex`:135, `RelCWComplex.FiniteDimensional`:40. Neither definition adds a Hausdorff instance; the geometric-dimension definition supplies `T2Space` separately. |
| `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean` | `IsAspherical`:59, `IsEilenbergMacLaneSpaceOne`:123. Path connectedness and higher homotopy are included; Hausdorffness is not. |
| `TauCeti/AlgebraicTopology/ClassifyingSpace/PresentationComplex.lean`, `Cellular.lean`, `PresentedGroupResolution.lean` | Cell equivalences:304,317; `isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`:161; `cellularClassifyingSpaceResolution`:105. These construct the unrestricted cellular model; they do not prove Eilenberg–Ganea's dimension bound. |
| `TauCeti/AlgebraicTopology/EilenbergMacLane/Resolution.lean`; `Cellular/Covering.lean` | `cellularResolutionOfIsAspherical`:57; `cellularChainRepIsoFree`:252. The free chain generators are lifted cells, consistent with the package's resolution conventions. |
| `TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`, `Subdivision/Basic.lean`, `Subdivision/Homeomorph.lean` | `orderComplex`:57, subdivision/order-complex equality:76, subdivision realization homeomorphism:221. All use abstract-complex realizations; none gives the required homeomorphism to the simplicial-set nerve realization. |
| `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/CWComplex/Basic.lean`, `OrderedChainComplex.lean` | Realization CW structure:172; `cellularChainComplexRealizationIso`:132. This is the already-owned abstract-complex comparison, consumed rather than rebuilt. |
| `TauCeti/AlgebraicTopology/SimplicialSet/EilenbergZilber.lean` and normalized-chain/dimension files cited in the README | `SSet.eilenbergZilberHomotopyEquiv`:761; normalized-chain maps, homotopy equivalence and dimension vanishing. Their degree-zero point computation is `(1,0,…)`, as used above. |
| `Mathlib/LinearAlgebra/Trace.lean`; `TauCeti/Algebra/MonoidAlgebra/ProjectiveTrace.lean` | `LinearMap.trace`:75 is the ordinary linear trace; `trace_ofModule'_eq_zero_of_dvd_orderOf`:67 is the local-ring projective-character vanishing theorem. Neither is the full noncommutative Hattori–Stallings trace. |
| `TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean`; `Rational.lean` | `nonempty_linearEquiv_of_projective_of_tensorRat`:58 and prime-to-order variant:134. Both concern projective p-adic modules with matching rationalizations, so do not duplicate integral Swan. |
| `TauCeti/Algebra/Homology/TotallyAcyclic/Abelian.lean` | Totally acyclic projective complexes:113; `IsGorensteinProjective`:224; ordinary projectives:263. No finite-generation restriction is silently added. |
| `TauCeti/CategoryTheory/Exact/Resolution/Complete/Comparison.lean` | Lift:182, `liftHomotopy`:463, `homotopyEquiv`:481. These compare resolutions after their existence is known; the finite-index group-ring syzygy theorem remains new. |
| `TauCeti/Data/ENat/LeastBound.lean` | `leastENatBound`:39, `leastENatBound_le_iff`:70. Empty witnesses give infinity, and monotonicity is required for the bound characterization. |
| `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean` and its comparison file | Existing finite-group norm-splice Tate theory and `TateCohomology.isoGroupCohomology` are consumed in §9.5; the roadmap owns comparison with its new Farrell theory, not another finite-group Tate definition. |

The library near-matches involving `Module.finrank_eq_nat_card_basis`, field automorphism counts, `Nat.card`, subgroup cardinalities and `Monoid.PushoutI` only give dimensions, counts or carriers. None states the new finiteness, Euler or module-freeness conclusion. No same fully qualified declaration name was found in the other readable roadmaps.

### Cross-roadmap citations, gaps and order

Every named supplier section was resolved against main for existing roadmaps or the supplied open head for a new roadmap. The citation tool's three apparent missing “roadmaps” BieriEckmann1974, BrownGTM87 and BieriEckmann1973 are source keys. Its fourth lead is the board-only downstream package resolved above.

| Supplier | Resolved content |
| --- | --- |
| CohomologyOfGroups, open #2338, `TauCetiRoadmap/CohomologyOfGroups/README.md` | §§1.2,1.4,1.5 (quotient action, permutation coefficients, discrete comparison); §2.3 (two complex spectral sequences); §§3.1–3.2 (equivariant homology and monomial sequence); §§3.4–3.6 (tree and amalgam/HNN sequences); §4.6 (cap and transfer formula); §5.2 (universal coefficients); §§6.1–6.3 (normalized Hochschild–Serre sequences). Representative locations: lines 931,974,1002,1127,1228,1289,1337,1518,1746,1962,2014,2054. The scope at lines 102–105 explicitly leaves finiteness/Euler/Farrell theory out. |
| SpectralSequencesAndConvergence, open #2302 | `TauCetiRoadmap/SpectralSequencesAndConvergence/README.md:805`, §3.4, and :1340, §5.3. Finite page support, finite abutment filtrations and the classical/native page offset are retained; classical `E₂` is native page 3. |
| FreeGroupsAndLimitGroups, main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:863`, :906, :937, :950 resolve §§4.5,4.7,4.8,4.9: amalgam/HNN carriers, Bass–Serre tree, freeness and finite-group fixed vertices. Actions are without inversions. |
| SchemeKTheoryOperations, open #1229 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2582`, within §6.7, states homology commuting with directed subgroup unions over an arbitrary commutative coefficient ring. The requested theorem is present despite the section's much broader K-theory scope. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1322`, §F.10.3, owns the trace over an arbitrary ring, base change, the identity coefficient and centralizer formula without division. Opposite rings reconcile its right modules with this package's left modules. The open revision was not substituted for main. |
| ClassifyingSpaces, main | `TauCetiRoadmap/ClassifyingSpaces/README.md:173`, :224, :238: Stage 2 item 10 and Stage 4 items 16–17. Cellular models, cellular resolutions and local-coefficient comparisons exist as cited. The #1807/#1808 scope revisions were read for overlap, not used as new suppliers. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md:1739`, :2491, :2873, :3219, :3334, :3413, :3618, :3971 resolve §§4.7,6.3,6.4,8.1,8.3,8.5,8.7,8.11a. General local-system duality, universe-general Hurewicz, Hausdorff finite-CW hypotheses and skeletal replacement are retained. |
| ProfiniteCohomology, main | Scope and Layer 11 at `TauCetiRoadmap/ProfiniteCohomology/README.md:2919`, and §13.2 at :3746: continuous dimension and unsigned/characteristic-two tensor norms belong there. The package's discrete invariant and signed integral complex construction are different objects. |

Both gap slugs occur in `packages/FinitenessAndDualityOfGroups/design/plan.json` and README:619–627, with supplier AlgebraicTopology. One adds exactly a dimension bound to §8.11a; the other specifies an affine, vertex-preserving homeomorphism between two actual realizations. Neither is an unnamed prerequisite or a demand for an existing pinned theorem. I also checked main GeometricTopology §11.1: its current abstract-complex realization/CW and stellar-subdivision statements do not provide the nerve-realization homeomorphism. PosetHomotopyAndSubgroupComplexes §3.1 has a related later comparison; the package consumes the explicitly declared earlier AlgebraicTopology contract and introduces no competing local construction.

Other overlap checks: GorensteinHomologicalAlgebra #323 excludes complete cohomology of groups at `TauCetiRoadmap/GorensteinHomologicalAlgebra/README.md:27`; its general complete-resolution machinery already available at the pin is imported here. SheafTheoreticSmithTheory #1734 owns sheaf quotients and geometric Smith restriction, not the normalized-chain theorem here. RefinedTraceMethods #1493 uses the Hattori–Stallings trace as the degree-zero Dennis-trace comparison, not a competing definition of its underlying trace. The open-overlap report lists no conflicting head for this roadmap, dropped cited ID, missing old-to-new mapping or dependency on an open revision's numbering; examination of the named scopes found none to add.

The downstream citations were also checked: MotivicStructuresInModuliOfCurves §2.1 is present as above; PosetHomotopyAndSubgroupComplexes excludes Brown's p-fractional theorem in its scope; ArithmeticKTheory §3.2 supplies arithmetic-lattice duality (open-head README:1162–1175); BianchiModularForms §9.3 supplies its orbifold Euler vanishing (open-head README:2242–2246); main FuchsianOrbifolds Layer 5 item 6 gives the independent orbifold invariant and finite-index formula. These are applications/comparison points, not prerequisites owned twice.

Overlap check: read CohomologyOfGroups, PosetHomotopyAndSubgroupComplexes, ClassifyingSpaces (main and #1807/#1808), AlgebraicTopology (main and #1807), and ProfiniteCohomology, covering all three closest-roadmap lists; ordinary cohomology/cap/spectral sequences belong to CohomologyOfGroups, classifying models/comparisons to ClassifyingSpaces and the pins, manifold duality/CW/realization contracts to AlgebraicTopology, poset homotopy to PosetHomotopyAndSubgroupComplexes, continuous dimensions/norms to ProfiniteCohomology, and the discrete finiteness/duality/Euler/Farrell theorems to this package. No duplicate ownership requiring repair was found.

The required dependency command, with this README, name, supplied order, `--movable` and content checkout, returned exit `0`:

```text
depcheck: 245 roadmaps, 2214 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. I separately read the Needs lines and supplier contracts: local construction precedes use, the two declared gaps are explicit contracts, and the downstream comparisons introduce no reverse supply edge.

### Wording, arrangement and reuse

I compared 20 passages against seven readable sources: the 12 sampled sections with readable support, plus §1.1, §3.1, §4.4, §§7.3–7.5, §8.1 and the Hatcher supplier passage. In particular the repaired mod-p explanation and the local-ring lifting route were compared with Brown1974 Appendix A. The shared material is mathematical notation, conventional terminology and necessary hypotheses, not source prose, translated clauses, example lists or source proof-plan expression. I found no imported table, figure, exercise list or external formalization text.

Counting explicit source mentions before References, including the one Hatcher citation, gives 132: Brown1974 36; BieriEckmann1973 28; BrownGTM87 22; BieriEckmann1974 13; Serre1971Bourbaki 8; Brown1975 8; Serre1971Prospects 6; Farrell1977 5; Floyd1952 3; EilenbergGanea1957, Wall1961 and Hatcher2002 one each. Repeated mentions are counted separately.

Brown1974's contents, lines 32–68, were read. Its §§1–9 and appendices do not map one-to-one in order onto the roadmap. Its §3 feeds Layers 2 and 4, §6 feeds Layer 5, §1 and Appendix A feed Layer 7, and Layer 8 uses §§1,4,5,2,6 in that order. Layer 8 deliberately puts Smith orbit counting after Euler actions but before the denominator theorem. Dependencies explain the construction: §§3.2→4.1→5.4; trace/Swan in Layer 7→§8.2→§8.4; §§8.4–8.5→8.6; §§5.4,8.4,8.8→8.9; and Layers 2–4→9.2. Layer 6 uses Bieri–Eckmann duality and manifold suppliers, and Layer 9 uses complete resolutions and Farrell's theory, rather than following Brown's article contents. No reorganization is required.

Source independence: 20 passages compared with 7 readable sources; no copied expression or reused source material found. Largest share Brown1974, 36 of 132 explicit source mentions; contents compared with Brown1974: independent. The five settled uncertified texts were not available for wording comparison.

## Not verifiable

- BrownGTM87: manifest status `uncertified`; the text is unavailable. Its locators, including the sampled directed-union and complete-cohomology sections, were not text-certified. Relevant definitions, proof routes, pinned carriers and counterexamples were checked independently.
- Farrell1977: settled `uncertified`; no legal readable text was supplied. The sampled §9.4 and §9.5 locators remain unverified against the paper, although comparison direction and finite-group values were checked.
- EilenbergGanea1957, Wall1961 and Serre1971Prospects: settled `uncertified`; no fresh request was made. Readable primary sources corroborate several cited consequences, but do not turn those unavailable locators into certified ones.
- The library near-match service's LeanSearch queries timed out or returned HTTP errors. Direct searches and pinned-source inspection replaced them; the failed service is not treated as a proof of nonexistence.

## Source issues

- **Misprint** in BieriEckmann1974 at Theorem 3.4 proof, p.82, line 334: the source cites the earlier paper's Theorem 4.6 for its duality criterion; it should cite Theorem 4.5, whose concentration-and-torsion-freeness statement appears at BieriEckmann1973 line 612; affects nothing.
- **Misprint** in BieriEckmann1974 at remark following Theorem 3.4, p.82, line 337: the source refers to Theorem 4.3 in comparing abstract and natural duality; it should refer to the immediately preceding Theorem 3.4; affects nothing.
- **Misprint** in BieriEckmann1973 at Proposition 5.1, p.119, line 646: the source characterizes dimension-one duality groups as all finitely generated free groups; it should exclude the trivial free group, as the proof at line 648 does; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4505272f924d6a9219c9a0d876d2e163be867d2a", "job": "REV-PKG-FinitenessAndDualityOfGroups~2", "model": "gpt-6-astra", "worker": "chris-3"} -->
