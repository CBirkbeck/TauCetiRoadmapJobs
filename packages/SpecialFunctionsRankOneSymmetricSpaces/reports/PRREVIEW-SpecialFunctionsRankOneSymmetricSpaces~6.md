# Review of SpecialFunctionsRankOneSymmetricSpaces (pull request #2935 at 7d84ea8)

**Verdict:** accepted

**Summary.** Accepted: the previous review had no finding, and this head repairs its small correction and two of its three format notes without introducing a problem. The Stieltjes step of the spectral representation of 1.2 now names its owner in the pinned Tau Ceti, and the reduction of the complex measure to four positive ones is correct as written; the mollification clause for the minimal operator is correct. One format note is carried over, not blocking; the unreadable book sources remain for the human reviewers.

## N01 — The Paley–Wiener theorem of 1.3 still has no theorem number

The Sources paragraph of 1.3 (README line 507) still cites Flensted-Jensen (1972) and Koornwinder (1975) "after Klimyk–Vilenkin, p. 234, without theorem numbers". The theorem numbers in either paper would give the target a locator of its own.

## Previous findings

The previous report had no finding (R); its other remarks are accounted for here.

- C01 — repaired: "The step "vanishing Stieltjes transform, so zero" is Tau Ceti's `MeasureTheory.Measure.ext_of_resolventTransform`", with the reduction to positive parts; the declaration is in the *Needs* line of 1.2, the Dependencies of Layer 1 and a new contract "From Tau Ceti".
- N01 — not repaired: "cited after Klimyk–Vilenkin, p. 234, without theorem numbers" (N01 above).
- N02 — repaired: "the smooth functions with compact support in `(0, ∞)` are a core of it: `Δ` is smooth and positive there, so a compactly supported element of the maximal domain lies in `H²`".
- N03 — repaired: the module docstring names the spectral representation of 1.2 and says the pins have "neither the closure of `L` as an unbounded operator on `L²(Δ dt)` nor the Sturm–Liouville operators".

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 1.2 Stieltjes step: complex `ν` with `T(ν) = 0` off `ℝ` is zero | `ν` = pushforward of `f̃ ḡ dμ` under `h`; `f̃, g ∈ L²(μ)` | `|ν|(ℝ) ≤ ‖f̃‖‖g‖ < ∞`; `T(ν̄)(z) = conj T(ν)(z̄) = 0`; `T(Re ν) = (T(ν)+T(ν̄))/2 = 0`, same for `Im` | true |
| 1.2 use of `ext_of_resolventTransform` | `(Re ν)⁺, (Re ν)⁻` finite positive; hypothesis `0 < z.im` only | `T((Re ν)⁺) = T((Re ν)⁻)` on upper half-plane gives `(Re ν)⁺ = (Re ν)⁻`, so `Re ν = 0`; likewise `Im ν = 0` | matches the pinned signature |
| The contract's description of the Tau Ceti theorem | elaborated type | `∀ {μ ν : Measure ℝ} [IsFiniteMeasure μ] [IsFiniteMeasure ν], (∀ z, 0 < z.im → resolventTransform μ z = resolventTransform ν z) → μ = ν`; kernel `(x − z)⁻¹` | agrees with README |
| 1.2 pushforward under `h` | `h(λ) = −(λ² + ρ²)` on `(0, ∞)` | `h′ = −2λ < 0`: injective; `∫ f̃ ḡ (h − z)⁻¹ dμ = ∫ (x − z)⁻¹ dν(x)`; `ν = 0` gives `f̃ ḡ = 0` μ-a.e. | agrees |
| 1.2 smooth compactly supported core of the minimal operator | `u` in the maximal domain, support in `[a, b] ⊂ (0, ∞)` | `u′ = (Δu′)/Δ` absolutely continuous; `u″ = ((Δu′)′ − Δ′u′)/Δ ∈ L²`; `Lu_ε = u_ε″ + (Δ′/Δ)u_ε′ → Lu`, `Δ` bounded above and below on `[a−δ, b+δ]` | true |
| 1.2 the core functions lie in `dom L̄` | smooth `u`, support in `[a, b]`, `a > 0` | even extension is smooth, even, compactly supported: in the domain of `L` | agrees |

