# PORT-DynamicalDegreesOfRationalMaps

## Result

- Branch: `roadmap/dynamical-degrees-of-rational-maps`, from `51d880d`.
- Head commit: `14cf9afe` "DynamicalDegreesOfRationalMaps: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/DynamicalDegreesOfRationalMaps/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder changed.
- Build (`lake build TauCetiRoadmap.DynamicalDegreesOfRationalMaps.Suggested`): `Build completed successfully (19046 jobs).` There are 19 warnings, and all of them are `declaration uses 'sorry'` (lines 91, 142, 156, 183, 196, 215, 239, 258, 283, 334, 347, 357, 367, 377, 387, 401, 421, 438, 448). There are no other messages.
- Gate: `gate DynamicalDegreesOfRationalMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (command of the brief, run on the committed README):

  ```text
  depcheck: 242 roadmaps, 2267 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 367. Its suppliers come earlier: LefschetzPencilsAndVanishingCycles (76), ArithmeticDynamics (363) and ArakelovGeometryAndAbelianHeightsPartII (366). The rest are on main.

## Draft pull request body

This roadmap builds the degree theory of dominant rational maps between projective varieties over an arbitrary field, up to dynamical degrees and algebraic entropy. Over any field, inseparable degree included, it constructs the following objects:
- the pullback of function fields along a dominant rational map, and the topological degree `e(f)`;
- the graph `Γ_f` and the correspondence of a composite;
- Euler-characteristic intersection numbers with real coefficients.

On these it proves a positivity package over every field:
- Kleiman nonnegativity for all nef real classes;
- Siu's inequality;
- the Hodge inequality on possibly singular surfaces;
- the Khovanskii–Teissier inequalities;
- Siu's inequality for products.

With these it defines the mixed degrees `deg_k(f; L, M) = (π_1^*L^{d−k}·π_2^*M^k)_{Γ_f}` and proves their positivity, boundary values and invariance under extension of the field. Its main estimate is sub-multiplicativity with the constant `(d − k + 1)^k/(L_2^d)`, from which the comparison of polarizations and birational conjugacy follow. The end theorems concern the dynamical degrees `λ_k(f)`:
- they exist, both as limits and as infima;
- they lie in `[1, ∞)` and do not depend on the real polarization;
- `λ_k(f^m) = λ_k(f)^m`, `λ_0 = 1` and `λ_d = e(f)`;
- they are log-concave;
- they are invariant under birational conjugacy and extension of the field;
- with them come the bounds and the scaling under iteration of `h_alg = log max_k λ_k`.

A last layer computes on projective and affine space: maps given by forms, the Cremona involution, the Fibonacci map with `λ_1` the golden ratio, Frobenius, and polynomial self-maps. Dynamical degrees are the basic numerical invariants of algebraic dynamics. Building them over an arbitrary field, instead of over `ℂ` or an algebraically closed field of characteristic zero, makes them available to arithmetic dynamics. The intersection-theoretic positivity package is reusable well beyond dynamics. `Suggested.lean` states 19 headline theorems against the pinned Mathlib and Tau Ceti. The projective-space computations are not stated there: no library at the pins has the rational map attached to homogeneous forms.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Dependencies that are still pull requests

- ArakelovGeometryAndAbelianHeightsPartII: §0.1 for geometric nefness, and §0.3 (2′), Siu's volume inequality, which is used in the route of §3.3.
- LefschetzPencilsAndVanishingCycles: §5.1, Bertini irreducibility, which is used in the routes of §§3.5–3.6.
- ArithmeticDynamics: §§0.18 and 0.26, which are used only in Checks of §§6.1–6.2.

Every other supplier is on main:
- CyclotomicClassGroupsAndStickelberger §4.3;
- AlgebraicModuliForArithmeticGeometryPartII §§0.1, 1.1, 1.2, 1.4, 1.5, 1.6, 1.7;
- AlgebraicModuliForArithmeticGeometry §§1.4, 5.4 (and §9.10 in Scope);
- SchemeAndStackFoundations §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1–5.3, 5.9, 5.10;
- StableReduction Layer 2.

The overlap file lists no open pull request that drops an id cited here, and no id defined only by an open revision. For SchemeAndStackFoundations, the open multi-roadmap revision drops none of the cited sections.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test rule:
- 19 sorried headline theorems;
- 11 definitions with real bodies, each needed to make a headline statable;
- 2 instances with real proofs, needed for elaboration. `isDominant_iterate` makes `iterate f m` usable as a dominant map. `isDominant_partialIso` makes the conjugate `φ ∘ f ∘ φ^{−1}` composable.

