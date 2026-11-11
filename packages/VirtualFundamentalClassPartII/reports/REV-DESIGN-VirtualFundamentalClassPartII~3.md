<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6802154779 -->
Review (claude) of 89164f3

Verdict: needs_changes

1. **F01** (P3) 8.2 and 8.3 use chart symbols before introducing them

   - **Location.** README 8.2, route: "`β(W′, U)` of 8.1 is defined and invariant under
     `T_{W/𝔜}|_{U′}`"; README 8.3, route: "formed in the ambient `Z′ ×_𝔜 Z ×_𝔜 W` of the graph".
   - **Claim.** Every symbol in the two routes is defined where it is used.
   - **Witness.** 8.2 never introduces `U` or `U′` (only "a relative local embedding of `X` into `W`");
     8.3 introduces `W` only later, in its API ("On a chart where `X → Z ×_𝔜 W` …"). This is the
     pattern of round 2's F02.
   - **Repair.** 8.2: "for an étale chart `U → X` with a closed immersion `U → W` into `W` smooth over
     an atlas of `𝔜` (Convention 2), with `W′ := W ×_𝔜 𝔜′` and `U′ := U ×_W W′`, `β(W′, U)` …".
     8.3: after "in the second," add "on a chart `X → Z ×_𝔜 W` as in the API below,". Tested on 8.2's
     second Check: `U = X = 𝔸¹ × Z`, `W = X`, `W′ = U′ = Z`.

2. **F02** (P2) 8.3, second case: `Z′ ×_𝔜 X` need not be of finite type

   - **Location.** README 8.3: "in the second the composite of the Gysin map of the graph
     `Z′ → Z′ ×_𝔜 Z`, a regular local immersion, with flat pullback along the projection to `Z` (4.2)".
   - **Claim.** The composite is formed by 3.1 and 4.2, which act on stacks of Convention 1.
   - **Severity.** A missing finiteness hypothesis: the stated construction applies 3.1 and 4.2 to a
     stack outside the class on which they are defined.
   - **Witness.** `𝔜 = Spec k`, `Z = pt ⊔ pt`, `X` the first point, `Z′ = pt ⊔ (⊔_ℕ pt)` with the
     first point over the first: `X′ = pt`, but `Z′ ×_𝔜 X = Z′` is not quasi-compact, so it is not a
     stack of Convention 1.
   - **Repair.** Add: "`Z′` being replaced by a quasi-compact open substack containing the image of
     `X′`; the class does not depend on it, since 4.2's Gysin maps commute with restriction to open
     substacks". On the witness the open is the first point, and both sides are `[pt]`.

