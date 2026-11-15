<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6898394180 -->
Review (claude) of a1512f0

Verdict: needs_changes

1. **F01** (P3) an API bullet and a Check of 1.2 use the degree that 1.3 defines from 1.2

   - **Location.** `design/README.md` lines 517–519 (1.2, API): "`e(𝒱)` is the sum of the degrees
     `deg(ℐ/𝒱)` of 1.3 over the irreducible components `ℐ` of `(I_𝒱)_red` that dominate `𝒱`"; lines
     529–535 (1.2, fourth Check); `design/plan.json`, target 1.2, `api`
     `genericStabiliserOrder.eq_sum_deg_inertia`.
   - **Claim.** 1.2 is built before 1.3 ("Within the layer, 1.1 and 1.2 precede 1.3", line 602).
   - **Witness.** 1.3's *Needs:* line reads "1.2" (line 557) and `plan.json` 1.3 has `target:1.2`,
     while 1.2's bullet needs 1.3's `deg`; `plan.json` 1.2 lists no `target:1.3`. For `Bμ₃` over `ℚ`
     the Check evaluates `(3/3)·[ℚ(ζ₃) : ℚ] = 2` with 1.3's formula.
   - **Repair.** Move the bullet to 1.3's API and the Check "The inertia formula counts degrees, not
     components" to 1.3's Checks, unchanged; in `plan.json` move `eq_sum_deg_inertia` and its test from
     target 1.2 to target 1.3. 1.2 keeps four Checks and 1.3 then has seven. Tested on the instance:
     with the bullet in 1.3, `e(Bμ₃) = 1 + 2 = 3` uses `e`, `k(·)` (1.2) and `deg` (1.3), all available
     there, and the *Needs:* lines are true as written.

2. **F02** (P3) 9.2 has no source locator in the README

   - **Location.** `design/README.md` lines 1778–1801 (9.2): the section cites suppliers only;
     `design/plan.json` line 1708 records "behrend-fantechi1997 … lines 1583-1599 (duality along a
     Gorenstein curve family)".
   - **Claim.** Every theorem of the README carries a locator at the claim.
   - **Witness.** A search of 9.2 for the fourteen source keys returns 0 hits (every other numbered
     section has at least one). behrend-fantechi1997 lines 1592–1597 use a dualising complex of the
     curve, `π^! = π^* ⊗ ω`, adjunction and duality for the product family `C × X → X`.
   - **Repair.** In 9.2, after the statement of Serre duality, add "(behrend-fantechi1997 lines
     1592–1597, for a product family `C × X → X` with a dualising complex on `C`; the statements for
     flat proper Gorenstein families are those of SchemeAndStackFoundations §§2.19–2.20)". Tested: for
     `𝒞_M = C × M` (9.2, third Check) the cited lines give `Rπ_*(F^*Ω ⊗ ω_C) = (Rπ_*F^*T)^∨` up to the
     shift the README writes as `[1]`, which is 9.2's Serre duality for `V = F^*T_X`.

Two findings, R01 and R02, both P3; no P1 or P2 finding. Each carries a repair, so the verdict asks
for changes. The design declares two supplier gaps, `gap:closed-substacks-of-stacks`
(VirtualFundamentalClass §2.1) and `gap:normal-cones-of-local-immersions` (VirtualFundamentalClass
§1.5); both are precise, minimal and declared in `plan.json` and the README, and neither is a
finding.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md` (read in full, 1962 lines),
`packages/VirtualFundamentalClassPartII/design/plan.json`,
`packages/VirtualFundamentalClassPartII/sources.toml`. This is a design: there is no
`Suggested.lean`; this lane does not elaborate, so no elaboration, no `#check` comparison and no
one-tactic padding probe were run, and none applies at this stage.

