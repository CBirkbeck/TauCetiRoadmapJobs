<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6903642762 -->
Review (claude) of bfade43

Verdict: needs_changes

1. **F01** (P3) four pullback clauses leave the class of the new object unstated

   - **Location.** `design/README.md`:
     - 1.1, fourth statement: "proper covers pass … along morphisms `𝒩 → ℳ` representable by schemes";
     - 6.1 API: "compatible with pullback along morphisms `X′ → X`";
     - 9.1 API: "stable … under étale morphisms `M′ → M`";
     - 9.2: "commutes with base change along every `M′ → M`", and 9.3 API "base change along `M′ → M`".

     `design/plan.json`: 1.1 `statement`, `resolutionComparison.functorial`,
     `RelativeSpaceOfMaps.open_etale`, `mapsObstructionTheory.baseChange`.
   - **Claim.** Each holds for every `𝒩`, `X′`, `M′` with such a morphism.
   - **Witness.** `ℳ = M = 𝔅 = X = Spec k`, `𝒩 = M′ = ⊔_ℕ Spec k`: the morphism is étale and representable by
     schemes, but `⊔_ℕ Spec k` is not quasi-compact, so it is no stack of Convention 1. A proper cover (1.1)
     and a relative space of maps (9.1) are defined only for such stacks, and `Spec k ×_ℳ 𝒩` is not of
     finite type.
   - **Rated P3,** as round 15's F02 was: outside the class the conclusion cannot be stated, so the slip
     is one of wording. 1.1's API bullet already says "every stack representable by schemes over `ℳ`".
   - **Repair.**
     - 1.1: "along morphisms `𝒩 → ℳ` of stacks representable by schemes (the base change `X ×_ℳ 𝒩` is a
       scheme of finite type over `k`, proper and surjective over `𝒩`)".
     - 6.1 API: "along morphisms `X′ → X` of stacks (Convention 1)".
     - 9.1 API: "under étale morphisms `M′ → M` from a stack `M′` (Convention 1)".
     - 9.2: "along every morphism `M′ → M` from a stack of Convention 1 or from a locally Noetherian
       scheme", the class in which StableReduction Layer 2 states base change and which contains the
       points `Spec κ(t) → M` that 9.5 uses; 9.3 API: "along morphisms `M′ → M` of stacks (Convention 1)".
     - The same words in the four plan entries.

     Tested on the witness: `⊔_ℕ Spec k` is excluded by each repaired clause. Tested on instances inside
     the class: for `𝒩 = Spec K → Spec k`, `K/k` finite, `Spec k ×_k Spec K = Spec K` is a proper cover of
     `Spec K`; for `M′ = Spec K → M = Spec k` with `X = Spec k`, `M′ → 𝔅` is étale, so `(M′, F)` is a relative
     space of maps (9.1, first Check).

One finding, P3 (R01); no P1 and no P2. R01 carries a repair, so the verdict asks for changes: a fix
round applies it. The two declared supplier gaps, `gap:closed-substacks-of-stacks`
(VirtualFundamentalClass §2.1) and `gap:normal-cones-of-local-immersions` (VirtualFundamentalClass
§1.5), are precise, minimal and declared in both files; they are contracts and no finding.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md` (2112 lines, read in full),
`packages/VirtualFundamentalClassPartII/design/plan.json` (9 layers, 33 targets, 2 gaps; the entries the
last repair changed and those R01 names were read against the README) and
`packages/VirtualFundamentalClassPartII/sources.toml` (14 entries). This is a design: there is no
`Suggested.lean`. This lane does not elaborate, so no elaboration, no `#check` comparison and no
one-tactic probe were run, and none applies at this stage.

## Round-15 findings

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3), 8.4 base assumed smooth | repaired | 8.4: "Let `B` be a regular connected curve over `k`, separated or not: a connected regular `k`-scheme of finite type and of dimension one (over a perfect `k`, the same as a smooth one), hence integral"; route: "No step uses separatedness or smoothness of `B`"; the Check "A regular base that is not smooth (`p` odd)" is added; plan 8.4 `statement` and first `hypotheses` entry agree. |
| F02 (P3), 5.2 base-change bullet | repaired | 5.2 API: "For a morphism `M′ → M` of quasi-separated algebraic spaces of finite type over `k`, `M′` is a moduli space for `ℳ ×_M M′` … `ℳ ×_M M′` is a stack of Convention 1"; a base-change Check is added; plan `moduliSpace.baseChange` agrees. The same repair was made in 4.2's flat-base-change bullet and in the contract of `gap:normal-cones-of-local-immersions`. |