Two findings ask for a repair of the README: R02 (P2), a missing finiteness hypothesis in the route
of 8.3, and R01 (P3). All seven findings of round 2 are repaired, and nothing else was found in the
repaired passages, in the 15 sampled targets or in the rest of the text. The declared supplier gap
`gap:closed-substacks-of-stacks` is precise, minimal and declared, and is not a finding.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md`,
`packages/VirtualFundamentalClassPartII/design/plan.json`,
`packages/VirtualFundamentalClassPartII/sources.toml`. This is a design: there is no
`Suggested.lean`, this lane does not elaborate, and the one-tactic padding probe and the
headline-statability check do not apply.

## Round-2 findings, one by one

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3) | repaired | 8.1 route: "For the third statement, the two projections `p_1, p_2 : Y ×_𝔅 Y → Y` …" and "For the fourth statement, generators `f_1, …, f_c` … the third statement applies over `𝔅 = 𝔸^c × 𝔐`"; 8.3: "the invariance of 8.1's fourth statement for `T_{Z′/𝔜} ⊕ T_{W/𝔜}`". |
| F02 (P3) | repaired | 8.1: "`∂β(Y′, X) = [C_{u^*C/C}] − [j^*N ×_{X′} C_{X′/Y′}]`"; 8.3: "`q : 𝔉 → u^*𝔈` denotes its second map" and "boundary `[q^*C_{u^*𝔠_{X/𝔜}/(Z′ ×_𝔜 𝔠_{X/𝔜})}] − [N × 𝔠_{X′/𝔜}]`". No `ρ` and no second `φ` remain (grep). |
| F03 (P3) | repaired | 8.3: "`𝔠_{X′/𝔜}` is a torsor over `u^*𝔠_{X/𝔜}` under `B T_{X′/X}`, the kernel of `q`, and `𝔠_{X′/𝔜} = 𝔉 ×_{u^*𝔈} u^*𝔠_{X/𝔜}`"; second Check: "a torsor under the vector bundle `T_{𝔸¹}` would have dimension `2`". |
| F04 (P3) | repaired | Contract: "§2.6 (`serre_affineness_criterion` …) and §2.10 (`quasiCoherent_topology_comparison` …), used in 6.1 to split, on each affine étale chart, an extension"; Scope: "(§§2.6, 2.10), used in 6.1". |
| F05 (P3) | repaired | 4.4: "the Check in the Examples of VirtualFundamentalClass Layer 2". |
| F06 (P3) | repaired | 8.1: "Corollary 1.10 (lines 182–190), stated for a variety, is applied to each irreducible component of the double deformation space that dominates `ℙ¹ × ℙ¹`, with its reduced structure, and the results are summed with the multiplicities". |
| F07 (P3) | repaired | `sources.toml`: vistoli1989 `locator` now has "Lemmas 3.16, 3.19, 3.20, 4.6"; kresch1999b `locator` begins "Corollary 1.10; Propositions 2.1, 2.3; … Remarks 2.5–2.6"; behrend-fantechi1997 has "Propositions 3.3–3.5, 3.14". |

Patterns searched in the rest of the text: ordinals referring to bullet lists (none other);
undefined symbols in routes (R01); supplier Checks cited by section (the four remaining ones
resolve); manifest `locator` fields against README citations (complete). The new statement
"`β = −ω`" added by the F06 repair was checked against kresch1999b line 304 (table below).

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 206 roadmaps, 1897 edges, 0 problem(s)

No UPWARD or CYCLE line.

## Maintainer notes

None of the six stands as a finding.

1. Words: satisfied. Convention 2 uses "local immersion" for the class and "local embedding" for
   the chart pair, and gives Vistoli's words once.
2. Cotangent complex: satisfied. Convention 6 says no truncated complex is defined; 9.3 builds `φ`
   into the full `L_{M/𝔅}` from the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3 (third bullet) and 4.4.
4. Invariance: the restricted invariance and the plane counterexample are in 8.1. The sub-claim
   "the owner's text names no acting group" is refuted at the owner's head:
   VirtualFundamentalClass §2.5 reads "invariance under the restricted tangent action
   `T_{Y′}|_{X′}` of Kresch, Theorem 3.1".
5. Functoriality: 8.3 uses the graph but no intermediate obstruction theory, and says why; the
   step that replaces it is the API comparison (rows below).
6. Suppliers: satisfied. No AlgebraicVectorBundles or EllipticCohomology citation (grep); the
   seven suppliers of `plan.json` are each cited by section.

## Adversarial table

Rows computed this round: the repaired passages, the sampled targets and the two targets the
notes touch. For text no repair touched I also rely on the computed rows of round 2's table.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.1 boundary and sign against Kresch | kresch1999b line 304 with `X, Y′` as named here; plane `Y = 𝔸²`, `X = 0`, `Y′ = {y = 0}` | `∂ω = [C_{j^*N/N}] − [C_{u^*C/C}] = −∂β`; plane: `[ν = 0] − [η = 0] = div(ν/η)` | holds, `β = −ω` | none |
| 8.1 `C_{X′/Y′} ⊆ u^*C`, `j^*N × C_{X′/Y′} = C_{j^*N/N}` | plane; `Y = 𝔸¹ × Spec k[ε]/(ε²)`, `Y′ = {t = 0}` | `{η = 0} ⊂ 𝔸²_{ξ,η}`; `Spec k[E]/(E²) ⊂ Spec k[T,E]/(E²)`; flat pullback of `C_{X′/Y′}` along `N → Y′` | holds | none |
| 8.1 non-reduced Check | same `Y`, `I = (t, ε)` | `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `[C] = 2·[T-line]`, `∂β = 2·[ν = 0] − 2·[T = 0] = div` of `2·(ν/T)` | holds | none |
| 8.1 third and fourth statements | plane with `p = y` and `p = x`; `(f_1, …, f_c) : Y → 𝔸^c × 𝔐` | `p = y`: both projections pull `Y′` back to `{y = 0}`, `ξ ↦ ξ + a` fixes `ν/η`; `p = x`: pullbacks differ, `ν/(η + b) ≠ ν/η`; `ker(T_{Y/𝔐} → O^c)|_{Y′} = T_{Y′/𝔐}` | holds | none |
| 8.2 regular pullback | node, `𝔜′ = V(a + b)`; `𝔸¹ × Spec k[ε]/(ε²)`, `t = 0` | `k[a,b]/(ab, a + b) = k[a]/(a²)`, `−2·[pt × pt]` both sides; `2·[pt]` both sides | holds; `U`, `U′` undefined | R01 |
| 8.3 first case, torsor | `X = Z = 𝔜 = Spec k`, `Z′ = 𝔸¹`, `E = 0` | `dim 𝔠_{X′} = dim B T_{𝔸¹} = 0`, `dim u^*𝔠_X = 1`, `1 − 1 = 0`; a `T`-torsor gives `2` | holds | none |
| 8.3 boundary, dimensions | general, `a = dim(Z′/𝔜)`, `z = dim(Z/𝔜)` | normal cone of `u^*𝔠` in `Z′ ×_𝔜 𝔠`: `d + a`; `q` has relative dimension `z − a`; `q^*`: `d + z = dim(N × 𝔠_{X′/𝔜})` | holds | none |
| 8.3 boundary, instances | `v = id_Z`, `F = E`; `v : {0} → 𝔸¹`, `X = 𝔸¹`, `E = Ω`, `F = 0` | section of a smooth map: cone `N × 𝔠`, `q = id`, boundary `0`; cone `N × B T_0`, `q : pt → B T_0`, `q^* = N × pt = N × 𝔠_{X′}`, boundary `0` | holds | none |
| 8.3 second case, `v^!` | `Z = pt ⊔ pt`, `Z′ = pt ⊔ (⊔_ℕ pt)`, `X` the first point | `X′ = pt`; `Z′ ×_𝔜 X = Z′` not quasi-compact | route needs a quasi-compact open | R02 |
| 6.1 splitting (F04) | `ℙ¹`, `E = [O(−4) → Ω]` | `Hom(E, E) = k ⊕ k ⊕ H¹(O(−2))`; `Ext¹(O(4), O(2)) = k`, nonsplit `= O(3)²`; affine chart: `H¹ = 0` | holds | none |
| 6.2 class and grading | `[O(1) → Ω]` on `ℙ¹`; theory of 6.1; grading | `F_1 = O(−1)`, degree `−1`; `c_1(O(4)) = 4 = c_1(O(3)²/O(2))`; `d + rk F_0 − rk F_1 = d + r` | holds | none |
| 1.1 no separated cover of `L` | DVR through `0₁`, second lift through `0₂` | two maps `Spec R′ → Z` with one generic point and closed points over `0₁ ≠ 0₂` | holds | none |
| 1.2 `k(𝒱)`, `e` | `[𝔸¹/μ₂]`; `BS₃`; real gerbe | `k(x²)`, `e = 1`; `1 + 3 + 2 = 6`; `ℂ^{ℤ/4} = ℝ`, `e = 2` | holds | none |
| 1.3 degree | `pt → BG`; `BG → pt`; `ℤ/p`-quotient | `|G|`; `1/|G|`; `(1/p)·p = 1 = p/p` | holds | none |
| 2.1 cycle of a substack | `[V(x²)/μ₂]` | length of `k[x]/(x²)` is `2`, so `2·[Bμ₂]` | holds | none |
| 2.2 / 2.3 | `[𝔸¹/μ₂]`; `P(y)` inseparable; `L` | `ord_0(x²) = 2`; `K[x]/(x² − θ)` étale over `K`, coefficient `1`; `ℤ²/ℤ(1,1) ≅ ℤ` | holds | none |
| 3.1 flat pullback | `pt → BG`; coarse map of `[𝔸¹/μ₂]` | `[Spec k]`, not `|G|`; `[0] ↦ 2·[Bμ₂]` | holds | none |
| 3.2 divisor formula | atlas `𝔸¹ → [𝔸¹/μ₂]`, `φ = x`; `𝔸¹ → 𝔸¹ × BG`, `t` | `f_*[0] = 2·[Bμ₂] = div(−y)`, factor `1`; `|G|·[0 × BG]`, factor `|G|` | holds | none |
| 4.2 stack Gysin | `π : pt → BG`, `Y = pt` | `|G|^{−1}·|G|·[pt] = [pt]` | holds | none |
| 4.3 Chern classes | `L ⊕ L^∨`; `O(−1)` on `ℙ¹` | `c_1 = 0`, `c_2 = −c_1(L)²`; `s^!s_*[ℙ¹] = −[pt]` | holds | none |
| 4.4 agreement (F05) | supplier head | §2.1 Checks: `B(ℤ/2)` of degree `1/2`; Layer 2 Examples: `O(1)` self-intersection | locators resolve | none |
| 5.3, 5.4 | `ℙ(1, 2)`; `[ℙ¹/μ₂]`, `t²/(t² − 1)` | `∫t = 1/2`, `∫2t = 1`; orders `2, −1, −1, 0`, `2·(1/2) − 1 = 0` | holds | none |
| 7.2 negative control | `char 2`, `k[x]/(x²)`, `φ = (0, id)` | `Ext¹(L_X, J) = Hom(A, J)`, `φ^*ω = 0`, `(x + ax²)² = x² ≠ 0` | holds | none |
| 8.4 deformation invariance | `x² − by²` | `2` for `b` a square, a non-square (one point of degree `2`) and `b = 0` | holds | none |
| 9.1 | `X = pt`; `M = pt`, `F = id_{ℙ¹}` | unique lifts, so étale; `H⁰(T_{ℙ¹}) = k³` against one extension | holds | none |
| 9.2, 9.3 | smooth curve; `ℙ¹ → ℙ^r` | `χ = e + 1 − g`; `H¹ = 0`, `χ = (r + 1)(d + 1) − 1` | holds | none |
| 9.4 | `L = O`, `V = O`, `g ≥ 1` | `G = O`, `H = 0`, `[0 → R¹π_*O]` misses `H⁰` | holds | none |
| 9.5 | lines in `ℙ²`; prestable base | `−3 + 3 + 2 = 2`; `dim X·(1 − g) + 3g − 3 + n + δ = (1 − g)(dim X − 3) + n + δ` | holds | none |