## Round-8 findings

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3) | repaired | 5.3, lines 1185–1191: "so that `[X/G]` is a smooth separated Deligne–Mumford stack of pure dimension `n − g` (edidin-graham1998 §5.1, lines 1042–1045)" and "(edidin-graham1998 Proposition 15, lines 1069–1076, for smooth `X` with `[X/G]` locally separated and Deligne–Mumford, no moduli scheme assumed; …)". Read: edidin-graham1998 line 5 (the text is arXiv:alg-geom/9609018v3), lines 1042–1045 (finite reduced stabilisers give an unramified diagonal, a proper action a proper diagonal), lines 1069–1072 (Proposition 15, the three products agree). References, lines 1945–1949, and the manifest entry (`arxiv`, `locator`, `version_note`, `cited_for`) name the same text; one key. `plan.json` 5.3 gives the same locator. |
| F02 (P3) | repaired | Downstream consumers, lines 1924–1925: "a smooth projective target over a field of characteristic zero". AlgebraicGromovWittenTheory at its open head, lines 5 and 38, fixes a field of characteristic zero; "algebraically closed" has no occurrence there. |

The repaired patterns in the rest of the design: "Proposition 11", "790–798" and "moduli scheme"
occur only in the version notes that explain the earlier preprint (search); "algebraically closed"
occurs once more, in 5.2 for the test fields `Ω` of a moduli space, where it is correct. The repair
of F01 differs from the one proposed (the text was fetched again under the same key, so that every
number comes from the version read); I checked the result, not the route, and it is sound.

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

No UPWARD or CYCLE line. Suppliers: VirtualFundamentalClass (open, adds a new folder),
SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves,
DerivedModuleAlgebra (main), StableReductionPartII (merge order; open, adds a new folder; §5.15
only). AlgebraicGromovWittenTheory is a consumer only. No roadmap of the never-cite list is cited.
No open roadmap or roadmap on main cites VirtualFundamentalClassPartII (search, no match), so no
supplier consumes this roadmap.

## Maintainer notes

None stands as a finding.

1. Words: satisfied. Convention 2 (lines 156–166) uses "local immersion" for the class and "local
   embedding" for the chart pair and states Vistoli's words once; kresch1999b lines 232–234 and
   vistoli1989 lines 499–505 read as cited.
2. Cotangent complex: satisfied. Convention 6: "No truncated cotangent complex is defined"; 9.3
   builds `φ` into the full `L_{M/𝔅}` from the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the relative invariance and the plane example. The sub-claim that the
   owner names no acting group is refuted: VirtualFundamentalClass §2.5 at its open head reads
   "invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch, Theorem 3.1".
5. Functoriality: 8.3's second case goes through the graph and states that no compatibility datum
   over the graph is used; the conic instance is recomputed in the table.
6. Suppliers: satisfied. AlgebraicVectorBundles and EllipticCohomology have 0 occurrences in the
   README; the seven suppliers are cited by section.

## Adversarial table

