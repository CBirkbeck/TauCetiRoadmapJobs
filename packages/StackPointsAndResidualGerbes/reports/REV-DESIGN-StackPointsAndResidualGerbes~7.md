<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16357#issuecomment-6894981562 -->
Review (claude) of e83b613

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 5.4 states the gerbe over an integral scheme only under quasi-compact diagonal

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1444`–1447 and the plan's
   target 5.4. Quote: "if `𝒳` has quasi-compact diagonal and `ξ ∈ |𝒳|`, there is a quasi-compact
   immersion `𝒵 → 𝒳` … `𝒵` is a gerbe over an integral affine scheme `Z`".

   **Claim:** the spreading-out of the residual gerbe to a gerbe over an integral scheme is planned
   only at Rydh's hypothesis.

   **Witness:** stacks-06RD lines 4786–4807 (Definition 101.50.1, Lemma 101.50.2, printed pp.
   100–101) gives an open substack that is a gerbe over an integral scheme for every reduced,
   irreducible, decent stack with quasi-compact inertia.

   **Exact repair, tested:** keep the present statement (quasi-compact immersion, quasi-affine
   `𝒵_ξ → 𝒳`) under quasi-compact diagonal, and add before it: "if `𝒳` is decent, `I_𝒳 → 𝒳` is
   quasi-compact and `ξ ∈ |𝒳|`, the reduced closure of `ξ` has an open substack `𝒵 ∋ ξ` that is a
   gerbe over an integral affine scheme `Z` with generic point the image of `ξ`, and
   `𝒵_ξ = 𝒵 ×_Z Spec κ(ξ)` (stacks-06RD lines 4790–4807, Lemma 101.50.2; 3.4's pullback formula)".
   The route is the one 5.2 already writes: steps 1–2 keep decency and quasi-compact inertia, the base
   of the dense open gerbe is decent (5.1) and reduced (0.1), and a decent algebraic space has a dense
   open subscheme (stacks-decent-spaces lines 1094–1096, Theorem 68.10.2). Declare that last input as
   a gap on SchemeAndStackFoundations §1.7 beside gap:decent-algebraic-spaces; the present
   gap:quasi-separated-space-schematic-locus is its quasi-separated case.
   Test: let `X` be the scheme of 5.1's fourth Check (two copies of `Spec k[x₁, x₂, …]` glued along
   `⋃ D(xᵢ)`) and `ξ` its generic point. `X` is reduced, irreducible, decent, with trivial inertia,
   and its diagonal is not quasi-compact, so the present 5.4 says nothing; the added statement gives
   `𝒵 = Z = Spec k[x₁, x₂, …]` and `𝒵_ξ = Spec k(x₁, x₂, …) = 𝒵 ×_Z Spec κ(ξ)`. On `[𝔸¹/𝔾_m]` both
   statements give `B𝔾_m` over `Spec k` at `0` and `Spec k` at `1`.

2. **F02** (P3) two *Needs* lines omit inputs their statements use

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1513`–1515 (6.1) and 1773–1775
   (7.4), with the plan's prerequisites of 6.1 and 7.4 and the `neededBy` of
   gap:stack-morphism-permanence. Quote (6.1): "*Needs:* 0.2, 3.2, 3.4, 4.1; 2.4 and 5.3 …;
   SchemeAndStackFoundations §1.14 (`stabilizer`), §1.21; gap:flat-groupoid-quotients."

   **Claim:** these lists carry everything 6.1 and 7.4 use.

   **Witness:** 4.1 treats only `u`, a closed point of an affine smooth chart. For an arbitrary
   locally finite type `x`, 6.1 needs base change and cancellation of local finite type (Lemma
   101.17.8, stacks-06RD line 1527): gap:stack-morphism-permanence. 7.4's "`G_x` is the stabiliser
   `Stab_G(x)`" is 1.3's presentation bullet.

   **Exact repair, tested:** add gap:stack-morphism-permanence to the *Needs* of 6.1 (and 6.1 to that
   gap's `neededBy`), and 1.3 to the *Needs* of 7.4, in README and plan. Both are earlier, so no
   cycle. Test: `𝒳 = B𝔾_m` over `ℚ` and `x` the trivial torsor over `k = ℚ(√2)`; `x` is locally of
   finite type as a composite, `R_x = 𝔾_m × Spec(k ⊗_ℚ k)` (two components) is locally of finite type
   over `Spec k` as a base change, and `G_x = 𝔾_{m,k}` is its diagonal part: each step is a clause of
   the gap or of 1.3. This is the pattern of round-6 R05, which the repair fixed for 2.4 and 5.3 only.

3. **F03** (P3) the consumer list names two roadmaps whose texts do not use this one

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1826`–1827 and the plan's
   `consumers`. Quote: "**EquivariantIntersectionTheory** and **GroupSchemesOverABase**: stabilisers
   and `BG_x` at closed points of quotient stacks, through 1.3, 6.4 and 7.4."

   **Claim:** both roadmaps consume 1.3, 6.4 and 7.4.

   **Witness:** `TauCetiRoadmap/EquivariantIntersectionTheory/README.md` on main has no "residual",
   "closed point" or `BG_x`; its stabilisers (lines 525, 561) are in Checks. GroupSchemesOverABase at
   its open head never says "quotient stack". A roadmap on main consumes only main.

   **Exact repair, tested:** delete the bullet and the two plan entries. Narrow the
   MotivicStructuresInModuliOfCurves line to stabilisers (1.3, 7.4): its board design speaks of
   stabilisers (lines 883, 1791) and nowhere of residual gerbes. Test: the remaining lines resolve —
   LanglandsParameterStacks §1.16 (lines 523–524, residual gerbe at a parameter),
   FunctionFieldArithmeticPartII (lines 53, 7366), VirtualFundamentalClasses §1.2 (board package,
   line 508). This is the pattern the round-7 repair corrected for VirtualFundamentalClasses alone.

4. **F04** (P3) the scheme case of 0.4 restates SchemeAndStackFoundations §4.8 without citing it

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:644`–645. Quote: "For `𝒳` a
   scheme and `𝒵` the closed subscheme of an ideal sheaf, `𝒳^{[n]}_𝒵` is the closed subscheme of the
   `(n+1)`-st power ideal."

   **Claim:** the scheme-level infinitesimal neighbourhood has no earlier owner to agree with.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6660`–6661 (§4.8,
   *Scheme.formalCompletion X I*): "the infinitesimal neighbourhoods `V(I^{n+1})`, with
   `toScheme n : V(I^{n+1}) → X`", for `I : X.IdealSheafData`.

   **Exact repair, tested:** word the bullet as agreement: "for `𝒳` a scheme and `𝒵 = V(I)`,
   `𝒳^{[n]}_𝒵` is the `n`-th level `toScheme n` of SchemeAndStackFoundations §4.8's
   *Scheme.formalCompletion*", and add §4.8 to the *Needs* of 0.4 and to the supplier contract. Test:
   for `I = (t) ⊂ k[t]` the §4.8 level `n` is `V(t^{n+1})`, of length `n + 1`, the lengths `1, 2, 3` of
   0.4's first Check; at `n = 0` both give `V(I)`. The two indexings agree, so no convention changes.

Four findings, all P3 (no P1, no P2); each carries a repair, so the verdict asks for changes. The 16
declared supplier gaps are contracts and are not findings. All seven round-6 findings are repaired in this package. I changed no design file and added
nothing to the manifest; every text I needed was already in the cache. This lane does not
elaborate Lean, and the design package has no `Suggested.lean`.

## Verified sound

### Round-6 findings, one by one

| Round-6 finding | Repaired passage (README line) | Status |
|---|---|---|
| R01 (P1) fibre over the stack | 1551–1553: "the three products are `𝒵_x ×_{Spec k} Spec k ≃ BG` (the statement), `𝒵_x ×_𝒳 Spec k ≃ Spec k` and `Spec k ×_𝒳 Spec k = R_x = G`"; plan test `base_vs_fibre` | repaired |
| R02 (P2) kernel never quasi-coherent | 615–616: "the kernel of the same map among all modules need not be quasi-coherent; when it is not, it differs from `ℐ_𝒵`"; new Check 664–668; plan API and test `split_component` | repaired |
| R03 (P2) scheme-representable branch | 1332–1335: "either representable by schemes … or representable by algebraic spaces and quasi-separated"; Check 1353–1361; plan test `nonQuasiSeparatedScheme` | repaired |
| R04 (P3) zeroth power | 650–651: "its zeroth term being `V(ℐ⁰) = V(O_𝒳) = ∅` rather than `𝒵`" | repaired |
| R05 (P3) 6.1 prerequisites | 1513–1514: "2.4 and 5.3 (for the last API bullet: Lemma 101.28.10 (3) …)"; plan `target:2.4`, `target:5.3` | repaired; the same pattern remains for a gap in 6.1 and for 7.4 (R02 above) |
| R06 (P3) tangent base-change locator | 425–428: "Artin's Axioms, Lemma 98.7.1, lines 354–392 … Lemma 98.6.1 and Remark 98.6.2 … Formal Deformation Theory, Lemma 90.29.3" | repaired; I read stacks-artin lines 292–293, 323–326, 344–348, 354–362, 393–400 and stacks-formal-defos lines 3512–3516 |
| R07 (P2) second owner of closed substacks | 50–55: "owned here for every algebraic stack (0.3–0.5). VirtualFundamentalClasses §1.2 consumes them …"; consumer line 1820–1825 | repaired in this package; the other package still restates them (see the audit) |

No finding of the repair report is marked "not actionable in this package". The pattern searches of
the repairs gave R02 and R03 above; the products `×_𝒳`, `×_{BG}`, `×_{𝒵_x}` of Convention 5, 0.2,
1.3, 2.2, 3.5 and 6.1 were recomputed and are correct.

### Adversarial pass (values computed in this round)

`Bμ_p` is over a field of characteristic `p`; `X₀ = Spec ℚ(t)/ℤ`; `X₁ = U/G` is Example 100.11.6.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.3 immersions, presentation bijection | `[𝔸¹/𝔾_m]`; generic point of `𝔸¹`; `Spec k ⊔ Spec k` | invariant subschemes `{0}`, `𝔾_m` ↔ `B𝔾_m`, `Spec k`; `{η}` has complement the closed points, not closed, so no immersion; two equivalent substacks with different objects | holds |
| 0.4 ideals and neighbourhoods | `(t)` at the origin; `Spec(k × k)`; `(ε)`; `I = 0`, `I = (1)` | `QCoh` value at the origin `k·t → k` is `0`, all-modules kernel there `0`; split case both `0 × k`; lengths `1, 2, 3` against `0, 1, 2`; `(ε)² = 0`; `V(0) = 𝒳`, `V(1) = ∅` | holds; R04 note |
| 1.1 finite type points | `Spec ℤ_(p)` generic; `Spec ℚ̄ → Spec ℚ`; generic point of `𝔸¹_k`; arbitrary scheme, closed point | `ℚ = ℤ_(p)[1/p]` finite type; `[ℚ̄:ℚ] = ∞`, not finite type, same point as `id`; `k(t)` not finitely generated over `k[t]`; `Spec κ(u) → U` closed immersion, so (2) ⇒ (1) | holds |
| 1.3 `G_x` | `BS₃`; `Bμ_p`; `Bμ₃/ℚ`; finite Galois `Spec k → Spec κ` | non-abelian law kept (`(12)(23) ≠ (23)(12)`); `μ_p(k̄) = 1`, length `p`; `|μ₃(ℚ)| = 1`, `|μ₃(ℚ(ζ₃))| = 3`; `R_x = Γ × Spec k`, diagonal part trivial | holds |
| 1.4 schematic `G_x` | six cases of the source; `G = 𝔸¹/ℤ`, char 0; `Bℤ`; `B𝔾_m` | (1)⇒(4), (2)⇒(5), (3)⇒(6); diagonal of `G` pulls back to `⊔_ℤ 𝔸¹ → 𝔸²`, image dense and missing the generic point, so neither quasi-compact nor an immersion; `ℤ_k` étale, infinite; `𝔾_m` a scheme, not quasi-finite | holds |
| 2.1 gerbes and base | `BG`; `[𝔸¹/𝔾_m]`; `Spec k → BG`; `X → X` | base `Spec k`; objects `0, 1` not locally isomorphic; automorphisms of the trivial torsor do not lift for `G ≠ 1`; base `X` | holds |
| 3.4 properties | node; `X₀`; `[𝔸¹/𝔾_m] → Spec k` | `𝒵 = Spec k`, embedding dimension 0 against 2 for the node; `Spec ℚ(t) ×_{X₀} Spec ℚ(t) = ⊔_ℤ Spec ℚ(t)`, not finite, so the base is no field; pullback of `𝒵_y` is the whole two-point stack | holds |
| 4.1 / 1.1 headline | DVR generic point; generic point of `𝔸¹`; `X₁` | all three conditions true; all three false though `𝒵 = Spec k(t)` exists; `Spec ℚ̄ → X₁` closed immersion then étale, locally of finite type, so true on a non-Noetherian space | holds |
| 4.2–4.4 existence | `Bμ_p`; `Bℤ`; `X₀`; `[Spec k[x₀, …]/𝔾_m]`; `B(𝔸¹/ℤ)` | quasi-DM, not DM (`μ_p` length `p`, not unramified); gerbe with inertia `⊔_ℤ`; locally Noetherian, not decent; affine inertia, not Noetherian; inertia quasi-compact, not quasi-separated | each route covers a case the others miss |
| 4.3 formula | gerbe `𝒳 → 𝒳^♭` | `𝒳 ×_{𝒳^♭} 𝒵^♭_x` is smooth over the reduced `𝒵^♭_x`, so already reduced; agrees with 3.4's `𝒵_{π(x)} ×_𝒴 𝒳` | holds |
| 4.5 closed points | DVR; `[𝔸¹/𝔾_m]`; `X₁` | closed point ↔ `Spec R/𝔪` closed, generic ↔ `Spec K` open; `B𝔾_m` closed, `Spec k` open; point closed, `Spec ℚ̄ → X₁` not closed (else equal to `X₁` by 0.5) | holds; Noetherian hypothesis needed |
| 5.3 residue field | `𝔸¹_ℚ` at `t² + 1`; `[Spec ℂ/(ℤ/4)]`; `X₀` | `ℚ(i)`; base `Spec ℝ`, `H¹(ℝ, ℤ/4) = Hom(ℤ/2, ℤ/4) = {0, 2}`, both map to `0` in `H¹(ℝ, ℤ/2)`, so no real object; base `X₀`, not a field | holds |
| 5.4 algebraicity | `[𝔸¹/𝔾_m]`; generic point of `𝔸¹`; glued scheme of 5.1 | `B𝔾_m/Spec k`, `Spec k`; `Spec k(t) → 𝔸¹` affine, not an immersion; diagonal not quasi-compact, statement silent, Lemma 101.50.2 applies | holds; R01 |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; `k/κ` purely inseparable of degree `p` | no finite extension of `κ` receives `κ(t)` over `κ`, so no fppf cover factors; free of rank `p`, an fppf cover | holds |
| 6.1 presentation | `BG`; `Spec ℝ` at `ℂ`; `B𝔾_m/ℚ` at `ℚ(√2)` | `R_x = G`; `Spec(ℂ ⊗_ℝ ℂ)`, 2 points, stabiliser trivial; `𝔾_m × Spec(k ⊗_ℚ k)`, stabiliser `𝔾_{m,k}` | holds; R02 |
| 6.2 base change | `G = ℤ/2`, `μ_p`, `1`; `[Spec ℂ/(ℤ/4)]`; `X₀` | one-point stack with group of order 2, one point, two points; third product of length `p`; all `Spec k`; `B(ℤ/2)_ℂ`; `X₀ ×_{X₀} Spec k = Spec k = B1` | holds |
| 6.3 neutrality | `(t, −1)` over `ℚ(t)`; `X₀`; `B(ℤ/2)_ℝ` | residue at `t = 0` is `−1 ∉ ℚ^{×2}`, non-split; `(t², −1)` split, yet `σ : t ↦ t²` is not onto; identity section, no representative is an isomorphism; neutral | holds; both directions tested |
| 6.4 rational points | `Spec k[x₀, …]` at the origin; `Bμ_p`; `Spec k → Spec κ`, `k ≠ κ`; `[𝔸¹/𝔾_m]` at `1` | closed immersion, ideal not finitely generated, `𝒵 = Spec k`; `𝒵 = Bμ_p`, `G_x` not smooth; no section, `𝒵 = Spec κ ≠ Spec k`; rational, not closed, `𝒵_1` open | holds |
| 7.1 neighbourhoods | `𝔸¹`, `𝔸²`, `BG`; Artinian `A`, `𝔪^{n+1} = 0` | lengths `1, 2, 3`; `k[x, y]/(x, y)²` of length 3; ideal `0`; `(ℐA)^{n+1} ⊆ 𝔪^{n+1} = 0` | holds |
| 7.2 normal space, sign | `[𝔸¹/𝔾_m]`; `[𝔸ⁿ/GLₙ]`, `n = 0, 1` | `(λ·t)(a) = t(λ⁻¹a)`, conormal weight `−1`, normal `+1`; framed class `[v] ↦ [λv]` for `(τ, α∘g⁻¹)` and `[λ⁻¹v]` for `(τ, α∘g)`; `N = 0` for `n = 0` | holds; convention pinned |
| 7.3 exact sequence | `Bμ_p`, `Bα_p`, `B𝔾_m`, cusp, `[𝔸¹/𝔾_m]` | `(N, T, dim Lie − dim G)` = `(0, 1, 1)`, `(0, 1, 1)`, `(0, 0, 0)`, `(2, 2, 0)`, `(1, 1, 0)`; six-term sequence of the supplier exact at `T_U` and `T_W` | holds in characteristic 2 and 3 |
| 7.4 quotient stacks | `SL₂` on binary quadratics at `uv`, char ≠ 2; `𝔾_m` on `𝔸¹` at `1`; `t ↦ t^p` action | stabiliser the torus, orbit of dimension 2, `∂disc = (0, 2, 0) ≠ 0`, `N` trivial of dimension 1; orbit open, not closed; orbit `𝔾_m` smooth with stabiliser `μ_p`, `N = 0` | holds |
| gap:group-spaces-over-fields | three hypotheses | Proposition 79.10.3 with its footnote and Lemma 79.9.4 (decent ⇒ separated ⇒ scheme); Lemma 72.10.8 | the `needs` sentence is supported |
| worked example | `Bℤ`; `B(ℤ/2)` | `G_x = ℤ` étale, not finite, diagonal not quasi-compact; finite constant | hypothesis needed |

### Sources: the seeded sample

All fifteen targets were read at their locators; statements, hypotheses and numbering agree.

| Target | Text read | Result |
|---|---|---|
| 0.3 | stacks-04XE lines 765–801, 853–894 (Definitions 100.9.1, 100.9.9; Lemmas 100.9.2–100.9.6, 100.9.10–100.9.12; pp. 16–19) | agrees; Lemmas 9.6 and 9.10 have no proof there, as the README says |
| 1.1 | stacks-06RD lines 1545–1601 (Lemmas 101.18.1, 101.18.3–101.18.6, Definition 101.18.2; pp. 33–34) | agrees |
| 1.3 | stacks-06RD lines 1667–1674, 1690–1725, 497–508, 591–618 (Section 101.19, Remark 101.5.2, Lemmas 101.5.6–101.5.7) | agrees |
| 1.4 | stacks-06RD lines 1675–1689 (Lemma 101.19.1, p. 36); stacks-more-groupoids-spaces lines 373–375, 570–572; stacks-spaces-over-fields lines 834–856 | six cases, as stated |
| 2.1 | stacks-06QB lines 2613–2663 (Definition 101.28.1, Lemmas 101.28.2–101.28.5, pp. 56–57) | agrees |
| 3.4 | stacks-06ML lines 1300–1337; stacks-06RD lines 445–456; stacks-06QB lines 2846–2861; stacks-06RD lines 4831–4839; stacks-decent-spaces lines 1500–1540 | agrees |
| 4.1 | stacks-06RD lines 1609–1665 (Lemma 101.18.7 and proof, pp. 35–36) | agrees, including `[u/(u ×_𝒳 u)]` |
| 4.3 | stacks-06QB lines 2893–2904 (Lemma 101.28.15); stacks-06RD lines 3048–3056 (Lemma 101.31.1) | agrees |
| 5.3 | stacks-decent-spaces lines 1542–1552; alper-moduli lines 6962–6965, 16528–16537; rydh2011 lines 1268–1277 | the sources' narrower hypotheses are named in the README |
| 5.4 | rydh2011 lines 1268–1305 (Theorem B.2, pp. 27–28) | agrees with Rydh; R01 for the wider Stacks statement |
| 6.1 | stacks-06RD lines 1617–1665; stacks-06ML lines 1214–1237, 1352–1368; stacks-06QB lines 2775–2788 | agrees; item (3) is the one applied |
| 6.3 | stacks-06QB lines 2664–2672 (Lemma 101.28.6); alper-moduli lines 6998–6999, 16539–16540 | agrees; the converse and the Checks are the roadmap's |
| 7.1 | ahr2020 lines 248–252 (§1.5) | agrees, `ℐ^{n+1}` |
| 7.2 | ahr2020 lines 39–43, 475–480 (§3.1, p. 10) | agrees; the source also assumes quasi-separated |
| 7.3 | ahr2020 lines 480–484; alper-moduli lines 6859–6881, 6948–6951 | agrees; the action is the README's stated normalisation (Source issues) |

Also read: stacks-06ML lines 1199–1297 (3.2, 3.3); stacks-06QB lines 2862–2890, 2919–2953 (2.5,
2.6); stacks-06RD lines 1527–1528, 4686–4735, 4842–4878 (6.4, 5.1, 5.2, 4.5); stacks-decent-spaces
lines 1565–1616; stacks-04XE lines 142–206, 341–350, 399–404, 625–665, 707–756, 1073–1112,
1453–1463; stacks-sheaves-on-stacks lines 953–955, 1060–1075; stacks-algebraic-stacks lines
106–112. No author-flagged unverified locator remains.

### Duplication, ownership and overlaps

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. I opened all 38 cited declarations at their cited
file and line (21 Mathlib, 17 Tau Ceti); each exists there under the cited name and namespace,
and `finite_of_finite_type_of_isJacobsonRing` is at `Mathlib/RingTheory/Jacobson/Ring.lean:691`.
Tau Ceti's `Fppf/Quotient/Homogeneous/GeneralLinear.lean:56` and `Coinvariants.lean:219, 255`
represent `GLₙ/G` only for linearly reductive or characteristic-zero reductive `G`, so
gap:homogeneous-quotient-scheme asks for nothing the pin has.

SchemeAndStackFoundations on main: every cited section heading (§§1.2, 1.7–1.9, 1.12–1.23, 4.12,
4.13) and all 39 cited names resolve (for example `.baseChangeImage` line 3656, *QCoh.pushforward*
3805, `quotientStack_algebraic` 3760), as do the Checks cited from §1.7, §1.21 and §1.22. Its text
has no "decent", "quasi-DM", "residual", "closed substack", nor any of the lemma numbers the gaps
name, so no gap asks for what main provides. AlgebraicModuliForArithmeticGeometry at its open
head: §4.1 (line 1863), §8.1 (9650), §8.3 (9726) and the eleven cited names resolve; §8.3 reframes by
`α∘g` as Convention 5 says, and its six-term sequence is the one 7.3 uses. ReductiveGroups on main:
Layers 1, 3, 3A at lines 1275, 1537, 1683; Layer 3 takes `G/H` as an fppf sheaf first (lines
1573–1575).

Searches by object over main and the open heads: "residual gerbe" only in
FunctionFieldArithmeticPartII and LanglandsParameterStacks (users); "decent stack or space", "finite
type point", "gerbe over an algebraic" nowhere; "closed substack" only in users. The board package
VirtualFundamentalClasses still restates closed substacks in its §1.2 (lines 508–521); this
design now states the boundary and is the earlier roadmap, so the remaining change is in that
package. Overlap facts: none dropped, none defined only by a revision, no conflicting head, no
second copy.

Overlap check: read SchemeAndStackFoundations (main, and §§1.19–1.23 of its open revision),
AlgebraicModuliForArithmeticGeometry, GroupSchemesOverABase, VirtualFundamentalClass,
FunctionFieldArithmeticPartII and EquivariantIntersectionTheory; nothing shared (closed substacks
are used, not defined, by the second, fourth and fifth).

### Supplier order and gaps

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2230 edges, 0 problem(s)

No UPWARD or CYCLE line. The 16 gap slugs are the same in README and plan, each with a named
supplier and section, and each target's gap set equals the plan's (script over 38 targets). Each
`needs` names its lemmas and hypotheses. Compound gaps were settled in rounds 1–3.

### Shape, headlines, Lean

Eight layers, 38 targets, 135 Checks against 135 plan tests, at least three per target; every
target has a *Needs* line and locators, every layer Examples and Dependencies. No LaTeX, process
words, pull-request numbers or machine paths. Headlines: finite type points (1.1, 4.1), existence
(4.2–4.4), gerbe over the residue field and `BG_x` (5.3, 6.2, 6.3), rational points (6.4), closed
points (4.5), tangent and normal space (7.3). None is statable at the pins: Tau Ceti has
`SchPseudofunctor` and algebraic spaces, no algebraic stack, `|𝒳|` or residual gerbe. There is no
`Suggested.lean` in a design, so no padding probe and no `#check` comparison. Elaboration: not
available (this lane does not elaborate).

### Copyright and arrangement

Passages compared with their sources: the fifteen sampled statements and seven more (3.2, 3.3,
5.1, 5.2's proof plan, 5.5, 0.4's kernel warning, 6.4). The longest shared run is seven words
("is flat and locally of finite presentation"). 5.2's three reductions follow the mathematics of
Lemma 101.51.2's proof in other words and with different lemmas (101.48.5 where the source uses
101.48.4). Arrangement: Chapter 101 is split over Layers 1, 2, 3, 4 and 5 (§101.28 over three
layers, §101.51 over three), and Chapter 100's §11 comes after §§101.18–101.29. Within Layer 0,
0.1, 0.2, 0.3, 0.5 run parallel to §§100.7–100.10; the *Needs* lines force 0.2 < 0.3 < 0.4, 0.5 and
0.1 < 0.5, and 0.4 comes from other sources. The manifest parses with 25 entries; `rydh2015` is
recorded as deliberately not cited.

