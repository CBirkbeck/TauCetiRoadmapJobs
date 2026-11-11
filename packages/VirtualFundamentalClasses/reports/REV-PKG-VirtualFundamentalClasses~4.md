<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13006#issuecomment-6788668683 -->
Review (codex) of 091edb7

Verdict: needs_changes

1. **F01** (P2) Define cone-stack dimension pointwise before taking the supremum

   **Location:** `packages/VirtualFundamentalClasses/README.md:1409`–1421, §7.2: “`dim 𝒞 := dim C − rk E`”; “`BE = [X/E]` … of dimension `dim X − rk E`”.

   **Claim:** These formulas define the dimension through a local presentation and give the dimension of the classifying stack of any vector bundle. Neither formula requires constant rank; the roadmap explicitly permits locally constant, varying ranks. Moreover a local presentation need not see the highest-dimensional component.

   **Witness:** Take `X = Spec k ⊔ ℙ¹`, `E = 0 ⊔ T_{ℙ¹}`. The dimensions of `BE` are `(0−0, 1−1) = (0,0)`, whereas `dim X − rk_x E = (1,0)`.

   The cited source supplies a different formula: stacks-properties Definition 12.2, line 1404, defines dimension **at a point**, and Definition 12.3, line 1413, takes its supremum. Tau Ceti's `FiniteLocallyFreeSheaf.rank` is a function (`TauCeti/AlgebraicGeometry/VectorBundle/Rank.lean:125`), not a scalar. This is a remaining occurrence of previous F01's pattern, beside the correctly repaired componentwise consequence at README lines 1412–1414.

   **Exact repair:** Define `dim_z 𝒞 = dim_c C − rk_x E` for a lift `c` of `z` in a local presentation over `x`; prove presentation independence, then define `dim 𝒞 = sup_z dim_z 𝒞`. Define pure dimension using the pointwise value. In the first Check write `dim_x BE = dim_x X − rk_x E` and `dim BE = sup_x (dim_x X − rk_x E)`; retain the shorter global subtraction only under constant rank and a presentation covering the stack. Cite Definitions 12.2 **and** 12.3. Add the displayed disconnected example. On it the repaired pointwise values are `(0,0)`, their supremum is `0`, and `BE` is pure of dimension zero. No restriction to pure-dimensional bases or constant-rank bundles is needed.

2. **F02** (P3) Reverse the tangent arrow in the Kodaira–Spencer Check

   **Location:** `packages/VirtualFundamentalClasses/README.md:2530`–2531, §11.3: “`h^0(φ)` is dual to the tangent map `H⁰(C, F^*T_X) → T_{[F]}Mor(C, X)`”.

   **Claim:** The displayed tangent map dualizes to the cotangent comparison constructed at lines 2516–2523. Its direction is the reverse of the required one: its dual has source the cotangent space of the map space, rather than `H⁰(C,F^*T_X)^∨`.

   **Witness:** Over `ℚ`, use constant maps `ℙ¹ → 𝔸¹`, with map-space coordinate `t` and universal map `x=2t`. The construction gives `dx↦2dt`; the displayed inverse tangent comparison has coefficient `1/2`.

   **Exact repair:** State that the fibre of `h^0(φ)` is dual to `T_{[F]}Mor(C,X) → H⁰(C,F^*T_X)`, obtained by differentiating the universal map. Add the scaled-coordinate Check above. Its tangent map is `∂t↦2∂x`; its dual is `dx↦2dt`, exactly the construction and the difference map in §11.4. The reverse tangent isomorphism sends `∂x↦(1/2)∂t` and dualizes in the opposite direction. Behrend–Fantechi's construction, behrend-fantechi1997 lines 1583–1599, already has the correct cotangent direction. No change to the headline theorem or its construction is required.

Two findings: one P2 and one P3; one blocking. The original map-space rank, lci-dimension, obstruction-comparison and scheme-comparison repairs work on their counterexamples. The varying-rank pattern remains in the cone-stack dimension definition and its first Check. A sampled Kodaira–Spencer Check also reverses the tangent arrow. The prescribed Lean elaboration succeeds without diagnostics, and the dependency check reports zero problems. The four author files were not edited.

## Previous findings and repairs

This comparison was made before the new adversarial pass. Quotations below are from the current package.

| Previous finding | Status and repaired passage | Test of the repair |
|---|---|---|
| F01: global dimension substituted for varying rank | **Partly repaired.** §11.6, README:2601: “`rk E = χ(C_t, F_t^*T_X) = δ + ρ · (1 − g)`”; §9.2, README:1991: “each open and closed substack … has pure dimension `m + ρ`”. | Original counterexamples now pass: constant maps to `pt ⊔ ℙ¹` have ranks `(0,1)`, and the canonical smooth theories have dimensions `(0,1)`. Summary and Suggested.lean item 8 agree. The new rank decomposition in §10.2 gives degrees `(1,−1)`. Residual dimension-definition/Check occurrence: R01. |
| F02: unspecified obstruction comparisons | **Repaired.** §9.3, README:2027: “`φ_g` is bijective”; README:2029: “the composite `Φ_g ∘ can_g` … is an isomorphism of sheaves”. | With `φ=0` on `𝔸¹`, `φ_g=0:k→k`, and the null-isomorphism comparison identifies all lifts, so both revised conditions fail. With `φ=id`, `φ_g=id`. §9.1 specifies the sign, §11.4 carries this actual comparison through adjunction, and Suggested.lean item 5 agrees. |
| F03: localisation lemma cited as the scheme comparison | **Repaired.** §2.4, README:765: “Definition 8.1, tag 02QR”; README:766: “Definition 19.1, tag 02RW”. | Opened stacks-chow lines 752 and 1356. They give cycles and rational equivalence/Chow groups. `Spec k` gives `Z₀=ℤ`, `R₀=0`, `CH₀=ℤ`. References and the existing manifest key include both; Lemma 19.3 remains correctly cited for localisation. |

