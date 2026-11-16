<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18018#issuecomment-6908705507 -->
Red team round 2 pass b (claude) of 9e8a619

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Convention 2 defines regular local immersions only for Deligne–Mumford targets

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:177–178`: "it is a *regular local
   immersion of codimension `d`* if, étale locally on source and target, it is a regular closed immersion
   of codimension `d`."

   **Claim.** This is the notion used at `:993`, `:1156`, `:1773`, `:1802`, `:1892` and `:2033–2035` for
   regular local immersions "of algebraic stacks locally of finite type over `k`".

   **Witness.** 8.4 uses `η_b : 𝔐 × {b} → 𝔐 × B` with `𝔐 = B𝔾_m` named at `:2037`. `B𝔾_m × B` has no
   étale cover by schemes, so "étale locally on the target" selects nothing. The sources use smooth charts:
   kresch1999b lines 218–228 and 232–234; vistoli1989 (1.20), lines 503–505, uses atlases.

   **Repair.** Replace the clause by:

   > it is a *regular local immersion of codimension `d`* if there are schemes `U`, `V` with `V → 𝒢` and
   > `U → ℱ` smooth and surjective, `U → ℱ ×_𝒢 V` étale and `U → V` a regular closed immersion of
   > codimension `d` (the charts of gap:normal-cones-of-local-immersions; kresch1999b Lemma 2.2 and lines
   > 232–234; vistoli1989 (1.20), lines 503–505, with étale atlases). When `𝒢` is Deligne–Mumford this is
   > the condition that, étale locally on source and target, the morphism is a regular closed immersion of
   > codimension `d`.

   Tested on the witness: `V = B → B𝔾_m × B` (smooth, surjective), `U = {b}`,
   `U → (B𝔾_m × {b}) ×_{B𝔾_m × B} B = {b}` an isomorphism, `U → V` regular of codimension `1`. On
   `Spec k → BG`: `V = U = Spec k`, `U → Spec k ×_{BG} Spec k = G` the unit section (étale), `U → V` the
   identity, codimension `0`, as 3.5's fifth Check uses.

2. **F02** (P3) 9.5, second Check: the value `n` holds only over a base of dimension `3g − 3 + n`

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:2306`: "`X` with `c_1(T_X) = 0` and of
   pure dimension `3`: the virtual dimension is `n` for every `g` and `β`."

   **Claim.** The Check evaluates 9.5's formula `b + δ + dim X · (1 − g)`.

   **Witness.** With `b` free the value is `b + 3(1 − g)`: for `𝔅 = Spec k`, `g = 0`, `X` an abelian
   threefold and constant maps `ℙ¹ → X`, it is `0 + 0 + 3 = 3 = dim X` (`H⁰(ℙ¹, O³) = k³`, `H¹ = 0`), not
   `n`. After the round-1 repair `n` is defined only at `:2293`, and `β` needs `X` proper (`:2288`).

   **Repair.** Replace the bullet by:

   > - `X` proper of pure dimension `3` with `c_1(T_X) = 0`, over a base of pure dimension
   >   `b = 3g − 3 + n`: `δ = c_1(T_X) · β = 0` and the virtual dimension is `3g − 3 + n + 3(1 − g) = n` for
   >   every `g` and `β`. Over `𝔅 = Spec k` (`b = 0`) it is `3(1 − g)`: for `g = 0` it is `3`, the dimension
   >   of the space `X` of constant maps `ℙ¹ → X` to an abelian threefold.

   Tested: `g = 0`, `n = 3`: `0 + 0 + 3 = 3 = n`; `g = 2`, `n = 0`: `3 + 0 − 3 = 0 = n`; `b = 0`, `g = 0`: `3`.

