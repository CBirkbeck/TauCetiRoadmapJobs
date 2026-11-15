<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17628#issuecomment-6903191033 -->
Review (claude) of 50746dc

Verdict: needs_changes

1. **F01** (P2) Field-extension headlines are statable at the pins but absent

   **Location.** `packages/DynamicalDegreesOfRationalMaps/Suggested.lean` lines 29–34 (module
   docstring), and `packages/DynamicalDegreesOfRationalMaps/README.md` line 148 (headline list),
   line 153 and line 640. The docstring says: "the density of the base-changed domain is itself a
   theorem, so the map cannot be written down as a definition with a real body."

   **Claim.** The README lists "their invariance under extension of the field (§4.3)" and the
   invariance of `λ_k` and `h_alg` under extension of the field (§§5.3–5.4) among the headline
   statements, and says they are not statable because the base-changed rational map `f_{K'}` cannot
   be defined.

   **Witness.** Neither statement needs `f_{K'}` as data.

   - The first equality of §4.3 (the degree equals the intersection number on `(Γ_f)_{K'}` over
     `K'`) involves no base-changed rational map at all, only `pullback` of `graph f`.
   - `f_{K'}` is the unique `K'`-rational self-map `f'` of `X' = X ×_K K'` with `π ∘ f' = f ∘ π` for
     the projection `π : X' → X`; in Mathlib this is `f'.compHom π = π.toRationalMap.comp f`
     (`Scheme.RationalMap.compHom`, RationalMap.lean:440, and `Scheme.RationalMap.comp`,
     Composition.lean:155, both already in the supplier contracts). Uniqueness holds because a
     rational map into the fibre product is determined by its two components, and the second is the
     structure map since `f'` is over `K'`.

   The three statements below were appended to a scratch copy of the file and elaborated from the
   content repository with `lake env lean`: no error, 20 `sorry` warnings (17 + 3), 5 s.
   `π.toRationalMap.IsDominant` is found by instance resolution from `[IsDominant π]`.

   **Repair.** Add these three theorems (Layer 4 for the first, Layer 5 for the other two), each with
   a docstring; delete the first bullet of the module docstring's "not statable" list; in README
   line 153 reduce "Two groups are not statable" to the projective-space group, and replace the last
   sentence of line 640 by the names of the new acceptance statements (and name
   `mixedDegree_baseChange` in §4.3).

   ```lean
   theorem mixedDegree_baseChange (K K' : Type u) [Field K] [Field K'] [Algebra K K']
       {X Y : Scheme.{u}} [X.Over (Spec (.of K))] [Y.Over (Spec (.of K))] [IsIntegral X]
       [IsIntegral Y] [X.IsProjectiveOver K] [Y.IsProjectiveOver K] {d : ℕ}
       (hX : topologicalKrullDim X = d) (hY : topologicalKrullDim Y = d) (f : X ⤏ Y)
       [f.IsDominant] [f.IsOver (Spec (.of K))] (L : LineBundleClass X →₀ ℝ)
       (M : LineBundleClass Y →₀ ℝ) (p q : ℕ) (hpq : p + q = d) :
       letI : (graph f).Over (Spec (.of K)) := ⟨graphFst f ≫ X ↘ Spec (.of K)⟩
       letI : (pullback (graph f ↘ Spec (.of K))
           (Spec.map (CommRingCat.ofHom (algebraMap K K')))).Over (Spec (.of K')) :=
         ⟨pullback.snd _ _⟩
       mixedDegree K f L M p q =
         realIntersection K' (pullback (graph f ↘ Spec (.of K))
             (Spec.map (CommRingCat.ofHom (algebraMap K K'))))
           (Fin.append
             (fun _ : Fin p ↦ L.mapDomain (LineBundleClass.pullback (pullback.fst _ _ ≫ graphFst f)))
             (fun _ : Fin q ↦
               M.mapDomain (LineBundleClass.pullback (pullback.fst _ _ ≫ graphSnd f)))) := by
     sorry

   theorem dynamicalDegree_baseChange (K K' : Type u) [Field K] [Field K'] [Algebra K K']
       {X X' : Scheme.{u}} [X.Over (Spec (.of K))] [X'.Over (Spec (.of K'))] [IsIntegral X]
       [IsIntegral X'] [X.IsProjectiveOver K] [X'.IsProjectiveOver K']
       [GeometricallyIntegral (X ↘ Spec (.of K))] {d : ℕ} (hX : topologicalKrullDim X = d)
       (π : X' ⟶ X) [IsDominant π]
       (hπ : IsPullback π (X' ↘ Spec (.of K')) (X ↘ Spec (.of K))
         (Spec.map (CommRingCat.ofHom (algebraMap K K'))))
       (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
       (f' : X' ⤏ X') [f'.IsDominant] [f'.IsOver (Spec (.of K'))]
       (hf : f'.compHom π = π.toRationalMap.comp f)
       (ω : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
       (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) (k : ℕ) (hk : k ≤ d) :
       dynamicalDegree K' d k f' (ω.mapDomain (LineBundleClass.pullback π)) =
         dynamicalDegree K d k f ω := by
     sorry
   ```

   `algebraicEntropy_baseChange` has the binders of `dynamicalDegree_baseChange` without `k` and
   `hk`, and the conclusion
   `algebraicEntropy K' d f' (ω.mapDomain (LineBundleClass.pullback π)) = algebraicEntropy K d f ω`.

   Truth, checked on the instances of the README: for `X = ℙ¹_ℂ` over `ℝ` with `f = id` and
   `ω = O(1)`, the first statement reads `2 = 1 + 1` (two diagonals over `ℂ`, §4.3 Checks); the second
   has no instance there because `X` is not geometrically integral, as §1.4 requires. For the
   Cremona involution over `ℚ` extended to `ℂ`, both sides of the first are `(1, 2, 1)` and both sides
   of the second are `1`. The instance hypotheses on `X'` and `π` (integral, projective over `K'`,
   dominant) hold for every base change of a geometrically integral projective variety (§1.4), so
   they restrict nothing.