No finding marked not actionable in the repair report is re-raised. The previously settled ownership question concerning VirtualFundamentalClass and algebraic GromovWittenTheory remains the same human ownership decision; see the open-head audit below.

## Verified sound

Read all four author files, all **53 numbered targets in 11 layers**, the previous review and repair report, the board-package index, citation and overlap leads, and the pertinent supplier sections. Rechecked the **15 seeded targets**, every changed mathematical passage described in the repair report, and the surrounding uses of those changes. For unchanged assertions the previous review's **computed** rows were retained as evidence, not its blanket soundness claims. The compact table below records the sample, headline theorems, changed statements and both findings; additional unchanged controls explicitly identify inherited computations.

The original F01 repair correctly decomposes the target by tangent rank and the map space by the image component. Properness and flat finite presentation make the curve projection closed and open. Geometric connectedness includes nonemptiness at the pin, so these loci cover the base and are disjoint. The repaired cone-presentation consequence and the virtual-class construction use local ranks, and their sums have the common dimension `m+r`. The obstruction comparison now uses the actual morphism `φ`, not an abstract isomorphism of groups or torsors.

### Computed adversarial table

Unless specified, `k=ℚ`. These are computations on explicit instances, not substitutes for proofs of the planned general theorems. “Retain” means no repair on the tested instance. The unchanged computations also appear in the previous review; all changed and sampled rows were reconsidered against the current wording.

