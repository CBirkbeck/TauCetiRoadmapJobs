# FIX-RT-VirtualFundamentalClassPartII~1

Repair of red-team round 1 (passes a and b) on `packages/VirtualFundamentalClassPartII`. All eight
findings were checked against the cached sources and the sibling roadmaps; none is disputed. The two
P2 findings of 8.1 that overlap are settled once.

## RT-VirtualFundamentalClassPartII~1a/F01, RT-VirtualFundamentalClassPartII~1b/F01 (P2) — applied

8.1: the parenthesis "(cycles and rational equivalences … formed on smooth charts and descended …)" →
a definition of *smoothCycles* `Z_*(𝔛)` and *smoothRatEquivalences* `W_*(𝔛)` for algebraic stacks
locally of finite type (families on smooth finite-type charts, degree shifted by relative dimension,
`∂` chart by chart), with five statements: smooth-topology sheaf, agreement with 2.1–2.2,
cycles of closed substacks, torsor descent, locally finite families. Needs, Dependencies, four Checks.

Witnesses confirmed: 2.1–2.2 define `Z_*`, `W_*` only on stacks of Convention 1, while 8.1 forms `β` on
cones over arbitrary `X′`, and 8.1 (third statement) and 8.3 descend to cone stacks such as `B T_{𝔸¹}`
and `N × 𝔉`. Pass a's alternative (a), restricting `X` to Convention 1, was not adopted: smooth base
change `Y_1 → Y` (8.1, second statement) produces `X_1` outside Convention 1 anyway, and with the new
groups 8.1 says instead that for `X` of Convention 1 they are 2.2's groups. The same use was repaired
in 8.2's route ("descends … glues … pulls back", now citing 8.1's torsor descent and sheaf property)
and 8.3's API (`N × 𝔉`). Scope and ownership, How to read the build and Layer 8 Dependencies name the
new items.

## RT-VirtualFundamentalClassPartII~1a/F02 (P2) — applied differently

8.1 gains *localImmersionDeformationSpace* `M°_F G`: the groupoid `M°_R S ⇉ M°_U V` on gap charts,
`R → S` an immersion of algebraic spaces, with flatness over `ℙ¹`, its fibres (`G`, `C_{F/G}`), flat base
change and agreement with VirtualFundamentalClass §1.5 (kresch1999b lines 259–274). Three Checks:
`Spec k → BG`, `pt ⊔ pt → pt`, `{0} → 𝔸¹`.

Why differently: the suggested bullet calls `R → S` an immersion of schemes and builds `M°_R S` with
SchemeAndStackFoundations §5.5. For an algebraic stack `G`, `S = V ×_G V` is an algebraic space, so
`M°_R S` is built with VirtualFundamentalClass §1.5 for algebraic spaces. `R → S` is an immersion
because `R → U ×_G U` is a base change of the relative diagonal of the unramified `F → G`, an open
immersion. That `R` is open in `U ×_G V`, as kresch1999b line 270 says, holds with the gap's étale
charts: the map is étale and an immersion. No supplier owns the construction: VirtualFundamentalClass
§1.5 at its head deforms only representable closed immersions, and gap:normal-cones-of-local-immersions
asks for the cone, not the deformation space. So this roadmap states it (8.1), extending §1.5.

## RT-VirtualFundamentalClassPartII~1a/F03 (P3) — applied

4.2 API gains a normal-cone formula: for equidimensional `𝒢′ → 𝒢`, `f^![𝒢′] = s^![C_{ℱ′/𝒢′}]`. The
route is vistoli1989 Lemma 5.5's proof (lines 1685–1704) with Lemma 3.15 (lines 1132–1160) on an atlas.
8.2's route ("giving `v^![C(F•)] = [C(u^*F•)]`") and 8.3's API last sentence now cite it. 4.2's Needs
adds 2.1 and 3.3.

## RT-VirtualFundamentalClassPartII~1a/F04 (P3) — applied

9.5: "for `𝔅` the stack of prestable `n`-pointed curves …, of dimension `3g − 3 + n`" → "for a base of pure
dimension `b = 3g − 3 + n` … the form in which AlgebraicGromovWittenTheory §4.3 applies it to its
prestable-curve stack". The AlgebraicGromovWittenTheory bullet moved from "Imported, not restated" into
"Not part of this roadmap", naming it a consumer of Layer 9. That roadmap at its head cites this roadmap
nowhere.

## RT-VirtualFundamentalClassPartII~1a/F05 (P3) — applied

4.3 Needs: "1.1, 4.1–4.2; …" → "1.1, 3.1, 4.1–4.2; …". 6.1 Needs: appended "for the first API bullet, also
VirtualFundamentalClass §§7.1 and 9.1".

The same omission was found and repaired at five other Needs lines: 3.1 (+2.1, for the API bullet on
étale surjections), 4.2 (+3.1, for the flat-pullback API bullets), 5.1 (+3.1, flat representable `g^*`
in the statement), 5.4 (+3.2, for the integral API statement) and 6.2 (+1.1, proper covers in the route).

