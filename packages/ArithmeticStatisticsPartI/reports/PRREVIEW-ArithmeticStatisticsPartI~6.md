# Review of ArithmeticStatisticsPartI (pull request #1171 at 95df277)

**Verdict:** accepted

No findings. This is an incremental re-review of the 20 changed lines since 508af00. The one previous finding, R01 (the upward QuadraticFormsOverABase §6.1 supplier), is repaired. The resultant identity now comes from the pinned Mathlib, and a scratch Lean proof confirms that it holds exactly as the README states it. Acceptance means this folder is ready for a human's final approval. It does not approve or merge anything.

**Note for the worker (outside the folder, not a finding).** The pull-request description's auto-generated **Depends on** block still lists `#1930 QuadraticFormsOverABase`. Its **Merge order** chain still includes #1930 and the suppliers it pulls in (#1222, #1504, #1691, #1707). At this head the README cites QuadraticFormsOverABase nowhere (`grep` finds 0 hits), so both blocks should be regenerated without them. Otherwise this pull request (merge-order line 109) is told to wait for a roadmap that the brief's rule places after line 394.

## Previous findings

- R01 — repaired: `README.md:38` now reads "The signed resultant identity for the binary discriminant is `Polynomial.resultant_deriv` … it gives `a₀·Δ_n(f) = (−1)^{n(n−1)/2}·Res_{n,n−1}(f, f′)` for `binaryDisc` (§0.12) over every commutative ring, `a₀ = 0` included; no roadmap supplies it." The QuadraticFormsOverABase subsection, the supplier-list item, the §0.22 clause, its proof sentence, its `*Needs:*` item and its Dependencies clause are all gone.

## Verified sound

**Scope of the round.** Since 508af00 the diff touches only `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md`, with 8 insertions and 12 deletions:

- `README.md:22`: the supplier list drops QuadraticFormsOverABase.
- `README.md:38`: the From Mathlib contract gains the `resultant_deriv` paragraph.
- Old :68–70: the QuadraticFormsOverABase subsection is deleted.
- `README.md:1540` and `README.md:1542`: the §0.12 binary-discriminant proof sentence and `*Needs:*` line.
- `README.md:2397`, `README.md:2407` and `README.md:2409`: the §0.22 pencil-coordinates target, its proof sentence and its `*Needs:*` line.
- `README.md:2603`: Layer 0 Dependencies.

`Suggested.lean` is byte-identical to 508af00. `git diff --stat origin/main...HEAD` outside the folder is empty. The worktree is clean at 95df2775bd95d1053b6dd938bace55574c340831. No repair touches the six locations of R01 in a way that leaves a residue: a case-insensitive grep for `QuadraticFormsOverABase` in the README returns 0 lines. No open roadmap names ArithmeticStatisticsPartI as a consumer of QuadraticFormsOverABase §6.1 (I searched with `roadmaps grep`), so the deletion breaks no citation.

**Gate, elaboration and signatures.**

- **Independent gate rerun:** every check is 0, `OK`. This includes `depcheck=0`, `outside-folder=0`, `stray-files=0`, `statement-hygiene=0` and `readme-ids-missing=0`. The worker's gate at this head also reports `build=0`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with exactly 13 `declaration uses sorry` warnings and no other output.
- **Signatures:** I wrote a scratch file importing the built module with `#check @name` for all 39 declarations of `signatures.md`. It elaborated with exit 0 and no errors. The Lean file is unchanged, so the previous comparison of each elaborated type with its README statement stands. `[Finite k]`, `[NumberField F]`, the scalar tower, finite dimension, generation and separability are all present. No binder changed.
- **Resolver leads:** the 15 Lean-name leads in `citations.md` (for example `binaryDisc`, `BinaryQuartic.isEligible_iff`, `ArithmeticOrbitRefinement.formIdeal_traceDual`) are all among those 39 declarations of this roadmap's own `Suggested.lean`. They are self-hits, not missing names.

**Dependency check output** (`gate --depcheck … --movable`):

