<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6799848377 -->
Review (claude) of 9c9499f

Verdict: needs_changes

1. **F01** (P2) the proper-cover hypothesis holds for every stack; the Check saying otherwise is refuted

   - **Location.** `packages/VirtualFundamentalClassPartII/design/README.md` lines 429–435 (1.1, fourth
     Check): "The hypothesis is not automatic. … The classifying stack `B_{𝔸¹}G` … has no proper cover
     by a separated scheme `X`". Also Convention 3 (lines 150–157) and every "with a proper cover".
   - **Claim.** Some stack of Convention 1 has no proper cover, with `B_{𝔸¹}G` as the example.
   - **Witness.** The Zariski cover `𝔸¹ ⊔ 𝔸¹ → L` of the doubled-origin line is a `G_L`-torsor
     (`Q ×_L Q = Q ⊔ Q|_{t≠0}`); its classifying map `L → B_{𝔸¹}G` is finite étale of degree `2`.
     In general: rydh2015 lines 81–85; kresch1999b lines 309–315.
   - **Why it matters.** The Check only excludes separated `X`, which is excluded for every
     non-separated stack (the second Check of 1.1 proves exactly this for `L`). By rydh2015 Theorem B
     every quasi-compact Deligne–Mumford stack with quasi-compact separated diagonal has a finite
     surjective cover by a scheme, so "stack with a proper cover" is every stack of Convention 1, and
     the split "Layers 2–3 need no proper cover, Layer 4 onwards needs one" separates nothing.
   - **Repair.** (a) Replace the fourth Check of 1.1 by the computed cover: `L → B_{𝔸¹}G` is finite
     étale of degree `2 = e(B_{𝔸¹}G) · [k(t) : k(t)]`, so this non-separated stack with non-finite
     inertia has a proper covering. (b) Add to 1.1 the target: every stack of Convention 1 has a finite
     surjective morphism from a scheme, étale over a dense open (rydh2015 Theorem B, lines 81–85; the
     Noetherian Deligne–Mumford case is attributed there, lines 86–87, to Laumon–Moret-Bailly). (c)
     Remove "with a proper cover" / "admitting a proper cover" as a hypothesis from the Summary,
     Scope, Conventions 3 and 7, and Layers 4–8 (including "assume `X′` has a proper cover" in 8.2),
     keeping proper covers as the tool of the proofs. Tested on the refuting instance: `B_{𝔸¹}G` then
     falls under Layer 4 through `L`, with `deg(L/B_{𝔸¹}G) = 2`.

2. **F02** (P2) Poincaré duality in 5.1 needs `T` separated

   - **Location.** README lines 914–918 (5.1): "For a smooth separated stack `ℳ` of pure dimension and
     a representable `t : T → ℳ`, prove Poincaré duality for the bivariant groups of
     VirtualFundamentalClass §2.5 … `A^*(T → ℳ) ≅ A_*(T)_ℚ`".
   - **Claim.** Evaluation `α ↦ α[ℳ]` is defined and bijective for every representable `t`.
   - **Witness.** `t : L → 𝔸¹` (doubled-origin line) is representable and étale. VirtualFundamentalClass
     §2.5 acts only on "separated … test stacks whose pullbacks are separated"; the pullback of the
     test `id_{𝔸¹}` is `L`, so `α[ℳ]` is undefined.
   - **Repair.** State it for `t` representable and separated (equivalently `T` separated). Add the
     instance as a negative-control Check. vistoli1989 Proposition 5.6 (lines 1719–1750) has no such
     restriction because its bivariant groups are tested on all schemes; the README's Scope excludes
     bivariant groups with non-separated test objects, so the restriction is forced here.