| Statement | Instances; values on the two sides | Result / change |
|---|---|---|
| §1.1 proper covers | For `G=S₃`, the atlas `pt→BG` has degree `6`; its base change is six points. Base-changing `id_pt` along `BC₂→pt` gives `BC₂`, whose point has automorphisms `C₂`, versus the trivial automorphism group of a scheme point. | Retain scheme-source qualification. |
| §1.4 function field/stabiliser | Sign action on `𝔸¹`: invariant field `k(x²)`, generic stabiliser `1`, origin stabiliser `2`. For `[Spec ℂ/C₄]` over `ℝ`: invariant field `ℝ`, stabiliser `2`, not `4`. | Retain invariant field and geometric kernel. |
| §1.5 degree and characteristic controls | `pt→BS₃→pt`: `6·(1/6)=1`. In the characteristic-`p` example `z=y^p` on the fixed divisor, degree is `p/p=1`; for `p=2,3`, respectively `2/2=1`, `3/3=1`. | Retain inseparable factor; no good-prime restriction. |
| §2.2 orders and boundary | Sign line: `ord₀(x²)=2`, coarse `ord₀(y)=1`. On `BG`, `W₋₁=k×` but `Z₋₁=0`; over `ℚ`, the nonidentity element `2` has boundary `0`. On `ℙ¹`, `deg div(t)=1−1=0`. | Retain the group/image distinction and nonzero-function domain. |
| §2.4 repaired comparison | `pt`: `Z₀=ℤ`, `R₀=0`, both Chow definitions give `ℤ/0=ℤ`. `𝔸¹`: `CH₀=0`, `CH₁=ℤ`. Doubled origin: relation `[0₁]+[0₂]=0`, group `ℤ`. | F03 repaired. |
| §§3.1–3.4 operations | `pt→BS₃`: pullback coefficient `1`, pushforward coefficient `6`, push–pull coefficient `6` on both sides. Coarse sign fibre has length `2`, so `2[Bμ₂]` pushes to `2·(1/2)[0]=[0]`. Localisation `ℤ→ℤ/2→0` has kernel `2ℤ` on its first map. | Retain integral/ rational domains and scheme-theoretic multiplicity. |
| §3.5 exterior product | Quadratic separable `K/k`: `K⊗K=K×K`, degree `4=2+2`. Purely inseparable degree `p`: tensor-product length `p`, degree `p²=p·p`, not `p`. Point factor gives coefficient `1`; empty factor gives `0`. | Retain. |
| §4.3 Gysin with scheme tests | Pull origin in `𝔸¹` back under `z↦z²`: fibre length `2`, Gysin class `2[pt]`. Test `pt→BS₃` against `pt`: fibre has six points, pushforward `6[pt]`. Identity of rank zero gives coefficient `1`. | Retain. |
| §4.4 canonical rational equivalence | Origin in `𝔸²`, `Y'=(y=0)`: boundary `[ν=0]−[η=0]`; rational function `cν/η`. Translating `ξ` leaves it fixed; translating `η` gives `cν/(η+b)`, different for `b≠0`. Identity cases have boundary `0` and constructed element `0`. | Retain restricted tangent invariance; inherited computed controls. |
| §5.1 homotopy invariance | Rank `0` gives identity. Rank `2` over a point sends `1∈A₀(pt)` to `[𝔸²]∈A₂(𝔸²)` and zero-section Gysin returns `1`. For `O(−1)` over `ℙ¹`, self-intersection is `−[pt]`, not `[ℙ¹]`. | Retain corrected 02TY locator and inverse. |
| §§5.2–5.3 Chern/product signs | `c₀(0)=1`, `c(Oⁿ)=1`. `L⊕L∨`: `c₁=a−a=0`, `c₂=−a²`; for `L=O(1)` on `ℙ²`, degree `−1`. On `ℙ¹`, `[pt]²=0`; on the sign quotient the stacky point times the unit has degree `1/2`. | Retain; inherited computed controls. |
| §6.1 coarse-space headline | For `BC₂, BS₃, BQ₈`, pushforward coefficients are `1/2,1/6,1/8`, inverses `2,6,8`; each composite is `1`. Sign line: rational comparison `0→0`, whereas integral groups are `ℤ/2` and `0`. | Retain rational comparison. |
| §6.2 equivariant headline | Free scalar action on `𝔸²−0`: `A₂^{Gₘ}=ℤ=A₁(ℙ¹)`; the unshifted `A₂(ℙ¹)=0`. Trivial group gives shift `0`. `Bμ_n` has equivariant `ℤ/n` in negative dimensions, killed by tensoring with `ℚ`. | Retain shift `i−dim G`. |
| §6.3 degree headline | `[Spec ℂ/C₄]`: `1/2=2/4`, not `1/4`. On the sign `ℙ¹`, relation has degree `2·(1/2)−1=0`. Inseparable point of degree `p` has degree `p`, not `1`. | Retain. |
| §7.1 recognition | Weight-two line has `S₁=0`, `S₂=k`, hence fails the linear-fibre condition. For `S'=A[w]/w²`, `S=S'[u]` with degree-one variables, fibre `A[u]`, presentation kernel `0`, so `C=D×𝔸¹`, also for `A=k[ε]/ε²`. | Retain repaired recognition; inherited computation. |
| §7.2 dimension definition/Check | `X=pt⊔ℙ¹`, `E=0⊔T_{ℙ¹}`: actual local dimensions of `BE` `(0,0)`, global dimension `0`; global `dim X=1` minus local ranks gives `(1,0)`. | R01: pointwise dimension followed by supremum. |
| §7.2 changed presentation consequence | For `𝒞=BT_X`, pure dimension `0`, and presentation `[X/T_X]`, the pulled-back cone is `X`; its component dimensions `(0,1)` equal `0+(0,1)`. | The repaired consequence at lines 1412–1414 is sound. |
| §§7.3–7.5 truncation and morphisms | `O[2]` has `H⁻²=O` but truncation `0`; `End(k[2])=k` maps to endomorphisms of the trivial Picard stack. `[k --id→ k]` yields a point; `[k --0→ k]` yields `𝔸¹×B𝔾_a`. `B𝔾_a→pt` is not representable, matching nonsurjective `0→k` on `h⁰`. | Retain truncation and representation criteria; inherited controls. |
| §8.3 derived pullback | For `A=k[ε]/ε²`, `Tor_n^A(k,k)=k` for all `n≥0`; ordinary pullback is only `k` in degree zero. The low-degree transitivity sequence is `k→0→k --id→ k→0→0→0`. | Retain sheaf/derived distinction. |
| §8.3 truncated transitivity | For `I=(xy,xz,yz)`, `xyz mod I²≠0` since degrees are `3<4`; with `t=x+y+z`, `tc=dc=0`. Derived pullback has nonzero `H⁻²` containing `kc`, while the truncation has `H⁻²=0`. | Retain truncation; no triangle claimed in this generality. |
| §8.4 normal sheaf | Closed point of dual numbers: truncation `k[1]`, normal sheaf `𝔸¹`, normal cone `Spec k[t]/t²`. Fat point `(x,y)²`: conormal length `7`, versus `9` for free rank three; normal-sheaf fibre dimension `3−2=1`. | Retain distinction between perfect truncation and lci. |
| §8.5 intrinsic-cone headline | Smooth `n`-fold: dimension `n−n=0`. `pt→BGₘ`: `dim B𝔾_a=−1=m`. For `I=x(x,y)`, the ideal is of linear type, so `C=N`, but at the origin depth `0<1=dimension`. | Retain vector-bundle-stack lci criterion; equality alone is insufficient. |
| §9.1 obstruction | Dual-number point lifts as `x↦aε`, a set parametrised by `k`. Lifting the identity to `k[ε]/ε³` would require `(ε+aε²)²=0`, but it is `ε²≠0`, also in characteristics `2,3`. Étale case: one lift, tangent group `0`. | Retain. |
| §9.1 changed canonical comparison | On the affine line with `h(x)=0`, lift `x↦bε` gives `can_g=-b`; translating by `c` gives `−(b+c)=−b−c`. With `J=0`, both sides are `0`. | Correct negative equivariance sign. |
| §9.2 changed lci dimension | Canonical smooth theory on `pt⊔ℙ¹`: ranks and dimensions both `(0,1)`. Closed point of dual numbers: perfect truncation has rank `−1`, while dimension is `0`; that map is not lci. | Original F01 occurrence repaired. |
| §9.3 characterisation headline | `φ=0` on `𝔸¹`: `Ext¹=0`, extensions `k`, but `φ_g=0:k→k` sends both `0,1` to `0`; specified sheaf comparison is not injective. `φ=id` gives `φ_g=id`. In characteristic `2`, `φ=(0,id)` on the dual-number complex kills an obstruction whose lift still has square `x²≠0`. | F02 repaired; tangent and obstruction requirements discriminate independently. |
| §9.4 basic example | Section `x²` on `𝔸¹`: complex `[A --2x→ A]`, rank `0`, zero locus length `2`; in characteristic `2` differential `0` but same length. Zero section of the trivial line gives `[O --0→Ω]`, rank `0`, obstruction `O`. | Retain; no regularity required of the section. |
| §10.1 resolutions | `E=0`, resolutions `[0→0]` and `[O --id→O]`: `K₁=𝔸¹_M`, kernels of projections have ranks `1,0`. For `[O(−4)→Ω_{ℙ¹}]`, derived extra automorphisms are `H¹(O(−2))=k`, but chain homotopies use `H⁰(O(−2))=0`. | Retain fibre-product comparison without a global chain map. |
| §10.2 changed class construction | On `pt⊔ℙ¹` with constant virtual rank `0`, term ranks vary `(0,1)`, cone dimensions `(0,1)`, and componentwise zero-section classes have degrees `(1,−1)`. Adding `[O --id→O]` at the point still gives degree `1`. | Correct finite rank-locus decomposition. |
| §10.3 independence headline | Add `[G --id→G]`, rank `g`: both bundle ranks increase by `g`; the cone gains `G∨`; inverse bundle pullback removes that factor. On the `ℙ¹` theory of §10.2 both choices give degree `−1`. | Retain. |
| §10.4 no/locally free obstructions | On `ℙ¹`, obstruction `O(−a)` gives degree `−a`. At a point, obstruction ranks `0,1,2` give classes `1,0,0`. On `pt⊔ℙ¹`, correct top-Chern exponents `(0,1)` give `(1,−1)`; a uniform exponent `1` would give `(0,−1)`. | Retain componentwise formula. |
| §10.5 product headline | Product of two `ℙ¹` theories of virtual degree `−1` gives degree `1=(−1)(−1)`, virtual dimension `0+0=0`. Point with zero theory multiplies by `1`. | Retain. |
| §10.6 pullback headline | Origin in `𝔸¹`, family `𝔸¹×Y`: Gysin gives `[Y]`, the fibre class. Identity pulls the supplied resolution to itself. Flat identity on dual numbers preserves cycle multiplicity `2`. | Retain global-resolution hypothesis and flat/nonreduced distinction. |
| §10.7 functoriality headline | `v(s,t)=st`: relative complex `[O --(t,s)→O²]`, rank `1`; graph codimension `1`, so `Γ^![𝔸³]=[𝔸²]`, matching the smooth canonical theory. Nodal base times `𝔸¹`: relative tangent rank `1`, absolute tangent fibre dimension `3` at the node. | Retain relative-tangent route; inherited computed witnesses. |
| §10.8 virtual counts | `M=B,E=0`: total class `[B]`, fibre counts all `1`. `ℙ¹×B` with smooth theory has fibre class in `A₁`, outside the degree-map domain. Rank-zero `ℙ¹` theory counts `−1`; `BG` counts `1/|G|`; regular `O(2)` section counts `2`. | Retain virtual-dimension-zero and sign conditions. |
| §11.2 duality | On `ℙ¹`, `RΓO=k` and `RΓω[1]=k`; `O(−1)` gives `0` on both sides. On a genus-`g` curve, `χ(L)=deg L+1−g`; `χ(ω)=g−1`. | Retain shift and quasi-coherent duality domain. |
| §11.3 Kodaira–Spencer Check | Constant maps to `𝔸¹`, coordinate `t=x/2`: construction sends `dx→2dt`; derivative sends `∂t→2∂x`; inverse tangent isomorphism sends `∂x→(1/2)∂t`. | R02: dualize the derivative, not its inverse. |
| §11.4 changed comparison route | Same scaled family: `φ_g(c)=2c`; the map on extensions takes `t=bε` to `x=2bε`, a bijection over `ℚ`. An isolated point carrying `id_{ℙ¹}` instead has dimensions `0→3`, not bijective. | Retain specified comparison and moduli hypothesis. |
| §11.5 global resolution headline | On `ℙ¹`, `V=O`, `L=O(1)`, `N=1`: `G=O(−1)²`, `H=O(−2)`, so `[R¹H→R¹G]=[k→0]`, Euler characteristic `1`. Embedded-point thickening has `H⁰(L^{-N})=k`, while plane double line has `0`. | Retain fibre-ample construction and reduced-fibre hypothesis. |
| §11.6 repaired rank headline | Constant maps into `pt⊔ℙ¹` have `(ρ,δ,g)=(0,0,0)` or `(1,0,0)`, giving ranks `0,1`. Lines in `ℙ²`: `3+(2−3)=2`; Calabi–Yau threefold: `0+(3−3)(1−g)+n=n`. | Original F01 map-space defect repaired. |

