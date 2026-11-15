<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6899309588 -->
Review (claude) of c9ad966

Verdict: needs_changes

1. **F01** (P3) five *Needs:* lines name a whole layer where the plan lists fewer targets

   - **Location.** `design/README.md` 3.1 ("*Needs:* Layer 2; …"), 3.2 ("1.2–1.3, Layer 2; …"), 3.5
     ("Layer 2, 3.1–3.3; …"), 4.1 ("*Needs:* 1.1, 1.3, Layer 3."), 8.1 ("…; Layer 2; …").
   - **Claim.** A *Needs:* line lists what the statement and route use, item by item.
   - **Witness.** `plan.json` has `target:2.2` only for 3.1, 3.2, 3.5 and 8.1, and
     `target:3.1`–`target:3.4` for 4.1. "Layer 3" puts 4.1 behind 3.5, whose *Needs:* has
     gap:normal-cones-of-local-immersions; "Layer 2" puts integral operations behind 2.3, which needs
     VirtualFundamentalClass §2.1.
   - **Repair.** Write "2.2" for "Layer 2" in 3.1, 3.2, 3.5 and 8.1, and "3.1–3.4" for "Layer 3" in
     4.1; `plan.json` is unchanged. Tested on 4.1: its route (Lemma 3.8 on a proper cover, the
     exterior-product bullet) uses 1.1, 1.3, 3.1–3.4 and no normal cone, so the line is then true and
     agrees with the plan. (4.4's "Layer 3" equals the plan's 3.1–3.5 and stays.)

