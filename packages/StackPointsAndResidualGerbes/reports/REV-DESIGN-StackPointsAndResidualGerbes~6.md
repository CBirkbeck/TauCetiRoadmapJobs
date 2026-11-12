# Review of StackPointsAndResidualGerbes (design, round 6)

**Verdict:** needs changes

Seven findings: one P1, three P2 and three P3. The design is repairable. The mathematics and all edits in this review were done by the reviewer. No design text or plan was changed. Seven legal source entries were added to the manifest; existing entries were preserved.

## R01 (P1) — The fibre over the stack is not the relation space

**Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1517`; `packages/StackPointsAndResidualGerbes/design/plan.json:1719` (6.2, `base_vs_fibre`). Quote: “`𝒵_x ×_𝒳 Spec k = Spec k ×_{BG} Spec k = G`”.

**Claim:** For the trivial torsor of `𝒳 = BG`, pulling the residual gerbe back along that representative gives `G`.

**Witness:** Here `𝒵_x → 𝒳` is the identity of `BG`. Its pullback is `Spec k`. For constant `G = ℤ/2`, this has one geometric point, whereas `Spec k ×_{BG} Spec k = G` has two.

**Exact repair, tested:** Replace the Check in both files by the three distinct products
`𝒵_x ×_{Spec k} Spec k ≃ BG`, `𝒵_x ×_𝒳 Spec k ≃ Spec k`, and `Spec k ×_𝒳 Spec k ≃ G`.
For `G = ℤ/2` over an algebraically closed field these are respectively a one-point stack with automorphism group of order two, a one-point scheme, and a two-point scheme. The repaired statement also works for `G = 1` and `G = μ_p`, where the relation space has length `p` despite having one geometric point. The identity-pullback law is expressly supplied by `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2904`–2905. The round-5 adversarial table repeated the erroneous computation; that row is superseded, not relied upon.

## R02 (P2) — Non-exactness of the inclusion does not make every kernel non-quasi-coherent

**Location:** `packages/StackPointsAndResidualGerbes/design/README.md:603`–607; `packages/StackPointsAndResidualGerbes/design/plan.json:255`. Quote: “The kernel of the same map among all `O_𝒳`-modules on the fppf site is a different sheaf, which is not quasi-coherent”.

**Claim:** Every closed immersion gives distinct kernels in quasi-coherent modules and all fppf modules, and the latter is never quasi-coherent.

**Witness:** Take `X = Spec(k × k)` and the first component `Z = Spec k`. The unit is `(a,b) ↦ a`; its kernel `0 × k` is split, quasi-coherent, and preserved by every tensor pullback.

**Exact repair, tested:** Say that the all-modules kernel “need not agree with the quasi-coherent kernel and need not be quasi-coherent”. Keep the kernel construction in `Stacks.QCoh` and the non-exactness example at the origin of `𝔸¹`. Add the split-component control above (or the identity immersion, with both kernels zero) to distinguish “not exact in general” from “never exact”. Update the plan's API sentence likewise. On `𝔸¹`, the ideal `(t)` pulls back at the origin to `k`, while the all-modules kernel there is zero; on the split component both kernels are `0 × k`. Both cases now agree with the statement. The source gives the general non-exactness warning, not the universal assertion: stacks-sheaves-on-stacks line 1072, Lemma 96.15.1(3), printed page 24.

This is a new overclaim introduced while repairing round-5 R04. The category correction itself is valid.

## R03 (P2) — Decency omits the scheme-representable case of the cited theorem

**Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1313`–1315; `packages/StackPointsAndResidualGerbes/design/plan.json:1372`. Quote: “representable by algebraic spaces and quasi-separated ... then `𝒳` is decent”.

**Claim:** The planned preservation theorem covers only the quasi-separated representable case.

**Witness:** stacks-06RD lines 4699–4701, Lemma 101.48.3, printed pages 98–99, also permits a morphism representable by schemes without quasi-separatedness. This branch is absent from both the statement and API.

**Exact repair, tested:** State both alternatives: if `𝒴` is decent and `f : 𝒳 → 𝒴` is either representable by schemes, or representable by algebraic spaces and quasi-separated, then `𝒳` is decent. Add the first branch in the plan and a Check genuinely outside the second branch.

For such a Check, set `A = k[x₁,x₂,…]`, `U = ⋃ᵢ D(xᵢ)`, and glue two copies of `Spec A` along `U`. The resulting scheme `X → Spec k` is scheme-representable and not quasi-separated: its two affine opens intersect in the non-quasi-compact `U`. A finite subfamily with indices `i₁,…,iₙ` misses the prime `(xᵢ₁,…,xᵢₙ)`, which lies in `U`. Nevertheless `X` is decent, as is every scheme. Thus the new branch supplies a real case excluded by the current one. This is a scope omission under the required source generality, not a claim that the retained branch is false.

## R04 (P3) — The zero-th power cuts out the empty substack

**Location:** `packages/StackPointsAndResidualGerbes/design/README.md:636`–637. Quote: “an indexing by `ℐ^n` would give length `n` and `𝒳^{[0]} = 𝒳`”.

**Claim:** The alternative indexing `V(ℐ^n)` gives the whole ambient stack at `n = 0`.

**Witness:** For `ℐ = (t)` in `k[t]`, `ℐ⁰ = (1)`, hence `V(ℐ⁰) = Spec(k[t]/(1)) = ∅`, of length zero. The whole affine line is `V(0)`.

**Exact repair, tested:** Replace the last expression by “`V(ℐ⁰) = ∅`”. Retain the correct intended convention `V(ℐ^{n+1})`, whose first three lengths are `1, 2, 3`; the alternative's are `0, 1, 2`. The plan's existing `A1_origin` test states only the correct convention and needs no reversal; it can include this corrected control.

## R05 (P3) — The representative groupoid API omits two actual prerequisites

**Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1480`–1481 and 1491–1492; `packages/StackPointsAndResidualGerbes/design/plan.json:1644`–1651. Quote: “For decent `𝒳`, `R_x → Spec(k ⊗_{κ(x)} k)` is surjective, flat and locally of finite presentation”.

**Claim:** The listed Needs suffice for all of §6.1's API, including its map to the residue-field tensor product.

**Witness:** The map uses §5.3's `κ(x)` and gerbe over that field; the explicitly cited Lemma 101.28.10(3) is §2.4's target. Neither §5.3 nor §2.4 occurs in §6.1's prerequisite list.

**Exact repair, tested:** Add `2.4` and `5.3` to the README Needs and `target:2.4`, `target:5.3` to the plan. These are existing earlier targets, not new supplier gaps. For `X = Spec ℝ`, `k = ℂ`, the map is the identity of `Spec(ℂ ⊗_ℝ ℂ) ≃ Spec ℂ ⊔ Spec ℂ`, hence surjective flat lfp; for `BG_k` it is `G → Spec k`. The residue-field gerbe and the inertia/gerbe criterion supply exactly these maps and properties. This is the same dependency-list pattern that round-5 R05 repaired in §5.3; that repair did not cover this occurrence.

## R06 (P3) — The tangent base-change locator points to the wrong section

**Location:** `packages/StackPointsAndResidualGerbes/design/README.md:417`–418; `packages/StackPointsAndResidualGerbes/design/plan.json:2372`. Quote: “the base change to `k'` of the tangent space ... (Artin's Axioms, Section 98.8)”.

**Claim:** Section 98.8 supplies the finite-separable field-extension statement in `gap:algebraic-stacks-satisfy-rs`.

**Witness:** stacks-artin lines 393–479 define tangent spaces and give finiteness and exact-sequence results. Field change is Lemma 98.7.1, lines 354–392, combined with stacks-formal-defos Lemma 90.29.3, lines 3512–3528.

**Exact repair, tested:** Cite Artin's Axioms Lemma 98.7.1 (printed pages 8–9), Remark 98.6.2 (RS implies S2), and Formal Deformation Theory Lemma 90.29.3 (printed page 73) for base change. Keep §98.8 only for the vector-space/tangent definition. Update the gap detail and References; the two source entries have now been fetched and added. For `𝔸¹_k` at zero and a quadratic separable extension `l/k`, both sides are `k ⊗_k l = l`, of `l`-dimension one. For `Bμ_p` in characteristic `p`, both framed tangent spaces likewise become the one-dimensional `l`-space. The contract's finite-separable assertion is true; only its support is misplaced.

## R07 (P2) — Closed and reduced induced substacks have a second owner on the board

**Location:** `packages/StackPointsAndResidualGerbes/design/README.md:30`–34 and 52. Quote: “No other roadmap states any of these objects.”

**Claim:** This roadmap exclusively owns closed substacks, their presentation correspondence and reduced induced closed substacks.

**Witness:** `packages/VirtualFundamentalClasses/README.md:507`–524, §1.2, defines closed substacks and proves the same presentation correspondence, reduced induced structure and reduced-source factorisation. Its design §1.2 repeats them at lines 373–388.

**Exact repair, tested:** Assign the general closed-substack, presentation and reduced-induced-structure results to StackPointsAndResidualGerbes §§0.3–0.5, and explicitly record VirtualFundamentalClasses §1.2 as consuming those results and retaining its integral-substack/cycle-specific additions. Replace the blanket exclusivity sentence with this precise ownership boundary and include it in the plan's consumer description. The companion package must replace the duplicated constructions by that citation when its worker applies the ownership decision. Do not make this roadmap consume the later VirtualFundamentalClasses: it is at `merge-order/ORDER.txt:403`, whereas the gate places this design after AlgebraicModuliForArithmeticGeometry.

Test of the boundary: for `B(ℤ/2)` the only nonempty closed substack is the whole stack; for `[𝔸¹/μ₂]` in characteristic different from two the reduction of `[V(t²)/μ₂]` is `[V(t)/μ₂]`. These are literally the same objects and laws in both roadmaps, with the latter package specialising to finite-type quasi-separated DM stacks. Its definition of an integral closed substack and its cycle theory remain distinct consumers. This is a board-package conflict: the provided open-head index does not identify a pull request for the plural name VirtualFundamentalClasses. It is not the differently named VirtualFundamentalClass pull request, and no pull-request number has been invented.

## Verified sound

### Previous findings, checked before the fresh pass

All seven round-5 findings were checked individually against the repair, the present text, the pins and suppliers. None was marked “not actionable in this package”; no settled refusal is being reopened.

| Round-5 finding | Repaired passage and present evidence | Status |
|---|---|---|
| R01, regular schemes duplicated in a supplier gap | README 219–234 imports `IsRegular`, `IsRegular.of_smooth`, and `IsRegular.of_flat_of_surjective`; 382–401 says “regularity of schemes being Tau Ceti's and not asked for”. The target-local-Noetherian binder was opened at the pin. | Repaired. The remaining arbitrary-base reducedness and algebraic-space contracts are distinct. |
| R02, dead supplier names | README 151–153 says “the Check of §1.22 that `QCoh(BG)` is the category of `O(G)`-comodules”; the §1.18 contract uses “StackInGroupoids”. The real-torsor and generic-point references now cite the supplier Checks in prose. | Repaired. The four replacements resolve at the current main copy. |
| R03, arbitrary-field orbit route supplied only over algebraic closure | README 1730–1739 proves “`W = V ×_{[V/G]} 𝒵_x` is smooth over `k`” and identifies it with the reduced closed orbit. Layer 3A is expressly not an input at 425. | Repaired. The closed-orbit route works over an imperfect field and for non-smooth stabilisers. The present ReductiveGroups Layer 3A also has some arbitrary-field orbit targets; this route does not consume them. |
| R04, unstated kernel category | README 599 says “the kernel, taken in `Stacks.QCoh 𝒳`, of the unit”. Images and powers are also in that category; the origin Check computes the non-cartesian all-modules kernel. | Partly repaired: the construction is fixed, but its new universal warning is false (R02 above). |
| R05, missing §5.3 existence/functoriality dependencies | README 1377–1380 and 1392–1396 now name 4.1, 4.3, 4.4 and 3.5, with the separation gap. The plan has the same prerequisites. | Repaired; the analogous omission elsewhere is R05 above. |
| R06, rational-point existence unnecessarily conditional | README 1571–1585 uses “`p ∘ x = id`” and Lemma 101.17.8 to get local finite type and hence existence. Local Noetherianity is retained for the closed-immersion clause. | Repaired. Infinite-polynomial-ring Check 1594–1599 separates lft from lfp. |
| R07, undefined relative base in the stabiliser | README 1485–1488 says “the absolute product, Convention 1” and explains the factorisation through a product over any scheme `B` under `𝒳`. | Repaired. For a finite Galois extension the absolute diagonal pullback gives the trivial stabiliser, not the full relation space. |