Unchanged definition controls additionally retained from the previous computed table: integral substacks versus closed images (`pt→BG`, fibre cardinality `|G|>1`); multiplicity `2` versus `1` for a square-zero thickening and its reduction; cone dualisation `C(O(1))=Tot(O(−1))`; the zero and translation actions on `𝔸¹`, whose quotients have respectively automorphism groups `k` and `0`; extension-by-zero lower cohomology with stalks `0` and nonzero; and local cotangent lengths `(1,1)` versus `(2,2)` for dual numbers outside/inside characteristic two. These controls concern unchanged assertions only.

### Seeded source audit

All locators below were read at the cached versions listed in the manifest. Printed pages are used for published scans; BF and Behrend pages are their recorded arXiv versions, not the journal pagination. There are **22 manifest entries**, **20 certified cached works** and **two settled uncertified books**. No additional work was needed, no source was fetched, and the manifest was not changed. There were no further author-flagged unverified locators requiring a request.

| Seeded target | Locator opened; hypotheses and support |
|---|---|
| 1.1 Proper covers | deligne-mumford1969 Theorem 4.12, printed p.101, line 1012: separated finite type over a Noetherian scheme, proper surjective generically finite cover open in a projective scheme. vistoli1989 Lemma 1.10, p.619, line 299 gives the integral dominating substack. The package's qualification on scheme sources after base change is correct. |
| 1.4 Function fields/generic stabiliser | vistoli1989 Definition 1.14, p.620, line 347; invariant-field example line 351; Lemma 1.13, line 337; generic inertia order p.622, line 422. The package's dense-open formulation allows its weaker quasi-separated convention; after shrinking an integral atlas, the quasi-finite unramified inertia is finite étale. The field and stabiliser tests above retain the kernel rather than the acting-group order. |
| 2.2 Orders/principal divisors | stacks-chow-spaces Lemma 13.2 (0EQ2), p.15, line 667; vistoli1989 Lemma 3.3 and descent, p.634, lines 940–959. Étale pullback preserves the divisor coefficients; the definition uses nonzero functions and codimension one. |
| 3.5 Exterior products | vistoli1989 p.655, lines 1707–1708 explicitly invokes the exterior product of Fulton §1.10. The latter is settled uncertified. SchemeAndStackFoundations §5.5 supplies the scheme operation, and §3.5 extends the cycle construction with lengths, including inseparable products. The precise Fulton text was not certified. |
| 4.3 Gysin homomorphisms | vistoli1989 Definition 3.10 and Theorems 3.11–3.13, pp.638–639, lines 1081–1123. Regular local embedding of codimension `d`, scheme test target, integral Chow groups and shift `−d` agree. The source's proof uses the canonical rational equivalence on integral ambient schemes, matching the reducedness used here. |
| 5.1 Homotopy invariance | vistoli1989 Lemma 5.5, p.654, lines 1671–1684 supplies the inverse identity; stacks-chow Lemma 36.3 (02TY), p.72, line 3445 supplies finite locally free **constant rank** `r`, shift `+r`. The proper-cover and push–pull route is stated explicitly. |
| 6.1 Coarse moduli spaces | vistoli1989 Definition 2.1, p.625, line 542; Propositions 2.4 and 6.1, pp.625 and 656–657, lines 571 and 1758. Properness and bijection on geometric-point classes are present; universal coarse-space properties are not substituted for them. keel-mori1997 Corollary 1.3, p.2, line 28 supports the separated-stack application, via the supplier's proper coarse map. |
| 8.4 Intrinsic normal sheaf | behrend-fantechi1997 Definition 3.6, p.27, line 902; local presentation p.28, lines 943–962; relative definition p.49, line 1652. The package states its own converse via smoothness of the presenting cone and does not infer lci merely from perfectness of the truncation. |
| 8.5 Intrinsic normal cone | behrend-fantechi1997 Lemma 3.8, Corollary 3.9, Definition 3.10 and Theorem 3.11, p.29, lines 969–986; relative pure dimension p.49, line 1656. The source's extra equivalence in Proposition 3.12, p.30, line 1010 is false; the package retains the correct vector-bundle-stack criterion and supplies a counterexample to equality alone. |
| 9.1 Square-zero extensions | behrend-fantechi1997 Propositions 4.1–4.2, pp.32–34, lines 1091–1137. The extension/null-isomorphism correspondence is constructed at lines 1110–1121. The revised map and its negative equivariance are consistent with the local homotopy calculation. |
| 9.4 Basic example | behrend-fantechi1997 p.45, lines 1503–1519: cartesian square, smooth `V,W`, regular embedding `Y→W`, complex `[g^*N∨→j^*Ω]`. Line 1518 explicitly extends it to DM stacks. A zero section is regular even when its pulled-back section is not regular. |
| 10.1 Global resolutions | behrend-fantechi1997 Definition 5.2, p.38, line 1282, and proof of Proposition 5.3, p.39, lines 1303–1312. The package avoids requiring a global chain-map representative by constructing the fibre product globally and comparing on affine étale charts. The non-chain-map example gives the stated `H¹(O(−2))=k`. |
| 10.3 Independence | behrend-fantechi1997 Proposition 5.3, pp.38–39, lines 1299–1320. Smooth bundle projections and zero-section pullbacks give the common class. The package's componentwise construction handles nonconstant presentation ranks. |
| 10.8 Virtual counts | Degree is §6.3 applied to §10.2. Deformation invariance uses §10.6 and proper/Gysin compatibility; behrend-fantechi1997 Proposition 7.2, p.50, lines 1682–1699 supplies the smooth-base version. The package explicitly gives the reduced-base extension through its relative tangent invariance; it does not attribute that stronger statement to the proposition alone. `m+r=0` is retained. |
| 11.3 Kodaira–Spencer morphism | behrend-fantechi1997 pp.47–48, lines 1583–1604, constructs the arrow from pulled-back differentials and duality. behrend1997 p.5, lines 148–153 supplies its relative use. The main construction agrees; the Check reverses the tangent comparison (R02). |

