# Review of SchemeAndStackFoundations (pull request #1656 at aa653e5)

**Verdict:** needs changes

This is an incremental re-review of the 78 lines that changed in the folder since `9f9266a` (README +58/−12, `Suggested.lean` +3/−5). Nothing outside the folder changed. This head repairs all four findings of the previous review (R01–R04 below). The new text is correct: the generic-projection route, the two new Checks, the excision argument and every new locator. The gate passes, `Suggested.lean` elaborates, and the dependency check is clean.

One new P3 finding remains. The repair restored quasi-compactness in the curve dichotomy, which makes two sentences of the pull-request description false. The description's line count is also stale.

## R01 (P3) — The description still says the curve dichotomy drops quasi-compactness

- **Location.** Two sentences in the `roadmap-summary` block of the description are wrong:
  - "The curve dichotomy drops quasi-compactness, degree pullback uses the existing bundle degree and generic rank, and citations identify pinned declarations."
  - "Quasi-compactness follows from the other curve hypotheses."

  The prose below the block also says "Against main it is 1,220 added and 323 removed lines."
- **Claim.** At this head, none of the three is true.
  - `Curve.isAffine_or_isProper` keeps `QuasiCompact`, so it is main's statement.
  - The README no longer claims that quasi-compactness follows from the other hypotheses. `README.md:5667–5670` now says that finite type is written as `LocallyOfFiniteType` together with `QuasiCompact`.
  - The change against main is now larger than the stated count.
- **Witness.**
  - `Suggested.lean:734` has `[QuasiCompact (X ↘ Spec (.of k))]`, identical to main's `Suggested.lean:706`. `git diff origin/main...HEAD` changes only the docstring at `:729–731`.
  - `git diff --numstat origin/main...HEAD -- TauCetiRoadmap/SchemeAndStackFoundations` gives README 1230/314 and `Suggested.lean` 41/16. In total that is 1,271 added and 330 removed.
- **Repair.**
  - Regenerate the `roadmap-summary` block from this head and drop both quasi-compactness sentences. If the summary should still mention the curve, it can say: "the curve dichotomy keeps its statement and its docstring says that finite type is `LocallyOfFiniteType` with `QuasiCompact`."
  - In the prose, write "1,271 added and 330 removed lines". Rerun the `--numstat` command above to confirm the count.
  - The "Corrections" bullet can also list the three other repairs this head makes:
    - the §4.18 route from §0.7a to `generic_projection`;
    - the §3.4 excision proof at the integral, locally Noetherian generality;
    - the §0.19 locator §2.10.

## Previous findings

- R01 — repaired: `README.md:7396–7410`: "A route for `π` from §0.7a. … apply `exists_linear_normalization` to `S` … the centre `V_+(y_0, …, y_e)` … is disjoint from `X`. … *Needs:* §0.7a; Mathlib `Proj`, `IsFinite`." Also `:7455` (*Needs:* §0.7a for `generic_projection`) and `:7774` (Layer 4 Dependencies).
- R02 — repaired: `Suggested.lean:732–734` has `[LocallyOfFiniteType (X ↘ Spec (.of k))]` and `[QuasiCompact (X ↘ Spec (.of k))]`, and `README.md:5667–5669` reads "with finite type written as `LocallyOfFiniteType` together with `QuasiCompact`, as in … Stacks, Lemma 33.43.10 (0A27)".
- R03 — repaired: `README.md:1901`: "(Česnavičius 2021, Definition 1.2, p. 2, for the first two; §2.10, p. 7, for the third)".
- R04 — repaired: `README.md:5877–5878` cites "Definitions 31.27.7 (0BE4) and 31.28.4 (0BE6)". `:5892–5908` cites Hartshorne II, Proposition 6.5 (c) under its hypothesis (*), proves the integral, locally Noetherian case from 0BE2/02RJ/0BE3/0BE4, and keeps 02RX only for its closure step.

## Verified sound

### Gate, dependency check, elaboration, probe, signatures