2. **F02** (P3) 9.2 uses the setting of 9.1, which neither its *Needs:* line nor the plan lists

   - **Location.** `design/README.md` 9.2, lines 1783 and 1801 ("In the setting of 9.1, …"; "the
     charts being chosen fine enough that `𝒞_U` is a scheme (9.1)"), *Needs:* at lines 1806–1807;
     `design/plan.json`, target 9.2, `prerequisites`.
   - **Claim.** 9.2's statement and route need 9.1's family `𝒞 → 𝔅` (prestable étale locally on the
     base).
   - **Witness.** The *Needs:* line has no "9.1", no `PrestableFamily` and no StableReduction Layer 3;
     the plan's 9.2 has no `target:` entry at all, while the layer's Dependencies read
     "9.1 → 9.2 → 9.3 → 9.4 → 9.5".
   - **Repair.** Begin 9.2's *Needs:* with "9.1 (the family, prestable étale locally on the base);"
     and add `"target:9.1"` to the plan's 9.2 prerequisites. Tested: the duality statements of 9.2
     are for `π : 𝒞_M → M`, defined in 9.1, and the chart argument uses 9.1's étale-local form; with
     the entry, README, plan and Dependencies agree.

3. **F03** (P3) the defining bijection of 9.1 is called "restriction"

   - **Location.** `design/README.md` 9.1, lines 1759–1760: "restriction is a bijection from the
     extensions of `g` to `T̄` onto the extensions of `F ∘ 𝒞_g : 𝒞_T → X` to `𝒞_{T̄}`".
   - **Claim.** A defining property names its map.
   - **Witness.** No restriction goes from extensions `ḡ : T̄ → M` to morphisms `𝒞_{T̄} → X`; the map
     meant is `ḡ ↦ F ∘ 𝒞_ḡ`, with `𝒞_ḡ : 𝒞_{T̄} → 𝒞_M` the base change of `ḡ` (it uses the 2-isomorphism
     of 7.1).
   - **Repair.** Write "the map `ḡ ↦ F ∘ 𝒞_ḡ`, with `𝒞_ḡ : 𝒞_{T̄} → 𝒞_M` the base change of `ḡ`, is a
     bijection from the extensions of `g` to `T̄` onto the extensions of `F ∘ 𝒞_g` to `𝒞_{T̄}`". Tested
     on the third Check: for `M = Spec k`, `F = id_{ℙ¹}`, `T̄ = Spec k[ε]/(ε²)`, the source has one
     element and the target `H⁰(ℙ¹, T_{ℙ¹}) ≅ k³`, so the map is not surjective, as the Check says.

Three findings, all P3 (R01–R03); no P1 or P2. Each carries a repair, so the verdict asks for
changes: a fix round applies the three repairs before the design is accepted. The two declared
supplier gaps, `gap:closed-substacks-of-stacks` (VirtualFundamentalClass §2.1) and
`gap:normal-cones-of-local-immersions` (VirtualFundamentalClass §1.5), are precise, minimal and
declared in both files; they are contracts, not findings.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md` (read in full, 1968 lines),
`packages/VirtualFundamentalClassPartII/design/plan.json` (33 targets, 2 gaps),
`packages/VirtualFundamentalClassPartII/sources.toml` (14 entries). This is a design: there is no
`Suggested.lean`. This lane does not elaborate, so no elaboration, no `#check` comparison and no
one-tactic padding probe were run; none applies at this stage.

## Round-9 findings

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3) | repaired | 1.3 API, lines 557–559: "`e(𝒱)` is the sum of the degrees `deg(ℐ/𝒱)` over the irreducible components `ℐ` of `(I_𝒱)_red` that dominate `𝒱`"; 1.3 Checks, lines 585–591: "The inertia formula counts degrees, not components. …". 1.2 now has 4 Checks and none uses `deg`; `plan.json` has `genericStabiliserOrder.eq_sum_deg_inertia` and `inertia_sumOfDegrees` under target 1.3 (lines 159, 196). The 1.1 Check now reads "finite étale of degree `2`, the rank of `Q → 𝔸¹`" (lines 489–490), with the formula `(2/1) · 1 = 2` in 1.3 (lines 581–584). |
| F02 (P3) | repaired | 9.2, lines 1795–1798: "(behrend-fantechi1997 lines 1592–1597, for a product family `C × M → M` with `C` a projective curve with a dualising complex, which for Gorenstein `C` is the complex written `ω_C[1]` here; the statements for flat proper Gorenstein families of curves are those of SchemeAndStackFoundations §§2.19–2.20)". Read: behrend-fantechi1997 lines 1592–1597 (dualising complex of `C`, `π^! = π^* ⊗ ω_C`, adjunction, duality). `plan.json` line 1708 has the same locator. |

The repaired pattern in the rest of the design: reading every section in order, I found no other
API bullet or Check that computes with a later section (the remaining forward references name
consumers only). All 33 sections now carry a source key (script). A script comparing every
*Needs:* line with the plan's prerequisites gave R01 and R02.

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

No UPWARD or CYCLE line. Suppliers: VirtualFundamentalClass (open, adds a new folder),
StableReductionPartII (merge order; open, adds a new folder; §5.15 only),
SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves,
DerivedModuleAlgebra (main). StableReductionPartII consumes VirtualFundamentalClass §§2.1–2.3 and
nothing of this roadmap, so the chain VirtualFundamentalClass → StableReductionPartII → this
roadmap has no cycle. AlgebraicGromovWittenTheory is a consumer only. No roadmap of the never-cite
list is cited.

## Maintainer notes

None stands as a finding.

1. Words: holds as satisfied. Convention 2 uses "local immersion" for the class and "local
   embedding" for the chart pair and gives Vistoli's words once; the five occurrences of "local
   embedding" (lines 159, 160, 336, 1582, 1589) are Vistoli's attributed words or chart pairs.
2. Cotangent complex: satisfied. Convention 6 says no truncated complex is defined; 9.3 builds `φ`
   into the full `L_{M/𝔅}` from the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the restricted and the relative invariance with the plane example. The
   sub-claim "the owner's text names no acting group" is refuted: VirtualFundamentalClass §2.5 at
   its open head reads "invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch,
   Theorem 3.1".