Rows: the passages the round-9 repair changed, the 15 sampled targets, the headline statements,
the targets the two notes touch, and the targets for which round 8 gave no computed row (3.4, 3.5,
4.3, 7.1, 8.2, 9.1). All values were computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.3 (repair) hypotheses against Proposition 15 | proper action, finite reduced stabilisers, smooth `X`; `μ_p` in characteristic `p` | proper diagonal, so separated, so locally separated; unramified diagonal, so Deligne–Mumford; `μ_p` not reduced, excluded | Proposition 15 applies | none |
| 5.3 ring isomorphism | `ℙ(1, 2)`; `Bμ_n`; `G` trivial | origin class `t · 2t`, ring `ℤ[t]/(2t²)`, rationally `ℚ[t]/(t²)`; codimension `n − i` on both sides of `A^G_i ≅ A_{i−g}`; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; identity | holds | none |
| Downstream consumers (repair) | AlgebraicGromovWittenTheory §§4.1–4.3 | rank `d(1 − g) + c_1(T_X)·β`; `3g − 3 + n + δ + d(1 − g) = (1 − g)(d − 3) + n + δ` | case of 9.3–9.5 | none |
| 1.1 finite cover | rydh2015 Theorem B, lines 81–85 | hypotheses: quasi-compact, Deligne–Mumford, diagonal quasi-compact and separated (all in Convention 1); conclusion finite, finitely presented, surjective, étale over a dense open | holds | none |
| 1.1 no separated cover of `L` | discrete valuation ring into a component over `0₁` | second extension through the other chart ends at `0₂`; lift exists by universal closedness and equals the first by separatedness; images `0₁ ≠ 0₂` | contradiction, as stated | none |
| 1.1 `L → B_{𝔸¹}G` | `Q = 𝔸¹ ⊔ 𝔸¹` | `Q ×_L Q = Q ⊔ Q|_{t≠0}`, four pieces `𝔸¹, 𝔾_m, 𝔾_m, 𝔸¹`; degree `2 = (2/1)·1` | holds | none |
| 1.2 `e` and `k(𝒱)` | `BS₃`; `[𝔸¹/μ₂]`; `B_{𝔸¹}G`; `[Spec ℂ/(ℤ/4)]` over `ℝ` | `6`; `e = 1`, `k = k(x²)`; `e = 2` with trivial stabiliser at `0`; kernel of order `2`, `k(𝒢) = ℝ` | holds | none |
| 1.2 inertia sum (R01) | `B(ℤ/2)`; `BS₃`; `Bμ₃` over `ℚ` | `1 + 1`; `[S₃ : Z(c)] = 1 + 3 + 2 = 6`; `1 + (3/3)·2 = 3` with two components | holds; uses 1.3 | R01 |
| 1.3 degree formula | `Spec k ⇄ BG`; `𝔸¹ → Spec k`; `ℤ/p` on `𝔸²`; Frobenius; atlas of `[𝔸¹/μ₂]` | `|G|`, `1/|G|`, product `1`; `0`; `(1/p)·p = 1`; `p`; `1·[k(x) : k(x²)] = 2` | holds | none |
| 1.3 base change | `BH → BG ← BK` constant, `HK = G`; `Bl_0𝔸²` twice over `𝔸²`; two Frobenii | `|K|/|H ∩ K| = |G|/|H|`; product has a second component `E × E`, excluded; `k[s, u]/((s − u)^p)` not reduced, excluded | holds; integrality of the product is needed and is assumed | none |
| 2.2 `A_0([𝔸¹/μ₂])` | `P(y)` irreducible, also inseparable (`y^p − a`, `p` odd) | `k[x]/P(x²) = K[x]/(x² − θ)`, `θ ≠ 0`, étale over `K`, so reduced: `div(P) = [W]`; `div(y) = 2·[Bμ₂]`; group `ℤ/2` | holds | none |
| 2.2 boundary | `W_{−1}(BG) = k^×` | lands in `Z_{−1}(BG) = 0`; `A_0(BG) = ℤ` | holds | none |
| 2.3 schemes and spaces | `L`; `Spec k`; stacks-chow-spaces Situation 2.1 with `B = Spec k`, `δ = 0` | `ℤ²/ℤ·(1, 1) ≅ ℤ`; `ℤ`; `Spec k` quasi-separated, Noetherian, universally catenary; "good" is quasi-separated and locally of finite type; cycles finite on a quasi-compact space (line 124) | holds | none |
| 2.3 rationalisation | `[𝔸¹/μ₂]` | `ℤ/2 ⊗ ℚ = 0`; owner's group: integral closed substacks modulo principal divisors, rational | holds | none |
| 3.3 push–pull | `Spec k → BG` against itself; `G = μ₃` over `ℚ` | both sides `|G|·[Spec k]`; `[G] = [Spec ℚ] + [Spec ℚ(ζ₃)]`, degrees `1 + 2 = 3` | holds | none |
| 3.3 localisation | `[𝔸¹/μ₂] ⊇ Bμ₂`; `ℙ¹`, two points | `ℤ → ℤ/2 → 0 → 0` exact, first map not injective; kernel `ℤ·(1, −1)` | holds | none |
| 3.4 | `K ⊗_k K` separable of degree `2`, purely inseparable of degree `p`; `BG × BH`; pushforward of `[pt] × [pt]` | two points, `4 = 2 + 2`; length `p`, `p² = p·p`; `[B(G × H)]`; `|G||H|` on both sides | holds | none |
| 3.5 | zero section of `O(−1)` on `ℙ¹`; `z ↦ z²`; `Spec k → BG`; `t ↦ (t², t)`; base change along `{0} → 𝔸¹` | `−[pt]`; `2·[pt]`; `[G]` of degree `|G|`; `2·[pt]` both ways; `[pt]` against a class in `A_{−1} = 0` | holds; flatness needed | none |
| 3.5 integrality | vistoli1989 lines 963–966, 1101–1109, 1458–1462 | Theorem 3.11 is stated for `A_*`, which the source declares integral; Lemma 4.6 gives an element of `W_*` stable under étale base change | route supported | none |
| 4.1 | `BG → Spec k`; `[𝔸¹/μ₂] → 𝔸¹`; `L × B(ℤ/2) → L` | `1/|G|`, composite `1`; `2·(1/2)·[0] = div(y)`; `(1/2)·[0₁]`, `ℚ ≅ ℚ` | holds | none |
| 4.2 definition | `π : Spec k → BG`, `Y = Spec k`; `f = id`; `X` from `𝔸¹_ℂ` over `𝔸¹_ℝ` | `|G|^{−1}·|G|·[Spec k]`; identity; residue field `ℂ` at the origin, functions take real values there, so no affine neighbourhood | holds | none |
| 4.2 flat base change (used by 8.4) | `𝒢 = B`, `𝒢_1 = 𝔐 × B`, `𝒢″ = X`, `𝒢′ = B` | `X → B` factors through `𝔐 × B`, `B` does not; the bullet gives `i_b^! p_* = p′_* η_b^!` | applies as used | none |
| 4.3 | trivial line on `BG`; `O(−1)` on `ℙ¹`; `L ⊕ L^∨` | `s^![𝔸¹ × BG] = [BG]`; `−[pt]` in dimension `0`; `c_1 = 0`, `c_2 = −c_1(L)²` | holds | none |
| 4.4 | `B(ℤ/2)`; `O(1)` on `ℙ¹`; `Spec k` | `1/2` both; a point class both; `ℚ` both | holds | none |
| 5.1 projection formula (headline) | `BG → Spec k`, `x = [Spec k]`, `y = [BG]` | graph of `g` is the identity, `g^*x = [BG]`; `Δ^![BG × BG] = [BG]`; both sides `(1/|G|)·[Spec k]`; a product weighted by `|G|` gives `[Spec k]` | holds | none |
| 5.1 duality | `T = 𝔸¹ ⊔ 𝔸¹ → 𝔸¹`; `T = L` | `ℚ²` in dimension `1`, `0` in dimension `0`; pullback of `id` is `L`, not separated, outside the owner's groups | holds; hypothesis needed | none |
| 5.2 (headline) | `[𝔸¹/μ₂]`; `ℤ/p` on `𝔸²` | `0 = 0` rationally, `ℤ/2 → 0` integrally; `[k(y) : k(y^p)]/p = 1`, not `1/p` | holds | none |
| 5.4 | `BG`; `Spec k(a^{1/p})`; `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]`, `t²/(t² − 1)` | `1/|G|`; `p`; `1/2 = 2/4`, no splitting of `ℤ/4 → ℤ/2` so no real point; orders `2, −1, 0`, `2·(1/2) = 1 = ∫[𝒪]` | holds | none |
| 6.1 (used by 6.2) | `[0 → 0]` and `[O → O]`; `[O(−4) → Ω]` on `ℙ¹` | rank `1 = 0 + 1 = 1 + 0`; `Hom(E, E) = k ⊕ k ⊕ H¹(O(−2))`, `P = O(3)²` | holds | none |
| 6.2 | `[O(1) → Ω]`; theory of 6.1 through `F_1` and `P`; `𝓛_n` on `L` | `−1`; `4` and `6 − 2 = 4`; `n·[0₂]`, opposite gluing `n·[0₁] = −n·[0₂]` | holds | none |
| 6.2 dimension | `C(F•)` | `d + rk F_0`; class in `A_{d + rk F_0 − rk F_1} = A_{d+r}` | holds | none |
| 6.3 | `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; smooth case | `p·[pt] ≠ 0`; `[pt]`, single exponent gives `0`; `rk Ob = rk Ω − r = dim X − d − r` | holds | none |
| 7.1 | `Spec k → B𝔾_m`; `k[x]/(x²)`, `x ↦ ε` | torsor under `1 + J ≅ J`, `Ω_{pt/B𝔾_m} = O`; `(ε + aε²)² = ε² ≠ 0` | holds | none |
| 7.2 | cone `C` of `φ`; characteristic `2`, `φ = (0, id)` | `H^{−1}(C) = H⁰(C) = 0`, so `Hom(g^*C, J) = Ext¹(g^*C, J) = 0`; `φ^*ω(g) = 0` while `(x + ax²)² = x² ≠ 0`; in other characteristics `(0, id)` is no chain map (`d(x²) = 2x dx`) | holds | none |
| 8.1 (headline) | plane; `𝔸¹ × Spec k[ε]/(ε²)` | `ν/η` fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `∂β = 2[ν = 0] − 2[T = 0]` | holds | none |
| 8.2 | node with `V(a + b)`; `𝔸¹ × Spec k[ε]/(ε²)` | `k[a, b]/(ab, a + b) = k[a]/(a²)`, `−2·[pt × pt]` both ways; `2·[pt]` both ways | holds | none |
| 8.3 second case (note 5) | `ℙ²`, conic, line, `E = Ω_X` | rank `1 − 1 = 0`; graph meets `ℙ¹ × line` in `2` points; conic · line `= 2` | holds | none |
| 8.3 choice of `Z′_0` | `Z′ = pt ⊔ ⊔_ℕ pt` | first point alone: `[pt]`; with finitely many others: graph meets `Z′_0 × X` over the first point only, `[pt]` | independent, as stated | none |
| 8.3 first case | `𝔸¹ × Z → Z`, `X = Z = 𝔜 = Spec k` | `dim B T_{𝔸¹} = 1 − 1 = 0`, relative dimension `−1` over `𝔸¹` | holds | none |
| 8.4 | `x² − b y²`; `{xb = 1}`; `ℙ¹ × B` | counts `2, 2, 2`; `1` and `0`; `m + r = 1`, no degree | holds | none |
| 8.4 route | `i_b^!(n[B])`; dimensions | `n[b]`, `κ(b)`-degree `n`, `k`-degree `n[κ(b) : k]`; bases of dimensions `m + 1` and `m`; `[X]^vir ∈ A_1` | holds | none |
| 9.1 | `X = Spec k`; `ℙ¹ → ℙ^r`; `M = pt`, `F = id_{ℙ¹}` | formally étale and locally of finite presentation, so étale; open in `ℙ^{(r+1)(d+1)−1}`; `H⁰(T_{ℙ¹}) = k³ ≠ 0` | discriminates | none |
| 9.2 | smooth curve, `L` of degree `e`, `ω_C`; `C × M`; `V = F^*T_X` | `e + 1 − g`, `g − 1`; `RΓ(C, V) ⊗ O_M`; amplitude of `(Rπ_*V)^∨` is `[−1, 0]`, matching `Rπ_*(V^∨ ⊗ ω_π)[1]` | holds | R02 (locator) |
| 9.2 duality map | projection formula then `tr` | the comparison is one global morphism, an isomorphism on charts; no gluing of chart isomorphisms in the derived category is needed | sound | none |
| 9.3 (headline) | `ℙ¹ → ℙ^r`; elliptic `C = X` | `χ = (r + 1)(d + 1) − 1`, `Ob = 0`; `Ob = H¹(O) ⊗ O_M`, class `0` | holds | none |
| 9.4 | `0 → H → G → V → 0` | `π_*G = π_*H = 0`, so `Rπ_*V = [R¹π_*H → R¹π_*G]` in degrees `0, 1`; `L = O`: `[0 → R¹π_*O]` misses `H⁰` | holds; hypotheses needed | none |
| 9.5 | lines in `ℙ²`; `Spec k ⊔ ℙ¹` | `−3 + 3 + 2 = 2`; `ℓ = 0`, rank `0`, not `1`; li-tian1998 line 1586 gives the same number | holds | none |

## Verified sound

- **Shape** (script over the README and `plan.json`): 9 layers, 33 numbered sections, 33 targets;
  every section has a *Needs:* line and at least 3 Checks (minimum 3, maximum 6); every target has
  at least 3 tests; every layer ends with Examples and Dependencies; 32 of 33 sections carry a
  source locator (R02 is the one without). No LaTeX delimiters, `lemma` keyword, process words,
  pull-request numbers, anchors, machine paths, `set_option` or "optional/deferred" (search, 0
  hits). `plan.json` parses; its baseline revisions are the pins. Proposed names are in italics;
  every backticked Lean name is a library or supplier declaration (resolver: none found nowhere).
- **Headline statements** (Summary): integral groups and their three comparisons (2.2–2.3);
  rational pushforward, Gysin maps, homotopy invariance and Chern classes on all stacks (4.1–4.3);
  intersection ring, Poincaré duality, moduli-space isomorphism, the ring structure of the
  Edidin–Graham comparison and the degree of a point (5.1–5.4); the virtual class without the
  resolution property or separatedness (6.2); the relative obstruction class and characterisation
  (7.1–7.2); relative invariance, pullback, functoriality and deformation invariance (8.1–8.4); the
  obstruction theory of spaces of maps, its resolutions and dimension (9.3–9.5). Each is a named
  target with hypotheses and a locator. None is statable at the pins, which have no algebraic-stack
  predicate, no Chow groups of stacks and no cotangent complex of a stack.
- **Source locators read this round** (the author flagged none as unverified): vistoli1989 lines
  296–330, 335–455, 485–507, 540–586, 883–1076, 1076–1131, 1168–1176, 1195–1208, 1448–1466,
  1565–1780; behrend-fantechi1997 lines 1036–1046, 1255–1322, 1385–1425, 1452–1462, 1578–1614,
  1615–1745; kresch1999b lines 228–244, 303–318, 330–344; behrend1997 lines 137–141, 155–170,
  192–198; li-tian1998 lines 1468–1506, 1560–1568, 1583–1588; edidin-graham1998 lines 1–5,
  1036–1080; rydh2015 lines 76–90; deligne-mumford1969 lines 1008–1021; stacks-chow lines
  1354–1360; stacks-chow-spaces lines 55–62, 124–134, 149–158, 514–518, 665–671, 795–819,
  1984–1991, 2222–2227. Every locator of the 15 sampled sections carries the item number,
  hypotheses and statement the README gives (9.2 has none to check in the README; the one in
  `plan.json` reads as recorded).
- **Pinned declarations opened.** Mathlib: `AlgebraicGeometry.AlgebraicCycle`
  (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` line 44) and `AlgebraicCycle.map` (line
  69, `[QuasiCompact f]`, weights); `AlgebraicGeometry.Scheme.ord`
  (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` line 52, under `[IsIntegral X]
  [IsLocallyNoetherian X]`, junk value `0` for `f = 0` or `coheight z ≠ 1`, line 48);
  `IsClosedImmersion` (`Morphisms/ClosedImmersion.lean` line 44), `Flat` (`Flat.lean` 42), `Etale`
  (`Etale.lean` 39), `Smooth` (`Smooth.lean` 59), `IsProper` (`Proper.lean` 41). Tau Ceti:
  `Chow.cyclesOfDimension` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean` line 86), `RatEquiv` (257,
  locally finite families, line 128), `ChowGroup` (295), `cycleClass` (304), `equivIntOfUnique`
  (369); `ChowGroup.pushforward` (`Chow/ClosedImmersion.lean`); `SchPseudofunctor`
  (`Stack/Basic.lean` line 37); `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean`);
  `PrestableFamily` (`Curves/Prestable.lean` line 45, a class on morphisms of schemes extending
  `IsProper` and `GeometricallyConnected`, with `syntomic` at line 55 and stability under base
  change at line 64; no genus); `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree`
  (`VectorBundle/Degree.lean`).