## RT-VirtualFundamentalClassPartII~1b/F02 (P3) — applied

Convention 6: "Hom(O_C[1], O_C[2]) = H¹(C, O_C) ≅ k; so a morphism into `τ^{≥−1}L` is not in general the
truncation …" → the triangle argument: `Hom(E, τ^{≤−2}L)` measures non-uniqueness (`H¹(O)`, elliptic
curve), `Hom(E, τ^{≤−2}L[1])` obstructs lifting (`H²(O)`, zero on curves). An explicit complex on an
abelian surface, with class in `H²(A, O_A) ≅ k`, has its truncation identity not lifting.

The suggested text only noted that `H²(O) ≅ k` on an abelian surface. The added complex makes the
"need not come from one" clause an actual witness.

## RT-VirtualFundamentalClassPartII~1b/F03 (P3) — applied

Convention 2: "(kresch1999b lines 232–234)" → "(vistoli1989 lines 499–500, there called a local
embedding; kresch1999b lines 232–234 uses the word local immersion, for morphisms that are only
locally of finite type)". The next sentence now reads "Vistoli's regular local embeddings (vistoli1989
(1.20), lines 503–505) are the regular local immersions." `sources.toml` `cited_for` was updated to match.

## Checks

- **Elaboration.** `lake env lean packages/VirtualFundamentalClassPartII/Suggested.lean`, run from the
  content checkout: exit 0, no messages. `Suggested.lean` is unchanged. It declares nothing, and its
  docstring's headline list and "what the pins lack" remain accurate: the new items of 8.1 need
  algebraic stacks, which the pins lack. No `TauCeti.*` import, so no module was built.
- **`#check @name` comparison.** Not run: the file has no declaration to check.
- **Dependency check** (command of the brief): `depcheck: 251 roadmaps, 2383 edges, 0 problem(s)`. No
  UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found
  nowhere. `deformationToNormalCone` is SchemeAndStackFoundations §5.5's, on main.
- **Gate failures listed in the brief.** None.
- **`design/plan.json`.** No new gap: the two new 8.1 items are owned here. The existing gaps are
  unchanged.
- **Sources.** No new source was fetched and no `needs-references.toml` was written. Every new locator
  is in a cached text: kresch1999b lines 192–207, 250–256, 259–274, 307–309; vistoli1989 lines 499–505,
  1132–1160, 1685–1704. `sources.toml`: the `locator` and `cited_for` of `kresch1999b` and `vistoli1989`
  were extended accordingly (TOML parses).

