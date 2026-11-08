# Review of ReductiveGroups (pull request #1797 at 11a9ca1)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ReductiveGroups/` at `11a9ca13ba7fc27623029f3d84d5965af01f88dc`. The folder changed by 279 lines since `51ebd8a`, the head the previous review read. Five of the previous review's six findings are repaired; the sixth (the merge order against the conflicting pull requests) is not, and is the only finding of this round. The gate passes every check inside the folder, the dependency check is clean, and `Suggested.lean` elaborates with exactly the seven expected `sorry` warnings.

Paths: `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`. `TauCeti/…` is the pinned Tau Ceti and `Mathlib/…` the pinned Mathlib of `lake-manifest.json`.

## R01 (P3) — five open pull requests that change this folder conflict with it, and no order is stated

Location: the pull-request description (title "AlgebraicTopology, ReductiveGroups, LieHighestWeight, QuadraticFormInvariants: one Suggested.lean each") names none of #1332, #1676, #1807, #1808 or #1854, and still says "No statement changes", which does not describe this folder.

Claim: the merge order between conflicting heads is settled.

Witness: the overlap report (`roadmaps overlaps ReductiveGroups`, computed from the heads) lists #1332, #1676 and #1808 as conflicting in `README.md` and `Suggested.lean`, and #1807 and #1854 in `README.md`. Measured against main's README: #1807 and #1854 each change the three lines 978–980 of main (the Lang sentence of Layer 9E), which this head rewrites; #1808 changes about 2,480 lines of main's README, #1332 about 3,190 and #1676 about 3,145, against about 3,340 here. This folder's own statement changes (two Layer 7 headlines added at `Suggested.lean:143` and `:160`, `plane_braid` renamed, Lang moved into Layer 7a, Layers 7g and 8 renumbered) are not summarised.