2. **F02** (P3) The hyperplane class `H = O(1)` exists in Tau Ceti at the pin and is not cited

   **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md` line 47 ("*Projective space*
   `ℙ^d_K` is Mathlib's `AlgebraicGeometry.Proj` … `H = O(1)`"), line 65 and line 123.

   **Claim.** The README takes the twisting sheaves from SchemeAndStackFoundations §0.3 and names no
   pinned declaration for `H`, the class every statement of Layer 6 is about.

   **Witness.** Tau Ceti at the pin has `AlgebraicGeometry.Proj.twistingSheaf`
   (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/TwistingSheaf/Basic.lean:254),
   `AlgebraicGeometry.Proj.isInvertible_twistingSheaf_of_iSup_eq_top` (…/LocalTriviality.lean:212) and
   `lineBundleClass_twistingSheaf_eq_zpow` (…/TensorProduct.lean:257).

   **Repair.** Add a bullet under `### From Tau Ceti`: "`AlgebraicGeometry.Proj.twistingSheaf`
   (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/TwistingSheaf/Basic.lean:254), the sheaf `O(n)` on
   `Proj` of a graded ring; it is invertible when the standard opens of degree-one elements cover
   (`AlgebraicGeometry.Proj.isInvertible_twistingSheaf_of_iSup_eq_top`, LocalTriviality.lean:212),
   which holds for `K[x_0, …, x_d]` with the variables, and the class of `O(n)` is the `n`-th power of
   the class of `O(1)` (`lineBundleClass_twistingSheaf_eq_zpow`, TensorProduct.lean:257)." In the
   Conventions bullet on projective space write "`H` is the class of Tau Ceti's
   `AlgebraicGeometry.Proj.twistingSheaf` for `n = 1`", and add the three names to the `*Needs:*` line
   of §6.2 and to the Dependencies of Layer 6. The module docstring's reason for the projective-space
   group (the rational map `[F_0 : ⋯ : F_d]` is missing) is unaffected.