3. **F03** (P3) 8.1, route of the relative invariance: the common pullback of `Y′` is not a closed substack

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:1815–1816`: "the two projections
   `p_1, p_2 : Y ×_𝔅 Y → Y` … pull `Y′` back to the same closed substack `(Y ×_𝔅 Y) ×_𝔅 𝔅′`".

   **Claim.** `(Y ×_𝔅 Y) ×_𝔅 𝔅′` is a closed substack of `Y ×_𝔅 Y`.

   **Witness.** The statement (`:1801–1803`) takes `𝔅′ → 𝔅` a regular local immersion. For
   `𝔅 = BG`, `𝔅′ = Spec k` (`G` finite étale, `|G| > 1`) and `Y = BG × 𝔸¹`, the pullback is
   `𝔸² → BG × 𝔸²`, finite étale of degree `|G|`: not a monomorphism, so no substack.

   **Repair.** Replace "pull `Y′` back to the same closed substack `(Y ×_𝔅 Y) ×_𝔅 𝔅′`, because `Y′`
   comes from `𝔅`" by "pull `Y′ → Y` back to the same local immersion
   `(Y ×_𝔅 Y) ×_𝔅 𝔅′ → Y ×_𝔅 Y`, the two pullbacks being identified by the 2-isomorphism
   `p ∘ p_1 ≅ p ∘ p_2`, because `Y′` comes from `𝔅`". Tested on the witness: both pullbacks of
   `𝔸¹ → BG × 𝔸¹` are `𝔸² → BG × 𝔸²`; in the plane example (`p = y`) both are `{y = 0}` in
   `𝔸³_{x_1, x_2, y}`, and through `p = x` they are `{y_1 = 0}` and `{y_2 = 0}`, which differ, as 8.1's
   first Check requires.

Round 2. All eight findings of round 1 (passes a and b) are repaired at this head, and no repair
introduced a false statement. Three new P3 findings (S01–S03): one definition that does not reach
the generality in which it is used, one Check that is false without a hypothesis it leaves out, one
wrong word in a route. No P1 or P2 finding: no statement was refuted, every cited supplier section,
declared gap and pinned declaration resolves, and the dependency check is clean.

## Round 1 findings at this head

| Finding | State | Witness at 9e8a619 |
|---|---|---|
| 1a/F01, 1b/F01 (P2), groups for `β` on algebraic stacks | repaired | `packages/VirtualFundamentalClassPartII/README.md:1714–1746`: "define *smoothCycles* `Z_*(𝔛)` and *smoothRatEquivalences* `W_*(𝔛)`: the families `(z_U)`, one for each scheme `U` of finite type over `k` with a smooth morphism `U → 𝔛`"; five "Prove" items; Checks at `:1856–1868`. Recomputed: `B T_{𝔸¹}` (degree `1 − 1 = 0`), `⊔_ℕ 𝔸²` (locally finite, not a finite sum), `[𝔸¹/μ₂]` (`div(x²) = 2·[0] ↦ 2·[Bμ₂]`). `*Needs:*` at `:1828–1833` names 2.1, 2.2, 3.1. |
| 1a/F02 (P2), deformation space of a local immersion | repaired | `README.md:1748–1769`: "define *localImmersionDeformationSpace* `M°_F G`, an algebraic stack over `G × ℙ¹`, by descent (kresch1999b lines 259–274)". The repair's change from the suggested text (`R → S` an immersion of algebraic spaces, built with VirtualFundamentalClass §1.5) is correct: `S = V ×_G V` is an algebraic space. Checks at `:1869–1888` recomputed (below). |
| 1a/F03 (P3), normal-cone formula on stacks | repaired | `README.md:1184–1196`: "`f^![𝒢′] = s^![C_{ℱ′/𝒢′}]` in `A_*(ℱ′)_ℚ`"; cited in 8.2 (`:1909–1910`) and 8.3 (`:1999–2000`); `*Needs:*` of 4.2 adds 2.1 and 3.3. Route agrees with vistoli1989 lines 1685–1704 and Lemma 3.15 (lines 1139–1160). |
| 1a/F04 (P3), prestable-curve stack in 9.5 | repaired | `README.md:2293–2295`: "for a base of pure dimension `b = 3g − 3 + n` the virtual dimension is then `(1 − g)(dim X − 3) + n + c_1(T_X) · β`"; `:130–133` lists AlgebraicGromovWittenTheory under "Not part of this roadmap" as a consumer. The repair left one Check without the hypothesis it now needs: S02. |
| 1a/F05 (P3), two `*Needs:*` lines | repaired | `README.md:1229–1230` ("1.1, 3.1, 4.1–4.2; …") and `:1498–1499` ("for the first API bullet, also VirtualFundamentalClass §§7.1 and 9.1"); the five further lines the repair extended (3.1, 4.2, 5.1, 5.4, 6.2) each name an item their text uses. |
| 1b/F02 (P3), Convention 6 witness | repaired | `README.md:233–242`: "a morphism `E → τ^{≥−1}L` is a truncation exactly when its image in `Hom(E, τ^{≤−2}L[1])` vanishes"; elliptic curve `H¹(O) = k`, `H²(O) = 0`; abelian surface with class `≠ 0` in `H²(A, O_A)`. Recomputed: the identity of `O_A[1]` lifts iff the connecting map `O_A[1] → O_A[3]` is `0`. |
| 1b/F03 (P3), Convention 2 locator | repaired | `README.md:174–179`: "(vistoli1989 lines 499–500, there called a local embedding; kresch1999b lines 232–234 uses the word local immersion, for morphisms that are only locally of finite type)". Both locators opened: correct. The neighbouring definition of *regular* local immersions is S01. |

## Dependency check

    depcheck: 251 roadmaps, 2383 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` changes only files under