Repair: in the description, say which pull request merges first and that the others rebase on it (for example this one first; #1807 and #1854 then re-apply their three-line Layer 9E change to this head's Layer 9E, and #1676 keeps its PointTopology contract, which this head now also cites), and summarise this folder's statement changes. Re-raised: R04 of the previous review.

## Previous findings

- R01 (two Layer 7 headlines statable but called unstatable) — repaired. `Suggested.lean:143` states `IsMaximalTorus.exists_conjugate_eq` and `:160` states `IsParabolic.exists_levi_complement`, under `/-! ## Layer 7 … -/`; the docstring at `:55–56` now lists only the complete-quotient equivalence and the root datum as unstatable; `README.md:1930–1941` and `:1959–1966` name both.
- R02 (3A.5 re-planned the native point topology) — repaired. `README.md:310–344` is the new contract "Native complex-point topology" citing the 17 declarations asked for; `:1226–1247` takes `X(ℂ)` with `TauCeti.SchemePointTopology.topology` and keeps as targets only the chart open embeddings, functoriality, immersions, fibre products, reduction, Hausdorffness, properness and smooth charts; `:19–24` says "owns the comparisons on it".
- R03 (Layers 8 and 7g renumbered with no map) — repaired. `README.md:85–92` gives "former Layer 8 … is Layer 9D", "former Layer 7g … is Layer 9E", "Layer 8 denotes §§8.1–8.2". GroupSchemesOverABase's citation of "Layer 8, bullet *Relative reductive groups over an affine Noetherian base*" resolves through it to 9D's bullet at `:3531`.
- R04 (no stated order against the conflicting pull requests) — not repaired. The description is unchanged; see R01.
- R05 (four locators) — repaired. (a) `:1443` cites Theorem 12.8 for the `D(X)` characterization and `:1449` Theorem 12.9(c) for quotients; (b) `:3609–3611` cites p. 211 for `R_(u,k)(G)_K = R_(u,K)(G_K)`; (c) `:4035` and `Suggested.lean:246` read "§7, pp. 122–126"; (d) `:919` reads "pp. 52–58" and `:4387` "pp. 52–60".
- R06 (Klein four-subgroup of `PGL₂` in characteristic 2) — repaired. `:668–673` restricts to characteristic not 2, names the generators `diag(1, −1)` and `[[0,1],[1,0]]`, and records why the example fails in characteristic 2.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate passes every check. My rerun differs only in `outside-folder=43`, all 43 in the pull request's own sibling folders (`git diff --name-only origin/main...HEAD` touches only its five folders).
- Depcheck on this head: `depcheck: 244 roadmaps, 2466 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `lake env lean Suggested.lean`: exit 0, `declaration uses sorry` at lines 124, 143, 160, 177, 199, 247 and 253 and nothing else.
- Imports: `import Mathlib` and ten `TauCeti.*` modules, each a file at the pin; the four new ones (`HopfIdeal.Conjugation`, `Torus.Maximal`, `Reductive.Basic`, `Parabolic.Basic`) are the carriers of the two new headlines.
- I compared the worker's 15 elaborated signatures with the README statements (`:1708–1714`, `:1930–1934`, `:1959–1966`, `:2166–2171`, `:4290–4292`, `:3996–4001`, `:4050`); they match and no section binder is lost. A `#check @name` run on a scratch copy printed the same seven types.
- One-tactic probe (`first | rfl | simp | infer_instance | trivial | decide | exact?`) on a scratch copy: none of the seven sorried theorems closes (`simp` unfolds but leaves goals on five; the other two fall through to `sorry`). No padding: `determinantRelation`, `permute`, `planePermutationAction`, `OrderedPlane`, `UnorderedPlane`, `planeBase` and `unorderedBase` are the definitions the SL and braid headlines need, with real bodies on native carriers.

**Principles.** No copied passage, no algorithm, no `set_option`, no sorry'd data, no LaTeX, `theorem` throughout, no pull-request number or process word in the README or the docstrings.

**The two new headlines, at the pin.**
- `TauCeti.HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`) is `Minimal` among Hopf ideals with torus quotient; `torusCommHopfAlgProperty` (`Torus/Basic.lean:105`) means split of some rank `n : ℕ` after base change to an algebraic closure, so rank 0 (the trivial group) is a torus. `HopfIdeal.conjugate` is the ideal of the conjugate subgroup (`README.md:209–211`). The native `exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean:149`) needs `D`, `hcontainI`, `hcontainJ`; the headline drops them. `IsMaximalTorus.exists_isBorelOverAlgClosed_le` (`Borel/Torus.lean:67`) and `IsBorelOverAlgClosed.exists_conjugate_eq` (`Borel/Conjugacy/Existence.lean:133`) take an arbitrary `FiniteTypeCommHopfAlgCat`, as the README says at `:1935` and `:212–215`.
- `TauCeti.reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:71`, through `Radical/Basic.lean:58`) is smooth, geometrically connected, and no nontrivial connected normal smooth unipotent subgroup over the closure; `IsParabolic` (`Parabolic/Basic.lean:248`) is `IsParabolicOverAlgClosed` after base change to `AlgebraicClosure k`, which is smoothness plus containing a Borel (`:82–85`). `unipotentRadicalDefiningIdeal` (`Unipotent/Radical/Construction.lean:69`) cuts out the greatest connected normal smooth unipotent closed subgroup over `k`. So the Lean statement is Conrad–Feng's: `G` connected reductive over any field, `P` a parabolic `k`-subgroup, `U = R_(u,k)(P)`, and a closed `L` with `L → P/U` an isomorphism (`conrad-feng` lines 5334–5339, p. 127; Proposition 12.3.1 at line 5345).