3. **F03** (P3) "each item names where it belongs" is false for four of the five items

   **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md` line 25: "The following lie
   outside this roadmap; each item names where it belongs."

   **Claim.** Every item of the list names the roadmap that owns it.

   **Witness.** Only the first item (line 27) names an owner, "DynamicalDegreesOfRationalMaps, Part
   II". Lines 28, 29, 30 and 31 (the Dinh–Sibony bound, b-classes, arithmetic degrees,
   correspondences and resolution) name none.

   **Repair.** Replace line 25 by "The following lie outside this roadmap." The `## Downstream
   consumers` section already says which later roadmaps take up three of the four.

4. **F04** (P3) Locator lists omit locators the text cites

   **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md` line 805 (References, Stacks):
   "*Morphisms* (Lemmas 6.7, 26.16, 38.7; Definition 52.8; tags 056B, 081I, 0892, 02NY)";
   `packages/DynamicalDegreesOfRationalMaps/sources.toml`, entry `dang2020`, field `locator`.

   **Claim.** The lists give the locators cited from each source.

   **Witness.** README line 192 cites stacks-morphisms Lemma 6.8 (stacks-morphisms line 493,
   tag 0CNG), which line 805 omits (the manifest has it). README lines 27 and 777 cite dang2020
   Theorem 2 and Theorem 4 (dang2020 lines 122 and 176); the manifest's `locator` for `dang2020` has
   neither.

   **Repair.** Line 805: "*Morphisms* (Lemmas 6.7, 6.8, 26.16, 38.7; Definition 52.8; tags 056B, 0CNG,
   081I, 0892, 02NY)". Line 796: "Theorems 1–4, Proposition 3.4.1, Theorem 3.4.4, Theorem 5.2.1".
   Manifest `dang2020`: `locator = "Theorem 1; Theorem 2; Theorem 3; Theorem 4; Proposition 3.4.1;
   Theorem 3.4.4; Theorem 5.2.1"`.

Four findings: one P2 (headline theorems that are statable at the pins are absent from
`Suggested.lean`, and the docstring's reason for their absence does not hold) and three P3 (a
pinned Tau Ceti object not cited, one false sentence in the scope section, incomplete locator
lists). No statement was found false: the mathematics, the source locators, the supplier citations
and the pinned declarations all checked out, and the file elaborates. The details of what was
checked are under `## Verified sound`.

No previous review of this package exists, and no maintainer notes were left for it.

## Verified sound

**Elaboration.** `lake env lean` on `packages/DynamicalDegreesOfRationalMaps/Suggested.lean`, run
from the content repository: exit 0, 17 warnings, all `declaration uses sorry` (lines 90, 140, 154,
181, 194, 211, 230, 254, 304, 317, 327, 337, 347, 357, 371, 385, 395). No `set_option`, no `lemma`,
no `#check`/`#eval`, no sorry'd data: the 11 definitions and 2 instances have real bodies. Imports:
`import Mathlib` and five `TauCeti.*` modules, each used (`eulerCharBelow`, `intersectionNumber`,
`LineBundleClass.pullback`, `functionFieldMap`, `IsProjectiveOver`).