## Verified sound

- **Shape.** 9 layers, 33 targets, 122 tests in `plan.json` (none with fewer than three), 33
  `**Checks.**` lists, every target with a locator and a *Needs:* line, every layer ending with
  Examples and Dependencies. Layer titles are mathematical and the README nowhere says it follows
  a source. No LaTeX delimiters, process words, pull-request numbers, anchors or machine paths
  (grep). `plan.json` parses as JSON and `sources.toml` as TOML.
- **Source locators read this round.** vistoli1989 lines 337–380, 419–430, 540–584, 886–896,
  950–1012, 1027–1030, 1045–1050, 1170–1175, 1195–1208, 1568–1625, 1660–1690, 1705–1722,
  1756–1778; behrend-fantechi1997 lines 775–830, 860–900, 1030–1048, 1259–1263, 1299–1308,
  1375–1498, 1602–1612, 1640–1745; kresch1999b lines 100–125, 175–345, 385–405; behrend1997 lines
  136–198; rydh2015 lines 79–88; keel-mori1997 line 28; edidin-graham1998 lines 755–760, 788–798;
  deligne-mumford1969 lines 1010–1020; stacks-chow line 1356; stacks-chow-spaces lines 57–61,
  126–133, 169, 516, 667, 797–818, 1986–1990, 2224. Each carries the item number and hypotheses
  the README quotes, for all 15 sampled targets. No locator was flagged by the author as
  unverified.