Each repaired passage was recomputed (table below). The pattern of F02, a base-change or pullback
clause that does not say in which class the new object lies, was looked for in every section: R01
lists the places that remain. The pattern of F01, a hypothesis no step uses, was looked for again:
none found (1.3 separated morphism, 5.1 `T` separated, 5.4 proper, 6.3 `H⁰(E)` locally free, 8.2
pure dimensions, 8.3 finite unramified diagonal, 8.4 regular, connected, proper and `m + r = 0`, 9.4
ampleness and reduced fibres are each used, most with a Check that shows it).

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 236 roadmaps, 2239 edges, 0 problem(s)

No UPWARD and no CYCLE line. The citation resolver, run again on the README against main and 446
open heads, lists no cross-roadmap citation and no Lean name found nowhere. Suppliers:
VirtualFundamentalClass and StableReductionPartII (open pull requests that add new folders), and
SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and
DerivedModuleAlgebra (folders on main). AlgebraicGromovWittenTheory is named as a consumer and for
comparison only. GromovWittenTheory and ImplicitAtlases occur once each, under "Not part of this
roadmap". The stopped package VirtualFundamentalClasses, AlgebraicVectorBundles, EllipticCohomology,
DerivedDeRhamCohomology and the roadmaps of the never-cite list occur 0 times in the README and in the
plan (counted).

## Maintainer notes

None stands as a finding.

1. Words: holds in the text. Convention 2 uses "local immersion" for the class and "local embedding"
   for the chart pair, and gives Vistoli's words once.
2. Cotangent complex: holds. Convention 6 defines no truncated complex; 9.3 builds `φ` into the full
   `L_{M/𝔅}` from the projection formula and the trace.
3. Integral and rational groups: holds, by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the restricted and the relative invariance with the plane example
   (`c·ν/(η + b) ≠ c·ν/η`). The sub-claim "the owner's text names no acting group" is refuted:
   VirtualFundamentalClass §2.5 at its open head reads "prove invariance under the restricted tangent
   action `T_{Y′}|_{X′}` of Kresch, Theorem 3.1".
5. Functoriality: 8.3's second case goes through the graph and says that no compatibility datum over
   the graph is used, with the reason.
6. Suppliers: holds; the plan's `suppliers` are the seven named above, each cited by section.

## Adversarial table