**Adversarial table.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `IsMaximalTorus.exists_conjugate_eq` | `GL₂/k̄`, `T` and `uTu⁻¹` | conjugate by `u`; both minimal among torus-quotient ideals | Pass |
| same, nonreduced | `μ_p × 𝔾_m`, char `p` | `O = k[t]/(t^p−1) ⊗ k[s^±]`; a torus quotient is reduced, so its ideal contains `(t−1)` = ideal of `1 × 𝔾_m`; unique maximal torus, `g = 1` | Pass |
| same, disconnected | constant `S₃` over `k̄`; trivial group `H = k` | maximal torus = augmentation ideal, conjugates of it are itself; `H = k`: only Hopf ideal `0`, rank-0 torus, `g = ε` | Pass |
| same, wrong field | `SL₂/ℝ`: diagonal torus vs `SO₂` | real points unbounded vs compact, not conjugate; excluded by `[IsAlgClosed k]` | Pass |
| route (7) | `I ⊂ B_I`, `D ⊂ B_D` | `B_D = gB_Ig⁻¹`; `I`, `gDg⁻¹` maximal tori of `B_I` (smooth connected solvable), conjugate by 16.33 | Pass |
| `IsParabolic.exists_levi_complement` | `P = G` | `U = 1`, coinvariants = `O(G)`, `J = 0`, composite `O(G) → O(G)` identity | Pass |
| same | `GL₂`, `P = B`, `O(B) = k[a^±,d^±,b]` | `[[a,b],[0,d]]·[[1,t],[0,1]] = [[a,at+b],[0,d]]`, coinvariants `k[a^±,d^±]`; `J = (b)`: identity; `J = (a−1)`: `a ↦ 1`, not injective; `J = 0`: not surjective | Pass |
| same, hypotheses | `SL₂(W₂)` Greenberg transform, char `p` | smooth connected, `P = G` parabolic, no Levi (`mcninch` line 280, p. 7); `hred` fails (`R_u = 𝔤^[1]`) | Pass |
| same, nonsplit | quasi-split `SU₃`, `P` = Borel `k`-subgroup; anisotropic `G` | Levi = non-split maximal `k`-torus; only `P = G`, `J = 0` | Pass |
| conclusion characterizes a Levi | `J` with `O(P/U) → O(P)/J` bijective | `L = V(J) → P/U` iso of group schemes, so `L ∩ U = 1`, `LU = P` | Pass |
| `exists_levi_complement` (6A) | `𝔾_a`; `SL₂`; `𝔾_a ⋊ 𝔾_m` | `I_u = 0`, coinvariants `k`, `J` = augmentation; `I_u` = augmentation, `J = 0`; `I_u = (t−1)`, coinvariants `k[t^±]`, `J = (x)` | Pass |
| `lang_surjective` | `𝔾_a/𝔽₂`, `θ² = θ+1`; `𝔾_m/𝔽_q`; `μ₂`, `q` odd; constant `C₂` | `θ² − θ = 1`; `g^(q−1)` onto `K^×`; `(±1)^(q−1) = 1` misses `−1`; Lang `≡ 1`; last two excluded by `hconn` | Pass |
| `exists_coordinatePresentation` | `n = 0, 1, 2` | `det ∅ = 1`, relation `0`, `ℤ`; `x − 1`, `ℤ`; over `ℤ/4` the inverse of `[[1,1],[0,1]]` has entry `3` | Pass |
| `nonempty_plane_braid` | `n = 0, 1, 2` | point, `π₁ = 1 = B₀`; `ℂ`, `1`; `ℂ × ℂ^×`, `π₁ = ℤ = B₂` | Pass |
| `permutation_nonsplit` | `n = 2`; `n = 0, 1` | section needs `m` with `2m = 0` and `m` odd; trivial `S_n` has a section, excluded by `2 ≤ n` | Pass |
| `permute` direction | `n = 3`, `σ = (012)` | `(0,1,2) ↦ (2,0,1)`; the wrong convention gives `(1,2,0)` | Pass |
| 3A.5 chart Check | `D(t) → 𝔸¹`; origin `→ 𝔸¹` | `ℂ^× ⊂ ℂ` open (native `localizationAwayXHomeomorph`, `isOpenEmbedding_localization` with `Units.isOpenEmbedding_val`); `{0}` closed, not open | Pass |
| 3A.5 natives | `isClosedEmbedding_eval_generators` | needs `adjoin (range a) = ⊤`, `[T1Space R]` (`Basic.lean:241, 245`), as `:315–316` says | Pass |
| `V₄ ⊂ PGL₂` | char 3 vs char 2 | `diag(1,−1)`, `[[0,1],[1,0]]` generate `V₄`, `𝔾_m` has one involution; char 2: involutions unipotent, `(ℤ/2)²` has no nontrivial character in `𝔾_a` | Pass |
| 12.9(c) vs native | `μ_p ⊂ 𝔾_m` | native `groupLikeSpannedProperty.quotient` is the subgroup half; quotient half stays a target | Pass |
| 7b common torus | `GL₂`, `P = B⁺`, `Q = uB⁻u⁻¹` | `P ∩ Q = M` (dim 2) vs `(L∩M) ⋉ 1 = Z` (dim 1) | Pass |
| 9A.1b folds | `D₄`, `E₆` | `12 + 2 = 14`; `48 + 4 = 52` | Pass |
| 9B.1 big cell | `SL₂` | `(1+bc)/a = d`; `#SL₂(ℤ/4) = 48`; `[[2,1],[3,2]]` in no single chart over `ℤ` | Pass |
| 9C idempotent | `𝔾_m` weight 3 | `binom(3,2) = 3`; `E^(1)E^(1) = 2E^(2)`; `EF = FE + H` | Pass |
| 10C | char 3, `n = 4`; char 2, `n = 2` | socle misses `x²y²`; `y²` generates `span(x², y²)` | Pass |
| 11 | `𝔰𝔩₂` | discriminant `4t²`; `exp(πis)` ends at `−1`, subgroup `2ℤ` | Pass |