`packages/VirtualFundamentalClassPartII/` (8 files); in `design/plan.json` only entries of the `gaps`
list differ.

## The pass: Suggested.lean

| Declaration | Section, variables, instances | Result |
|---|---|---|
| (none) | `namespace TauCetiRoadmap.VirtualFundamentalClassPartII`, empty; `import Mathlib` only | states nothing; the module docstring lists 12 headline theorems, each with the carrier it lacks |

The `#check @name` comparison does not apply (no declaration) and no Lean was run. The docstring's
claims were checked at the pins: `TauCeti/AlgebraicGeometry/Stack/` has `Basic.lean` only;
`TauCeti/AlgebraicGeometry/Chow/` has `Basic.lean` and `ClosedImmersion.lean` only (`pushforward` is
along closed immersions); no file of the pinned Tau Ceti declares `IsAlgebraicStack` or
`DeligneMumford`, and its three files matching `cotangentComplex` are ring-level. Headlines of the
README: 2.2–2.3, 4.1–4.3, 5.1, 5.2, 5.3, 5.4, 6.1–6.3, 7.1–7.2, 8.1, 8.2–8.3, 8.4, 9.3–9.5, the twelve
of the docstring. Each needs a stack, a Chow group of a stack or space, or a derived cotangent complex
or `Rπ_*`: none is statable, none is forced through a stand-in, and nothing is padding. The new items
of 8.1 are not headlines and need algebraic stacks.

