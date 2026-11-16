<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18018#issuecomment-6908716507 -->
Red team round 2 pass a (claude) of 9e8a619

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 8.1 builds `β` from an intersection calculus of `P`-divisors that no target, supplier or gap states

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:1783–1791` ("from the double
   deformation space `M°_X Y ×_Y M°_{Y′}Y → ℙ¹ × ℙ¹` … and the intersection of its two `P`-divisors:
   kresch1999b Corollary 1.10 (lines 182–190), stated for a variety, is applied on smooth charts"),
   `:1814`, and the `*Needs:*` clause for `β` at `:1831–1832`.

   **Claim.** `β(Y′, X)` is defined from the two `P`-divisors of the double deformation space by
   Corollary 1.10 of kresch1999b, with inputs "these [the deformation space] and
   VirtualFundamentalClass §2.5".

   **Witness.** "`P`-divisor" occurs in the README only at `:1787` and `:1814` and is never defined.
   The construction uses kresch1999b Definitions 1.4–1.6 (lines 83–135), Propositions 1.8–1.9 (lines
   142–163) and Corollary 1.10: an intersection operation on `W_*`, through normalisations, and the
   identity `D·[E] − E·[D] = ∂ω`. No target here states them; VirtualFundamentalClass §2.5 at its
   head constructs Vistoli's equivalence only; `roadmaps grep 'P.?-divisor'` finds no owner. It is the
   same class as round 1's 1a/F02.

   **Repair.** Insert in 8.1, after the paragraph on the deformation space and before "*The canonical
   rational equivalence.*":

   > *Intersection with a `P`-divisor.* On an integral scheme `M` of finite type over `k`, a
   > *`P`-divisor* is a triple `(U, U′, x)` of nonempty opens with `U ∪ U′ = M` and `x ∈ k(M)^×` that is
   > a unit on `U ∩ U′`, such that the Cartier divisor `D` given by `x` on `U` and `1` on `U′` has
   > support `|D| = M ∖ U′`, the support being the image of the divisor of `x` on the normalisation
   > (kresch1999b Definitions 1.1 and 1.4, lines 65–69 and 83–94); the fibre over `0` of a dominant
   > morphism `M → ℙ¹` is one (lines 101–102). Define `D· : Z_j(M) → Z_{j−1}(|D|)` by
   > `D·[V] := [D|_V]` for `V ⊄ |D|` and `0` for `V ⊆ |D|`, and `D· : W_j(M) → W_{j−1}(|D|)` by
   > `D·(V, y) := π_*(⊕_W (y^{ord_W x}/x^{ord_W y})|_W)` over the components `W` of `|π^*D|` on the
   > normalisation `π : V̂ → V` for `V ⊄ |D|`, and `0` otherwise (its Definitions 1.5–1.6, lines
   > 109–135), with `π_*` the pushforward of 3.2. Prove: `∂(D·y) = D·(∂y)` (its Proposition 1.8, lines
   > 142–151); for two `P`-divisors `D`, `E` with functions `x`, `y`,
   > `D·[E] − E·[D] = ∂ω(D, E)` with `ω(D, E) := Σ_W π_*((y^{ord_W x}/x^{ord_W y})|_W)` over the common
   > components `W` of `|π^*D|` and `|π^*E|` (its Proposition 1.9, lines 153–163, on a normal `M`, and
   > Corollary 1.10, lines 182–190); and that `D·` and `ω` commute with smooth pullback (its
   > Proposition 2.1, lines 205–207), so that they are defined, through the groups above, on every
   > integral closed substack of an algebraic stack locally of finite type (lines 192–204).

   and change the `*Needs:*` clause "for `β`, these and VirtualFundamentalClass §2.5" to "for the
   `P`-divisor operations, 2.2, 3.1, 3.2 (the pushforward from the normalisation), Mathlib
   `AlgebraicGeometry.Scheme.ord` and Tau Ceti's normalisation
   (`TauCeti/AlgebraicGeometry/Normalization/Finite.lean`, `isFinite_fromNormalization_of_isJapanese`);
   for `β`, all of these and VirtualFundamentalClass §2.5". Add to the Layer 8 Dependencies sentence
   "Within 8.1, … the deformation space and the `P`-divisor operations precede `β`".

   Tested on the plane example (`Y = 𝔸²`, `X` the origin, `Y′ = {y = 0}`): `M°_X Y = Spec k[s, ξ, η]`
   (`x = sξ`, `y = sη`), `M°_{Y′}Y = Spec k[t, x, ν]` (`y = tν`), so the double space is
   `Spec k[s, t, ξ, η, ν]/(sη − tν)`, integral and normal (singular along `s = t = η = ν = 0`, of
   codimension `3`). `D = (s)` has components `{s = t = 0}`, `{s = ν = 0}`; `E = (t)` has
   `{s = t = 0}`, `{t = η = 0}`; the common one is `W = 𝔸³_{ξ,η,ν} = N ×_Y C`, with
   `ord_W s = ord_W t = 1`. Then `ω = (t/s)|_W = η/ν`, `∂ω = [η = 0] − [ν = 0]` (kresch1999b line 304),
   and `β = −ω = ν/η` with `∂β = [ν = 0] − [η = 0]`: the first Check of 8.1 with `c = 1`.

2. **F02** (P3) the Summary and the Lean docstring claim finite covers and the theory for every Deligne–Mumford stack of finite type

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:9–14` ("the integral Chow groups
   `A_i(ℳ)` of Deligne–Mumford stacks of finite type over an arbitrary field with no separatedness
   assumed … through the finite cover by a scheme that every such stack has") and
   `packages/VirtualFundamentalClassPartII/Suggested.lean:33–39` ("for a Deligne–Mumford stack of
   finite type over a field"; "*Rational intersection theory on every Deligne–Mumford stack*").

   **Claim.** Every Deligne–Mumford stack of finite type over `k` has a finite cover by a scheme, and
   the theory covers all of them.

   **Witness.** `Bℤ` (README:161–165) is Deligne–Mumford in SchemeAndStackFoundations §1.19 and of
   finite type (atlas `Spec k`). A finite `Z → Bℤ` from a scheme pulls back to a `ℤ`-torsor `P → Z`
   with `P` finite over `k`; then `P ×_Z P ≅ P × ℤ` is finite, so `Z = ∅`. Convention 1 excludes it;
   the Summary and docstring do not.

   **Repair.** README:10: replace "Deligne–Mumford stacks of finite type over an arbitrary field with
   no separatedness assumed" by "Deligne–Mumford stacks of finite type over an arbitrary field whose
   diagonal is quasi-compact and separated (Convention 1), with no separatedness of the stack
   assumed". `Suggested.lean:34`: "for a Deligne–Mumford stack of finite type over a field with
   quasi-compact separated diagonal"; `:37`: "*Rational intersection theory on every such stack*".
   Tested: `Bℤ` has diagonal with fibre `ℤ`, not quasi-compact, and is excluded by the new wording;
   `B_{𝔸¹}G` of 1.1 (diagonal quasi-compact and separated, stack not separated) is still included.

3. **F03** (P3) 8.1 does not say what `Z_*(𝔛)` and `W_*(𝔛)` are when the dimension is unbounded

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:1716–1718` ("the families `(z_U)` …
   with `z_U ∈ Z_{i+r_U}(U)` for `Z_i(𝔛)`, respectively `z_U ∈ W_{i+r_U}(U)` for `W_i(𝔛)`") against
   `:716` ("`Z_*(ℳ) := ⊕_i Z_i(ℳ)`") and `:1779` ("`β(Y′, X) ∈ W_*(N ×_Y C)`").

   **Claim.** `β(Y′, X) ∈ W_*(N ×_Y C)` for every ambient `Y` locally of finite type, "neither
   reducedness nor pure dimension being assumed" (`:1772`).

   **Witness.** Only the graded pieces are defined, and 2.1's convention is `⊕_i`. For
   `Y = ⊔_{n ≥ 1} 𝔸ⁿ`, `X` the origins, `Y′ = ⊔ {x_1 = 0}`: `N ×_Y C = ⊔_n 𝔸^{n+1}` and the `n`-th
   component `ν/ξ_1` of `β` lies in `W_n`, so `β ∉ ⊕_i W_i(N ×_Y C)`. Likewise `[Y] ∉ ⊕_i Z_i(Y)`.

   **Repair.** After "(2.1–2.2)," at `:1718` insert: "`Z_*(𝔛)` and `W_*(𝔛)` are the groups of all
   compatible families with `z_U ∈ Z_*(U) = ⊕_j Z_j(U)`, respectively `W_*(U)`, and `Z_i(𝔛)`, `W_i(𝔛)`
   their subgroups of families of degree `i`; when the dimension of `𝔛` is unbounded they are larger
   than `⊕_i Z_i(𝔛)`, `⊕_i W_i(𝔛)`;" and add to the Check at `:1862–1865`: "For `Y = ⊔_{n ≥ 1} 𝔸ⁿ` with
   `X` the origins and `Y′ = ⊔ {x_1 = 0}`, the `n`-th component of `β` has degree `n`, so `β` lies in
   `W_*` and in no `⊕_i W_i`." Tested: every chart `U` of finite type meets finitely many components,
   so `β_U ∈ ⊕_j W_j(U)` and the family is an element of the group as now defined.

4. **F04** (P3) a Check of 2.1 says `Z_0` of a non-quasi-compact scheme is not defined; 8.1 now defines it

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:745–748` ("the pullback of
   `[Spec k]` would be the sum of the infinitely many points of `U`, which is no element of a free
   abelian group; `U` is not quasi-compact, so it is not a stack of Convention 1 and `Z_0(U)` is not
   defined").

   **Claim.** For `U = ⊔_ℕ Spec k`, `Z_0(U)` is not defined.

   **Witness.** 8.1 (README:1714–1718, 1743–1744) defines `Z_*(𝔛)`, with the same symbol, for every
   algebraic stack locally of finite type, "quasi-compact or not": for this `U` it is `ℤ^ℕ`, and the
   pullback of `[Spec k]` is its element with every coefficient `1`.

   **Repair.** Replace "so it is not a stack of Convention 1 and `Z_0(U)` is not defined" by "so it is
   not a stack of Convention 1 and 2.1 defines no `Z_0(U)`; the group of compatible families of 8.1 is
   `Z_0(U) = ℤ^ℕ`, which contains this pullback as the family with every coefficient `1`, and is not
   free on the points of `U`". Tested: on each finite-type open `⊔_{n ≤ m} Spec k` the family is the
   finite sum of its `m + 1` points.

One P2 finding (S01, an unowned prerequisite of 8.1) and three P3 findings (S02–S04). No statement
was refuted. All eight findings of round 1 are repaired at this head; two of the new P3 findings
(S03, S04) are loose ends of the round-1 repair of 8.1.

## Round 1 findings at this head

| Finding | Status | Witness at 9e8a619 |
|---|---|---|
| 1a/F01 and 1b/F01 (P2), cycles and rational equivalences on stacks outside Convention 1 | repaired | `packages/VirtualFundamentalClassPartII/README.md:1714–1746`: "define *smoothCycles* `Z_*(𝔛)` and *smoothRatEquivalences* `W_*(𝔛)`: the families `(z_U)`, one for each scheme `U` of finite type over `k` with a smooth morphism `U → 𝔛`", with five "Prove" items; `:1828–1830` adds 2.1, 2.2, 3.1 to the `*Needs:*`; `:1862–1865` has the `⊔_ℕ 𝔸²` Check, `:1856–1861` the `B T_{𝔸¹}` Check. Residue: S03 and S04 below. |
| 1a/F02 (P2), deformation space of a local immersion | repaired | README:1748–1769: "define *localImmersionDeformationSpace* `M°_F G`, an algebraic stack over `G × ℙ¹`, by descent (kresch1999b lines 259–274)"; three Checks at `:1869–1888`. Recomputed: `Spec k → BG` gives `M°_R S = (e × ℙ¹) ⊔ ((G ∖ e) × (ℙ¹ ∖ 0))`; `pt ⊔ pt → pt` gives `ℙ¹` with `0` doubled. The repair's change from "immersion of schemes" to algebraic spaces is correct (`S = V ×_G V` is a space). |
| 1a/F03 (P3), normal-cone formula on a stack | repaired | README:1184–1196: "`f^![𝒢′] = s^![C_{ℱ′/𝒢′}]` in `A_*(ℱ′)_ℚ`"; cited at `:1909–1910` and `:1999`. Recomputed on `Spec k → BG`, `𝒢′ = Spec k`: `ℱ′ = G`, `N` of rank `0`, `C = G`, `s^![G] = [G]`, the 3.5 Check. |
| 1a/F04 (P3), prestable-curve stack in 9.5 | repaired | README:2293–2295: "for a base of pure dimension `b = 3g − 3 + n` the virtual dimension is then `(1 − g)(dim X − 3) + n + c_1(T_X) · β`"; `:130–133` lists AlgebraicGromovWittenTheory under "Not part of this roadmap". |
| 1a/F05 (P3), `*Needs:*` omissions | repaired | README:1229–1230 "*Needs:* 1.1, 3.1, 4.1–4.2"; `:1498–1499` "for the first API bullet, also VirtualFundamentalClass §§7.1 and 9.1". |
| 1b/F02 (P3), Convention 6 witness | repaired | README:233–242: "a morphism `E → τ^{≥−1}L` is a truncation exactly when its image in `Hom(E, τ^{≤−2}L[1])` vanishes"; recomputed: `Hom(O[1], O[2]) = H¹(O)`, `Hom(O[1], O[3]) = H²(O)`, and on an abelian surface the connecting class `δ ≠ 0` gives `δ ∘ id ≠ 0`. |
| 1b/F03 (P3), Convention 2 locator | repaired | README:174–179: "(vistoli1989 lines 499–500, there called a local embedding; kresch1999b lines 232–234 …)"; both passages opened (vistoli1989 lines 499–500, kresch1999b lines 232–234). |

No repair introduced a false statement. The repair of 8.1 left the points S03 and S04.

## Dependency check

    depcheck: 251 roadmaps, 2383 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README lists no citation and no Lean
name found nowhere. `git diff --stat origin/main...HEAD` shows eight files, all under
`packages/VirtualFundamentalClassPartII/`; in `design/plan.json` only the `gaps` list differs.

## The pass: Suggested.lean

| Declaration | Section, variables, instances | Values | Result |
|---|---|---|---|
| (none) | `module`, `import Mathlib`, one module docstring, empty `namespace TauCetiRoadmap.VirtualFundamentalClassPartII` | 0 declarations, 0 `sorry`, 0 `def`, 0 `set_option` | docstring names 12 headlines and what each lacks; S02 on its wording |

The `#check @name` comparison does not apply (no declaration); no Lean was run. Docstring claims
checked at the pins: `TauCeti/AlgebraicGeometry/Stack/Basic.lean:37` (`SchPseudofunctor`, an
`abbrev` of `Cat`-valued pseudofunctors), `TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean:195`
(`IsAlgebraicSpace`: fppf sheaf, representable diagonal, étale atlas; no quasi-separatedness),
`TauCeti/AlgebraicGeometry/Chow/` (two files), no `AlgebraicStack`, `DeligneMumford` or cotangent
complex of a scheme morphism in either library (grep: only `Mathlib/RingTheory/Extension/Cotangent/`).
Headlines from the README: 2.2–2.3, 4.1–4.3, 5.1, 5.2, 5.3, 5.4, 6.1–6.3, 7.1–7.2, 8.1, 8.2–8.3,
8.4, 9.3–9.5. Each needs a stack, a Chow group of a stack or space, or a derived cotangent complex
or `Rπ_*`; none is statable; none statable is absent; nothing is padding.

## The pass: README statements, with computed values

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conv. 1 / Summary | `Bℤ` | finite type, DM; finite cover forces `P ×_Z P ≅ P × ℤ` finite, so `Z = ∅` | S02 |
| Conv. 5 degrees | `Spec k → BG → Spec k` | `|G| · (1/|G|) = 1` | agree |
| Conv. 6 witness | `O[1]`, `O[2]`; abelian surface | `H¹(O) = k` (elliptic), `H²(O) = 0` (curve), `k` (surface); `δ ∘ id = δ ≠ 0` | agree |
| 1.1 finite cover | `L → B_{𝔸¹}G`; `Bℤ` | `Q ×_L Q = Q ⊔ Q|_{t≠0} = Q ×_{𝔸¹} G`, rank of `Q → 𝔸¹` is `2`; none for `Bℤ` (outside Conv. 1) | holds |
| 1.2 `e`, `k(𝒱)` | `[Spec ℂ/(ℤ/4)]` over `ℝ` | stabiliser of a point of `Spec ℂ ⊗_ℝ ℂ` is `ℤ/2`, `e = 2`, `ℂ^{ℤ/4} = ℝ`; no real point (the nontrivial `ℤ/4`-torsor has `2` acting by conjugation) | agree |
| 1.3 formula, base change, inertia | `BH → BG`; `t ↦ t²` along `s ↦ s³`; `S₃`; `Bμ₃/ℚ` | `|G|/|H|` both ways; `2` on the cusp `t² = s³`; `1 + 3 + 2 = 6`; `1 + (3/3)·2 = 3` | agree |
| 2.2 `A_0([𝔸¹/μ₂])` | `div(g(y))` | coefficient of `[Bμ₂]` is `2·ord_0 g`, even; `div(P(y)) = [W]` for `P(0) ≠ 0`; group `ℤ/2` | agree |
| 2.3 `A_0(L)` | `div(t)` | `ℤ²/ℤ(1, 1) ≅ ℤ` | agree |
| 3.1 non-injectivity | isogeny of degree `2` | `(2Q + T) − T = 2Q = π̂(P) = O` | agree |
| 3.2 divisor formula | `𝔸¹ → 𝔸¹ × BG`, `φ = t` | `|G|·[0 × BG]` both sides with factor `e/e = |G|` | agree |
| 3.3 | `Bμ₂ ⊂ [𝔸¹/μ₂]` | `ℤ → ℤ/2 → 0 → 0` | agree |
| 3.5 | `X = 𝔸¹_ℂ/(z ∼ z̄)`; `z ↦ z²` | `div(t) = [0_X]`, `A_0(X) = 0`; `2·[pt]` | agree |
| 4.1 | `L × B(ℤ/2) → L` | `(1/2)·[0₁]` | agree |
| 4.2 definition | `Spec k → BG`, `Y = Spec k` | `|G|^{−1}·|G|·[pt] = [pt]` | agree |
| 4.2 normal-cone formula | `𝒢′ = Spec k`; multiplicities | `s^![G] = [G]`; `a_i = m·m_i/d_i` copies give `q_*[Y] = m·[𝒢′]` with `m = Π d_i` | agree |
| 4.3 | `O(−1)` on `ℙ¹`; `BG` | `−[pt]`; `A_{−i}(BG)_ℚ = 0` | agree |
| 5.1 projection formula | `BG → Spec k` | `(1/|G|)·[pt]` both sides; `deg(BG/BG × BG) = |G|²/|G|` | agree |
| 5.2 | `Spec K → Spec k` purely inseparable; `[𝔸¹/μ₂] → 𝔸¹` | bijective on `Ω`-points, `p_* = [K : k]`; `2·(1/2)·[0] = div(y)` | agree |
| 5.3 | `ℙ(1, 2)` | `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`, `∫t = 1/2` | agree |
| 5.4 | `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]` | `1/2 = 2/4`; orders `2, −1, 0`, `2·(1/2) = 1 = ∫[𝒪]` | agree |
| 6.1 | `ℙ¹`, `[O(−4) → Ω]`; `F• ⊕ [G = G]` | extension of `O(4)` by `O(2)` with class in `H¹(O(−2)) = k`: `O(3)²`; rank `rk F_1 + rk F_0 + rk G` | agree |
| 6.2 | `ℙ¹`, `[O(1) → Ω]`; `𝓛_n` on `L`; through `P` | `−1`; `n·[0₂] = −n·[0₁]`; `c_1(O(3)²/O(2)) = 4` | agree |
| 6.3 | `[O --x--> O]` on `𝔸¹`; `k[x]/(x^p)`; `pt → B𝔾_m` | `H^{−1} = 0` with `H⁰` not locally free (hypothesis needed, and stated); `p·[pt] ≠ 0`; `−1 + 1 = 0` | agree |
| 7.1 | `k[x]/(x²)`, `x ↦ ε` | `(ε + aε²)² = ε² ≠ 0` | agree |
| 7.2 Check 1 | `char 2`, `φ = (0, id)` | `L_X = A[1] ⊕ A`, `ω ∈ J ⊕ 0`, `φ^*ω = 0`, no lift | agree |
| 8.1 smooth descent of `W_*` | `U′ = 𝔸¹ → U = pt`, `({0}, 2)` | pullbacks `{0} × 𝔸¹` and `𝔸¹ × {0}`, unequal: not a descent datum | discriminates |
| 8.1 deformation space | `Spec k → BG`; `pt ⊔ pt → pt` | `R → U ×_G V` étale and an immersion; fibres `BG`, `Spec k`; `ℙ¹` with `0` doubled | agree |
| 8.1 `β`, sign | plane example, by kresch1999b Corollary 1.10 | `ω = η/ν`, `∂ω = [η = 0] − [ν = 0]`, `β = ν/η` | agree; S01 |
| 8.1 naming against kresch1999b §3 | `(X, Y′)` here is `(Y′, X)` there | acting bundle `T_{Y′}|_{X′}` here is the tangent bundle of the regularly immersed smooth stack | agree |
| 8.1 third statement | `(i, i) : X → Y ×_𝔅 Y` | both projections pull `Y′` to `(Y ×_𝔅 Y) ×_𝔅 𝔅′`; `α_1^*β = α_2^*β` | route holds |
| 8.1 groups, unbounded dimension | `⊔_n 𝔸ⁿ` | component `n` of `β` in `W_n` | S03 |
| 8.2 | codimension; node; non-reduced | height of `(f_1 … f_c)` is `c`, so `d − c` is automatic; `−2·[pt × pt]`; `2·[pt]` | agree |
| 8.4 | route with 4.2's bullet (`𝒢 = B`, `𝒢_1 = 𝔐 × B`, `𝒢″ = X`, `𝒢′ = B`); `y² = x^p − a` | `i_b^! p_* = p′_* η_b^!`; `𝔪 = (y)`, Jacobian `(0, 2y)` | agree |
| 9.1 | `X = Spec k` | unique lifts, so `M → 𝔅` étale | agree |
| 9.3 | `Ext^i(g^*E, J)` | `H^i(Rπ_*(F_T^*T_X) ⊗^L J)` on affine `T` | agree |
| 9.4 | triangle | `π_*G = π_*H = 0`; cone of `R¹π_*H[−1] → R¹π_*G[−1]` in degrees `0, 1` | agree |
| 9.5 | `b = 3g − 3 + n` | `3g − 3 + n + δ + ℓ(1 − g) = (1 − g)(ℓ − 3) + n + δ`; `ℙ¹ × 𝔸¹`: `4`, `A_0 = 0` | agree |
| 2.1 Check 4 against 8.1 | `⊔_ℕ Spec k` | `ℤ^ℕ` in 8.1, "not defined" in 2.1 | S04 |

## Verified sound

- Declarations read: 0 (the Lean file has none; all 71 lines read). Targets read: 33 (1.1–9.5),
  all 2380 lines of the README, with the eight Conventions and the supplier contracts.
- Checks: every Check bullet read; those behind the 37 rows of the table above recomputed; every
  definition has at least three.
- Locators verified against the cached texts this round: 41 (kresch1999b 17: lines 65–135,
  142–163, 182–190, 192–207, 218–237, 242–243, 250–256, 259–274, 304, 307–315, 334–343, 390–405;
  vistoli1989 13: lines 499–535, 1126–1160, 1665–1704; behrend-fantechi1997 5: lines 1162–1171,
  1645–1670; rydh2015 2; edidin-graham1998 2; behrend1997 1; li-tian1998 1). None wrong.
- Sibling citations checked at their current heads (every cited section located; 21 read in
  full). VirtualFundamentalClass (head of its open
  pull request, read with `roadmaps show`): Conventions, §§0.2–0.3, 1.5–1.6, 2.1–2.5, 9.1, 9.5 read
  in full, and the headings of every other cited section (§§1.4, 3.1–3.5, 4.1–4.5, 5.1–5.5,
  6.1–6.6, 7.1–7.7, 8.1–8.5, 9.2–9.6) exist. StackPointsAndResidualGerbes §§0.1, 0.3, 0.5, 1.3,
  2.3, 2.5, 4.5, 5.3, 5.4; StableReductionPartII §5.15 (hypotheses identical to README:456–460);
  on main: SchemeAndStackFoundations §§1.3, 1.9, 1.10, 1.18–1.23, 2.6, 2.10, 2.18–2.20, 3.3, 4.1,
  4.14, 5.1–5.6 and 19 declaration names; EquivariantIntersectionTheory §§2.1–2.2;
  DerivedModuleAlgebra §§0.7, 0.12, 0.25; EnhancedDerivedSheaves §0.3, E1.4, E1.8;
  StableReduction's layers; AlgebraicGromovWittenTheory §§2.1, 4.1–4.3 (it cites this roadmap
  nowhere).
- Pinned declarations: 14 found at the pins with the stated meaning (`Scheme.ord` with junk value
  `0`, `AlgebraicCycle`, `AlgebraicCycle.map`, `cyclesOfDimension`, `RatEquiv`, `ChowGroup`,
  `cycleClass`, `ChowGroup.equivIntOfUnique`, `SchPseudofunctor`, `Spaces.IsAlgebraicSpace`,
  `PrestableFamily`, `vectorBundleDegree`, and the two files of `Chow/`).
- Declared gaps: both slugs are in `design/plan.json` and under "What VirtualFundamentalClass must
  provide", each with supplier, section and one `needs` sentence; not raised.
- Merge order: every named supplier is on main, earlier in the order (StackPointsAndResidualGerbes,
  StableReductionPartII) or an open pull request of another author that adds a new folder
  (VirtualFundamentalClass). AlgebraicGromovWittenTheory, GromovWittenTheory and ImplicitAtlases
  are named only as consumers or as out of scope.
- Ownership against open pull requests: `roadmaps grep` by object (local immersions of stacks,
  finite covers by schemes, Chow groups of algebraic spaces, cycle groups of Artin stacks,
  deformation invariance of virtual classes, `P`-divisors) found no second owner; `overlaps.md`
  lists no shared roadmap, no dropped id and no second copy.
- Policy: no pull-request number, process word, `lemma` or `set_option`; no machine path in the
  README, the Lean file or `sources.toml`; every target has a locator.
- Copyright: wording compared at the 41 locators above and in 8 further passages (the gap contract
  with vistoli1989 lines 508–535; 4.2's normal-cone route with lines 1685–1704; 8.1's deformation
  space with kresch1999b lines 259–274; 8.1's groups with its Remark 2.5; 1.1 with rydh2015 lines
  81–85; 7.2 with behrend-fantechi1997 lines 1162–1168; 9.4 with behrend1997 lines 165–176; 5.3
  with edidin-graham1998 lines 1069–1076). Longest shared run: 7 words ("finite, finitely presented
  and surjective morphism"), a list of adjectives. Arrangement: vistoli1989 runs §1 preliminaries,
  §2 moduli spaces, §3 cycles and Gysin maps, §4 the rational equivalence, §5 bivariant theory, §6
  moduli spaces again, §7 appendix; the README puts its §2 and §6 in Layer 5 after its §3, splits
  §3 over Layers 2–4 by integrality, has no layer for §4, and Layers 6–9 use other sources: no
  one-to-one run. No table, figure or list of examples is taken over.

Source independence: 49 passages compared with 7 sources, none shared; largest share vistoli1989, 79 of 166 source citations in the body; contents compared with vistoli1989: independent.

## Not verifiable

- fulton1998 and gillet1984: settled as uncertified; cited by locator, texts not read.
- vistoli1989 section headings and several displays are illegible in the OCR text; the contents
  comparison uses its paragraph numbers ((1.x) to (7.x)) and their line ranges.
- 8.3's second case and the API comparison of cone stacks: read and tested on the README's own
  degenerate cases only; new generality with a route, not a full proof.
- 8.1's `β` on a double deformation space with components inside the fibre over `(0, 0)` (for
  `X = Y′` the origin of `𝔸ⁿ`, `n ≥ 3`, the locus `s = t = 0` has dimension `2n > n + 2`): the
  README sums over the components dominating `ℙ¹ × ℙ¹`; I checked that kresch1999b Definition 1.5
  gives `0` on the others and did not carry the whole proof through.
- Locators not reopened this round (verified by both round-1 passes at the same source texts):
  stacks-chow-spaces, stacks-chow, deligne-mumford1969, keel-mori1997 and the remaining
  vistoli1989 and behrend-fantechi1997 lines.
- No Lean was run; the file has no declaration.

## Source issues

- **Misprint** in kresch1999b at Section 3, the paragraph before Theorem 3.1 and Theorem 3.1, printed p. 10: the source says the acting bundle is the tangent bundle of the arbitrary locally immersed stack; it should be that of the smooth regularly immersed stack, as its proof uses; affects a stated result.
- **Error** in behrend-fantechi1997 at Proposition 3.5: the source says the rational equivalence is invariant under the whole restricted tangent bundle of the ambient; it should be invariant only under the tangent bundle of the regularly immersed smooth stack; affects the proof; corrected in print at kresch1999b, the sentence after Theorem 3.1, printed pp. 10–11.

## For the human reviewers

- **Not tested.** vistoli1989, the source with the largest share, was read in an OCR extraction of the GDZ scan (`sources.toml`, entry `vistoli1989`); section headings and several displays are illegible, so those were compared by statement number only.
- **Scope.** 6.2 and 8.1–8.4 state results for stacks that need not be separated and bases that need not be smooth or reduced; behrend-fantechi1997 lines 1664–1670 and kresch1999b Theorem 3.1 state the separated or smooth case.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9e8a619723fc7dad25bcb52283955a29226840c7", "job": "RT-VirtualFundamentalClassPartII~2a", "model": "fable", "worker": "chris-x88"} -->