The rows for the statements the change does not touch stand as in the previous review, of `9e03432`.

- Source locators checked against a text: 0 (the changed passages add no source locator; the sampled section 1.2 changes only in its route and its *Needs* line).
- Library declarations opened at the pin: Tau Ceti `MeasureTheory.Measure.ext_of_resolventTransform` (`TauCeti/MeasureTheory/Measure/ResolventTransform/Inversion.lean`, line 173, with the file's sign convention at lines 37–38); Mathlib `MeasureTheory.resolventTransform` (`Mathlib/MeasureTheory/Measure/ResolventTransform.lean`, line 108).
- Cross-roadmap citations resolved: OperatorTheory/UnboundedOperators §4.8 on main (README line 657: the minimal operator is the closure on compactly supported maximal-domain functions, as the new clause assumes).
- Dependency check: `depcheck: 106 roadmaps, 1219 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: no error, `sorry` the only warning (58), no `set_option`; imports are Mathlib and the one Tau Ceti module whose declaration the file pins with `#check`. No statement changed, so the elaborated types stand as compared before; the new `#check` prints the type in the table.
- Pull request text against the head: it lists the Tau Ceti supplier, the one Tau Ceti import, 58 statements and the docstring's account of the spectral representation; no sentence is contradicted and no change is left unstated.

Overlap check: read OperatorTheory/UnboundedOperators (main) for the changed passage; the lists of closest roadmaps (SpecialFunctionsSU11MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsGroupModels; SpecialFunctionsLegendre on main) are unchanged and were not read again, since the change adds no object. Uniqueness of the resolvent transform: Tau Ceti, cited. The minimal Sturm–Liouville operator: OperatorTheory/UnboundedOperators, cited.

Source independence: changed passages only; 3 passages compared (the Stieltjes reduction, the mollification clause, the supplier contract) with 1 text, the pinned Tau Ceti file's docstrings, none shared beyond the statement of the theorem; no layer added, removed or reordered, so the arrangement was not compared again; largest share Wawrzyńczyk, 27 of 79 source mentions, unread as before.

Research link: The Jacobi transform with inversion, Plancherel and Paley–Wiener is Koornwinder's theory (1984), cited by DLMF §15.9(ii); Layer 4 is the rank-one case of the Helgason–Fourier analysis on symmetric spaces (Heckman–Schlichtkrull 1994), a prerequisite of the Selberg trace formula for hyperbolic manifolds. Rests on the README's references and DLMF §15.9.

## Not verifiable

- Flensted-Jensen (1972) and Koornwinder (1975): not in the sources cache; the earlier reviews found both paywalled.
- As in the previous reviews, every locator into Vilenkin–Klimyk Vol. 2, Klimyk–Vilenkin, Wawrzyńczyk, Koornwinder (1984) and Heckman–Schlichtkrull.

Automatic checks set aside as false positives: the report of a section header in `Suggested.lean` with no declaration under it (the header carries the `#check` lines that pin the library names the README cites, which the form rules allow); the report that `SU11.boostMatrixElement_eq_jacobiFunction` is found nowhere (it is declared in `Suggested.lean` inside the namespace `SU11`).

## Source issues

- none

## For the human reviewers

- **Not tested.** Wawrzyńczyk, *Group Representations and Special Functions* (1984), has the largest share of the locators (27 of 79 mentions); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
- **Licence.** The README's section on prior formalization says the roadmap reuses the names and conventions of the author's own lean-SFVK (Apache-2.0, commit `2a512fe`); `Suggested.lean` appears adapted from it. I did not open that repository.
- **Licence.** The theorems of Layer 1 go back to Koornwinder (1984), Flensted-Jensen (1972) and Koornwinder (1975); the README cites them after Klimyk–Vilenkin, and none of the three could be read here.