- **Gate.** The worker's gate at `aa653e5` reports every counter 0, including `build=0`, and OK. My rerun (`gate … SchemeAndStackFoundations --base origin/main`) also has every text counter 0 (`outside-folder=0`, `stray-files=0`, `readme-ids-missing=0`), OK, exit 0.
- **Dependency check**, verbatim: `depcheck: 233 roadmaps, 2109 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0. It prints 48 ``declaration uses `sorry` `` warnings and no other diagnostic. The pins are main's.
- **One-tactic probe** of the one Lean statement that changed. In a scratch copy I replaced the `sorry` of `Curve.isAffine_or_isProper` with `first | rfl | infer_instance | simp | trivial`. It fails with "Tactic `assumption` failed" at the goal, so it is not padding. The other 47 theorems are unchanged since the previous probe, which found none of them padding.
- **Signature.** `#check @…Curve.isAffine_or_isProper` lists `[Field k]`, `X.Over`, `IsIntegral X`, `IsSeparated`, `LocallyOfFiniteType`, `QuasiCompact` and `topologicalKrullDim X = 1`. This matches README §3.1 and Layer 3's convention ("an integral separated `k`-scheme of finite type of dimension one", `:5618–5619`). No other declaration changed.
- **Pinned names.** `#check @AlgebraicGeometry.Proj` (a graded ring to a scheme) and `#check @AlgebraicGeometry.IsFinite` elaborate at the Mathlib pin. These are the two Mathlib names on the new *Needs:* line.

### Route for `generic_projection` (previous R01)

Each step was checked by hand.

- **`S ≠ 0`.** `X` is nonempty, and the classes of `x_0, …, x_N` generate `S`, so `hx` holds.
- **Linear parameters.** The `y_i` are nonzero linear forms, because algebraic independence excludes `y_i = 0`. So each is homogeneous of degree 1.
- **The centre misses `X`.** `S/(y)S` is finite over `k[y]/(y) = k`, so `S_m ⊆ (y)S` for `m ≥ m_0`. For homogeneous `s` of degree `j ≥ 1` this gives `s^{m_0} ∈ S_{j m_0}`. So a homogeneous prime that contains every `y_i` contains `S_+`, and the centre misses `Proj S = X`.
- **Finiteness.** Stacks 01MY (Lemma 27.11.1, book line 111337) gives `U(ψ) = ⋃ D_+(ψ(f)) = Proj S` here. On `D_+(y_i)` the map is `Spec` of `k[y]_(y_i) → S_(y_i)`. Write `t/y_i^M = Σ (a_j/y_i^{M−m_j})(s_j/y_i^{m_j})` with homogeneous `a_j`; this proves finiteness.
- **Surjectivity.**
  - 00GQ (Lemma 10.36.17, line 24395) needs `R ⊂ S`. Here `k[y] → S` is injective by independence and integral by finiteness.
  - 00JT (Lemma 10.57.7, line 26953) shows that `p*` is prime. From `p* ⊆ p` we get `p* ∩ k[y] ⊆ q`. The homogeneous generators of `q` lie in `p*`, so `p* ∩ k[y] = q`.
  - If `S_+ ⊆ p*`, then `k[y]_+ ⊆ q`, which is excluded.
- **Dimension.** 0ECG (Lemma 29.45.9, line 120295) is for an integral surjective morphism and gives `e = d`.

### Excision argument and locators (previous R04 and R03)

- **Stacks tags at the book's lines.** 0BE2 is Definition 31.27.2 (line 129406), 02RJ is 31.27.3 (129415), 0BE3 is 31.27.5 (129440), 0BE4 is 31.27.7 (129454), 0BE6 is 31.28.4 (129506), 0BE8 is Lemma 31.28.6 (129535) and 0BE9 is 31.28.7 (129549).
- **The closure step.** The proof of 02RX (Lemma 42.19.3, lines 177047–177052) has exactly the step the README cites: closures of a locally finite family on `U` are locally finite on `X`, because `V ∩ U` is quasi-compact for every quasi-compact open `V`.
- **The rest of the argument.**
  - A prime divisor inside `D` equals `D`. Otherwise `η ⇝ η_D ⇝ ξ_Z` would give `dim O_{X,ξ_Z} ≥ 2`.
  - `div_X(f)|_U = div_U(f)`, since `ord_Z` is read at `ξ_Z ∈ U`.
  - Locally factorial implies normal, so `classGroup_picard_locallyFactorial` and 0BE9 apply on both `X` and `U`.
- **Where each part is located.** Hartshorne II.6.5 (c) covers the class-group sequence under (*). The `Pic` surjectivity is carried by the derivation that follows it, with 0BE9.
- **§0.19 locator.** In `cesnavicius-2021`, line 61 is Definition 1.2 (p. 2, CM-quasi-excellent and CM-excellent). Line 237 is §2.8, on openness of loci. Line 268 is "2.10. (S_n)-quasi-excellence" (p. 7). Lines 274–275 there also give `isSnQuasiExcellent_of_isCMQuasiExcellent`.

### Seeded sample where it falls in the changed text (§3.1)

