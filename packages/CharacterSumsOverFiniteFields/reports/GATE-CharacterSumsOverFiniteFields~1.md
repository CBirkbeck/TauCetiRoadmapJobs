# GATE-CharacterSumsOverFiniteFields~1: answers to human review

One comment (CBirkbeck, 2026-11-06T14:21:15Z, external-formalisation pointers), split into five
points. Commit `f96c86f` on the pull-request branch (not pushed) carries the repairs; it touches
only `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` and `Suggested.lean`.

## H01 (CBirkbeck) — applied

New secondary `## Provenance` section in `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md`
(before `## References`). It cites `AxiomMath/Weil` at `27cdb20` (Lean `v4.34.0-rc2`, Mathlib `16edf57`, requires
`AxiomMath/Stacks` at `012108f`) and `formal-arithmetic-geometry/weil-conjectures` at `55abf46`
(Lean `v4.33.1`), both Apache-2.0 according to the GitHub API, and says that neither is a supplier
and that the section prescribes nothing. This follows the root README's "Porting existing work" rule:
an independent development still cites existing work, in a clearly secondary section.

## H02 (CBirkbeck) — answered

No target or route of this roadmap uses purity or étale cohomology. Weil's bounds are proved by
Stepanov's method (§§4.2–4.3) together with the `L`-series of Layer 3 and the power-sum lemma
(§4.4), and the Scope section already says nothing here depends on `DeligneWeightsAndPurity`.
So the Weil II / Fourier–Deligne route and the definitions study apply to the Weil-conjectures
roadmaps, not to this one. The provenance section records the Apache-2.0 attribution requirement
for any adapted proof. Ownership check: `WeilConjectures`, `DeligneWeightsAndPurity`,
`WeightsInEtaleCohomology` and `FunctionFieldArithmetic` (searched at their heads with
`roadmaps show`) plan no Gauss, Jacobi or Kloosterman sums, no Stepanov bound and no Weil bound for
`∑χ(f(x))` or `∑ψ(f(x))`. Their only overlap is the projective curve bound `2g√q`, which this
roadmap does not state.

## H03 (CBirkbeck) — applied

Checked at the pinned commits. `Weil/AlgebraicGeometry/EtaleCohomology/Trace/WeilRiemannHypothesisForm.lean`
states the Riemann-hypothesis form for smooth proper geometrically irreducible schemes.
`WeilConjectures/ZetaFunction/HasseWeil.lean` proves `|N_n − (qⁿ + 1)| ≤ 2g q^{n/2}` for smooth
proper geometrically integral curves (`Hom.abs_pointCount_sub_le_two_mul_genus`). Neither file
states an affine count. The Provenance bullet for 4.9 records this and gives the reduction for
`y² = f(x)`: genus `⌊(m − 1)/2⌋` and `1` or `1 + η(a)` points at infinity give an error of at most
`(m − 1)√q` (odd `m`) or `(m − 2)√q + 1` (even `m`).

The adversarial pass on §4.9 also found a wrong derivation sentence, now repaired.
- Old: "Both are the counting identities of 4.7–4.8 at `E = F`".
- What was wrong: 4.8's identity uses `y^q − y`, which vanishes on `F`, so at `E = F` it counts
  `q·#{f = 0}`.
- New: the `y^p − y` count uses `#{y : y^p − y = c} = ∑_{t ∈ 𝔽_p} ψ_F(t c)` and 4.8 for the
  `p − 1` characters `ψ_F.mulShift t`.
- New Check: over `𝔽_9`, `y³ − y = x²` has 15 points. Its error 6 equals the bound, and with
  `y⁹ − y` the count is `9 = q·#roots`.

## H04 (CBirkbeck) — applied

Checked at `55abf46` and `27cdb20` and recorded in the Provenance bullet "3.1 and 4.5–4.8", with
one correction to the comment.
- `WeilSheaf/ArtinSchreierTrace.lean` gives the trace function `ψ(Tr(a x))` of the Artin–Schreier
  sheaf of `ψ(a x)` on the affine line.
- Correction: `WeilSheaf/LSeries.lean` is not an affine-curve formula. It gives the Euler product
  and the logarithmic-derivative identity on any scheme of finite type, the sheaf counterpart of
  §3.1.
- The affine-curve result is `WeilSheaf/EulerProduct.lean`: the trace formula through `H_c¹` and
  `H_c²` for a lisse sheaf on a smooth geometrically connected affine curve.
- None of these files assembles the `L`-polynomial of `∑ψ(f(x))`, its degree, or a bound.
- `Trace/LAdicTraceFormulaFinal.lean` proves rationality of `ℚ_ℓ`-sheaf `L`-functions
  (`Weil.exists_rationalLFunction_mul_eq_polynomial`).

## H05 (CBirkbeck) — applied