5. Functoriality: 8.3's second case goes through the graph and says no compatibility datum over the
   graph is used; the conic instance is in the table.
6. Suppliers: satisfied. AlgebraicVectorBundles and EllipticCohomology have 0 occurrences; the
   seven suppliers are cited by section.

## Adversarial table

Rows: the passages the round-10 repair changed, the 15 sampled targets, the headline statements
and the targets the findings touch. Every value was computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 API (repair) `e(𝒱) = Σ deg(ℐ/𝒱)` | `B(ℤ/2)`; `BS₃`; `Bμ₃` over `ℚ`; `[𝔸¹/μ₂]` | `1 + 1 = 2`; `[S₃ : Z(c)] = 1 + 3 + 2 = 6`; `1 + (3/3)·[ℚ(ζ₃) : ℚ] = 3`, two components; only the identity component dominates, `1` | holds; uses only 1.2 and 1.3 | none |
| 1.3 Check (repair) `L → B_{𝔸¹}G` | `e(L) = 1`, `e(B_{𝔸¹}G) = 2`, both function fields `k(t)` | `(2/1)·1 = 2`, the rank of `Q → 𝔸¹`; without the ratio, `1` | holds | none |
| 9.2 (repair) Serre duality | smooth genus-`g` curve, `V = O`; `V = ω_C` | `(RΓ(O))^∨`: `k^g` in degree `−1`, `k` in degree `0`; `RΓ(ω)[1]`: `H⁰(ω) = k^g` in degree `−1`, `H¹(ω) = k` in degree `0`; `χ(ω) = g − 1` | holds | none |
| 1.1 finite cover | rydh2015 lines 81–85 against Convention 1 | hypotheses quasi-compact, Deligne–Mumford, diagonal quasi-compact and separated: all in Convention 1; conclusion finite, finitely presented, surjective, étale over a dense open | holds | none |
| 1.1 no separated cover of `L` | discrete valuation ring into a dominating component, closed point over `0₁` | second extension through the other chart ends at `0₂`; universal closedness lifts it, separatedness of `Z` forces the lifts equal; images `0₁ ≠ 0₂` | contradiction, as stated | none |
| 1.1 no separated cover of `B_{𝔸¹}G` | torsor `P → X` | `P → X` proper (as `P → 𝔸¹` is proper and `X → 𝔸¹` separated) and étale, so finite étale; degree `2` over `t ≠ 0`, `1` over `0`; a dominating component has closed image containing the generic point, so meets both | contradiction, as stated | none |
| 1.1 API, two proper coverings | component `Y″` of `Y ×_ℳ Y′` dominating `Y` | `dim Y″ = dim ℳ = dim Y′`, image in `Y′` closed, irreducible, of that dimension | surjects onto both | none |
| 2.1 multiplicity and descent | `[V(x²)/μ₂]`; `⊔_ℕ Spec k → Spec k`; one-point scheme | length of `k[x]/(x²)` is `2`; infinite sum, excluded by finite type; `height = 0`, `cyclesOfDimension X 0` | holds | none |
| 2.2 `A_0([𝔸¹/μ₂])` | `P(y)` irreducible `≠ y`, also `y^p − a` with `p` odd | `k[x]/P(x²) = K[x]/(x² − θ)`, `θ ≠ 0`, separable over `K` when `char ≠ 2`, so reduced: `div(P) = [W]`; `div(y) = 2·[Bμ₂]`; group `ℤ/2` | holds | none |
| 2.3 schemes, spaces, rationalisation | `L`; `Spec k`; `[𝔸¹/μ₂]`; stacks-chow-spaces Situation 2.1 | `ℤ²/ℤ·(1, 1) ≅ ℤ`; `ℤ`; `ℤ/2 ⊗ ℚ = 0`; `B = Spec k` is quasi-separated, Noetherian, universally catenary, and "good" is quasi-separated and locally of finite type | holds | none |
| 3.1 étale pullback not injective integrally | isogeny `π : E′ → E` of degree `2`, `P` in the kernel of `π̂` | sum of `π^{−1}P` is `2Q + T`, of `ker π` is `T`; `2Q = π̂(π(Q)) = π̂(P) = O`; degree `0` and sum `O`, so principal | holds | none |
| 3.2 divisor formula | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; `Spec k → BG`; Lagrange | `f_*[0] = \|G\|·[0 × BG]`, `div(N(t)) = [0 × BG]`, factor `e(𝔸¹ × BG)/e(𝔸¹) = \|G\|`; `π_*π^* = \|G\|`; `e(𝒱)` divides `e(f(𝒱))` for representable `f` | holds | none |
| 3.2 no integral pushforward to the point | `Spec k → BG → Spec k` | `\|G\|·c([BG]) = 1` has no integer solution for `\|G\| > 1` | holds | none |
| 3.4 | `K ⊗_k K`, `K` separable of degree `2`; purely inseparable of degree `p` | two points, `4 = 2 + 2`; `K[x]/(x − α)^p` of length `p`, `p² = p·p` | holds | none |
| 4.1 | `BG → Spec k`; `[𝔸¹/μ₂] → 𝔸¹`; `L × B(ℤ/2) → L` | `1/\|G\|`, composite `\|G\|·(1/\|G\|) = 1`; `2·(1/2)·[0] = div(y)`; `(1/2)·[0₁]`, `ℚ ≅ ℚ` | holds | none |
| 4.1 route (R01) | Lemma 3.8 (ii) for non-representable `f` | proper cover `g : X → ℱ`, `f ∘ g` proper and representable; uses 1.1, 3.2, 3.3, and 3.4 for the product bullet; no cone | 3.5 not used | R01 |
| 4.2 definition | `π : Spec k → BG`, `Y = Spec k`; `f = id`; `𝔸¹_ℂ` glued along conjugation over `𝔸¹_ℝ` | `\|G\|^{−1}·\|G\|·[Spec k]`; identity; residue field `ℂ` at the origin while invariant functions take real values there | holds | none |
| 4.3 | trivial line on `BG`; `O(−1)` on `ℙ¹`; `L ⊕ L^∨`; `π_*G` in the surjectivity route | `s^![𝔸¹ × BG] = [BG]`; `−[pt]` in dimension `0`; `c_1 = 0`, `c_2 = −c_1(L)²`; push–pull `π^*p_* = p_{E*}π_X^*` with `π_X^*` onto | holds | none |
| 4.4 | `B(ℤ/2)`; `O(1)` on `ℙ¹`; `Spec k` | `1/2` in both theories; a point class in both; `ℚ` in both | holds | none |
| 5.1 projection formula (headline) | `BG → Spec k`, `x = [Spec k]`, `y = [BG]` | `g^*x = [BG]`, `Δ^![BG × BG] = [BG]`, both sides `(1/\|G\|)·[Spec k]`; weighting by `deg(BG/BG × BG) = \|G\|²/\|G\|` gives `[Spec k]` on the left | holds | none |
| 5.1 duality | `T = 𝔸¹ ⊔ 𝔸¹ → 𝔸¹`; `T = L` | `ℚ²` in dimension `1`, `0` in dimension `0`; pullback of `id` is `L`, not separated | holds; hypothesis needed | none |
| 5.2 (headline) | `[𝔸¹/μ₂]`; `ℤ/p` on `𝔸²`; proof of vistoli1989 (6.1) | `0 = 0` rationally, `ℤ/2 → 0` integrally; `[k(y) : k(y^p)]/p = 1`, not `1/p`; the proof uses only the bijection on cycles and Lemma 3.8, both valid for an algebraic space `M` | holds | none |
| 5.3 (headline) | `ℙ(1, 2)`; `Bμ_n`; `G` trivial | `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; identity | holds | none |
| 5.4 (headline) | `BG`; `Spec k(a^{1/p})`; `[Spec ℂ/(ℤ/4)]` over `ℝ`; `[ℙ¹/μ₂]`, `t²/(t² − 1)` | `1/\|G\|`; `p`; `[ℝ : ℝ]/2 = 2/4`; orders `2, −1, 0`, `2·(1/2) = 1 = ∫[𝒪]` | holds | none |
| 6.1 | `[0 → 0]` and `[O → O]`; `[O(−4) → Ω]` on `ℙ¹` | rank `1 = 0 + 1 = 1 + 0`; `Hom(E, E) = k ⊕ k ⊕ H¹(O(−2))`, `H⁰(O(−2)) = 0`; nonsplit extension of `O(4)` by `O(2)` is `O(3)²` | holds | none |
| 6.2 (headline) | `[O(1) → Ω]` on `ℙ¹`; theory of 6.1 through `F_1` and through `P`; `𝓛_n` on `L` | `−1`, dual convention `+1`; `4` and `c_1(O(3)²/O(2)) = 6 − 2 = 4`; `n·[0₂]`, opposite gluing `n·[0₁] = −n·[0₂]` | holds | none |
| 6.3 | `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; node `× ℙ¹`; general rank | `rk Ob = 1`, `dim X − d − r = 0`, class `p·[pt] ≠ 0`; `[pt]`, single exponent gives `0`; `−[𝔜 × pt]`; `rk H^{−1}(E) = rk Ω − r = dim X − d − r` | holds | none |
| 7.1 | `Spec k → B𝔾_m`; `k[x]/(x²)`, `x ↦ ε` | torsor under `1 + J ≅ J`, with `L_X` the group would be `0`; `(ε + aε²)² = ε² ≠ 0` | holds | none |
| 7.2 (headline) | characteristic `2`, `φ = (0, id)`, `T̄ = Spec k[x]/(x³)` | `Hom(A[1] ⊕ A, J[1]) = J ⊕ 0`, `φ^*ω(g)` has component `0`, yet `(x + ax²)² = x² ≠ 0` | condition 3 fails, as stated | none |
| 8.1 (headline) | plane; `𝔸¹ × Spec k[ε]/(ε²)` | `ν/η` fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `C = Spec k[T, E]/(E²)`, `∂β = 2[ν = 0] − 2[T = 0]` | holds | none |
| 8.2 | node with `V(a + b)`; `𝔸¹ × Spec k[ε]/(ε²)`; diagonal of `X′` | `k[a, b]/(ab, a + b) = k[a]/(a²)`, `−2·[pt × pt]` both ways; `2·[pt]` both ways; the diagonal of `u` is an open immersion, so `X′` is a stack of Convention 1 | holds | none |
| 8.3 (note 5) | `ℙ²`, conic, line; `Z′ = pt ⊔ ⊔_ℕ pt` | graph meets `ℙ¹ × line` in `2` points, conic · line `= 2`; `[pt]` for every choice of `Z′_0` | holds | none |
| 8.4 (headline) | `x² − b y²`; `{xb = 1}`; `ℙ¹ × B`; `η_b^!` against `i_b^!` | counts `2, 2, 2`; `1` and `0`; `m + r = 1`; `𝔐 × B → B` flat, so 4.2's flat bullet applies with `𝒢_1 = 𝔐 × B` | holds | none |
| 9.1 (R03) | `X = Spec k`; `ℙ¹ → ℙ^r`; `M = pt`, `F = id_{ℙ¹}` | target of `ḡ ↦ F ∘ 𝒞_ḡ` is a point, so formally étale; open in `ℙ^{(r+1)(d+1)−1}`; one element against `k³` | discriminates; the map is not a restriction | R03 |
| 9.2 (R02) | `C × M`; nodal fibre | `RΓ(C, V) ⊗ O_M`; degree `2g(Ẽ) − 2 + #branches` | holds; uses 9.1's family | R02 |
| 9.3 (headline) | `ℙ¹ → ℙ^r`; elliptic `C = X` | `χ = (r + 1)(d + 1) − 1`, `H¹ = 0`; `Ob = H¹(O) ⊗ O_M`, `c_1 = 0` | holds | none |
| 9.4 | `0 → H → G → V → 0`; `L = O`; `O_{ℙ¹} ⊕ k_p` | `π_*G = π_*(V ⊗ L^N) ⊗ π_*L^{−N} = 0`, so `Rπ_*V = [R¹π_*H → R¹π_*G]`; `[0 → R¹π_*O]` misses `H⁰`; `H⁰(L^{−N}) = k` | holds; hypotheses needed | none |
| 9.5 | lines in `ℙ²`; `Spec k ⊔ ℙ¹`; general | `3 + 2 − 3 = 2`; `ℓ = 0`, rank `0`, not `1`; `3g − 3 + n + δ + d(1 − g) = (1 − g)(d − 3) + n + δ`, the number of li-tian1998 line 1586 | holds | none |

