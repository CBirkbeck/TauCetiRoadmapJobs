<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13006#issuecomment-6789216108 -->
Review (claude) of 1bf954d

Verdict: needs_changes

1. **F01** (P2) 11.1: the claim about open substacks of the stack of morphisms puts its hypothesis on the wrong object

   **Location:** `packages/VirtualFundamentalClasses/README.md:2483`–`2484`: "Every open substack of the stack of morphisms `Mor_𝔅(𝒞, X)`, when that stack is a DM stack, is such a space".

   **Claim:** every open substack `M` of `Mor_𝔅(𝒞, X)` is a relative space of maps as soon as `Mor_𝔅(𝒞, X)` is a DM stack.

   **Witness:** `𝔅` the doubled-origin line, `𝒞 = ℙ¹ × 𝔅`, `X = Spec k`: `Mor = 𝔅` is DM, but `M = 𝔅` is not separated (required at `:2478`). For prestable curves, `Mor = 𝔅` is not DM, so the Example at `:2665` is not covered.

   **Repair:** replace the sentence by: "Every open substack `M ⊆ Mor_𝔅(𝒞, X)` that is a separated DM stack over `k` (Convention 1), with `F` the restriction of the universal map, is such a space: `M → 𝔅` is representable (behrend1997 line 135), hence of Deligne–Mumford type, and an extension `T̄ → Mor_𝔅(𝒞, X)` of `g` factors through the open `M` because `T` and `T̄` have the same underlying space, so the bijection is the universal property of `Mor_𝔅(𝒞, X)`. The stack of stable maps is such an `M` (behrend1997 Proposition 4, line 139). No condition is put on `Mor_𝔅(𝒞, X)`, which over the stack of prestable curves is not a DM stack." Add the doubled-origin instance as a Check. Tested: `M = 𝔅` (doubled origin) is excluded as non-separated; `M = 𝔸¹ ⊂ 𝔅` is separated, `M → 𝔅` is étale, and Check 1 of 11.1 (`X = Spec k` iff étale) agrees; the stable-map substack over prestable curves is included.