- 0A24 is Lemma 33.43.2 (line 138137), 0A26 is Lemma 33.43.4 (138149, with the stated `dim ≤ 1` and properness), 0A27 is Lemma 33.43.10 (138240, "a curve over k", affine or H-projective) and 0A28 is Lemma 33.43.11 (138278).
- 0A23 (Definition 33.43.1, a curve is a variety of dimension 1) and 020D (Definition 33.3.1) support the restored `QuasiCompact`.
- Also as cited: 0BY7 (Definition 53.8.1, `H⁰ = k` in the definition of genus), 0BY9 (Lemma 53.8.2), 0CE4 (Lemma 53.18.4), 0BY4 (Lemma 53.2.9) and 02O6 (Lemma 30.19.2).
- Tau Ceti: `finrank_cohomology_pullback_eq_of_isPullback` is at `Cohomology/FlatBaseChange.lean:277`, with `[CompactSpace X]` and affine diagonal as the README says, and `genus_eq_of_isPullback_of_smooth` is at `Curves/Genus/BaseChange.lean:72`.
- The other 14 sampled targets (0.23, 0.24, 1.3, 1.14, 1.17, 1.25, 2.12, 2.14, 2.15, 3.3, 4.17, 5.7, 5.9, 5.11) are untouched by the diff and were not re-checked, as an incremental review requires.

### Ownership, duplication, overlaps

- **Ownership.** The repairs add no carrier, definition or Lean name. The §4.18 route consumes this roadmap's own §0.7a, and the excision argument proves an existing §3.4 target.
- **Duplication.** No pinned declaration proves the affine-or-proper dichotomy:
  - Loogle `IsAffine, IsProper` has no hits.
  - Tau Ceti's `Scheme.IsCurveOver` (`Curves/Basic.lean:37`) is integral, proper and of dimension one, a different notion.
  - `Curves/AffineCover.lean` has only `exists_two_affine_opens`.
- **Overlaps.** `overlaps.md` lists no dropped or revision-only id. The pull requests #1807, #1808 and #1854, which change this folder, are ordered after this one in the description's merge-order block.
- **Citation leads.** `citations.md` reports no cross-roadmap citation missing. The two own-name leads in changed text, `isAffine_or_isProper` and `exists_linear_normalization`, are declared in `Suggested.lean`.

### Adversarial table

