<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7642#issuecomment-6714027045 -->
Review (claude) of cfc932d

Verdict: needs_changes

1. **F01** (P2) The reduced-base cases of 10.6 and 10.7 descend `β` along `T_{W/𝔐}`, but 4.4 states the invariance only for `Y` smooth over `k`

   **Location.** `design/README.md` lines 861–862 (4.4: "invariant under the action of `j^*N ×_Y T_Y`
   when `Y` is smooth (Proposition 3.5, line 889)"); lines 1752–1756 (10.6: "descended along
   `T_{W/𝔐}|_U` as in behrend-fantechi1997 Lemma 5.9 … this is the only use of the smoothness of `𝔐`
   and `𝔐'` in the source's proof"); lines 1780–1783 (10.7: "descended from 4.4 applied on `Z ×_𝔐 W`");
   `design/plan.json` 4.4 statement ("compatible with … the tangent action") and 10.6/10.7 hypotheses
   ("frakM reduced").

   **Claim.** With `𝔐` reduced (not smooth) the regular case of 10.6 and the second case of 10.7 follow
   by applying 4.4 on `W` (resp. `Z ×_𝔐 W`) and descending along `T_{W/𝔐}|_U`.

   **Witness.** The descent in behrend-fantechi1997 Lemma 5.9 (lines 1416–1419) is the invariance of
   Proposition 3.5 (line 889) under the tangent bundle of the ambient smooth scheme; its proof (lines
   894–897) uses Lemma 3.2 and Proposition 3.4 applied to `Y × Y`. In the relative route the ambient
   `W` is smooth over `𝔐` only, and the group acting is `T_{W/𝔐}|_U`, not `T_W`. Instance: `𝔐 = Spec
   k[a, b]/(ab)` (reduced, pure dimension 1), `W = 𝔐 × 𝔸¹`: `T_{W/𝔐} = O_W` is a line bundle, while
   `C(Ω_W)` is not a vector bundle at the node, so the bullet of 4.4 ("`Y` smooth", action of `T_Y`)
   does not apply to `W`, and no target states the invariance under `j^*N ×_W T_{W/𝔐}`. The sentence
   "this is the only use of the smoothness … in the source's proof" is therefore wrong: Lemma 5.9's
   "By Proposition 3.5" is the second use. (With `𝔐` smooth, as the previous review proposed, `W` is
   smooth over `k`, `T_{W/𝔐} ⊆ T_W`, and the absolute bullet suffices.)

   **Repair.** Add to 4.4 the relative invariance as its own bullet: "for `Y` a DM stack smooth of
   Deligne–Mumford type over an algebraic `k`-stack `𝔐`, with `Y` reduced of pure dimension on each
   connected component, `β(Y', X)` is invariant under the action of `j^*N ×_Y T_{Y/𝔐}` on `N ×_Y C`;
   route: the action of `T_{Y/𝔐}` on `C_{X/Y}` comes from the diagonal `Y → Y ×_𝔐 Y` (8.5's relative
   Lemma 3.2), and Proposition 3.4 applied to `Ỹ = Y ×_𝔐 Y → Y` (smooth of constant fibre dimension,
   unramified diagonal) gives the invariance exactly as in the proof of Proposition 3.5 (lines
   894–897)". Cite that bullet in 10.6 and 10.7, and replace "this is the only use of the smoothness of
   `𝔐` and `𝔐'`" by "the reducedness of `W` is needed for 4.4's construction and the relative
   invariance for the descent". In the plan, add "invariance under `j^*N ×_Y T_{Y/𝔐}` for `Y` smooth
   over `𝔐`" to 4.4's statement. Tested on the instance: with `W = 𝔐 × 𝔸¹` over the nodal `𝔐`,
   `W ×_𝔐 W = 𝔐 × 𝔸²`, the diagonal is the regular immersion `{s = t}` with normal bundle `O = T_{W/𝔐}`,
   and the argument of Proposition 3.5 goes through verbatim. (The alternative repair, stating 10.6's
   regular case, 10.7's second case and 10.8 for `𝔐` smooth as behrend-fantechi1997 §7 does, is also
   acceptable; the Layer 11 consumer is smooth either way.)

2. **F02** (P3) `C_{U/W}` denotes the conormal sheaf in 8.1 and 9.1 and the normal cone in 4.2 and 8.5

   **Location.** `design/README.md` line 1316–1317 ("with conormal sheaf `C_{U/W}` (the degree-one part
   of the normal cone of 4.2), define … `K_{U,W} := [C_{U/W} → Ω_{W/𝔐}|_U]`"), line 1521 (9.1:
   "`h^♯ : g^*C_{U/W} → J`"); `design/plan.json` 8.1 statement ("`K_{U,W} = [C_{U/W} -> Omega_{W/frakM}|_U]`").

   **Witness.** Lines 1438–1462 (8.5) and 4.2 use `C_{U/W}` for the normal cone `Spec ⊕ I^n/I^{n+1}`, as
   behrend-fantechi1997 does (line 257); the conormal sheaf is `I/I²` there (line 940) and in Convention 6.

   **Repair.** Write `I/I²` (or `N^∨_{U/W}`) for the conormal sheaf in 8.1, in 9.1 and in the plan's 8.1
   statement; keep `C_{U/W}` for the cone.