**Library names.** All 118 backticked `TauCeti.*` names of the README resolve to a declaration, namespace or file at the pin (declaration index of the pinned tree, matched by base name, then namespaces read from the file). The 17 point-topology declarations of the new contract were opened with their hypotheses: `Basic.lean:83, 103, 134, 162, 245`, `Functoriality.lean:46, 110`, `Localization.lean:92, 115`, `FiberProduct.lean:46`, `Separation.lean:59`, `Group.lean:102`, `Scheme.lean:49, 109, 127, 143, 150, 157, 165`. `Scheme.lean` has no open-embedding or scheme-morphism continuity statement, as `README.md:340–344` says. `Units.isOpenEmbedding_val` is `Mathlib/Analysis/Normed/Ring/Units.lean:200`, for a complete normed ring.

**Seeded sample.**
- §1.1: `jantzen-1985` (printed page = marker − 5): §2.8 line 1100 p. 36, §3.3 line 1507 p. 52, §3.9 line 1690 p. 60, §4.2 line 1923 p. 69, §4.7 line 1994 p. 72, §4.14 line 2102 p. 77, §4.16 line 2159 p. 79a; all as cited at `:855`, `:873`, `:883`, `:919`, `:4387`.
- §8.1: `conrad-rgs` Definition 5.1.1, line 5651, p. 136 (`:2613`); Theorem 5.1.13 line 6011 p. 143 (`:3248`); Corollary 5.3.3 line 6845 p. 164 (`:1636`).
- §8.2: `conrad-rgs` Definition 6.1.1 line 7725 and Remark 6.1.2 line 7738, p. 186 (`:2636`); Theorems 6.1.16–6.1.17 lines 8159, 8173, pp. 196–197 (`:3278`, `:3305`, `:3524`); Definition 3.1.1 line 3334 p. 81 and Theorem 3.3.4 line 4072 p. 98 (`:3568–3569`); Theorem 4.1.7 line 4632 p. 112 (`:1975`).