3. **F03** (P2) the rank formulas of 9.5 and 6.3 need pure dimension

   - **Location.** README lines 1541–1545 (9.5): "`rk E = χ(C_t, F_t^*T_X) = δ + dim X · (1 − g)`"; the
     same formula in the Summary (line 29). README lines 1139–1140 (6.3): "`Ob` … is locally free of
     rank `s := dim X − d − r` and `[X/𝔜, E]^vir = c_s(Ob) ∩ [X]`".
   - **Claim.** Both hold for the `X` of 9.1 (smooth quasi-projective) and of Convention 7.
   - **Witness.** 9.5: `X = Spec k ⊔ ℙ¹`, `C = ℙ¹`, constant map to the point: `F^*T_X = 0`, `rk E = 0`,
     formula gives `0 + 1·(1 − 0) = 1`. 6.3: `X = pt ⊔ 𝔸¹` over `k`, `E = 0` on `pt`,
     `[O --0--> Ω]` on `𝔸¹`: `r = 0`, `s = 1`, `c_1(0) ∩ [pt] = 0 ≠ [pt]`.
   - **Repair.** 9.1/9.5 and the Summary: take the target smooth quasi-projective of pure dimension
     (or write `rk F^*T_X` on the open and closed substack where it is constant). 6.3: put
     `s := rk Ob`, locally constant, as behrend-fantechi1997 line 1710 does, and state
     `s = dim X − d − r` when `X` has pure dimension. On the two instances the repaired formulas give
     `rk E = 0` and `c_0(Ob) ∩ [pt] = [pt]`.