## Adversarial pass on added and changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 8.1 `Z_*`, `W_*` of algebraic stacks: grading | `B T_{𝔸¹}` over `𝔸¹`, atlas `𝔸¹` of relative dimension 1 | both projections `T_{𝔸¹} → 𝔸¹` equal; `Z_i = Z_{i+1}(𝔸¹)`; `[B T_{𝔸¹}]` in degree `0 = 1 − 1` (8.3 Check 2) | holds; Check added |
| 8.1 groups, `B𝔾_m` | atlas `Spec k`, `Spec k ×_{B𝔾_m} Spec k = 𝔾_m` | `Z_{−1}(B𝔾_m) = ℤ·[B𝔾_m]`; `W_{−2} = k^×`, `∂ = 0` into `Z_{−2} = 0` | consistent with dimension `−1` |
| 8.1 groups, empty stack | `𝔛 = ∅` | only the empty chart; `Z_*(∅) = W_*(∅) = 0` | holds |
| 8.1 sheaf property | `p : U ⊔ U → U`, cycle `z ≠ 0` | `(z, z)` descends; `(z, 0)`: `p_1^*` puts `z` on copies `(1,1), (1,2)`, `p_2^*` on `(1,1), (2,1)`, unequal | discriminates |
| 8.1 agreement with 2.2 | `[𝔸¹/μ₂]`, atlas `𝔸¹_x`, `div(y)` | `div(x²) = 2·[0]` ↦ `2·[Bμ₂]` = 2.2's Check; `[[V(x²)/μ₂]]` ↦ `[V(x²)] = 2·[0]` = 2.1's Check | holds; Check added |
| 8.1 non-quasi-compact | `Y = ⊔_ℕ 𝔸²`, plane example per component | `β = (c·ν/η)_n`, infinitely many terms, finitely many per quasi-compact open | element of `W_*`, not of 2.2's sum; Check added |
| 8.1 torsor descent | plane example, `p = y` and `p = x` | `[𝔸³/𝔾_a] = 𝔸²_{ν,η}`, `β ∈ W_2(𝔸³)` ↦ `c·ν/η ∈ W_1(𝔸²)`; for `p = x`, `c·ν/(η + b) ≠ c·ν/η` | holds / not invariant; Check extended |
| 8.1 `M°_F G`, `R → S` immersion | `Spec k → BG`; `pt ⊔ pt → pt` | `R = {e}` open and closed in `U ×_G U = G`; `R` = 2 diagonal points of 4 | immersion in both |
| 8.1 `M°_F G` fibres | `Spec k → BG`, `|G| = 2` | groupoid `(e × ℙ¹) ⊔ ((G∖e) × (ℙ¹∖0))` on `ℙ¹`: fibre `BG` at `t ≠ 0`, `Spec k` at `0`; over `ℙ¹ ∖ ∞` it is 1.1's `B_{𝔸¹}G` | flat, fibres as stated; Check added |
| 8.1 `M°_F G` flat base change | base change of the above along `Spec k → BG` vs direct `M°_{pt⊔pt} pt` | `(ℤ/2 × ℙ¹)/𝒢`: `2` points over `0`, `1` elsewhere; direct: `ℙ¹` with doubled `0` | agree; not separated (kresch1999b Remark 2.6) |
| 8.1 `M°_F G` closed immersion | `{0} → 𝔸¹_x`; identity `F = G` | `Spec k[t, u]`, `x = tu`: fibre `𝔸¹_x` at `t ≠ 0`, `Spec k[u]` at `0`; blow-up without removal gives `𝔸¹ ∪ ℙ¹`; `M°_G G = G × ℙ¹` | agrees with §1.5 / §5.5 (0 ↔ ∞) |
| 4.2 normal-cone formula | `Spec k → BG`, `𝒢′ = BG`; `{0} → 𝔸¹` along `z ↦ z²`; `𝒢′ = 𝔸¹ × Spec k[ε]/(ε²)` | `m = |G|`, `p_*[G] = |G|·[pt]`, result `[pt]` = 4.2 Check; `C = N` over `k[z]/(z²)`, `2·[pt]` = 3.5 Check; `[C] = 2·[T-line]`, `2·[pt] = f^!(2·[𝔸¹])` | holds |
| 8.2 route with the formula | 8.2 Check: `{0} → 𝔸¹`, `X = 𝔸¹ × Z`, `E = Ω_{X/𝔜}` | `C(F•) = X`, `C_{Z/X}` = trivial line = `N`, `s^![N] = [Z] = [Z]^vir` | holds |
| Conv. 6 witness | elliptic curve; any curve; abelian surface `A` | `Hom(O[1], O[2]) = H¹ = k`, `Hom(O[1], O[3]) = H² = 0`; `H²(A, O_A) = k`, connecting map of `id_{O_A[1]}` = class `≠ 0`; `Hom(O[1], τ^{≥−1}L[−1]) = 0` | non-uniqueness and non-lifting both witnessed |
| Conv. 2 locator | `⊔_ℕ Spec k → Spec k` | unramified, locally of finite type, not quasi-compact: kresch1999b's local immersion, not this README's | locator corrected |
| 9.5 virtual dimension with `b = 3g − 3 + n` | `(g, n, X, β) = (0, 0, ℙ², line)`; `(1, 1, c_1 = 0, dim 3)`; `(0, 3, ℙ¹, degree 1)` | `−3 + 3 + 2 = 2 = (1)(−1) + 0 + 3`; `1 + 0 + 0 = 1`; `0 + 2 + 1 = 3 = (1)(−2) + 3 + 2` | agree with 9.5's Checks |
| Needs additions | 3.1, 4.2, 4.3, 5.1, 5.4, 6.1, 6.2 | each added item is used by the named bullet or route (étale descent; flat pullback `π^*`, `g^*`; integral pushforward; `C(F•)`, `𝔠_{X/𝔜}`; proper covers) | consistent |

## Ownership

`roadmaps grep` over main and the open heads, by object (cycles or rational equivalences on Artin or
algebraic stacks by smooth descent; deformation to the normal cone of local immersions or unramified
morphisms of stacks; Kresch's cycle groups), found no owner. MotivicStructuresInModuliOfCurves only
cites kresch1999 in its references. The stopped package VirtualFundamentalClasses excludes Kresch's
theory. VirtualFundamentalClass §1.5 (at its head) deforms representable closed immersions only.
This roadmap therefore owns both new items. They are stated in 8.1, the only section that uses them,
and Chow groups of Artin stacks stay out of scope.

## For the maintainer

- No section, target or heading was renamed or renumbered. The new names (*smoothCycles*,
  *smoothRatEquivalences*, *localImmersionDeformationSpace*) are proposed names in italics, not Lean
  declarations.
- AlgebraicGromovWittenTheory is no longer listed under "Imported, not restated". It remains a
  downstream consumer, and 9.5 and 9.3 still point to its §§4.1 and 4.3 as the special case.
- The deformation space and the stack cycle groups are owned here. If VirtualFundamentalClass later
  extends §1.5 to local immersions, 8.1's construction becomes a citation of it.
- Ownership against open pull requests was checked with the `roadmaps` tools, which read every open
  head.