Also reopened the repaired §2.4 locators (stacks-chow Definitions 8.1 and 19.1, pp.17 and 30, lines 752 and 1356), the obstruction criterion (behrend-fantechi1997 Theorem 4.5, pp.35–36, lines 1162–1201), the global curve resolution (behrend1997 Proposition 5, p.6, lines 165–186), and the pointwise stack dimension definitions (stacks-properties Definitions 12.2–12.3, p.30, lines 1404–1417). The last directly confirms R01's repair.

### Pins, declaration resolution and headline completeness

The content checkout is main `38a5fb23`. The manifest pins Mathlib to `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti to `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the declarations below at those pins, including their bodies/signatures rather than relying on search names. File paths are relative to the relevant library repository.

| Pinned file and line | Input checked and its scope |
|---|---|
| `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,69`; `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean:52` | `AlgebraicCycle` is `Function.locallyFinsupp X R`; `map` requires a quasi-compact scheme map and dimension weights; `Scheme.ord` uses zero for the excluded coheights and zero function. |
| `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:61,319,324,546` | `Extension.cotangentComplex`, `toKaehler`, exactness and `H1Cotangent`: presentation-level linear map and homology, not a stack cotangent complex. |
| `Mathlib/RingTheory/Kaehler/JacobiZariski.lean:537,544,552`; `Mathlib/RingTheory/Kaehler/Basic.lean:781` | `H1Cotangent.δ`, `exact_map_δ`, `exact_δ_mapBaseChange`, `KaehlerDifferential.exact_mapBaseChange_map`; the sheaf terms use ordinary tensor, and the further left identification requires flatness. |
| `Mathlib/RingTheory/Smooth/Basic.lean:70,290,370`; `Mathlib/RingTheory/Derivation/ToSquareZero.lean:116` | `FormallySmooth` has projective differentials and vanishing first cotangent homology; split-injection and square-zero lifting criteria. `derivationToSquareZeroEquivLift` uses a specified lift/scalar tower. |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf/Abelian.lean:40`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74,87` | Abelian sheaf-module category, `HasDerivedCategory`, `DerivedCategory`. These ambient categories do not supply algebraic stacks. |
| `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`; `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:81`; `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49` | Small scheme étale topology; categorical pullback includes a specified isomorphism; `Pseudofunctor.IsStack` gives descent for Cat-valued pseudofunctors, without an algebraic or DM atlas condition. |
| `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40`; `Mathlib/AlgebraicGeometry/Geometrically/Basic.lean:46`; `Mathlib/Topology/Connected/Basic.lean:705` | Geometric connectedness tests every field-valued base change; `ConnectedSpace` explicitly contains `Nonempty`. This verifies the newly added supplier contract used in §11.6. |
| `TauCeti/AlgebraicGeometry/Chow/Basic.lean:86,257,295,304,369`; `TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean:211` | `cyclesOfDimension`, `RatEquiv`, `ChowGroup`, `cycleClass`, `ChowGroup.equivIntOfUnique`, `ChowGroup.pushforward`. Scheme carriers, locally Noetherian hypotheses where required; the last operation is for closed immersions. |
| `TauCeti/AlgebraicGeometry/AlgebraicCycle/Principal.lean:34,71`; `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`; `TauCeti/AlgebraicGeometry/CartierDivisor/Basic.lean:127` | Principal cycles require integral locally Noetherian schemes and units in the function field; line-bundle classes and Cartier divisors are scheme objects. |
| `TauCeti/AlgebraicGeometry/RelativeSpec/Graded.lean:93`; `TauCeti/AlgebraicGeometry/RelativeSpec/BaseChange.lean:272`; `TauCeti/AlgebraicGeometry/RelativeSpec/UniversalProperty.lean:349,455` | `gradedRelativeSpec`, `relativeSpecBaseChangeIso`, `CategoryTheory.CommMon.relativeSpecHomEquiv`, `relativeSpecHomIso`. The functor-of-points statement admits arbitrary test morphisms. |
| `TauCeti/AlgebraicGeometry/VectorBundle/LinearScheme.lean:175`; `TauCeti/AlgebraicGeometry/VectorBundle/LinearScheme/BaseChange.lean:52,99`; `TauCeti/AlgebraicGeometry/VectorBundle/Geometric.lean:221`; `TauCeti/AlgebraicGeometry/VectorBundle/TotalSpace.lean:130,229` | Contravariant `linearSpec`; `QuasicoherentLinearScheme.pullback`, `linearSpecPullbackIso`; covariant `totalSpace`, using the dual, with `totalSpaceHomEquiv` and `totalSpaceSchemeBaseChangeIso`. |
| `TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean:80`; `TauCeti/AlgebraicGeometry/VectorBundle/Rank.lean:125`; `TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:52` | `AlgebraicGeometry.Scheme.Modules.isFiniteLocallyFree`; rank has type `LocallyConstant X ℕ`; `isConstantRank` additionally requires equality at every point. |
| `TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean:84`; `TauCeti/AlgebraicGeometry/Curves/Prestable.lean:45,55`; `TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean:195`; `TauCeti/AlgebraicGeometry/Stack/Basic.lean:37` | Big fpqc structure sheaf; proper geometrically connected nodal scheme families; algebraic-space sheaves, with **no** separation field; `SchPseudofunctor`, with **no** algebraic-stack atlas predicate. |