## The pass: README statements, with computed values

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conv. 2, regular local immersion | `B𝔾_m × {b} → B𝔾_m × B`; `Spec k → BG` | no étale chart of the target; chart `U = V = Spec k`, codimension `0` | S01 |
| Conv. 5 degree | `Spec k → BG → Spec k`; `Spec ℂ → [Spec ℂ/(ℤ/4)]` over `ℝ` | `|G| · (1/|G|) = 1`; `e · [ℂ : ℝ] = 2 · 2 = 4`, the torsor degree | agree |
| Conv. 6 witness | elliptic curve; abelian surface | `Hom(O[1], O[2]) = H¹ = k`, `Hom(O[1], O[3]) = H² = 0`; identity lifts iff class in `H²(A, O_A)` is `0` | agree |
| 1.1 finite cover | `L → B_{𝔸¹}G` | `Q ×_L Q`: pairs `(1,1), (2,2)` give `𝔸¹`, `(1,2), (2,1)` give `𝔾_m`; `= Q ×_{𝔸¹} G`; `L ×_{BG} 𝔸¹ = Q`, rank `2` | agree |
| 1.3 base change | `BH → Spec k` along `BG`; `Spec k → BG` along `BH → BG` | `1/|H|` both; fibre `G/H`, integral only for `H = G` | holds where defined |
| 1.3 inertia sum | `S₃`; `Bμ₃` over `ℚ` | `6/6 + 6/2 + 6/3 = 6`; `1 + (3/3) · 2 = 3` | agree |
| 2.2 `A_0([𝔸¹/μ₂])` | `P` irreducible, possibly inseparable | `k[x]/P(x²) = κ[x]/(x² − ȳ)`, `ȳ ≠ 0`, reduced for `char ≠ 2`; group `ℤ/2` | agree |
| 3.1 last Check | isogeny of degree `2` | sum of `π^{−1}P` minus sum of `ker π` is `2Q = π̂(P) = O`, degree `0` | agree |
| 3.2 divisor formula; 4.1 form | `𝔸¹ → 𝔸¹ × BG`; coarse map of `[𝔸¹/μ₂]`; `ℤ/p`-quotient, `φ = x` | `|G| · div(t)`; `2 · (1/2)·[0] = div(y)`; `(1/p) · p = 1` and `div(x) = [x = 0]` | agree |
| 3.5 homotopy invariance | `X = 𝔸¹_ℂ/(z ∼ z̄)`, `N = X × 𝔸¹` | `div(t) = [0_X]`; preimage of `V(g)` in the chart is `V(g)`, multiplicity `1`; `A_0(X) = 0 = A_1(N)` | agree |
| 4.2 normal-cone formula | `Spec k → BG`, `𝒢′ = BG`; `𝒢′ = 𝔸¹ × Spec k[ε]/(ε²)`, `f = {0} → 𝔸¹` | `m = |G|`, `[G] ↦ |G|·[pt]`, result `[pt]`; `[C] = 2·[N]`, `2·[pt] = [ℱ′]` | agree with 4.2's fourth API bullet |
| 5.1 projection formula | `BG → Spec k` | `Δ^![BG × BG] = [BG]`, both sides `(1/|G|)·[pt]`; weight `|G|²/|G|` would give `[pt]` | agree |
| 5.2 base change of moduli spaces | `(x, m′)` with `p(x) = m′|_M` | isomorphism classes of the fibre product over `Ω` are the points `m′` | agree |
| 5.3 `ℙ(1, 2)` | stabilisers of `(0, y)`, `(x, 0)` | `t² = 1`: `μ₂`; trivial; `∫ t = 1/2`, `∫ 2t = 1`, `t² ∈ A_{−1} = 0` | agree |
| 5.4 | `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]` | `Hom(ℤ/2, ℤ/4) → ℤ/2` is zero, so no real point; orders `2, −1, 0`, `2 · (1/2) = 1` | agree |
| 6.1, 6.2 on `ℙ¹` | `E = [O(−4) → Ω]` | `Ext¹(O(4), O(2)) = H¹(O(−2)) = k`, `P = O(3)²`; `c_1(O(4)) = 4 = c_1(O(3)²/O(2))` | agree |
| 6.2 on `L` | `𝓛_n` | section `e_1 = t^n e_2` has divisor `n·[0₂] = −n·[0₁]` | agree |
| 6.3 | `k[x]/(x^p)`; `pt ⊔ 𝔸¹` | `rk Ob = 1 ≠ 0 = dim X − d − r`, class `p·[pt]`; `[pt] + 0` | agree |
| 7.2 route and first Check | cone `C` of `φ`; `char 2` | `Hom(g^*C, J) = Ext¹(g^*C, J) = 0`; `d(x²) = 0`, `φ^*ω = 0`, `(x + ax²)² = x²` | agree |
| 8.1 groups | `B T_{𝔸¹}`; `⊔_ℕ 𝔸²`; `[𝔸¹/μ₂]`; `p : U ⊔ U → U` | `Z_i = Z_{i+1}(𝔸¹)`; infinitely many components; `2·[Bμ₂]`; `(z, 0)` has unequal pullbacks | agree |
| 8.1 `M°_F G` | `Spec k → BG`; `pt ⊔ pt → pt`; `{0} → 𝔸¹` | `R = e` open and closed in `G`; `ℙ¹` with `0` doubled; `x = tu`, fibre `Spec k[u]` at `t = 0` | agree |
| 8.1 `R → S` immersion | general | `R → U ×_G U` base change of `Δ_{F/G}` (étale monomorphism, open); `R → U ×_G V` base change of `U → F ×_G V` (étale) | agree |
| 8.1 boundary and sign | plane; `𝔸¹ × Spec k[ε]/(ε²)`; kresch1999b line 304 in its own letters | `[ν = 0] − [η = 0]`; `2·[ν = 0] − 2·[T = 0]`; `∂ω = [j^*N × C_{X′/Y′}] − [C_{u^*C/C}]`, so `β = −ω` | agree |
| 8.1 relative invariance | plane, `p = y` and `p = x`; `𝔅 = BG` | fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; pullback of `𝔅′` not a substack | holds; S03 |
| 8.2 | node, `V(a + b)`; `𝔸¹ × Spec k[ε]/(ε²)` | `k[a, b]/(ab, a + b) = k[a]/(a²)`, `−2·[pt × pt]` both; `2·[pt]` both | agree |
| 8.3 `Z′_0 ×_𝔜 X` | diagonal | finite unramified (base change of `Δ_{Z′/𝔜}`) then base change of `Δ_X` | Convention 1 holds |
| 8.4 | `x² − b y²`; `y² = x^p − a` | count `2` in the three cases; `𝔪 = (y)`, Jacobian `(0, 2y)` vanishes at `b₀` | agree |
| 9.2 fourth Check | `R = k[x_i]/(x_i)²`, `t ↦ x_1` | `t · x_1 = x_1² = 0`, not flat | agree |
| 9.4 | sequence `0 → H → G → V → 0` | `π_*H = π_*G = 0`, so `0 → π_*V → R¹π_*H → R¹π_*G → R¹π_*V → 0` | agree |
| 9.5 formula | `b = 3g − 3 + n`; `ℙ²` lines; `ℙ¹ × 𝔸¹`; `b = 0`, `g = 0`, `c_1 = 0`, `dim X = 3` | `(1 − g)(dim X − 3) + n + δ`; `2`; `4`; `3`, not `n` | S02 |