2. **F02** (P3) Supplier names used in the layers are missing from Exact supplier contracts

   **Location:** `README.md:250`–`251`: "every backticked Lean name below is a declaration of Mathlib or Tau Ceti at the pins or of a supplier roadmap, named in Exact supplier contracts"; uses at `:601`, `:626`–`627`, `:1054`, `:1174`, `:1488`.

   **Claim:** every library or supplier name the layers use is listed in the contracts.

   **Witness:** `setoid_criterion`, `deformationToNormalCone`, `specialization`, `commutes_with_c1`, `DQCoh.affineEquiv` and Mathlib `topologicalKrullDim` occur nowhere in `README.md:255`–`468`; §2.18, consumed by 7.3 (`:1498`), has no contract bullet.

   **Repair:** add to the contracts, without changing any layer text:
   - From Mathlib: `topologicalKrullDim` (`Mathlib/Topology/KrullDimension.lean`), the Krull dimension of a topological space, used through §0.7 in 1.3.
   - SchemeAndStackFoundations §1.20: add `setoid_criterion` (an algebraic stack with trivial inertia is an algebraic space).
   - SchemeAndStackFoundations §2.18 (new bullet): `DQCoh.affineEquiv` (`D(ModuleCat A) ≌ DQCoh (Spec A)`), for the local representatives of 7.3.
   - SchemeAndStackFoundations §5.5: add `deformationToNormalCone`, `specialization` and `commutes_with_c1`.

   All six resolve where cited (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:2953`, `:4120`, `:7123`, `:7144`, `:7157`; `Mathlib/Topology/KrullDimension.lean:37` at the pin), so only the contract list is incomplete.

3. **F03** (P3) The `Suggested.lean` docstring states headline 4 without the affine diagonal of Layer 8

   **Location:** `packages/VirtualFundamentalClasses/Suggested.lean:46`–`47`: "For a morphism `M → 𝔐` of Deligne–Mumford type from a Deligne–Mumford stack to an algebraic stack of pure dimension `m`".

   **Claim:** headline 4 (and 5, which is stated on the same `τ^{≥−1}L_{M/𝔐}`) holds for every quasi-separated DM stack `M`.

   **Witness:** `README.md:1611`–`1612` and Convention 8 (`:244`) construct `τ^{≥−1}L_{M/𝔐}` and `C_{M/𝔐}` only for `M` with affine diagonal. The plane with doubled origin is a smooth DM stack over `k` whose diagonal is not affine (`𝔸² ∖ 0` is not affine): the docstring covers it, Layer 8 does not.

   **Repair:** in item 4 write "from a Deligne–Mumford stack `M` with affine diagonal (README, Convention 8)", and in item 5 "For `M → 𝔐` as in 4 and `φ : E → τ^{≥−1}L_{M/𝔐}`". Items 6–8 already assume `M` separated, which implies it. Tested on the witness: the doubled plane is then excluded in the docstring as in the README.

Three findings: one P2 and two P3; one blocking. Both findings of round 4 are repaired and the repairs hold on their counterexamples. The new findings are in text no repair touched: a claim in 11.1 whose hypothesis sits on the wrong object, supplier names used in `*Needs:*` lines that the supplier contracts do not list, and one hypothesis of Layer 8 missing from the `Suggested.lean` docstring. The prescribed elaboration exits 0 with no output, and the dependency check reports 0 problems. No author file was edited; the sources manifest was not changed.

## Previous findings and repairs

| Round-4 finding | Status | Repaired passage (current package) | Test on the refuting instance |
|---|---|---|---|
| F01 (P2) cone-stack dimension defined by a global difference | **Repaired** | `packages/VirtualFundamentalClasses/README.md:1411`: "`dim_z 𝒞 := dim_ξ C − rk_y E`"; `:1417`: "`dim 𝒞 := sup_z dim_z 𝒞`"; `:1433`: "`dim_x BE = dim_x X − rk_x E`" | `X = Spec k ⊔ ℙ¹`, `E = 0 ⊔ T_{ℙ¹}`: pointwise `(0−0, 1−1) = (0, 0)`, sup `0`; the old formula gave `(1, 0)`. `B𝔾_a`: `0 − 1 = −1`, as stacks-properties line 1421. |
| F02 (P3) tangent arrow reversed in the 11.3 Check | **Repaired** | `README.md:2554`–`2555`: "the fibre `H⁰(C, F^*T_X)^∨ → T^*_{[F]}M` of `h^0(φ)` is dual to the tangent map `T_{[F]}M → H⁰(C, F^*T_X)`" | `Mor(ℙ¹, 𝔸¹) ≅ 𝔸¹`, `x = 2t` over `ℚ`: `e(dx) = d(2t) = 2 dt`; derivative `∂_t ↦ 2∂_x`, dual `dx ↦ 2dt`; the inverse gives `dt ↦ ½dx`. |

The same patterns were searched in the rest of the package. Global dimension minus a varying rank: 8.4 (`:1806`), 8.5 (`:1832`–`1837`), 9.2 (`:2013`–`2020`), 10.2 (`:2205`–`2210`), 10.4 (`:2253`–`2259`), 11.6 (`:2624`–`2641`) are pointwise or per open and closed part; 5.1, 5.2 and 9.4 assume constant rank; 6.2 uses `dim X` only as an upper bound. Direction of a tangent or cotangent comparison: 9.1 (`can_g(δ·ḡ) = can_g(ḡ) − δ`), 9.3 (`φ_g`), 11.4 (`δ ↦ π^*δ ∘ h^0(e)`) agree with the repaired Check (`φ_g(c) = 2c` on both routes). No residual occurrence.

The ownership question about the open VirtualFundamentalClass and algebraic GromovWittenTheory roadmaps was marked not actionable in this package in the round-2 repair report, with a reason that still holds (choosing the owner changes two roadmaps' scopes and the merge order). It is not re-raised.

## Verified sound

Read in full: the four author files (README 2741 lines, 11 layers, 53 numbered targets; `Suggested.lean`; `metadata.toml`; `sources.toml`, 22 entries), the round-4 review, the round-5 repair report and its diff (README §§7.2, 8.4, 8.5, 10.2, 11.3; one `cited_for`), the citation and overlap leads and the board-package index. For text no repair touched, the round-4 table was relied on only where its rows carry values; the sampled targets, the headlines and every passage the repairs changed were recomputed below.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.4 function field, `e(𝒱)` | `[𝔸¹/μ₂]`; `[Spec ℂ/(ℤ/4)]` over `ℝ`; `BS₃` | `k(x)^{μ₂} = k(x²)`, `e = 1` generically, `2` at `0`; invariants `ℝ`, kernel order `2` (acting group `4`); `e = 6`, field `k` | sound |
| 1.4 generic finite étale inertia | characteristic `p`, `𝔸¹ × B(ℤ/p)` | inertia constant of degree `p`, étale; generic flatness plus unramified gives étale in general | sound |
| 1.5 base-change invariance | `Spec k → BG` along `B(G × H) → BG`; along `Spec k → BG` | fibre product `BH`, degree `|G×H|/|H| = |G|` on both sides; second: `G`, not integral for `G ≠ 1`, excluded by hypothesis | sound |
| 2.4 comparison | `Spec k`; `𝔸¹`; doubled-origin line | `Z_0 = ℤ`, `R_0 = 0`, `A_0 = ℤ`; `A_0 = 0`, `A_1 = ℤ`; relations `(a_P, a_0, a_0)`, quotient `ℤ` with `[0₂] = −[0₁]` | sound |
| 2.3 `A_0([𝔸¹/μ₂])` | `div g(x²)` | coefficient `2·ord_0(g)` at `Bμ₂`, `ord_P(g)` elsewhere; quotient `ℤ/2` | sound |
| 3.4 push–pull, rational case | `f : B(ℤ/2) → Spec k`, `φ : BG → Spec k`, `G` the group of 1.1 | `ℱ' = B(ℤ/2) × BG` has no proper cover (a cover composed with the proper projection would cover `BG`); `f'_*` of 3.3 is not defined | covered by Convention 3 (`README.md:185`–`189`), which states rational pushforward only for stacks with a proper cover; no finding |
| 4.2 local embeddings | diagonal of `BG`; fat point in `𝔸²` | finite étale, fibre `G`, codimension `0`; cone dimension `2`, normal-sheaf fibre `𝔸³` | sound |
| 4.4 consequence `v^![C] = [C_{X'/Y'}]` | `v = i` regular; `Y = 𝔸²`, `X = {xy = 0}`, `Y' = {x = 0}` | both sides have `s^!`-image `c_d(N) ∩ [X]`; `v^![C]` = fibre over origin (the other component contributes `c_1(O) = 0`), `[C_{X'/Y'}]` = zero section, both `0` in `A_1(𝔸²) = 0`; dimensions `2 − 1 = 1` | sound |
| 5.1 homotopy invariance | rank `0`; `O(−1)` on `ℙ¹`; `q : E ⊕ F → E` | identity; `s^!s_*[ℙ¹] = −[pt]` in dimension `0`, restriction would give `[ℙ¹]`; `s'^!q^*π^* = id = s^!π^*` | sound; shift `+r` as stacks-chow line 3445 |
| 6.1 coarse space (headline) | `BG`; `[𝔸¹/μ₂]`; `ℤ/p`-quotient | `1/|G|`; integral `ℤ/2 → 0`, rational `0 → 0`; `(1/p)·[k(y) : k(y^p)] = 1` with norm `z = y^p − x^{p−1}y` | sound |
| 6.2 quotient stacks (headline) | `𝔾_m` on `𝔸² ∖ 0`; `μ_n` on a point; dimension count | `A^{𝔾_m}_2 = A_1(ℙ¹) = ℤ` (shift `2 − 1`); `ℤ` in degree `0`, `ℤ/n` below, rationally `ℚ`; complement of dimension `< (dim X + l) − (dim X − i) − g = i + l − g` | sound |
| 6.3 degrees (headline) | `BG`; `Spec K`; gerbe over `ℝ`; `[ℙ¹/μ₂]` | `1/|G|`; `[K : k]`; `1/2 = 2/4`; `div(x²/(x²−1)) = 2[𝒫] − [𝒪]`, degrees `2·½ − 1 = 0` | sound |
| 7.1 recognition of cones | `C = 𝔸¹` of weight `2` over a point; split model | `S_1 = 0`, `S_2 = k`, `S/S'_+S = k[x]` not `Sym` in degree one: excluded; route: `K = S'_+K`, `K_0 = 0`, so `K_n = 0` | sound; the hypothesis excludes the counterexample to the source's Proposition 1.4 |
| 7.1 exact sequences of abelian cones | `0 → O → O² → O → 0`; `F' = 0` | `0 → 𝔸¹ → 𝔸² → 𝔸¹ → 0`; `C(E) → C(E) → X`; order `C(E) → C(F) → C(F')` by contravariance | sound; corrects a misprint of the source (below) |
| 7.2 pointwise dimension (repaired) | `BE` on `pt ⊔ ℙ¹`; `[𝔸¹/𝔾_a]` both actions; fibre of the groupoid | `(0, 0)`; `1 − 1 = 0` both; `E_y ⊗ κ(ξ)` of dimension `rk_y E`, open and closed in a fibre étale over the diagonal part | sound |
| 8.3 base change and products | `xy = 0` over `𝔸¹_x`; `t ↦ t²`; product of two dual-number points | `[A --x--> A dy]` pulls back to `[k[y] --0--> k[y]]`, `h^{−1} = k[y] ≠ 0`; `[A' --2t--> A']` on both sides; `pr` flat, so truncation commutes with `pr^*` | sound |
| 8.5 pure dimension (headline, repaired) | `W = 𝔸¹ ⊔ 𝔸²` over a point; `Spec k → B𝔾_m`; closed point of dual numbers | `(1 − 1, 2 − 2) = (0, 0) = m`; `0 − 1 = −1 = m`; `C = Spec k[t]/(t²)` of dimension `0 = m`, `N = 𝔸¹` | sound |
| 8.5 lci criterion | `I = x(x, y)`; fat point | `Sym(J) = k[x,y,T₁,T₂]/(yT₁ − xT₂)`, a 3-dimensional domain onto the Rees algebra: `C = N`, depth `0 <` dimension `1`; `dim C = 0 ≠ 1 = dim N` | sound; equality alone is not the criterion |
| 9.1 obstruction, `can_g` | dual numbers to `k[ε]/(ε³)`; `𝔸¹`, `h = 0`, `ḡ : x ↦ bε` | `(ε + aε²)² = ε² ≠ 0`; `κ(dx) = −bε`, after `δ = c`: `−(b + c) = κ − δ`; `κ ∘ d = h^♯` since `ḡ^*` kills `I` | sound |
| 9.3 characterisations (headline) | `φ = 0` on `𝔸¹`; `φ = (0, id)` in characteristic `2`; cone of an obstruction theory | `φ_g = 0 : k → k` not bijective; `φ^*ω = 0` but `(x + ax²)² = x² ≠ 0`; cone has cohomology in degrees `≤ −2`, so `Ext¹(Lg^*L, J) → Ext¹(Lg^*E, J)` is injective | sound; (1) ⇒ (3) and both controls |
| 9.4 basic example | `s = x²`; `s = 0`; rank count | `[A --2x--> A dx]`, `vd = 0`; `[O --0--> Ω]`, `Ob = O`; `rk E = n − r` | sound |
| 10.1 resolutions | `E = 0` with `[0 → 0]`, `[O --id--> O]`; `[0 → Ω]`, `[G → Ω ⊕ G]` | `K_1 = 𝔸¹ × M`, kernels of ranks `1, 0`; `0 + (n + g) = g + n` | sound |
| 10.2–10.4 class (headline) | `[O(a) --0--> Ω]` on `ℙ¹`; `pt ⊔ ℙ¹`; dual-number point; `Ob = 0` | `Ob = O(−a)`, degree `−a`; summands in `A_{m+a−(a−r)}`, degrees `(1, −1)`; `Ob = A/(x)`, class `2[pt]`; split injection, smooth, `[M]` | sound |
| 10.5 products | two `ℙ¹` theories; point factor | `(−1)(−1) = 1` in `A_0`; identity; grading `m + m' + r + r'` as source line 1720 | sound |
| 10.6, 10.8 pullback and counts | flat `v` between pure-dimensional stacks; curve `B` | fibres pure of dimension `m' − m`; base `𝔐 × B` of dimension `m + 1`, class in `A_1`, `i_b^![B] = [b]` of degree `1` | sound |
| 11.2 duality | `ℙ¹`, `O` and `ω`; genus `g` | `χ = 1`, `−1`; `χ(L) = d + 1 − g`, `χ(ω) = g − 1`; `RHom(V, ω[1]) = V^∨ ⊗ ω[1]` | sound |
| 11.3 Kodaira–Spencer (repaired) | `x = 2t` | `dx ↦ 2dt`; base-change map `c` is an isomorphism since `π` is flat | sound |
| 11.4 obstruction theory (headline) | `ℙ¹ → ℙ^r` of degree `d`; elliptic translates; isolated `id_{ℙ¹}` | `h¹ = 0`, dimension `(r+1)d + r`; `vd = 0`, `c_1(O) = 0`; `h^0(E) = k³` against `0` | sound |
| 11.1 open substacks of `Mor` | doubled-origin base, `X = pt`; prestable base | `Mor = 𝔅` DM but not separated; `Mor = 𝔅` not DM | R01 |
| 11.5–11.6 resolution and rank | `O` on `ℙ¹`; embedded point; double line; lines in `ℙ²`; `pt ⊔ ℙ¹` | `[H¹(H) → H¹(G)]` of Euler characteristic `1`; `H⁰ = k`; `H⁰ = 0`; `3 + 2 − 3 = 2`; ranks `(0, 1)` | sound |

### Sampled sources (all read at the cached texts)

| Target | Locators opened | Outcome |
|---|---|---|
| 1.4 | vistoli1989 lines 337 ((1.13)), 347–353 ((1.14) and the invariant-field example), 422–425, 428 | agree |
| 2.4 | stacks-chow lines 752 (Definition 8.1), 1356 (Definition 19.1); stacks-chow-spaces lines 126, 797 | agree |
| 4.2 | vistoli1989 lines 485 ((1.19)), 503–507, 508–526, 529–535, 1126 (Lemma 3.14), 1710–1711; behrend-fantechi1997 lines 998, 1617–1643 | agree |
| 5.1 | vistoli1989 lines 1671–1684 (Lemma 5.5, vector-bundle case), 1027; stacks-chow line 3445 (rank `r`, shift `k + r`) | agree |
| 6.3 | vistoli1989 lines 372–376, 428, 974–997; stacks-chow line 3936 | agree |
| 7.1 | behrend-fantechi1997 lines 237–243, 244, 268, 272–276, 277, 294–311, 323–345 | agree; the README corrects lines 272–276 and Proposition 1.4 |
| 8.5 | behrend-fantechi1997 lines 969–986, 1010–1023, 1656; stacks-properties lines 1374–1417; stacks-divisors lines 2017, 2151 | agree |
| 9.1 | behrend-fantechi1997 lines 1067–1078, 1091–1134 | agree |
| 9.3 | behrend-fantechi1997 lines 1139–1149, 1162–1201 | agree |
| 9.4 | behrend-fantechi1997 lines 1503–1519 (DM stacks at 1518) | agree |
| 10.1 | behrend-fantechi1997 lines 1282–1298, 1303–1312 | agree |
| 10.5 | behrend-fantechi1997 lines 1366–1374, 1713–1720 | agree |
| 11.2 | behrend-fantechi1997 lines 1539–1545; SchemeAndStackFoundations §2.19 names on main | agree |
| 11.3 | behrend-fantechi1997 lines 1583–1599; behrend1997 lines 148–153 | agree |
| 11.4 | behrend-fantechi1997 lines 1602–1614; behrend1997 lines 135–161, 165–187 | agree |

The README flags no locator as unverified. No source was fetched; the 22 cited works are all in the manifest (20 certified, 2 settled uncertified), and `sources check` reports 0 problems.

### Pins and names

Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (the manifest of the content repository at main `697bab2d`). Opened at the pins: `Chow/Basic.lean:86, 257, 295, 304, 369`; `Chow/ClosedImmersion.lean:211` (`ChowGroup.pushforward`); `AlgebraicCycle/Principal.lean:71`; `RelativeSpec/Graded.lean:93`; `RelativeSpec/UniversalProperty.lean:455`; `VectorBundle/LinearScheme.lean:175`; `VectorBundle/LinearScheme/BaseChange.lean:52, 99`; `VectorBundle/Geometric.lean:221`; `VectorBundle/TotalSpace.lean:130`; `VectorBundle/Rank.lean:125` (rank is a `LocallyConstant X ℕ`); `VectorBundle/FixedRank.lean:52`; `Sites/Big/StructureSheaf.lean:84`; `Curves/Prestable.lean:45` (extends `IsProper` and `GeometricallyConnected`); `AlgebraicSpace/Basic.lean:195` (no separation field); `Stack/Basic.lean:37`; Mathlib `AlgebraicCycle/Basic.lean:44, 69`, `OrderOfVanishing.lean:52`, `Extension/Cotangent/Basic.lean:61, 319, 324, 333`, `Kaehler/JacobiZariski.lean:429, 552`, `Kaehler/Basic.lean:781`, `Smooth/Basic.lean:70` (projective differentials and vanishing `H¹`, as the README says), `Derivation/ToSquareZero.lean:116`, `Sites/Etale.lean:50`. A search of both pinned libraries for algebraic or Deligne–Mumford stacks finds none (`Stack/Basic.lean` is the only file of its folder), so none of the eight headlines is statable.

### Headlines, padding, elaboration

The README's headlines (Summary, `README.md:30`–`33`) are the coarse-space comparison, the quotient-stack comparison, the degree of zero-cycles, the pure dimension of the intrinsic normal cone, the characterisations of obstruction theories, the virtual class and its independence, its properties, and the obstruction theory of maps from curves. Each is item 1–8 of the module docstring with the missing carriers named; nothing is stated in their place. `Suggested.lean` declares nothing: the one-tactic probe has zero theorems to try and the `#check @name` inventory is empty, so no binder changed. `lake env lean` on `packages/VirtualFundamentalClasses/Suggested.lean`, run from the content repository: exit 0, no output. The file has the single import `Mathlib`, no `set_option`, no sorry'd data. The README attributes no backticked Lean name to this roadmap (Convention 9).

### Suppliers, ownership, overlaps

All seven supplier roadmaps (SchemeAndStackFoundations, AlgebraicVectorBundles, DerivedModuleAlgebra, EnhancedDerivedSheaves, StableReduction, EllipticCohomology, EquivariantIntersectionTheory) are on main. Forty-one cited SchemeAndStackFoundations names were resolved in `TauCetiRoadmap/SchemeAndStackFoundations/README.md` (section headings at `:923, 2145, 2422, 2849, 2923, 2949, 3055, 3092, 3124, 3554, 3719, 3772, 4104, 4265, 4452, 4917, 5305, 6037, 6902, 7000, 7065, 7109, 7253`); `roadmaps resolve` lists no unresolved citation. No supplier gap is declared and none is needed. The overlap report lists no pull request changing this roadmap, no dropped id and no id defined only by an open revision; the closest open roadmaps are the settled ownership question above and the scheme-only SchemeAndStackFoundations revisions.

    depcheck: 236 roadmaps, 2136 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

### Shape and policy

Summary, Scope, Conventions, contracts, build paragraph, eleven layers named by their mathematics with Examples and Dependencies, consumers, references. Every definition has its API and at least three Checks; the two-Check subsections (10.3, 10.5, 11.5) are theorems. No LaTeX delimiters, process words, pull-request numbers, machine paths or algorithms. The layer order is forced by the dependency lines except Layer 6, which the build paragraph declares independent of Layers 7–11.

Two remarks that need no change. The affine diagonal of Layer 8 is not a narrowing below the source: behrend-fantechi1997 requires affine charts (line 913) and treats products of charts as charts (lines 930–931), which needs it. The rational statements of 3.4, 5.2 and 5.3 rely on Convention 3 for the proper covers of every stack on which a rational pushforward or a bivariant class acts.

## Not verifiable

- gillet1984 §4 and fulton1998 §1.10, Corollary 6.3, Proposition 8.1.1, Appendix B.6.6: settled as uncertified, texts not read. The statements used were checked through vistoli1989, behrend-fantechi1997 and the computations above.
- The stack headlines cannot be tested in Lean: the carriers are absent at the pins.
- Ownership against open pull requests was checked through the supplied index and tools only.

## Source issues

- **Misprint** in behrend-fantechi1997 at the Remark after Definition 1.2, arXiv p. 8 (lines 272–276): the source says the sequence of abelian cones runs from the cone of the quotient sheaf to that of the subsheaf to that of the middle sheaf; it should run through the cone of the middle sheaf to the cone of the subsheaf; affects nothing.
- **Error** in behrend-fantechi1997 at Proposition 1.4, arXiv p. 10 (lines 323–327): the source says a smooth surjective equivariant morphism to a cone makes its source a cone; it should assume the fibre over the vertex is a vector bundle with its scalar action; affects a stated result.
- **Gap** in behrend-fantechi1997 at Definition 3.7 and the product of local embeddings, arXiv pp. 27–28 (lines 913, 930–931): the source says the product of two local embeddings is one; it should assume affine diagonal, so that the fibre product of affine charts is affine; affects the proof.
- **Error** in behrend-fantechi1997 at Proposition 3.12, arXiv p. 30 (lines 1010–1023): the source says equality of intrinsic normal cone and normal sheaf implies a local complete intersection; it should require the cone to be a vector bundle stack; affects a stated result.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, arXiv p. 48 (line 1609): the source says the right-hand Ext group is over the curve; it should be over the test scheme; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1bf954dfc7f11d2ab146dd89092ad24e3ea7ed32", "job": "REV-PKG-VirtualFundamentalClasses~5", "model": "fable", "worker": "chris-x17"} -->