4. **F04** (P2) reducedness in Layer 8 is specific to one construction

   - **Location.** README lines 1263 and 1293 (8.1: "`Y` be a reduced algebraic stack of pure
     dimension"; "The reducedness of the ambient is used by Vistoli's construction"), 1317–1318 (8.2:
     "with `𝔜` reduced"), 1351 (8.3: "when `𝔜` is reduced"), 1373 (8.4: "`𝔐` a reduced algebraic
     stack").
   - **Claim.** Regular-immersion pullback, functoriality and deformation invariance need a reduced
     base.
   - **Witness.** kresch1999b Proposition 2.3 (lines 242–243) gives the rational equivalence for
     arbitrary local immersions of Artin stacks, compatible with smooth pullback (lines 36–37, 404).
     Non-reduced instance: `𝔜 = 𝔸¹ × Spec k[ε]/(ε²)`, `X = 𝔜`, `E = 0`, `𝔜′ = {t = 0}`:
     `v^!(2·[𝔸¹]) = 2·[pt] = [𝔜′]`.
   - **Why blocking.** The hypothesis comes from the route (vistoli1989 Lemma 3.16 normalises a
     blow-up), not from the theorem, and behrend-fantechi1997 states Proposition 7.5 in a setting whose
     base is only pure-dimensional (lines 1645–1647, 1734–1736). A source in the manifest supports the
     statement without it.
   - **Repair.** In 8.1 construct `β(Y′, X)` on any ambient of pure dimension from kresch1999b
     Proposition 2.3 and its compatibility with smooth pullback (citing vistoli1989 Lemma 3.16 as the
     reduced case), keep the relative-invariance argument through `Y ×_𝔅 Y` unchanged, and delete
     "reduced" from 8.1–8.4, the Summary and the Scope. Replace the third Check of 8.1 and the fourth
     of 8.2 by the instance above (both sides `2·[pt]`). If the fix worker finds a step of the
     invariance argument that does need reducedness, state that step and the hypothesis in 8.1 only,
     with the instance that fails.

5. **F05** (P3) 4.2 calls `ℱ ×_𝒢 Y` a scheme

   - **Location.** README line 810 (4.2): "where `f^![Y]` is 3.5's class on the scheme `ℱ ×_𝒢 Y`".
   - **Witness.** Convention 2: representable means by algebraic spaces. `X := 𝔸¹_ℂ/(z ∼ z̄ for z ≠ 0)`
     is étale over `𝔸¹_ℝ`, a regular local immersion of codimension `0`, and not a scheme (residue
     field `ℂ` at the origin, function field `ℝ(t)`).
   - **Repair.** "on the algebraic space `ℱ ×_𝒢 Y`"; 3.5 and 3.2 already cover it.

6. **F06** (P3) 3.2: the norm alone is off by the stabiliser ratio; add the Check

   - **Location.** README lines 661–663 (3.2): "carries `∂W_i(ℱ)` into `∂W_i(𝒢)` through the norm on
     rational functions".
   - **Witness.** `f : 𝔸¹ → 𝔸¹ × BG`, `φ = t`: `f_* div(t) = |G|·[0 × BG]`, while
     `div(N(t)) = div(t) = [0 × BG]` since `k(𝔸¹) = k(𝔸¹ × BG)`.
   - **Repair.** State `f_* div(φ) = (e(f(𝒱))/e(𝒱)) · div(N(φ))` when `dim f(𝒱) = dim 𝒱` (the ratio is
     an integer for representable `f`), and add the instance as a Check. vistoli1989 lines 998–1011
     define the pushforward of rational equivalences on atlases, which gives this factor.

7. **F07** (P3) 7.2 condition 3 quantifies over all `T̄`; 9.3 verifies it only for affine `T̄`

   - **Location.** README line 1224 (7.2): "for every square-zero extension `T → T̄` over `𝔜`"; lines
     1415–1416 and 1488–1489 (9.1, 9.3): "with `T̄` affine".
   - **Witness.** 9.3 proves condition 3 for affine `T̄` only and concludes condition 1; as stated,
     7.2 gives (3) ⇒ (1) only from the unrestricted condition.
   - **Repair.** In 7.2 add: condition 3 for affine `T̄` already implies 1 (the route for (3) ⇒ (1),
     lines 1230–1232, uses only affine extensions; behrend-fantechi1997 lines 1605–1614 does the same).

8. **F08** (P3) 9.1: "representable" must be "representable by schemes", or the families étale-local

   - **Location.** README lines 1410–1412 (9.1): "a representable morphism whose base change to every
     scheme `T → 𝔅` is a prestable family (`TauCeti.AlgebraicGeometry.PrestableFamily`…)".
   - **Witness.** `PrestableFamily` is a class on a morphism of `Scheme`
     (`TauCeti/AlgebraicGeometry/Curves/Prestable.lean` line 45), while Convention 2 makes
     "representable" mean by algebraic spaces, for which `𝒞_T` need not be a scheme.
   - **Repair.** Either say "representable by schemes", or (more general, and enough for the route of
     9.2, which works on affine étale charts) ask that `𝒞_T → T` be a prestable family étale locally on
     `T`. Say which in one clause.

9. **F09** (P3) 8.3, second case: the route does not name the step that replaces the intermediate theory

   - **Location.** README lines 1357–1359 (8.3): "formed in the ambient `Z′ ×_𝔜 Z ×_𝔜 W` of the graph …
     so that only the compatibility over `v` is used".
   - **Witness.** A compatibility datum over the graph needs a lift `g^*Ω_{Z′/𝔜} → F`; its obstruction
     lies in `Ext¹(g^*Ω_{Z′/𝔜}, u^*E)` and dies only in `Ext¹(g^*Ω_{Z′/𝔜}, u^*L_{X/𝔜})`. So the route
     must compare cones without it.
   - **Repair.** Add to 8.3 an API bullet stating the comparison the route uses: on a chart, the
     quotient `[N × u^*C_{X/Z×W}/(T_{Z′/𝔜} ⊕ T_{W/𝔜})]` (with `N = v^*T_{Z/𝔜}`, so that
     `[N/T_{Z′/𝔜}] = 𝔑_{Z′/Z}`) maps to `𝔉 ×_{u^*𝔈} u^*𝔠_{X/𝔜}` compatibly with the exact sequence
     `𝔑_{Z′/Z} → 𝔉 → u^*𝔈` of VirtualFundamentalClass §8.1, carrying `[N × 𝔠_{X′/𝔜}]` to the class
     whose zero-section pullback is `[X′/𝔜, F]^vir`. I checked the chart geometry (`X″ ∩ Y′ = X′`,
     ranks) and not the gluing.

10. **F10** (P3) 1.2 API: `deg(I_𝒱/𝒱)` is not a degree in the sense of 1.3

   - **Location.** README line 458: "`e(𝒱) = deg(I_𝒱/𝒱)` in the sense of 1.3".
   - **Witness.** 1.3 defines `deg` for integral sources. For `G = ℤ/2` constant,
     `I_{BG} = BG ⊔ BG` is not integral; the two components have degrees `1 + 1 = 2 = e(BG)`.
   - **Repair.** "`e(𝒱)` is the sum of `deg(ℐ/𝒱)` over the irreducible components `ℐ` of
     `(I_𝒱)_red` dominating `𝒱`"; add the instance as a Check.

11. **F11** (P3) 8.1 cites VirtualFundamentalClass §1.6 for a relative tangent action

   - **Location.** README lines 1275–1276 (8.1): "the action of `T_{Y/𝔅}|_{X′}` … through the
     `T_{Y/𝔅}`-action on `C` (VirtualFundamentalClass §1.6)".
   - **Witness.** VirtualFundamentalClass §1.6 states "the action of `T_M|_X` on `C_{X/M}`" for a
     smooth ambient; the relative tangent action on charts is the API of its §9.1.
   - **Repair.** Cite "VirtualFundamentalClass §§1.6, 9.1" there and in the *Needs:* line of 8.1.

12. **F12** (P3) 5.4 does not say how it differs from VirtualFundamentalClass §2.1

   - **Location.** README lines 1007–1014 (5.4): "Let `ℳ` be proper over `k`; it is separated …
     `∫_ℳ [𝒢_x] = [κ(x) : k]/|Aut(x̄)|`".
   - **Witness.** VirtualFundamentalClass §2.1, API: "Compute degrees of proper zero-cycles, with the
     generic stabilizer weight"; §7.7 defines the virtual degree. 5.4 removes no hypothesis of either.
   - **Repair.** Define `∫_ℳ` as VirtualFundamentalClass §2.1's degree (under 4.4) and state in one
     clause what 5.4 adds: the closed formula with the residue degree `[κ(x) : k]` over an arbitrary
     field, and `∫_ℳ = ∫_M ∘ p_*`.

13. **F13** (P3) six definitions have no API list

   - **Location.** README 3.1 (*flatPullback*, line 640), 3.2 (*properPushforward*, 659), 3.4
     (*exteriorProduct*, 702), 3.5 (*refinedGysin*, 729), 4.1 (*rationalPushforward*, 779), 4.2
     (*stackGysin*, 809).
   - **Witness.** Each goes from its "Prove" sentence straight to `**Checks.**`; the sibling
     definitions (1.1–1.3, 2.1, 2.2, 4.3, 5.x) carry `**API.**` bullets.
   - **Repair.** Add an `**API.**` list to each, moving the functoriality, restriction and
     compatibility facts now inside the prose into bullets.

13 findings, 4 blocking (R01–R04, all P2), 9 non-blocking (P3). No previous review. The design is
careful and its locators are accurate; the blocking findings are four hypotheses that are either
always true (R01), missing (R02, R03) or specific to one construction (R04).

Dependency check output:

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 207 roadmaps, 1915 edges, 0 problem(s)

No UPWARD or CYCLE line. This is a design: there is no `Suggested.lean`, so nothing was elaborated
and the padding probe does not apply.

## Maintainer notes

None of the six stands as a finding against this text.

1. Words: satisfied. Convention 2 (lines 141–148) uses "local immersion" for the class and "local
   embedding" for the chart pair, and gives Vistoli's words once.
2. Cotangent complex: satisfied. Convention 6 (lines 187–192) defines no truncated complex; 9.3
   builds `φ` into the full `L_{M/𝔅}` from the projection formula and the trace.
3. Integral and rational groups: satisfied. 2.3, third bullet, and 4.4 are the comparison.
4. Invariance: the claim "the owner's text names no acting group" is refuted at the owner's head:
   VirtualFundamentalClass §2.5 states invariance under "`T_{Y′}|_{X′}` of Kresch, Theorem 3.1" and
   the plane negative check. This README imports both and adds the relative form (8.1).
5. Functoriality: 8.3 does use the graph, without an intermediate theory; see R09.
6. Suppliers: satisfied. No AlgebraicVectorBundles or EllipticCohomology citation; the suppliers
   are VirtualFundamentalClass, SchemeAndStackFoundations, EquivariantIntersectionTheory,
   StableReductionPartII, StableReduction, EnhancedDerivedSheaves, DerivedModuleAlgebra, each by
   section.

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. 4: `A_0([𝔸¹/μ₂]) ≅ ℤ/2` | `div(y) `, `div(P(y))`, `P` inseparable in char `p ≠ 2` | `ord_0(x²) = 2`; `K[x]/(x² − θ)` étale over `K = k[y]/P`, so coefficient `1` | holds | none |
| Conv. 6 witnesses | elliptic `C`; `[O(1) → Ω]` on `ℙ¹` | `Hom(O[1], O[2]) = H¹(O) = k`; `rk = 0`, `Ob = O(−1)`, degree `−1` | holds | none |
| 1.1 fourth Check | `X = L` over `B_{𝔸¹}G` | `Q = 𝔸¹ ⊔ 𝔸¹`, `Q ×_L Q = Q ⊔ Q_{t≠0}`; `L ×_{BG} 𝔸¹ = Q → 𝔸¹` finite of degree `2` | refuted | R01 |
| 1.2 `e`, `k(𝒱)` | `[Spec ℂ/(ℤ/4)]` over `ℝ`; `B_{𝔸¹}G` | `k = ℝ`, `e = 2`; `e = 2` with trivial stabiliser at `0` | holds | R10 (API wording) |
| 1.3 degree formula | `pt → BG`, `BG → pt`, `BH → BG`, `Spec ℂ → 𝒢`, `ℤ/p`-quotient | `|G|`, `1/|G|`, `[G:H]`, `2·2 = 4`, `(1/p)·p = 1` | holds | none |
| 1.3 base change | `𝔸¹_t → 𝔸¹_{t²}` along `(a,b) ↦ ab` | `{t² = ab}` integral, degree `2` on both sides | holds | none |
| 2.1 cycles, descent (sample) | `V(x²)` in `[𝔸¹/μ₂]`; `Z_i(X)` vs Tau Ceti | length `2`; `pointsOfDimension` uses `height` for specialisation = dimension of closure (`Chow/Basic.lean` lines 67–71) | holds | none |
| 2.3 `A_0(L)` | doubled origin | `ℤ²/ℤ(1,1) ≅ ℤ` | holds | none |
| 3.1 integrality for non-representable flat `f` | `BG → pt`; coarse map of `[𝔸¹/μ₂]` | `[pt] ↦ [BG]`; `[0] ↦ 2·[Bμ₂] = 0` in `ℤ/2`, and `[0] = 0` in `A_0(𝔸¹)` | holds | none |
| 3.2 pushforward (sample) | `pt → BG`; `𝔸¹ → 𝔸¹ × BG`, `φ = t` | `π_*[pt] = |G|·[BG]`; `f_*div(t) = |G|·[0×BG]` vs `div(N t) = [0×BG]` | statement holds, route wording off by `e` ratio | R06 |
| 3.3 push–pull, localisation (sample) | `π` against `π`; `Bμ₂ ⊂ [𝔸¹/μ₂]`; two points in `ℙ¹` | `|G|` both sides; `ℤ → ℤ/2 → 0 → 0`; kernel `ℤ(1,−1)` | holds | none |
| 3.4 exterior product (sample) | `K/k` separable degree 2; purely inseparable degree `p`; `BG × BH` | two points of degree 2 (`4 = 2+2`); `p·[Spec K]` (`p² = p·p`); `[B(G×H)]` | holds | none |
| 3.5 refined Gysin (sample) | zero section of `O(−1)`; `{0} → 𝔸¹` along `z²`; `pt → BG` | `−[pt]`; `2·[pt]`; `[G]`, pushing to `|G|·[pt]` | holds; `X` quasi-separated since unramified diagonal is an open immersion into a Noetherian space | none |
| 4.1 rational pushforward (sample) | `pt → BG → pt`; coarse map; `L × B(ℤ/2) → L` | `|G|·(1/|G|) = 1`; `2·(1/2)·[0] = [0]`; `(1/2)·[0₁]` | holds | hypothesis automatic (R01) |
| 4.2 stack Gysin | `π : pt → BG` with `Y = pt`; `𝔸¹_ℂ/∼ → 𝔸¹_ℝ` | `|G|^{−1}·|G|·[pt] = [pt]`; fibre product not a scheme | holds; wording | R05 |
| 4.3 Chern classes | `L ⊕ L^∨`; `BG`; `O(−1)` on `ℙ¹` | `c_1 = 0`, `c_2 = −c_1(L)²`; `A_{−i}(BG) = 0`; `−[pt]` | holds | none |
| 5.1 product, Poincaré duality (sample) | `[ℙ¹/μ₂]`; `T = L → 𝔸¹` | `[𝒫]·[𝒫] ∈ A_{−1} = 0`; pullback of test `id` is `L`, not separated | product holds; duality lacks a hypothesis | R02 |
| 5.2 moduli spaces | `BG`; `[𝔸¹/μ₂]`; `ℤ/p`-quotient | `1/|G|`; `(1/2)·[0]`; `1·[p(𝒱)]` with `e = p` | holds | none |
| 5.3 Edidin–Graham ring (sample) | `μ_n` on a point; `𝔾_m` on `𝔸² ∖ 0` weights `(1,2)` | `ℤ[t]/(nt) ⊗ ℚ = ℚ`; `ℤ[t]/(2t²)`, `∫t = 1/2`, `∫2t = 1` | holds; StableReductionPartII §5.15 states the group comparison as cited | none |
| 5.4 point degrees (sample) | `BG`; `Spec K`; real gerbe; `[ℙ¹/μ₂]` | `1/|G|`; `[K:k]`; `1/2 = 2/4`; `∫(2[𝒫]) = 1 = ∫[𝒪]` for `div(t²/(t²−1))` | holds | R12 (ownership clause) |
| 6.1 comparison bundle | `E = [O(−4) → Ω]` on `ℙ¹` | `Hom(E,E) = k ⊕ k ⊕ H¹(O(−2))`; extension of `O(4)` by `O(2)` nonsplit = `O(3)²`; ranks `1 + 1` | holds | none |
| 6.2 virtual class | same; `[O(1) → Ω]`; `𝓛_n` on `L` | `c_1(O(3)²/O(2)) = 4 = c_1(O(4))`; `−1`; `n·[0₂] ≠ 0` in `ℚ` | holds | hypothesis automatic (R01) |
| 6.3 formulas | `k[x]/(x^p)` in char `p`; node × `ℙ¹`; `pt ⊔ 𝔸¹` | `[X] = p·[pt]` vs `c_1(Ob) = 0`; `−[𝔜 × pt]`; `c_1(0) ∩ [pt] = 0 ≠ [pt]` | second formula fails without pure dimension | R03 |
| 7.1 obstruction class | `k[x]/(x²)`, `x ↦ ε` into `k[ε]/(ε³)`; `pt → B𝔾_m` | `(ε + aε²)² = ε² ≠ 0`; torsor under `1 + J ≅ J` | holds | none |
| 7.2 equivalences | cone `C` of `φ`; char 2, `φ = (0, id)` | `Hom(g^*C, J[i]) = 0` for `i ≤ 1`; `φ^*ω = 0` yet `(x + ax²)² = x²` | holds | R07 (affine form) |
| 8.1 invariance | plane example through `p = y` and `p = x` | `ν/η` fixed by `ξ ↦ ξ + a`; moved by `η ↦ η + b`; `p_1^{−1}Y′ = p_2^{−1}Y′` in `Y ×_𝔅 Y` | holds | R04, R11 |
| 8.2 regular pullback (sample) | node, `V(a+b)`; non-reduced `𝔸¹ × Spec k[ε]/(ε²)` | `−2·[pt × pt]` both sides; `2·[pt]` both sides | holds, also off the reduced case | R04 |
| 8.3 functoriality (sample) | graph ambient; lift of `g^*Ω_{Z′}` to `F` | `X″ ∩ Y′ = X′`; obstruction in `Ext¹(g^*Ω_{Z′}, u^*E)` | statement as in the source; route step unnamed | R04, R09 |
| 8.4 deformation invariance (sample) | `x² − by²` on `ℙ¹ × 𝔸¹`; `{xb = 1}` | count `2` for every `b` (also `b` a non-square, one point of degree 2); `1` vs `0` | holds | R04 |
| 9.1 relative space of maps (sample) | `X = pt`; `M = pt`, `F = id_{ℙ¹}` | formally étale; `H⁰(T_{ℙ¹}) = k³ ≠ 0` | holds | R08 |
| 9.3 obstruction theory (sample) | `ℙ¹ → ℙ^r` degree `d`; translates on an elliptic curve | `χ = (r+1)(d+1) − 1`; `Ob` trivial, class `0`, virtual dimension `0` | holds | R07 |
| 9.4 global resolutions (sample) | `G = π^*π_*(V ⊗ L^N) ⊗ L^{−N}`; `L = O` on genus `≥ 1` | `π_*G = π_*(V ⊗ L^N) ⊗ π_*L^{−N} = 0`; `[0 → R¹π_*O]` misses `H⁰` | holds | none |
| 9.5 rank and dimension | lines in `ℙ²`; `X = pt ⊔ ℙ¹` | `3·1 + 2 + 0 − 3 = 2`; formula `1`, true rank `0` | fails without pure dimension | R03 |

## Verified sound

- **Shape.** 9 layers, 33 targets, 115 Checks (every target has at least 3); every layer ends with
  Examples and Dependencies; every target has a *Needs:* line and a locator. No LaTeX delimiters,
  no process words, no pull-request numbers, no machine paths. Layer titles are mathematical and
  the order is forced by the dependency lines (Chow lane 1–4, comparisons 5, virtual classes 6,
  obstruction classes 7 independent of 1–5, base change 8, maps from curves 9).
- **Pinned declarations opened (13).** Mathlib: `AlgebraicGeometry.AlgebraicCycle`
  (`AlgebraicCycle/Basic.lean` line 44), `AlgebraicCycle.map` (line 69), `Scheme.ord`
  (`OrderOfVanishing.lean` line 52, with `ord_eq_zero_of_coheight_neq_one` line 61 and `ord_zero`
  line 65, as the README says). Tau Ceti: `Chow.cyclesOfDimension` (`Chow/Basic.lean` line 86),
  `RatEquiv` (257), `ChowGroup` (295), `cycleClass` (304), `ChowGroup.equivIntOfUnique` (369),
  `ChowGroup.pushforward` (`Chow/ClosedImmersion.lean` line 211), `SchPseudofunctor`
  (`Stack/Basic.lean` line 37), `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean`),
  `PrestableFamily` (`Curves/Prestable.lean` line 45), `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree`
  (`VectorBundle/Degree.lean` line 82).