**Binders.** Compared the elaborated types of all 30 declarations in the worker's
`signatures.md` with the README statements: no section variables are used (every binder is in the
declaration's own signature), nothing lost. README generality equals the Lean's in each of the 17
theorems (real classes as formal combinations, `p + q = d` for `(d − k, k)`).

**Padding probe.** Each of the 17 sorried theorems was tried, on a scratch copy, with `rfl`,
`simp`, `infer_instance`, `trivial` and `positivity`: none closes any of them (17 of 17 fall through
to `sorry` under each tactic). None restates a definition, mirrors a Check or computes a value. The
two proved instances are needed to state the conjugation and iteration theorems; Mathlib has no
instance giving dominance of `PartialIso.toRationalMap` (`Opens.isDominant_ι`, UnderlyingMap.lean:264,
takes density as an explicit argument).

**Headline theorems** (README lines 144–151) against the file:

| headline | stated as |
| --- | --- |
| graph (§1.2) | `graph_isIntegral_and_projections` |
| Khovanskii–Teissier, Siu for products (§§3.5–3.6) | `khovanskii_teissier`, `siu_inequality_products` |
| positivity and boundary values (§4.2) | `mixedDegree_pos`, `mixedDegree_boundary` |
| invariance under field extension (§4.3) | absent: R01 |
| sub-multiplicativity, comparison (§§4.4–4.5) | `mixedDegree_comp_le`, `exists_mixedDegree_comparison`, `exists_mixedDegree_birational_comparison` |
| `λ_k`, `h_alg` (§§5.1–5.4) | `tendsto_dynamicalDegree`, `one_le_dynamicalDegree`, `dynamicalDegree_eq_of_polarizations`, `dynamicalDegree_iterate`, `dynamicalDegree_zero_and_top`, `dynamicalDegree_log_concave`, `dynamicalDegree_birational_conj`, `algebraicEntropy_iterate`, `algebraicEntropy_bounds`; field extension absent: R01 |
| projective space (§§6.2–6.4) | named in the docstring as not statable (no rational map attached to forms at the pins); accepted |

**Pinned declarations.** Opened every Mathlib and Tau Ceti declaration the README cites with a
file and line: 58 Mathlib locators in 26 files and 36 Tau Ceti locators in 22 files. All 94 are at
the cited line with the cited name. Statements relied on were read at the pin:
`eulerCharBelow` sums over `i < n` with junk `0` (EulerCharacteristic.lean:105);
`intersectionNumber` is `eulerDegree` of the pullback (IntersectionNumber/Basic.lean:111);
`IsProjectiveOver` is a closed immersion over `R` into `Proj(Sym_R M)`, `M` finite
(ProjectiveOver.lean:57); `finrank_eq_finrank_fieldRange_functionFieldMap` assumes integral,
finite, flat, dominant (FlatDegree.lean:87); `nonempty_functionField_algEquiv_of_isPullback`
assumes `Algebra.IsAlgebraic` (Geometrically/FunctionField.lean:111);
`RationalMap.comp` needs the first map dominant (Composition.lean:155); `Subadditive.lim` is
`sInf` over `n ≥ 1` and `tendsto_lim` needs `BddBelow` over all `n` (Subadditive.lean:106, 155);
`equivFunctionFieldOver` needs `X` integral and `Y` locally of finite type (RationalMap.lean:562).
Searched the pins for the package's own objects: no graph of a rational map, no iterate, no
several-bundle intersection number, no nefness.

**Supplier citations**, each resolved at the supplier's current text (main, or the open head the
tools give):

- CyclotomicClassGroupsAndStickelberger §4.3 (main, README line 798): numerical intersection as
  the coefficient of `n₁⋯n_d`, polynomiality, symmetry, additivity, projection formula with the
  function-field degree, Cartier restriction, ample positivity, field extension. All six consumed
  items are there.
