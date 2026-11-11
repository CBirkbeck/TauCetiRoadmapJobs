<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13006#issuecomment-6795561313 -->
Review (codex) of 8c00d60

Verdict: needs_changes

1. **F01** (P3) The Chow-group Check only kills rational closed points

   **Location:** `packages/VirtualFundamentalClasses/README.md:768`: “`div(x² − a) = [V(x² − a)/μ₂]` for `a ≠ 0` makes every other closed point `0`”.

   **Claim:** these linear polynomials in the coarse coordinate kill every closed point away from the stacky origin over the arbitrary base field of the conventions.

   **Witness:** Over `k = ℚ`, the closed point `W = [V(x⁴+1)/μ₂] ≅ Spec ℚ(i)` lies over `y²+1 = 0`, where `y=x²`. It occurs in none of the displayed divisors with `a∈ℚ`.

   **Exact repair:** replace the linear-polynomial argument by all monic irreducible polynomials `P(y)∈k[y]` other than `y`. Away from the origin the quotient is `𝔾_m` with coordinate `y=x²`, and `div(P(x²)) = [V(P(x²))/μ₂]`, with coefficient one. Keep `div(x²)=2[Bμ₂]` and the conclusion `A_0≅ℤ/2`. Add the degree-two closed point as a Check; do not impose algebraic closedness on the general theory.

   **Repair tested:** `P(y)=y²+1` gives `div(x⁴+1)=[W]`, with coefficient `1` at `W` and `0` at the origin. Thus `[W]=0`; the coefficient at the origin of every invariant principal divisor remains even. The computed Chow group is unchanged. This is an incomplete Check argument, not a false Chow-group theorem.

2. **F02** (P3) The integral-pushforward counterexample includes the trivial group

   **Location:** `packages/VirtualFundamentalClasses/README.md:864`: “There is no integral pushforward for `BG → Spec k`”.

   **Claim:** the equation `|G|·c=1` obstructs integral pushforward for every finite constant group permitted by the conventions.

   **Witness:** For `G=1`, `BG=Spec k` and the morphism is the identity. Its integral pushforward is the identity, with `c=1` and `1·1=1`.

   **Exact repair:** say “For a nontrivial finite constant group `G`, there is no integral pushforward … compatible with functoriality and the representable pushforward of 3.2.” Retain the equation and explicitly include `G=1` as the positive control.

   **Repair tested:** for `C₂`, `2c=1` has no integer solution; for `S₃`, `6c=1` has none; for `1`, `c=1` gives the identity. The rational formula of 3.3 already gives respectively `1/2`, `1/6`, and `1` and needs no change.

3. **F03** (P3) A finite étale group need not have as many closed points as its degree

   **Location:** `packages/VirtualFundamentalClasses/README.md:1038`: “(`G` finite étale)”; `:1039`: “the sum of its `|G|` points”.

   **Claim:** the fundamental cycle of every finite étale group consists of `|G|` closed points, each contributing degree one.

   **Witness:** Over `ℝ`, `μ₃=Spec(ℝ[t]/(t³−1))=Spec ℝ ⊔ Spec ℂ`. There are two closed points, while `|μ₃|=3`. Their residue degrees are `1` and `2`.

   **Exact repair:** retain the finite étale generality. Write `[G]=Σ_z[Spec κ(z)]`, over the closed points of `G`, with coefficient one, and its pushforward `Σ_z[κ(z):k]·[Spec k]=|G|·[Spec k]`. Only for split `G` is this a sum of `|G|` rational points. Qualify the final “not `[Spec k]`” by `|G|>1`, consistently with R02, and add the nonsplit example.

   **Repair tested:** for `μ₃/ℝ`, Gysin gives `[Spec ℝ]+[Spec ℂ]` and pushforward gives `(1+2)[Spec ℝ]=3[Spec ℝ]`. For the split constant group of order three there are three degree-one terms; for the trivial group there is one. The Gysin identity itself is correct.

Three P3 findings, all in Checks; no P1 or P2 finding. The previous three findings are repaired. The prescribed Lean elaboration passes without output, and the dependency check reports zero problems. The author files, including the sources manifest, were not changed.

## Verified sound

### Previous findings, checked before the new pass

| Previous finding | Status and repaired passage | Test of the repair |
|---|---|---|
| F01: hypothesis on the entire stack of maps | **Repaired.** `packages/VirtualFundamentalClasses/README.md:2497`: “`M ⊆ Mor_𝔅(𝒞, X)` that is a separated DM stack over `k` (Convention 1: in particular of finite type)”. | For the doubled-origin line `𝔅` and target point, `Mor=𝔅`: `M=𝔅` is excluded, but either chart `M=𝔸¹` is included and étale over `𝔅`. Nilpotent thickenings have the same underlying space, so maps reducing into an open factor through it. |
| F02: six supplier names absent from the contracts | **Repaired.** `README.md:264`: “`topologicalKrullDim`”; `:374`: “`setoid_criterion`”; `:391`: “`DQCoh`”; `:392`: “`DQCoh.affineEquiv`”; `:414`: “`deformationToNormalCone`”; `:415`: “`specialization`”; `:417`: “`commutes_with_c1`”. | The Mathlib definition is at `Mathlib/Topology/KrullDimension.lean:37`; the other names resolve on main in `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2953,4120,7123,7144,7157`. No remaining contract omission of this pattern was found. |
| F03: affine diagonal absent from headline 4 | **Repaired.** `packages/VirtualFundamentalClasses/Suggested.lean:47`: “`M` with affine diagonal (README, Convention 8)”; `:54`: “For `M → 𝔐` as in 4”. | The plane with doubled origin has an overlap `𝔸²∖{0}`, which is not affine. It is now excluded both here and in Layer 8. Headlines 6–8 assume separatedness, which supplies affine diagonal. |