- **Cross-roadmap citations resolved.** VirtualFundamentalClass at its open head: all 49 cited
  sections §§0.2–9.6 exist under the cited numbers; read its Scope, Conventions and §§0.2–0.3,
  1.5–1.6, 2.1–2.5, 3.2–3.5, 4.4–4.5, 6.1–6.6, 7.1–7.7, 8.1–8.5, 9.1–9.6. Each statement the
  contract assumes is there: §1.5 covers representable closed immersions only; §2.1 is for
  separated stacks and states no theory of closed substacks; §3.2 defines a global resolution as a
  derived isomorphism; §6.4 has the pullback of relative theories under cartesian base change;
  §7.3 and §9.2 assume separatedness and the resolution property; §9.4 is over smooth bases; §9.5
  is under the hypotheses of Proposition 7.5. SchemeAndStackFoundations on main: the 22 cited
  section headings exist under the cited numbers and the 28 cited names occur in the cited
  sections (`IsAlgebraicStack` at §1.19 asks for a representable diagonal and a smooth atlas, no
  quasi-separatedness; `keel_mori` in §1.23; `localization_exact` and `chow_affine_bundle` in §5.2;
  `excess_intersection` and `gysin_self_intersection` in §5.5; §5.5 "A regular immersion need not
  be closed"; §5.6 "no separatedness is assumed", with the doubled-origin Check; §1.9 Check on
  `𝔸¹/ℤ`). StableReductionPartII §5.15 at its open head states the Edidin–Graham comparison with
  the contract's hypotheses (proper action of a smooth affine group, linearised ample sheaf,
  `[X/G]` Deligne–Mumford, Chern classes and proper pushforward) and no product statement.
  EquivariantIntersectionTheory Conventions 1, 4, 5 and §§2.1–2.2, StableReduction Layers 2–3,
  EnhancedDerivedSheaves §0.3, E1.4, E1.8 and DerivedModuleAlgebra §§0.7, 0.12, 0.25 exist on main.
  AlgebraicGromovWittenTheory §§4.1–4.3 (consumer) exist at its open head.