The changed kernel, regularity, orbit, rational-point and stabiliser passages were all recomputed below. Their patterns were searched in the rest of the design. Unchanged round-5 prose summaries were not treated as evidence. The present pass reads all 38 targets, 71 API entries and 133 Checks; the compact table records each target, all sampled targets and all headlines. It replaces the false round-5 §6.2 row.

### Computed adversarial pass

Notation in the table: `Z_x` is the residual gerbe, `G_x` the automorphism group, `N` the normal space, and `T` the framed tangent space. Rings written `k[ε]` mean dual numbers. `Bℤ` uses the infinite constant étale group; `Bμ_p` is in characteristic `p`. Scheme and groupoid examples are also tests of the stated universe and base conventions. Every equality uses the actual representative or structure morphism; no arbitrary map is silently substituted.

| Statement/API tested | Instances | Computed values on the two sides / exclusion | Result and change |
|---|---|---|---|
| 0.1 reduced and regular stacks, smooth locality | `Spec k`; node `xy=0`; `Bμ_p` | Field: dimension and embedding dimension `0=0`. Node: `1≠2`; product with `𝔸¹`: `2≠3`. A smooth atlas of `Bμ_p` is `𝔾_m`, regular and reduced, although `μ_p` has ring `k[u]/((u−1)^p)` and is not reduced. | Stack regularity is tested on a smooth atlas, not on inertia. Flat descent has the stated Noetherian conditions where required. |
| 0.2 monomorphism/fully faithful/diagonal equivalences | `Spec ℂ→Spec ℝ`; `Spec k→BG`; identity and empty maps | First map has one point on each side but self-product `Spec(ℂ×ℂ)`, not `Spec ℂ`. Second has self-product `G`; its diagonal is an isomorphism iff `G=1`. Identity self-product is its source; empty self-product is empty. | Both directions distinguish a mono from a bijection on points. |
| 0.3 immersions and substacks | `[𝔸¹/𝔾_m]`; generic point of `𝔸¹`; two components | Closed origin gives `B𝔾_m`, open complement gives `Spec k`. Generic singleton of `𝔸¹` is not locally closed. Two isomorphic components give different embedded substacks. | Embedding data and locally closed hypotheses matter. Ownership conflict R07. |
| 0.4 ideals, factorisation, powers, base change | `(t)` at origin; split component; `(ε)`; zero/unit ideals | On origin: `(t)⊗k=k`, all-modules kernel `0`. Split component: both kernels `0×k`. Powers `(t)^{n+1}` give lengths `1,2,3`; `I⁰=(1)` gives length `0`, not all `𝔸¹`. `(ε)²=0`. `V(0)=X`, `V(1)=∅`. Pullback under `t↦ε` gives `V(ε^{n+1})`. | R02 and R04; real ideal body rules out radical-only correspondence. |
| 0.5 reduced induced structure and factorisation | dual numbers; empty support; nonreduced test source | Reduction of `Spec k[ε]` is `Spec k`, with the same one-point support. Empty support gives empty stack. Map sending `ε↦ε` does not factor through `k`, despite its one-point image. | Reduced-source hypothesis necessary; reduction is not determined merely by topology without reducedness. R07 concerns ownership. |
| 1.1 finite type points | DVR generic point; `𝔸¹_k` generic point; algebraic closure representative | DVR fraction field is `R[1/π]`, a finite-type algebra. `k(t)` is not a finite-type `k`-algebra, so generic point of `𝔸¹` fails. The point of `Spec ℚ` is finite type although `Spec ℚ̄→Spec ℚ` is not. | Existential representative, not every representative being finite type. |
| 1.2 field representatives and equality of points | `B(ℤ/2)(ℝ)`; `ℚ(i)` with two embeddings | Real torsors: `ℝ×ℝ` and `ℂ`, two isomorphism classes but one topological point. Identity and conjugation send `i` to `i` and `−i`; allowing the appropriate two embeddings makes the representatives agree. | Common-extension comparison keeps both embeddings; rational objects are not points. |
| 1.3 automorphism group and point stabilisers | `Bμ_p`; `BS₃`; `Bμ₃` over `ℚ` | `μ_p` has one geometric point but length `p`. In `S₃`, `(12)(23)≠(23)(12)`, so composition is not forced abelian. `μ₃(ℚ)` has one element, after adjoining `ζ₃` it has three, while the group scheme base changes unchanged in degree. | Scheme structure and noncommutative group law retained. |
| 1.4 when the automorphism group is a scheme | `B𝔾_m`; `Bℤ`; non-decent group-space examples | Stabiliser `𝔾_m` is a scheme of dimension one, though not locally quasi-finite; constant `ℤ` is an étale scheme with infinitely many components. The source's non-schematic cases are not forced into either hypothesis. | Schematic does not mean finite or quasi-DM; six source sufficient cases read. |
| 2.1 gerbes and their base | `BG→Spec k`; `[𝔸¹/𝔾_m]→Spec k`; `Spec k→BG`; empty | In `BG`, objects become isomorphic locally and the sheaf of isomorphism classes is terminal. The quotient of `𝔸¹` has two geometric orbits `0` and nonzero. `Spec k→BG` misses automorphisms of a nontrivial torsor. Empty over empty is a gerbe; empty over a point is not locally inhabited. | Local nonemptiness and local isomorphism conditions both needed. |
| 2.2 section gives a classifying stack | trivial torsor; twisted `S₃`-torsor over `ℝ` | Trivial section has automorphism group `S₃`. Twist defined by complex conjugation mapping to a transposition has real automorphisms its centraliser, order `2`, versus constant `S₃(ℝ)` of order `6`; over `ℂ` both become `S₃`. | Must use the automorphism group of the chosen section; no unmarked constant-group identification. |
| 2.3 base change, composition, flatness and smoothness of gerbes | `Bμ_p`; `B𝔾_m` over varying bases | `Bμ_p→Spec k` is smooth with smooth atlas `𝔾_m`; `Spec k→Bμ_p` is flat lfp but not smooth since its pullback is `μ_p`, embedding dimension `1`, dimension `0`. Base-changing `B𝔾_m` gives `B(𝔾_m×B B')`. | Smoothness of the gerbe does not assert smoothness of every section. |
| 2.4 inertia criterion and its relation-space formulation | `[𝔸¹/𝔾_m]`; `Bμ_p`; trivial group | Inertia atlas has equation `(λ−1)t=0`: fibres dimension `1` at zero and `0` away, with nonzero `t`-torsion, hence not flat. Inertia of `Bμ_p` is locally free of rank `p`; trivial-group inertia has rank `1`. | Gerbe criterion separates nonflat jumping inertia from nonreduced flat inertia. |
| 2.5 topological/permanence consequences | `Spec k→B𝔾_m`; reduction of dual numbers; `Bℤ` | First diagonal is the unit `Spec k→𝔾_m`, not flat; dual-number reduction is a universal homeomorphism but not flat. `Bℤ` has non-quasi-compact diagonal with fibre `⊔ℤ Spec k`. | Homeomorphism on points alone does not imply gerbe or the diagonal properties. |
| 2.6 dense open gerbe | `[𝔸¹/𝔾_m]`; its dual-number origin thickening | Dense open quotient is `Spec k`, with trivial inertia. On `Spec k[ε]` with scaling, inertia has `(λ−1)ε=0`; the annihilator of `ε` is larger than `ε` times the ring. Its only nonempty open is all of it, where inertia is nonflat. | Reduced hypothesis cannot be dropped; no characteristic restriction introduced. |
| 3.1 reduced one-point stacks and field atlases | `Bμ_p`; dual numbers; Example 100.11.6 | `Bμ_p` is reduced, regular, one-point; dual numbers have one point but nilpotent `ε≠0`. In the source's `U/G`, `|U|` is the infinite profinite `Gal(ℚ̄/ℚ)`, dimension zero but not Noetherian; flat lft field atlas need not be lfp. | Local Noetherianity distinguishes the stronger one-point notion. |
| 3.2 rigidity and the canonical core | `BG`; Example 100.11.6; empty domain | `Spec k→BG` is mono only for `G=1`. The non-Noetherian reduced one-point `U/G` has proper mono core `Spec ℚ̄`, not an isomorphism. Empty mono has empty image. | Nonemptiness and local Noetherianity in rigidity are essential. |
| 3.3 residual gerbe definition and uniqueness | scheme point; `BG`; dual numbers | Outputs respectively `Spec κ(x)`, `BG`, `Spec k`. Substituting `Spec k` for the residual gerbe of nontrivial `BG` fails mono because its self-product is `G`. | Wrong atlas-as-gerbe model excluded; embeddings matter. |
| 3.4 properties, base and regularity | node; `Spec ℚ(t)/ℤ`; a gerbe versus non-gerbe | Node's residual gerbe is regular `Spec k`, dimension zero despite node embedding dimension two. The non-decent quotient is reduced one-point and its own residual object, but its relation is `⊔ℤ Spec ℚ(t)`, non-quasi-compact, so it cannot be a field spectrum. | Existence/regularity do not imply field base without decency. The base-change assertion is only for a gerbe. |
| 3.5 functoriality and equality criteria | `Spec k→BG`; open immersion; identity | On residual objects the first has relations `1→G`, not an isomorphism for `G≠1`; an open immersion induces the same residual gerbe at a point in the open; identity induces identity. | Conditions detect the stabiliser, not only the singleton image. |
| 4.1 finite-type-point equivalences | DVR generic point; generic point of `𝔸¹_k` | DVR: representative `Spec R[1/π]` is lft, residual inclusion lft, field atlas lft: all true. `𝔸¹` generic: residual gerbe exists as `Spec k(t)`, but its inclusion and any finite-type representative fail lft: all three finite-type conditions false. | Existence alone is not one of the equivalent finite-type conditions. |
| 4.2 quasi-DM/flat quasi-finite presentation existence | `Bμ_p`; `Bℤ`; pathological algebraic spaces | `μ_p` has length `p`, dimension `0`, not unramified; the stack is quasi-DM, not DM, and residual gerbe is itself. `Bℤ` is DM with non-quasi-compact inertia, still covered by the quasi-DM clause. | Does not silently impose finite inertia or good characteristic. |
| 4.3 gerbes and quasi-compact inertia | `Bℤ`; `[𝔸¹/𝔾_m]` | `Bℤ` is a gerbe, so existence holds although inertia is infinite discrete. The affine inertia of `[𝔸¹/𝔾_m]` is quasi-compact; residuals are `B𝔾_m` at zero and `Spec k` on the open orbit. | Two sufficient routes remain distinct. |
| 4.4 locally Noetherian existence | `Spec ℚ(t)/ℤ`; infinite polynomial scheme | First is locally Noetherian but not decent, yet its residual gerbe exists. `Spec k[x₁,x₂,…]` is not locally Noetherian, though its affine inertia gives the separate §4.3 route. | Locally Noetherian route does not insert decency or quasi-separatedness. |
| 4.5 closed points and closed immersions | DVR closed/generic points; Example 100.11.6 | Closed point gives `Spec κ→Spec R` closed; generic gives `Spec K→Spec R` open, not closed. Non-Noetherian `U/G` has a closed singleton but mono core `Spec ℚ̄` is not closed: reduced structure on the whole support would be all `U/G`. | Local Noetherianity in the converse matters. |
| 5.1 decent stacks | `B𝔾_m`; `Spec ℚ(t)/ℤ`; glued scheme in R03 | First has affine diagonal, hence quasi-compact representatives. Second representative has infinite discrete pullback, not qc. Glued scheme has non-qc intersection `⋃D(xᵢ)` but is decent. | Retained claims hold; add scheme-representable branch, R03. |
| 5.2 maps from reduced stacks with singleton image | identity on `𝔸¹`; dual numbers; one-point examples | Identity has many-point image, hence cannot factor through one residual gerbe. Dual-number identity has singleton image but `ε` maps to `ε≠0`, so does not factor through its reduced point. Under the reduced/decent or locally Noetherian hypotheses the chart maps kill the vanishing ideal. | Neither singleton-image nor reduced-source condition may be dropped. |
| 5.3 residue field and gerbe over it | `Spec ℚ(i)`; `[Spec ℂ/(ℤ/4)]` over `ℝ` | First residue field is `ℚ(i)`. Second base is `Spec ℝ`, stabiliser over `ℂ` is `ℤ/2`, but it has no real object: homomorphisms `ℤ/2→ℤ/4` have images `0` or `2`, both trivial under reduction to `ℤ/2`. | Residue field exists without a representative over that field. Added §5.3 proof edges suffice. |
| 5.4 algebraicity and residual immersion statements | generic point of `𝔸¹`; non-decent translation quotient | `Spec k(t)→𝔸¹` is affine but not an immersion: its singleton image is not locally closed. The translation quotient has non-qc diagonal and residual object not a field. | Affine and locally closed conclusions stay separate; qc-diagonal hypothesis is used. |
| 5.5 representatives and fppf image | `k=κ(t)`; purely inseparable degree `p`; infinite algebraic extension | No finite extension of `κ` admits an injective `κ`-map from `κ(t)`; the fppf image of this representative misses the identity over `κ`. A degree-`p` field extension is finite free rank `p`, faithfully flat, hence an fppf cover even inseparable. Infinite algebraic extension is not finitely presented. | Finite extension supplies the equality; arbitrary representative cannot replace it. |
| 6.1 presentation by a representative | `BG`; `Spec ℝ` with representative `ℂ`; quotient origin | Relations are `G`, `Spec(ℂ⊗ℝℂ)=2 Spec ℂ`, and `𝔾_m`. In the second case stabiliser is `1`; diagonal pullback contracts the tensor ring to `ℂ`, and quotient is `Spec ℝ`. Tensor-base map is identity there. | Absolute stabiliser convention correct; add §2.4/§5.3 Needs, R05. |
| 6.2 residual-gerbe base change | constant `ℤ/2`; non-neutral real example; scheme | Base extension gives `BG`, or `B(ℤ/2)_ℂ`, or `Spec k=B1`. In the `BG` example pullback of residual inclusion is `Spec k` (one geometric point), while self-relation of representative is `G` (two). | Headline is correct; false Check and plan test corrected by R01. |
| 6.3 neutrality and the canonical map | real non-neutral example; quaternion `(t,−1)` over `ℚ(t)` | Real example has no section, despite geometric trivialisation. Quaternion residue at `t=0` is nonsquare `−1`, hence nonsplit. Under `t↦t²`, `(t²,−1)` is split, but this field endomorphism is not surjective. | Canonical map is an equivalence exactly for isomorphic base map; abstract splitting after a noninvertible endomorphism is insufficient. |
| 6.4 rational points | infinite polynomial scheme at zero; `Bμ_p`; `Spec κ` with `k≠κ` | Zero inclusion is closed, hence lft, but not lfp: ideal has infinitely many generators. Residual gerbe is `Spec k`. For `Bμ_p`, residual gerbe is `Bμ_p` although stabiliser is non-smooth. Nontrivial field representative has no `k`-section of the stipulated structure map; residual remains `Spec κ`. | Rational-section hypothesis gives existence without ambient finite type. Closed immersion retains local Noetherianity. |
| 7.1 infinitesimal neighbourhoods of a closed point | `𝔸¹`; `𝔸²`; `BG` | At zero first lengths are `1,2,3` on `𝔸¹`; first thickening of `𝔸²` is `k[x,y]/(x,y)²`, length `3`. In `BG` residual ideal is zero, so every neighbourhood equals `BG`. | Index and powers agree with repaired §0.4; not a geometric-point thickening of an atlas. |
| 7.2 normal space and representation | `[𝔸¹/𝔾_m]`; `[𝔸ⁿ/GLₙ]`; `𝔸²`; `BG` | Left action induces `(λ·t)(a)=t(λ⁻¹a)`: conormal weight `−1`, dual normal weight `+1`. Normal is standard `kⁿ`, zero for `n=0`; scheme normal is `k²` with trivial stabiliser; `BG` normal is `0`. | Dual and action direction fixed by computed two-term example. |
| 7.3 tangent–normal exact sequence and criterion | `Bμ_p`, `Bα_p`, `B𝔾_m`, cusp; Frobenius orbit | For first two: `N=0`, `T=k`, `dim Lie−dim G=1−0=1`. For `B𝔾_m`: `T=N=0`, `1−1=0`. Cusp: `T=N=k²`. Map `𝔾_m→𝔾_m`, `t↦t^p`, has differential `0`, cokernel dimension `1`; replacing orbit tangent by image of differential would be wrong. | Exact sequence survives characteristics 2 and 3 and non-smooth stabilisers; smooth-stabiliser iff zero kernel matches pin. R06 is locator only. |
| 7.4 quotient normal space and orbit | `GLₙ` at zero; scaling at 1; Frobenius action; binary quadratics | Values `N=kⁿ`; scaling orbit in `𝔸¹` is open not closed and excluded; Frobenius orbit is all `𝔾_m`, smooth, stabiliser `μ_p`, `N=0`. For `SL₂` at `uv`, char≠2, discriminant derivative `(0,2,0)≠0`, normal dimension `1` with trivial action. | Closed orbit route works over arbitrary fields; no surjectivity of orbit differential assumed. |