The changed summary, scope, supplier contracts, module docstring and all of §11.1 were reviewed again. The new §11.1 controls also work: `Mor_d(ℙ¹,ℙ¹)` has dimension `2d+1`, whereas its union over all `d≥0` is not quasi-compact; the constant genus-zero map has automorphism group `PGL₂` of dimension three; degree-`p` Frobenius has the infinitesimal translations `α_p` since `(x+a)^p=x^p` for `a^p=0`. The bound `d<p` excludes that example and agrees with behrend-manin1996 Theorem 3.14, lines 1009–1022, preprint p. 25. This bounds the stable-map example, not the general theory of relative spaces of maps. The earlier pointwise-dimension and cotangent-arrow repairs were also retested below.

Read all four author files: README, 2,794 lines and 53 numbered targets in 11 layers; Suggested.lean, 100 lines and zero declarations; metadata.toml; sources.toml, 22 works. Earlier-round evidence was used only where it contained computed values, and all 15 seeded targets and eight headline families were checked again. The following compact table records computations, including the three Check defects. A “keep” result means no change indicated by these instances, not a Lean proof of the theorem.

### Adversarial computations

| Statement | Instances tried | Values computed on the two sides / negative control | Result and change |
|---|---|---|---|
| 1.1 proper covers | `Spec k→BS₃`; base change through `B(C₂)` | Cover degree `6`; the base change of the identity point through `B(C₂)→pt` is `B(C₂)`, whose stabiliser has order `2`, not a scheme. | Keep the distinction between scheme covers and arbitrary base changes. |
| 1.2 substacks and multiplicities | `BG`; `V(x²)` and `V(x²−1)` in the sign quotient | Closed substacks of `BG` are empty and `BG`; `pt→BG` has fibre `G`, so is not an immersion for `G≠1`. Lengths at the origin are `2` and `1`; the free orbit has quotient `pt`. | Keep. |
| 1.3 dimension | `BS₃`, sign quotient, smooth atlas, disconnected and empty schemes | Dimensions `0`, `1`; chart `𝔸¹→pt` gives `1−1=0`; `B𝔾_m` gives `0−1=−1`; `pt⊔ℙ¹` has pointwise dimensions `0,1` and supremum `1`; empty supremum `−∞`. | Keep étale-chart dimension and local rank subtraction. |
| 1.4 function fields and inertia | Sign quotient; `[Spec ℂ/C₄]` over `ℝ`; `BS₃`; constant `C_p` in characteristic `p` | `k(x)^{μ₂}=k(x²)`, generic inertia `1`, origin inertia `2`; nonneutral gerbe has field `ℝ`, inertia `2`, acting group order `4`; `BS₃` has field `k`, inertia `6`; constant `C_p` is étale of degree `p`. | Keep; no tameness restriction. |
| 1.5 degree | `pt→BS₃→pt`; wild quotient along `x=0` | `6·(1/6)=1`; invariant `z=y^p−x^{p−1}y` restricts to `y^p`, so residue degree `p` divided by stabiliser ratio `p` is `1`. | Keep inseparable residue degree. |
| 2.1 cycles | Empty stack, `BG`, doubled stacky point | `Z_i(∅)=0`; `Z_0(BG)=ℤ`, negative groups `0`; length two thickening has cycle `2[Bμ₂]`, reduced point `1[Bμ₂]`. | Keep. |
| 2.2 divisor orders | `x²`, unit `1`, and dimension-zero stacks | Stacky order `2` versus coarse `ord_0(y)=1`; unit order `0`. `W_{−1}(BG)=k×`, boundary `0`, so the domain is not replaced by its image. | Keep; no order at a zero rational function is used. |
| 2.3 Chow quotient | Sign quotient over `ℚ`; point over `y²+1` | Origin coefficients `2ℤ`; all other points are killed by irreducible `P(y)`, yielding `ℤ/2`. The displayed linear family contributes `0` at the degree-two point. | R01; repair gives coefficient `1` there. |
| 2.4 scheme comparison | `pt`, `𝔸¹`, doubled-origin line | `CH_0(pt)=ℤ`; `CH_0(𝔸¹)=0`, `CH_1(𝔸¹)=ℤ`; doubled line `CH_0=ℤ`, with `[0₁]+[0₂]=0`. | Keep nonseparated scheme coverage. |
| 3.1 flat pullback | Atlas of `BS₃`; affine-line projection | Atlas pulls `[BS₃]` to `[pt]` with coefficient `1`, not `6`; line projection shifts cycle dimension by `+1`. | Keep. |
| 3.2 representable pushforward | Atlas of `BS₃`; closed immersion | Atlas sends `[pt]` to `6[BS₃]`, hence push–pull is multiplication by `6`; closed immersion coefficient `1`. | Keep. |
| 3.3 rational pushforward | `BS₃`, `B(C₂)`, `B1`; sign quotient | Composites `6/6=1`, `2/2=1`, `1/1=1`; relation pushes to `2·(1/2)[0]=[0]`. Integral obstruction fails at `G=1`, where `c=1`. | R02 only; rational theorem retained. |
| 3.4 push–pull and localisation | Atlas self-square; stacky origin and its complement | Self-fibre product has `6` points, both routes give `6`; localisation `ℤ→ℤ/2→0` has first map reduction modulo two and kernel `2ℤ`. | Keep; Convention 3 supplies proper covers wherever rational pushforward is invoked. |
| 3.5 products | Quadratic separable and degree-`p` purely inseparable fields | Separable `K⊗K=K×K`, total degree `4=2+2`; inseparable tensor has one component, multiplicity `p`, residue degree `p`, total `p²`. | Keep scheme-theoretic multiplicity. |
| 4.1 cones | Zero and rank-one sheaves; `O(1)`; reducible quadratic cone | `C(0)=M`, `C(O)=𝔸¹_M`; `C(O(1))` is the total space of `O(−1)`, degree `−1`; cone `xy=0` has abelian hull `𝔸²`. | Keep contravariant `Spec Sym` convention. |
| 4.2 normal cones | Diagonal of `BG`; `(x,y)²` in `𝔸²` | Diagonal fibre `G`, regular local embedding of codimension `0`; fat-point normal cone dimension `2`, normal-sheaf fibre dimension `3`. | Keep; normal cone and normal sheaf differ. |
| 4.3 Gysin | `z↦z²`; zero section of `O(−1)`; `μ₃/ℝ` | Origin pullback `2[pt]`; self-intersection `−[pt]`; nonsplit group has two closed components with pushforward `1+2=3`. | R03 changes point counting, not Gysin. |
| 4.4 rational equivalence | Origin in `𝔸²`, divisor `y=0`; tangent translations | Representative `cν/η`; translation in `x` leaves it unchanged; translation in `y` gives `cν/(η+b)`, different. Identity comparison has `β=0`, boundary `0`. | Keep restricted tangent invariance and reduced ambient hypothesis. |
| 4.5 bivariant classes | Identity; atlas of `BS₃`; zero section | Identity acts by `1`; atlas orientation pulls to coefficient `1`; zero section satisfies `s^![E]=[M]`, cancelling rank shifts `+r−r=0`. | Keep. |
| 5.1 homotopy | Rank zero; `O(−1)` on `ℙ¹`; adding a trivial summand | Rank-zero pullback and inverse are identities; `s^!s_*[ℙ¹]=−[pt]`; an extra rank `g` changes degrees by `+g−g=0`. | Keep. |
| 5.2 Chern classes | `L⊕L∨`; `O(−1)`; `BG` rationally | `c₁(L)+c₁(L∨)=0`, `c₂(L⊕L∨)=−c₁(L)²`; degree `−1`; positive-degree rational classes on finite `BG` vanish. | Keep dual and sign conventions. |
| 5.3 products on smooth stacks | `ℙ¹`; `BG`; stacky point | On `ℙ¹`, `[pt]²=0` and `[ℙ¹]` is the unit; rational ring of finite `BG` is `ℚ`; stacky degree is `1/2`. | Keep. |
| 6.1 coarse comparison (headline) | `BG`; sign quotient; wild example | Pushforward factor `1/\|G\|` is rationally invertible; integral `ℤ/2→0` becomes `0→0` rationally; wild factor `p/p=1`. | Keep general characteristic. |
| 6.2 equivariant comparison (headline) | Free `𝔾_m` action on `𝔸²∖0`; `μ_n`; trivial group | `A²` index `i=2`, `g=1` gives `A_1(ℙ¹)=ℤ`; integral negative equivariant groups of `Bμ_n` are `ℤ/n`, rationally `0`; trivial group shift `0`. | Keep rational coefficients and dimension shift `i−g`. |
| 6.3 degrees (headline) | `BS₃`; finite field extension; nonneutral gerbe; stacky `ℙ¹` | Values `1/6`, `[K:k]`, `2/4=1/2`; principal divisor has degree `2·(1/2)−1=0`. | Keep. |
| 7.1 hulls and exact cones | Split sequence; weight-two affine line; `α_p` | `0→𝔸¹→𝔸²→𝔸¹→0` reverses the coherent-sheaf sequence; weight two has `S₁=0`, `S₂=k`, excluded by the linear-fibre hypothesis; `α_p` is a group cone but not an abelian cone. | Keep the strengthened recognition criterion. |
| 7.2 cone stacks | `BE` over `pt⊔ℙ¹`; translation and trivial actions | With `E=0⊔Tℙ¹`, local dimensions `(0−0,1−1)=(0,0)`; `[𝔸¹/𝔾_a]` is `pt` for translation and `𝔸¹×B𝔾_a` for the trivial action, both dimension `0` but different stabilisers. | Keep presentation laws, not dimension alone. |
| 7.3 complexes | `O[1]`, `O[2]`, `O[−1]`; extension by zero | `O[1]` has rank `−1`; `O[2]` has nonzero `h⁻²` but zero truncation; `O[−1]` has nonzero `h¹` and violates `(⋆)`. Extension by zero has stalk `0` at the omitted point and nonzero generic stalk, detecting failure of quasi-coherence. | Keep stated cohomological range. |
| 7.4 `h¹/h⁰` | Identity and zero differentials; shifts | `[k --id→k]` gives `pt`; `[k --0→k]` gives `𝔸¹×B𝔾_a`; `O[1]` gives `𝔸¹`, `O[0]` gives `B𝔾_a`. Maps of `k[2]` have endomorphisms `k`, whereas the truncation is zero. | Keep; no unjustified faithfulness outside the two-term range. |
| 7.5 morphisms of cone stacks | Inclusion and projection between zero-differential complexes | Inclusion has `h⁰=id` but `h⁻¹:0→k` not surjective; dual gives a projection, not a closed immersion. Reverse map gives a zero section, which is closed. | Keep both directions of the criterion. |
| 8.1 relative embeddings | Dual-number point; atlas of `BG` and its product | Local complex `[A --2x→A]`; in characteristic two differential `0`. For `(pt,pt)` over `BG`, complex `0`; product chart `(G,pt)` also gives `0`. | Keep affine diagonal and relative chart hypotheses. |
| 8.2 truncated cotangent | Dual numbers; fat point `(x,y)²` | In characteristic not two, dual-number `h⁻¹=h⁰=k`; in characteristic two both are `A`. Fat point: lengths of conormal and differentials `7,6`, image length `3`, cohomology lengths `4,3`. | Keep; nonfree conormal is not replaced by a free rank-three module. |
| 8.3 base change and transitivity | Node over `𝔸¹_x`; finite flat square; origin in `𝔸¹`; product | Nonflat fibre gives `[k[y] --0→k[y]]` with `h⁻¹=k[y]`, whereas the fibre's smooth cotangent has `h⁻¹=0`; flat `t²` square gives `[A --2t→A]` on both sides; transitivity includes `k --id→k`; product differential is `diag(2x,2y)`. | Keep flatness and derived pullback. |
| 8.3 truncation control | Three axes, `I=(xy,xz,yz)`, `t=x+y+z` | Class `xyz` is nonzero in `I/I²` (degree three versus minimum degree four in `I²`), but `t·xyz=0`; derived pullback creates nonzero degree `−2` cohomology. | Keep warning against an untruncated two-term transitivity triangle. |
| 8.4 intrinsic normal sheaf | Smooth disconnected example; fat point; point in dual numbers | `BT` has local dimensions `(0,0)`; fat normal fibre `[𝔸³/𝔸²]` dimension `1`; point in dual numbers has truncated complex `k[1]`, normal sheaf `𝔸¹`, but normal cone `Spec k[t]/t²`. | Keep: perfect truncation need not imply lci. |
| 8.5 intrinsic cone (headline) | Varying chart dimensions; `pt→B𝔾_m`; fat point | `(1−1,2−2)=(0,0)`; over `B𝔾_m`, cone dimension `−1=m`; fat point intrinsic cone dimension `0`, normal sheaf dimension `1`. | Keep pure-dimension calculation pointwise. |
| 8.5 lci criterion (headline) | `I=x(x,y)` in `k[x,y]` | `Sym(x,y)=k[x,y,T₁,T₂]/(yT₁−xT₂)` is the three-dimensional Rees domain; scaling generators gives `C=N` for `I`, but the quotient has depth `0<1=dim`. | Keep vector-bundle-stack criterion; equality alone is insufficient. |
| 9.1 obstructions and sign | Dual to triple numbers; affine-line lift `x↦bε` | `(ε+aε²)²=ε²≠0`, so no lift; canonical trivialisation has value `−b`, and translation by `c` gives `−b−c`, as `can_g(δ·ḡ)=can_g(ḡ)−δ`. | Keep sign and canonical map. |
| 9.2 obstruction theories | Smooth `ℙ¹`; point in dual numbers; zero theory | `[O(1)→Ω]` has rank `0` and obstruction bundle `O(−1)`; point in dual numbers has perfect rank `−1` but is not lci; zero theory requires both cotangent cohomology groups zero, the étale case. | Keep distinction between obstruction theory and cotangent perfectness. |
| 9.3 characterisations (headline) | Zero comparison on `𝔸¹`; characteristic-two bad map | Comparison `k→k` is zero, not bijective, despite abstract isomorphic torsors; in characteristic two pulled-back obstruction can be `0` while a lift would require `x²=0` in `k[x]/x³`, where it is nonzero. | Keep the maps induced by `φ`; no arbitrary-torsor stand-in. |
| 9.4 zero-locus theory | `s=x²`; zero section | `[A --2x→A]`, rank `0`; for zero section on `𝔸¹`, obstruction sheaf `O` and virtual dimension `0`; regular zero locus gives its ordinary lci theory. | Keep. |
| 10.1 global resolutions | Zero complex with an acyclic summand; nonaffine comparison | Common atlas for `[0→0]` and `[O --id→O]` is `𝔸¹`, kernel ranks `1,0`. On `ℙ¹`, `Ext¹(Ω,O(−4))=H¹(O(−2))=k`, while chain homotopies have `H⁰(O(−2))=0`. | Keep stack fibre-product comparison; arbitrary derived isomorphisms need not be chain maps. |
| 10.2 virtual class (headline) | `[O(1)→Ω]` on `ℙ¹`; disconnected ranks | Virtual degree `−1`, whereas using the wrong dual gives `+1`; on `pt⊔ℙ¹` components give degrees `(1,−1)`; negative Chow dimension gives zero. | Keep duals and grading `m+r`. |
| 10.3 independence (headline) | Add `[G --id→G]`, rank `g`; zero-complex presentations | Cone dimension increases by `g`, zero-section codimension increases by `g`, net shift `0`; the two presentations of zero give class `1=1`. | Keep comparison through vector-bundle torsors. |
| 10.4 obstruction formula | `Ob=0`; `Ob=O(−a)` on `ℙ¹`; dual-number point | Smooth unobstructed class `[M]`; degree `−a`; dual-number fundamental cycle `2[pt]`, obstruction module `A/(x)` nonfree, so the vector-bundle formula does not apply. | Keep all hypotheses. |
| 10.5 products (headline) | Two `ℙ¹` theories; point factor | Virtual degrees `(−1)(−1)=1`; point factor multiplies by `1`; grading is `(m+r)+(m′+r′)`. | Keep. |
| 10.6 pullback | Product family over `𝔸¹`; identity; nonreduced base | Fibre Gysin gives `[Y]` on both sides; identity gives the original class; flat branch permits nonreduced bases, regular-embedding branch requires the stated reduced base. | Keep the separate branches. |
| 10.7 functoriality (headline) | `v(s,t)=st`; identity; derived compatibility | `L_v=[O --(t,s)→O²]`; graph is codimension one, `v^![𝔸¹]=[𝔸²]` in dimension `1+2−1=2`; identity with `F=E` preserves the class. Nonzero extension `H¹(O(−2))=k` prevents assuming every compatible triangle is a global chain diagram. | Keep the repaired proof route and reduced-base restrictions. |
| 10.8 counts (headline) | Regular section of `O(2)` on `ℙ¹`; `BS₃`; trivial family over a curve | Counts `2`, `1/6`, and `1` on every fibre respectively; a `ℙ¹` fibre with virtual dimension `1` is excluded from the zero-dimensional count. | Keep. |
| 11.1 relative spaces of maps | Doubled origin; degree components; prestable genus zero; Frobenius | Allowed chart has étale relative dimension `0`; whole doubled line excluded; `dim Mor_d=2d+1`; constant map has automorphism dimension `3`; degree-`p` Frobenius has infinitesimal stabiliser `α_p`. | Previous F01 repaired; no further change. |
| 11.2 duality | `ℙ¹`, general genus, rational nodal curve | `χ(O)=1`, `χ(ω)=−1`; `χ(L)=deg L+1−g`; one self-node contributes two branches, giving dualising degree `−2+2=0`. | Keep shift `[1]` and nodal duality. |
| 11.3 Kodaira–Spencer | Coordinate `x=2t` over `ℚ` | Tangent map multiplies by `2`; its dual sends `dx↦2dt`, also `2`, not inverse `1/2`. | Keep corrected direction. |
| 11.4 map obstruction theory (headline) | `ℙ¹→ℙ^r`; elliptic translations; isolated identity | `h¹=0`, `h⁰=(r+1)d+r`; elliptic example `h⁰=h¹=1`, virtual rank `0`, top Chern `0`; isolated identity has `h⁰(E)=k³` versus `h⁰(L_pt)=0` and is excluded by 11.1. | Keep actual moduli lifting property. |
| 11.5 resolution (headline) | `V=O` on `ℙ¹`, `L=O(1)`, twist `N≥2`; embedded point | `G=O(−N)^{N+1}`, kernel rank `N`, degree `−N(N+1)`; `h¹(G)=N²−1`, `h¹(H)=N²`, difference `1`. For `N=2`, `4−3=1`; embedded point has unwanted `H⁰=k`, unlike a pure double line with `H⁰=0`. | Keep prestable/purity hypotheses and the resolution orientation. |
| 11.6 virtual rank (headline) | Lines in `ℙ²`; Calabi–Yau threefold; mixed-dimensional target | `3+2−3=2`; Calabi–Yau threefold with no marks gives `0`; target `pt⊔ℙ¹` has tangent ranks `(0,1)`, so the formula is componentwise, not a single global rank. | Keep. |