3. **F03** (P3) A clause of the repaired 9.2 Check is refuted by the Check's own instance

   **Location.** `design/README.md` lines 1558–1561 ("it is perfect iff `N_{M/𝔐}` is a vector bundle
   stack (8.4), in particular when `M → 𝔐` is a local complete intersection (…line 1321), and then
   `vd = m + rk τ^{≥−1}L`, which is `dim M` when `M` has pure dimension").

   **Witness.** Read with "and then" attached to "perfect", the instance of the next sentence refutes it:
   `M = Spec k` has pure dimension `0` and `vd = 0 + (0 − 1) = −1`. The clause holds in the local
   complete intersection case (a regular immersion of codimension `c` into `W` of pure dimension
   `m + d` gives `M` of pure dimension `m + d − c = m + rk τL`), where "when `M` has pure dimension" is
   redundant.

   **Repair.** "…in particular when `M → 𝔐` is a local complete intersection (…), in which case `M` has
   pure dimension `vd = m + rk τ^{≥−1}L` (for a hypersurface in `𝔸^n` over `Spec k`, `vd = n − 1`)."

4. **F04** (P3) 11.5 lists 10.1 as an input it does not use

   **Location.** `design/README.md` lines 1928–1929 ("*Needs:* 11.2, 10.1; StableReduction Layer 2");
   `design/plan.json` 11.5 prerequisites (`target:10.1`).

   **Witness.** 11.5 produces one global resolution of `(Rπ_*V)^∨`; the notion is 7.3's, and "hence
   `[M]^vir` is defined" is 10.2. 10.1 (the fibre product of two resolutions) enters nowhere in the
   statement or in behrend1997 Proposition 5 (lines 165–185).

   **Repair.** "*Needs:* 11.2, 7.3, 10.2; StableReduction Layer 2", and in the plan replace
   `target:10.1` by `target:7.3b` (the global-resolution target) and `target:10.2`.

Round 2 of the design review. Files read in full: `packages/VirtualFundamentalClasses/design/README.md`
(2035 lines), `packages/VirtualFundamentalClasses/design/plan.json` (11 layers, 61 targets, 126 tests,
no declared gaps), `packages/VirtualFundamentalClasses/sources.toml` (22 entries). The six findings of
the previous review were checked one by one against the repaired text (below), the adversarial pass
was run on every passage the repairs changed, and the seeded sample of fifteen targets was read against
the sources at the cited lines. One finding blocks (P2); three are notes (P3).

## Repairs of the previous review, finding by finding

- **F01 (P1, "N vector bundle stack iff lci") — repaired, differently from the proposed repair.**
  README 8.4 now reads "`N_{M/𝔐}` is a vector bundle stack iff `τ^{≥−1}L_{M/𝔐}` is perfect of
  amplitude `[−1, 0]` … In particular … when `M → 𝔐` is a local complete intersection morphism
  (8.3); the converse fails over a non-reduced base (Checks)" (lines 1413–1419), with the instance
  `Spec k → Spec k[ε]/(ε²)` as a negative-control Check (lines 1430–1434). 9.2's Check now reads
  "it is perfect iff `N_{M/𝔐}` is a vector bundle stack (8.4), in particular when … local complete
  intersection (behrend-fantechi1997 line 1321)" (lines 1558–1563), with `vd = −1 ≠ 0 = dim M` on the
  instance. The new "only if" of 8.4 is sound: the local presentation `C(I/I²) → N|_U` is a
  `T_{W/𝔐}|_U`-torsor over a stack smooth over `U`, so `C(I/I²)` is smooth, hence a vector bundle
  (behrend-fantechi1997 line 244, proof at lines 246–248: a smooth cone equals its abelian hull with
  `S_1` locally free). The pattern was also repaired in 8.5: "lci ⟺ `C` vector bundle stack ⟺ `C = N`"
  became "lci iff `C_{M/𝔐}` is a vector bundle stack, and then `C_{M/𝔐} = N_{M/𝔐}`", with the
  scheme-level criterion (lines 1451–1456; stacks-divisors lines 2017–2023 and 2151–2153) and the
  embedded-point counterexample to "`C = N` ⟹ lci" (lines 1484–1492); both recomputed below and correct. The
  Vasconcelos converse was left out (paywalled); nothing consumes it. Repaired.
- **F02 (P2, Vistoli's rational equivalence without the hypothesis on `Y`) — partly repaired.**
  4.4 now reads "with `Y` reduced of pure dimension" and names where reducedness enters (lines
  849–862); 4.3 records the reduction to integral `Y` (line 830; vistoli1989 lines 1218–1222 and
  1244–1246, read: correct). 10.6, 10.7 and 10.8 now require "`𝔐` reduced" instead of the smoothness
  the previous review proposed (lines 1748–1756, 1778–1784, 1796–1806). The reducedness of `W` and of
  `Z ×_𝔐 W` is correctly derived, but the descent step of these routes needs an invariance statement
  that 4.4 does not state at this generality: R01 below.
- **F03 (P2, dominating global resolution) — repaired.** 10.1 (lines 1634–1651) now builds
  `K_1 := F_1 ×_𝔈 H_1` globally and uses a morphism of complexes only étale-locally on an affine
  `U`; 10.3 compares through the common inverse image in `K_1` (lines 1692–1697). Recomputed below
  (fibre-product identification, splitting, the `ℙ¹` Check with `H¹(O(−2)) = k`): correct.
- **F04 (P3, "`β = 0`" not computed) — repaired.** Lines 870–872 and 874: "the ideal of `X` is zero, so the
  product of the ideals … is zero, the blow-up … is empty and `β` is the pushforward of an element of
  `W_*(∅)` (vistoli1989 lines 1466–1470 and 1482–1488)". Read at vistoli1989 lines 1480–1488: the
  source treats exactly this case. Plan tests `beta_trivial`, `beta_identity` match.
- **F05 (P3, supplier contract) — repaired.** Bullets for §0.7, §1.1, §2.9 and the new §§2.6, 2.10
  and §5.5 names (lines 236–277); all nine names grepped on main (below). Plan `sections` lists
  §0.7, §2.6, §2.10.
- **F06 (P3, process narrative) — repaired.** Line 1974: "it consumes Layers 2–6 here (2.3, 4.5, 5.3,
  6.3)"; the plan's consumer entry has no ordering clause.

## Verified sound

**Principles.** No route-specific shortcut (arbitrary field `k`, integral/rational split justified by
`A_0([𝔸¹/μ₂]) = ℤ/2`); no re-planning (stacks, schemes' Chow theory, cones on schemes, cotangent
complexes of rings, derived functors on sites, curve families imported by section); no copied
passage, no algorithm, no LaTeX delimiters, no process words, pull-request numbers, URLs or paths
(grep for `$`, `\(`, `\[`, `http`, `pull request`, `#NNN`, `TODO`, `handoff`, `checkpoint`, `removed`,
`so far`, `current`, `uncertified`: no hits).

**Dependency gate.** Output:

```
candidate: VirtualFundamentalClasses is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2368 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers on main (`eaf17b1`): SchemeAndStackFoundations, AlgebraicVectorBundles,
DerivedModuleAlgebra, EnhancedDerivedSheaves, StableReduction. EquivariantIntersectionTheory is the
open pull request #1685 (a new roadmap folder, head `f62b21a`): allowed as a supplier; the package's
pull request must name it in its merge-order paragraph. `scratch/overlaps.md`: no open pull request
changes this roadmap, no cited id is dropped, none is defined only by an open revision; the SSF
revisions #1276, #1656, #1807, #1808, #1854 drop none of the cited §§ (the overlap tool reports
none; the cited sections and names were grepped on main, below).

**Supplier citations resolved (file and line on main / at head).** SchemeAndStackFoundations README:
§0.7 l.755 (`topologicalKrullDimAt` l.757, `dimension_theory_finiteType` l.763), §1.1 l.2071
(`qcoh_fpqc_descent` l.2074), §1.10 l.2320, §1.18 l.2745, §1.19 l.2817 (`IsDeligneMumford` with
`.iff_unramified_diagonal`, `.ofSpace` l.2828–2829), §1.20 l.2843 (`setoid_criterion` l.2847),
§1.21–§1.23 l.2951–3021 (`test_BG_representations` l.3008), §2.6 l.3437 (`serre_affineness_criterion`
l.3460), §2.9 l.3582 (`bigSheaf` l.3584, `bigStructureSheaf` l.3585), §2.10 l.3631
(`quasiCoherent_topology_comparison` l.3638), §2.20 l.4275, §3.3 l.4713, §4.1 l.5066, §5.1 l.6567
(grading by `Order.height` = dimension of closure; `chow_point`: `CH₀(Spec K) ≃ ℤ`), §5.2
(`chow_affine_bundle` l.6680), §5.5 l.6768 (`conormal_regular` l.6775, `normalCone_eq_normalBundle`
l.6777, `gysin_open_independent_double_cover` l.6861), §5.6 (`test_pn_ring` l.6956); `Chow.chernClass`,
`Chow.gysin`, `Chow.graphPullback`, `Chow.IsRegularImmersion`, `Chow.externalProduct`, `Chow.intersect`,
`Stack.stackification`, `Stacks.StackInGroupoids`, `IsCoarseModuliSpace`, `keel_mori`,
`QCoh.presentationEquiv`, `Stack.quotient`, `smallEtale_map`, `deformationToNormalCone`,
`commutes_with_c1`, `excess_intersection`, `gysin_self_intersection` all present. AlgebraicVectorBundles:
L0B l.228, L1A l.269, L2A l.306, L2B l.340 in the README; `isFiniteLocallyFree` and
`FiniteLocallyFreeSheafOfRank` in its `Suggested.lean` l.37, l.179. DerivedModuleAlgebra: §0.7 l.949
(`homologyOneIso` l.964), §0.13 l.1151, §0.25 l.1303 (`extensionObstruction` l.1329).
EnhancedDerivedSheaves: §0.2 l.441, E1.2 l.534, E1.4 l.580. StableReduction: `PrestableFamily` l.109,
Layers 2–3. EquivariantIntersectionTheory at #1685: Conventions 1, 4, 5 (l.51–76: smooth affine `G`,
dimension grading, Edidin–Graham hypothesis), §2.1 l.379 (`A^G_i(X) = A_{i+l−g}(X ×^G U)`), §2.2
l.403, §2.3 l.431. The ten leads of `scratch/citations.md` all resolve to these.

**Library names at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, as in `lake-manifest.json` and
the plan's baseline).** `AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` l.44,
`.map` l.51 ff.); `Scheme.ord` (`OrderOfVanishing.lean` l.52, junk value `0`); `Algebra.FormallySmooth`
(`RingTheory/Smooth/Basic.lean` l.70), `iff_split_injection` l.290, `iff_comp_surjective` l.370;
`Algebra.Extension.cotangentComplex` l.61, `exact_cotangentComplex_toKaehler` l.324
(`Extension/Cotangent/Basic.lean`); `derivationToSquareZeroEquivLift` (`Derivation/ToSquareZero.lean`
l.116); `Scheme.smallEtaleTopology` (`Sites/Etale.lean` l.50); `Abelian (SheafOfModules R)`
(`Sheaf/Abelian.lean` l.40); `HasDerivedCategory` (`DerivedCategory/Basic.lean`); Tau Ceti
`LineBundleClass` (`LineBundle/Class.lean` l.50), `CartierDivisor` (`CartierDivisor/Basic.lean` l.127).
No `DeligneMumford` or algebraic-stack carrier exists at either pin (grep), so the headline theorems
remain not statable (below).

**Seeded locator sample (15 targets), read at the cited lines.** 1.3: stacks-properties Lemma 12.1
l.1374–1381 (`dim_x = dim_u U − dim_{e(u)} R_u`), Definitions 12.2–12.3 l.1404–1417, Example 12.5
l.1421–1424 (`dim BG = −dim G`) ✓. 2.2: vistoli1989 (3.2) l.901–911 (`W_k = ⊕ k(G)^×` over integral
substacks of dimension `k+1`), Lemma 3.3 l.940–948, l.958–959 (`∂_F`); stacks-chow-spaces Lemma 13.2
l.667–671 ✓. 2.3: (3.4) l.960–962 ✓. 2.4: stacks-chow Lemma 19.3 l.1395; stacks-chow-spaces
Definition 3.1 l.126, Definition 15.1 l.797 ✓. 3.5: vistoli1989 l.1707–1708 (exterior product "as in
[Fu] 1.10") ✓; fulton1998 §1.10 uncertified. 5.2: vistoli1989 l.1570–1599 (operations, `C^*`) ✓;
stacks-chow §37 l.44 of the contents ✓; fulton1998 Corollary 6.3 uncertified. 6.1: vistoli1989 (2.1)
l.542–545 (scheme target in the source; the README's algebraic-space form rests on 2.4 and the proof
at l.1766–1776, which uses only the `Z_*` bijection and Lemma 3.8), (2.3) l.566, (2.4) l.571–572,
(2.5) l.578–579, (6.1)(i) l.1758–1760; keel-mori1997 Corollary 1.3 l.28–29 ✓. 7.1: BF l.237–243,
Lemma 1.1 l.244, Definition 1.2 l.268, remark l.272–276 (source direction misprinted; README correct),
Lemma 1.3 l.277, l.294–311, Proposition 1.4 l.323–327 ✓. 7.2: Definition 1.5 l.349, l.379–415,
l.416–426, Lemma 1.6 l.432, Proposition 1.7 l.442–448, Definition 1.8 l.450, l.459–461, Definition 1.9
l.482, Proposition 1.10 l.487, Definition 1.11 l.492, Definition 1.12 l.505, Proposition 1.13 l.515,
l.478–481, l.1289–1298 ✓. 8.1: Definition 3.7 l.906–917, l.918–927, l.930–933, l.940–962, l.1654–1655 ✓.
8.5: Proposition 3.1 l.762, Lemma 3.2 l.774, Lemma 3.8 l.969, Corollary 3.9 l.972, Definition 3.10
l.983, Theorem 3.11 l.985–999, Proposition 3.12 l.1010–1023 (source error, below), Proposition 3.13
l.1024, Proposition 3.14 l.1040, Proposition 7.1 l.1676, l.1656; stacks-divisors Lemma 21.4 l.2017–2023,
Lemma 22.3 l.2151–2153 ✓. 9.2: Definition 4.4 l.1139, l.1143–1149, Definition 5.1 l.1259, l.1268–1273,
l.1657, l.1665–1666, Example l.1321 ✓. 10.1: proof of Proposition 5.3 l.1303–1312 ✓ (source gap,
below). 11.2: BF l.1539–1545 (the source writes `p^!G = p^*G ⊗ ω` with `ω` the dualising complex
"a line bundle"; for a curve this is the README's `π^*(−) ⊗ ω_π[1]`) ✓. 11.5: behrend1997
Proposition 5 l.165–185 ✓ (fibrewise-ample `L`, `H⁰(C_t, L^{−N}) = 0`, `π_*H = π_*F = 0`, `R¹` locally
free). Also read for the repairs: vistoli1989 l.1451–1452, 1465–1470, 1480–1488, 1218–1222, 1244–1246;
BF l.805–897 (Propositions 3.3–3.5 and their proofs), l.1378–1432 (Definition 5.8, Lemma 5.9,
Proposition 5.10), l.1486–1498, l.1598–1614 (Proposition 6.2), l.1640–1740 (§7).

**Adversarial pass (sampled targets, headline theorems, targets of findings and of the repairs).**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3 dimension | `BG`; `[𝔸¹/μ₂]`; `B𝔾_m`; `Spec k` with atlas `𝔸¹`; `∅`; coarse map of `[𝔸¹/μ₂]` | 0; 1; `0 − 1 = −1`; `1 − 1 = 0`; `−∞` (empty, Remark 12.4); flat of relative dimension 0, `1 = 1 + 0` | matches 12.1–12.5 | none |
| 2.2 orders | `x²`, `x² − 1` on `[𝔸¹/μ₂]`; `BG`; `x` | `ord_{Bμ₂}(x²) = 2`, `ord_{Bμ₂}(x²−1) = 0`, order 1 on each of the two atlas components over the orbit `{±1}`; `W_k(BG) = 0`; `x ∉ k(x²)` | matches (3.2), 13.2 | none |
| 2.3 Chow groups | `BG`; `[𝔸¹/μ₂]` | `ℤ` in degree 0; `Bμ₂`-coefficient of `div(g(x²))` is `2·ord_0 g`, every other closed point is `div(p(x²))`, so `A_0 = ℤ/2`, `A_1 = ℤ` | matches (3.4) | none |
| 2.4 comparison | `Spec k`; `𝔸¹`; doubled origin | `ℤ` (`chow_point`); `0`, `ℤ`; `ℤ`; SSF grades by `Order.height` = dimension of the closure, as here | matches §5.1, 15.1 | none |
| 3.5 exterior product | `K/k` separable of degree 2; `K = k(a^{1/p})`; `BG × BH` | two points, `4 = 2 + 2`; local of length `p`, `p·[Spec K]`, `p² = p·p`; `B(G × H)` | matches l.1707 | none |
| 5.2 Chern classes | `O(−1)` on `ℙ¹`; representations of `BG`; `L ⊕ L^∨` | `−1`; `A_{−i}(BG)_ℚ = 0`; `c_1 = 0`, `c_2 = −c_1(L)²` | matches | none |
| 6.1 coarse spaces | `BG`; `[𝔸¹/μ₂]`; `ℤ/p` in char `p`; char 0 | `(1/|G|)[pt]`; `ℤ/2 → 0`, `p_*[Bμ₂] = (1/2)[0]`; `deg = [k(y):k(y^p)]/p = p/p = 1 ≠ 1/p`, `k(y^p)` not perfect; `k(p(𝒱)) ⊇ ℚ` perfect | matches (2.4)–(2.5), (6.1) | none |
| 6.3 degrees (headline) | `BG`; `Spec K`; `ℝ`-gerbe; `[ℙ¹/μ₂]` | `1/|G|`; `[K:k]`; `2/4 = 1/2` (not `1/4`); `div(x²/(x²−1)) = 2[𝒫] − [𝒪]`, `2·(1/2) = 1` | matches (1.17) | none |
| 7.1 hulls, sequences | `xy = 0`; `𝔽_p[t]/(t^p)`; `0 → O → O² → O → 0`; `F' = 0` | hull `𝔸²`, singular vertex; hull `𝔸¹`, `α_p` a group scheme, not smooth; `0 → 𝔸¹ → 𝔸² → 𝔸¹ → 0` contravariant; `D` the zero cone | matches 1.1–1.4 | none |
| 7.2 cone stacks | `BE`; `[𝔸¹/𝔾_a]` translation vs trivial; `(0, 𝔸¹) → (𝔸¹, 0)` | `dim X − rk E`; cartesian square with `F × C → D` onto, so a point (1.7) vs `𝔸¹ × B𝔾_a` of dim 0; unique morphism, homotopies `x ↦ ax`, `x ↦ x²` not equivariant | matches 1.6–1.8 | none |
| 8.1 relative local embeddings | `BG`/`k`; `k[x]/(x²) ⊂ 𝔸¹`; `f = id`; the product | `K = 0`, product `(G, Spec k)`; `x² ↦ 2x dx`, `0` in char 2; `K = 0`; `U' ×_M U → U' × U` is the base change of the affine `Δ_M`, so affine | matches 3.7 | R02 (notation) |
| 8.4 `N` vb stack ⟺ `τL` perfect | étale; smooth of dim `n`; `k[x]/(x²)`; fat point; `Spec k → Spec k[ε]`; embedded point | `τL = 0`, `N = M`; `Ω[0]`, `BT`; `I/I²` free rank 1; length `7 ≠ 9`, not free, `N` not vb; `k[1]` perfect, `N = 𝔸¹`; `I/I²` rank 1 generically, 2 generators at 0 | both directions hold on all six | none |
| 8.4 lci ⇒ vb, not ⇐ | `Spec k → Spec k[ε]` | `C = Spec k[t]/(t²)` (`I = (ε)`, `I² = 0`) not vb ⇒ not lci; `N = 𝔸¹` | converse false as stated | none |
| 8.5 scheme criterion | `(ε) ⊂ k[ε]`; `(x²) ⊂ k[x]`; `x(x,y) ⊂ k[x,y]` | gr `= k[t]/(t²)`, `ε` a zero-divisor; line bundle, `x²` a nonzerodivisor; `Sym(I/I²) ≅ gr_I` (via `I ≅ (x,y)`, `I^n = x^n(x,y)^n`, Rees of `(x,y)` = `k[x,y,T_1,T_2]/(yT_1 − xT_2)`) but `I/I²` not locally free; 21.4 needs (1)–(3), 22.3 needs locally Noetherian | iff holds; `C = N ⇏` lci | none |
| 8.5 lci ⟺ `C` vb stack | `k[x]/(x²)`; fat point; embedded point; `Spec k → B𝔾_m` | `C = N` line-bundle stack; `dim C = 0 ≠ dim N = 1`; `C = N` not vb, depth 0 < dim 1; `C = B𝔾_a`, dim `−1 = m` | consistent with 3.11, 7.1 | none |
| 9.2 `id` perfect | hypersurface in `𝔸^n`; `Spec k → Spec k[ε]` | `vd = n − 1 = dim`; `vd = 0 + (0 − 1) = −1 ≠ 0 = dim M`, `M` of pure dimension | the "`dim M`" clause fails if read for "perfect" | R03 |
| 9.3 (headline) | char 2, `k[x]/(x²)`, `φ = (0, id)`; `M` smooth; `ℙ¹` with `[O(1) →0 Ω]` | `φ^*ω = 0` yet `(x + ax²)² = x² ≠ 0` in `k[x]/(x³)`; `φ^∨ = id_{BT}`; zero section of `C(O(1)) × BT`, closed immersion, not iso | matches 4.5 | none |
| 10.1 `K_1` | `E = 0` with `[0→0]`, `[O →id O]`; `Ω_M[0]`, `G` of rank `g`; `ℙ¹`, `[O(−4) →0 Ω]` | `K_1 = 𝔸¹ × M`, kernels `𝔸¹ × M`, `0`; rank `n + g` both ways; `End_D = k ⊕ k ⊕ H¹(O(−2)) = k³`, chain maps `k²`, homotopies `H⁰(O(−2)) = 0`, `ξ² = 0`, `φξ = 0`, so `1 + ξ` is an automorphism not from a chain map | holds | none |
| 10.1 local model | affine `U`, chain map `ψ` | `K^{−1} = {(x, h, f) : d_F x = ψ^0 h + f} ≅ F^{−1} ⊕ H^0`; `H^{−1} → K^{−1}`, `y ↦ (ψ^{−1}y, d_H y)`, is the cone differential, split since the cone `0 → H^{−1} → H^0 ⊕ F^{−1} → F^0 → 0` is exact with `F^0` locally free; `F_1 ×_𝔈 H_1 = F_1 × H_0 = C(F^{−1} ⊕ H^0)` | consistent | none |
| 10.2 (headline) | smooth `M`, `E = Ω[0]`; `ℙ¹`, `[O(1) →0 Ω]`; `vd < 0` | `[M]`; `F_1` = total space of `O(−1)`, `0^!0_*[ℙ¹] = c_1(O(−1)) ∩ [ℙ¹]`, degree `−1` (wrong dualisation: `+1`); `0` | matches 5.2, Convention 7 | none |
| 10.3 independence | `E = 0`; `F ⊕ [G →id G]` | `0^!_M[M] = [M] = 0^!_{𝔸¹×M}[𝔸¹ × M]`; class unchanged by 5.1 | holds | none |
| 4.4 `β` with `Y` reduced | `X = Y`; `v = id`; `𝔸¹ × Spec k[ε]` | ideal product `0`, blow-up `∅`, `β = h_*(0) = 0`; same; `gr = k[T, E]/(E²)`, `[C] = 2[𝔸¹]` vs multiplicity 1 on `Y_red` | hypothesis needed and stated | none |
| 10.6 pullback | open immersion; origin of `𝔸¹`; `𝔐 = Spec k[ε]`; nodal `𝔐 = Spec k[a,b]/(ab)`, `W = 𝔐 × 𝔸¹` | restriction; `v^![𝔸¹ × Y] = [Y]`; flat case only (8.5 base change); `T_{W/𝔐} = O` a bundle, `C(Ω_W)` not a bundle at the node, so 4.4's "`Y` smooth" invariance does not apply to `W` | route input missing | R01 |
| 10.7 functoriality | `v = id`; `Z × 𝔸¹ → Z`; second case | trivial; `[X]^vir × [𝔸¹]` (10.5), no hypothesis on `𝔐`; `Γ_v` regular since `Δ_{Z/𝔐}` is (`Z/𝔐` smooth), `Ω_{Z'/𝔐}` needs `Z'` smooth, descent along `T_{(Z×_𝔐 W)/𝔐}` | same descent input | R01 |
| 10.8 deformation invariance | `Z(x² + y²) ⊂ ℙ¹`, `O(2)`; `BG`, `E = 0`; the route | `2`; `1/|G|`; `vd(M) = m + 1 + r = 1`, push to `A_1(B)_ℚ = ℚ[B]`, `i_b'^![B] = [b]`; `𝔐 × B` reduced iff `𝔐` is | holds given 10.6 | R01 (via 10.6) |
| 11.2 duality | `V = O`, genus `g`; `L` of degree `d`; `ω_C`; nodal fibre | `R⁰ = O`, `R¹` rank `g`, trace `R¹π_*ω ≅ O`; `χ = d + 1 − g`; `g − 1`; degree `2g(Ẽ) − 2 + #branches`; `π^! = π^* ⊗ ω[1]`, `(Rπ_*V)^∨ = Rπ_*(V^∨ ⊗ ω)[1]` | matches | none |
| 11.4 (headline) | `X = pt`; `ℙ¹ → ℙ^r` degree `d`; elliptic `C → C` | `E = 0` iff étale; `H¹(F^*T) = 0`, `dim = (r+1)d + r`; `Ob = H¹(O) = k` trivial on the translates, `vd = 0`, class `0` | matches 6.2 | none |
| 11.5 global resolutions | `V = O` on a smooth curve; double line | `π_*G = π_*H = 0`, `Rπ_*O ≅ [R¹π_*H → R¹π_*G]`, `χ = 1 − g`; `H⁰(L^{−N}) ≠ 0` possible, prestable fibres reduced | matches behrend1997 Prop. 5; 10.1 unused | R04 |
| 11.6 (headline) | lines in `ℙ²`; CY3; `X = pt` | `(2+1)·1 + 2 + 0 − 3 = 2`; `vd = n`; `vd = b = 3g − 3 + n` | matches | none |
| Conventions 4–8 | `[𝔸¹/μ₂]`; `BG`; `C(O(1))` on `ℙ¹`; `[O(1) →0 Ω]`; separated DM | `ℤ/2` vs `0`; `1/|G|`, `|G|`, product `1`; total space of `O(−1)`, degree `−1`; `rk 0`, `Ob = O(−1)`; finite diagonal is affine | witnesses consistent across layers | none |

**Shape and completeness.** Headings in TauCetiRoadmap form; every layer ends with Examples and
Dependencies; every definition target has its API and at least three discriminating Checks (plan:
no definition under three); every theorem states its hypotheses and a locator. Standing hypotheses
(Convention 8, the Layer 8 and Layer 10 preambles) put pure dimension, Deligne–Mumford type, affine
diagonal, separatedness and constant rank in scope. Lean form, elaboration, `#check` comparison and
the one-tactic probe: not applicable at the design stage (no `Suggested.lean`; this lane does not
elaborate).

**Headline theorems named in the summary.** Coarse-space comparison (6.1), degree of zero-cycles
(6.3), intrinsic normal cone of pure dimension (8.5), the characterisations of obstruction theories
(9.3), the virtual class with its properties (10.2–10.8), the obstruction theory of spaces of maps
(11.4–11.6). None is statable at the pins (no Deligne–Mumford or algebraic-stack carrier in Mathlib
or Tau Ceti at the pins; grep above); the package's module docstring must name each and the missing
carrier.

**Ownership.** `roadmaps grep` over main and the 472 open pull requests for "intrinsic normal cone",
"virtual fundamental class", "Vistoli", "h¹/h⁰" and "Chow groups of (Deligne–Mumford | algebraic)
stacks": the only hits are ImplicitAtlases #974 (the topological class, named as a different object in
the scope section) and unrelated uses of Vistoli's name in InverseGaloisAndArithmeticFundamentalGroups
#850 and AlgebraicModuliForArithmeticGeometry #853. EquivariantIntersectionTheory #1685 owns the
neighbouring `A^G_*`; this roadmap cites it and compares in 6.2. MotivicStructuresInModuliOfCurves
(merge order) is on neither main nor an open pull request and is named only as a consumer. Ownership
against open pull requests whose files the brief does not provide was not checked beyond the grep tool.