Rows: the 15 sampled targets, the passages the last repair changed, the headline statements among
them, and the targets of R01. Every value was computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 rational equivalence (sampled, headline) | `[𝔸¹/μ₂]`; `P(y)` inseparable over `𝔽_p(a)`; `BG` | `ord_{Bμ₂}(y) = ord_0(x²) = 2`; `k[x]/P(x²) = K[x]/(x² − ȳ)` with `ȳ ≠ 0`, separable for `char ≠ 2`, so `div(P(y)) = [W]`; `A_0 = ℤ/2`, `A_1 = ℤ`; `W_{−1}(BG) = k^×` maps to `Z_{−1} = 0` | holds | none |
| 2.3 comparisons | `L`; `[𝔸¹/μ₂]` | `ℤ²/ℤ·(1, 1) ≅ ℤ`; `ℤ/2 ⊗ ℚ = 0` | holds | none |
| 3.1 étale pullback not injective | 2-isogeny `π : E′ → E` | degree `0`, sum `2Q + T − T = π̂(P) = O` | holds | none |
| 3.3 push–pull, localisation (sampled) | `π : Spec k → BG` against itself; `[𝔸¹/μ₂]`, `𝒵 = Bμ₂`; `ℙ¹`, two points | `\|G\|·[Spec k]` both sides, `Σ_z [κ(z) : k] = \|G\|`; `ℤ → ℤ/2 → 0 → 0`; kernel `ℤ·(1, −1)` | exact on the right only | none |
| 3.4 exterior products | `K ⊗_k K`, separable of degree `2` and `k(a^{1/p})`; `BG × BH` | two points of degree `2` (`4 = 2 + 2`); length `p`, `p·[Spec K]` (`p² = p·p`); `[B(G × H)]` | holds | none |
| 3.5 integral Gysin maps (sampled) | `{0} → 𝔸¹` along `z ↦ z²`; `Spec k → BG`, `Y = Spec k`; the space `X` over `𝔸¹_ℝ`, `N = X × 𝔸¹`; non-flat base change `{0} → 𝔸¹` | `2·[pt]`; `[G]`, pushed to `\|G\|·[Spec k]`; `div(t) = [0_X]`, `A_0(X) = 0 = A_1(N)`, `A_1(X) = ℤ`, `A_2(N) = ℤ`; `id^![pt] = [pt]` against `c_1(O) ∩ [pt] ∈ A_{−1} = 0` | holds; flatness needed | none |
| 3.5 flat base change | `𝔸² → 𝔸¹`, `Y = 𝔸¹` by `t ↦ (t², t)` | `2·[pt]` both ways | holds | none |
| 4.1 rational pushforward (sampled, headline) | `Spec k → BG → Spec k`; coarse map of `[𝔸¹/μ₂]`; `L × B(ℤ/2) → L` | `\|G\|·(1/\|G\|) = 1`; `p_*(2·[Bμ₂]) = [0] = div(y)`; `(1/2)·[0₁]`, `ℚ ≅ ℚ` | holds | none |
| 4.1 exterior-product bullet | integral `𝒱`, `𝒲` with coverings of degrees `a`, `b` | `(p × p′)_*([Y] × [Y′]) = ab·[𝒱] × [𝒲]` by 3.4 | holds | none |
| 4.2 flat base change (repair) | `𝒢_1 = 𝔐 × B → 𝒢 = B`, `𝒢′ = B`, `𝒢″ = X` (8.4); `𝒢_1 = Spec k(t) → 𝔸¹` | `η_b^! = i_b^!`, `i_b^! p_* = p_{b*} η_b^!`; not locally of finite type, so `f_1^!` is not defined and the clause excludes it | holds in the stated class | none |
| 4.2 `f^![𝒢] = [ℱ]` | `𝒢 = 𝔸¹ × Spec k[ε]/(ε²)`, `ℱ = {t = 0}` | `2·[pt]`, the length of `k[ε]/(ε²)` | holds with multiplicities | none |
| 4.3 Chern classes | `L ⊕ L^∨`; `O(−1)` on `ℙ¹`; `BG` | `c_1 = 0`, `c_2 = −c_1(L)²`; `−[pt]`; `A_{−i}(BG)_ℚ = 0` | holds | none |
| 4.4 agreement (sampled) | `B(ℤ/2) → Spec k`; `Spec k` | `(1/2)·[Spec k]`, the VirtualFundamentalClass §2.1 Check read at the head; `1` | holds | none |
| 5.1 products (sampled, headline) | `g : BG → Spec k`, `x = [Spec k]`, `y = [BG]`; diagonal of `BG`; `T = 𝔸¹ ⊔ 𝔸¹ → 𝔸¹` | `g^*x = [BG]`, `Δ^![BG × BG] = [BG]`, both sides `(1/\|G\|)·[Spec k]`; `deg(BG/BG × BG) = \|G\|²/\|G\| = \|G\|`; `ℚ²` in dimension `1`, `0` in dimension `0` | holds; the weighted product breaks the formula | none |
| 5.2 base change (repair, headline) | `[𝔸¹/μ₂] → 𝔸¹`, `M′ = {0}`; `BG`, `M′ = Spec K`; `M′ = ⊔_ℕ Spec k` | `[Spec k[x]/(x²)/μ₂]`, cycle `2·[Bμ₂]`, pushed to `2·(1/2) = 1`; diagonal of `ℳ ×_M M′` a base change of `Δ_{ℳ/M}` then of `Δ_{M′}`, both representable by schemes, quasi-compact, separated; not quasi-compact | holds for `M′` quasi-separated of finite type | none |
| 5.3 products on quotients (sampled, headline) | `G = 1`; `μ_n` on a point; `𝔾_m` on `𝔸² ∖ 0`, weights `(1, 2)` | identity; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; `ℤ[t]/(2t²)`, `t ↦ [Bμ₂]`, `∫t = 1/2`, `∫2t = 1` | holds | none |
| 5.4 degree of a point (sampled, headline) | `[Spec ℂ/(ℤ/4)]` over `ℝ`; `[ℙ¹/μ₂]`, `t²/(t² − 1)`; `Bμ₃` over `ℚ` | `2/4 = 1/2 = [ℝ : ℝ]/2`; orders `2, −1, 0`, `2·(1/2) = 1 = ∫[𝒪]`; `1/3`, inertia degrees `1 + 2 = 3` | holds | none |
| 6.1 comparison bundle | `E = [O(−4) → Ω]` on `ℙ¹` | `Ext¹(Ω, O(−4)) = H¹(O(−2)) = k`; nonsplit extension of `O(4)` by `O(2)` is `O(3)²`; rank `1 + 1` | holds | none |
| 6.2 virtual class (sampled, headline) | `[O(1) → Ω]` on `ℙ¹`; the theory of 6.1; `𝓛_n` on `L`; `d + r < 0` | `c_1(O(−1))`, degree `−1`; `c_1(O(3)²/O(2)) = 4 = c_1(O(4))`; `n·[0₂] = −n·[0₁]` since `[0₁] + [0₂] = div(t)`; `0` | holds | none |
| 6.3 relative formulas (sampled, headline) | `Spec k[ε]/(ε²)` over itself; node `× ℙ¹`; `k[x]/(x^p)` with `E = L_X`; `pt ⊔ 𝔸¹` | `2·[pt]`; `−[𝔜 × pt]`; `Ob = A` of rank `1`, `dim X − d − r = 0`, class `p·[pt] ≠ c_1(Ob) ∩ [X] = 0`; `[pt] + 0`, against `0` from the single exponent `1` | holds; smoothness and the rank of `Ob` needed | none |
| 6.1 API, pullback (R01) | `X′ = ⊔_ℕ Spec k → X = Spec k` | not a stack of Convention 1 | wording | R01 |
| 7.2 characterisation (headline) | characteristic `2`, `k[x]/(x²)`, `φ = (0, id)` | a chain map because `2x = 0`; `φ^*ω(g) = 0`; `(x + ax²)² = x² ≠ 0` in `k[x]/(x³)` | condition 3 fails where 1 fails | none |
| 8.1 non-reduced ambient | `𝔸¹ × Spec k[ε]/(ε²)`, origin | `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`; `∂β = 2·[ν = 0] − 2·[T = 0]`, `β = 2·(ν/T)` | multiplicities kept | none |
| 8.2 regular pullback (sampled, headline) | node with `V(a + b)`; `𝔸¹ × Spec k[ε]/(ε²)`, `t = 0`; `{0} → 𝔸¹`, `X = 𝔸¹ × Z` | `−2·[pt × pt]` both ways; `2·[pt]` both ways; `[Z]` | holds | none |
| 8.3 functoriality (sampled, headline) | `𝔸¹ × Z → Z`, `X = Z = 𝔜 = Spec k`; `Z′ = pt ⊔ ⊔_ℕ pt`; the graph of `v` | `dim B T_{𝔸¹} = 0` over `𝔸¹`, relative dimension `−1`; `[pt]` for every finite `Z′_0`; a base change of the finite unramified `Δ_{Z/𝔜}`, so a regular local immersion of codimension `dim(Z/𝔜)`, with fibre product `Z′_0 ×_Z X = X′` | holds | none |
| 8.4 deformation invariance (repair, headline) | `y² = x^p − a` over `𝔽_p(a)`, `X = B`, `E = 0`; `B = L`, `Z(x² − t·y²)`; `B = 𝔸¹ ⊔ 𝔸¹`; `{xb = 1}` | `x^p − a` of odd degree, not a square, so `B` integral; `m_{b₀} = (y)`; `∂_x = 0`, `∂_y = 2y`, zero only at `b₀`; count `1` everywhere, `k`-degree `p` at `b₀`; `2, 2, 2`; `1` and `0`; `1` and `0` | holds for regular `B`; connectedness and properness needed | none |
| 8.4, pure dimension of `𝔐 × B` | fibres `B_K` of `𝔐 × B → 𝔐` | of pure dimension `1` for every field `K/k`, reduced or not | `m + 1` without smoothness | none |
| 8.4, regularity used | node `xy = 0` | `dim m/m² = 2`: the point is no regular immersion of codimension `1` | outside the route | none |
| 9.1 relative spaces of maps | `X = Spec k`; `M = Spec k`, `F = id_{ℙ¹}`; `M′ = ⊔_ℕ Spec k` | condition is formal étaleness of `M → 𝔅`; `H⁰(T_{ℙ¹}) = k³` against `0`; not a stack of Convention 1 | holds; API wording | R01 |
| 9.2 base change (R01) | `M′ = Spec k[x_1, x_2, …] → M = Spec k` | not locally Noetherian and not of finite type: outside StableReduction Layer 2 and Convention 1 | wording | R01 |
| 9.3 obstruction theory (sampled, headline) | `ℙ¹ → ℙ^r`, degree `d`; elliptic `C = X`; `X = M = L`, `F = pr₂` | `H¹ = 0`, `χ = (r + 1)(d + 1) − 1`; `rk E = 0`, `Ob` trivial of rank `1`, class `0` on the `1`-dimensional `M`; both torsors under `H⁰(T, g^*T_L ⊗ J)`, `H¹(ℙ¹_T, pr₂^*(…)) = 0`, `E = Ω_L`, class `[L]` | holds | none |
| 9.4 resolution (sampled, headline) | `V = O`, genus `g`; `L = O`; embedded point | `π_*G = π_*H = 0`, `0 → π_*V → R¹π_*H → R¹π_*G → R¹π_*V → 0`, `χ = 1 − g`; `G = O`, `H = 0`, `H⁰` missed; `H⁰(O(−N) ⊕ k_p) = k` | holds; ampleness and reducedness used | none |
| 9.5 rank and dimension (sampled, headline) | lines in `ℙ²`; prestable curves; `ℙ¹ × 𝔸¹`; `ℙ¹` with a doubled point | `3·1 + 2 + 0 − 3 = 2`; `3g − 3 + n + δ + dim X·(1 − g) = (1 − g)(dim X − 3) + n + δ`, the formula of AlgebraicGromovWittenTheory §4.3 and of li-tian1998 line 1586; `δ = 2`, `ℓ = 2`, `4 = dim(PGL₂ × 𝔸¹)`, `A_0 = 0`; `δ = 2`, `3 = h⁰(O(2))` | holds | none |
| 1.1 passage of proper covers (R01) | `𝒩 = ⊔_ℕ Spec k → Spec k`; `𝒩 = Spec K` | `⊔_ℕ Spec k` not of finite type; `Spec K` a proper cover | wording | R01 |