### Seeded source verification

All 15 sampled targets were read at the listed primary-source locators, including their hypotheses and proof inputs. Page numbers for Behrend–Fantechi and Behrend below are those of the cached arXiv versions; Vistoli numbers are printed journal pages. The README cites extraction lines, avoiding a preprint/published-page ambiguity. No locator is flagged unverified by the author.

| Target | Text opened and locator | Support and qualification |
|---|---|---|
| 1.3 Dimension | stacks-properties lines 1374–1426, Lemma 12.1 and Definitions 12.2–12.3, pp. 29–30, tags 0AFM/0AFN/0AFP | Local chart dimension subtracts the fibre dimension; global dimension is a supremum. The integral transcendence-degree comparison also uses the main supplier's §0.7. |
| 1.4 Function fields and generic stabiliser | vistoli1989 lines 337–355, (1.13)–(1.14), p. 620; lines 419–432, (1.17), p. 622 | Rational functions and stabiliser-weighted degrees agree. Quasi-separated DM inertia is generically finite étale after shrinking; “étale” does not mean order prime to the characteristic. |
| 2.2 Orders and principal divisors | vistoli1989 lines 901–959, (3.2)–(3.3), pp. 633–634; stacks-chow-spaces lines 667–696, Lemma 13.2, pp. 15–16 | Nonzero rational functions, codimension one, and étale invariance of orders support the construction. |
| 3.3 Rational pushforward | vistoli1989 lines 985–1048, (3.6)(iii), (3.7), Lemma 3.8, pp. 635–637; proper-cover condition at lines 887–890 | Rational descent and compatibility hold with the proper-cover convention. R02 concerns only the final negative-control Check. |
| 4.1 Cones | behrend-fantechi1997 lines 181–243, §1, pp. 5–7; vistoli1989 lines 470–484, (1.18), p. 623 | Grading generated in degree one, abelian hull, `Spec Sym`, and base change agree. |
| 4.3 Gysin with scheme targets | vistoli1989 lines 1081–1123, Definition 3.10 and Theorems 3.11–3.13, pp. 638–639; lines 1197–1222, pp. 641–642 | Regular local embeddings, constant codimension and scheme targets are retained. R03 corrects a Check's split-point interpretation. |
| 8.1 Relative local embeddings | behrend-fantechi1997 lines 906–962, Definition 3.7 and chart comparison, pp. 27–28; relative setting lines 1654–1655, p. 49 | Affine-diagonal assumption makes chart products affine; relative smoothness supplies the two-term maps. |
| 8.3 Functoriality, base change, products, transitivity | stacks-cotangent lines 519–528, Lemma 6.2, p. 12; lines 1543–1546, Lemma 18.8, p. 34; olsson2007 lines 1130–1152, Theorem 8.1, author-version p. 28; behrend-fantechi1997 lines 1366–1374, p. 41 | Full derived transitivity and Tor-independent base change support the stated low-degree sequence. The README does not replace derived pullback by ordinary pullback in the nonflat case. |
| 8.4 Intrinsic normal sheaf | behrend-fantechi1997 line 902, Definition 3.6, p. 27; lines 943–962, p. 28; line 1652, p. 49; Lemma 1.1 at line 244, p. 7 | Relative `h¹/h⁰` description agrees. The claimed vector-bundle criterion is for the truncated cotangent complex; it is not claimed equivalent to lci. |
| 8.5 Intrinsic normal cone | behrend-fantechi1997 lines 762–790, Propositions 3.1/Lemma 3.2, pp. 22–23; lines 969–1047, Lemma 3.8–Proposition 3.14, pp. 29–31; line 1656, p. 49; stacks-divisors lines 2017–2036 and 2151–2154, Lemmas 21.4/22.3, pp. 45/48 | The repaired lci criterion uses local Noetherianness and quasi-regular implies regular. The source's equality-only converse is not imported. Tangent-invariance correction checked against kresch1999b lines 319–343, Theorem 3.1, pp. 10–11. |
| 9.2 Obstruction theories | behrend-fantechi1997 lines 1139–1149, Definition 4.4, p. 34; line 1259, Definition 5.1, p. 37; lines 1268–1273, p. 38; lines 1657–1667, p. 49 | `h⁰` isomorphism, `h⁻¹` surjection, perfect amplitude and relative virtual rank agree. |
| 10.3 Independence | behrend-fantechi1997 lines 1299–1320, Proposition 5.3, pp. 38–39 | Statement agrees. The roadmap supplies the stack fibre-product comparison needed beyond globally represented chain maps. |
| 10.5 Products | behrend-fantechi1997 lines 1366–1374, Proposition 5.7, p. 41; lines 1713–1720, Proposition 7.4, p. 51 | Product obstruction theory, global resolutions and additive grading are retained. |
| 10.7 Functoriality | behrend-fantechi1997 lines 1381–1498, Definition 5.8, Lemma 5.9, Proposition 5.10, pp. 41–44; lines 1721–1739, Proposition 7.5, pp. 51–52 | Compatible theories and the two permitted cases are retained; relative reduced-base hypotheses and corrected tangent directions appear in the route. |
| 11.5 Global resolutions | behrend1997 lines 165–187, p. 6 | Fibrewise ample twist, vanishing, evaluation sequence and locally free pushforwards give the displayed global two-term resolution. The `ℙ¹` calculation above checks the degrees. |

