# Review of MassFormula (pull request #1819 at 17099cd)

**Verdict:** accepted

**Summary.** Accepted: every statement of the README and of `Suggested.lean` was recomputed on small cases and compared with the declaration of the pinned Tau Ceti that realizes it, and none failed; the one finding of the previous review (the folder did not cite the library's realization) is repaired, and no layer or item of the README on main is lost. There are five small corrections and three format notes, none blocking. Left to a human: whether the completed roadmap moves to `Completed/`, the licence of the acknowledged external formalization, and Serre's 1978 note, which carries 8 of the 9 source locators and could not be read.

## C01 — `localDiscriminantIdeal` is not a Tau Ceti declaration

The table of the supplier contracts is headed "Tau Ceti declaration" and is followed by "All names are in namespace `TauCeti`", so a reader looks for `TauCeti.localDiscriminantIdeal` (row "the different and discriminant exponents", README line 382). The pinned Tau Ceti has no declaration of that name anywhere; it is an abbreviation of `Completed/LocalFieldsRamification/Suggested.lean` (line 464) only. The other 24 names of the table are in Tau Ceti. Drop the name from the row, or say that it is the supplier's `Suggested.lean` abbreviation.

## C02 — `Polynomial.monicOfCoeff` is `TauCeti.Polynomial.monicOfCoeff`

*From Tau Ceti* says that names are in namespace `TauCeti` "unless they begin with `IntermediateField.`, `Polynomial.`, `Matrix.` or `MeasureTheory.`" (README lines 397–399), and then cites `Polynomial.monicOfCoeff` (line 427). Read by that rule it is the root-namespace `Polynomial.monicOfCoeff`, which does not exist at the pin (`#check @Polynomial.monicOfCoeff` fails; `TauCeti/RingTheory/Polynomial/Monic/OfCoeff.lean` line 64 declares it inside `namespace TauCeti`, `namespace Polynomial`). The Newton and box theorems cited as `Polynomial.…` are in the root namespace, as the rule says. Write `TauCeti.Polynomial.monicOfCoeff` in full.

## C03 — The item numbers in the docstrings of `Suggested.lean` are not the README's

The README numbers its targets `### k.m`, and the Lean docstrings carry numbers in the same style that mean something else, so "MassFormula 3.6" is the local fibre count in the README and the countability of `σ_K(n)` in the Lean file. The mismatches: Lean **0.2**–**0.7** (lines 66–98; the README's 0.2 is the wild exponent and 0.4 the box corollary), **1.2** and **1.3** (lines 125, 135; the README's 1.2 is local constancy), **3.2**–**3.8** (lines 173–225; the README's 3.2 is almost-everywhere separability, 3.6 the fibre count, 3.7 the integral). Layer 4 agrees. Use the README's number on each docstring (several declarations then share one), or drop the numbers.

## C04 — "All of Layer 2" is not independent of Layer 0

*How to read the build* says "The Newton estimate of Layer 1 and all of Layer 2 are independent of Layer 0" (README lines 44–46), while 2.3 computes the volume of a ball of the ring of integers of `L` "With Layer 0's orthogonality" (line 199) and 0.4 calls its corollaries "the workhorse of Layers 2 and 3" (line 140). The sentence is on main as well. Say that 2.1, 2.2 and the box volume of 2.3 are independent of Layer 0, and that the ball volume in power-basis coordinates needs 0.4.

## C05 — The description names two of the restated targets, not all

"Some statements are now in the library's stronger form" gives the Newton estimate and local constancy. The head also restates: the local fibre count, now for every radius `r > d` in place of the cubes with `d + n ≤ n · ρ` (3.6); Theorem 1 and the convergence statement, now for every `n` with the case `n = 0` treated, and convergence as a sum equal to `n` in place of summability (4.1, 4.3); the scaling law, for an arbitrary finite index type (2.2). And `Suggested.lean` no longer states the two comparison theorems for the totalized predicates (`intermediateFieldIsTotallyRamified_iff`, `intermediateFieldDiscriminantExponent_eq`); the README keeps them, citing `IntermediateField.isTotallyRamified_iff` and `IntermediateField.discriminantExponent_eq`. One sentence listing these would make the description complete.

## N01 — Some completed items have no declaration named

*From Tau Ceti* lists declarations by layer and not on the items, and a few items are proved at the pin without being named there: the box and ball forms of 2.2 and the box volume of 2.3 (`MeasureTheory.Measure.measure_image_mulVec_integerBox`, `…measure_image_mulVec_vadd_smul_integerBox`, `…measure_univ_pi_image_maximalIdeal_pow`, `TauCeti/MeasureTheory/Group/LocalFieldScaling.lean` lines 187, 284, 236), the uniform bound of 4.2 (`IntermediateField.wildExponent_le_mul_natCastValuation`, `MassFormula/Finite.lean` line 99) and the tame worked example (`MassFormula/Quadratic/Basic.lean` lines 185, 196). A line `*In Tau Ceti:* …` after each item's statement would carry them.

## N02 — The module docstring of `Suggested.lean` says two things

Lines 26–28 ("discharging all of them finishes neither a layer nor the roadmap") date from the file with `sorry`; lines 30–37 say the file certifies that Tau Ceti realizes the roadmap. The layer comments for Layers 2 and 3 also carry other titles than the README's.

## N03 — "`0 < n` is not optional"

The heading of that convention (README line 76) no longer matches its text ("where it is needed") or Theorem 1, the convergence statement and the tame count, which hold for `n = 0`.

## Verified sound

**Previous findings.** R01 (the folder restated as open what the pinned Tau Ceti proves): repaired. "Every target of Layers 0–4 is proved in Tau Ceti at the pinned commit", the new *From Tau Ceti* subsection names the declarations, and `Suggested.lean` defines nothing and closes each of its 26 theorems by the library's. C01 (description): repaired, new title and description. C02 (Eisenstein converse "has no declaration"): repaired, the table row cites the three declarations of `Eisenstein/TotallyRamified.lean`. C03 (supplier described as before its rewrite): repaired, "The supplier's worked examples give the lower breaks `b = 1` of `ℚ_2(i)` and `b = 2` of `ℚ_2(√2)`" (supplier README lines 532, 402). C04 (unused normalization in the root-count identity): repaired, `tsum_rootCount` takes any additive Haar measure. N01, N02: repaired (targets numbered `k.m`; the ⚠ markers and "verbatim" are gone).

**The record.** README at the merge base against the head, item by item: Layers 0–4 keep their ids and subjects (Layer 1's title drops "complete": the estimate is now over a Henselian ring); the 4 + 2 + 3 + 7 + 6 items of the layers and the six worked examples are all present with their statements; no anchor that another roadmap links (`#layer-4-the-mass-formulas`, EtaleMassFormula line 77 on main) changes. No change outside the folder.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.1 `σ_K(n)`, generators, converse | n = 0; n = 1; `√2` over `ℚ_2`; `X^p − t` | `σ_K(0) = ∅` (`totallyRamifiedOfDegree_zero`); `{⊥}`; `ℚ_2(√2) ∈ σ(2)`; no separable root, vacuous | holds; library def at `MassFormula/Basic.lean` 111 |
| 0.2 wild exponent, `n − 1 ≤ d`, tame criterion | `ℚ_2(√2)`; `ℚ_2(i)`; `K`; `L` infinite; `ℚ_p(√p)`, p odd | 3+1−2 = 2; 2+1−2 = 1; 0+1−1 = 0; junk 0+1−0 = 1 on both sides of an isomorphism; c = 0 and p ∤ 2 | holds, both directions |
| 0.4 box and cube | `ℚ_2(√2)`, r = 3; r = 1; r = nρ | `v(c₀+c₁√2) = min(2v c₀, 2v c₁+1) ≥ 3` iff `v c₀ ≥ 2, v c₁ ≥ 1` = exponents ⌈3/2⌉, ⌈2/2⌉; `c₁` free; all exponents ρ | holds |
| 1.1 Newton estimate (equality) | `ℤ_2`, `X² − 17`, y₀ = 1; `F(y₀) = 0`; `F'(y₀) = 0` | v F = 4, v F′ = 1, z ≡ 9 mod 32, v(z−1) = 3: 4 = 1+3; ⊤ = v+⊤ with z = y₀; hypothesis false | holds; separation: `v(F′z) ≥ v(z′−z)` from Taylor |
| 1.2 local constancy | T > 0 and degree; `X² − 2` near itself over `ℚ_2` | `1 ∈ 𝓂^T` false, so equal degrees; `1 + 2^{T−1}u` a square for T ≥ 4, same roots' fields | holds for every finite subextension, T from f only |
| 2.1 index | n = 0; `diag(π, π²)`; infinite residue field | 1 = q⁰; q³ with k = 3; 0 = 0^k (k > 0), 1 = 0⁰ | holds, junk included |
| 2.2 scaling law | `π·I` on `K`, S = 𝒪; k = 0; general S | `μ(π𝒪) = q⁻¹μ(𝒪)`; unit, factor 1; library form has `[μ.Regular]`, as the README says | holds |
| 2.3 boxes and balls | exponents (2,1) over `ℚ_2` | volume 2⁻³ = q^{−Σe} | holds |
| 3.1 region and measure | n = 1; `ℚ_2`, n = 2; n = 0 | `𝓂∖𝓂²`: q⁻¹−q⁻² = q⁻¹(1−q⁻¹); ½·¼ = ⅛ = 2⁻²·½; region is the one-point space, `f = 1` is Eisenstein in Mathlib's sense, measure needs `0 < n` | holds |
| 3.2, 3.3 a.e. separable, root-count identity | separable Eisenstein `a`; `X^p − t` | n roots, each in exactly one `K(x)`: sum n; no root in the separable closure: 0 on a null set | a.e. needed and stated |
| 3.4 measurability | arbitrary μ | library statement needs only `OpensMeasurableSpace`, no Haar hypothesis | README statement is the weaker one; true |
| 3.5 countability | finite subfamily | Σ of positive integrals ≤ n·μ(E_n) < ∞ | holds without Theorem 1 |
| 3.6 fibre count, `r > d` | `ℚ_2(√2)`, d = 3: r = 4, `g = X² − 2 − 32u`; r = 2; n = 1 | v g(ξ) = 10 ≥ 7, root at distance 7 = 10 − 3, other root at 3 < 4: one; ball contains ±√2: two; d = 0, r ≥ 1 trivial | holds; `r + d − 1 > d` gives `v g′(ξ) = d`; counterexample as stated |
| 3.6 box measure | m = nρ + d | Σ_{i<n} ⌈(m−i)/n⌉ = m (m ≥ n−1 since d ≥ n−1) | q^{−(nρ+d)} |
| 3.7 integral | n = 1; `ℚ_2`, n = 2, six fields | μ(E₁) both sides; 2·2⁻³·½ + 4·2⁻⁴·½ = ¼ = 2·⅛ | holds, consistent with 3.1 and 4.1 |
| 4.1 Theorem 1 | n = 0; n = 1; p odd, n = 2; `ℚ_2`, n = 2 | 0 = 0; 1; 2; 2·½ + 4·¼ = 2 | holds, no `0 < n` |
| 4.2 dichotomy | n = 0; `ℚ_p`; `𝔽_p((t))`, n = p; bound | left false, right true: `0 < n` needed and present; char 0 ≠ p, finite; `X^n + t^m X + t`, f′ = t^m, d = nm; c ≤ v_L(n) = n·v_K(n) | iff holds |
| 4.3 convergence | n = 0; `𝔽_p((t))`, n = p | empty sum 0; infinite family, sum p | holds |
| 4.4 orbit count | Galois `L`; `ℚ_2(∛2)` | 1·n; 3·1 = 3 | holds |
| 4.5 Theorem 2 | `ℚ_2`, n = 2; `ℚ_2`, n = 3; n = 0 | 2/(2·2) + 4/(2·4) = 1; one class, #Aut 1, c 0: 1; 0 ≠ 1, `0 < n` present | holds; agrees with Yasuda's form Σ q^{−d}/#Aut = q^{1−n}: ¼ + ¼ = ½ |
| 4.6 tame count | n = 0; n = 1; `ℚ_3`, n = 2 | `p ∣ 0`, vacuous; 1; 2 | holds |
| `ℚ_2` worked example | square classes | 5 unramified; −1, −5: d = b+1 = 2; ±2, ±10: d = 3 | six fields as stated |

- Source locators checked against the text: 0 of 9 (see *Not verifiable*); two secondary statements of the formulas were read (Dalawat, arXiv 1110.6702v2, its text lines 29–34, the degree-`p` case with `c = v(δ) − (p − 1)`; Yasuda, arXiv 2408.13481v1, its text lines 14–21, the isomorphism-class form) and agree with 4.1 and 4.5.
- Library declarations opened at the pins: all 44 names of *From Tau Ceti* (each found in the file the README gives) and 25 of the supplier table (24 found; C01); 17 Mathlib names, among them `hensels_lemma` (`Padics/Hensel.lean` 460, the four clauses the README lists), `pow_sub_one_dvd_differentIdeal` (`DedekindDomain/Different.lean` 743), `conductor_mul_differentIdeal` (638), `isAddLeftInvariant_eq_smul_of_regular` (`Haar/Unique.lean` 902), the instance `IsAdicComplete 𝓂[K] 𝒪[K]` (`LocalField/Basic.lean` 178).
- Cross-roadmap citations resolved: 3 (LocalFieldsRamification with its *Downstream consumers* entry, line 580; EtaleMassFormula; PadicExtensionFamilies, heading "Layer 5: Krasner's count by degree and discriminant", line 1138), all on main.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, no warning, no `sorry`, no `set_option`; imports are `Mathlib` and 17 `TauCeti.*` modules, all present. The elaborated types of the 26 declarations were compared with the README; none lost a binder.
- Padding probe: each of the 26 theorems is closed by one library theorem, by design and as the module docstring says; the file is the certificate, as `Completed/LocalFieldsRamification/Suggested.lean` is for the supplier.
- Headline theorems (Theorems 1 and 2, the dichotomy, convergence, the orbit count, the tame count): all stated, lines 237–273.
- Ownership: no other roadmap on main or at an open head declares `totallyRamifiedOfDegree`, `wildExponent`, `eisensteinSet`, `IsRepresentativeSet` or any theorem name of this file; EtaleMassFormula's two Lean-form citations (`MassFormula.tsum_one_div_natCard_residueField_pow_wildExponent`, `MassFormula.ncard_isomorphic_mul_natCard_algEquiv`) are still declared.

Overlap check: read PadicExtensionFamilies, EtaleMassFormula and LocalFieldsRamification on main, and searched the open heads of EtaleMassFormula and FieldOfNorms by object; nothing shared (both consumers cite this roadmap and Tau Ceti's declarations; the supplier owns the single-extension invariants).

Source independence: 0 passages compared with the cited sources, none readable; largest share Serre 1978, 8 of 9 locators; contents not compared (a six-page note whose text could not be read).

Research link: The headline targets are Theorems 1 and 2 of Serre 1978; Krasner 1966 refines the count by discriminant and Bhargava 2007 extends it to étale algebras, the local input to conjectured densities of number-field discriminants; README *Continuations* and *References*, and Yasuda 2024 (arXiv 2408.13481) §1.

## Not verifiable

- Serre 1978, C. R. Acad. Sci. Paris 286, 1031–1036 (Thm. 1, Thm. 2, Remarks 1° and 3°, Lemmas 1–3, eqs. (3), (5)–(13); sampled targets 3.2, 3.6, 3.7, 4.3, 4.4): not in the sources cache; the sources service answered "network trouble" twice, and the previous round found no legal copy.
- Serre 1979, *Local Fields*, Chap. I §6 Prop. 17 and Chap. III §§3, 6: paywalled, recorded as uncertified.
- Krasner 1966 and Bhargava 2007 (named in *References*, no locator): not read.

Automatic checks set aside as false positives: the rule against `letI`/`haveI` in a theorem's signature, for the local fibre count: the local-field structure on a subextension carrier is installed by the supplier's constructions and is not an instance, an instance binder would state the theorem for an arbitrary structure, and the signature is the library's own (`MassFormula/Fibre.lean` line 86).

## Source issues

- none

## For the human reviewers

- Scope: the pinned Tau Ceti (`2fd255d`) proves every target and `STATUS.md` says the roadmap is complete; the description leaves the move to `Completed/` to the maintainers.
- Not tested: Serre 1978 holds 8 of the README's 9 source locators and could not be read, so neither wording nor arrangement was compared with it.
- Licence: the README (lines 474–510) acknowledges the proposer's repository `0stellensatz/MassFormula` (Apache-2.0) and maps layers to its files; that repository was not opened.