## Verified sound

- Read: every line of `README.md` (2380 lines, 33 targets 1.1–9.5, 145 Check bullets in 33 Check
  blocks) and of `Suggested.lean` (71 lines, 0 declarations). Every definition has at least three
  Checks; the two definitions added in 8.1 have four and three.
- Locators opened in the cached texts this round: 21. kresch1999b lines 182–190, 192–207, 218–237,
  242–243, 250–256, 259–274, 304, 307–315, 331–343, 390–405; vistoli1989 lines 485–500, 503–507,
  508–535, 1126–1131, 1132–1160, 1671–1704; rydh2015 lines 81–87; deligne-mumford1969 lines 1012–1019.
  Each carries the statement cited. These cover every locator the round-1 repair added or changed; the
  other locators were verified in round 1 and their passages are unchanged.
- Sibling citations checked at the current heads: 48. VirtualFundamentalClass (its open head, read
  with `roadmaps show`): Conventions, §§0.2, 0.3, 1.5, 1.6, 2.1–2.5, the Layer 2 Examples, 3.4, 7.6,
  7.7, 9.1–9.6, with the hypotheses the README attributes to them (§1.5: representable closed
  immersions only; §2.5: separated test stacks, restricted action `T_{Y′}|_{X′}`, the plane example;
  §9.4–9.5: smooth bases). StableReductionPartII §5.15 (the Edidin–Graham comparison is its second
  paragraph, same hypotheses as README:456–460). StackPointsAndResidualGerbes §§0.1, 0.3, 0.5, 1.3,
  2.3, 2.5, 4.5, 5.3, 5.4 (headings). SchemeAndStackFoundations on main: §§1.19, 1.20, 1.23, 2.6, 2.10,
  2.18–2.20, 4.14, 5.5, 5.6 and all 28 backticked declaration names (each occurs there); §5.5 places the
  special fibre over `∞`, as README:1760 says. AlgebraicGromovWittenTheory §§2.1, 4.1–4.3 (it does not
  cite this roadmap; its formula is `(1 − g)(d − 3) + n + c_1(T_X) · β`).