The manifest contains all 22 cited works, with 20 certified and two settled uncertified entries. No new source was fetched, no entry was rewritten, and no missing-reference request was made. The theorem statements are paraphrased; no copied source passage or computational algorithm was found.

### Pinned-library audit

Pins read from the content repository's lake manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Object searches covered cycles, Chow groups, cones, vector bundles, cotangent complexes, stack carriers, obstruction theories and virtual classes. Existing scheme constructions are imports/comparisons, not new ownership claims.

Opened Mathlib declarations, with paths relative to that pinned repository:

- `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,69`: locally finitely supported scheme cycles and quasi-compact pushforward; `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean:52`: order has junk value zero outside coheight one or at the zero function; `Mathlib/Topology/KrullDimension.lean:37`: `WithBot ℕ∞` dimension.
- `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:61,319,324,333,546`: presentation cotangent map, map to differentials, exactness and first homology; `Mathlib/RingTheory/Kaehler/JacobiZariski.lean:537,544,552` and `Mathlib/RingTheory/Kaehler/Basic.lean:781`: the consumed transitivity maps and exactness, not an unrestricted tensor formula on the left.
- `Mathlib/RingTheory/Smooth/Basic.lean:70,290,370`: formal smoothness and the split-injection/lifting characterisations; `Mathlib/RingTheory/Derivation/ToSquareZero.lean:116`: lifts through a specified square-zero ideal, with the scalar tower, rather than arbitrary abstract torsors.
- `Mathlib/Algebra/Category/ModuleCat/Sheaf/Abelian.lean:40`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74,81,87`; `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`: the native module, derived and scheme-site carriers.
- `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:81`: categorical pullback data; `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49`: the categorical stack condition, without algebraicity or a DM atlas.
- `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40` and `Mathlib/Topology/Connected/Basic.lean:705`: geometrically connected fibres use `ConnectedSpace`, which includes nonemptiness.

Opened Tau Ceti declarations, with paths relative to its pinned repository:

- `TauCeti/AlgebraicGeometry/Chow/Basic.lean:86,257,295,304,369`: dimension cycles, rational equivalence, quotient, cycle class and one-point comparison; `TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean:211`: closed-immersion pushforward; `TauCeti/AlgebraicGeometry/AlgebraicCycle/Principal.lean:71`: divisor of a nonzero rational function. Their carriers are schemes, including nonseparated schemes; this is not Chow theory of DM stacks.
- `TauCeti/AlgebraicGeometry/RelativeSpec/Graded.lean:93`, `RelativeSpec/BaseChange.lean:272`, `RelativeSpec/UniversalProperty.lean:349,455` under the same prefix: graded relative Spec, base change and unrestricted test-morphism Hom equivalences.
- `TauCeti/AlgebraicGeometry/VectorBundle/LinearScheme.lean:175`, `VectorBundle/LinearScheme/BaseChange.lean:52,99`, `VectorBundle/Geometric.lean:221`, `VectorBundle/TotalSpace.lean:130,229`: contravariant `Spec Sym F` versus covariant `Spec Sym E∨`, and their base-change maps.
- `TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean:80`, `VectorBundle/Rank.lean:125`, `VectorBundle/FixedRank.lean:52`: finite local freeness, locally constant rank, and rank fixed at every point; this is not a global maximum rank.
- `TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean:84`; `Curves/Prestable.lean:45`; `AlgebraicSpace/Basic.lean:195`; `Stack/Basic.lean:37` under the same prefix: big structure sheaf, proper geometrically connected nodal scheme families, algebraic spaces without separatedness, and Cat-valued scheme pseudofunctors. None supplies an algebraic DM-stack structure.
- `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50` and `TauCeti/AlgebraicGeometry/CartierDivisor/Basic.lean:127`: the existing line-bundle/divisor carriers used through the scheme supplier.

### Headlines, Lean form and padding

| README headline family | Module docstring item | Missing native carriers checked |
|---|---|---|
| 6.1 coarse-space comparison | 1 | DM stacks, their Chow groups and proper pushforward |
| 6.2 equivariant quotient comparison | 2 | Quotient stacks, their Chow groups and equivariant Chow groups |
| 6.3 degree of zero-cycles | 3 | Stack points/inertia and rational stack Chow groups |
| 8.5 pure-dimensional intrinsic cone and lci criterion | 4 | Relative cone stacks, stack cotangent complex and dimension |
| 9.3 obstruction-theory characterisations | 5 | The preceding stack/derived carriers and canonical cone-stack morphisms |
| 10.2–10.3 virtual class and independence | 6 | Stack Chow groups and vector-bundle Gysin maps |
| 10.4–10.8 properties and counts | 7 | The same carriers plus stack Chern/bivariant operations |
| 11.4–11.6 map theory, global resolutions and rank | 8 | DM-stack maps, derived pushforward and relative duality |

None can be made statable by a few simple definitions on the pins. The native ring presentation complex, algebraic spaces and categorical stack predicate do not supply these heavy carriers. The docstring names every headline and its missing input; nothing weaker is substituted. `Suggested.lean` has zero declarations: zero sorried theorems for the exhaustive one-tactic probe, zero definitions or instances, and an empty `#check @name` signature inventory. There are no lost section binders, padding declarations, sorry'd data, `set_option`, or claims of undeclared owned Lean names. Its single import is `Mathlib`; no Tau Ceti object file needs building.