The sign convention is tested both in §7.2 and the chart comparison §7.4; the residue-field inclusion `κ(x)→k` reverses on spectra; the stabiliser is the diagonal pullback of the relation, not the relation itself. Left homogeneous quotients in SGA 3 pass to the required right-coset convention by inversion. The worked zero-dimensional DM example retains quasi-compact diagonal: `Bℤ` would have infinite stabiliser, while `B(ℤ/2)` has order two. For a finite-type point over algebraically closed `K`, its finite residue extension has degree one, giving the stated `BG` form. No denominator or natural-number subtraction is used without its stated range; in §7.3 `dim Lie(G)≥dim G` is the relevant inequality.

### Source sample and expanded source audit

All fifteen seeded targets were read at their locators. Page numbers below are printed pages, except where the extraction page is explicitly distinguished. Theorems are paraphrased, not copied. The cached source versions are those recorded in the manifest.

| Target | Text read | Hypotheses and support |
|---|---|---|
| 0.1 | stacks-04XE lines 625–665, Lemma 100.7.1, Definition 100.7.2, Remark 100.7.3, pp.13–14 | Smooth-local definition and ascent/descent, with regular schemes locally Noetherian; narrower pinned results are not substituted for arbitrary-base reducedness. |
| 1.4 | stacks-06RD lines 1675–1689, Lemma 101.19.1, p.36 | Six sufficient schematicity cases, including decency/local separation, read with the group-space references. |
| 2.1 | stacks-06QB lines 2613–2663, Definition 101.28.1 and Lemmas 101.28.2–5, pp.56–57 | Gerbe relative to an algebraic stack, algebraic-space base and universal factorisation; no neutrality assumption. |
| 2.2 | stacks-06QB lines 2664–2695, Lemma 101.28.6, pp.57–58 | A section determines its own flat lfp automorphism group and the equivalence with its classifying stack. |
| 2.4 | stacks-06QB lines 2722–2820, Proposition 101.28.9 and Lemma 101.28.10, pp.58–60 | Flat lfp inertia and the relative relation-space criterion, including the epimorphism condition. |
| 2.6 | stacks-06QB lines 2919–2953, Proposition 101.29.1 and its example, pp.62–63 | Reduced stack and quasi-compact inertia; nonreduced counterexample excluded. Generic-flatness input also opened. |
| 3.4 | stacks-06ML lines 1312–1368, Lemmas 100.11.10–14, pp.28–29; stacks-06QB lines 2846–2861, Lemma 101.28.12, p.61; stacks-06RD lines 4831–4839, Lemma 101.51.1, p.101 | Regularity, representative maps, gerbe structure and non-field bases distinguished; decent-space comparisons read at lines 1500–1552. |
| 4.1 | stacks-06RD lines 1609–1665, Lemma 101.18.7 and proof, pp.35–36 | The three lft conditions, not existence alone, are equivalent. Field-representative construction checked inside the proof. |
| 4.5 | stacks-06RD lines 4866–4878, Remark 101.51.3 and Lemma 101.51.4, p.102 | Local Noetherianity for closed-point equivalence; no omitted separation hypothesis. |
| 5.1 | stacks-06RD lines 4686–4735, Definition 101.48.1, Lemmas 101.48.2–5, pp.98–99; stacks-04XE lines 1453–1463, p.31; stacks-decent-spaces lines 567–589, pp.12–13 | Representative-independent qc point and decency; the scheme-representable branch is missing (R03). |
| 5.3 | stacks-decent-spaces lines 1214–1227, p.26, and 1542–1552, p.33; alper-moduli lines 16528–16538, Proposition 7.4.39, printed p.334 (extraction p.380); rydh2011 lines 1268–1305, pp.27–28 | Alper's Noetherian case is not mistaken for the full decent claim; the roadmap gives the gerbe-base/decent-space proof for that extension. |
| 5.5 | rydh2011 lines 1236–1245, Appendix B introduction, p.26; stacks-06ML lines 1293–1297, p.27 footnote | Finite versus arbitrary representative and the fppf-image issue checked; LMB's original text remains uncertified, not inferred to have been read. |
| 6.1 | stacks-06ML lines 1214–1237, pp.26, and 1352–1368, p.29; stacks-06RD lines 1617–1665, pp.35–36 | Flat lfp groupoid and quotient route actually appear in the proofs. Relation space versus stabiliser checked independently; R05 supplies missing owned inputs. |
| 6.4 | stacks-06RD lines 1527–1528, Lemma 101.17.8, p.33; alper-moduli lines 6993–7024, Proposition 4.5.16, printed p.140 (extraction p.184); ahr2020 lines 476–478, p.10 | Source special cases have stronger finiteness assumptions; cancellation and §4.1 justify the explicitly supplied general rational-section proof. |
| 7.2 | ahr2020 lines 39–44, p.1, and 475–486, §3.1, p.10 | Conormal dual and stabiliser action agree. The roadmap states its local hypotheses and uses its own construction rather than importing all of the paper's global slice hypotheses. |