There is no sorried data, no `example`, no `set_option` and no padding. The imports are `import Mathlib` plus five `TauCeti.*` modules. Each is used and exists at the pin.

The README's headline list matches the file:
- §1.2: `graph_isIntegral_and_projections`;
- §§3.5–3.6: `khovanskii_teissier`, `siu_inequality_products`;
- §4.2: `mixedDegree_pos`, `mixedDegree_boundary`;
- §4.3: `mixedDegree_baseChange`;
- §§4.4–4.5: `mixedDegree_comp_le`, `exists_mixedDegree_comparison`, `exists_mixedDegree_birational_comparison`;
- §§5.1–5.4: the ten theorems on `λ_k` and `h_alg`.

The projective-space headlines (§§6.2–6.4) are named in the module docstring as not statable. I searched both pinned libraries for a construction of the rational map `[F_0 : ⋯ : F_d]` of forms and found none. Mathlib's `Proj.map`, Tau Ceti's `Proj.fromOfGlobalSections_map` and the chart-equality lemmas only compare or post-compose morphisms that are already given. So the docstring's claim stands.

The only change to the Lean file is the docstring of `graph`. The old text could be read as saying that the image lies in `X ×_K Y` for every `X`. The new text puts both independence of the representative and containment in `X ×_K Y` under reducedness, and says that both can fail for a nonreduced `X`, as the §1.2 Check shows. No type changed.

**Signature check.** I wrote `#check @name` for all 32 declarations into one scratch file, appended to a copy of the module, and elaborated it once with `lake env lean`. The result was exit 0 with only the 19 `sorry` warnings. The file has no section `variable`s, so every binder is in each declaration's own signature. I compared each elaborated type with its README statement:
- the field `K` is arbitrary and the classes are formal real combinations;
- nefness is a hypothesis wherever the README asks for it, and `0 < (ω^d)` wherever it asks for a polarization;
- `[GeometricallyIntegral (X ↘ Spec K)]` appears only in `dynamicalDegree_baseChange`;
- `mixedDegree_baseChange` has no geometric integrality;
- `mixedDegree_comp_le` assumes no positivity of `L₂`.

All 32 agree. Nothing changed relative to the package's elaborated signatures.

## Supplier replacements and duplication removals

None was needed.
- **Library declarations.** Every library declaration that the README cites with a file and line was checked at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, the revisions in the worktree manifest). All 89 are at the cited line under the cited name. I also elaborated `#check @name` for every other dotted library name in the README, 111 in all:
  - 109 resolve.
  - `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber_eq_finrank_mul` is in a module whose object file is not built on this host. I read it in the source at `TauCeti/AlgebraicGeometry/IntersectionNumber/FieldTower.lean:66`, inside `namespace TauCeti.AlgebraicGeometry` / `LineBundleClass`. `Suggested.lean` does not import that module.
  - `Chow.intersectionNumber` is SchemeAndStackFoundations' declaration of §5.9, and the README attributes it so.
- **Restatements.** No statement of the package restates a pinned declaration. `IsNef` and `numericalIntersection` are local only because roadmap modules cannot be imported, and the Scope section says so. AlgebraicModuliForArithmeticGeometryPartII's `IsNef` is for one line-bundle class; this one is for formal real combinations. The fully qualified names differ.
- **Duplication sweep by object**, with `roadmaps grep` over main and every open roadmap pull request, plus the board packages:
  - "dynamical degree", "algebraic entropy", "first dynamical degree", "relative dynamical degree", "graph of a rational map", "Fibonacci map", "coefficient of n_1": no match anywhere else.
  - "Khovanskii": only AlgebraicModuliForArithmeticGeometry §9.10. That is a characteristic-zero, smooth, ample-and-nef step, and the Scope states how §3.5 differs.
  - "Hodge index": SchemeAndStackFoundations §5.10 owns the smooth surface case and is cited. §3.4 here is the singular, arbitrary-field extension. The other hits are arithmetic or Weil-conjecture uses.
  - "Siu": ArakelovGeometryAndAbelianHeightsPartII §0.3 owns the volume inequality, which is imported. ArithmeticDynamics §4.3 is the arithmetic version. HeightsRationalPointsAndObstructionsPartII cites the same Arakelov §0.3.
  - Stacks tags 0BEM, 0BEP, 0BFI and 054Q: the hits are in CyclotomicClassGroupsAndStickelberger §4.3, the imported definition, and SchemeAndStackFoundations §§0.7 and 5.9, the cited surface comparison and geometric irreducibility.
  - "numerical intersection": the EnriquesSurfacesAndIntegralNonexistence lattice is Enriques-specific.
  - "Kleiman": AbundanceStatement is on the never-cite list and is not cited. AlgebraicModuliForArithmeticGeometryPartII §1.7 is imported.
  - Board packages under review (AnalyticNumberTheory, LawrenceVenkateshMethod) share nothing.