- **Cross-roadmap citations resolved.** VirtualFundamentalClass at its open head: §§0.2–0.3,
  1.4–1.6, 2.1–2.5, 3.1–3.5, 4.1–4.5, 5.1–5.5, 6.1–6.6, 7.1–7.7, 8.1–8.5, 9.1–9.6 all exist with
  the content the contract states (the Kresch invariance and the plane check are in §2.5; base
  change of relative theories is in §6.4). SchemeAndStackFoundations on main: all 22 cited
  sections and all 26 cited names found (the same 22 headings exist at both open revisions);
  §5.5's `z ↦ z²` Check and §5.6's doubled-origin Check exist; §5.5's Gysin maps are for regular
  immersions that need not be closed, as stated. StableReductionPartII §5.15 states the
  Edidin–Graham comparison with the hypotheses the contract quotes. EquivariantIntersectionTheory
  Conventions 1, 4, 5 and §§2.1–2.2; StableReduction Layers 2–3; EnhancedDerivedSheaves §0.3, E1.4,
  E1.8; DerivedModuleAlgebra §§0.7, 0.12, 0.25; AlgebraicGromovWittenTheory §§4.1–4.3: all exist.
- **Supplier order.** Every supplier is on main or earlier in the merge order, or an open pull
  request adding a new folder (VirtualFundamentalClass). AlgebraicGromovWittenTheory is named only
  as a consumer. No never-cite roadmap is cited.
