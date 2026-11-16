<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18018#issuecomment-6907855005 -->
Red team round 1 pass a (claude) of 58ced1d

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Layer 8 uses cycles and rational equivalences on stacks for which Layer 2 defines none

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:1682–1688` ("Let `Y` be an algebraic
   stack … (cycles and rational equivalences on `Y` and its cones formed on smooth charts and
   descended …) … `β(Y′, X) ∈ W_*(N ×_Y C)`"), `:1711–1713` ("descends to
   `j^*N ×_{X′} u^*[C/T_{Y/𝔅}|_X]`"), `:1863–1864` ("descends to `N × 𝔉` with boundary
   `[q^*C_{…}] − [N × 𝔠_{X′/𝔜}]`"), and the `*Needs:*` line `:1736–1738`, whose only source of `W_*`
   is 2.2.

   **Claim.** 8.1 states `β(Y′, X)` as an element of `W_*(N ×_Y C)` for a local immersion `X → Y` into
   an arbitrary algebraic stack, and 8.1 (third statement) and the API of 8.3 state rational
   equivalences and cycle classes on the quotient stack `[C/T_{Y/𝔅}|_X]` and on `N × 𝔉`.

   **Witness.** 2.1–2.2 define `Z_*`, `W_*` only for stacks of Convention 1 (README:487, 698, 737–743;
   `ord` through an étale chart from a scheme). In 8.3's own second Check, `𝔠_{X′/𝔜} = B T_{𝔸¹}`
   (README:1874), not Deligne–Mumford, so `[N × 𝔠_{X′/𝔜}]` lies in no group of the roadmap; for
   `X = Y = B𝔾_m × 𝔸²` neither does `β`. The scope excludes Chow groups of Artin stacks (README:130).
   The parenthesis at README:1683–1685 is prose, not a target, and smooth descent of elements of `W_*`
   is stated nowhere (2.2 states the étale sheaf only, README:746–748).

   **Repair.** (a) In 8.1, first sentence, after "`i : X → Y` a local immersion" insert "from a stack
   `X` of Convention 1 (so that `X′` and the cone `N ×_Y C` over it are stacks of Convention 1, and
   `W_*(N ×_Y C)` is the group of 2.2)". Every use in 8.2 and 8.3 has such an `X` (an affine chart
   `U`, or `X` itself). Delete the parenthesis "(cycles and rational equivalences on `Y` … lines
   250–256)". (b) Add to 8.1, as its first "Prove" item:

   > - *smooth descent of rational equivalences.* For an algebraic stack `𝔛` locally of finite type and
   >   quasi-separated over `k`, define `Z_*(𝔛)` and `W_*(𝔛)` as the groups of compatible families
   >   `(α_U)` of elements of `Z_*(U)`, `W_*(U)` (2.1–2.2) over the schemes `U` of finite type over `k`
   >   smooth over `𝔛`, compatible under smooth pullback, graded by the dimension of
   >   VirtualFundamentalClass §0.2, with `∂` computed on each `U` (kresch1999b lines 192–204 and
   >   Remark 2.5, lines 250–256). Prove that smooth pullback of rational functions commutes with
   >   orders and with `∂` (kresch1999b Proposition 2.1, lines 205–207; 3.1 for cycles); that on a
   >   stack of Convention 1 these are the groups of 2.1–2.2, the étale sheaves of 2.2 being sheaves
   >   for the smooth topology; and that for a vector bundle `T` acting on a cone `C` over a stack of
   >   Convention 1, `W_*([C/T])` is the group of `T`-invariant elements of `W_*(C)` with the degree
   >   lowered by `rk T`. No Chow group of such a stack is formed: `A_*` is used only on stacks of
   >   Convention 1.

   (c) Add "3.1" to 8.1's `*Needs:*`. Tested on the refuting instance: for `𝔛 = B T_{𝔸¹}` with atlas
   `𝔸¹`, every cycle of `𝔸¹` has equal pullbacks to `𝔸¹ × 𝔾_a`, so `Z_*(B T_{𝔸¹}) = Z_*(𝔸¹)` with
   degrees lowered by one, and `[B T_{𝔸¹}]` is `[𝔸¹]` in degree `1 − 1 = 0`, the dimension README:1874
   computes.

2. **F02** (P2) the deformation space of a local immersion of stacks is used and not supplied

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:1693–1699` ("built in the proof of
   kresch1999b Proposition 2.3 … from the double deformation space
   `M°_X Y ×_Y M°_{Y′}Y → ℙ¹ × ℙ¹` and the intersection of its two `P`-divisors") and `:1719–1722`.

   **Claim.** The route of 8.1 forms `M°_X Y` and `M°_{Y′}Y` for local immersions `X → Y`, `Y′ → Y` of
   algebraic stacks.

   **Witness.** VirtualFundamentalClass §1.5 at its head extends deformation to the normal cone to
   "representable closed immersions of algebraic spaces and stacks" only; gap:normal-cones-of-local-immersions
   asks for the cone, its base change, its embedding in the normal sheaf and the normal bundle, not
   for the deformation space; SchemeAndStackFoundations §5.5 `deformationToNormalCone` is for closed
   immersions of schemes. For `Spec k → BG`, `|G| > 1`, none applies. The source builds it by descent
   (kresch1999b lines 263–274).

   **Repair.** Add to 8.1, before the item on `β`, the item:

   > - for a local immersion `F → G` of algebraic stacks locally of finite type over `k`, the
   >   deformation space `M°_F G → ℙ¹`: for charts `U → V` as in gap:normal-cones-of-local-immersions,
   >   with `R := U ×_F U` and `S := V ×_G V`, the spaces `M°_R S ⇉ M°_U V` of the immersions of
   >   schemes `R → S`, `U → V` (SchemeAndStackFoundations §5.5 on an open `V° ⊆ V` in which the
   >   immersion is closed, glued with `V × (ℙ¹ ∖ 0)` along `V° × (ℙ¹ ∖ 0)`) form a smooth groupoid presenting
   >   `M°_F G`; it is flat over `ℙ¹`, with fibre `G` away from `0` and fibre `C_{F/G}` over `0`, and
   >   its formation commutes with smooth base change on `G` (kresch1999b lines 259–274).

   and add "(the deformation space of the first item)" to the `*Needs:*` clause of 8.1 for
   SchemeAndStackFoundations §5.5. Tested: for `Spec k → BG` with the chart `U = V = Spec k`,
   `R = Spec k` and `S = G`, with `R → S` the unit section, open and closed of codimension `0`:
   `M°_U V = ℙ¹` and `M°_R S = (Spec k × ℙ¹) ⊔ ((G ∖ e) × (ℙ¹ ∖ 0))`, so `M°_F G` has fibre
   `[Spec k/G] = BG` over every point other than `0` and fibre `Spec k` over `0`, which is
   `C_{Spec k/BG}`, the rank-`0` bundle over `Spec k` (README:367–371 computes the same cone for the
   diagonal of `BG`).

3. **F03** (P3) 8.2 and 8.3 use the normal-cone formula for Gysin maps on a stack; 4.2 states it only through 3.5 for algebraic spaces

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:1778–1779` ("giving
   `v^![C(F•)] = [C(u^*F•)]`") and `:1867–1868`; API of 4.2 at `:1153–1167`.

   **Claim.** From `∂β = [C_{u^*C/C}] − [j^*N × C_{X′/Y′}]` the route concludes
   `v^![C(F•)] = [C(u^*F•)]`, which needs `v^![𝒢′] = 0^!_N[C_{ℱ′/𝒢′}]` for the equidimensional stack
   `𝒢′ = C(F•)`.

   **Witness.** 3.5's API has `f^![Y] = s^*[C_{X/Y}]` for an algebraic space `Y` (README:1048); 4.2's
   API has only `f^![𝒢] = [ℱ]` (README:1164). `C(F•)` is a cone over a stack, not an algebraic space:
   for `X = BG`, `E = 0`, it is `BG`.

   **Repair.** Add to the API of 4.2:

   > - For an equidimensional stack `𝒢′ → 𝒢` and `N := N_{ℱ/𝒢}|_{ℱ′}`,
   >   `f^![𝒢′] = 0^!_N[C_{ℱ′/𝒢′}]`, with `0^!_N` the zero-section Gysin map of `N` (4.3): for a proper
   >   surjective `q : Y → 𝒢′` from a scheme with `q_*[Y] = d·[𝒢′]`, the induced map of normal cones
   >   pushes `[C_{ℱ ×_𝒢 Y/Y}]` to `d·[C_{ℱ′/𝒢′}]` (vistoli1989 Lemma 3.15, lines 1132–1160, on an
   >   atlas, as in lines 1685–1704), and `0^!` commutes with proper pushforward.

   and add "4.2 (its normal-cone bullet)" where 8.2's route says "giving". Tested on `Spec k → BG`,
   `𝒢′ = BG`: `Y = Spec k`, `d = |G|`, `[C_{G/Spec k}] = [G]` pushes to `|G|·[Spec k]`, so
   `f^![BG] = [Spec k]`, the value of 4.2's second Check.

4. **F04** (P3) 9.5 proves a formula on an object owned by a roadmap the README lists as a consumer

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:2160–2162` ("for `𝔅` the stack of
   prestable `n`-pointed curves of genus `g`, of dimension `3g − 3 + n`, the virtual dimension is
   then …") and `:126–128` (AlgebraicGromovWittenTheory under "Imported, not restated") against
   `:2208–2212` (the same roadmap under "Downstream consumers").

   **Claim.** A "Prove" clause of 9.5 uses the prestable-curve stack and its dimension.

   **Witness.** That stack and its pure dimension `3g − 3 + n` are AlgebraicGromovWittenTheory §2.1 and
   §4.3 at its head; no supplier of this roadmap states them, 9.5's `*Needs:*` does not name them, and
   the README makes that roadmap a consumer of 9.3–9.5. One roadmap is listed in both directions.

   **Repair.** Replace the clause by: "for a base of pure dimension `b = 3g − 3 + n` the virtual
   dimension is `(1 − g)(dim X − 3) + n + c_1(T_X) · β`; AlgebraicGromovWittenTheory §4.3 applies this
   to its prestable-curve stack." Move the bullet at README:126–128 from "Imported, not restated" into
   the paragraph "Not part of this roadmap" as "the prestable-curve stack, the stack of stable maps,
   its properness and its virtual class (AlgebraicGromovWittenTheory, a consumer of Layer 9)". Tested:
   `g = 0`, `n = 0`, `X = ℙ²`, `β` a line gives `b = −3` and `(1)(−1) + 0 + 3 = 2`, the value of 9.5's
   first Check, with no stack named.

5. **F05** (P3) two `*Needs:*` lines omit items their statements use

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:1198–1199` (4.3) and `:1467` (6.1).

   **Claim.** README:482–483 promises that each `*Needs:*` line lists what the statement and route use,
   item by item.

   **Witness.** 4.3's statement is about the flat pullback `π^*` of 3.1; its line reads "1.1, 4.1–4.2;
   SchemeAndStackFoundations §§5.2, 5.4–5.5". 6.1's first API bullet uses `C(F•)` and `𝔠_{X/𝔜}`
   (VirtualFundamentalClass §§7.1, 9.1); its line reads "VirtualFundamentalClass §§3.2, 4.3–4.5, 6.5;
   SchemeAndStackFoundations §§2.6, 2.10".

   **Repair.** 4.3: "*Needs:* 1.1, 3.1, 4.1–4.2; SchemeAndStackFoundations §§5.2, 5.4–5.5." 6.1: append
   "; for the first API bullet, also VirtualFundamentalClass §§7.1 and 9.1."

Two blocking findings (R01, R02, both P2, both in Layer 8) and three P3 findings. No statement was
found false: every computed instance below agrees with the README. The blocking findings are
prerequisites that Layer 8 uses and that no target, supplier section, declared gap or pinned
declaration provides.

## Dependency check

    depcheck: 248 roadmaps, 2330 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. VirtualFundamentalClass and AlgebraicGromovWittenTheory are open
pull requests of another author that add new roadmap folders; they are not in the merge-order file
and were read at their heads (cd5dcf5, 9b70e32) through `roadmaps show`.

## The pass: Suggested.lean

| Declaration | Section, variables, instances | Result |
|---|---|---|
| (none) | `namespace TauCetiRoadmap.VirtualFundamentalClassPartII`, empty | the file states nothing; module docstring lists 12 headline theorems with the carrier each lacks |

The `#check @name` comparison is not applicable (no declaration), and no Lean was run. The
docstring's claims about the pins were checked by grep: no `AlgebraicStack`, `DeligneMumford`,
`flatPullback`, `properPushforward`, Chern-class, normal-cone or quotient-stack declaration in the
pinned Tau Ceti; `Chow/` has `Basic.lean` and `ClosedImmersion.lean` only; the cotangent complex in
Mathlib is `Algebra.Extension.cotangentComplex`; Tau Ceti has higher direct images
(`AlgebraicGeometry/Cohomology/`). None of the 12 headlines is statable at the pins; none is absent
that could be stated; no padding (no declaration).

## The pass: README statements, with computed values

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conv. 5 degree | `Spec k → BG → Spec k` | `|G| · 1/|G| = 1`; formula `(|G|/1)·1`, `(1/|G|)·1` | agree |
| 1.1 finite cover | `L` (doubled origin); `B_{𝔸¹}G` | `Q ×_L Q = 𝔸¹ ⊔ 𝔾_m ⊔ 𝔾_m ⊔ 𝔸¹ = Q ×_{𝔸¹} G`; `L ×_{BG} 𝔸¹ = Q`, rank `2`; torsor degree `2` over `t ≠ 0`, `1` over `0` on a connected separated `X` | holds; no separated cover |
| 1.2 `e`, `k(𝒱)` | `[𝔸¹/μ₂]`, `[Spec ℂ/(ℤ/4)]` over `ℝ`, `[ℙ¹/μ₂]` | `e = 1`, `k(x²)`; `e = 2`, `κ = ℝ` (same as StackPointsAndResidualGerbes §5.3 Check); global functions `k` vs `k(t²)` | agree |
| 1.3 degree formula | `ℤ/p` on `𝔸²`, `V(x)`; Frobenius; `L → B_{𝔸¹}G` | `(1/p)·[k(y):k(y^p)] = 1 = p/p`; `p`; `(2/1)·1 = 2 =` rank of `Q → 𝔸¹` | agree |
| 1.3 base change | `Spec k → BG` along itself; `BH → Spec k` along `BG` | fibre product `G` integral only for `G = 1`; `1/|H|` on both sides | holds where defined |
| 1.3 inertia sum | `S₃`; `Bμ₃` over `ℚ` | `1 + 3 + 2 = 6`; `1 + (3/3)·2 = 3` | agree |
| 2.1 multiplicity | `[V(x²)/μ₂]` | length `2`; `2·[Bμ₂]` | agree |
| 2.2 `A_0([𝔸¹/μ₂])` | `div(y)`, `div(P(y))`, `k = 𝔽_p(a)`, `P = y^p − a` | `ord_0(x²) = 2`; `x^{2p} − a` irreducible, order `1` (étale away from `0`); quotient `ℤ/2` | agree |
| 2.3 `A_0(L)` | `div(t)`, `div(g)` | `ℤ²/ℤ(1,1) ≅ ℤ`; `A_0(𝔸¹) = 0` | agree |
| 3.1 non-injectivity | isogeny `E′ → E` of degree `2` | sum of `π^{−1}P` minus sum of `ker π` is `(2Q + T) − T = 2Q = π̂(P) = O` | agree |
| 3.2 divisor formula | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; atlas `𝔸¹ → [𝔸¹/μ₂]`, `φ = x` | `|G|·[0 × BG]` vs `|G| · div(t)`; `f_*[0] = 2[Bμ₂]`, `N(x) = −y`, `div(−y) = 2[Bμ₂]`, factor `1` | agree |
| 3.3 push–pull, localisation | `π : Spec k → BG` against itself; `[𝔸¹/μ₂] ⊇ Bμ₂`; `ℙ¹` with two points | `|G|` both sides; `ℤ → ℤ/2 → 0 → 0` exact; kernel `ℤ(1, −1)` | agree |
| 3.4 exterior product | `K/k` separable, purely inseparable; `BG × BH` | `2 + 2 = 4`; length `p`, `p·p = p²`; `[B(G × H)]` | agree |
| 3.5 homotopy invariance | folded line `X` over `ℝ`, `N = X × 𝔸¹` | `div(t) = [0_X]`; `g` irreducible over `ℝ` splits into `h, h̄` with one image curve, multiplicity `1`; `A_0(X) = 0 = A_1(N)` | agree |
| 3.5 Gysin | `{0} → 𝔸¹` along `z ↦ z²`; zero section on `O(−1)`; flat and non-flat base change | `2[pt]` (SchemeAndStackFoundations §5.5 Check, same value); `−[pt]`; `2[pt] = 2[pt]`; `[pt]` vs `0 ∈ A_{−1}` | agree |
| 4.1 pushforward | `BG → Spec k`; `L × B(ℤ/2) → L` | `1/|G|`; `(1/2)[0₁]`, `ℚ ≅ ℚ` | agree |
| 4.2 Gysin on stacks | `π : Spec k → BG` | `|G|^{−1} · |G| · [Spec k]` | agree |
| 4.3 Chern classes | `L ⊕ L^∨`; `BG` | `c_1 = 0`, `c_2 = −c_1(L)²`; `A_{−i}(BG)_ℚ = 0` | agree |
| 5.1 projection formula | `BG → Spec k` | `(1/|G|)[Spec k]` both sides; weighted product would give `[Spec k]` | agree |
| 5.2 moduli comparison | `[𝔸¹/μ₂] → 𝔸¹`; `ℤ/p` quotient; `Spec K → Spec k` purely inseparable | `2·(1/2)[0] = div(y)`; degree `1 ≠ 1/p`; norm `φ ↦ φ^{p^m}`, iso after `⊗ ℚ` | agree |
| 5.3 ring comparison | `ℙ(1, 2)`; `μ_n` | `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`, `∫ t = 1/2`, `∫ 2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ` | agree |
| 5.4 degree of a point | `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]` | `1/2 = 2/4`; `2·(1/2) = 1 = ∫[𝒪]` | agree |
| 6.1 comparison bundle | `E = 0`; `ℙ¹`, `[O(−4) → Ω]` with `1 + ξ`; `F• ⊕ [G = G]` | rank `1 = 0 + 1 = 1 + 0`; `Ext¹(Ω, O(−4)) = H¹(O(−2)) = k`, homotopies `H⁰(O(−2)) = 0`, `P = O(3)²`; rank `rk F_1 + rk F_0 + rk G` | agree |
| 6.2 class | `ℙ¹`, `[O(1) → Ω]`; `𝓛_n` on `L`; through `P` | `−1`; `n[0₂] = −n[0₁]`; `c_1(O(3)²/O(2)) = 4` | agree |
| 6.3 formulas | `k[ε]`; node `× ℙ¹`; `k[x]/(x^p)`; `pt ⊔ 𝔸¹` | `2[pt]`; `−[𝔜 × pt]`; `s = 1 ≠ 0`, class `p[pt] ≠ 0`; `[pt]` vs `0` | agree |
| 7.1 obstruction class | `Spec k → B𝔾_m`; `k[x]/(x²)`, `x ↦ ε` | torsor under `1 + J ≅ J`; `(ε + aε²)² = ε² ≠ 0` | agree |
| 7.2 equivalence | `char 2`, `k[x]/(x²)`, `φ = (0, id)` | `Ext¹(L_X, J) = Hom(A, J) ⊕ Ext¹(A, J)`, `φ^*ω = 0`, no extension | condition 3 fails, as stated |
| 8.1 boundary and sign | plane example; `Y = 𝔸¹ × k[ε]`; `𝔅′ = 𝔅` | `[ν = 0] − [η = 0]`, `β = c·ν/η`, fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `2[ν = 0] − 2[T = 0]`; `0`; sign opposite to kresch1999b line 304 | agree |
| 8.2 pullback | node, `V(a + b)`; `𝔸¹ × k[ε]` | `−2[pt × pt]` both sides; `2[pt]` both sides | agree |
| 8.4 invariance | conic family; `B = L`; `y² = x^p − a` | `2, 2, 2`; `2` at `0₁`, `0₂`, `t ≠ 0`; `𝔪 = (y)`, both partials vanish, count `1` | agree |
| 9.1 definition | `X = Spec k`; `M = Spec k`, `F = id_{ℙ¹}` | étale; `H⁰(T_{ℙ¹}) = k³ ≠ 0` | discriminates |
| 9.3 theory | `ℙ¹ → ℙ^r`; elliptic `C → C`; `(L, pr₂)` | `χ = (r+1)(d+1) − 1`; `c_1(O_M) = 0`; `E = Ω_L`, dimension `1` | agree |
| 9.4 resolution | `V = O`; embedded point; `L = O` | `π_*H = π_*G = 0`, `χ = 1 − g`; `H⁰ = k`; misses `O_M` | agree |
| 9.5 dimension | lines in `ℙ²`; `c_1 = 0`, `dim 3`; doubled `ℙ¹`; `ℙ¹ × 𝔸¹` | `2`; `n`; `0 + 2 + 1 = 3 = dim PGL₂`; `4`, `A_0(X) = 0` | agree |

## Verified sound

- Declarations read: 0 (the Lean file has none); README sections read: all 2247 lines, 33 targets
  (1.1–9.5); 139 Check bullets read, of which the table above records the ones recomputed here
  (at least one per target that has Checks).
- Sibling citations checked: 61. VirtualFundamentalClass §§0.2–0.3, 1.4–1.6, 2.1–2.5 (including the
  restricted tangent invariance and the plane example in §2.5), 3.1–3.5, 4.3–4.5, 5.1, 5.5,
  6.1–6.6, 7.1–7.7, 8.1–8.5, 9.1–9.6 at its head; StackPointsAndResidualGerbes §§0.1, 0.3, 0.5, 1.3,
  2.3, 2.5, 4.5, 5.3, 5.4 at its head; SchemeAndStackFoundations §§1.3, 1.9, 1.10, 1.18–1.23, 2.6,
  2.10, 2.18–2.20, 3.3, 4.1, 4.14, 5.1–5.6 and 29 declaration names on main; StableReductionPartII
  §5.15 at its head (hypotheses identical to README:442–446); EquivariantIntersectionTheory
  Conventions 4–5, §§2.1–2.2; StableReduction Layers 2–3; EnhancedDerivedSheaves §0.3, E1.4, E1.8;
  DerivedModuleAlgebra §§0.7, 0.12, 0.25 (the morphism-lifting clause is in §0.25);
  AlgebraicGromovWittenTheory §§2.1, 4.1–4.3.
- Pinned declarations checked: 18 (8 Mathlib, 10 Tau Ceti), all present with the stated meaning
  (`cyclesOfDimension` grades by `height`, the dimension of the closure in Mathlib's specialisation
  order; `Scheme.ord` has junk value `0` off coheight one; `PrestableFamily` does not carry the
  genus; `vectorBundleDegree` is `χ(E) − r·χ(O)`).
- Locators verified against the cached texts: 96 (vistoli1989 41, behrend-fantechi1997 22,
  kresch1999b 9, stacks-chow-spaces 15, behrend1997 3, li-tian1998 4, and one or two each in
  rydh2015, deligne-mumford1969, keel-mori1997, edidin-graham1998, stacks-chow). None wrong.
- Declared gaps: both have the same slug in `design/plan.json` and in the README, a named supplier
  and section, and a `needs` sentence about one object; the pull request changed only the `gaps`
  list of `plan.json`. They are not raised.
- Policy: the pull request changes only the package folder (7 files); no pull-request number,
  process word, `lemma` or `set_option`; every definition has at least three Checks; proposed names
  are in italics and every backticked name resolves at the pins or in a supplier.
- Ownership: no open roadmap or roadmap on main states proper covers of stacks, integral Chow
  groups of Deligne–Mumford stacks, Chow groups of algebraic spaces, Poincaré duality for Vistoli's
  bivariant groups or the relative obstruction class (searched by object with `roadmaps grep`); the
  stopped board package VirtualFundamentalClasses is the only other text with them.
- Copyright: wording compared at each verified locator and in 10 further passages (1.1 with
  rydh2015 Theorem B; 1.3 with vistoli1989 (1.15); 5.2 with vistoli1989 lines 546–560; 7.1 with
  behrend-fantechi1997 lines 1067–1078; 7.2 with its Theorem 4.5; 8.1 with kresch1999b Theorem 3.1;
  9.3 with behrend-fantechi1997 lines 1583–1614; 9.4 with behrend1997 Proposition 5; 3.2 with
  stacks-chow-spaces Lemma 14.1; the Lean docstring). The longest shared run is 7 words, a list of
  adjectives of a theorem's conclusion. Arrangement: vistoli1989 has §1 preliminaries, §2 moduli
  spaces, §3 cycles and Gysin maps, §4 the rational equivalence, §5 bivariant theory, §6 Alexander
  schemes; the README has its §2 material in 5.2, its §4 material inside 3.5 and 8.1, its §5
  material split over Layers 4 and 5, and no layer for its §6: no run of layers maps one to one.
  No table, figure or list of examples is taken over.

Source independence: 106 passages compared with 11 sources, none shared; largest share vistoli1989,
77 of 172 locators; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§1.8, §1.10, Chapter 3, Corollary 6.3, Proposition 8.1.1,
  Proposition 10.2): settled as uncertified, cited by locator, texts not read.
- kresch1999 Theorem 6.2.1 (cited once, for what is out of scope): not opened.
- Elaboration of `Suggested.lean`: not run (this pass runs no Lean); the file has no declaration.
- StackPointsAndResidualGerbes, at its head, names the stopped package VirtualFundamentalClasses as
  the owner of integral closed substacks, while this roadmap asks VirtualFundamentalClass §2.1 for
  them through gap:closed-substacks-of-stacks; which text that roadmap should name is outside this
  package.
- The route of 8.1's third statement (equality of the two pullbacks of `β` to `Y ×_𝔅 Y`) was
  checked on the plane example and on products `𝔅 × 𝔸¹` only; it is new and has no source to
  compare with.

## Source issues

- **Misprint** in kresch1999b at Section 3, the paragraph before Theorem 3.1 and Theorem 3.1, printed p. 10 (lines 331–336): the source says the acting bundle is the tangent bundle of the arbitrary stack called Y′; it should be the tangent bundle of the smooth, regularly embedded stack X, as its proof uses; affects a stated result.
- **Error** in behrend-fantechi1997 at Proposition 3.5 (line 889): the source says the rational equivalence is invariant under the whole restricted tangent bundle of the ambient stack; it should be invariant only under the tangent bundle of the regularly embedded smooth stack; affects the proof; corrected in print at kresch1999b Theorem 3.1 and the paragraph after it (lines 334–343).
- **Gap** in behrend-fantechi1997 at Proposition 5.3, proof (lines 1303–1305): the source says both global resolutions may be assumed to map to the complex by morphisms of complexes; it should justify this, since its Definition 5.2 only gives isomorphisms in the derived category; affects the proof.
- **Misprint** in behrend-fantechi1997 at Proposition 6.2, proof (line 1609): the source says the Ext group of the pulled-back obstruction complex is taken over the structure sheaf of the curve; it should be over that of the test scheme T; affects nothing.

## For the human reviewers

- **Licence.** vistoli1989 was read in an OCR extraction of the GDZ scan (`sources.toml`, entry `vistoli1989`); formulas in it are partly unreadable, so 41 locators were matched by statement number and surrounding prose.
- **Scope.** 6.2 and 8.1–8.4 state results for stacks that need not be separated and for bases that need not be reduced, for which the cited sources (behrend-fantechi1997 lines 1664–1670, kresch1999b Theorem 3.1) state the separated or smooth case only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "58ced1d4698afd3939233f45dc5ee22278da682f", "job": "RT-VirtualFundamentalClassPartII~1a", "model": "fable", "worker": "chris-x29"} -->