Prescribed `lake env lean` elaboration of `packages/VirtualFundamentalClasses/Suggested.lean`, from the pinned content environment: **exit 0, no output and no warnings**. A successful empty acceptance file checks its form and imports, not the truth of the prose; the table above supplies the mathematical controls.

### Suppliers, ownership and order

Read all `*Needs:*` lines and resolved all seven supplier roadmaps on main, not from remembered or proposed revised numbering. The supplied eight citation leads resolve. A fresh `roadmaps resolve` returned no unresolved names; its warning that it could not inspect pinned Lake packages was compensated by the direct local pin inspection above.

| Supplier | Current sections and concrete locators resolved |
|---|---|
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:923` (§0.7); `:2145,2422,2849,2923,2949,3055,3092,3124` (§§1.1,1.10,1.18–1.23); `:3554,3719,3772,4104,4265,4452` (§§2.6,2.9,2.10,2.18–2.20); `:4917,5305` (§§3.3,4.1); `:6902,7000,7065,7109,7253` (§§5.1,5.2,5.4–5.6). In particular `Stack.stackification` at 2864, `IsDeligneMumford` comparisons at 2934–2935, `setoid_criterion` at 2953, `DQCoh.affineEquiv` at 4120, and Gysin/graph names at 7157/7266 exist. |
| AlgebraicVectorBundles | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:346` and its label mapping through 373 resolve L0B, L1A, L2A, L2B to the native fixed-rank, relative-Spec and base-change declarations. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1398,1463,1533,1588,1761`: §§0.7,0.8,0.10,0.13,0.25. The last distinguishes Ext² algebra extensions from Ext¹ morphism lifting, the latter being what this package consumes. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:441,534,580`: §0.2, E1.2 and E1.4, replacements and derived ringed-site operations. |
| StableReduction | `TauCetiRoadmap/StableReduction/README.md:405,467`: Layers 2–3, proper coherent cohomology/base change, nodal dualising sheaf, relative ampleness and prestable families. |
| EllipticCohomology | `TauCetiRoadmap/EllipticCohomology/README.md:207`: E1's elliptic stack sites; the general small-site extension belongs here. |
| EquivariantIntersectionTheory | `TauCetiRoadmap/EquivariantIntersectionTheory/README.md:378,402`: §§2.1–2.2 with Conventions 1,4,5; smooth affine group, linearised ample sheaf, and shift `i+l−g` agree. |