The eight unresolved-name leads are supplier-roadmap names, not missing pinned declarations: `Stack.stackification`, the `IsDeligneMumford` suffixes, four scheme Chow names, and `Algebra.CotangentComplex.homologyOneIso`. They resolve in the supplier table below. No backticked identifier is falsely attributed to this roadmap: its mathematical notation is distinguished from library/supplier declaration names by Convention 9, and it promises no own Lean declaration.

The README's headline inventory agrees with the eight items in `Suggested.lean`:

| Headline | Module-docstring item and why no native statement exists |
|---|---|
| Coarse-space comparison (§6.1) | 1: missing DM-stack, stack-Chow and proper stack-pushforward carriers. |
| Equivariant comparison (§6.2) | 2: also missing quotient-stack and equivariant Chow carriers. |
| Degree of zero-cycles (§6.3) | 3: missing integral stack substacks, generic fields/stabilisers and rational pushforward. |
| Intrinsic cone, pure dimension, lci criterion (§8.5) | 4: missing stack cotangent/cone-stack and dimension carriers. |
| Characterisations of obstruction theories (§9.3) | 5: same geometric carriers and `h¹/h⁰`; the revised specified comparisons are named. |
| Virtual class and resolution independence (§§10.2–10.3) | 6: missing cone-stack and stack zero-section Gysin carriers. |
| Virtual-class properties and counts (§§10.4–10.8) | 7: also stack Chern/bivariant operations; global resolutions are explicit. |
| Curve-map obstruction theory, resolution and rank (§§11.4–11.6) | 8: missing stack map-space and relative derived pushforward/duality carriers; component rank `ρ` is explicit. |

