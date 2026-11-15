# Repair of LorentzianGeometry (design, round 7)

Findings settled: the three of `reports/REV-DESIGN-LorentzianGeometry~6.md` (R01 P2, R02 P3, R03 P3). Files edited: `packages/LorentzianGeometry/design/README.md`, `packages/LorentzianGeometry/design/plan.json`, `packages/LorentzianGeometry/sources.toml`. No layer, target, supplier or construction was added or removed. The review has no "For the human reviewers" section.

## R01 (P2) — applied

§1.1 "The restriction … is Lorentzian iff …" → "For Lorentzian `b`, …", with the reason `1 ≤ sigNeg(b|_W) ≤ sigNeg b = 1`. §1.3 "Null vectors exist iff `dim V ≥ 2`" → "For Lorentzian `b`, …", with the witness `e₀ + e₁`. `plan.json`: "For Lorentzian b," prefixed to 1.1 `restrict_iff`, `not_isOrtho_of_isTimelike` and 1.3 `exists_isNull_iff`. New Checks: §1.1 (η₃ subspaces; `diag(−1, −1, 1)`), §1.3 (Euclidean `ℝ²`).

Both counterexamples were recomputed and confirm the finding: `diag(−1, −1, 1)` with `W = ℝ³` is nondegenerate, contains the timelike `e₀` and has `sigNeg = 2`; the Euclidean `ℝ²` has dimension 2 and no null vector. The repaired statements hold. For Lorentzian `b`, `sigNeg(b|_W) ≤ sigNeg b = 1` because a negative-definite subspace of `W` is one of `V`. In a diagonalising basis `e₀ + e₁` is null once `dim V ≥ 2`. In dimension 1 every nonzero vector is timelike.

The same pattern elsewhere (see "Pattern repairs"): `plan.json` 1.3 `IsLorentzian.not_isOrtho` also lacked "For Lorentzian b". §1.2 had two facts that are false for a general nondegenerate form.

## R02 (P3) — applied differently

§3.1: `chrusciel2011` (2.2.1)–(2.2.3) → `barzenleymann2026` §7.1, Definitions 41–42, (51), lines 1778–1809, pp. 38–39. §3.2: → Theorem 6, lines 1810–1814, p. 39. §3.4: → Definition 43 (53), Lemma 24 (54), Definitions 48, 50, lines 1896–2291, pp. 41–49; `chrusciel2011` is kept at §3.4 only for the Christoffel symbols in the chart formula, lines 187–193.

The finding is right. `chrusciel2011` line 186 is the geodesic equation (2.2.1), lines 187–192 the Christoffel formula (2.2.2) and line 193 the metric components (2.2.3), all on printed p. 5 (page marker at line 194, running head "6"). None of them states torsion-freeness, compatibility, existence, uniqueness or curvature.

The reviewer's repair is not applied at §3.1 and §3.2. It would cite the passage there "for the Christoffel symbols", but neither section states a coordinate formula, so it would recreate the defect: a source cited for a statement the section does not make. The coordinate formula is §3.3, which cites the passage.

`barzenleymann2026` is already in the manifest, certified (arXiv:2606.02616; the printed page equals the PDF page) and in the sources cache. Its key is reused. It states the smooth pseudo-Riemannian versions:
- metric compatibility, (51), line 1799;
- the Levi-Civita connection, Definition 42, line 1808;
- existence and uniqueness, Theorem 6, lines 1812–1813;
- `R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z`, (53), line 1945. This is the README's convention.
- `R^l_{ijk} = ∂_iΓ^l_{jk} − ∂_jΓ^l_{ik} + Γ^m_{jk}Γ^l_{im} − Γ^m_{ik}Γ^l_{jm}`, (54), line 1948. This is identical to §3.4's chart formula.
- Ricci as `tr(v ↦ R(v, y)z)`, Definition 48 and (65)–(66), lines 2228–2254;
- the scalar curvature as its trace, lines 2289–2291.

`sources.toml` was updated to match:
- `chrusciel2011`: `cited_for` loses 3.1 and 3.2.
- `barzenleymann2026`: `cited_for` gains 3.1, 3.2 and 3.4, and its locator is extended.
- A References entry was added for `barzenleymann2026`.

Also fixed, the same citation: §3.3's "(2.2.2)–(2.2.3), lines 186–193" became "lines 187–193" in the README and in `plan.json` 3.3, because line 186 is (2.2.1). §3.5's "(2.2.1)–(2.2.3), lines 184–193" is correct (the geodesic equation) and is unchanged.

## R03 (P3) — applied