The prior review left external Stacks chapters unread. Those gaps in evidence are closed here: Morphisms of Spaces Lemma 67.10.8 (stacks-morphisms-spaces lines 904–911, p.20) and Proposition 67.32.1 (3050–3068, p.65); Properties of Spaces Proposition 66.13.3 (stacks-properties-spaces lines 799–807, p.18); Groupoids in Spaces Lemma 78.25.1 (stacks-groupoids-spaces lines 1490–1508, pp.31–32), Lemmas 78.27.1–2 (1663–1685, p.35); More on Groupoids in Spaces Lemma 79.9.4 and Proposition 79.10.3 (stacks-more-groupoids-spaces lines 373–384 and 570–596, pp.8, 11–12); Algebraic Stacks Lemma 94.16.1 and Remark 94.16.3 (stacks-algebraic-stacks lines 908–933 and 1028–1031, pp.20,22); Artin's Axioms Lemma 98.5.2 (stacks-artin lines 292–294, p.7) and the field-change texts in R06.

The regularity/reducedness repair was checked directly at stacks-descent lines 2277–2284, 2306–2329 (35.18.1, 35.18.4, 35.19.1), stacks-spaces-descent lines 424–466 (74.9.2, 74.9.4, 74.9.5) and 739–741 (74.11.15), and stacks-spaces-over-fields lines 834–856 (72.10.8–9) and 1213–1219 (72.16.1). The homogeneous-space contract is supported by sga3-vi-a lines 871–894, Exposé VI_A Théorème 3.2, printed p.313; smooth affine finite-type ambient group and closed subgroup are retained. Criteria 97.17.1–2 and 97.18.3 were opened at stacks-criteria lines 1401–1428 and 1509–1519. The new kernel text was checked at stacks-sheaves-on-stacks lines 953–955 and 1060–1097.