**Declared gaps.** None declared; none needed (every prerequisite resolves).

**Manifest.** 22 entries; the new `stacks-divisors` entry is certified from the Stacks project with
the two cited lemmas; `gillet1984` and `fulton1998` settled as uncertified; `olsson2007` recorded as
`author-page`. No local path in the manifest.

## Not verifiable

- gillet1984 §4 and fulton1998 §1.10, Corollary 6.3, Proposition 8.1.1, Appendix B.6.6: settled as
  uncertified; cited by locator only. The statements used (exterior products, self-intersection, the
  formal properties of the product, pure dimension of normal cones) are standard and also covered by
  stacks-chow where cited.
- Lean elaboration and the one-tactic probe: not available at the design stage.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.12, printed page 30 (lines 1010–1023): the source
  says `C_X = N_X` implies `X` is a local complete intersection, via "normal cone equals normal sheaf
  implies regular immersion"; it should require `C_X` to be a vector bundle stack, since
  `Spec k[x,y]/(x², xy) ⊂ 𝔸²` has `Sym(I/I²) ≅ gr_I` with `I/I²` not locally free; affects a stated
  result ((3) ⇒ (1) of the proposition).
- **Gap** in behrend-fantechi1997 at Proposition 5.3, printed page 39 (lines 1303–1305): the source
  says one may assume the two global resolutions map to `E` by morphisms of complexes; it should
  justify this, since on a stack a morphism in `D(O_X)` between two-term complexes of vector bundles
  need not lift to a morphism of complexes (`ℙ¹`, `[O(−4) → Ω]`, `H¹(O(−2)) = k`); affects the proof.
- **Misprint** in behrend-fantechi1997 at the remark after Definition 1.2, printed page 8 (line 275):
  the source says the dual sequence runs `C(E) → C(F') → C(F)`; it should be `C(E) → C(F) → C(F')`
  (the functor is contravariant); affects nothing.
- **Misprint** in behrend-fantechi1997 at Proposition 5.5, printed page 39 (line 1354): the source says
  the hypothesis is `h¹(E•) = 0`; it should be `h^{−1}(E•) = 0` (compare Proposition 7.3 (1), line
  1708); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cfc932d21b0d3359db04b4e49d56e50294cd0abd", "job": "REV-DESIGN-VirtualFundamentalClasses~2", "model": "fable", "worker": "chris-x10"} -->
