<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17628#issuecomment-6905452830 -->
Red team round 2 pass a (claude) of f4b22ef

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) module docstring credits the degree equality of §4.3 to a statement about `λ_k`

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/Suggested.lean:42–44`: "Invariance under the
     normalization lift (README §§4.3, 5.3) is the case of `dynamicalDegree_birational_conj` in which
     the partial isomorphism is the inverse of the normalization".
   - **Claim.** Both normalization items, §4.3 and §5.3, are instances of that theorem.
   - **Witness.** §4.3 (`README.md:534`) is the equality `deg_k(f̃; ν^*L, ν^*M) = deg_k(f; L, M)`.
     Cuspidal cubic, `f = id`, `k = 0`: `3 = 3` with `ν^*O(1) = O(3)` (`README.md:542`).
     `dynamicalDegree_birational_conj` gives only `λ_0 = 1 = 1`, and the comparison theorem only a
     constant `C`; with `ω_Y = O(1)` the degrees are `1` and `3`.
   - **Repair.** Replace the paragraph by: "Invariance of the dynamical degrees under the normalization
     lift (README §5.3) is the case of `dynamicalDegree_birational_conj` in which the partial
     isomorphism is the inverse of the normalization over the normal locus. The equality of the degrees
     themselves under the lift (README §4.3) is an instance of model independence (README §4.1) and is
     not stated here." Tested on the witness: the new text claims `λ_k = 1` on both sides only, and
     leaves `3 = 3` to §4.3.

2. **F02** (P3) the route of §5.1 goes round a pinned lemma and takes a route-only dependency

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md:606` ("`u_n = log(C_k(ω)·deg_{k,ω}(f^n))`
     … By §4.5 there is `C ≥ 1` … `u_n/n ≥ min(0, log(C_k(ω)/C))`"), `README.md:67` and the *Needs:*
     line `README.md:608`.
   - **Claim.** Convergence to the infimum needs logarithms, positivity of the degrees and a lower bound
     obtained from §4.5 and integrality.
   - **Witness.** Pinned Mathlib, `Mathlib/Analysis/Subadditive.lean:89`:
     `Submultiplicative.tendsto_lim (hbdd : ∀ n, 0 ≤ u n) : Tendsto (fun n ↦ u n ^ (n : ℝ)⁻¹) atTop (𝓝 h.lim)`,
     with `Submultiplicative.lim` (line 44) the infimum of `u n ^ (1/n)` over `n ≥ 1`. Only `0 ≤ u n` is asked.
   - **Repair.** In `README.md:67` append: "`Submultiplicative.lim` and `Submultiplicative.tendsto_lim`
     (lines 44, 89) are the multiplicative form: for `u_{m+n} ≤ u_m·u_n` and `u_n ≥ 0`, `u_n^{1/n}`
     tends to `inf_{n ≥ 1} u_n^{1/n}`, with no lower bound to check." Replace the route of §5.1 by:
     "*Route.* Put `v_n = C_k(ω)·deg_{k,ω}(f^n)`. Then `v_n ≥ 0` (§4.2) and, by §4.4 with
     `f^{m+n} = f^m ∘ f^n` (Mathlib's `Scheme.RationalMap.comp_assoc`), `v_{m+n} ≤ v_m·v_n` for
     `m, n ≥ 1`; for `m = 0` it holds because `v_0 = C_k(ω)·(ω^d) = (d − k + 1)^k ≥ 1`. Mathlib's
     `Submultiplicative.tendsto_lim` gives `v_n^{1/n} → inf_{n ≥ 1} v_n^{1/n}`. Since
     `C_k(ω)^{1/n} → 1`, the limit is also `lim deg_{k,ω}(f^n)^{1/n}`. Convergence and the infimum
     formula, with the infimum over `n ≥ 1` written over Mathlib's positive naturals `ℕ+`, are the
     acceptance statement `tendsto_dynamicalDegree`." Change the *Needs:* line to "§§4.2, 4.4; Mathlib
     `Filter.limUnder`, `Submultiplicative`, `Submultiplicative.lim`, `Submultiplicative.tendsto_lim`,
     `Scheme.RationalMap.comp`, `Scheme.RationalMap.comp_assoc`." Tested: `(x², y)` on `ℙ²`, `k = 1`:
     `v_n = 2·2^n`, `v_0 = 2 ≥ 1`, `v_{m+n} = 2^{m+n+1} ≤ 2^{m+n+2}`, `v_n^{1/n} → 2 = inf`; `d = 0`:
     `v_n = 1`. §5.2 still needs §4.5 for `λ_k ≥ 1` and independence of `ω`, as its *Needs:* says.

Two P3 findings (S01, S02), both text-only. No P1 or P2: no statement of `Suggested.lean` or of the
README was refuted on any instance tried, every cross-roadmap citation resolves at the supplier's
current text, and the dependency check is clean. All ten findings of round 1 are repaired at this
head and no repair introduced an error.

## Round 1 findings at this head

| finding | status | repaired passage (witness) |
| --- | --- | --- |
| 1a/F01 `graph` docstring, independence of the representative | repaired | `Suggested.lean:59–61`: "For a reduced `X` the image does not depend on the representative, and for `K`-rational maps between `K`-schemes it lies in the closed subscheme `X ×_K Y`"; new Check `README.md:213`. Recomputed: `(a + a′y)(b + b′y) = ab + (ab)′y` since `y² = 0`, so `a ↦ a + a′y` is a ring map and `t ↦ t + y ≠ t`. |
| 1a/F02 = 1b/F01 headline bullet on the graph | repaired | `README.md:151`: "integrality and dimension of the graph, and the properties of its two projections (§1.2)"; five conjuncts at `Suggested.lean:92–94`. |
| 1a/F03 = 1b/F02 `algebraicEntropy_baseChange` padding | repaired | absent from `Suggested.lean` (32 declarations) and from the README; `README.md:671`: "follows term by term over `0 ≤ k ≤ d` from `dynamicalDegree_baseChange` … and from `dynamicalDegree_birational_conj`". |
| 1a/F04 `hL₂d` in `mixedDegree_comp_le` | repaired | binder gone (`Suggested.lean:237–249`); `README.md:553`: "No positivity of `L_2` is assumed"; Check `README.md:572`, recomputed `0·0 = 0 ≤ 2·1·1 = 2`. |
| 1b/F03 bigness owner | repaired | `README.md:45`: "By AlgebraicModuliForArithmeticGeometryPartII §1.6, with §2.2 here …"; contract bullet `README.md:108`. Supplier text read on main (§1.6, lines 364–375): section growth along sufficiently divisible powers, and big ⇔ `(L^n·V) > 0` for nef `L`. |
| 1b/F04 `IsModification` | repaired | `README.md:91` cites `TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53`; read at the pin: `class IsModification (f : X ⟶ Y) : Prop extends IsProper f` with a dense `U`, dense preimage, `IsIso (f ∣_ U)`. |
| 1b/F05 de Jong contract | repaired | `README.md:131`: "an alteration from an integral `X_1` with an open immersion into a regular scheme projective over the base field"; supplier §4.19 on main, lines 7739–7742, says the same. |
| 1b/F06 Corollaire 7 locator | repaired | `Suggested.lean:254–255` cites Dang–Favre Theorem 1.3 (second item); `Suggested.lean:279–280` cites the estimate in the proof of Corollaire 7. dinhsibony2005 lines 256–257 (statement) and 260–263 (estimate); dangfavre2021 lines 457–460. |

## Record of the pass

Dependency check:

    depcheck: 240 roadmaps, 2257 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

### Suggested.lean declarations (32)

Context for all: `namespace TauCetiRoadmap.DynamicalDegreesOfRationalMaps`, `universe u`,
`noncomputable section`, no `variable` and no `include`; every binder is in the declaration's own
signature. No Lean was run in this pass (the brief gives no Lean command); the elaborated types of
the job's signature list (32 entries, 0 dropped binders) were compared with the source and with the
README statements, and nothing differs.

| declaration | instances tried | values on each side | result |
| --- | --- | --- | --- |
| `graph`, `graphFst`, `graphSnd` (def; no instances) | `Spec k[x,y]/(xy,y²)` with `a ↦ a + a′y`; `K`-schemes `X`, `Y` | ring map since `y² = 0`, `t ↦ t + y`; `X ×_K Y → X × Y` is a base change of the diagonal of the affine `Spec K`, a closed immersion | docstring true for reduced `X` |
| `topologicalDegree` (`[IsIntegral X] [IsIntegral Y] [f.IsDominant]`) | `z²`; `Spec L → Spec L` | `2`; `1` | right |
| `graph_isIntegral_and_projections` | representative `g` agreeing with a `K`-map on dense `W` | `g ≫ (Y ↘ K)` and `V ↘ K` agree on `W`, `V` reduced, `Spec K` separated: `g` is over `K`, graph inside `X ×_K Y`, `π_1` proper | true |
| `numericalIntersection` | `P = a + bn_1 + cn_2 + dn_1² + en_1n_2 + gn_2²` | `P(1,1) − P(1,0) − P(0,1) + P(0,0) = e`; at `(0,0), (−1,0), (0,−1), (−1,−1)` also `e` (the pairing of SchemeAndStackFoundations §5.9) | right, agrees with the supplier |
| `realIntersection` | `E × E`, `A + I` | `0 + 2·3 + 2 = 8 = 2·det[[2, √2], [√2, 3]]` | right |
| `IsNef` | pinned `intersectionNumber k ι a = eulerDegree k (pullback ι a)`, truncation `2`; `A` on `E × E` | degrees `2`, `1`, `3 + 2√2` on `F_1`, `F_2`, `Δ` | right; no name clash (other namespace) |
| `khovanskii_teissier` | `E × E`, `A_0`, `I`; `ℙ² ⊔ ℙ²`, `n = 2` | `0·2 ≤ 9`; `16 < 25`, excluded by `IsIntegral` | true |
| `siu_inequality_products` | `(ℙ¹)³`: `i = 1, j = 2`; `i = 2, j = 1`; `ℙ²`, `i = j = 1`; two planes in `ℙ² × ℙ²` | `6·1 ≤ 3·2·1`; `6 ≤ 4·1·2`; `1 ≤ 2`; `5·1 > 2·1·1`, excluded by `IsIntegral` | true, sharp |
| `mixedDegree` (def; only `[X.Over]`) | `z²` | `(1,0) ↦ 1`, `(0,1) ↦ 2`; `K`-structure of the graph through `π_1` | right |
| `mixedDegree_pos` | `(A^pB^q)^d ≥ (A^d)^p(B^d)^q`; `O(1,0)` | `> 0` for two nef classes of positive top power; `0`, excluded by `hLd` | true |
| `mixedDegree_boundary` | `z²`; `d = 0` | `(1, 2·1)`; `[K_1:K] = 1·[K_1:K]` | true |
| `mixedDegree_baseChange` | which `K′`-structure the fibre product gets; `ℙ¹_ℂ/ℝ` | Mathlib's `canonicallyOverPullback` (Mathlib/AlgebraicGeometry/Pullbacks.lean:816), `hom := pullback.snd`; `2 = 1 + 1` | true |
| `mixedDegree_comp_le` | `(x², y)∘(x², y)` on `ℙ²`, `p = q = 1`; roles of `A`, `C` in §3.6 exchanged | `1·4 ≤ 2·2·2`; both `(p+1)^q` and `(q+1)^p` are valid constants | true |
| `exists_mixedDegree_comparison` | route `id ∘ f ∘ id` with `ω′, ω, ω, ω′`; `E × E` | `C_1 = (d−k+1)^{2k}(ω′^{d−k}ω^k)(ω^{d−k}ω′^k)/(ω^d)²`; `C = 25`, ratio `9/2` | true |
| `isDominant_partialIso` (instance, proved) | grep of pinned `Mathlib/AlgebraicGeometry/Birational/` | no such instance | needed |
| `exists_mixedDegree_birational_comparison` | `Y ⤏ X ⤏ X ⤏ Y` | `φ ∘ f ∘ φ^{−1}` | true |
| `iterate`, `isDominant_iterate` | `n = 2` | `f.comp (f.comp id)` | right |
| `dynamicalDegree`, `algebraicEntropy` | `n = 0` term; `d = 0`, `k = 1` | `x^{1/0} = 1`; `mixedDegree … 0 1 = χ(O) − χ(O) = 0`, limit `0` | right |
| `tendsto_dynamicalDegree` | `k = 0`; `k = d`; `(x², y)`, `k = 1` | `v_n = 1`; `v_n = e^n`; `(2·2^n)^{1/n} → 2 = inf` | true |
| `one_le_dynamicalDegree` | Cremona | `1` | true |
| `dynamicalDegree_eq_of_polarizations` | `O(1,1)`, `O(2,1)`, swap | `1 = 1` | true |
| `dynamicalDegree_iterate` | `m = 0`; `(x², y)`, `m = 2`, `k = 1` | `1 = λ^0`; `4 = 2²` | true |
| `dynamicalDegree_zero_and_top` | `(x², y)` | `λ_0 = 1`, `λ_2 = 2 = e` | true |
| `dynamicalDegree_log_concave` | `(x², y)` | `1·2 ≤ 4` | true |
| `dynamicalDegree_birational_conj` | `φ` the identity partial isomorphism | reduces to independence of `ω` | true |
| `dynamicalDegree_baseChange` | universe of `K′`; conjugation on `ℙ¹_ℂ/ℝ` | Tau Ceti's domain instance takes `L : Type u`, as `K′`; conjugation excluded by `f'.IsOver` | true |
| `algebraicEntropy_iterate` | `(x², y)`, `n = 2` | `log 4 = 2 log 2` | true |
| `algebraicEntropy_bounds` | `(x², y)`; `d = 0` | `log 2 ≤ log 2 ≤ 2 log 2`; `0 ≤ 0 ≤ 0·log 0 = 0` | true |

Notes, not findings: `mixedDegree_baseChange` holds without `hX`, `hY`, dominance and `hpq` (flat
base change preserves each `dim H^i`); `dynamicalDegree_baseChange` assumes both `IsIntegral X'` and
geometric integrality, the second being what the route of §1.4 uses.

### README targets (27)

| target | instances tried | values computed | result |
| --- | --- | --- | --- |
| §1.1 | cusp normalization against pinned `Module.rankAtStalk` | rank over the local ring of the localized module: `1`; fibre `K[t]/(t²)`: `2` | sound |
| §1.2 | reducedness control; Lemma 6.8 hypotheses | as in the first row above; `X ×_K Y → X` separated, `U` retrocompact | sound |
| §1.3 | `z², z²` | `(q_Y, q_Z)` of degree `2 = e(f)`, not `4` | sound |
| §1.4 | localization argument for `e(f_{K′})` | a domain finite over the field `K(Y_{K′})` is a field of dimension `e(f)` | sound |
| §2.1 | double point | `2 = 2·1` | sound |
| §2.2 | pairing of two line bundles on a surface | coefficient `e` in both normalizations | sound |
| §2.3 | `[O(1,0)] + [O(0,1)] − [O(1,1)]` | `2 − 4 + 2 = 0` | sound |
| §2.4 | `ℙ¹_ℂ/ℝ`; pointless conic | `c_V = 2`, `2 = 2·1`; `c_V = 1`, `2 = 2` | sound |
| §3.1 | approximation estimate; `m = 3`, `n = 3`, `δ = 1/5` | `(β_j·C) ≥ (ω_j·C) − n·(δ/2mn)·m(H·C) + (δ/2)(H·C) = (ω_j·C)`; determinants `−0.0463`, `0.5897`, `5897`; decomposition of `A + F_1 + F_2` coefficientwise `2+√2`, `3+√2`, `−√2` | sound |
| §3.2 | double line | `2n + 1`, value `2` | sound |
| §3.3 | route; `E × E` | `vol(pA − qB) ≥ p^{r−1}(p(A^r) − rq(A^{r−1}B))`; `24 ≤ 30` | sound |
| §3.4 | `D″` | `(D″·H′) = 0`, `(D″²) = (H′²)((H′²)(D′²) − (D′·H′)²)` | sound |
| §3.5 | homogeneity; cut multiplicity | degree `2` in every class on both sides; `(μx)² ≥ (μy)(μz)` | sound |
| §3.6 | telescoping; number of cuts | `y_{j+1}x_j ≤ (r−i+1)y_jx_{j+1}`; `(j−1) + (i−j) = i−1` cuts, `dim Z_j = r−i+1 ≥ 1` | sound |
| §4.1 | model `q_1 = f`, `q_2 = f∘f` for `z²` | `2 = 2·1` | sound |
| §4.2 | monotonicity control | `2 → 1.5`, `L′ − L` of degree `−0.5` | sound |
| §4.3 | cuspidal cubic | `3 = 3` | sound (S01 is about the docstring) |
| §4.4 | identifications on `W`; `d = 0` | `(A^kB^{d−k}) = e(f_1)deg_k(f_2)`, `(B^d) = e(f_1)(L_2^d)`; `[K_2:K][K_1:K]` both sides | sound |
| §4.5 | swap on `ℙ¹ × ℙ¹`; `E × E` | `c = 9/4, 9/16`, `C = 9`; `(ω′·τ^*ω′) = (4−2) + (−2+9) = 9`, `C = 25` | sound |
| §5.1 | `u_0`; pinned Fekete | `u_0 = k log(d−k+1) ≥ 0`; S02 | sound, route simplifiable |
| §5.2 | `λ_k ≤ λ_1^k` | concavity of `log λ_k` with `log λ_0 = 0` | sound |
| §5.3 | graph of `f′` when `X′` is integral | image of the integral `U_{K′}`, integral | sound |
| §5.4 | maximum of powers | `max λ_k^n = (max λ_k)^n` | sound |
| §6.1 | substitution `σ∘σ`; `d = 0` | `(x_0x_1x_2)·(x_0, x_1, x_2)`; reduced form `(1)` | sound |
| §6.2 | section of `aA − B` | `a(A^{d−k}B^k) ≥ (A^{d−k−1}B^{k+1})`; `(A^{d−1}·E) = 0` | sound |
| §6.3 | `f²`, inverse on `z = 1` | `[xyz : xy² : z³]`; `(u, v) ↦ (v/u, u)` | sound |
| §6.4 | `(y, z, x+yz)`; `(x², y)` | degrees `2, 3, 5`; forms `[x_0² : x_1² : x_0x_2]`, base point `[0:0:1]`, `(1, 2, 2)` | sound |

## Verified sound

- **Declarations read:** 32 of 32 (11 definitions, 2 proved instances, 19 `sorry` theorems), every
  line of `Suggested.lean`; each compared with its elaborated signature and its README statement.
- **Targets read:** 27 of 27, every line of the README.
- **Headline theorems.** The six headline bullets (`README.md:151–156`) against the file: §1.2, §§3.5–3.6,
  §§4.2–4.3, §§4.4–4.5 and §§5.1–5.4 are stated; §§6.2–6.4 are named in the module docstring as not
  statable, with the missing carrier (the rational map attached to forms). No stand-in, no sorry'd
  data, no `True`, no hypothesis containing its conclusion.
- **Padding (one-tactic probe).** None found: `mixedDegree_boundary` and
  `dynamicalDegree_zero_and_top` need the projection formula along `π_2` and multiplicativity of `e`;
  `algebraicEntropy_iterate` and `algebraicEntropy_bounds` need `dynamicalDegree_iterate`,
  `one_le_dynamicalDegree` and the induction on log-concavity.
- **Pinned declarations read at the pin (this round):** `Scheme.Hom.finrank` through
  `RingHom.finrank` and `Module.rankAtStalk` (this settles the item round 1 left open; `README.md:65`
  is accurate), `canonicallyOverPullback`, `Scheme.RationalMap.comp`, `comp_assoc`, `isOver_comp`,
  `compHom`, `domain`, `toPartialMap`, `equivFunctionFieldOver`, `PartialIso.IsOver`,
  `GeometricallyIntegral`, `Subadditive.lim`, `Subadditive.tendsto_lim`, `Submultiplicative`,
  `IsModification`, `eulerCharBelow`, `LineBundleClass.eulerDegree`, `intersectionNumber`,
  `IsProjectiveOver` with `isProper`, `finrank_eq_finrank_fieldRange_functionFieldMap`, the two
  results of `Geometrically/FunctionField.lean`, `topologicalKrullDim_eq_toNat_trdeg_functionField`:
  24, each at the cited line with the hypotheses the README states.
- **Sibling citations checked (this round, statements read):** CyclotomicClassGroupsAndStickelberger
  §4.3 (main; all six consumed facts are in its numerical-intersection paragraph);
  AlgebraicModuliForArithmeticGeometryPartII §§1.5, 1.6, 1.7 (ii), (iii), (v) and its API bullets
  (main); ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3 (open head; (1′), (2′) for a projective
  variety over any field, `d ≥ 1` in (2′)); LefschetzPencilsAndVanishingCycles §5.1 (open head;
  Bertini irreducibility with `dim g(X) > s`); SchemeAndStackFoundations §4.19 and §5.10
  (`hodge_index` with only `H² > 0`) (main). 9 sections read; the other 26 cited sections were
  located by heading in round 1 and `roadmaps resolve` reports none missing. No cited roadmap is on
  the never-cite list; ArakelovGeometryAndAbelianHeightsPartII (360), ArithmeticDynamics (357) and
  LefschetzPencilsAndVanishingCycles (75) precede this roadmap (361).
- **Ownership.** `roadmaps grep` over main and the open heads: no other roadmap mentions dynamical
  degrees or algebraic entropy; no `Suggested.lean` declares `numericalIntersection`,
  `realIntersection`, `mixedDegree`, `dynamicalDegree`, `topologicalDegree` or `algebraicEntropy`;
  `IsNef` on main is in another namespace and takes a single class. Khovanskii–Teissier appears on
  main only in AlgebraicModuliForArithmeticGeometry §9.10, which the scope paragraph cites.
- **Locators verified (this round):** 40 passages in 10 certified sources, each supporting what it
  is cited for: dang2020 (lines 18–46, 141–143, 840–883, 1271–1284), dangfavre2021 (82–84, 427–434,
  436–443, 448–467), dinhsibony2005 (245–247, 256–263), truong2020 (143–164, 760–763, 999–1003,
  1101–1106, 1529–1544), cutkosky2015 (274–287, 983–1005, 1007–1033), guedj2010 (1099–1112,
  1136–1147, 1178–1181, 1272–1282), silverman2014 (43–45, 350–357, 358–380, 383–387),
  stacks-morphisms (six statements), stacks-varieties (six), kleiman2005 (two).
- **Checks tested:** the arithmetic of about 30 Checks recomputed (those in the two tables above); none
  false, vacuous or a restatement. Every definition has at least three.
- **Policy.** The pull request changes only the package folder (README, Suggested.lean,
  metadata.toml, sources.toml, four reports). No `lemma`, `set_option`, `#eval`, `#check`,
  pull-request number, process narrative or machine path in the README or the Lean file; one
  `import Mathlib` and five Tau Ceti modules, each used. No gap is declared and none is needed.
- **Wording, arrangement, reuse.** Seven further prose passages set beside the sources: the
  docstring of `mixedDegree` (dang2020 21–25), the route of §5.1 (dangfavre2021 461–463), the route
  of §3.6 (dang2020 876–883), the route of §3.4 (cutkosky2015 994–1003), the statement of §2.1
  (kleiman2005 3624–3627, stacks-varieties 4716–4719), the Fibonacci item of §6.3 (silverman2014
  358–372), the docstring of `khovanskii_teissier` (cutkosky2015 983–985). Shared material is
  formulas and standard names only; the longest shared run of words is six, in the hypothesis list
  of the component formula. Layers against contents: dangfavre2021 (1 degrees, 2–3 b-classes and
  b-divisors, 4–5 spectral results, 6 affine maps) and dang2020 (1–2 cycles, 3 positivity, 4
  relative classes, 5 dynamics, 6–7 semi-conjugacies); only Layer 3 and dang2020 §3 share a subject,
  and no run of layers maps onto a run of sections. No table, figure or list is taken over.

Source independence: 47 passages compared with 10 sources, none shared; largest share dangfavre2021, 16 of 101 locators; contents compared with dangfavre2021 and dang2020: independent. Not read: lazarsfeld2004 and fulton1998 (uncertified); russakovskiishiffman1997, stacks-chow and stacks-constructions were read in round 1, not again.

## Not verifiable

- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998`
  (Theorem 1.4, Proposition 2.5): uncertified, cited by locator, text not read. dang2020 lines 842
  and 845 give the number 2.2.13 for both Siu's inequality and the bigness criterion where the
  README has 2.2.15; which is the book's numbering could not be checked.
- Elaboration: no Lean command is given to this pass, so nothing was elaborated; the comparison used
  the job's elaborated signatures.
- Ownership against open pull requests was checked through `roadmaps grep` and the listed heads
  only.

## Source issues

- **Error** in dang2020 at Proposition 3.4.1 and Theorem 3.4.4, printed pages 17–18: the source says the Siu inequalities hold on every closed subscheme `V`; it should be on integral (or irreducible) `V`: two planes in `ℙ² × ℙ²` give `1 ≤ 2/5`; affects a stated result.
- **Misprint** in dinhsibony2005 at proof of Corollaire 7, printed page 7 (line 263): the source says the displayed bound gives `λ_l(f) ≤ λ_l(h)`; it should be `λ_l(h) ≤ λ_l(f)`, the other inequality coming from the symmetric argument; affects nothing.
- **Error** in dinhsibony2005 at proof of Corollaire 7, printed page 7 (line 259): the source says the sequence converges to the infimum of the `n`-th roots of `δ_l(f^n)`; it should be the infimum of the `n`-th roots of `c_X·δ_l(f^n)`; affects the proof.
- **Misprint** in dang2020 at proof of Theorem 3.4.4, printed page 18 (line 883): the source says the final constant is a power of `n − i + 1`; it should be `r − i + 1`, as in the statement; affects nothing.
- **Misprint** in dang2020 at Theorem 5.2.1, printed page 25 (lines 1275–1279): the source says both maps of the bases carry the index 2; it should be index 1 for the first; affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a) (line 1180): the source says log-concavity holds for every index from 1 to `k`; it should be from 1 to `k − 1`, `λ_{k+1}` being undefined; affects a stated result.
- **Misprint** in silverman2014 at Example 6, printed page 9 (line 376): the source says the `n`-th iterate has degree `F_n`; it should be `F_{n+2}`, the first iterates having degrees 2, 3, 5; affects nothing.

## For the human reviewers

- **Licence.** `cutkosky2015` and `kleiman2005` are cited from arXiv preprints (1304.1218v1, math/0504020v1) at `packages/DynamicalDegreesOfRationalMaps/README.md:814–815`, without the published versions; numbering was checked against the preprints only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f4b22ef6279dfb1f294f757bdf3ec17bdf2b9dea", "job": "RT-DynamicalDegreesOfRationalMaps~2a", "model": "fable", "worker": "chris-x55"} -->
