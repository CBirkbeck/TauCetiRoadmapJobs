# Review of EllipticCurveModularity (pull request #1018 at c45ecff)

**Verdict:** needs changes

Incremental re-review of the 30 lines changed since `6a07636`, plus the pull request's title and description. Three P3 findings; none is blocking, but the gate fails on the first.

## R01 (P3) — Gate `statement-hygiene`: `rationalEndomorphisms_eq_int` concludes `Nonempty (… ≃+* ℤ)`

**Location:** `TauCetiRoadmap/EllipticCurveModularity/Suggested.lean:86-88`: "`Nonempty (TauCeti.AlgebraicGeometry.AbelianVariety.End A ≃+* ℤ)`"; `TauCetiRoadmap/EllipticCurveModularity/README.md:519`: "so `End_ℚ(E) ≃+* ℤ`".

**Claim:** The headline is stated as the existence of an unnamed ring isomorphism.

**Witness:** The gate on this head: `statement-hygiene=1 … FAIL`, line 88, "state the canonical map and `IsIso` of it … keep `Nonempty` only as a corollary named `nonempty_*`". The canonical map exists at the pin: `Int.castRingHom (End A)`.

**Repair:** Replace the conclusion by `Function.Bijective (Int.castRingHom (TauCeti.AlgebraicGeometry.AbelianVariety.End A))`, and README line 519 by "so the canonical ring map `ℤ → End_ℚ(E)` is bijective". Tested: a scratch copy with this conclusion elaborates (`sorry` the only warning) and is not closed by `simp`, `infer_instance` or `exact?`; for `dim A = 0` the map ℤ → 0 is not injective, and `hA` excludes it.

## R02 (P3) — `## References` is still mid-document and still incomplete (previous R03)

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:411` (`## References`, between `## Exact supplier contracts` and `## How to read the build` at line 463); the last section is `## Downstream consumers` (line 2013).

**Claim:** The section is the roadmap's reference list, in the house position.

**Witness:** It lists Khare–Wintenberger, Serre 1987, Faltings, Carayol, Deligne–Serre and Cremona. Milne (lines 1669, 1675), Ribet–Stein (1670, 1720), Barrios, Darmon–Diamond–Taylor, González-Jiménez–Lario (line 609), Serre 1970, Brumer–Kramer, Silverman and Miyake are cited only inline.

**Repair:** Move the section (with its pagination paragraph, lines 456-460, and the link definitions) after `## Downstream consumers`, and add one entry per work cited inline, each with the locators the layers use; the Milne entry is the one now written at line 1669.

## R03 (P3) — `lCoeff_LSeriesSummable` is not about `lCoeff` (previous R04, half repaired)

**Location:** `TauCetiRoadmap/EllipticCurveModularity/Suggested.lean:142`: "`theorem lCoeff_LSeriesSummable {K : Type*} [Field K] [NumberField K] (W : WeierstrassCurve K)`"; `README.md:1865, 1940, 1976`.

**Claim:** The name says the theorem concerns `lCoeff`.

**Witness:** `lCoeff` (`Suggested.lean:49`) takes a `WeierstrassCurve ℚ`; the theorem's conclusion is `LSeriesSummable (fun n => (W.LFunction n : ℂ)) s` over any number field and never mentions `lCoeff`.

**Repair:** Rename to `LFunction_LSeriesSummable` at the four places. Tested: the renamed statement elaborates in the scratch copy; no roadmap on main or at an open head declares that name (`roadmaps grep --lean-only`), and EllipticCurvePeriodsAndModularParametrizations §3.1 cites the target by its README title, not by the Lean name.

## Previous findings

- R01 — repaired: EllipticCurvePeriodsAndModularParametrizations at its open head (`91ab26b`) has "### 3.1 The convergence input … Use EllipticCurveModularity R29.6, **Elliptic coefficient summability**" (its README lines 818-831); its `Suggested.lean` no longer states the theorem.
- R02 — repaired: line 1669 "Milne, *Abelian varieties* (1986 Storrs article, corrected 2012), Proposition 12.1, p. 19"; line 1675 the same work, "§8, p. 12"; lines 429 and 1988 both "pp. 208–210".
- R03 — not repaired: `## References` is at line 411, before `## How to read the build`, with six works; see R02 above.
- R04 — partly repaired: the contract table has the row `WeierstrassCurve.IsSemistable` (line 186); the theorem is still `lCoeff_LSeriesSummable`; see R03 above.

## Verified sound