- **Declared gap.** `gap:closed-substacks-of-stacks` has the same slug in `plan.json` and in the
  README's contract, a named supplier and section, and asks for one theory with its hypotheses. No
  roadmap on main or in an open pull request states closed substacks of stacks in general (searched
  by object). Precise, minimal, declared.
- **Duplication.** Searched main and the open heads by object (Vistoli's groups, finite covers by
  schemes, deformation invariance, `Rπ_*f^*T`, Kodaira–Spencer). Apart from R12, each target states
  the hypothesis of VirtualFundamentalClass or AlgebraicGromovWittenTheory it removes.
  `scratch/overlaps.md` lists no dropped id, no conflicting head and no revision-only id.
- **Source locators (sampled targets and flagged OCR lines).** vistoli1989: lines 299–328, 347–376,
  422–430, 485–507, 542–584, 887–1123, 1172–1207, 1594–1776, 2064–2066, 2109–2112 carry the cited
  statements; its line 963–966 confirms that its §3 results are integral. behrend-fantechi1997:
  lines 781–897, 1261–1262, 1299–1320, 1397–1399, 1583–1739. kresch1999b: 232–234, 242–243,
  309–315, 321–343, 390–405. behrend1997: 139–197. li-tian1998: 1472–1474, 1566, 1585–1586.
  edidin-graham1998: 758–759, 790–798. keel-mori1997: 28. deligne-mumford1969: 1012–1019.
  stacks-chow: 1356. stacks-chow-spaces: 57–61, 126–133, 169, 516, 667, 797–818, 1986–1990, 2224.
  Every one matches the theorem number and the hypotheses quoted.
