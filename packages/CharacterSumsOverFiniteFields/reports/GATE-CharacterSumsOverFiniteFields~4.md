# GATE-CharacterSumsOverFiniteFields~4: answers to human review

One unanswered comment, making one point (H01). Head before this round `52b794d`; repair commit
`cbf32cf` (README only; `Suggested.lean` unchanged).

## H01 (mycaule) — answered

The README's Provenance section (`TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md`, from line
2287) already records this overlap as small and as no supplier. `Weil/AlgebraicGeometry/EtaleCohomology/Trace/` at `27cdb20` has
exactly 30 Lean files (trace formula, zeta rationality, the Riemann-hypothesis form, purity to Weil
numbers). None of AxiomMath/Weil's 980 modules mentions `MulChar`, `AddChar`, `gaussSum`,
`jacobiSum` or Kloosterman sums. The roadmap's bounds 4.7, 4.8 and 5.5 come from Stepanov's method
(Layer 4) and consume nothing from that directory.

Checking that section against the repositories it names turned up three inaccuracies, now
repaired in it:

- **Stepanov's method has a counterpart (lines 2290–2298, 2300–2307, 2324–2337).** AxiomMath/Weil
  requires AxiomMath/Stacks at `012108f` (its `lake-manifest.json`; Apache-2.0). Stacks proves the
  following, all now mapped in the section:
  - Bombieri's form of Stepanov's method: `Curves/BombieriStepanov/SmoothUpperBound.lean` gives
    `N_m ≤ q^m + C√q^m` and `LowerBoundCurve.lean` gives `q^m ≤ N_m + C√q^m`, along the multiples
    of some `d ≠ 0` beyond some `m₀`, with constants depending on the curve.
  - The curve bound `|#X(K) − #K − 1| ≤ 2g√#K`
    (`Curves/WeilBound/WeilBound.lean`, `abs_natCard_fieldValuedPoints_sub_le`).
  - The Hasse-derivative facts of 4.1 (`RingTheory/Polynomial/HasseDerivPowChar.lean`).
  - The power-sum lemma along `dℕ`, whose `d = 1` case is 4.4
    (`NumberTheory/TraceFormula/RiemannHypothesisBound.lean`, `norm_le_of_norm_sum_pow_le`).

  The old line "Gauss, Jacobi and Kloosterman sums and Stepanov's method have no counterpart"
  now reads "Gauss, Jacobi and Kloosterman sums have no counterpart", and the bullet covers
  "Layers 0–2, 4.5 and 5–7" instead of "Layers 0–2, 4.1–4.5 and 5–7".
- **A missing hypothesis (line 2322).** The rationality theorem in `LAdicTraceFormulaFinal.lean`
  takes a compactification as an argument (`exists_rationalLFunction_mul_eq_polynomial (j :
  CompactificationOf (Over.mk f))`). The line "is rational" now reads "given with a
  compactification, is rational".
- **A second missing hypothesis (line 2318).** The Euler-product theorem of weil-conjectures
  (`WeilSheaf/EulerProduct.lean`, section variables) assumes the curve geometrically connected.
  "a smooth affine curve" now reads "a smooth geometrically connected affine curve".

## Build

`lake build TauCetiRoadmap.CharacterSumsOverFiniteFields.Suggested`: `Build completed successfully
(18252 jobs).` Only `declaration uses 'sorry'` warnings.

## Gate

`gate CharacterSumsOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
outside-folder=0 source-material=0 OK`

Before the commit, the same gate run failed only on `dirty=1`, the uncommitted README.

Depcheck (`--movable --pr 1712`): `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`. There are no
UPWARD or CYCLE lines.

`roadmaps resolve` on the edited README: no cross-roadmap citations and no Lean names found nowhere
(it did not check Lean names outside TauCetiRoadmap).

## Adversarial pass on the changed statements