| Statement / location | Instances tried | Values on each side; wrong model excluded | Result |
| --- | --- | --- | --- |
| Reworded oddness argument, README 691-700 | `c = diag(1,−1)` at p = 7 and p = 2; two equal characters | p = 7: eigenvalues 1, 6 distinct, each eigenline 𝔽₇-rational, so a stable line over the closure descends; p = 2: 1 = −1 (excluded, 2 ∈ Σ_E); equal characters force `c` scalar, contradiction | pass |
| `WeierstrassCurve.IsSemistable` row, README 186 and use at 1322 | 11a1; 32a2; `O = ℤ`, `F = ℚ` | pin: `∀ v : HeightOneSpectrum O, ¬ HasAdditiveReduction` of the local minimal model; 11a1 `(v₁₁(Δ), v₁₁(c₄)) = (5, 0)` multiplicative, true; 32a2 at 2 `(6, 4)` additive, false | pass |
| Serre Theorem 5 pages, README 429 and 1988 | start, statement, end of §4.7 | §4.7 opens on printed p. 208 (`serre` line 1327), Théorème 5 on p. 209 (line 1334), (4.7.5)–(4.7.6) and the conclusion on p. 210 (lines 1369-1384) | pass |
| Milne locators, README 1669, 1675 | Proposition 12.1; §8 | `milne` line 725: an abelian subvariety `B` has `B′` with `B × B′ → A` an isogeny, as used at line 1664; line 434: §8 Isogenies | pass (pages: see Not verifiable) |
| `rationalEndomorphisms_eq_int` (R01), Lean 86 | 1, 0, [−2]; `dim A = 0` | `Int.castRingHom` sends 1, 0, −2 to id, 0, [−2]; injective since `[n] ≠ 0` for n ≠ 0, surjective is the theorem; zero ring for dim 0 fails injectivity | repair stated |
| `lCoeff_LSeriesSummable` (R03), Lean 142 | K = ℚ, s = 7/4; s = 3/2 | exponent `σ − 1/2` = 5/4 > 1 summable majorant; = 1 at the excluded boundary; statement unchanged by the rename | repair stated |

The rows for the untouched statements stand as in the previous review, of `6a07636`.

- Gate, rerun on this head: every counter 0 except `statement-hygiene=1` (R01): FAIL. No file changed outside the folder; `README.md` is the only file changed since `6a07636`.
- Dependency check: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit with thirteen `declaration uses sorry` warnings and nothing else; the file is byte-identical to the one read at `6a07636`, so signatures and the padding probe stand.
- Source locators checked against the text this round: 4 (`serre` lines 873-877, 1327-1384; `milne` lines 434, 725).
- Library declarations opened at the pin: Tau Ceti `AlgebraicGeometry/EllipticCurve/MinimalModel/Semistable.lean:90` (`IsSemistable (O) (W : WeierstrassCurve F) [W.IsElliptic] : Prop`; it requires ellipticity and says nothing of singular cubics), `AbelianVariety/End/Basic.lean` (ring structure on `End A`, used by the R01 repair).
- Cross-roadmap citations resolved this round: 1 (EllipticCurvePeriodsAndModularParametrizations §3.1 at its open head); the tool's three unresolved Lean names are two declarations of this file and the planned `ContinuousRep.IsAbsolutelyIrreducible` of ArithmeticGaloisRepresentations §1.7, as before.
- Pull request text: title and description read against the head. The three formulations (README 1802-1813), `exceptionalPrimes`, `IsNewformOf`, finiteness "rather than the numerical rational-isogeny bound" (675-679), the three consumers (81-89), the folder's three files and the 21 added declarations all agree; it adds a roadmap not on main and says so. No sentence is contradicted.
- Overlap check: read EllipticCurvePeriodsAndModularParametrizations (summability: owner EllipticCurveModularity R29.6, now cited there); the other listed roadmaps (EllipticCurveModularityPartII, its GL₂-type Part II, AlgebraicModularFormsAndSerreWeights, ClassicalSerreModularity, ModularForms, EllipticCurves) were not affected by the change and stand as read at `6a07636`; nothing else shared.
- Source independence: changed passages only; 3 passages compared with 2 sources (`serre`, `milne`), none shared (the reworded oddness paragraph orders the argument differently from `serre` lines 873-877 and shares no run of words beyond the formula); locator shares not recounted and contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Milne's page numbers "p. 12" and "p. 19" in the corrected 2012 typesetting: the copy on the author's page that the sources service read is the scan of the 1986 volume, where §8 is on printed p. 114 and Proposition 12.1 on p. 122 (PDF pages 12 and 20). The numbering and statements agree; the previous review read the pages in the corrected text.
- Faltings 1983, Silverman and Miyake: not reopened; as in the previous review.

## Source issues

- none

## For the human reviewers

- Licence: `serre` was read from the Collège de France page of its author, a host the sources service does not classify; I treated it as an author page.
- Licence: `milne` was read from the author's own site as an image-only scan of the 1986 Springer chapter; whether that scan or the corrected 2012 text is the copy to cite is the README's choice at lines 1669 and 1675.