- **Declared gaps.** Both have the same slug in `plan.json` and under the README's contracts, name
  VirtualFundamentalClass with a section, and ask for one theory each with its hypotheses. Neither
  asks for what a supplier states (the two sections read above). Not findings.
- **Duplication and ownership.** Against VirtualFundamentalClass at its head, by object: Layers
  2–4 remove separatedness or rational coefficients from §§2.1–2.4; 6.2 removes the resolution
  property and separatedness from §§7.3–7.4, 9.2; 6.3 and 8.2 replace the smooth bases of §9.4;
  7.1–7.2 make §§3.5, 6.1, 6.3 relative; 8.1 extends §2.5's invariance to relative directions; 8.3
  removes separatedness from §9.5; 9.3–9.5 state AlgebraicGromovWittenTheory §§4.1–4.3 for every
  base, target and field. No target restates an owner at equal generality. A search of main and
  the open heads for integral Chow groups of stacks, non-separated Deligne–Mumford Chow theory and
  the obstruction complex `Rπ_*F^*T_X` outside these roadmaps found no other owner. Pins: no
  declaration of Chow groups of stacks, stack degree or obstruction theory exists to cite instead.
  `scratch/overlaps.md`: no dropped id, no revision-only id, no conflicting head, no second copy;
  the roadmap is not on main; the two packages on other board branches (AnalyticNumberTheory,
  LawrenceVenkateshMethod) are in other subjects.