- AlgebraicModuliForArithmeticGeometryPartII (open head) §0.1 (length-weighted law, field
  extension), §1.1 (`Num`, `N¹`), §1.2 Checks (`ρ(E × E) = 2 + rank End(E)`), §1.4 Checks (nef cone
  of `E × E` as positive semidefinite matrices), §1.5 (nef, pullback, base change), §1.7 (ii), (iii),
  (v) and its API (ample is positive on curves; `L^m ⊗ E` ample). Its acceptance file declares
  `IsNef` in its own namespace with the same convention (integral closed curves of dimension one,
  Tau Ceti's `intersectionNumber`); the fully qualified names differ.
- AlgebraicModuliForArithmeticGeometry (open head) §1.4 (very ample), §5.4 (schematic image, equal
  to `Scheme.Hom.image` for schemes, flat base change), §9.10 (`nefMixedIntersectionBound`, smooth,
  geometrically integral, characteristic zero: the README's stated difference holds).
- ArakelovGeometryAndAbelianHeightsPartII (open head) §0.1 (geometric nefness), §0.3 (1′), (2′),
  for `d ≥ 1`, over any field.
- LefschetzPencilsAndVanishingCycles (open head) §5.1: Bertini irreducibility is stated there as
  part of the target.
- SchemeAndStackFoundations (main) §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16,
  4.19, 5.1–5.3, 5.9, 5.10: headings exist; read §4.16, §4.19, §5.9 (`Chow.intersectionNumber`
  with the dual convention, equal to the mixed coefficient) and §5.10 (`hodge_index` for `H² > 0`,
  no positivity of `H`).
- StableReduction (main) Layer 2; ArithmeticDynamics (open head) §§0.18, 0.26.

**Dependency check** (command of the brief): `depcheck: 238 roadmaps, 2256 edges, 0 problem(s)`. No
UPWARD or CYCLE line. All eight supplier roadmaps are on main or earlier in the merge order; none
is on the never-cite list. No gaps are declared and none is needed.

**Sources.** All 15 sampled targets and every line locator of the README into the 13 readable
sources were opened at the cited lines (about 95 locators); all agree with the text in theorem
number, line and hypotheses. Among them: dang2020 lines 27–41, 141, 842–883, 1281–1358; truong2020
lines 77–89, 143–181, 763, 999–1003, 1101–1106, 1529–1544; dangfavre2021 lines 83–84, 148–180,
427–467; dinhsibony2005 lines 33–37, 45–51, 61–70, 245–263; guedj2010 lines 1099–1147, 1178–1181,
1272–1282; silverman2014 lines 43–45, 350–413; russakovskiishiffman1997 lines 499–552, 582–583;
cutkosky2015 lines 274–287, 983–1033; kleiman2005 lines 3624, 3803; stacks-varieties lines 691,
4679, 4716, 4754, 4778, 4784; stacks-chow line 3995; stacks-morphisms lines 488, 493, 2198, 3862,
6046; stacks-constructions line 1267. Where a source proves less than the README states (normal
varieties, algebraically closed fields, `ℂ`), the README says so at the citation.

**Shape.** Summary, scope, conventions, supplier contracts, build paragraph, six layers each with
`### Examples` and `### Dependencies`, downstream consumers, worked examples, references. 27
subsections, each with `*Needs:*`, locators and between 3 and 8 Checks. No LaTeX delimiters, no
process words, dates, paths or pull-request numbers. All 30 Lean names appear in the README and
every backticked name of the roadmap's own is declared.

**Adversarial table** (values computed in this review).

| statement | instance | values | result |
| --- | --- | --- | --- |
| Conventions, `numericalIntersection` | `ℙ¹`, `r = 1`, `O(−2)`; `r = 0`, `Spec L` | `−χ(O) + χ(O(−2)) = −1 + (−1) = −2`; `h⁰(O) = [L : K]` | sign and truncation right |
| §1.1 `e(f)` | `z²` in char 2; Frobenius of `ℙ^d`; projection `ℙ² ⤏ ℙ¹` | `2`; `p^d`; junk `0` with `trdeg 1` | counts inseparable degree; junk case excluded by equal dimension |
| §1.1 rank agreement | cuspidal normalization | `e = 1`, rank at cusp `1`, fibre `K[t]/(t²)` of dimension `2` | flatness needed only for the fibre reading |
| §1.2, `graph_isIntegral_and_projections` | `K = ℚ` or `ℂ`, absolute product | `Γ ⊆ X ×_K Y` closed in `X × Y`; `X ×_K Y → X` proper although `X × Y → X` is not of finite type | properness of `graphFst` true |
| §1.3 | `f = g = z²` | `(q_Y, q_Z)` of degree `2 = e(f)`, not `4` | right |
| §1.4 | `ℙ¹_ℂ/ℝ`; `𝔾_m → 𝔸¹` at the origin | two diagonals; image `∅` against inverse image a point | hypotheses needed |
| §2.1 | double point; line and point; `V(xy)` | `2 = 2·1`; `1`; `1 + 1` | right |
| §2.2 | blow-up of `ℙ²`, `E` | `χ(O(bE)) = 1 + (b − b²)/2`, mixed coefficient `−1` | right |
| §2.3 | `[O(1,0)] + [O(0,1)] − [O(1,1)]` | `0 + 0 + 2 + 2 − 2 − 2 = 0` | well defined on classes |
| §2.4 | `x² + ty²` over `𝔽₂(t)`; `ℙ¹_ℂ/ℝ` | `K' = K(√t)`, `c_V = 2`, `2 = 2·1`; `c_V = 2` | right |
| §3.1 `E × E` | `A = (1+√2)F₁ + (2+√2)F₂ − √2Δ` | matrix `[[1,√2],[√2,2]]`, `det 0`, trace `3`; degrees `2, 1, 3+2√2`; decomposition of `A + F₁ + F₂` recomputed coefficient by coefficient | right |
| §3.1 approximation | `(2.41, 3.41, −1.42)`, `δ = 1/5`, `N = 100` | `det = −0.0463`; with `δH`: `0.5897`; `[[119,142],[142,219]]`, `det 5897` | right; route inequality `(β·C) ≥ 0` rederived |
| §3.2 | `O(1,−1)`; `V(x²)` | `−2`; `2n + 1`, so `2` | right |
| §3.3 | `p, q` route; `E × E` | `vol ≥ p^{r−1}(p(A^r) − rq(A^{r−1}B))`; `24 ≤ 30` | right |
| §3.4 | `D''` | `(D''²) = (H'²)((H'²)(D²) − (D·H')²)`; blow-up `H = 2L + E`: `3`, `−1`, `1 ≥ −3`, `4 ≥ 3`; two points: `0 < 1` | right; `(H²) > 0` needed |
| §3.5, `khovanskii_teissier` | `O(2,1), O(1,1)`; `E × E`; `ℙ² ⊔ ℙ²` | `9 ≥ 8`; `(3+2ε)² − (12ε+4ε²) = 9`; `16 < 25` | right; integrality needed and present |
| §3.6, `siu_inequality_products` | telescoping; `(ℙ¹)³`; `i = 0, r`; `B = O(1,0)`; `i = j = 0` | degrees of `x_j`, `y_j` all `r`; `6 ≤ 8`; equalities; `0 ≤ 2`; `[L:K]² ≤ [L:K]²`; `(r−i+1)^i ≥ binom(r,i)` | right |
| §4.2, `mixedDegree_boundary`, `mixedDegree_pos` | `d = 0`; `z²`; `ω = O(1,0)` | `[K(X):K] = [K(X):K(Y)]·[K(Y):K]`; `(1, 2)`; `0` | right; bigness needed |
| §4.4, `mixedDegree_comp_le` | route on `W`; Frobenius then `z²`; `k = 0, d` | `e(f₁)(L₂^d)·deg ≤ (d−k+1)^k·e(f₁)·deg·deg`; `2p = p·2`; equalities | right; `k = q`, `d − k = p` matches |
| §4.5 | `O(1,1)`, `O(2,1)`, swap; `E × E` | `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `25/4, 25/64`, `C = 25`, `9` against `2` | right |
| §5.1, `tendsto_dynamicalDegree` | `d = 0`; morphism of degree `a`; `n = 0` term | `C₀·[L:K] = 1`; inf `a^k` not attained for `0 < k < d`; `x^0 = 1` harmless | right |
| §5.2 statements | `m = 0`; `d = 0`; Frobenius | `1 = λ^0`; `λ₀ = 1 = e`; `p^k`, equality in log-concavity | right |
| `algebraicEntropy_bounds` | `d = 0` (junk `λ₁`) | `0 ≤ 0 ≤ 0·log(junk) = 0` | true at the junk value |
| `dynamicalDegree_birational_conj` | order of composition | `φ.symm` first, then `f`, then `φ`: `φ ∘ f ∘ φ⁻¹` on `Y` | right |
| §6.1 | Cremona twice; `(0,0,1)` then `σ`; `d = 0` | `h = x₀x₁x₂`; `G(F) = 0`; reduced form `(1)` | right; `d ≥ 1` needed and stated |
| §6.3 | Fibonacci `n = 2, 3`; inverse | `[xyz : xy² : z³]` by direct substitution; degrees `3, 5`; `(u,v) ↦ (v/u, u)` | right |
| §6.4 | `(x², y)`; Silverman's map | `[x₀² : x₁² : x₀x₂]`, base point `[0:0:1]`, `2^n`; degrees `2, 3, 5 = fib(n+2)` | right (see Source issues) |
| R01 statements | `ℙ¹_ℂ/ℝ`; Cremona `ℚ → ℂ` | `2 = 1 + 1`; `(1,2,1)` and `1` on both sides | true; elaborate |

**Duplication and ownership.** Searched all roadmaps (main and open heads) by object: "dynamical
degree", "algebraic entropy", "graph of a rational map", "Khovanskii", tag 0BES, tag 0BFI, "Siu".
No other roadmap owns the graph, the degrees, the dynamical degrees or the entropy. Shared objects
are all cited, not restated: numerical intersections (CyclotomicClassGroupsAndStickelberger §4.3),
nefness and Kleiman (AlgebraicModuliForArithmeticGeometryPartII §§1.5, 1.7), volume and Siu
(ArakelovGeometryAndAbelianHeightsPartII §0.3), the surface pairing and Hodge index
(SchemeAndStackFoundations §§5.9–5.10), flat base change of images
(AlgebraicModuliForArithmeticGeometry §5.4, which NashBlowups cites for the same). §2.2 is the
general form of the surface comparison of SchemeAndStackFoundations §5.9, and §3.5 the general form
of AlgebraicModuliForArithmeticGeometry §9.10; the README states both differences. No declaration
of `Suggested.lean` has the fully qualified name of a declaration of another roadmap. The overlap
file lists no dropped id, no revision-only id, no other pull request changing this roadmap and no
second copy.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, NashBlowups, SchemeAndStackFoundations, JacobianChallenge (the third list is empty); nefness, the nef cone and Kleiman's theorem: AlgebraicModuliForArithmeticGeometryPartII; volume and Siu's bigness inequality: ArakelovGeometryAndAbelianHeightsPartII; the surface pairing, Hodge index, modifications, alterations, Chow groups: SchemeAndStackFoundations; nothing shared with the other three.

**Copyright.** Compared 10 passages with the sources at their locators: the graph (§1.2) with
dinhsibony2005 line 45 and dang2020 line 21; Siu's inequality and its route (§3.3) with dang2020
lines 842–866; the product inequality and its telescoping (§3.6) with dang2020 lines 871–883;
sub-multiplicativity (§4.4) with dang2020 lines 1281–1358; existence of the limit (§5.1) with
silverman2014 lines 383–413; the Fibonacci map (§6.3) with silverman2014 lines 358–372; the
definition of a correspondence (Scope) with truong2020 lines 77–89; the non-integral
counterexample (§3.5) with cutkosky2015 lines 1014–1020; forms without common factor (§6.1) with
silverman2014 lines 43–45; the docstring of `khovanskii_teissier` with cutkosky2015 lines 983–985.
No run of six or more consecutive shared words outside formulas; the routes use the roadmap's own
notation and, in §§3.3–3.6 and §5.1, different arguments. The layers (graph; intersection numbers;
positivity; degrees; dynamical degrees; projective space) do not map onto the sections of
dangfavre2021 (positive cycles; b-classes; b-divisors; spectral interpretation; spectral gap;
polynomial maps) nor onto those of dang2020 (Chow group; numerical cycles; positivity; relative
classes; dynamics; semi-conjugation). The order of the layers is forced by their Dependencies
lines (Layer 3 on 2, Layer 4 on 1–3, Layer 5 on 4, Layer 6 on 5). No table, figure or list is taken
over; the worked-examples table is the roadmap's.

Source independence: 10 passages compared with 6 sources, none shared; largest share dangfavre2021, 16 of 100 locators; contents compared with dangfavre2021 and dang2020: independent.

## Not verifiable

- lazarsfeld2004 (Theorems 1.4.9, 1.6.1, 2.2.15, Corollaries 1.4.10, 1.6.3) and fulton1998
  (Theorem 1.4, Proposition 2.5): recorded as uncertified, text not read. dang2020 line 842 and
  line 850 cite Lazarsfeld's Theorem 2.2.13 for the statement the README attributes to Theorem
  2.2.15; which number is right could not be checked without the text. dangfavre2021 line 466 and
  cutkosky2015 lines 990–996 agree with the README's Corollary 1.6.3 and Theorem 1.6.1.
- The sections of SchemeAndStackFoundations cited only for standard background (§§0.3, 0.7, 0.11,
  0.20, 0.30, 2.6, 3.3, 5.1–5.3) and StableReduction Layer 2 were checked by heading and by the
  sentences found by search, not read in full.
- The packages under review on the board other than this one (two are listed) were not opened;
  neither name concerns this subject.

## Source issues

- **Misprint** in dang2020 at Theorem 3.4.4, last display of the proof (line 883): the source says the constant is `(n − i + 1)^i`; it should be `(r − i + 1)^i`, as in the statement (line 874) for a subscheme of dimension `r`; affects nothing.
- **Misprint** in silverman2014 at Example 6, p. 9 (line 376): the source says the `n`-th iterate has degree the `n`-th Fibonacci number; it should be the `(n+2)`-th in the indexing of Example 5, the degrees being 2, 3, 5; affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a) (line 1180): the source says the log-concavity inequality with lower bound 1 holds for all `l` from 1 to `k`; it should be for `l` from 1 to `k − 1`, since `λ_{k+1}` is not defined; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "50746dc053bef6cef6a856103c9635ca8830742b", "job": "REV-PKG-DynamicalDegreesOfRationalMaps", "model": "fable", "worker": "chris-x89"} -->