§2.5 "for a function `Ω > 0` and a family `γ` … on an open set of `ℝ_u × ℝ_v × ℝ^{n−1}`" → "for `n ≥ 1`, a function `Ω > 0` …", naming the coordinates `(u, v, θ¹, …, θ^{n−1})`. For `n = 1` there are no `θ^A` and `γ = 0`. The double-null Check now says it is the case `n = 1` and explains why `n = 0` is excluded. `plan.json` 2.5 statement and hypotheses: "n ≥ 1".

The finding is right. With `n = 0`, truncated subtraction gives `ℝ^{0−1} = ℝ⁰`, so the product space would be 2-dimensional while the manifold is 1-dimensional. A 1-dimensional manifold has no two functions with independent differentials.

Other natural-number subtractions in the README and `plan.json` were checked and are all guarded:
- `dim V − 1` (§1.1, §1.7): Lorentzian forces `dim V ≥ 1`.
- `dim M − 1` (§2.2, §5.1): the statement is vacuous on an empty `M` or `H`, and `df ≠ 0` forces `dim M ≥ 1`.
- `k − 1` (§3.3): `k ≥ 1`.
- `k − 2` (§3.4): `k ≥ 2`.
- `r − 1` (§5.2): `r ≥ 1`.

## Pattern repairs (R01, other occurrences)

- `plan.json` 1.3 `IsLorentzian.not_isOrtho` was missing "For Lorentzian b" (the README bullet already had it). Counterexample: `e₀ ⊥ e₁` are both timelike for `diag(−1, −1, 1)`. Prefixed.
- §1.2 claimed "hence `b⁻¹` is symmetric" for every nondegenerate `b`, and that "the Gram matrix of `b⁻¹` in the dual basis is the inverse of the Gram matrix of `b`". Both are false for nonsymmetric `b`.
  - Witness: `b(u, w) = u⁰w¹ − u¹w⁰`, with `G = [[0, 1], [−1, 0]]`. Then `b♯e⁰ = −e₁` and `b♯e¹ = e₀`, so `b⁻¹(e⁰, e¹) = 1` and `b⁻¹(e¹, e⁰) = −1`. The Gram matrix of `b⁻¹` is `(Gᵀ)⁻¹ = [[0, 1], [−1, 0]]`, not `G⁻¹ = [[0, −1], [1, 0]]`.
  - In general, `G H Gᵀ = G` from the isometry law, so `H = (Gᵀ)⁻¹`.
  - Now: "`b⁻¹` is nondegenerate, is symmetric iff `b` is, has the signature of `b`, and is Lorentzian iff `b` is", and "the inverse of the transpose …, so for symmetric `b` the inverse of the Gram matrix". This is the same in `plan.json` 1.2 (`dualForm_toDual_toDual`, `dualForm_smul`), with a new Check and plan test `nonsymmetric_inverse`. The three existing §1.2 Checks are symmetric and unchanged.
- Strengthening of the R01 statement, recorded in §1.3 (bullet 3) and `plan.json` 1.3 `orthogonal_posDef`:
  - For Lorentzian `b`, a subspace `W` that contains a timelike `v` is nondegenerate, because `W = ℝv ⊕ (W ∩ v^⊥)` orthogonally with `W ∩ v^⊥ ⊆ v^⊥` positive definite.
  - So the restriction to `W` is Lorentzian iff `W` contains a timelike vector. §1.1 says the nondegeneracy is then automatic.
  - Without the Lorentzian hypothesis this fails: for `diag(−1, −1, 1)`, `W = ⟨e₀, e₁ + e₂⟩` has Gram matrix `[[−1, 0], [0, 0]]`, which is degenerate, yet it contains the timelike `e₀`.
- Checked and unchanged:
  - The two 1.5 API statements: target 1.5's hypotheses carry "b Lorentzian".
  - 1.4 `mem_timeCone_self` and `isOpen_timeCone`, and the 1.3 `trichotomy` and `isTimelike_smul`: true for every `b`.