The order check produced exactly:

    depcheck: 230 roadmaps, 2065 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. No declared supplier gaps. The local dependency order includes 4.4 before the proof of 4.3, as its explicit dependency requires; this is not a supplier cycle. The dimension definition precedes generic-field theory, while its transcendence-degree comparison uses that theory. Scheme affine-bundle homotopy invariance is an earlier supplier input, so 4.3 does not circularly depend on this package's stack homotopy invariance in 5.1.

Ownership was searched by objects in both libraries, roadmaps on main, the board packages and the supplied open-head index using `roadmaps grep` and `roadmaps show`. The board-package index was read before drawing any absence conclusion. The closest open heads have the following disposition:

- Open #1996, `TauCetiRoadmap/VirtualFundamentalClass/README.md:41–65`, owns overlapping intrinsic-cone, obstruction-theory and virtual-class objects. Open #1998, `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:40–46`, owns the stable-map obstruction theory. These are the ownership question marked **not actionable in this package** as R02 in the earlier repair record: choosing an owner changes multiple roadmap scopes and merge order. The supplied settled-finding rule applies; the reason remains true, so it is not re-raised. This is not a fresh certification that the two ownership scopes are disjoint.
- The nearby SchemeAndStackFoundations revisions #1808, #1656 and #1854 concern the existing supplier; the package consumes main's scheme/stack-foundation sections. The supplied overlap report lists no conflicting head changing this roadmap, no dropped cited id, and no id supplied only by an open revision. Current main locators above resolve, so no revision dependency or renumbering repair is needed here.
- There is no declaration in this package's Lean file to collide with a fully qualified declaration in an open roadmap. General scheme Chow, vector-bundle, derived-module and categorical-stack constructions are explicitly left to the named owners; the package's retained extensions concern DM-stack cycle/cone theory.