The manifest now parses with 25 entries: 23 certified and the same two settled uncertified works. The 18 original entries retain their recorded values. Seven chapters were fetched only through the source service, including Formal Deformation Theory to give R06 an exact replacement. All cited works now have manifest entries. An initial unavailable Algebraic Stacks URL was resolved through its Stacks tag; no unresolved source request remains. No source extraction was copied into the repository. The README's source chapter order is not adopted as a plan: the back references and local dependencies force the mathematical order, and the chapters are revisited where needed.

### Library and ownership audit

The pins checked are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, from the content manifest. Paths below are relative to those libraries. The following declaration bodies, not just name matches, were opened:

| Pinned file and line | What the declaration supplies / does not supply |
|---|---|
| `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49` | `IsStack` extends `IsPrestack`; it does not define algebraic stacks or impose algebraic representability. |
| `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54`; `ResidueField.lean:45` | Scheme fppf topology and scheme residue fields, not residue fields of stack points. |
| `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean:44`, `Flat.lean:42`, `FiniteType.lean:42`, `FinitePresentation.lean:46`, `Smooth.lean:59`, `QuasiFinite.lean:72` | Scheme morphism predicates; stack representable/smooth-local versions remain supplier constructions. |
| `Mathlib/AlgebraicGeometry/Properties.lean:68`; `Noetherian.lean:54` and 271; `Geometrically/Reduced.lean:109` | Reduced and locally Noetherian schemes, lfp/lft comparison over locally Noetherian target, and reducedness ascent with that target hypothesis. No arbitrary-base replacement hidden here. |
| `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean:564`; `IdealSheaf/Subscheme.lean:453` and 470 | Vanishing ideal, subscheme and inclusion on schemes; they are imported, not a second stack-substack construction. |
| `Mathlib/Topology/JacobsonSpace.lean:70`; `AlgebraicGeometry/Morphisms/FiniteType.lean:112`; `RingTheory/Jacobson/Ring.lean:691` | Jacobson topology, finite-type scheme instance and finite field extension from finite-type field algebra. |
| `Mathlib/RingTheory/Smooth/Kaehler.lean:324`; `Smooth/Basic.lean:125` and 290 | Retraction/cotangent comparison, formal-smooth lift and split-injection criterion with the source's hypotheses; these are scheme/algebra inputs, not the stack tangent–normal theorem. |
| `TauCeti/AlgebraicGeometry/Stack/Basic.lean:37`; `AlgebraicSpace/Basic.lean:68`, 74, 113, 195 | `SchPseudofunctor`, scheme presheaves, representable diagonal, étale atlas and `IsAlgebraicSpace`. The last includes no separation axiom. No pinned algebraic-stack carrier is supplied by the stack file. |
| `TauCeti/AlgebraicGeometry/Scheme/Regular/Scheme.lean:68`, 90; `Scheme/Regular/Descent.lean:56` | `IsRegular` extends local Noetherianity; smooth ascent; flat-surjective descent with locally Noetherian target. These are the repaired imports. |
| `TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyReduced.lean:56` | Smooth implies geometrically reduced; combining with Mathlib gives the stated Noetherian reducedness ascent only. |
| `TauCeti/Algebra/Coalgebra/Comodule/Basic.lean:50`; `Comodule/Cat.lean:50`; `AlgebraicGeometry/AffineGroupScheme/LinearlyReductive.lean:60` | Comodules, their category, linear reductivity; no need to duplicate these as stack-point targets. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212`; `Tangent/Regularity.lean:112` | Finite-type affine group embedding and smooth iff Lie dimension equals dimension; the latter is outside the algebraically closed subsection. |
| `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:217`; `Torsor.lean:154`, 160; `Coinvariants.lean:219`, 255 | Quotient sheaf, local surjectivity and relation pullback; representability results have reductivity/geometric-reducedness hypotheses. They do not supply the required arbitrary closed-subgroup quotient theorem. |

Object searches included residual gerbes, decent spaces/stacks, stabilisers, closed substacks, reduced induced structures, normal/conormal representations, one-point stacks, and quotient representability, not just proposed declaration names. Topological/manifold “normal space” hits are different objects. The fundamental algebraic-stack, residual-gerbe and stack-point carriers do not occur at these pins. The strongest concrete duplication found is R07 on the board; the regular-scheme duplication from the previous round is repaired.

Current main supplier files and their pertinent sections were read, along with two full main-roadmap introductions/layer layouts (SchemeAndStackFoundations and ReductiveGroups) and FlagVarieties for house style and ownership. Every direct supplier citation was resolved against main, except the new AlgebraicModuliForArithmeticGeometry roadmap, which was read at its open head. In particular:

- `TauCetiRoadmap/SchemeAndStackFoundations/README.md`: §1.2 at 2166; §§1.7–1.9 at 2306–2401; §1.12 at 2512; group spaces, groupoids and torsors §§1.13–1.16 at 2521–2693; bootstrap §1.17 at 2728; stack groupoids/2-products §1.18 at 2849; algebraicity/DM §1.19 at 2923; inertia, topology and `SmoothLocal` §1.20 at 2949; quotients §1.21 at 3055; quasi-coherent modules §1.22 at 3092; §1.23 at 3124; generic flatness §4.12 at 5915; regularity §4.13 at 5945. The §1.22 pushforward is now explicitly the quasi-coherent right adjoint, not unrestricted big-site direct image.
- The nine resolver leads are not missing declarations: `Groups.GroupSpace` (§1.13, line 2557), `Groups.IsTorsor` (§1.15, 2689), `IsDeligneMumford.iff_unramified_diagonal` (§1.19, 2934), `SmoothLocal.atlas_independent` and `Stacks.points.pullbackSurjective` (§1.20), `Spaces.EtaleLocal` (§1.8, 2397), `Stack.stackification` (§1.18, 2865), `actionQuotient.torsorEquiv` (§1.21), and `IsGerbe.equivalence_iff` (AlgebraicModuliForArithmeticGeometry §4.1). They are supplier-plan names rather than pinned library declarations. Check references to comodules (3111), real torsors (3084) and the pathological generic point (2330) also resolve.
- AlgebraicModuliForArithmeticGeometry, new pull request #853, §4.1 (README around 1863–1929), §8.1 (9650–9678), §8.3 (9726–9788): site gerbes, deformation groupoids and framed fibre-product/exact-sequence input. Its RS implication is conditional and does not close the explicit algebraic-stack RS gap by itself. No reverse supply was found.
- `TauCetiRoadmap/ReductiveGroups/README.md`: Layer 1 at 1275, Layer 3 at 1537, Layer 3A at 1683. Existing normal-subgroup quotient results do not replace the arbitrary closed-subgroup homogeneous quotient gap. The orbit comparison is not an input to §7.4. FlagVarieties' scope likewise assigns that homogeneous quotient to ReductiveGroups.
- GroupSchemesOverABase, new pull request #1522, README 41–60 and 79–84, owns general base/group-space quotient work and explicitly leaves the affine-group quotient to ReductiveGroups Layer 3. It does not own the residual-gerbe construction. FunctionFieldArithmeticPartII #1831, README 53 and 7366, asks for zero-dimensional DM residual-gerbe consequences; LanglandsParameterStacks #1202, README 521–522, consumes residual-gerbe sheaves. Neither independently constructs the objects here.
- The supplied overlap report, computed from main `83bb79f` and open heads, has no shared-head conflict, dropped supplier ID, or ID defined only by an open revision. Its close neighbours include SchemeAndStackFoundations revisions #1808, #1656, #1854; citations here resolve on main, so no dependency on those revisions is introduced. Object searches through the roadmap tool found no second residual-gerbe owner. The board-package scan, after reading its index, found the narrower closed-substack owner in R07. The tool's “no match” for that exact object phrase did not justify ignoring an available board package.

### Supplier gaps and direction

All 16 gap slugs occur both in the README and plan, with named suppliers and matching `neededBy`/prerequisite sets. They are explicit contracts, not allegations of unowned prerequisites. Their precise packages were checked as follows:

| Gap | Minimality/precision evidence |
|---|---|
| `stack-morphism-permanence` | Stack-level composition, base change, fppf descent/cancellation and local-Noetherian preservation; scheme predicates at the pins do not prove these stack claims. |
| `flat-lfp-open` | Opens on the supplied topology of stack points, not the existing scheme-only theorem. |
| `inertia-of-presentations` | Relative and absolute inertia lft and presentation-stabiliser identification; the basic supplier inertia definition alone lacks this API. |
| `stack-separation-axioms` | Diagonal definitions and their explicitly listed comparisons; DM predicate reused from §1.19. |
| `quasi-dm-flat-presentation` | Flat lfp locally quasi-finite scheme presentation in both directions, beyond the supplied smooth atlas. |
| `flat-groupoid-quotients` | Flat-lfp quotient/presentation and fully-faithful restriction package; the source criterion was opened, not replaced by the smooth-groupoid case. |
| `decent-algebraic-spaces` | Decency and field monomorphisms/sobriety; native `IsAlgebraicSpace` has no decency or separation field. |
| `quasi-separated-space-schematic-locus` | Dense schematic open for a quasi-separated algebraic space, checked against Proposition 66.13.3. |
| `reduced-scheme-residue-field-factorisation` | Reduced-source singleton and specified no-specialisation-set factorisations; the pinned residue-field construction does not state these. |
| `group-spaces-over-fields` | Schematicity under the stated alternatives; groupoid chapters opened and no native general group-space theorem found. |
| `quasi-finite-over-fields` | Monomorphism followed by locally quasi-finite map to disjoint field spectra; exact field-base hypothesis retained. |
| `isomorphism-fpqc-local-spaces` | Algebraic-space fpqc descent, not only scheme isomorphism descent. |
| `generic-flatness-spaces` | Reduced space base, quasi-compact lft source morphism and dense open flat-lfp conclusion; supplier currently gives the scheme input. |
| `reduced-regular-smooth-local` | Narrowed after previous review: arbitrary-base reducedness and space-level results remain; already pinned regular-scheme facts excluded. |
| `algebraic-stacks-satisfy-rs` | Algebraic-stack RS and finite-separable tangent base change; exact missing conclusions, supported after the locator correction R06. |
| `homogeneous-quotient-scheme` | Smooth affine finite-type `G`, arbitrary closed `H`, separated finite-type smooth quotient and dimension; stronger than the pin's reductive quotient cases. |

These are related API packages with explicit hypotheses and conclusions, not vague requests for an entire theory. None has supplier `none`. No additional unowned prerequisite was found; R05 is an omitted edge to owned targets. The new ownership boundary in R07 must point forward to its consumer.

The prescribed dependency command was run against the actual candidate, order and content checkout. Its complete output was:

```text
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2058 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The plan has no local prerequisite inversion. The design is not an extension disguised as a replacement for an existing roadmap: its core point/gerbe theory is new, and its general-purpose prerequisites remain imports or declared gaps. R07 is a repairable ownership boundary within that scope.

