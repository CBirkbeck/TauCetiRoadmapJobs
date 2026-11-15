# FIX-PKG-HodgeClassesForJacquetLanglands~9

One review, one finding.

## REV-PKG-HodgeClassesForJacquetLanglands~8/F01 (P3) — applied

§4.3: "The first formula carries the factor `2^{−q/2}` relative to Funke–Millson." → the first formula is
`2^{−q/2}` times the Funke–Millson form (constant `2^{q/2}(−i/4π)^{q+ℓ}`, coefficients in `V^{⊗ℓ}`)
composed with `V^{⊗ℓ} → S^ℓV` (FM06, §6.2, p. 25; IP23, §8.4, p. 51); invariance with `K′`-character
`ℓ + m/2` and closedness are FM06, Theorems 5.6–5.7, p. 20. References gain `[FM06]`; the manifest
gains `FM06`.

Verification (all against the cached texts):

- FM06 line 1118 (§6.2, p. 25): `c_{q,ℓ} = 2^{q/2}(−i/4π)^{q+ℓ}`, coefficients in `T(V)`.
  IP23 line 2176–2187 (§8.4, p. 51): constant `(1/4πi)^{ℓ+q}`, with the note that the form of FM06 §6.2
  is scaled by `2^{−q/2}` and projected `V^{⊗ℓ} → S^ℓV`. Since `1/(4πi) = −i/(4π)`, the ratio is
  `2^{−q/2}`; at `(p, q) = (4, 2)` it is `1/2`.
- FM06 line 886–895 (Theorem 5.6, p. 20): for `n = 1` the form lies in the `K × K′`-invariants of
  `ℂ(χ_{−ℓ−m/2}) ⊗ S(V) ⊗ ⋀^q𝔭^* ⊗ T^ℓ(V)`, i.e. `K′`-weight `ℓ + m/2`, as §4.3 states. FM06 line
  900–903 (Theorem 5.7, p. 20): closedness. IP23 lines 2191–2197 cite exactly these two theorems and
  FM06 §5.1 (FM06 line 676) for the differential.
- FM06 line 1057: `ω_α = ω_{α₁,p+1} ∧ ⋯ ∧ ω_{α_q,p+q}`, the same `ω_α` as §4.3; FM06 line 758 assumes
  `n ≤ p`, i.e. `p ≥ 1` for `n = 1`, the range of the first formula.

The reviewer's sentence was rephrased (same content) and one clause added: the scalar and the
`G`-equivariant projections `V^{⊗ℓ} → S^ℓV → ℋ^ℓV` preserve invariance and closedness, which is why
FM06's theorems for the tensor-valued form give §4.3's statement for `φ′_{q,ℓ}`.

The manifest entry: the reviewer's sandbox had added `FM06`, but this branch had none; it was
fetched through the sources service (arXiv `math/0408050v1`, open repository, certified), then
given `year = 2006`, `venue = "American Journal of Mathematics 128 (2006), 899–948"` (IP23 line
6239–6240), the locator `§5.2, p. 18; Theorems 5.6–5.7, p. 20; §6.2, p. 25`, and a `version_note`:
the text read is arXiv version 1, page numbers are its own, and it carries under the same numbers the
items IP23 cites from the published version (§§5.1, 6.2, Theorems 5.6–5.7). The published version was
not read (it is not open); the numbering agreement is the one IP23's citations allow to be checked.
The service also moved the existing `version_note` lines of `Wal85` and `Mil17` within their tables
(no value changed).

Pattern repair (the same object named without a locator):

- §10.9, second Check: "the Schwartz forms are the Kudla–Millson forms with trivial coefficients"
  named a normalisation-dependent identity with no locator. It now says that where `p > 0` the
  Funke–Millson form at `ℓ = 0` is `2^{q/2}` times the Kudla–Millson form (FM06, §5.2, p. 18, line 791),
  which §4.3 removes, and that where `p = 0` the form is the Gaussian `φ₀` (§4.3). With this the
  Check is exactly true, not true up to a constant.
- §4.3 gained one Check pinning the normalisation by a computed witness (below), as the convention
  rule asks for every normalisation.
- The other named works in the README (Summary "Kudla–Millson Schwartz forms" as the name of the
  objects §4.3 defines; Harris–Kudla, Rallis, Howe duality, Shimizu, Siegel–Weil, Vogan–Zuckerman,
  Bloch–Kato, Matsushima, Kottwitz) are each either a standard name for an object or result, or carry
  a supplier section or an IP23/Wal85/Mil17 locator at the claim; none states a normalisation relative
  to an unidentified work.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.3 ratio to FM06 | `q = 0, 1, 2`, `ℓ = 0, 1` | `(4πi)^{−1} = −i/4π`; ratio `2^{−q/2}`: `1`, `2^{−1/2}`, `1/2` | correct; at `q = 0` (only `p = m`) the two forms agree | new sentence |