Object searches of both pinned libraries found scheme Chow/relative-Spec objects, analytic normal spaces and topological virtual-class references, but no algebraic stack/cone-stack carriers making these headlines statable. The allowed few simple definitions cannot construct those missing theories. Accordingly `Suggested.lean` correctly has **zero definitions, zero theorems and zero examples**. The exhaustive one-tactic padding probe has **zero sorried theorems** to test; the `#check @name` binder inventory likewise has **zero declarations**, so no binder changed or disappeared. The single import is `Mathlib`; there are no Tau Ceti imports to build, sorry'd data, stand-ins or `set_option`.

Ran the prescribed `lake env lean` command on `packages/VirtualFundamentalClasses/Suggested.lean` from the pinned content checkout: **exit 0, no output, no errors or warnings**. This verifies the import/file form, not the truth of the README's mathematics.

### Supplier, ownership and overlap audit

Every supplier section and every Needs line was compared with main or the supplied permitted head. The main-branch roadmaps AlgebraicVectorBundles, DerivedModuleAlgebra and SchemeAndStackFoundations were also read for house shape. The following are resolved citations, not inferred ownership from names.

| Supplier on main | Locations opened and objects resolved |
|---|---|
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:923` (§0.7, former-name map to pinned local dimension); `:2145` (§1.1 descent); `:2422` (§1.10 algebraic-space sites); `:2849,2923,2949,3055,3092,3124` (§§1.18–1.23 stackification, DM/algebraic structure, inertia/properness, quotient stacks, QCoh, coarse spaces); `:3554,3719,3772,4104,4265,4452` (§§2.6,2.9,2.10,2.18–2.20 affine vanishing, big-site modules, topology comparison, derived QCoh and duality); `:4917,5305,6037` (§§3.3,4.1,4.15 degrees/Riemann–Roch, lifting, curve stacks); `:6902,7000,7065,7109,7253` (§§5.1,5.2,5.4–5.6 scheme Chow and operations). The eight-name leads resolve here except the cotangent alias below. |
| AlgebraicVectorBundles | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:145,345` fixed-rank carrier and former-label mapping for L0B/L1A/L2A/L2B to pins/current sections. `:807` distinguishes the weight grading/module-scheme recognition from this package's relative cone splitting. No duplicate linear-spectrum construction is declared here. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:43` maps former names including `homologyOneIso`; `:1398,1463,1533,1588,1761` resolves §§0.7,0.8,0.10,0.13,0.25. These are ring-level cotangent and obstruction inputs, not a stack cotangent object. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:441,534,580`: §0.2, E1.2, E1.4 supply K-flat/K-injective replacements and ringed-topos derived tensor, Hom, pullback and pushforward. |
| StableReduction | `TauCetiRoadmap/StableReduction/README.md:405,467`: Layers 2–3 supply proper curve cohomology/base change, nodal duality, relative ampleness and prestable-family API. |
| EllipticCohomology | `TauCetiRoadmap/EllipticCohomology/README.md:207`: E1 owns the two elliptic-stack sites/module categories; §7.3 expressly agrees with them. |
| EquivariantIntersectionTheory | `TauCetiRoadmap/EquivariantIntersectionTheory/README.md:371,378,405`: §§2.1–2.2 and standing smooth-affine-group/quasi-projective-linearized hypotheses; approximation degree `i+l−g`, operations and ring product. |