- **Ownership against open work** was checked against the sibling checkouts and `roadmaps show`/`grep` for the open heads. This roadmap owns the following because nobody else plans them:
  - the graph of a rational map;
  - the topological degree of a dominant rational map;
  - the general component formula and the Chow comparison of §§2.1–2.2 for every `r`;
  - the reduction lemma of §2.4;
  - the arbitrary-field positivity package of §§3.3–3.6;
  - the degrees and the dynamical degrees.

  No declaration of `Suggested.lean` has the fully qualified name of a declaration in another roadmap.

## README fixes from the reviewer's reading

1. **"Library has no …" claims moved into Scope and ownership.** The supplier contracts contained a free-standing sentence: "Mathlib has no graph of a rational map, no field homomorphism attached to a dominant rational map or morphism, no intersection numbers and no positivity of line bundles". The Tau Ceti contract contained the clause "Tau Ceti has no intersection numbers of several line bundles on a scheme of higher dimension". Both were removed there. Each claim now sits in its Scope bullet:
   - graph: "Neither Mathlib nor Tau Ceti has the graph of a rational map";
   - intersection numbers: "Mathlib has no intersection numbers, and Tau Ceti has only the case of one line bundle on a curve, `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber`";
   - ampleness: "Mathlib has no positivity notion for line bundles".

   I verified each claim at the pin. Mathlib's `AlgebraicGeometry` has no `Ample`, no nef, no graph and no function-field map. In Tau Ceti the only graph-like declarations are `graphSection` and `graphDivisor`, which are not graphs of rational maps.
2. **§3.3: an unused import and a process-style sentence removed.** The sentence was "A nef line bundle `A` with `(A^r) > 0` is big by …PartII §1.6, and `vol(A) = (A^r)` by …PartII §0.3 (1′) … This is imported, not a target, and the route below does not use it." It stated an imported fact that nothing uses, in the voice the house style forbids outside Scope. With it gone, the Hilbert–Samuel formula (1′) is consumed nowhere. So I also removed it from the ArakelovGeometryAndAbelianHeightsPartII contract and from the Scope bullet, which now lists the volume and (2′) only. AlgebraicModuliForArithmeticGeometryPartII §1.6 is no longer a Layer 3 dependency. It stays in the contracts for the Conventions' identification of big-and-nef line bundles.
3. **§5.2: the route for `λ_k(f) ≥ 1` was missing**, and the statement was unsourced within the section. Added: for an ample line bundle `ω`, which exists because `X` is projective, every `deg_{k,ω}(f^n)` is a positive integer (§4.2). Its `n`-th root is therefore at least 1, and independence of the polarization (§4.5) carries the bound to every real polarization. Both are already in the §5.2 *Needs:* line.
4. **Conventions: the multiplicative notation of the Lean carrier.** The README writes `Pic(X)` additively. Tau Ceti's `LineBundleClass X` is a multiplicative commutative group, and `numericalIntersection` uses `∏ i ∈ s, a i` for `Σ_{i ∈ S} L_i`. I added this sentence with a witness, `AlgebraicGeometry.Proj.lineBundleClass_twistingSheaf_eq_zpow`, which writes the class of `O(n)` as the `n`-th power of the class of `O(1)`.
5. **Lean `graph` docstring.** See above.

The accepted review had no open findings. Its last two P3 notes are present in the ported text:
- the Tau Ceti overlap lemmas of §6.1;
- `proper_fibreDimension_vanishing` in the SchemeAndStackFoundations §2.6 contract.

The red-team repairs are present as well: the §5.1 `Submultiplicative` route, the new Checks in §§1.3, 4.1 and 5.1, and `canonicallyOverPullback`.

## Adversarial mathematics pass

Values computed in this pass. "Package" means the value agrees with the package text, and I recomputed it here.