The rows for changed statements are computed here. The rows marked "(r83)" are carried from the previous report, because those statements are unchanged.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| `isAffine_or_isProper` (with `QuasiCompact`) | `𝔸¹_k`; `ℙ¹_k`; affine line with doubled origin | `𝔸¹`: affine, not universally closed. `ℙ¹`: `Γ = k`, so affine would force dimension 0 ≠ 1; proper. Doubled origin: finite type, dimension 1, not separated, so excluded | Pass; matches 0A27 |
| §4.18 route for `π` | `X = ℙ^N` (`S = k[x]`); point `[1:0] ⊂ ℙ¹` | `C` invertible, centre `∅`, `π` is a linear automorphism. `S = k[u]`; `y = u`, centre `[0:1] ∉ X`; `y = v = 0` is excluded by independence | Pass |
| same, nonreduced | `V(u²) ⊂ ℙ¹` | `y = v`: `S` is free over `k[v]` with basis `1, u`; centre `[1:0]` misses `[0:1]`; `π` finite of degree 2; `y = u` is nilpotent, so excluded | Pass |
| twisted-cubic Check | `y = (x_0, x_3)`; `y = (x_1, x_2)` | `(s²t)³ = s⁶t³ = (s³)²t³`; `(st²)³ = s³t⁶`; `e = 1 = d`; `[s:t] ↦ [s³:t³]` has degree 3. At `s = 1, t = 0`: `x_1 = x_2 = 0`, `x_0^m ↦ 1 ≠ 0` | Pass |
| `𝔽₂` three-point Check | `u, v, u + v` at `[0:1], [1:0], [1:1]`; `k = 𝔽₂(t)`, form `u + tv` | each form has one zero on `X`; values `t, 1, 1 + t`, all nonzero | Pass |
| `picard_excision_sequence` | `𝔸¹ ⊃ 𝔾_m`; cusp `k[t², t³]`, `D` the cusp; cone `xy = z²`, `D` a ruling | `ℤ → 0 → 0 → 0`. `ord(t²) = 2`, `ord(t³) = 3`, `[D] = div(t)`, `ℤ → 0 → 0 → 0`. `ℤ → ℤ/2 → 0 → 0` with `1 ↦` the generator | Pass; no normality is needed |
| `exists_linear_normalization` (r83) | `𝔽₂[X,Y]/(XY(X+Y))`; `z = x²+xy+y²`; `k[X,E]/(E²)`; `A = k` | every `A/(ℓ)` is infinite-dimensional; `x³ − zx = 0`, `z ↦ X²`; `d = 1`, basis `1, E`; `d = 0` | Pass |
| `vectorBundleDegree_pullback` (r83) | `z ↦ z²`, `O(1)`; `O^r`; Frobenius | `2 = 2·1`; `0 = 2·0`; `p = p·1` | Pass |
| §0.12 strict local rings (r83) | `Spec 𝔽_p`; `ℤ_(5)`; `x² − 2` over `ℤ_(5)^h` | `𝔽̄_p` against `𝔽_p`; roots `2, 3` mod 5; `P(S) = ∅`, `P_s ≠ ∅` | Pass |
| §0.13 henselization (r83) | `(ℤ,(5))`, `T²+1`; `X² − X + pT`; `(ℤ,(6))` | root 2 mod 5, no integer root; odd `T`-degree; `ℤ_(2)^h × ℤ_(3)^h` | Pass |
| §0.5 affine criterion (r83) | `j_!O` on a DVR | sections `0`, `K`; not quasi-coherent | Pass |
| §0.8 `flat_over_dedekind` (r83) | `S ⊔ 𝔸¹_S → S` | fibres `κ ⊔ 𝔸¹_κ`, no single `d` | Pass |
| §0.17, §0.19, §0.21 Checks (r83) | `k × k[t]`; `k[x,y]_(x,y)`; `k[[x,y,z]]/(xz,yz)`; `(S_0)`; `k[ε]/(ε²)`; `R/(1)`; `k ⋉ k` | `0 + 0 < 1`; depth 2; depth 1 < dim 2; vacuous; dim 0 = depth 0; empty fibres; nonreduced fibre | Pass |
| §0.23, §0.23a, §0.29 Checks (r83) | `k[t²,t³] ← k[t]`; node; `𝔽_{p²}/𝔽_p`; `𝔽_p[ε]` | radicial and surjective; `t = ±1`; 2 against 4 endomorphisms; `ε ↦ 0` | Pass |
| §2.1, §2.5, §2.10 (r83) | `𝔾_m → Spec k`, `μ_n`; fold map; `ℤ_ℓ` identity | `R¹f_*μ_n = ℤ/n`; `∅` against `{id}`; continuous, not locally constant | Pass |
| §2.14, §2.19, §2.21 (r83) | constant `A`; `ℙⁿ → Spec k`; list (1)–(9) against 0AU3 | `F(∅) = A[1]`; `O(−n−1)[n]`; identical | Pass |
| §1.16, §1.21 (r83) | `Spec L ×^{ℤ/2} Spec L`; `n = p` in characteristic `p` | invariants `K × K`; stabilizer `μ_p` not étale | Pass |
| §3.2, §3.7 Checks (r83) | `z ↦ z²`; genus-2 cover; real conic; `ℙ¹` | `−2 = 2(−2) + 2`; `g = 3`; `Pic¹ = Spec ℝ`; `π₀ = ℤ`, `π₁ = k^×` | Pass |
| §3.4 units sequence (r83) | `𝔸¹ ⊃ 𝔾_m`; quadric cone | `c tⁿ ↦ n`; `Pic = 0`, `Cl = ℤ/2` | Pass |
| §4.10, §5.5 (r83) | `k[[t]]`, `a_0 = 0`, `a_1 = 1`; `z ↦ z²`; a line in `ℙ²` | incompatible mod `t`; `2[pt]`; `N = O(1)`, degree 1 | Pass |
| `hodge_index`, `weil_bound` (r83) | `ℙ¹×ℙ¹`, `D = (1,−1)`; `y² + y = x³` over `𝔽₂` | `D² = −2 ≤ 0`; `|3 − 3| = 0 ≤ 2√2` | Pass |
| Nagata, `grothendieck_existence` (r83) | `k[[t]]`, `ℤ`; `Spec A`, `A` complete | Japanese; Nagata; finite `A`-modules | Pass |

**Remarks on untouched text.** None.

## Not verifiable

- **Hartshorne 1977, II, Proposition 6.5 (c)** (§3.4). The text is settled as uncertified and was not read. The hypothesis the README attaches to it (Noetherian, integral, separated, regular in codimension one) is Hartshorne's standing (*). The README's own argument covers the stated generality.
- **Fulton 1998, SGA 6 and de Jong 1996.** The diff does not touch these locators, apart from the unchanged de Jong citations around the new §4.18 route. They are as in the previous report.

## Source issues

- none
