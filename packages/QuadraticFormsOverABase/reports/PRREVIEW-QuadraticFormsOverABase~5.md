# Review of QuadraticFormsOverABase (pull request #1930 at 12a2c9e)

**Verdict:** accepted

Incremental re-review of the 81 lines changed since 464f81f (79 in `README.md`, 2 docstring lines in `Suggested.lean`). All three findings of the previous review are repaired, the repairs introduce no new problem, and every claim the changed passages make about other roadmaps and sources was resolved at their current heads, on main or at the cached texts. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. No finding remains.

## Previous findings

- R01 — repaired: `README.md:88–91` "The polar criteria for ordinarity, over a field (§2.1) and, in positive even rank, the bijectivity of the polar map over a base (§2.2), are its; 2.2 compares its two unit criteria with them". The LefschetzPencilsAndVanishingCycles bullet of Downstream consumers is gone; `README.md:57–60` now counts only the odd-rank unit criterion (Conrad 2014, Proposition C.1.4 (3)) among the general statements here and calls the even-rank criterion "the form on `Fin n → R` of LefschetzPencilsAndVanishingCycles §2.2's equivalence of ordinarity with bijectivity of the polar map". At its head (#873), `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1554–1556` states that equivalence for rank `2m > 0` over any base, and `:4446–4449` records this roadmap's 2.2 as the comparing consumer. The two READMEs now agree.
- R02 — repaired: `README.md:318–321` "Prove the comparison with QuadraticFormInvariantsPartII §0.2: for a field `K` and a commutative `K`-algebra `L`, `mapCoeffs (algebraMap K L) Q = extendScalars Q L`"; *Needs:* line `:331–333`, contract `:258–259`, Layer 0 Dependencies `:357–358`, Check `:347–348`, `Suggested.lean:39–40` in the not-statable list. At the head of #1834 (43253ebc), `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:118–122` and `:2028–2030` say that this roadmap's §0.2 proves the identification, so the object has one owner, here, and the supplier edge points downward (QuadraticFormInvariantsPartII at line 389 of the candidate order, this roadmap at 395).
- R03 — repaired: `README.md:977–979` keeps one Downstream bullet, ArithmeticStatisticsPartIII §2.8, and `:61–66` carries the ArithmeticStatisticsPartII §1.3 and QuadraticFormInvariants Layer 5 comparisons without the word "cite"; ArithmeticStatisticsPartI §0.22 and SpinRepresentations are no longer named. Each sentence was verified at the cited head (below).

## Verified sound

### Gate, build, dependency check

- **Worker's gate** (`scratch/gate.md` at 12a2c9e): every check 0, `build=0`, OK.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The two new edges are the QuadraticFormInvariantsPartII §0.2 citations in 0.2's *Needs:* line and the Layer 0 Dependencies, both downward.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuadraticFormsOverABase'` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Elaboration:** `lake env lean TauCetiRoadmap/QuadraticFormsOverABase/Suggested.lean` exits 0 in 10 s with 22 warnings, all `declaration uses 'sorry'`, and nothing else. The file differs from 464f81f by 2 inserted docstring lines (`git diff --stat`: `2 insertions(+)`), so the 39 elaborated signatures of `scratch/signatures.md` (0 lost binders), the previous round's `#check @name` comparison and its one-tactic probe (no theorem closes) stand unchanged.
- **Form of the docstring change:** the new bullet names the missing carrier (`extendScalars`, QuadraticFormInvariantsPartII §0.2) and states nothing in its place, as the rule requires.

### The changed passages, resolved at the heads

- **QuadraticFormInvariantsPartII** (#1834, 43253ebc): `README.md:491–503` defines `extendScalars Q L` for a field `K`, a form on `Fin n → K` and a commutative `K`-algebra `L` by the coordinate polynomial `∑ᵢ Q(eᵢ) xᵢ² + ∑_{i<j} b_Q(eᵢ, eⱼ) xᵢ xⱼ` with coefficients mapped into `L`, and identifies it, when `2` is invertible, with `QuadraticForm.baseChange` through `Fin n → L ≅ L ⊗ (Fin n → K)` (`:501–502`, bullet `:514`); `Suggested.lean:101–107` has the same body (`algebraMap K L (Q (Pi.single i 1)) • proj i i` plus the `Ioi i` polar terms). So the generality of 0.2's comparison (field, commutative algebra) equals the supplier's, and the sentence "QuadraticFormInvariantsPartII §0.2's identification of `extendScalars` with `QuadraticForm.baseChange`" (`README.md:326–327`) is what that section states. `mapCoeffs` (`Suggested.lean:78–80`) is `toQuadraticMap (toLinearMap₂' S ((coeffMatrix Q).map f))`, whose coefficients are `f(Q(eᵢ))` and `f(polar Q eᵢ eⱼ)` for `i < j`: the two definitions agree coefficient by coefficient, as the README says.
- **LefschetzPencilsAndVanishingCycles** (#873): `README.md:1554–1556` "In even rank this is equivalent to the polar map `V → V*` being an isomorphism" for `V` locally free of rank `2m > 0`; `:1575–1580` proves it fibrewise. The Scope sentence at `README.md:59–61` and the body of 2.2 (`:548–554`, unchanged) describe exactly this.
- **ArithmeticStatisticsPartIII** (#1174): `README.md:49–51` is a `From TauCetiRoadmap.QuadraticFormsOverABase` contract for §§1.1–1.3; `:1187` defines `Counting.ternaryDet4` by the polynomial `4adf + bce − ae² − dc² − fb²` and proves it equal to the value of `univHalfDisc 3` at the upper-triangular coefficient matrix; `:1190–1191` use `halfDisc_mapCoeffs` and `halfDisc_comp` ("valid for every 3×3 matrix δ"), and `:1202` applies `halfDisc_comp` over `ℤ[x, y]`. Both names are declared here (`Suggested.lean:135, 140`) with `halfDisc_comp` for every matrix `g`, `Odd n`, as that roadmap uses them. Remark, no change asked: that roadmap defines `ternaryDet4` by the explicit polynomial and proves it equals the value of `univHalfDisc 3`; the bullet's "defines … as the value of `univHalfDisc 3`" compresses the two steps, and the identity it states is exact (row 34).
- **ArithmeticStatisticsPartII** (#1173): `README.md:17` and `:296–316` own the division-free ternary `4 Det` over any commutative ring with the law `4 Det(Q ∘ Mᵀ) = (det M)² 4 Det Q`; `:360` gives `4 Det(x₁x₂ + x₃²) = −1`, `:350` gives `4` at `x₁² + x₂² + x₃²`. Row 34 verifies `4 Det = δ'` at `n = 3` as polynomials and at both values, and row 35 the law against `halfDisc_comp` with `g = Mᵀ`.
- **QuadraticFormInvariants** (main, 3090489): `README.md:1460` "Layer 5: the Brauer-valued invariants", `:1533–1536` "For regular `q` on a finite-dimensional space … if `dim q` is odd, then the even subalgebra `CliffordAlgebra.even q` is finite-dimensional central simple"; `:179` "every statement here assumes `2` invertible". The Scope sentence restricts to dimension at least `3`, which is 4.1's hypothesis (`README.md:827`), and reads regularity as `δ'(q) ≠ 0` through `det polarMatrix q = 2 δ'(q)` (1.2, row 36). Dimension `1` (`C₀ = K`, Azumaya for every `a`) is the 4.1 Check at `:840–841`, unchanged.

### Sources read at their locators (the sampled targets the change touches)

Fetched through the sources service into a scratch manifest (Conrad from the author's page, Voight from arXiv).

- **Conrad2014** line 12488–12498: Proposition C.1.4 for `n > 1` odd, (1) `disc′(Q) = ½ disc(Q)` integral, (2) `disc′(Q′) = disc′(Q) det(C)²`, (3) `disc′(q) ∈ R×` iff `q` is non-degenerate over `Spec R`; the paragraph before (lines 12481–12484) gives the even-rank and `2 ∈ R×` cases through the perfect pairing. This is the locator the new Scope sentence (`README.md:57–58`) and 2.2 cite. Remark on untouched text: 2.2 states the odd-rank criterion for every odd `n`, while Conrad's proposition assumes `n > 1`; at `n = 1`, `δ'(a x²) = a` and smoothness is `a ∈ Rˣ`, the Check at `:404`.
- **Voight2011** line 407: (3.2) `D(q) = 4abc + uvw − au² − bv² − cw²` for the form of (1.12), line 262, `q = ax² + by² + cz² + uyz + vxz + wxy`. Row 34 recomputes it as `½ det(U + Uᵀ)`.
- **0.2**: no source is named; the comparison is a coefficient identity and was checked as a proof (row 33).

### Adversarial pass

Rows 1–33 are the previous report's (review of 464f81f), carried for the untouched statements; rows 33–36 are this round's, for the changed passages, computed by an exact pure-Python polynomial expansion (script in the job's scratch directory).

| # | Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|---|
| 1–32 | Conventions, `standard`, 0.2 evaluation law and `mapCoeffs_eq_baseChange`, 1.1–1.4, Layer 1 Arf example, 2.1–2.4, 3.1–3.4, 5.1–5.2, Layer 4 Examples, 6.1 | as in the previous report, rows 1–33 | as in the previous report (unchanged statements; `Suggested.lean` differs only in its docstring) | hold | none |
| 33 | 0.2 comparison `mapCoeffs (algebraMap K L) Q = extendScalars Q L` | `[1, a]`: coefficient matrix `!![1, 1; 0, a]`; `x y`; `[1, 1]` over `𝔽₂` to `𝔽₄` | `mapCoeffs`: `(Q(e₀), polar(e₀, e₁), Q(e₁)) = (1, 1, a)`, `extendScalars` body (`Suggested.lean:101–107` of #1834): the same three coefficients, so `x² + x y + a y²` / `x² + x y + a y²`; `x y` / `x y`; `[1, 1]` at `(ω, 1)`: `ω² + ω + 1 = 0` on both sides | holds; a definition dropping the off-diagonal term would give `x² + a y²` (the Check) | none |
| 34 | Scope: ArithmeticStatisticsPartII `4 Det` is `δ'` at `n = 3` (Voight (3.2)) | universal ternary form in 6 variables; `x² + y² + z²`; `x₁x₂ + x₃²` | `½ det(U + Uᵀ) − (4adf + bce − ae² − dc² − fb²) = 0` and `½ det(U + Uᵀ) − (4abc + uvw − au² − bv² − cw²) = 0` as polynomials; `4` / `4`; `−1` / `−1` | holds | none |
| 35 | Scope: the `4 Det` law is `halfDisc_comp` | generic `3 × 3` matrix `M`, `g = Mᵀ` | `½ det(gᵀ(U + Uᵀ)g) − (det M)² · ½ det(U + Uᵀ)`: 0 of 105 terms survive | holds | none |
| 36 | Scope: over a field with `2` invertible, `δ'(q) ≠ 0` is regularity (`det polarMatrix q = 2 δ'(q)`) | `q₃ = standard 3`; `x² + y² + z²` | `det !![0, 1, 0; 1, 0, 0; 0, 0, 2] = −2 = 2 · (−1)`; `det(2·1) = 8 = 2 · 4` | holds | none |

### Ownership and overlaps

- `scratch/overlaps.md`: no open pull request changes this roadmap, no dropped id is cited, no id depends on an open revision's numbering, no roadmap is listed as close in vocabulary.
- The one object this round moves, the `extendScalars` comparison, has one owner (0.2 here) and the supplier says so at its head (above). `scratch/citations.md` lists `Counting.ternaryDet4` as found in no pinned library: it is ArithmeticStatisticsPartIII's own name (`README.md:1187` at #1174), named here only in Downstream consumers.

## Not verifiable

- Nothing in the changed passages. The previous report's items (Knus 1991 IV (3.1), Bichsel–Knus 1994, Parimala 1978, Dieudonné 1955, the Montpellier manuscript) concern untouched text and stand as recorded there.

## Source issues

- none