### Shape, headlines and Lean status

Counts checked mechanically: eight layers, 38 targets, 71 API entries, 133 Checks; each target has a Needs line and at least three Checks, and README/plan test counts agree target by target. Each layer has Examples and Dependencies. Definitions have the stated APIs. The repaired graph has the intended mathematical direction; R05 records the one omitted local API dependency found. The main-roadmap heading pattern, Summary, ownership, conventions, contracts, build paragraph, consumers and references are present. No computational algorithm, copied source passage, process instruction, machine path, HTML anchor, LaTeX delimiter, route-only good-prime restriction or suspicious instruction was found in the design. Proposed own names use the declared italic convention rather than asserting nonexistent Lean declarations in backticks. Supplier/library backticked names were resolved as above.

Headline inventory from the Summary:

1. Characterisation of finite type points (§§1.1, 4.1).
2. Existence of residual gerbes under the independent general hypotheses (§§4.2–4.4).
3. Residual gerbe over its residue field, representative base change to `BG_x`, and neutrality (§§5.3, 6.2, 6.3).
4. Identification at a rational point (§6.4).
5. Closed-immersion criterion at a closed point (§4.5).
6. Tangent–normal exact sequence and its smooth-stabiliser comparison (§7.3).

Each needs an algebraic-stack/stack-point/residual-gerbe carrier absent at the pins; the tangent result also needs the stack conormal and framed deformation interfaces. Native scheme or bare group analogues would be stand-ins. There is no `Suggested.lean` in this design package, so there are zero sorried declarations to test for padding, zero declaration types for a `#check` binder comparison, and no import/sorry-data/`set_option` violation to report. At package stage the module docstring must name these unavailable headlines and their missing carriers; it must not replace them by boundary examples. **Elaboration: not available (this lane does not elaborate).** No Lean command was run, and no build success is claimed.