| statement | instances tried | values computed | result | change |
| --- | --- | --- | --- | --- |
| Conventions: `numericalIntersection` as a mixed difference | `P = n₁² + n₁n₂`; `ℙ¹`, `O(−2)`, `r = 1`; truncation at `1`; `r = 0` on `Spec L` | `2 − 1 − 0 + 0 = 1`; `(0 − 1) − (1 − 0) = −2`; truncated `0 − 1 = −1`; `h⁰ = [L:K]` | coefficient extraction and truncation `r + 1` right | none |
| Conventions: Lean's `LineBundleClass` is multiplicative | `ℙ¹`, `r = 1`, `a = [O(1)]` | `∏` over `{0}` is `[O(1)]`; `χ(O(1)) − χ(O) = 2 − 1 = 1`; `[O(1)]·[O(1)] = [O(2)]` | consistent with the additive prose | sentence and witness added |
| Conventions: composition order | `f = z²`, `g = z + 1`, at `z = 1` | `f.comp g` gives `2`; `f ∘ g` gives `4` | Mathlib applies `f` first | none |
| Conventions: degree index | `z²` on `ℙ¹`, `H` | `deg_0 = 1`, `deg_1 = 2 = e`; the reversed index gives `deg_1 = 1` | right | none |
| §1.1, `topologicalDegree` | `z²` in characteristic 2; Frobenius of `ℙ^d`; projection `ℙ² ⤏ ℙ¹`; `d = 0`, `Spec L₁ → Spec L₂` | `2` (separable degree `1`); `p^d`; junk `0` (transcendence degree `1`); `[L₁:L₂]` | right; equal dimensions in every theorem using it | none |
| §1.1, cusp normalization | `K[t², t³] ⊆ K[t]` | `e = 1`; fibre `K[t]/(t²)`, dimension `2`; Mathlib rank `1` | flatness needed only for fibre dimension | none |
| §1.2, `graph_isIntegral_and_projections` | representative not chosen over `K`; absolute product with `K = ℚ`; nonreduced `Spec k[x,y]/(xy, y²)`, `k = ℚ(t)`; constant map | two maps of reduced `V` to `Spec K` agreeing on a dense open are equal; `X ×_ℤ Y → X` is not proper, but `Γ ⊆ X ×_K Y` is closed, so `π₁` is proper; `a ↦ a + a′y` is a ring map since `y² = 0`, and its graph is not in `X ×_k Y`; `π₂` has image a point | true under the integral hypotheses present | docstring of `graph` clarified |
| §1.3, `W_{f,g}` | `f = z²`, `g = id`; `f = id`, `g = z²` | degree `2 = e(f) ≠ e(g) = 1`; degree `1 = e(f) ≠ e(g) = 2` | degree is `e(f)` | none |
| §1.4, characterization of `f_{K′}` | conjugation on `ℙ¹_ℂ`; absolute Frobenius over `𝔽_p(t)` | `π ∘ c = π` but `i ↦ −i`; `π ∘ Φ = F ∘ π` but `t ↦ t^p` | the condition "over `K′`" is needed and present | none |
| §2.1, component formula | `K[ε]/(ε²)`; line plus point, `r = 1`; `V(xy)` | `2 = 2·1`; `χ(O_Z(n)) = n + 2`, coefficient `1`; `1 + 1` | right | none |
| §2.2, Chow comparison | blow-up of `ℙ²`, `K_S = −3L + E` | `D·(D − K) = b − b²` for `D = bE`, so `χ(O(bE)) = 1 + (b − b²)/2`; coefficient of `n₁n₂` is `−1 = (E²)` | right | none |
| §2.3, `realIntersection` | `[O(1,0)] + [O(0,1)] − [O(1,1)]` on `ℙ¹×ℙ¹`; `√2·O(1,0) + O(0,1)`; empty support | nine terms `0+1−1+1+0−1−1−1+2 = 0`; `2√2`; `0` | depends only on the class | none |
| §2.3, `IsNef` | `2·O(1,1) − O(1,0)`; `d = 0` | the class of `O(1,2)`, degrees `2, 1`; no curves, so every class is nef (as in AlgebraicModuliForArithmeticGeometryPartII §1.7, Checks) | right | none |
| §2.4, reduction | `x² + ty²` over `𝔽₂(t)`; `ℙ¹_ℂ/ℝ` | `χ(O(n)) = 2n + 1`, `c_V = [K(√t):K]·1 = 2`, `2 = 2·1`; `c_V = 2` | right | none |
| §3.1, ample approximation | `E×E`, `A = [[1,√2],[√2,2]]`; `A + I` decomposition; `m = 3`, `n = 3`, `δ = 1/5`; `(2.41, 3.41, −1.42)`; `N = 100` | `det A = 0`, eigenvalues `0, 3`, degrees `2, 1, 3+2√2`; entries `2, √2, 3` from coefficients `2−√2, √2−1, 1, 5−3√2 > 0`; `3H − Δ = [[2,1],[1,2]]` and `2H − Δ` singular; tolerance `1/90`, deviations `0.0042`, `0.0042`, `0.0058`; `det = −0.0463`, then `0.5897`; `[[119,142],[142,219]]`, `det = 5897` | right | none |
| §3.2, Kleiman | `O(1,−1)`; `V(x²)` | `−2` (not nef); `2n + 1`, so `2` | right | none |
| §3.3, Siu | `ℙ¹×ℙ¹`, `A = O(1,1)`, `B = O(1,0)`, `C = O(0,1)`; `E×E`, `A = A₀ + I`, `B = A₀`, `C = I` | `2 = 2`; `(A²) = 8`, `(A·A₀) = 3`, `(A·I) = 5`, `24 ≤ 30` | right | stray sentence removed |
| §3.4, Hodge | `H = 2L + E` on `Bl_p ℙ²`; two blow-ups, `H = E₁`, `D = E₂`; `D″` | `(H²) = 3`, `(H·E) = −1`; `1 ≥ −3`, `4 ≥ 3`; `0 < 1` without `(H²) > 0`; `(D″·H′) = 0`, `(D″²) = (H′²)((H′²)(D²) − (D·H′)²)` | right | none |
| `khovanskii_teissier` | `O(2,1)`, `O(1,1)`; `ℙ² ⊔ ℙ²`; `A + εI` on `E×E`; `m = 0` | `9 ≥ 8`; `16 < 25` (integrality present); difference `(3 + 2ε)² − (12ε + 4ε²) = 9`; Hodge for nef classes | right | none |
| `siu_inequality_products` | `(ℙ¹)³`, `i = 2`, `j = 1`; `i = 0`; `j = 0`; `ℙ² ⊔ ℙ²`; `B = O(1,0)` | `6 ≤ 4·1·2 = 8`; equalities; `5 > 2` (integrality present); `0 ≤ 2` | `(j+1)^i = (r−i+1)^i` | none |
| `mixedDegree` direction | `z²` on `ℙ¹` | `π₂^*O(1) = O(2)` on `Γ ≅ ℙ¹`; reversed operator gives `1` | right | none |
| `mixedDegree_pos` | `ω = O(1,0)`, `f = id`; `d = 0` | `0` (bigness hypothesis present); `[L:K] > 0` | right | none |
| `mixedDegree_boundary` | `z²`; `d = 0` | `(1, 2)`; `[L₁:L₂]·[L₂:K] = [L₁:K]` | right without nefness | none |
| `mixedDegree_baseChange` | `ℙ¹_ℂ/ℝ`, `f = id`; `K′ = K` | `2 = 1 + 1` on the two diagonals; trivial | true without geometric integrality | none |
| `mixedDegree_comp_le` | `d = k = 1`; `d = 1`, `k = 0`; `d = 0`; Cremona; `E×E` with `L₂ = I`; `L₂ = O(1,0)` | equality `e(f₂f₁)(L₂)(L₃) = e(f₁)(L₂)·e(f₂)(L₃)`; `(L₂)(L₁) = (L₁)(L₂)`; `[L₂:K][L₁:K]` on both sides; `1 ≤ 8`; `0 ≤ 9`; `0 ≤ 2` | `(p+1)^q = (d−k+1)^k`; no positivity of `L₂` needed | none |
| `exists_mixedDegree_comparison` | swap on `ℙ¹×ℙ¹`, `O(1,1)`, `O(2,1)`; `E×E`, `I`, `A + I` | `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `c = 25/4, 25/64`, `C = 25`, degrees `2` and `tr = 2 + 7 = 9` | `∃ C` before `∀ f` | none |
| `exists_mixedDegree_birational_comparison`, `dynamicalDegree_birational_conj` | order of `comp` | `φ.symm` then `f` then `φ`: a self-map of `Y`; cuspidal cubic with `f = id`: `λ = 1` on both sides | right | none |
| §4.2, monotonicity | `L′ = 1.5·O(1,0) + 0.5·O(0,1)`; `E×E` | `2 → 1.5` with `L′ − L` not nef; `0 ≤ 3 ≤ 8` | right | none |
| `tendsto_dynamicalDegree` | Cremona, `k = 1`, `C = 2`; `ω = H/2`, `f = id` on `ℙ^d`; `d = 0` | `v_n = 4, 2, 4, 2, …`, roots `4, √2, 4^{1/3}, 2^{1/4}`, infimum `1 = λ₁`; without the constant the infimum is `2^{−d} < 1`; `v_n = 1` | constant `C_k(ω)` needed and present | none |
| `one_le_dynamicalDegree` | Cremona with `H`; real polarization `H/2` | degrees in `{1, 2}`, roots `≥ 1`; `λ = 1` via independence | true; route was missing | route added in §5.2 |
| `dynamicalDegree_iterate` | `m = 0` | `λ(id) = lim (ω^d)^{1/n} = 1 = λ^0` | right | none |
| `dynamicalDegree_zero_and_top` | Frobenius; `d = 0` | `λ_d = p^d = e` (separable degree `1`); `1 = 1` | right | none |
| `dynamicalDegree_log_concave` | Fibonacci; Frobenius; extension of `(x², y)` | `1·1 ≤ φ² ≈ 2.618`; `p^{k−1}p^{k+1} = p^{2k}`; `1·2 ≤ 4` | right | none |
| `dynamicalDegree_baseChange` | Fibonacci `ℚ → ℂ`; `ℙ¹_ℂ/ℝ` | `fib(n+2)` on both sides; `X′` not integral, excluded by the geometric-integrality hypothesis | right | none |
| `algebraicEntropy_iterate` | `n = 0`; Fibonacci, `n = 2` | `0 = 0`; `log φ² = 2 log φ` | right | none |
| `algebraicEntropy_bounds` | `d = 0`; Fibonacci; `z²` | `0 ≤ 0 ≤ 0·log(junk) = 0`; `0 ≤ log φ ≤ 2 log φ`; `log 2 ≤ log 2 ≤ log 2` | true at the junk value | none |
| §6.1 | Cremona `σ ∘ σ`; constant `[0:0:1]` then `σ`; `d = 0` | `(x₀x₁x₂)·(x₀, x₁, x₂)`; `G(F) = (0, 0, 0)`; `deg(id) = 0 ≠ 0^0` | `d ≥ 1` needed and present | none |
| §6.2 | Cremona, `a = 2` | `a·deg₀ − deg₁ = 0`, `a·deg₁ − deg₂ = 3 ≥ 0`; `δ₂ = 4 − 3 = 1` | right | none |
| §6.3, Fibonacci | `n = 1, 2, 3`; coordinate degrees | `[yz : xy : z²]`, `[xyz : xy² : z³]`, `[xy²z² : x²y³ : z⁵]`; `fib(n−1) + 2fib(n) = fib(n) + fib(n+1) = fib(n+2)`; inverse `(v/u, u)` | right | none |
| §6.4 | `(x², y)`; Silverman's `(y, z, x + yz)`; `(x, xy)` | `[x₀² : x₁² : x₀x₂]`, base point `[0:0:1]`; `F^{∘2} = (z, x + yz, y + z(x + yz))`, degree `3`; fibre over `(0,1)` empty | right | none |

**Context.** The file has no `variable`s. Every standing hypothesis, such as integrality, projectivity, `IsOver`, dominance, nefness, positivity of `(ω^d)` and geometric integrality, is in the signature of the theorem that needs it, as the `#check` output shows.

**P3 notes, no change.** Some hypotheses follow from the others:
- In `dynamicalDegree_baseChange`, `[IsIntegral X′]`, `[X′.IsProjectiveOver K′]` and `[IsDominant π]` follow from the cartesian square and geometric integrality. The statement needs them to elaborate: the composite `π.toRationalMap.comp f` needs dominance, and `iterate` needs an irreducible space.
- In `graph_isIntegral_and_projections`, `[IsIntegral Y]` is not needed for the conclusion. It matches the README's standing hypothesis that `Y` is a projective variety.

## Unresolved

- Lazarsfeld, Positivity I, is cited in §3.3 as Theorem 2.2.15 for Siu's inequality. dang2020 line 842 cites Theorem 2.2.13 for the bigness criterion, while dangfavre2021 line 423 cites 2.2.15 for Siu's inequality. The book is uncertified (paywalled) and was not read, so the locator is kept as in the package.
- `roadmaps resolve` could not check library names on this host ("no pinned Lake packages"). I checked them myself, as described above.
- No suspicious instructions were found in the package, the reports, the reviews or the roadmaps read.


Pull request: #2431 (roadmap/dynamical-degrees-of-rational-maps at 14cf9af)