Source independence: 22 passages compared with 8 sources, none shared; largest share stacks-06RD,
32 of 158 locators (52 with stacks-06QB, the same chapter); contents compared with the tables of
contents of Chapters 100 and 101: independent.

## Not verifiable

- `lmb2000` (Chapter 11, Définition 11.2) and `olsson2016` (Chapter 11): settled as uncertified,
  cited by locator only; not read.
- Lean elaboration: not available in this lane, and the design has no Lean file.
- MotivicStructuresInModuliOfCurves has no open pull request; its consumer line was checked against
  the board design only.

## Source issues

- **Misprint** in stacks-06QB at Lemma 101.28.13, printed page 61: the proof writes the map on points from the base to the gerbe, twice; it should be from the gerbe to its base; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 102: local Noetherianity of the reduced closure and of the gerbe's base is left to the reader; it should cite the permanence under immersions and smooth descent; affects the proof.
- **Gap** in stacks-04XE at Lemma 100.9.6, printed page 17: no proof is given that an immersion is a homeomorphism onto a locally closed subset; it should use the presentation correspondence of Lemma 100.9.11; affects nothing.
- **Misprint** in stacks-06RD at Lemma 101.48.2, printed page 98: the proof has a stray word where "only" is meant, before "known to be quasi-compact"; it should read "only known"; affects nothing.
- **Misprint** in alper-moduli at Remark 4.5.14, printed page 140: the finite extension is written with the residue field over the field of the representative; it should be the representative's field over the residue field; affects nothing.
- **Misprint** in alper-moduli at Exercise 4.5.11 (a), printed page 139: the action is written as the automorphism composed after the framing, which does not compose; it should be the framing precomposed with the inverse automorphism; affects nothing.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes (5 January 2026), not a published text; it is cited for nine locators, each beside a Stacks Project or journal source.
- **Licence.** `sga3-vi-a` was read in the editor's online compilation of 13 October 2024 (author page), not the printed SMF volume; it supports one gap.
- **Ownership.** `packages/VirtualFundamentalClasses/README.md:508`–521 still defines closed substacks and the reduced induced structure that this design owns in 0.3–0.5; only that package can replace them by a citation.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e83b613b73005dfd80e7fae1d67f499c54a2f71b", "job": "REV-DESIGN-StackPointsAndResidualGerbes~7", "model": "fable", "worker": "chris-x52"} -->