## Not verifiable

- `lmb2000`, Chapter 11, Définition 11.2, and `olsson2016`, Chapter 11: settled uncertified texts, not readable in the provided legal cache. They were not requested again. Rydh's accessible Appendix B supports the distinction used in §5.5, but does not constitute inspection of LMB's original text.
- Lean elaboration and one-tactic execution are unavailable in this design lane; there is no acceptance file yet. Statability above is assessed from the pinned carrier definitions, not from a claimed compilation.
- A pull-request head for the plural board package VirtualFundamentalClasses is not provided by the index or its metadata. Its actual readable package and design texts were checked for R07. No claim about an unidentified pull request, or about whether downstream authors will adopt the proposed contracts, is made.

There were no maintainer notes to adjudicate. The formerly unread supplier-source chapters were fetched and read, so they are no longer listed as unverifiable. No new missing-reference request is pending.

## Source issues

- **Gap** in stacks-04XE at Lemma 100.10.1, printed page 23: the source omits uniqueness of the reduced closed substack with prescribed support; it should use the presentation correspondence and uniqueness of the reduced induced structure on the atlas; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 102: the proof leaves local Noetherianity of the reduced closure and gerbe base to the reader; it should cite local-Noetherian preservation and smooth descent along the gerbe; affects the proof.
- **Misprint** in stacks-06QB at Lemma 101.28.13, printed page 61: the proof reverses the direction of the map on points twice; it should map points of the gerbe to points of its base; affects nothing.
- **Misprint** in stacks-spaces-descent at Lemma 74.11.21, printed page 18: the immersion proof says its remaining task is a closed immersion; it should say a quasi-compact immersion, the actual statement and conclusion; affects nothing.
- **Misprint** in alper-moduli at Remark 4.5.14, printed page 140: the finite extension of fields attached to a representative is written in the reverse direction; it should be the representative field over the residue field; affects nothing.