| §4.3 K′-weight via FM06 Thm 5.6 | `(p, q) = (4, 2)`, `ℓ = 0`; `(1, 1)`, `ℓ = 2` | invariants of `ℂ(χ_{−ℓ−m/2}) ⊗ …` give weight `ℓ + m/2`: `3`, `3` | agrees with §4.3 bullet and Check 3 (`+3`) | none |
| §4.3 projections preserve properties | scalar `2^{−q/2}`; `V^{⊗2} → S²V → ℋ²V` | all `G`-equivariant linear maps of the coefficient factor; they commute with `d = d_F + d_V` since `d_V` uses the `G`-action on the coefficient | invariance and closedness preserved | new clause |
| §4.3 FM06 range | `p = 0` | FM06 assumes `n ≤ p` (line 758); at `p = 0` the first formula is not FM06's and §4.3 uses the compact formula (IP23 p. 52) | citation scoped to the first formula, `p > 0` | none |
| §4.3 new normalisation Check | `(p, q, ℓ) = (4, 2, 0)`, `ε = ±1` | pairings of `ω_{a5}∧ω_{b6}` with `ω^ε` under `ω₁₅∧ω₂₅∧ω₁₆∧ω₂₆ ↦ 1`: `(1,1)`: `(εi)²·(−1) = 1`; `(2,2)`: `−1`; `(1,2)`: `+εi` (even permutation `(15,26,25,16) → (15,25,16,26)`); `(2,1)`: `+εi`; sum `z₁² − z₂² + 2εiz₁z₂ = (z₁ + εiz₂)²`; with `w = x₁ + εix₂`, `(∂₁ + εi∂₂)w = 0` and `(∂₁ + εi∂₂)φ₀ = −2πwφ₀`, so `(w − (2π)⁻¹(∂₁ + εi∂₂))` sends `w^kφ₀` to `2w^{k+1}φ₀` and corresponds to `(2πi)⁻¹(z₁ + εiz₂)`; hence `ι⁻¹((z₁+εiz₂)²/(4πi)²) = w²φ₀` (§4.2) | equals §4.5 at `ℓ = 0`; FM06's constant gives `2(x₁+εix₂)²φ₀` | new Check |
| §10.9 Check, KM normalisation | `p > 0`, `n = 1`; `p = 0` | FM06 line 791: `φ_{nq,0}` is `2^{nq/2}` times KM's, so `2^{−q/2}·2^{q/2} = 1`; `p = 0`: `φ′₀ = φ₀` (§4.3 Check 3) | exact identity, no stray constant | Check sharpened |
| References / manifest | key reuse | no other key for this work in `sources.toml` (searched by title, author, arXiv id) | one key `FM06` | entry added |

## Checks

- `lake env lean packages/HodgeClassesForJacquetLanglands/Suggested.lean` (from the content
  checkout): exit 0; three `declaration uses 'sorry'` warnings (lines 70, 81, 95), nothing else.
  `Suggested.lean` is unchanged this round.
- `#check @name` for the four declarations (`IsExteriorStar`, `existsUnique_isExteriorStar`,
  `IsExteriorStar.comp_self`, `IsExteriorStar.map_similitude`) in one scratch copy, elaborated once:
  the types equal those of `scratch/signatures.md`; `[FiniteDimensional E U]`, `σ`, `vol`, `hkl`, and
  `comp_self`'s symmetry hypothesis and basis `b`, `map_similitude`'s `g`, `ν` and similitude
  hypothesis are all present, as in §§1.3, 1.4 and 1.7. Nothing changed.
- Dependency check:

      depcheck: 239 roadmaps, 2272 edges, 0 problem(s)

  No `UPWARD`, `CYCLE` or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `sources.toml` parses as TOML. No `needs-references.toml` was written: every text cited is readable.

## Gate failures

None were listed for this round.

## For the maintainer

- No cross-roadmap citation, section number or Lean name changed; no other roadmap is affected.
- New manifest key `FM06` (Funke–Millson, arXiv `math/0408050v1`, published Amer. J. Math. 128
  (2006)); its published version was not read.
- Ownership against open pull requests: unchanged by this round (only a citation and two Checks
  changed; no construction was added).