The new geometric-connectedness citation resolves to the pinned definition, including nonempty fibres, as recorded above. No forbidden supplier, upward citation, undeclared supplier gap or newly broken section citation was found. A named roadmap's unimplemented target was treated as a contract, not as a missing library declaration.

Read the board-package index before searching for owners. Searched the board packages and the main/open-head index by mathematical objects (intrinsic cones, perfect obstruction theories, virtual classes, cone stacks, stack Chow/bivariant theory and stack sites), and opened the closest heads with `roadmaps show`:

- **PR #1996, VirtualFundamentalClass:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:199`–205 and Layers 4–7 still own the overlapping algebraic core. This is the previously settled ownership question; its facts have not changed, and it is not re-raised as a package finding.
- **PR #1998, GromovWittenTheory:** `TauCetiRoadmap/GromovWittenTheory/README.md:256`–269 still builds the stable-map obstruction theory and global resolution. This is the same settled overlap. The separate **PR #990** head with the same roadmap name is symplectic Gromov–Witten theory and is not that algebraic owner; the two heads were distinguished explicitly.
- **PRs #1808, #1656 and #1854, SchemeAndStackFoundations:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:47,46,46`, respectively, restrict their geometric Chow operations to schemes. Their normal-cone/Gysin sections remain scheme inputs, not a second DM-stack virtual-class construction. Main, not these revisions, is consumed.

The supplied overlap facts list no other head changing this roadmap, no dropped cited id and no citation existing only in an open revision. Inspection gives no additional such finding. No target ids were dropped by these repairs. No fully qualified Lean declaration can collide with this package's empty namespace. No ownership claim was made about an open head whose files were not provided through the supplied index/tools.

Prescribed dependency-check output:

```text
depcheck: 236 roadmaps, 2136 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No order file was changed.

### Shape and policy checks

The README has Summary, Scope, Conventions, Exact supplier contracts, build guide, all eleven numbered layers, Examples and Dependencies per layer, consumers and references. Definition-bearing targets have APIs and at least three Check bullets. The only subsections with two Checks are theorem-only §§10.3, 10.5 and 11.5. The two reported mathematical defects are not excused by that count.

The layers are named by their mathematics. Dependencies force the cycle/Gysin/comparison and cone/cotangent/obstruction/virtual-class chains; the independent comparison branch is identified as such. The construction and later consequence of §4.4 are separated, so their displayed return edge does not make the construction depend on itself. Naming a source proof route in §4.3 is not a source-chapter organisation of the roadmap. No source-chapter layer title or instruction to reproduce a source's expository sequence was found.

No route-specific prime restriction, computational algorithm, copied source passage, process residue, machine path, HTML anchor, forbidden Lean import, own backticked missing declaration, sorry'd data or `set_option` was found in the author files. Sources remain under their original manifest keys. Metadata is `topic = "math.AG"`; no supplier gaps are declared. Apart from the settled open-ownership decision, this is a general stack intersection/virtual-class library rather than a shortcut for a single moduli problem.

## Not verifiable

- **gillet1984 §4:** settled uncertified, text not available here. Vistoli's readable restatement supplies partial independent evidence; no repeat source request was made.
- **fulton1998 §1.10, Corollary 6.3, Proposition 8.1.1, Appendix B.6.6:** settled uncertified, precise book text not read. In particular the sampled exterior-product book locator is not certified by this review. Readable Vistoli/BF passages, the named scheme supplier and explicit computations were checked separately.
- The empty acceptance file cannot mechanically prove the stack headlines. The pinned carriers needed to state them are absent; the module docstring accurately records this limitation.

## Source issues

These source defects were confirmed while opening this round's sampled locators; other source errata from earlier rounds were not used as new findings against the package.

- **Error** in behrend-fantechi1997 at Proposition 3.12, arXiv v1 p.30 (line 1010): the source says equality of intrinsic cone and normal sheaf implies local complete intersection; it should require the cone to be a vector bundle stack; affects a stated result.
- **Misprint** in behrend-fantechi1997 at proof of Proposition 6.2, arXiv v1 p.48 (line 1609): the source says the base Ext group is over the curve; it should be over the test scheme T, in the same degree; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "091edb729a4f14af37fb3c990c7485372406be4c", "job": "REV-PKG-VirtualFundamentalClasses~4", "model": "gpt-6-astra", "worker": "chris-4"} -->