```text
depcheck: 236 roadmaps, 2278 edges, 0 problem(s)
```

The output has no UPWARD, CYCLE or `moved:` line. Removing QuadraticFormsOverABase also removes the unlisted-supplier edge that R01 described: the check is silent about it, and its target would sit after HyperellipticCurves (merge-order line 394). The README now names no supplier below ArithmeticStatisticsPartI's line 109.

**Pinned declarations opened** (Mathlib 1b1ccf4b):

- `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`:
  - :137 `resultant_map_map`: `resultant (f.map φ) (g.map φ) m n = φ (resultant f g m n)`, at formal degrees with no degree hypothesis.
  - :347 `resultant_eq_zero_of_lt_lt`.
  - :934 `discr`: `sylvesterDeriv.det * (−1)^(natDegree·(natDegree−1)/2)`.
  - :943 `discr_C` (= 1), :949 `discr_of_degree_eq_one` (= 1), :961 `discr_of_degree_eq_two` (`b² − 4ac`).
  - :977 `resultant_deriv`: hypothesis `0 < f.degree`, conclusion `resultant f f′ natDegree (natDegree − 1) = (−1)^(natDegree(natDegree−1)/2) * leadingCoeff * discr`, in section `disc` with `[CommRing R]`.
- `Mathlib/Algebra/Polynomial/Derivative.lean:249` `derivative_map` (`[Semiring S]`).
- `Mathlib/Algebra/MvPolynomial/Eval.lean:69` `eval₂` and :158 `eval₂Hom`.

The README's paraphrase at :38 ("for a polynomial `f` of positive degree d over a commutative ring, the resultant of `f` and `f′` at formal degrees `(d, d−1)` equals `(−1)^{d(d−1)/2}·lc(f)·discr(f)`") matches :977 in hypothesis, formal degrees and sign. Every Mathlib name in the two changed `*Needs:*` lines (:1542 and :2409) exists at the pin.