- **Organisation.** Layer titles are mathematical; the README nowhere says it follows a source.
  The order 1 → 2 → 3 → 4 → 5 is forced by the *Needs:* lines (2.2 needs 1.2; Layer 3 needs Layer
  2; 4.1 needs 1.1, 1.3 and Layer 3; Layer 5 needs 4.1–4.3); Layer 7 needs no Chow layer.
- **Manifest.** 14 sources, one key each; every key cited in the README is recorded and
  conversely (script); 12 certified from open repositories, 2 settled as uncertified; no local
  path. No source was fetched this round; the manifest is as received and no
  `needs-references.toml` was written.
- **Copyright.** Wording compared at 24 passages with 10 sources: the locators listed above, among
  them Convention 2 with kresch1999b lines 232–237, Convention 3 with vistoli1989 lines 887–890,
  1.3 with vistoli1989 lines 365–376, 4.2 with vistoli1989 lines 1603–1620, 5.2 with vistoli1989
  lines 542–545 and 1766–1770, 6.2 with behrend-fantechi1997 lines 1282–1298, 8.3 with
  behrend-fantechi1997 lines 1721–1736, 8.4 with li-tian1998 lines 1472–1474, 9.3 with
  behrend-fantechi1997 lines 1583–1599. The longest shared runs are parts of statements that can
  be written in one way (5 words in 1.1 beside rydh2015 line 84). Arrangement: vistoli1989 has
  sections 1 (stacks), 2 (moduli spaces), 3 (intersection theory), 4 (proof of the basic lemma), 5
  (bivariant theory), 6 (duality on moduli spaces), 7 (appendix); its section 3 is split over
  Layers 2, 3 and 4 by integrality, its sections 2, 5 and 6 feed one layer (5), its section 4 is no
  layer, and Layers 6–9 come from other sources. No table, figure, list of examples or numerical
  data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction (CrystallineCohomologyPartII is close in vocabulary only); normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory: SchemeAndStackFoundations; nothing else shared.