**Other sources** (Milne 2017 author copy, printed page = marker − 12). These 55 locators are as cited: 1.21 p. 12; 1.34 p. 16; 1.65–1.66 pp. 26–27; 3.10–3.11 p. 67; 3.15 p. 68; 4.7 p. 86; 4.9–4.10 p. 87; 4.14 p. 88; 5.14 p. 102; 5.18 p. 103; 5.34 p. 107; 5.58 p. 114; 6.44–6.46 p. 135; 9.17–9.18 p. 170; 10.6 p. 188; 10.14 p. 190; 10.23, 10.28–10.29 pp. 193–195; 12.8–12.9 p. 233; 12.12 p. 234; 12.23–12.24 p. 240; 12.52, 12.54 p. 248; 12.56 p. 249; 14.3 p. 280; 14.5 p. 281; 14.21 p. 284; 16.30 p. 334; 16.33 p. 335; 17.6 p. 353; 17.9–17.10 p. 354; 17.15–17.16 p. 356; 17.62 p. 372; 17.94–17.95 p. 382; 17.96–17.97 p. 383; 19.9 p. 399; 19.11 p. 400; 21.11 p. 428; 21.37 p. 435; 21.45 p. 438; 22.2 p. 463; 22.4–22.5 p. 464; 22.27 p. 470; 22.42 p. 477; 22.43 p. 478; 22.48 p. 479; 23.25 p. 492; 23.58 p. 501; 23.74 p. 511. Milne 17.10 (line 14547) is for a connected group variety, as `:1933` says, and its proof is the Borel route restated at `:1936–1941`.
- `mcninch` (3.2.1), line 280, p. 7; `conrad-feng` §12.3 p. 127 lines 5334–5346, Definition H.1.1 line 10356 p. 238, Theorem F.3.7 line 8986 p. 208, Proposition F.5.10 line 9448 p. 218, the `R_(u,k)` passage lines 9127–9131 p. 211; `dudas-michel` 7.5–7.7 p. 25, 8.7 p. 31, 8.9 p. 32, 9.2 p. 35, 9.4 p. 36, 9.6 p. 37, 9.9–9.10 p. 38, 9.11 p. 39, 10.1 p. 41; `sga1` XII §1 from p. 239 (marker 255), Proposition 2.1 line 9493 p. 242, Proposition 3.1 line 9594 p. 244, Proposition 3.2 line 9639 p. 245 (within the cited range); `gros-kaneda` (2.1) line 576 p. 6; `riche` 2.9.1 line 2111 p. 50, Remark 1.23 line 1054 p. 27; `frenkel-kac` §2.3 line 754 and Proposition 2.2 line 781, pp. 40–41; `brieskorn` Proposition 1 line 98, p. 25 (Numdam cover is page 1); `salvetti` Theorem 1 line 366 p. 611, Part Two from p. 611; `callegaro` §2.2 and Theorems 2.4–2.5 lines 206–230 p. 272; `birman-brendle` (1) line 132 and (2) line 137 on p. 4, p. 69 line 2654; `fox-neuwirth` §7 line 153 p. 122; `fadell-neuwirth` §II line 131 p. 114.

**Cross-roadmap.**
- `roadmaps resolve` reports 12 Lean-name leads, all declared in `Suggested.lean` (`OrderedPlane`, `UnorderedPlane`, `planePermutationAction`, `planeBase`, `unorderedBase`, `nonempty_plane_braid`, `permutation_nonsplit`, `determinantRelation`, `exists_coordinatePresentation`, `exists_levi_complement` twice, `lang_surjective`), and no unresolved cross-roadmap citation.
- Overlaps: no cited id dropped by an open pull request, no id this pull request drops that others cite, none defined only by an open revision. GroupSchemesOverABase (#1522) consumes Layer 8/9D and 9B and owns neither; its citation of the old Layer 8 bullet resolves through the new map. The five conflicting heads are R01.
- The Lang move-down from ReductiveGroupsPartII and the consumer clauses for IHGD §0.7, CCPII C-1.1 and AdelicAlgebraicGroups AA.3.1 are as settled in earlier rounds; depcheck shows no edge to them.

## Not verifiable

- Waterhouse, Borel and Springer are settled as uncertified and cited by locator only.
- The manifest key `milne-iag` records Milne's v2.00 notes; I read the 2017 author copy cached under RootSystems' `milne17`, whose numbering the README uses.
- Howlett–Lehrer, Dipper–Du, Carter §1.17, Lang 1956, Steinberg 1968, Serre §§2.3, 3.3 and Gassmann are listed as references for Layers 7a–7f without locators into their texts; none is in the cache and I did not fetch them.
- Ownership was checked against the open pull requests through `roadmaps grep`, `roadmaps show` and the overlap report, not against board packages that are not open pull requests.

## Source issues

- none