## Adversarial pass (every statement added or changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 restriction criterion, Lorentzian `b` | `η₃`: `W = ⟨e₀, e₁⟩`, `⟨e₁, e₂⟩`, `⟨e₀ + e₁, e₂⟩`, `0`, `ℝe₀`, `ℝ³`; non-Lorentzian `diag(−1, −1, 1)`, `W = ℝ³` | Gram `diag(−1, 1)` (sigNeg 1); `diag(1, 1)` (sigNeg 0, no timelike); `[[0, 0], [0, 1]]` (radical `ℝ(e₀ + e₁)`, `η₃ = c² ≥ 0`); `W = 0`: sigNeg 0, both sides false; `ℝe₀`: `−x y`, both true; `diag(−1, −1, 1)`: right side true, sigNeg 2 | holds for Lorentzian `b`, fails without | R01 + 2 Checks |
| §1.3 nondegeneracy of a subspace with a timelike vector | `η₃`, `W = ⟨2e₀ + e₁, e₂⟩`; `W = ⟨e₀ + e₂, e₁⟩`; `diag(−1, −1, 1)`, `W = ⟨e₀, e₁ + e₂⟩` | `η₃(v, v) = −3`, `W ∩ v^⊥ = ℝe₂`, Gram `[[−3, 0], [0, 1]]`; `η₃(a(e₀ + e₂) + c e₁) = c²`, no timelike, degenerate (consistent); `[[−1, 0], [0, −1 + 1 = 0]]`, degenerate with timelike `e₀` | holds for Lorentzian `b`, fails without | stated in §1.3 |
| §1.3 null existence, Lorentzian `b` | `−xy` on `ℝ`; `η` on `ℝ²`; `η₄`; Euclidean `ℝ²`; `diag(−1, −1)` | `−v² < 0`; `η(e₀ + e₁) = 0`; `−1 + 1 = 0`; `|v|² > 0`; `−|v|² < 0` (not Lorentzian) | holds, hypothesis needed | R01 + Check |
| §1.3 `not_isOrtho` (plan) | `η`: `e₀`, `e₀ + e₁`; `diag(−1, −1, 1)`: `e₀`, `e₁` | `η(e₀, e₀ + e₁) = −1 ≠ 0`; `0` with both timelike | needs Lorentzian `b` | plan text |
| §1.2 isometry and symmetry | `η`; `diag(−2, 1)`; `[[0, −2], [−2, 0]]`; `b = u⁰w¹ − u¹w⁰` | symmetric: `G⁻¹ = (Gᵀ)⁻¹`, giving `−1`, `−½`, `[[0, −½], [−½, 0]]` (the Checks stand); nonsymmetric: `b⁻¹(e⁰, e¹) = 1`, `b⁻¹(e¹, e⁰) = −1`, `b⁻¹(b♭e₀, b♭e₁) = b⁻¹(e¹, −e⁰) = 1 = b(e₀, e₁)`, `b⁻¹(e¹, e¹) = 0 = b(e₀, e₀)`; quadratic maps of `b` and `b⁻¹` are both `0`, `sigNeg = 0` on both sides | "symmetric" and "inverse Gram" need symmetric `b`; isometry, nondegeneracy, signature and Lorentzian transfer hold for all nondegenerate `b` | pattern repair + Check |
| §1.2 `(c • b)⁻¹ = c⁻¹ • b⁻¹` | `c = 4`, `b = η` | `(4η)♯ = ¼η♯`, `b⁻¹(dt, dt) = −¼` | holds | none |
| §2.5 double null metric, `n ≥ 1` | `n = 1`, `Ω` arbitrary; `n = 2`, `γ = r² dθ²`; `n = 0` | Gram `[[0, −2Ω²], [−2Ω², 0]]`, det `−4Ω⁴ < 0`, sigNeg 1, inverse `[[0, −(2Ω²)⁻¹], [−(2Ω²)⁻¹, 0]]`; block `diag(…, r²)`, sigNeg 1, dim 3; `ℝ^{0−1} = ℝ⁰`, dim 2 ≠ 1 | holds for `n ≥ 1` | R03 |
| §2.5 Check, `Ω = 1`, `u = t − x`, `v = t + x` | `n = 1` | `−2(du dv + dv du) = 4(−dt² + dx²)`, `g⁻¹(du, dv) = ¼(−1 − 1) = −½` | holds | clause added |
| §5.3 double null Check, `−grad u = (2Ω²)⁻¹∂_v` | any `n ≥ 1` | `g♯(du) = g^{uv}∂_v = −(2Ω²)⁻¹∂_v` | holds | none |
| §3.1, §3.2 locators | `barzenleymann2026` lines 1778–1814 | Definition 41 (51), line 1799, p. 38 (page 38 begins line 1753); Definition 42, line 1808, and Theorem 6, lines 1812–1813, p. 39 (page 39 begins line 1800) | statements made there, smooth pseudo-Riemannian | R02 |
| §3.4 locator and convention | `barzenleymann2026` (53), (54), Definitions 48, 50; de Sitter `−dt² + cosh²t dx²` through (54) | `R^t_{txx} = (cosh² + sinh²) − tanh t·cosh t sinh t = cosh²t`, `R^x_{txx} = 0`, `Ric_xx = cosh²t`, `Ric_tt = −1`, `Scal = (−1)(−1) + cosh⁻²·cosh² = 2`; (53) at line 1945 and (54) at line 1948 on p. 42 (page 42 begins line 1917); Definition 48 on p. 48 (lines 2214–2277); Definition 50 on p. 49 (line 2278 onwards) | the §3.4 Check stands; the convention equals Conventions and RiemannianGeometry | R02 |
| §3.3, §3.4 `chrusciel2011` range | lines 186–194 | 186 = (2.2.1); 187–192 = (2.2.2); 193 = (2.2.3); line 194 is the page marker with running head 6 | 187–193 is the exact range for (2.2.2)–(2.2.3), p. 5 | range corrected |