Source independence: 24 passages compared with 10 sources, none shared beyond parts of statements of at most 5 words; largest share vistoli1989, 73 of 158 occurrences of source keys in the README; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§§1.8, 1.10, Chapter 3, Corollary 6.3, Propositions 8.1.1, 10.2):
  uncertified, cited by locator only.
- The journal numbering of kresch1999b, behrend1997, li-tian1998, keel-mori1997 and rydh2015: each
  was read in the arXiv version the manifest names.
- vistoli1989 is read from an OCR text: displayed formulas and some labels are garbled (for
  instance the display of Definition 1.15, line 370, and the labels of (3.6) and (3.7)) and were
  matched by content.
- The global gluing in 8.1–8.3 (descent of the rational equivalence over relative local
  embeddings, the comparison of 8.3's API on overlaps) was checked on charts, by rank and dimension
  and on the instances of the table, not as a proof.
- Locators of the 18 sections outside the sample were reread only where listed above (3.1, 3.2,
  3.5, 4.1, 5.2, 6.1, 6.3, 7.2, 8.2, 9.3–9.5 in part); their statements and Checks were read and
  the Checks recomputed.
- Elaboration: not available in this lane, and a design has no Lean file.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–891 (used at lines 1416–1417): the source says the rational equivalence is invariant under the whole tangent bundle of the ambient; it should be invariant under the restricted tangent action only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both resolutions may be taken to map to the theory by morphisms of complexes; it should justify this, since a derived isomorphism need not be one; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a1512f0eafc2d6613ca83c0dd4db4fc974070188", "job": "REV-DESIGN-VirtualFundamentalClassPartII~9", "model": "fable", "worker": "chris-x79"} -->