- **Pinned declarations opened.** Mathlib `AlgebraicCycle`
  (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` line 44), `AlgebraicCycle.map` (line 69),
  `Scheme.ord` (`OrderOfVanishing.lean` line 52, `ord_eq_zero_of_coheight_neq_one` line 61).
  Tau Ceti `Chow.cyclesOfDimension` (`Chow/Basic.lean` line 86), `RatEquiv` (257), `ChowGroup`
  (295), `cycleClass` (304), `ChowGroup.equivIntOfUnique` (369), `ChowGroup.pushforward`
  (`Chow/ClosedImmersion.lean` line 211), `SchPseudofunctor` (`Stack/Basic.lean` line 37),
  `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean`), `PrestableFamily`
  (`Curves/Prestable.lean` line 45: extends `IsProper` and `GeometricallyConnected`, no genus),
  `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean`). The five
  Mathlib morphism properties were not reopened this round; round 2 records their lines.
- **Cross-roadmap citations resolved.** VirtualFundamentalClass at its open head: every cited
  section §§0.2–9.6 exists; read §§2.1–2.5 with the Layer 2 Examples, 5.5 (the sequence
  `B T_{X/Y} → 𝔠_X → f^*𝔠_Y` for smooth `f`), 7.3–7.5, 8.1, 9.1–9.6. SchemeAndStackFoundations
  on main: all 24 cited sections and 26 cited names, including `serre_affineness_criterion` and
  `quasiCoherent_topology_comparison`, and the §5.5 and §5.6 Checks. StableReductionPartII §5.15
  at its open head states the Edidin–Graham comparison with the hypotheses the contract quotes.
  DerivedModuleAlgebra §§0.7, 0.12, 0.25; EnhancedDerivedSheaves §0.3, E1.4, E1.8;
  EquivariantIntersectionTheory Conventions 1, 4, 5 and §§2.1–2.2; StableReduction Layers 2–3;
  AlgebraicGromovWittenTheory §§4.1–4.3 (consumer only): all exist. The citation tool reports no
  name found nowhere.
- **Supplier order.** Every supplier is on main, earlier in the merge order, or an open pull
  request that adds a new folder; no never-cite roadmap is cited.
- **Declared gap.** `gap:closed-substacks-of-stacks`: same slug in `plan.json` (supplier
  VirtualFundamentalClass, §2.1) and in the README contract; the `needs` sentence names one
  theory "without separatedness". The supplier's head uses integral closed substacks in §2.1
  without stating their theory. Precise, minimal, declared.
- **Duplication and ownership.** Against the owner's head: 6.2 against §7.3 (resolution property
  and separatedness removed), 6.3 against §§7.5 and 9.4 (smooth base removed), 8.2 against §9.4,
  8.3 against §9.5, 9.3–9.5 against AlgebraicGromovWittenTheory §§4.1–4.3 (any base, target and
  field). Each says which hypothesis it removes; none restates the owner at equal generality.
  `scratch/overlaps.md`: no dropped id, no revision-only id, no conflicting head.
- **Manifest.** 14 sources, one key each, every README key present, no local path; gillet1984 and
  fulton1998 settled as uncertified. Nothing was fetched or added.

## Not verifiable

- gillet1984 §4 and fulton1998: uncertified, cited by locator only.
- The gluing over charts in 8.1–8.3 and the passage of 8.3's comparison from normal sheaves to
  cones on overlaps: checked on charts, by dimension and on instances, not globally.
- vistoli1989 is read from an OCR text; item labels such as "(ii)" and "(iii)" are garbled there
  and were matched by content.
- Elaboration: not available in this lane, and a design has no Lean file.
- Ownership against open pull requests was checked through the roadmaps tool at the open heads;
  the board packages on other branches are in unrelated subjects and were not opened.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–897: the source says Vistoli's rational equivalence is invariant under the whole pulled-back tangent bundle of the ambient; it should be invariance under the tangent bundle of the regularly embedded smooth stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both global resolutions may be taken to map to the obstruction complex by morphisms of complexes; it should justify this, since an isomorphism in the derived category need not be so represented; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, lines 331–336: the source says the acting bundle is the tangent bundle of the arbitrary locally immersed stack; it should be that of the smooth regularly immersed one, as its proof uses; affects nothing.
- **Gap** in kresch1999b at the proof of Proposition 2.3, lines 275–304: the source says the corollary on two divisors, stated for a variety, applies to the double deformation space; it should apply it componentwise with multiplicities, that space being neither reduced nor irreducible in general; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "89164f36ead1331e0186587d8f57ba68e714a1aa", "job": "REV-DESIGN-VirtualFundamentalClassPartII~3", "model": "fable", "worker": "chris-x10"} -->