## Verified sound

- **Shape** (script): 9 layers, 33 numbered sections, 33 plan targets; every section has a
  *Needs:* line, a source key and at least 3 Checks (minimum 3, maximum 7); every plan target has
  at least 3 tests; every layer ends with Examples and Dependencies. No LaTeX delimiters, `lemma`
  keyword, process words, pull-request numbers, anchors, machine paths or `set_option` (search; the
  only matches of "lemma" are source citations). Proposed names are in italics; every backticked
  Lean name is a library or supplier declaration.
- **Headline statements** (Summary): integral groups and their three comparisons (2.2–2.3);
  rational pushforward, Gysin maps, homotopy invariance and Chern classes on all stacks (4.1–4.3);
  intersection ring and duality, the moduli-space isomorphism, the ring structure of the
  Edidin–Graham comparison, the degree of a point (5.1–5.4); the virtual class without the
  resolution property or separatedness (6.2); the relative obstruction class and characterisation
  (7.1–7.2); relative invariance, pullback, functoriality, deformation invariance (8.1–8.4); the
  obstruction theory of spaces of maps, its resolutions and dimension (9.3–9.5). Each is a named
  target with hypotheses and a locator. None is statable at the pins: the pinned libraries have no
  algebraic-stack or Deligne–Mumford predicate (search of both pins: no `IsAlgebraicStack`,
  `IsDeligneMumford`), no Chow groups of stacks and no cotangent complex of a stack.