- Pinned declarations opened: 9. `cyclesOfDimension` (an `AddSubgroup` of `AlgebraicCycle X ℤ`
  supported on `pointsOfDimension`), `RatEquiv X k : AddSubgroup (cyclesOfDimension X k)` (so
  2.3's `∂W_i(X) = RatEquiv X i` is an equality of subgroups), `ChowGroup`, `cycleClass`,
  `equivIntOfUnique`, `ChowGroup.pushforward` (closed immersions), `PrestableFamily` (a class on a
  morphism of schemes: proper, geometrically connected, at worst nodal of relative dimension one; no
  genus), `vectorBundleDegree`, `Scheme.ord`.
- Gaps: both slugs are in `design/plan.json` and under "What VirtualFundamentalClass must provide",
  with supplier and section; not raised. The deformation space of 8.1 uses the gap's cone as its
  special fibre and asks the supplier for nothing more.
- Ownership: `roadmaps grep` over main and the open heads for cycles on algebraic stacks by smooth
  descent, the deformation space of a local immersion and Kresch's cycle groups found no second owner.
  The board package VirtualFundamentalClasses states proper covers of separated stacks; it is later
  than this roadmap in the merge order and this README does not cite it.
- Policy: no pull-request number, process word, `lemma`, `set_option` or machine path in the README or
  the Lean file; proposed names are in italics; every target has a locator.
- Copyright. Six passages put beside their sources this round: 8.1's deformation space with
  kresch1999b lines 259–274; 8.1's groups with its Remark 2.5 (lines 250–256); Convention 2 with
  kresch1999b lines 232–234 and vistoli1989 lines 499–505; 4.2's normal-cone route with vistoli1989
  lines 1685–1704; 1.1 with rydh2015 lines 81–85; 1.1 with deligne-mumford1969 lines 1012–1019. The
  longest shared run is 7 words, the adjectives of rydh2015 Theorem B's conclusion; in the new text of
  8.1 it is 4. Arrangement: vistoli1989 has §1 facts on stacks, §2 moduli spaces, §3 intersection
  theory, §4 proof of the main lemma, §5 bivariant theory, §6 duality on moduli spaces, §7 appendix;
  the README puts its §2 and §6 in Layer 5, splits its §3 over Layers 2–4, has no layer for its §4 or
  §7, and takes Layers 6–9 from other sources. No table, figure or list of examples is taken over.

Source independence: 6 passages compared with 4 sources this round (18 with 9 sources over both
rounds of this pass), none shared; largest share vistoli1989, 79 of 168 locators; contents compared
with vistoli1989: independent.

## Not verifiable

- fulton1998 and gillet1984: settled as uncertified; the texts were not read.
- vistoli1989 is an OCR extraction; the displays at lines 1140–1143, 1151 and 1683 are partly
  illegible and were matched from the surrounding prose.
- behrend-fantechi1997, behrend1997, li-tian1998, stacks-chow-spaces, edidin-graham1998 and
  keel-mori1997 locators were not reopened this round: the passages citing them are unchanged since
  round 1, where both passes verified them.
- 8.1's third and fourth statements, 8.3's second case and 5.1's Poincaré duality for the restricted
  bivariant groups are new generality with a route and no source to compare with; the routes' steps
  and the instances in the table were checked, not full proofs.
- Elaboration of `Suggested.lean`: not run (this pass runs no Lean); the file has no declaration.

## Source issues

- **Misprint** in kresch1999b at Section 3, the paragraph before Theorem 3.1 and Theorem 3.1, printed p. 10 (lines 331–336): the source says the acting bundle is the tangent bundle of the arbitrary stack it calls Y′; it should be that of the smooth, regularly immersed stack X, as its proof (lines 400–401) uses; affects a stated result.
- **Misprint** in kresch1999b at Theorem 3.1, printed p. 10 (lines 334–336): the source says the second class and the space acted on are formed with the normal cone of X′ in Y′; it should be the normal cone of X′ in X, inside the pulled-back cone of Y′ in Y; affects a stated result.
- **Error** in behrend-fantechi1997 at Proposition 3.5: the source says the rational equivalence is invariant under the whole restricted tangent bundle of the ambient stack; it should be only under the tangent bundle of the regularly immersed smooth stack; affects the proof; corrected in print at kresch1999b Theorem 3.1 and the sentence after it (lines 337–343).

## For the human reviewers

- **Not tested.** vistoli1989, the source with the largest share of the locators (`sources.toml`, entry `vistoli1989`), was read in an OCR extraction of the GDZ scan; several displays are illegible, so wording there was compared from the prose only.
- **Scope.** 8.1 (third and fourth statements), 8.2 and 8.3 state results over bases that need not be smooth or reduced; the cited sources (behrend-fantechi1997 Propositions 7.2 and 7.5, kresch1999b Theorem 3.1) state the smooth case only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9e8a619723fc7dad25bcb52283955a29226840c7", "job": "RT-VirtualFundamentalClassPartII~2b", "model": "fable", "worker": "chris-x81"} -->
