<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6902100903 -->
Review (claude) of ad039ea

Verdict: needs_changes

1. **F01** (P3) 8.4 assumes the base curve separated, and nothing uses it

   - **Location.** `design/README.md` 8.4, line 1771: "Let `B` be a smooth connected separated curve over
     `k`"; `design/plan.json` 8.4, `statement` and `hypotheses` ("B smooth connected separated curve over k").
   - **Claim.** Deformation invariance of the virtual count needs `B` separated.
   - **Witness.** `B = L`, the line with a doubled origin (coordinate `t`, `char k ≠ 2`), `𝔐 = Spec k`,
     `X = Z(x² − t·y²) ⊆ ℙ¹ × L`, `E = [O(−2)|_X → Ω_{ℙ¹×L/L}|_X]`, `m + r = 0`. Counts: `2` at `0₁`, `2` at
     `0₂`, `2` at `t ≠ 0`.
   - **Why it holds without the hypothesis.** Every step of 8.4's route is stated for stacks that need not
     be separated: a closed point of `L` is a regular closed immersion of codimension one; 8.2 has no
     separatedness; `A_1(L)_ℚ = ℚ·[L]` (2.3's Check gives `A_*(L)`); 4.1 pushes forward along the proper
     `X → L`; 4.2 gives `i_b^![L] = [{b}]` and its commutation with proper pushforward; the fibre `X_b` is
     proper over `κ(b)`, where 5.4's degree is defined. This is the pattern round 13 repaired in Layer 9
     (a hypothesis on the target that nothing used), found once more on the base of 8.4.
   - **Repair.** In 8.4 write "Let `B` be a smooth connected curve over `k`, separated or not"; delete
     "separated" from the plan's 8.4 `statement` and `hypotheses`. Add the witness as a Check of 8.4: over
     `B = L` the count of `Z(x² − t·y²)` is `2` at both origins and at every `t ≠ 0`. Tested on the witness:
     `(X → L)_*[X]^vir = 2·[L]`, `i_{0₁}^!(2·[L]) = 2·[0₁]` and `i_{0₂}^!(2·[L]) = 2·[0₂]`, of degree `2` each.
     Connectedness stays: for `B = 𝔸¹ ⊔ 𝔸¹` and `X` the first copy with `E = 0` the counts are `1` and `0`.

2. **F02** (P3) 9.5's curve class is stated for projective targets; the argument uses properness only

   - **Location.** `design/README.md` 9.5, lines 1985–1988: "For `X` projective of pure dimension, as in
     AlgebraicGromovWittenTheory §4.3, each `F_t : C_t → X_{κ(t)}` is proper with curve class"; 9.1, line
     1824 ("stated for projective `X`"); `design/plan.json` 9.5, `statement`.
   - **Claim.** `δ = c_1(T_X) · β` needs `X` projective.
   - **Witness.** Hironaka's smooth proper threefold `X`, not projective, and `F : ℙ¹ → X` a fibre `ℓ` of an
     exceptional divisor over a general point of a blown-up curve: `N_{ℓ/X} = O ⊕ O(−1)`,
     `F^*T_X = O(2) ⊕ O ⊕ O(−1)`, `δ = 1 = −K_X · ℓ = c_1(T_X) · [ℓ]`.
   - **Why it holds without the hypothesis.** `F_t` is proper as soon as `X` is separated; the degree on
     `A_0(X_{κ(t)})` is defined for `X` proper (SchemeAndStackFoundations §5.2: "for `X` proper over `k`,
     `deg : CH_0(X) → ℤ` is well defined and `deg f_* = deg`"); the projection formula is §5.3's
     `proper_pushforward`. No ample sheaf enters. The text was added by the round-13 repair.
   - **Repair.** Replace "For `X` projective of pure dimension, as in AlgebraicGromovWittenTheory §4.3," by
     "For `X` proper of pure dimension (projective in AlgebraicGromovWittenTheory §4.3),"; in 9.1 replace
     "stated for projective `X`" by "stated for proper `X`"; in the plan's 9.5 `statement` replace "for X
     projective" by "for X proper". Tested on the witness: `χ(F^*T_X) = 3 + 1 + 0 = 4 = 0 + 1 + 3·(1 − 0)`,
     the virtual dimension with `b = 0`, `δ = 1`, `ℓ = 3`, `g = 0`, and `deg(c_1(T_X) ∩ F_*[ℙ¹]) = 1`.

Two findings, both P3 (R01, R02); no P1 and no P2. Each carries a repair, and a repair, whatever
its priority, asks for changes: a fix round applies R01 and R02. Nothing else stands in the way.
The two declared supplier gaps, `gap:closed-substacks-of-stacks` (VirtualFundamentalClass §2.1) and
`gap:normal-cones-of-local-immersions` (VirtualFundamentalClass §1.5), are precise, minimal and
declared with the same slugs in `design/plan.json` and in the README; neither is a finding.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md` (2069 lines, read in full),
`packages/VirtualFundamentalClassPartII/design/plan.json` (9 layers, 33 targets, 2 gaps) and
`packages/VirtualFundamentalClassPartII/sources.toml` (14 entries). This is a design: there is no
`Suggested.lean`. This lane does not elaborate, so no elaboration, no `#check` comparison and no
one-tactic probe were run; none applies at this stage.

## Round-13 findings

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3), Layer 9 target assumed quasi-projective | repaired | 9.1, lines 1822–1824: "Let `X` be a scheme smooth over `k`, not necessarily separated, quasi-compact or quasi-projective"; Summary line 29: "to a smooth `k`-scheme, separated or not"; Scope lines 68 and 115; 9.3 line 1923; the witness is 9.3's last Check (lines 1944–1951); plan 9.1 `hypotheses`: "X a scheme smooth over k; no separatedness, quasi-compactness or quasi-projectivity". |
| F02 (P3), Layer 1 order line | repaired | Layer 1 Dependencies, lines 612–613: "Within the layer, 1.2 precedes 1.3, and 1.1 uses neither." |

The repair of F01 departed from the proposed wording in three places, each checked:

- The existence clause is "Where a stack of morphisms `Mor_𝔅(𝒞, X)` exists … for `X` smooth and
  projective over `k` and `𝔅` a stack of prestable curves it exists, is algebraic and is representable
  over `𝔅`". behrend1997 lines 129–138 say exactly this for a smooth projective target, and Proposition 4
  (lines 139–141) gives the open substack of stable maps.
- 9.1's second API bullet now takes `X` open in a projective `X̄` and `M` of finite type.
  SchemeAndStackFoundations §4.14 on main reads "`Hom_S(X, Y)` and `Isom_S(X, Y)` for projective `X`, `Y`
  flat over `S` are open subschemes of a Hilbert scheme of `X ×_S Y`". The complement of `Mor(C, X)` is
  the image of a closed set under a proper projection, so it is closed.
- 9.5's curve class: R02 above.

The repaired pattern of F01 was looked for in every layer: R01 is the one further instance. The
repaired pattern of F02 was looked for in the nine "Within the layer" lines against the plan's
`target:` prerequisites: all agree.

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 240 roadmaps, 2256 edges, 0 problem(s)

No UPWARD and no CYCLE line. Suppliers: VirtualFundamentalClass and StableReductionPartII (open pull
requests that add new folders; StableReductionPartII is in the merge order), and
SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and
DerivedModuleAlgebra (folders on main). AlgebraicGromovWittenTheory is a consumer only. No roadmap of
the never-cite list is cited. The citation resolver lists nothing unresolved.

## Maintainer notes

None stands as a finding.

1. Words: holds in the text. Convention 2 uses "local immersion" for the class and "local embedding"
   for the chart pair, and gives Vistoli's words once (vistoli1989 lines 499–505, read).
2. Cotangent complex: holds. Convention 6: "No truncated cotangent complex is defined"; 9.3 builds `φ`
   into `L_{M/𝔅}` from the projection formula and the trace. The truncation `τ^{≥−1}L_{T/T̄} = J[1]` of 7.1
   is the target of the obstruction class, not of an obstruction theory.
3. Integral and rational groups: holds, by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the restricted and the relative invariance with the plane example. The
   sub-claim "the owner's text names no acting group" is refuted: VirtualFundamentalClass §2.5 at its
   open head reads "prove invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch,
   Theorem 3.1".
5. Functoriality: 8.3's second case goes through the graph and states that no compatibility datum over
   the graph is used.
6. Suppliers: holds. AlgebraicVectorBundles and EllipticCohomology occur 0 times in the README and in
   the plan; the seven suppliers are cited by section.

## Adversarial table

Rows: the 15 sampled targets, the passages the round-13 repair changed, the sections round 13 left
without a row (1.2, 3.2, 3.3, 4.4, 9.2), and the targets of R01 and R02. Every value was computed this
round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 function field, `e` | `[𝔸¹/μ₂]`; `B_{𝔸¹}G`; `[Spec ℂ/(ℤ/4)]` over `ℝ` | `k(x²)`, `e = 1`; `e = 2` with trivial stabiliser at `0`; `ℂ^{ℤ/4} = ℝ`, kernel of order `2`; `H¹(ℝ, ℤ/4)` has 2 classes, neither with quotient torsor `Spec ℂ`, so no real point | holds | none |
| 1.3 degree (sampled) | `Spec k → BG`; `𝔸¹ → Spec k`; `[𝔸¹/μ₂] → 𝔸¹ × Bμ₂`; `ℤ/p` on `𝔸²` | `(\|G\|/1)·1`; `[k(t) : k] := 0`; `(2/1)·[k(y) : k(y)] = 2`, the rank of `𝔸¹_x → 𝔸¹_y`; norm `∏(y + ix) = y^p − x^{p−1}y`, `(1/p)·p = 1` | holds | none |
| 1.3 dominant base change | `BG → Spec k` along `Spec K → Spec k`; `Spec k → BG` along itself | `1/\|G\|` both; fibre product `G` has the identity section, not integral for `\|G\| > 1`, so outside the statement | holds with "integral" | none |
| 3.1 flat pullback (sampled) | `π : Spec k → BG`; coarse map of `[𝔸¹/μ₂]`; 2-isogeny | `[Spec k]`; `[[V(x²)/μ₂]] = 2·[Bμ₂]`; divisor of degree `0` with sum `2Q = π̂(P) = O′` | holds | none |
| 3.2 pushforward (sampled) | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; `[𝔸¹/μ₂] → 𝔸¹ × Bμ₂`, `φ = y` | `\|G\|·[0 × BG]` both sides; `f_*(2·[Bμ₂]) = 2·1·[0 × Bμ₂]` and `(2/1)·div(y) = 2·[0 × Bμ₂]` | holds; the factor is `e(f(𝒱))/e(𝒱)` | none |
| 3.3 localisation | `[𝔸¹/μ₂]`, `𝒵 = Bμ₂`; `ℙ¹` with two points | `ℤ → ℤ/2 → 0 → 0`; `ℤ² → ℤ`, kernel `ℤ·(1, −1)` | exact, not on the left | none |
| 3.4 exterior product (sampled) | `K/k` separable of degree 2; purely inseparable of degree `p`; `∅` | two points of degree `2`, `4 = 2 + 2`; local of length `p`, residue field `K`, `p·p = p²`; `0` | holds | none |
| 4.2 Gysin on stacks (sampled) | `π : Spec k → BG`, `Y = Spec k`; `L → 𝔸¹` étale; the space `X` over `𝔸¹_ℝ` | `\|G\|^{−1}·r_*[G] = [Spec k]`; codimension `0`, fibre product `L` with diagonal an immersion, a stack of Convention 1; a normal affine chart at the point over `0` would be `ℝ[t]_{(t)}` with residue field `ℝ ≠ ℂ` | holds; `X` is no scheme | none |
| 4.4 agreement | `B(ℤ/2) → Spec k`; `O(1)` on `ℙ¹` | `(1/2)·[Spec k]` both; `c_1(O(1)) ∩ [ℙ¹] = [pt]` both | holds | none |
| 5.1 products (sampled, headline) | `g : BG → Spec k`; `[ℙ¹/μ₂]`; `T = 𝔸¹ ⊔ 𝔸¹ → 𝔸¹` | both sides `(1/\|G\|)·[Spec k]`, a product weighted by `deg(BG/BG × BG) = \|G\|` gives `[Spec k]`; `[𝒫]·[𝒫] ∈ A_{−1} = 0`; `ℚ²` in dimension `1`, `0` in dimension `0` | holds | none |
| 5.4 degree of a point (sampled, headline) | `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]`, `t²/(t² − 1)`; `M` for proper `ℳ` | `(1/2)·[ℝ : ℝ] = 2/4`; orders `2, −1, 0`, `2·(1/2) − 1 = 0`; `Δ_M ∘ p = (p × p) ∘ Δ_ℳ` proper and `p` surjective, so `M` is separated, hence proper | holds | none |
| 6.1 comparison bundle (sampled) | `[0 → 0]`, `[O → O]`; `O(−4)[1] ⊕ Ω` on `ℙ¹`; rank count | `1 = 0 + 1 = 1 + 0`; `Ext¹(Ω, O(−4)) = H¹(O(−2)) = k`, homotopies in `H⁰(O(−2)) = 0`, `φ ∘ ξ = 0`; `rk F_1 − rk F_0 = rk H_1 − rk H_0 = −rk E` | holds | none |
| 6.3 relative formulas (sampled) | `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; `E = [O --t--> O]` | `d(x^p) = 0`, `s = 1 ≠ 0 = dim X − d − r`, class `p·[pt]`; `[pt]`; `H^{−1} = 0` with `H⁰ = O/t` not locally free, so that hypothesis is used | holds with its hypotheses | none |
| 7.2 characterisation (sampled, headline) | cone `C` of `φ`; characteristic `2`, `k[x]/(x²)` | `C` in degrees `≤ −2`, so `Hom(g^*C, J) = Hom(g^*C, J[1]) = 0`: injective on `Ext¹`, bijective on `Hom`; `d(x²) = 0`, `φ^*ω = 0`, `(x + ax²)² = x² ≠ 0` | holds; condition 3 fails where it should | none |
| 8.1 relative invariance (sampled, headline) | plane with `p = y`, `p = x`; kresch1999b lines 331–336 against 400–403 | `ν/η` fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; the proof translates along `𝔸^m`, the regularly embedded factor | consistent with the fourth statement | none |
| 8.2 regular pullback (sampled) | node with `V(a + b)`; `L → 𝔸¹` as `v` | `k[a, b]/(ab, a + b) = k[a]/(a²)`, `−2·[pt × pt]` both ways; `X′` has diagonal an open immersion followed by a base change of `Δ_X` | holds; `X′` is a stack of Convention 1 | none |
| 8.4 deformation invariance (R01) | `B = L`, `Z(x² − t·y²)`; `X = B = L`, `E = 0`; `B = 𝔸¹ ⊔ 𝔸¹` | `2, 2, 2` at `0₁`, `0₂`, `t ≠ 0`; `1` everywhere; `1` and `0` | holds for `B` not separated; connectedness needed | R01 |
| 9.1 API, `Mor(C, X)` (repair) | `C = ℙ¹`, `X = 𝔸¹ ⊂ ℙ¹`; all degrees of `Mor(ℙ¹, ℙ¹)` | constants only, `Mor = 𝔸¹`, `H¹(O) = 0`, dimension `0 + 0 + 1 = 1`; components of dimension `2d + 1`, not quasi-compact | holds; "of finite type" needed | none |
| 9.1 target hypotheses (repair) | `X` locally Noetherian; `X = ⊔_ℕ Spec k` | affine opens are Noetherian, overlaps quasi-compact: quasi-separated; one extension on each side | an algebraic stack of Convention 7 | none |
| 9.2 duality (sampled) | `L = V`, `K = O_M`; smooth curve; nodal fibre | `RHom(Rπ_*V, O) = Rπ_*(V^∨ ⊗ ω_π)[1]`; `χ(L) = e + 1 − g`, `χ(ω) = (2g − 2) + 1 − g = g − 1`; degree `2g(Ẽ) − 2 + #branches` | holds; `L_{M/𝔅}` is not bounded below, and 9.3 avoids duality for it | none |
| 9.3 check on `L` (repair) | `X = M = L`, `F = pr₂` | both extension sets torsors under `H⁰(T, g^*T_L ⊗ J)`; `H¹(ℙ¹_T, pr₂^*(−)) = 0`; `E = Ω_L`, `Ob = 0`, class `[L]` | holds | none |
| 9.4 resolution (sampled) | general; `L = O`; embedded point | `π_*G = π_*H = 0`, cone of `R¹π_*H[−1] → R¹π_*G[−1]` in degrees `0, 1`; `G = O`, `H = 0`, misses `O_M`; `H⁰(O(−N) ⊕ k_p) = k` | holds; ampleness and reducedness used | none |
| 9.5 rank and dimension (sampled, headline) | lines in `ℙ²`; `c_1 = 0`, dimension 3; `P`; li-tian1998 line 1586 | `−3 + 3 + 2 = 2`; `3g − 3 + n + 3(1 − g) = n`; `δ = 2`, `0 + 2 + 1 = 3 = dim PGL₂`; `(3 − dim X)(g − 1) + n + α·c_1` equals `(1 − g)(dim X − 3) + n + c_1·β` | holds | none |
| 9.5 curve class (R02) | fibre `ℓ` in Hironaka's threefold; `ℙ¹ × 𝔸¹`, fibre `ℙ¹ × 0` | `δ = 2 + 0 − 1 = 1 = −K·ℓ`, `h⁰ = 4`; `[ℙ¹ × 0] = div(t) = 0` in `A_1` while `δ = 2` | properness is what is used; a separated target that is not proper fails | R02 |

## Verified sound

- **Shape.** 9 layers, 33 numbered sections, 33 plan targets; every section has a *Needs:* line and at
  least 3 Checks (plan `tests`: minimum 3, counted by script); every layer ends with Examples and
  Dependencies (75 headings). A search found no LaTeX delimiters, no `lemma`, no process words, no
  pull-request numbers, no anchors, no machine paths and no `set_option`. Proposed names are in italics;
  every backticked Lean name is a library or supplier declaration.
- **Headline statements** (Summary): 2.2–2.3, 4.1–4.3, 5.1–5.4, 6.2, 7.1–7.2, 8.1–8.4, 9.3–9.5. Each is a
  named target with a locator. None is statable at the pins: neither pinned tree contains
  `IsAlgebraicStack` or `IsDeligneMumford`.
- **Sampled locators, read at the text** (the author flagged none as unverified). All 15 sampled sections
  carry the item number, the hypotheses and the statement the README gives:
  - vistoli1989 lines 347–376, 379–452, 485–507, 542–584, 887–1074, 1081–1123, 1594–1750, 1758–1776;
  - behrend-fantechi1997 lines 1162–1201, 1261–1320, 1353–1363, 1389–1424, 1583–1614, 1617–1739;
  - kresch1999b lines 182–207, 218–256, 296–343, 390–405;
  - behrend1997 lines 129–197; li-tian1998 lines 1472–1474, 1501–1503, 1565–1566, 1585–1586;
  - stacks-chow-spaces lines 57–62, 1986–1992, 2224–2228.
- **Pinned declarations opened** (`lake-manifest.json`: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, equal to
  the plan's baseline):
  - `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`: `map` (line 69, `[QuasiCompact f]`);
    `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`: `ord` (line 52).
  - `TauCeti/AlgebraicGeometry/Chow/Basic.lean`: `cyclesOfDimension` (86), `RatEquiv` (257), `ChowGroup`
    (295), `cycleClass` (304), `equivIntOfUnique` (369);
    `TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean`: `ChowGroup.pushforward` (211).
  - `TauCeti/AlgebraicGeometry/Stack/Basic.lean`: `SchPseudofunctor` (37);
    `TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean`: `Spaces.IsAlgebraicSpace` (docstring line 34);
    `TauCeti/AlgebraicGeometry/Curves/Prestable.lean`: `PrestableFamily` (45);
    `TauCeti/AlgebraicGeometry/VectorBundle/Degree.lean`: `vectorBundleDegree` (82).
- **Cross-roadmap citations resolved.**
  - VirtualFundamentalClass at its open head: headings §§0.1–9.6 exist under the cited numbers; §2.5 was
    read in full (rational, separated test stacks, Kresch's restricted action, the plane example).
  - SchemeAndStackFoundations on main: §3.3 (`vectorBundle_riemann_roch` for a proper curve with
    `H⁰ = k`), §4.14 (Hom schemes), §5.2 (degree on proper schemes, `chow_affine_bundle`,
    `localization_exact`), §5.3 (`proper_pushforward`, `c1_degree_curve`), §5.4 were read; §§1.23, 2.19,
    2.20, 4.1, 5.1, 5.5, 5.6 exist under the cited numbers.
  - StableReductionPartII at its open head: §5.15 is headed "Chern class of the dualizing pairing" and
    states in its body the Edidin–Graham comparison `A_{i−d}([X/G])_ℚ → A^G_i(X) ⊗ ℚ` with the
    hypotheses the contract quotes, compatible with Chern classes and proper pushforward, and no
    product statement.
  - AlgebraicGromovWittenTheory at its open head: §§4.1–4.3 exist; §4.3's dimension is
    `(1 − g)(d − 3) + n + c₁(T_X)·β`, the formula 9.5 quotes.
  - EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra are
    folders on main; the resolver lists none of their cited sections as missing.
- **Gaps.** A search of main and the open heads for "normal cone of a local immersion" has no hit;
  VirtualFundamentalClass uses integral closed substacks at its §2.1 without stating their theory. Both
  `needs` sentences name one construction with its properties and hypotheses.
- **Duplication and ownership.** Searched main and the open heads by object: Chow groups of stacks,
  finite covers by schemes, deformation invariance, `Rπ_*f^*T`, normal cones of local immersions,
  generic stabilisers, Poincaré duality for bivariant groups. The hits are AlgebraicGromovWittenTheory
  (its own stable-map theory, a consumer here), AnalyticStableMaps (symplectic) and unrelated uses. No
  other roadmap states a target of this one. `scratch/overlaps.md`: no dropped id, no revision-only id,
  no conflicting head, no second copy; the roadmap is not on main.
- **Organisation.** Layer titles are mathematical and the README nowhere says it follows a source. The
  order 1 → 2 → 3 → 4 → 5 → 6 is forced (2.2 needs 1.2; 3.1 needs 2.2; 4.1 needs 3.1–3.4; 5.1 needs
  4.1–4.3; 6.2 needs 4.3–4.4), as are 8 after 6 (8.2 needs 6.2) and 9 after 7 (9.1 needs 7.1).
- **Manifest.** 14 sources, one key each, every key cited in the README; 12 certified from open
  repositories, 2 settled as uncertified; no local path. The repair changed two `cited_for` entries
  only. No source was fetched this round and no `needs-references.toml` was written.
- **Copyright.** Wording compared at 17 passages with 5 sources: 1.3, 3.1, 3.2, 4.1, 4.2, 5.1 and
  Convention 2 with vistoli1989; 6.1, 6.2, 6.3, 7.2, 8.2, 9.2–9.3 with behrend-fantechi1997; 8.1 with
  kresch1999b; 9.1, 9.4, 9.5 with behrend1997; 8.4 with li-tian1998. The longest shared run is 6 words
  ("the extensions form a torsor under", 7.2's condition 3 beside behrend-fantechi1997 line 1167), in
  a statement that can be written one way. Arrangement: vistoli1989's section 3 is split over Layers
  2, 3 and 4 by integrality, its sections 1, 2, 5 and 6 feed Layers 1 and 5 in another order, and its
  section 4 is no layer. No table, figure, list of examples or numerical data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction; normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory and Hom schemes: SchemeAndStackFoundations; nothing else shared.

Source independence: 17 passages compared with 5 sources, none shared beyond parts of statements of at most 6 words; largest share vistoli1989, 74 of 166 occurrences of source keys in the README; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§§1.8, 1.10, Chapter 3, Corollary 6.3, Propositions 8.1.1, 10.2):
  uncertified, cited by locator only.
- The journal numbering of kresch1999b, behrend1997, li-tian1998, keel-mori1997 and rydh2015: each is
  cited in the arXiv version the manifest names.
- vistoli1989 is read from an OCR text; the displays of (1.15) (line 370) and of the covering formula
  (lines 1607–1609) are garbled and were matched by content.
- The global gluing in 8.1–8.3 (descent of the rational equivalence over relative local embeddings,
  agreement of 8.3's comparison on overlaps) was checked on charts and on the instances of the table and
  of round 13's table, not as a proof.
- R02's witness uses the standard description of Hironaka's threefold as locally a blow-up of a smooth
  curve; the normal bundle `O ⊕ O(−1)` was computed from that, not read in a source.
- Locators of the 18 sections outside the sample were not reread this round, except 4.1, 5.2, 8.4 and
  9.1 at the lines listed above.
- Elaboration: not available in this lane, and a design has no Lean file.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, as used in the proof of Lemma 5.9, lines 1416–1417: the source says the rational equivalence is invariant under the whole tangent bundle of the ambient; it should be invariant under the tangent bundle of the regularly embedded stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both resolutions may be taken to map to the theory by morphisms of complexes; it should justify this, since an isomorphism in the derived category need not be one; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, lines 331–336: the source says the acting bundle is the tangent bundle of the arbitrary locally immersed stack; it should be that of the smooth regularly embedded stack, as its proof uses; affects nothing.
- **Misprint** in vistoli1989 at the paragraph before Lemma 5.3, line 1613: the source says multiplicativity of the degree is Lemma 1.15; it should be Lemma 1.16 (line 379), unless the slip is the scan's; affects nothing.
- **Misprint** in vistoli1989 at the proof of Lemma 5.3, line 1646: the source says the identity of degrees follows from Lemma 1.14; it should be Lemma 1.16, multiplicativity of the degree, unless the slip is the scan's; affects nothing.
- **Misprint** in vistoli1989 at the proof of Proposition 6.1, line 1768: the source says integrality of the reduced fibre product follows from Lemma 2.5; it should be Lemma 2.3 (2.5 is a corollary on degrees), unless the slip is the scan's; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ad039ea075a8e004326baa8d4b7e771743a43bd6", "job": "REV-DESIGN-VirtualFundamentalClassPartII~14", "model": "fable", "worker": "chris-x89"} -->