| Statement (README Provenance) | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Weil requires Stacks at `012108f`, Apache-2.0 | Weil's `lake-manifest.json` at `27cdb20`; Stacks `LICENSE` | `rev 012108f61d7f…`, `name Stacks`; licence header "Apache License Version 2.0" | true | added |
| Stacks: `\|#X(K) − #K − 1\| ≤ 2g√#K` for a smooth proper geometrically irreducible curve and every finite extension `K` | the theorem's binders; ℙ¹ over `𝔽_q` (`g = 0`); 4.9 reduction at `y² = x² − 1` over `𝔽_3` | ℙ¹: error `0 ≤ 0`. The binders are `[IsProper f] [Smooth f] [GeometricallyIrreducible f] [IsCurve k f]` plus `K` a finite field with `[Algebra k K]`. For `x = 0, 1, 2`, `y² = 2, 0, 0` has `0, 1, 1` solutions, so the affine count is `2 = q − 1` (`η(1) = 1`, two points at ∞) and the error is `1 ≤ (m − 1)√3` | true; the reduction in the bullet is unchanged and holds here | added |
| Stacks 4.1: Hasse derivatives of order `0 < i < p^e` kill `p^e`-th powers; `(X − a)^m ∣ f` if `D⁽ⁱ⁾f(a) = 0` for all `i < m` | `e = 0`; `p = 2, e = 1, i = 1`; `m = 0`; `f = 0` | `e = 0`: no `i`, so vacuous. `D¹(g²) = 2gg' = 0` in characteristic 2. `(X − a)⁰ = 1 ∣ f`. For `f = 0`, all `D⁽ⁱ⁾` vanish and `(X − a)^m ∣ 0`, consistent with 4.1's third Check (the divisibility form holds for zero, the multiplicity form needs `f ≠ 0`). Only this one direction is claimed | true | added |
| Stacks upper and lower Bombieri–Stepanov bounds along `dℕ`, constants depending on the curve | ℙ¹ over `𝔽_q`; the binders of `exists_upper_bound_of_smooth` and `exists_lower_bound_of_isCurve` | `N_m = q^m + 1`: upper bound with `C = 1`, lower bound with `C = 0`. The lower bound assumes proper with DVR local rings, which holds for smooth curves (`isDiscreteValuationRing_stalk_of_coheight_eq_one`). A common `C, m₀, d` exists: take the sum of the absolute values of the `C`s, the max of the `m₀`s and the product of the `d`s, as the file's own `norm_le_sqrt_of_smooth` does | true | added |
| 4.2–4.3 "constants chosen before the equation" | 4.2 and 4.3 as stated | 4.2: `C, Q₀` depend only on `d, m`; 4.3: only on `q, n` (resp. `q, d`) | true | added |
| Stacks `norm_le_of_norm_sum_pow_le`: `‖∑α_i^m‖ ≤ C B^m` for `m ≥ m₀`, `d ∣ m`, `B > 0`, forces `‖α_i‖ ≤ B`; `d = 1` is 4.4 | empty `ι`; roots `2, −2` with `B = 1, d = 2`; roots `1, 1` with `B = 1` | Empty: vacuous. `{2, −2}`: even power sums are `2·2^m`, so the hypothesis fails, matching 4.4's second Check. `{1, 1}`: sums are `2 ≤ 2·1^m`, conclusion `1 ≤ 1`. At `d = 1` the hypothesis is 4.4's (all `m ≥ m₀`); 4.4's `C ≥ 0` is not needed | true | added |
| Weil rationality "given with a compactification" | `LAdicTraceFormulaFinal.lean` lines 42–55 | Binders: `[IsNoetherian X.1]`, `[LocallyOfFiniteType f] [QuasiCompact f] [IsSeparated f]`, `j : CompactificationOf (Over.mk f)`, `ℓ ≠ ringChar k`, `F` an `LAdicSheaf` over `ℚ_[ℓ]`. Conclusion: `∃ P Q : ℚ_[ℓ][X]` with `Q(0) = 1` and `L · Q = P` | the old wording dropped `j` | repaired |
| weil-conjectures Euler product on a "smooth geometrically connected affine curve" | `EulerProduct.lean` lines 92–95, 108 | `[IsAffine U]`, `[LocallyOfFiniteType]`, `[SmoothOfRelativeDimension 1]`, `[GeometricallyConnected]`, `hG : G.IsLisse` | the old wording dropped geometric connectedness | repaired |
| No counterpart for multiplicative characters, their Kummer sheaves, and Gauss, Jacobi and Kloosterman sums | grep of all `.lean` files: Weil `27cdb20` (980), weil-conjectures `55abf46`, Stacks `012108f` (62975) | Weil: 0 hits for `MulChar\|AddChar\|gaussSum\|jacobiSum\|Kloosterman`. weil-conjectures: 0 hits for `MulChar\|gaussSum\|jacobiSum\|Kloosterman\|Stepanov`; its `AddChar` occurs only in the Artin–Schreier and Fourier files of the 3.1/4.5–4.8 bullet and in a private orthogonality lemma via Mathlib's `sum_mulShift`. Stacks: `gaussSum`/`MulChar` occur only as `add_to_sga` index tags naming Mathlib declarations (`EgaSgaIndex/SGA4Half.lean`). Its "Gauss sum" docstrings (`ConverseTheorem/WhittakerSum.lean`) are `∑_{x≠0} θ(x) = −1` for an additive `θ`. No Kummer sheaf of a character of `F^×` in any of the three; its "Kummer" files are Kummer-sequence theory | true | narrowed (Stepanov's method and 4.1–4.4 removed) |
| "the Bombieri–Stepanov bounds of Stacks count the points of proper curves, not of the affine equations of Layer 4" | docstrings and binders of `CurveUpperBound.lean`, `LowerBoundCurve.lean`, `SmoothUpperBound.lean` | Respectively: proper with DVR local rings and a rational point; proper with DVR local rings; smooth proper geometrically integral | true | added |

The 4.9 reduction in the unchanged part of the bullet was rechecked against the newly cited bound:
- odd `m`: `g = (m − 1)/2`, one point at ∞, error `≤ (m − 1)√q`;
- even `m`: `g = (m − 2)/2`, `1 + η(a)` points at ∞, error `≤ (m − 2)√q + 1 ≤ (m − 1)√q`;
- `m = 1`: error `0`; `m = 2`: error `1 ≤ √q`.

## Notes

- **Signatures.** `Suggested.lean` is unchanged, so no new `#check @name` pass was run. The two
  declarations `signatures.md` flags as having lost `(h : c₁.Coprime c₂)` are `crtFactorLeft` and
  `crtFactorRight` (lines 463, 468). That flag is a false positive: their elaborated types contain
  the binder explicitly (`c₁.Coprime c₂ → DirichletCharacter ℂ (c₁ * c₂) → …`). Only its name `h`
  is anonymised.
- **Ownership and suppliers.** No statement, target or supplier changed: Provenance is secondary
  and prescribes nothing. All three repositories are outside the pins, and none is named as a
  supplier. No ownership question arises.
- **Sources.** The three repositories were read on GitHub at the named commits; all are public and
  Apache-2.0. Nothing was copied into the roadmap, and no literature source was fetched or needed.
  `needs-references.toml` was not written.
- **Suspicious text.** The review text contains no instructions.