The Provenance bullet for Layers 0–2, 4.1–4.5 and 5–7 says that multiplicative characters and
Kummer sheaves, Gauss, Jacobi and Kloosterman sums, and Stepanov's method have no counterpart in
the modules it lists. That is what was verified: the five modules read contain none of them. The
whole-repository absence is not claimed. The weil-conjectures tree listing (about 8.7 million
characters) was searched only in its first 100,000 characters (no file name with Kummer, Gauss,
Jacobi, Stepanov or Kloosterman); the AxiomMath/Weil tree was searched only for the paths the
comment names.

## Build

`lake build TauCetiRoadmap.CharacterSumsOverFiniteFields.Suggested`: `Build completed successfully
(8954 jobs)`. The only warnings are `declaration uses sorry` on the stated theorems.

## Gate

`gate CharacterSumsOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0
long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0
outside-folder=0 source-material=0 FAIL`. The single `depcheck` item is `NOT IN ORDER:
CharacterSumsOverFiniteFields (insert it after its last supplier)`, the design-stage case, not a
defect.

Direction check (`gate --depcheck … --movable`):

```
NOT IN ORDER: CharacterSumsOverFiniteFields (insert it after its last supplier)
depcheck: 239 roadmaps, 2344 edges, 1 problem(s)
```

No UPWARD or CYCLE line.

## Signatures, citations, sources

- **Signature leads.** I could not elaborate a fresh `#check @name` file: the only Lean command
  this brief allows is the module build. My only Lean change is docstring text (line 39–40 now
  reads "which is proved in `AnalyticNumberTheoryPartI` §2.30"), so the 51 elaborated types in the
  worker's signature file are unchanged.
  - The two "dropped binder" leads (`crtFactorLeft`, `crtFactorRight`) are false positives: the
    elaborated types contain `c₁.Coprime c₂ →`, printed without its name.
  - The `;` "theorem" at line 40 and the "line 464" parse error came from the old docstring line
    beginning with "theorem;". The reflow removes that line.
  - I compared the types of `weil_mulChar_sum_bound`, `weil_addChar_sum_bound` and
    `card_hyperelliptic_sub_le` with README 4.7–4.9; they agree.
- **Citation leads.** `gauss_sum`, `jacobi_sum` and `kloosterman_sum` (README 7.1, 7.2,
  References) are parts of the LMFDB knowl identifiers `character.dirichlet.*`, not Lean names.
  No change.
- **Sources.** No mathematical source was fetched or newly cited. The two repositories are cited
  by URL and commit in the Provenance section. The folder has no `sources.toml`, and this job may
  edit only README and Suggested.lean. Nothing was added to `needs-references.toml`.
- **Untrusted text.** The comment's "How to use it" paragraph is advice and asks for no action
  outside the job. Nothing in it is suspicious.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 4.9 Artin–Schreier count, error `≤ (p−1)(n−1)√q`, and its identity | `𝔽_9`; `f = x², x²+x, x⁴+i x, x⁵` | `N = 15, 6, 12, 9`; identity `q + ∑_{t∈𝔽_3^×}∑_x ψ(t f) = 15, 6, 12, 9`; errors `6, 3, 3, 0` vs bound `6, 6, 18, 24` | bound holds, attained at `x²` | derivation sentence fixed; new Check |
| Old reading "4.8 identity at `E = F`" | same | `#{y⁹ − y = f}` = `9, 18, 18, 9` = `q·#roots` (`9·1, 9·2, 9·2, 9·1`) ≠ `N` | old sentence wrong | replaced |
| 4.9 Kummer bound, hypothesis "not `c h^e`, `e ∣ d`" | `y⁴ = x²` over `𝔽_5`; `y⁴ = (x²−1)²` over `𝔽_25` | `9` vs `q = 5`, bound `0`; `46` vs `25`, bound `15`, error `21` | both excluded by hypothesis, as stated | none |
| `card_hyperelliptic_sub_le` | random squarefree `f`, `p ∈ {3,5,7,11,13}`, `m ≤ 5`; `f = X, 1, X²` | max error`/((m−1)√q) = 0.945`; `N = 3` (`𝔽_3`), `6` (`𝔽_3`, `deg 0` excluded), `9` (`𝔽_5`, not squarefree) | holds; hypotheses necessary | none |
| Provenance: projective bound ⇒ affine bound for `y² = f` | 1079 squarefree `f`, even `m ∈ {2,4,6}`, `p ≤ 19`; `m = 1, 2` by hand | `0` violations of projective error `≤ 2g√q`, `g = ⌊(m−1)/2⌋`, `N_proj = N + 1 + η(a)`; `0` violations of affine error `≤ (m−2)√q + 1`; `m = 1`: error `0`; `m = 2`: `N = q − η(a)`, error `1 ≤ √q` | holds | stated in Provenance |
| Provenance factual claims | GitHub API and raw files at `27cdb20`, `55abf46` | licence `Apache-2.0` (both); toolchains `v4.34.0-rc2`, `v4.33.1`; Weil requires Mathlib `16edf57`, Stacks `012108f`; six named paths present | as stated | Provenance written to match |