## Checks run

- **Dependency check** (command of the brief), output verbatim:

  ```
  candidate: LorentzianGeometry is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
  depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line.
- **Citations** (`roadmaps resolve` on the edited README): no cross-roadmap citation is found nowhere, and no Lean name is found nowhere.
- **House style**: grep of the README for `\(`, `\[`, `$$`, machine paths, "removed", "optional", "deferred", "for later", round labels and pull-request numbers gives 0 hits.
- **`Suggested.lean` and the `#check` comparison**: not applicable. This is the design stage, and the package has no `Suggested.lean`. No Lean name was added, deleted or renamed; every name in the README and `plan.json` is unchanged. Nothing was elaborated.
- **Gate failures listed in the brief**: none.
- **Sources**: nothing was fetched and no `needs-references.toml` was written. The only new citation is the manifest's existing `barzenleymann2026`, read in the sources cache.

## For the maintainer

- **A second roadmap named `LorentzianGeometry` (open pull request #2232, by another author, labelled ai-approved).**
  - `scratch/overlaps.md` lists #2232 as an open pull request that "changes this roadmap". It adds the folder `TauCetiRoadmap/LorentzianGeometry/` with a different README ("semi-Riemannian foundations and Lorentzian causality", 13 layers). Neither is on main or in `ORDER.txt`.
  - It owns, by object, nearly everything this design owns:
    - its Layer 6 against this Layer 1: the same `IsLorentzian := IsSymm ∧ Nondegenerate ∧ sigNeg = 1`, time cones, reverse inequalities, causal type of subspaces;
    - its §2.2–§2.5 against §2.1, §2.3 and §3.1–§3.4: regularity-graded pairings, Hölder classes, Levi-Civita construction, curvature;
    - its Layer 3 against §3.5–§3.6: geodesics;
    - its §2.7 against §4.5: extensions;
    - its §7.1 and §7.3 against §1.9, §2.2 and §2.5: Lorentzian and acoustical metrics;
    - its §8.1 and §8.2 against §2.6 and §4.1–§4.4: time orientations, the double cover, causal curves;
    - its §9.2 and §9.3 against §5.1–§5.4: null hypersurfaces, optical functions, null generators;
    - and causality theory, which this README's Scope assigns to a proposed LorentzianGeometryPartII.
  - #2232 places characteristic hypersurfaces of hyperbolic operators outside its scope, so §5.5 (the wave operator and "characteristic iff null") has no counterpart there.
  - The two cannot both merge under one folder name, and every shared object needs one owner. Choosing it is a scope decision outside this package: keep one, cite the other by section, or rename and narrow this one (for instance to the part #2232 leaves out). No edit of this round's files can settle it, and this round does not attempt to.
  - The ownership was checked with `roadmaps show LorentzianGeometry --pr 2232` and `roadmaps grep`.
- **Shared manifest.** The pull-request review jobs for #2232 recorded eight works in this package's `sources.toml`, with `cited_for` in #2232's numbering: `gallowaylingsbierski2018`, `minguzzi2015convex`, `kunzingersteinbauerstojkovic2014`, `langelytchaksamann2021`, `grantkunzingersamannsteinbauer2020`, `grafling2018`, `barzenleymann2026` and `gourgoulhon2007`. For example, `minguzzi2015convex` has `["3.4", "10.1", …]` and `gourgoulhon2007` has `["4.1", "9.1"]`.
  - This design's README cites only `barzenleymann2026` of them, now in §3.1, §3.2 and §3.4. I left the other entries, and the entries' #2232 ids, untouched.
  - Section ids in `cited_for` are therefore ambiguous between the two roadmaps; "3.4", for instance, is curvature here and normal domains in #2232.
- **Names other roadmaps cite**: none changed. No section, layer or target id was renumbered or removed.
- **Suspicious text**: none found in the review or the pull-request text read.