- **Source locators read this round** (the author flagged none as unverified): vistoli1989 lines
  94–100, 296–330, 504–508, 540–586, 885–896, 950–972, 976–1012, 1025–1050, 1064–1076,
  1195–1203, 1568–1622, 1669–1686, 1703–1782; behrend-fantechi1997 lines 884–897, 1255–1264,
  1280–1322, 1351–1366, 1580–1616, 1643–1668, 1700–1712; kresch1999b lines 305–316, 330–344;
  behrend1997 lines 135–200; li-tian1998 lines 1583–1588; rydh2015 lines 78–90;
  deligne-mumford1969 lines 1008–1021; stacks-chow lines 1354–1360; stacks-chow-spaces lines
  55–62, 124–134, 149–158, 514–518, 795–819. Every locator of the 15 sampled sections carries the
  item number, hypotheses and statement the README gives.
- **Pinned declarations opened** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, the baseline of
  `plan.json`). Mathlib: `AlgebraicGeometry.AlgebraicCycle`
  (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` line 44) and `AlgebraicCycle.map` (line
  69, `[QuasiCompact f]`, weights); `AlgebraicGeometry.Scheme.ord`
  (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` line 52, under `[IsIntegral X]
  [IsLocallyNoetherian X]`, junk value `0` for `f = 0` or `coheight z ≠ 1`, line 48). Tau Ceti:
  `Chow.cyclesOfDimension` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean` line 86), `RatEquiv` (line
  257, locally finite families, line 128), `ChowGroup` (295), `cycleClass` (304),
  `ChowGroup.equivIntOfUnique` (369); `Chow/ClosedImmersion.lean` (pushforward along closed
  immersions); `SchPseudofunctor` (`Stack/Basic.lean` line 37); `Spaces.IsAlgebraicSpace`
  (`AlgebraicSpace/Basic.lean`, representable diagonal and étale atlas, no quasi-separatedness);
  `PrestableFamily` (`Curves/Prestable.lean` line 45, extends `IsProper` and
  `GeometricallyConnected`, `syntomic` at line 55, no genus);
  `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean`).
- **Cross-roadmap citations resolved.** VirtualFundamentalClass at its open head: the headings
  §§0.2–9.6 exist under the cited numbers; read its Scope, Conventions and §§1.5–1.6, 2.1–2.5, 3.2,
  3.5, 6.4–6.5, 7.3–7.4, 7.7, 9.1–9.6. §1.5 covers representable closed immersions only; §2.1 is
  for separated stacks and states no theory of closed substacks; §2.5 names the action
  `T_{Y′}|_{X′}` and the separated test stacks; §3.2 defines a global resolution as a derived
  isomorphism; §7.3 and §9.2 assume separatedness and the resolution property; §9.4 is over smooth
  bases; §9.5 is under the hypotheses of Proposition 7.5. SchemeAndStackFoundations on main: the 22
  cited headings exist and the 28 cited names occur in the cited sections (script); §5.5 "A regular
  immersion need not be closed"; §5.6 "no separatedness is assumed"; §1.9 Check on `𝔸¹/ℤ`.
  StableReductionPartII at its open head: §5.15 is headed "Chern class of the dualizing pairing"
  and states inside it the Edidin–Graham comparison with the contract's hypotheses (proper action
  of a smooth affine group, linearised ample sheaf, `[X/G]` Deligne–Mumford, Chern classes and
  proper pushforward) and no product statement, so 5.3 adds what it says it adds.
  EquivariantIntersectionTheory Conventions 1, 4, 5 and §§2.1–2.2, StableReduction Layers 2–3,
  EnhancedDerivedSheaves §0.3, E1.4, E1.8 and DerivedModuleAlgebra §§0.7, 0.12, 0.25 exist on main.
  AlgebraicGromovWittenTheory §§4.1–4.3 exist at its open head, over a field of characteristic
  zero.
- **Declared gaps.** Both have the same slug in `plan.json` and under the README's contracts, name
  VirtualFundamentalClass with a section, and ask for one theory each with its hypotheses. The
  plan's `neededBy` lists equal the sections whose *Needs:* lines carry the slug (1.1, 1.2, 2.1,
  3.2, 3.3, 5.2, 5.4; and 3.5, 4.2, 8.1, 8.3). Neither asks for what a supplier states. Not
  findings.
- **Duplication and ownership.** Against VirtualFundamentalClass at its head, by object: Layers
  2–4 remove separatedness or rational coefficients from §§2.1–2.4; 5.1–5.4 have no counterpart
  there (search for intersection product, moduli or coarse space, Edidin: none as a target); 6.2
  removes the resolution property and separatedness from §§7.3–7.4, 9.2; 6.3 and 8.2 replace the
  smooth bases of §9.4; 7.1–7.2 make §§3.5, 6.1, 6.3 relative; 8.1 extends §2.5's invariance; 8.3
  removes separatedness from §9.5; 9.3–9.5 state AlgebraicGromovWittenTheory §§4.1–4.3 for every
  base, target and field. No target restates an owner at equal generality.
  `scratch/overlaps.md`: no dropped id, no revision-only id, no conflicting head, no second copy;
  the roadmap is not on main. Ownership against the open pull requests was checked through
  `roadmaps show` for the three named above.
- **Organisation.** Layer titles are mathematical and the README nowhere says it follows a source.
  The order 1 → 2 → 3 → 4 → 5 → 6 is forced (2.2 needs 1.2; 3.1 needs 2.2; 4.1 needs 3.1–3.4; 5.1
  needs 4.1–4.3; 6.2 needs 4.3–4.4), as are 8 after 6 and 9 after 7; Layer 7 needs no Chow layer.
- **Manifest.** 14 sources, one key each, every key cited in the README; 12 certified from open
  repositories, 2 settled as uncertified; no local path. No source was fetched this round and no
  `needs-references.toml` was written.
- **Copyright.** Wording compared at 35 passages with 9 sources (the locators listed above). The
  longest shared runs are parts of statements that can be written one way (6 words in 1.1 beside
  rydh2015 line 84). Arrangement: vistoli1989 has sections 1 (stacks), 2 (moduli spaces), 3
  (intersection theory), 4 (proof of the basic lemma), 5 (bivariant theory), 6 (duality on moduli
  spaces), 7 (appendix); its section 3 is split over Layers 2, 3 and 4 by integrality, sections 2,
  5 and 6 feed one layer (5), section 4 is no layer. The second source, behrend-fantechi1997, has
  the virtual class (§5) after obstruction theories (§4) and spaces of morphisms (§6) before the
  relative case (§7); here the order is Layer 6 ↔ §5, Layer 7 ↔ §4, Layer 8 ↔ §7, Layer 9 ↔ §6.
  No table, figure, list of examples or numerical data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction (CrystallineCohomologyPartII is close in vocabulary only); normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory: SchemeAndStackFoundations; nothing else shared.

Source independence: 35 passages compared with 9 sources, none shared beyond parts of statements of at most 6 words; largest share vistoli1989, 72 of 145 occurrences of source keys in the README; contents compared with vistoli1989 and behrend-fantechi1997: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§§1.8, 1.10, Chapter 3, Corollary 6.3, Propositions 8.1.1, 10.2):
  uncertified, cited by locator only.
- The journal numbering of kresch1999b, behrend1997, li-tian1998, keel-mori1997 and rydh2015: each
  was read in the arXiv version the manifest names.
- vistoli1989 is read from an OCR text; displays and some labels are garbled (the label of
  (3.6)(iii) prints as "(ii)" at line 985) and were matched by content. Line 1613 refers to the
  multiplicativity of the degree as "Lemma 1.15", while the lemma is (1.16) at line 379; the scan
  text does not show whether this is the source's slip or the recognition's, so it is not listed
  under the source issues.
- The global gluing in 8.1–8.3 (descent of the rational equivalence over relative local embeddings,
  the comparison of 8.3's API on overlaps, the extension of kresch1999b Proposition 2.3 to
  non-reduced ambients by summing over components) was checked on charts, by rank and dimension and
  on the instances of the table, not as a proof.
- Locators of the 18 sections outside the sample were not reread this round, except those listed
  above (3.2's and 3.5's vistoli1989 lines, 5.2, 8.1's kresch1999b Theorem 3.1, 9.4); their
  statements and Checks were read and the Checks recomputed.
- Elaboration: not available in this lane, and a design has no Lean file.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–891: the source says the rational equivalence is invariant under the whole tangent bundle of the ambient; it should be invariant under the tangent bundle of the regularly embedded stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both resolutions may be taken to map to the theory by morphisms of complexes; it should justify this, since a derived isomorphism need not be one; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c9ad96670369ce9b2ce3e1f52f3117ef307c11da", "job": "REV-DESIGN-VirtualFundamentalClassPartII~10", "model": "fable", "worker": "chris-x80"} -->