**Machine check of the transported identity.** In a scratch file (`import Mathlib` only, with this roadmap's `binaryPolynomial` and `binaryDisc` copied verbatim from `Suggested.lean:146–155`) I proved, with no `sorry`:

- `natDegree` of the universal form `Σ C (X i) * T^(n−i)` over `MvPolynomial (Fin (n+1)) ℤ` is `n`, and its `coeff n` is `X 0`.
- The universal form maps to `binaryPolynomial a` under `eval₂Hom (Int.castRingHom R) a`.
- For every commutative ring R, every `n ≥ 1` and every `a : Fin (n+1) → R`: `a 0 * binaryDisc n a = (−1)^(n(n−1)/2) * resultant (binaryPolynomial a) (binaryPolynomial a).derivative n (n − 1)`.

This is exactly the README's statement at :38 and :2397, including `a₀ = 0`, obtained by the route stated at :2407 (`resultant_deriv` at the universal form, then `resultant_map_map` and `derivative_map`, with `MvPolynomial.X_ne_zero` for the degree). The same file proves the negation at `n = 0`, `a = (2)` (row 6 below). The file elaborated with exit 0 and no warnings.

**Fresh adversarial computations** for the changed statements:

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| :38, paraphrase of `resultant_deriv` | `f = X² + X`, d = 2 | Left: roots 0, −1; `f′ = 2X + 1`, `f′(0) = 1`, `f′(−1) = −1`, so `Res₂,₁ = lc^1·(1)(−1) = −1`. Right: `(−1)^1·1·discr`, with `discr = 1² − 4·1·0 = 1`, gives −1 | agrees, under the same hypothesis (positive degree) as the pin | none |
| :38/:2397, transported identity | every n ≥ 1, every CommRing, every `a` | Scratch Lean theorem above, proved from the pin | holds, `a₀ = 0` included | none |
| :38 "degree exactly n, leading coefficient `a₀`" | universal form, general n | `coeff F n`: only i = 0 has `n − i = n` (i ≤ n), so the value is `X 0 ≠ 0`; every term has degree ≤ n, so `natDegree F = n`. `0 < degree F` iff `n ≥ 1` | holds; positive degree needs n ≥ 1, which the README states | none |
| n = 2, generic and leading zero | `(1,1,0)`; `(0,3,5)` | `(1,1,0)`: `a₀Δ₂ = 1·1 = 1` and `(−1)^1·Res = (−1)(−1) = 1`. `(0,3,5)`: left `0·9 = 0`; `resultant (3X+5) 3 2 1 = 0` by `resultant_eq_zero_of_lt_lt` (1 < 2, 0 < 1) | holds. At `(0,3,5)`, `Δ₂ = 9` is not recovered from the identity, so the README is right to confine the quotient `Res/a₀` to the universal ring | none |
| n = 1 | `(a₀, a₁)`, including `a₀ = 0` | `Δ₁ = 1` (`discr_of_degree_eq_one` on the universal form); `resultant (a₀X + a₁) (C a₀) 1 0 = a₀` (1×1 determinant); `a₀·1 = (−1)^0·a₀` | holds | none |
| hypothesis n ≥ 1 (negative control) | n = 0, `a = (2)` | Left: `2·Δ₀ = 2·1 = 2` (`discr_C`). Right: `(−1)^0·resultant (C 2) 0 0 0 = det(empty) = 1` | the identity fails, as it should; the negation is proved in Lean; :38 and :2397 both state `n ≥ 1` | none |
| :2397 "`a₀` a nonzerodivisor on the universal ring" | `MvPolynomial (Fin (n+1)) ℤ`, versus specialization `a₀ = 0` | The ring is a domain and `X 0 ≠ 0`, so `Δ_n = (−1)^e·Res(F,F′)/a₀` there. At `(0,3,5)` the right side is 0/0 | correct, and consistent with "Leading-zero specializations use `Δ_n`" | none |
| :1540, §0.12 proof sentence | `Suggested.lean:152–155`; base change `ℤ → 𝔽₃` at `(1,1,0)` and `(1,1,1)` | `binaryDisc n a = eval₂ (Int.castRingHom R) a (discr F)` is "Mathlib's `discr` of the universal form" evaluated. Base change: `Δ = 1 ↦ 1 = Δ_{𝔽₃}(1,1,0)` and `Δ = −3 ↦ 0 = 1 − 4 = Δ_{𝔽₃}(1,1,1)` | correct. The sentence leaves "n ≥ 1" implicit, but it speaks of the section's universal `D_n` (n ≥ 2; `Δ₀ = Δ₁ = 1` by the section's convention at :1528), and `resultant_deriv` carries `0 < degree` | none |
| headline `binaryDisc_mod_four` (uses the object of the changed text) | n = 2: `(1,1,0)`, `(1,0,1)`, `(1,1,1)`, `(0,1,0)`, `(0,0,1)`; n = 3: `X³ − X` | Δ = 1, −4, −3, 1, 0; 4. `Int.emod 4`: 1, 0, 1, 1, 0; 0 | all values in {0, 1}; the leading-zero cases use `Δ₂`, not the affine discriminant | none |
| :1542, :2409 `*Needs:*` | each listed name at the pin | `discr` :934, `resultant_deriv` :977, `resultant_map_map` :137, `derivative_map` Derivative.lean:249, `MvPolynomial.eval₂` Eval.lean:69 | every name exists; nothing listed is unused by the stated route | none |

**Carried adversarial evidence.** Every other statement is untouched, and so is `Suggested.lean`. The following carry forward with their computed values:

- From [PRREVIEW-ArithmeticStatisticsPartI~5](PRREVIEW-ArithmeticStatisticsPartI~5.md): the rows for n = 3 (`X³ − X`: `Δ₃ = 4`, `(−1)^3·(−4) = 4`), n = 4 (`X⁴ − 1`: `−256 = −256`) and the sign-convention equivalence with the pin.
- From [PRREVIEW-ArithmeticStatisticsPartI~4](PRREVIEW-ArithmeticStatisticsPartI~4.md): its 16 fresh rows, 31 carried rows and 5 further carried rows. These cover §§0.1–0.24 and the 13 admitted headline theorems: `isEligible_iff`, `northcott_squareclassHeight`, `SquarefreeFamily.squarefree_residue_count`, `card_monicSquarefreePolysOfDegree`, `pMaximal_proportion`, `unpolarizedClasses_finite`, `symmetricPencil_invariants`, `formIdeal_traceDual`, `binaryDisc_mod_four`, `monic_nu_zero`, `monic_nu_one`, `monicEulerProduct_converges_pos` and `monicEulerProduct_limit`.
- The one-tactic padding probes and the headline/statability audit are also carried, because no declaration changed.

**Seeded sample.**

- **§0.12 (changed).** Of this round's sample, only §0.12 falls in a changed passage. I re-read its unchanged locator "([59], §1 p.2 and Appendix A pp.54–55)" in BSW II (Forum Math. Pi 13 (2025) e17, open access, fetched through the sources service with no manifest; the published PDF, page markers equal printed pages):
  - `BSW2 line 64` (p.2) states that the discriminant of a binary n-ic form is homogeneous of degree `2n−2` in the coefficients.
  - `BSW2 lines 3333–3376` (pp.54–55) evaluate the fixed-degree `Δ` on forms with `p | a₀`. This includes the reduction of `f` to `y·g` for a leading-zero form and a congruence for `Δ` modulo `(a₀², a₀a₁, a₁²)`. That is the leading-zero use that §0.12 describes and the mirror of its added-root formula.
  - The locator supports the target as written.
- **Untouched sampled targets.** §§0.3, 0.4, 0.6, 0.7, 0.10, 0.13, 0.14, 0.15, 0.17, 0.18, 0.19, 0.20, 0.23 and 0.24 are untouched and keep the source status of the reviews at 4ced5ee and before.
- **Flagged locators.** The README flags no locator as unverified.

**Ownership and overlaps.** `overlaps.md` lists no open pull request that changes this roadmap and no dropped or revision-only id. I searched by object across main and every open head with `roadmaps grep` for "signed resultant", "resultant at formal degree", `Res_{n,n` and `resultant_deriv`. That search covers the closest vocabulary neighbours (ArithmeticStatistics Parts II, III, V, VI and VII); of these, only Part VI touches the object, and it cites Mathlib's `resultant_deriv` directly. The only other statements of the formal-degree discriminant identity are QuadraticFormsOverABase §6.1 (#1930 head) and HyperellipticCurves (#1707 head). Both are later in the merge order and both route through the same Mathlib lemma. Two other hits are about a different object, the resultant of two polynomials: HypergeometricMotives (#1716 head, README :1198) and ArithmeticDynamics (#1335 head, README :1045, `binaryResultant`). The identity is Mathlib's, so no roadmap owns it. No new fully qualified Lean name was introduced.

**Remarks on untouched or house-pattern text (not findings, no change requested).**

- The capital after "For the proof," at :1540 follows the README's existing pattern: 63 occurrences, passed by earlier reviews.
- The r5 remark stands: HyperellipticCurves §0.1's `formDiscr` duplicates this roadmap's earlier §0.12 `binaryDisc`. That is HyperellipticCurves' to resolve by citation.

## Not verifiable

- Carried from the previous reports:
  - Tate 1966 [75] (paywalled, uncertified).
  - EVW's published Annals pagination.
  - Bhargava, Higher composition laws III [9], Introduction p.1332.
  - Wood [72], §2.1 p.3 (the unchanged locator of the §0.22 pencil target).
  - Published Duke pagination for Wood [65] and BKLOS [3].
- No changed claim depends on them: the changed text makes no new source claim, and its mathematics is checked against the pinned Mathlib.
- This is an incremental review of 20 changed lines; unchanged sections were not re-audited beyond the carried tables.

## Source issues

- none