### Shape, organisation and policy

Compared the shape with main's AlgebraicVectorBundles, DerivedModuleAlgebra and EquivariantIntersectionTheory roadmaps. The package has Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, 11 mathematical layers with Examples and Dependencies, Downstream consumers and References. Definitions retain prose APIs and at least three Checks; the short two-Check subsections 10.3, 10.5 and 11.5 are theorem statements, not new definitions. Three Check repairs are listed above. Theorems have hypotheses and source locators; conventions distinguish proper covers, separatedness, affine diagonal, constant versus locally constant rank, rational coefficients and actual global resolutions.

The organisation is mathematical: cycle operations support Gysin and homotopy invariance; cone-stack linear algebra and relative cotangent descent support obstruction theory; these meet in the virtual-class construction and then curve maps. Layer 6 is an independent comparison branch explicitly described as such. No layer is named for a source chapter and no source-order instruction is used. No route-specific good-characteristic shortcut, executable algorithm, copied passage, process residue, HTML anchor, machine path, `lemma` declaration, forbidden import or option override was found in the author files. The characteristic condition in §11.1 is a discriminating stable-map example, not a restriction of the roadmap's general obstruction theory.

## Not verifiable

- `gillet1984` §4 and `fulton1998` §1.10, Corollary 6.3, Proposition 8.1.1 and Appendix B.6.6 remain settled **uncertified** citations. Their texts were not available for direct inspection; no new request was made. Available primary sources and the computations above check the corresponding uses, but do not certify those inaccessible printed locators.
- The eight stack headline families cannot be elaborated as mathematical signatures at these pins because their carriers are absent. The successful Lean command is not a proof of them.
- Open-head ownership was checked within the supplied index/tool coverage. The settled inter-roadmap ownership overlap described above still requires its separate disposition; it is not silently treated as resolved by this package review.