## Verified sound

- **Shape.** 9 layers, 33 numbered sections, each with a *Needs:* line and at least 3 Checks (counted by
  script: minimum 3); every layer ends with Examples and Dependencies. A search found no LaTeX
  delimiters, no `lemma`, no process words, no pull-request numbers, no machine paths and no
  `set_option`. Proposed names are in italics; every backticked Lean name is a library or supplier
  declaration.
- **Headline statements** (Summary): 2.2–2.3, 4.1–4.3, 5.1–5.4, 6.2, 7.1–7.2, 8.1–8.4, 9.3–9.5. Each is a
  named target with a locator. None is statable at the pins: neither pinned tree contains
  `IsAlgebraicStack` or `IsDeligneMumford` (searched).
- **Sampled locators, read at the text** (the author flagged none as unverified). All 15 sampled
  sections carry the item number, the hypotheses and the statement the README gives:
  - vistoli1989 lines 365–376, 420–452, 506–507, 539–584, 887–1074, 1081–1207, 1451–1464, 1594–1623,
    1665–1776, 2064–2066, 2109–2112;
  - behrend-fantechi1997 lines 1040–1044, 1261–1262, 1282–1298, 1353–1363, 1389–1398, 1412–1421,
    1456–1460, 1583–1614, 1645–1739;
  - behrend1997 lines 129–197; li-tian1998 lines 1472–1474, 1501–1503, 1565–1566, 1585–1586;
  - edidin-graham1998 lines 1042–1045, 1069–1076; keel-mori1997 lines 28–29;
  - kresch1999b lines 182–207, 232–243, 250–256, 300–315, 319–343, 400–405;
  - stacks-chow-spaces lines 57–61, 126–133, 151–153, 312–316, 484–487, 516–517, 667–669, 797–800,
    813–819, 1103–1106, 1368–1378, 1477–1479, 1766–1768, 1907–1911, 1932–1939, 1986–2007, 2224–2226.