- **Sources manifest.** Every work the README cites has one key. `rydh2015` was added by the
  sources service for R01.

## Not verifiable

- gillet1984 §4 and fulton1998 (five locators): recorded as uncertified, cited by locator only.
- Laumon–Moret-Bailly, Theorem 16.6: not in the manifest and not read; R01 rests on rydh2015
  Theorem B and on the explicit cover, both read.
- vistoli1989 Lemma 4.6 (lines 1451–1470) and lines 96–99, 232–269, 1610–1613 were not opened: they
  are outside the sample.
- The full route of 8.3, second case, and the gluing in 8.1–8.2: checked on charts only (R09).
- That every step of the relative-invariance argument of 8.1 survives without reducedness (R04):
  the construction is in kresch1999b; the invariance over a non-reduced base is not in a source I
  read, only its statement in behrend-fantechi1997's setting.
- Elaboration: not available in this lane, and there is no Lean file at the design stage.
- Ownership against open pull requests was checked through the roadmaps tool (search by object);
  packages on the board that live only on other pull requests' branches were not opened.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–897: the source says Vistoli's rational equivalence is invariant under the whole pulled-back tangent bundle of the ambient; it should be invariance under the tangent bundle of the regularly embedded smooth stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both global resolutions may be taken to map to the obstruction complex by morphisms of complexes; it should justify this, since an isomorphism in the derived category need not be so represented; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, lines 331–336: the source says the acting bundle is the tangent bundle of the arbitrary locally immersed stack; it should be that of the smooth regularly immersed one, as its proof uses; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9c9499fd64f8933a4e647baa65cdb272c642005f", "job": "REV-DESIGN-VirtualFundamentalClassPartII", "model": "fable", "worker": "chris-x8"} -->