## Source issues

- **Misprint** in behrend-fantechi1997 at Remark after Definition 1.2, arXiv p. 8, lines 272–276: the source says the cone sequence places the subsheaf cone before the middle-sheaf cone; it should be `C(E) → C(F) → C(F′)`; affects nothing.
- **Error** in behrend-fantechi1997 at Proposition 1.4, arXiv p. 10, lines 323–327: the source says smooth surjective equivariance over a cone suffices to make the source a cone; it should also require the vertex fibre to be a vector bundle with its linear scalar action; affects a stated result.
- **Error** in behrend-fantechi1997 at Proposition 3.5, arXiv p. 26, lines 889–891: the source says the rational equivalence is invariant under every ambient tangent direction; it should restrict to the tangent directions preserving the intersection data, as in kresch1999b Theorem 3.1, pp. 10–11; affects a stated result.
- **Gap** in behrend-fantechi1997 at Definition 3.7 and product of local embeddings, arXiv pp. 27–28, lines 913 and 930–931: the source says the fibre product of affine charts is again an admissible affine chart; it should assume affine diagonal or refine that fibre product by affine charts; affects the proof.
- **Error** in behrend-fantechi1997 at Proposition 3.12, arXiv p. 30, lines 1010–1023: the source says equality of intrinsic normal cone and normal sheaf implies local complete intersection; it should require the intrinsic cone to be a vector bundle stack; affects a stated result.
- **Gap** in behrend-fantechi1997 at proof of Proposition 5.3, arXiv p. 39, lines 1303–1312: the source says global resolutions can be compared through the displayed chain-map fibre product without justification; it should justify that replacement or use the fibre product of their vector-bundle-stack presentations; affects the proof.
- **Misprint** in behrend-fantechi1997 at proof of Proposition 6.2, arXiv p. 48, line 1609: the source says the right-hand Ext group is over the curve; it should be over the test scheme `T`; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8c00d60d2c06f81024dd2ebb4a0cf2ceb69eb48f", "job": "REV-PKG-VirtualFundamentalClasses~6", "model": "gpt-6-astra", "worker": "chris-4"} -->