- **Pinned declarations opened** (Mathlib and Tau Ceti at the pins of `lake-manifest.json`):
  - `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`: `AlgebraicCycle` (44), `map` (69,
    `[QuasiCompact f]`); `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`: `ord` (52; `0` off coheight
    one, line 62, and for the zero function, line 65).
  - `TauCeti/AlgebraicGeometry/Chow/Basic.lean`: `cyclesOfDimension` (86), `RatEquiv` (257), `ChowGroup`
    (section at 290), `cycleClass` (304), `equivIntOfUnique` (369); `Chow/ClosedImmersion.lean`:
    `ChowGroup.pushforward` (211).
  - `TauCeti/AlgebraicGeometry/Stack/Basic.lean`: `SchPseudofunctor` (37);
    `AlgebraicSpace/Basic.lean`: `Spaces.IsAlgebraicSpace` (195); `Curves/Prestable.lean`:
    `PrestableFamily` (45; syntomic of relative dimension one at 55; base change at 104–109);
    `VectorBundle/Degree.lean`: `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (82).
- **Cross-roadmap citations resolved.**
  - VirtualFundamentalClass at its open head: headings §§0.1–9.6 exist under the cited numbers; its
    Scope, Conventions and §§0.2–0.3, 1.5, 1.6, 2.1–2.5, 7.6, 7.7, 9.1–9.6 were read and say what the
    contract quotes (§1.5: representable closed immersions; §2.1: separated, rational; §2.5: Kresch's
    restricted action and the plane example; §9.2: separated with the resolution property; §9.4: smooth
    bases; §9.5: the hypotheses of Proposition 7.5).
  - SchemeAndStackFoundations on main: the 23 cited sections exist under the cited numbers, and 27
    declaration names the README quotes were searched and each occurs in its README (among them
    `chow_affine_bundle`, `excess_intersection`, `gysin_self_intersection`, `upperShriek_proper`,
    `upperShriek_lci`, `keel_mori`, `quasiCoherent_topology_comparison`); the `z ↦ z²` Check of §5.5 was
    read.
  - StableReductionPartII at its open head: §5.15 states the Edidin–Graham comparison
    `A_{i−d}([X/G])_ℚ → A^G_i(X) ⊗ ℚ` under the hypotheses the contract quotes, compatible with Chern
    classes and proper pushforward, and no product statement.
  - AlgebraicGromovWittenTheory at its open head: §§4.1–4.3 exist; §4.3's dimension is
    `(1 − g)(d − 3) + n + c₁(T_X)·β`.
  - EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra:
    folders on main; their cited headings were resolved by the citation resolver, which lists none
    as missing.
- **Gaps.** Both `needs` sentences name one construction with its properties and hypotheses, under the
  same slugs in the plan and in the README's supplier contracts. VirtualFundamentalClass §1.5 at its
  head forms cones of representable closed immersions only, and its §2.1 uses integral closed
  substacks without stating their theory; neither gap asks for what a supplier, Mathlib or Tau Ceti
  already states.
- **Duplication and ownership.** Fixed-string searches of main and the open heads:
  "VirtualFundamentalClassPartII" (no match), "integral Chow groups of" (no match), "non-separated
  Deligne" (no match), "generic stabiliser" (one unrelated use), "Edidin–Graham comparison"
  (StableReductionPartII §5.15 only). No other roadmap states a target of this one. The overlap tool
  lists no dropped id, no revision-only id, no conflicting head and no second copy; the roadmap is not
  on main. Layer 9 against AlgebraicGromovWittenTheory §4.1 is settled by the maintainer's ownership
  note.
- **Organisation.** Layer titles are mathematical and the README nowhere says it follows a source.
  The order 1 → 2 → 3 → 4 → 5 → 6 is forced (2.2 needs 1.2; 3.1 needs 2.2; 4.1 needs 1.1, 1.3, 3.1–3.4;
  5.1 needs 4.1–4.3; 6.2 needs 4.3–4.4), as are 8 after 6 (8.2 needs 6.2) and 9 after 7 (9.1 needs
  7.1).
- **Manifest.** 14 sources, one key each, every key cited in the README; 12 certified from open
  repositories, 2 settled as uncertified; no local path. No source was fetched this round and no
  `needs-references.toml` was written.
- **Copyright.** Wording compared at 17 passages with 7 sources: 2.2, 3.5, 4.1, 5.1, 5.2 with
  vistoli1989; 3.3, 3.5 with stacks-chow-spaces; 5.3 with edidin-graham1998; 6.2, 6.3, 8.2, 8.3, 9.3
  with behrend-fantechi1997; 9.4, 9.5 with behrend1997; 8.4, 9.5 with li-tian1998; 8.1 with
  kresch1999b. The longest shared runs are 4 words, in standard phrases ("passes to rational
  equivalence", vistoli1989 line 1106). Arrangement: vistoli1989's sections are 1 (stacks), 2 (moduli
  spaces), 3 (intersection theory), 4 (the basic lemma), 5 (bivariant theory), 6 (moduli spaces of
  smooth stacks); its section 3 is split over Layers 2, 3 and 4 by integrality, its section 2 feeds
  Layer 5 after its sections 3 and 5, and its section 4 is no layer. No table, figure, list of
  examples or numerical data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction; normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory and Hom schemes: SchemeAndStackFoundations; nothing else shared.

Source independence: 17 passages compared with 7 sources, none shared beyond standard phrases of at most 4 words; largest share vistoli1989, 74 of 164 occurrences of source keys in the README; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§§1.8, 1.10, Chapter 3, Corollary 6.3, Propositions 8.1.1, 10.2):
  uncertified, cited by locator only.
- The journal numbering of kresch1999b, behrend1997, li-tian1998, keel-mori1997 and rydh2015: each is
  cited in the arXiv version the manifest names.
- vistoli1989 is read from an OCR text; the displays of (1.15) (line 370), (2.1) (line 543) and of the
  covering formula (lines 1607–1609) are garbled and were matched by content.
- The global gluing in 8.1–8.3 was checked on charts and on the instances of the table, not as a
  proof.
- Locators of the sections outside this round's sample (1.1–1.3, 2.1, 3.1, 3.2, 3.4, 4.2, 4.3, 6.1,
  7.1, 7.2, 8.1, 9.1, 9.2) were not all reread; those at the lines listed above were.
- The headings of EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and
  DerivedModuleAlgebra were resolved by the tool and not reread this round.
- Elaboration: not available in this lane, and a design has no Lean file.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, as used in the proof of Lemma 5.9 (lines 1416–1417): the source says the rational equivalence is invariant under the whole tangent bundle of the ambient; it should be invariant under the tangent bundle of the regularly embedded stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in vistoli1989 at (3.6), line 985, and at the end of (3.7), line 997: the source says the non-representable case is a second item (ii) using the formula of (i); it should be item (iii) using the formula of (ii), unless the slip is the scan's; affects nothing.
- **Misprint** in vistoli1989 at the paragraph before Lemma 5.3, line 1613: the source says multiplicativity of the degree is Lemma 1.15; it should be Lemma 1.16, unless the slip is the scan's; affects nothing.
- **Misprint** in vistoli1989 at the proof of Proposition 6.1, line 1768: the source says integrality of the reduced fibre product follows from Lemma 2.5; it should be Lemma 2.3 (2.5 is a corollary on degrees), unless the slip is the scan's; affects nothing.
- **Misprint** in vistoli1989 at Theorem 3.11, line 1101: the source says a regular embedding; it should be a regular local embedding, as in the definition before it and in Theorem 3.12, unless the slip is the scan's; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bfade431cc7f5649dab7dbb5f3f51c7f820e4d7b", "job": "REV-DESIGN-VirtualFundamentalClassPartII~16", "model": "fable", "worker": "chris-x80"} -->
