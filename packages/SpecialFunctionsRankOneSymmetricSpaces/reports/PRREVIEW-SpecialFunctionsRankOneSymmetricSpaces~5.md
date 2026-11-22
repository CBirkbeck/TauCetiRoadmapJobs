# Review of SpecialFunctionsRankOneSymmetricSpaces (pull request #2935 at 9e03432)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired and no finding remains. The new target of 1.2 (the Jacobi transform as the spectral representation of `L`) is correct as stated, its route supplies surjectivity of the unitary extension for all parameters of 1.2 without circularity, and every input except one elementary step now has an owner on main; the negative control of 2.5 is now true. There are one small correction and three format notes, none blocking; the unreadable book sources remain for the human reviewers.

## C01 — The step "vanishing Stieltjes transform, so the measure is zero" in the route of 1.2 has an owner in the pinned Tau Ceti that the text does not name

The route of the spectral representation (README lines 455–457) concludes from `∫ f̃ ḡ (h − z)⁻¹ dμ = 0` for all nonreal `z` that the finite complex measure `f̃ ḡ dμ` is zero. The *Needs* line of 1.2 and the supplier contracts list no input for this step, so an implementer cannot tell whether it is to be proved here. The pinned Tau Ceti has it for finite positive measures: `MeasureTheory.Measure.ext_of_resolventTransform` (`TauCeti/MeasureTheory/Measure/ResolventTransform/Inversion.lean`, line 173; the pinned Mathlib's `Mathlib/MeasureTheory/Measure/ResolventTransform.lean` has only measurability and analyticity). The complex case follows by applying it to the positive and negative parts of the real and imaginary parts: with `T` the transform, `T(ν̄)(z)` is the conjugate of `T(ν)(z̄)`, so vanishing at all nonreal `z` gives `T(Re ν) = T(Im ν) = 0` on the upper half-plane.

Smallest change: add that declaration to the *Needs* line of 1.2 and to the supplier contracts, with the clause that the route applies it to the four positive parts of the pushforward of `f̃ ḡ dμ` under `h`.

## N01 — The Paley–Wiener theorem of 1.3 still has no theorem number

The process words are gone ("cited after Klimyk–Vilenkin, p. 234, without theorem numbers"), but the target is still without a locator into Flensted-Jensen (1972) or Koornwinder (1975). The theorem numbers would give it one.

## N02 — "`L̄` contains the minimal operator" uses a mollification step the route does not mention

OperatorTheory/UnboundedOperators §4.8 defines the minimal operator as the closure on the compactly supported functions of the maximal domain, which are only locally absolutely continuous; the core of 1.2 is smooth. That smooth functions with compact support in `(0, ∞)` are a core of the minimal operator holds because `Δ` is smooth and positive there; one clause in the route (line 449) would say so.

## N03 — The module docstring of `Suggested.lean` does not name the spectral representation

The new bullet of 1.2 is a headline with no Lean name. The docstring says in general that "the README's other headlines are targets of the same standing, stated in prose"; it would help to name this one and what it lacks at the pins (the closure of `L` as an unbounded operator on `L²(Δ dt)` and the Sturm–Liouville carrier of OperatorTheory/UnboundedOperators §4.8).

## Previous findings

- R01 — repaired: "so it sends `a_t` to `a_t`, not to `a_{−t}`, and is not the Cartan involution (for `n ≥ 2` it still satisfies the criterion, because `a_{−t} ∈ K a_t K`)".
- R02 — repaired: the spectral representation is a bullet of 1.2 with its hypotheses; OperatorTheory/UnboundedOperators §4.8, §4.5 and Layer 1, §1.7 are in the route, the *Needs* line, the Dependencies of Layer 1 and the supplier contracts. One elementary step: C01.
- C01 — repaired: "`0` is limit circle exactly for `−1 < α < 1`, and limit point for `α ≥ 1`", and the bullet states the boundary condition "when `−1 < α < 1`".
- N01 — partly repaired: "not read here" is replaced by "cited after Klimyk–Vilenkin, p. 234"; the theorem numbers are still absent (N01 above).
- N02 — repaired: "where `W⁰` is the identity (the case of half-integer `α`, with `k = α + 1/2`)".

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 1.2 `−L` as a Sturm–Liouville expression | `Lu = Δ⁻¹(Δu′)′` | `p = w = Δ`, `q = 0`; `Δ > 0` smooth on `(0, ∞)`, so `p⁻¹, w ∈ L¹_loc`: in the class of UnboundedOperators §4.8 | agrees |
| 1.2 endpoint `∞` | `z = −(λ² + ρ²)` nonreal; `ρ = 0` | `Im λ ≠ 0`; `|e^{(±iλ−ρ)t}|² e^{2ρt} = e^{∓2 Im λ · t}`, exactly one integrable; same at `ρ = 0` | limit point |
| 1.2 endpoint `0` | `α = −3/4, 0, 1/2, 1` | `|t^{−2α}|² t^{2α+1} = t^{1−2α}`: integrable iff `α < 1`; `t^{3/2}`, `log t`, `coth t` integrable; `α = 1`: `t⁻¹` not | limit circle iff `−1 < α < 1` |
| 1.2 boundary condition `lim Δu′ = 0` | `(1/2, −1/2)`: solutions `1`, `coth t`; `(−1/2, −1/2)` | `4 sinh² t · (−sinh⁻² t) = −4 ≠ 0`, and `0` for `u = 1`; `Δ = 1` gives Neumann `u′(0) = 0` (cosine transform) | selects the even solution |
| 1.2 self-adjointness of `L̄` | indices `(0,0)` for `α ≥ 1`; `(1,1)` for `−1 < α < 1` | `T_min ⊆ L̄ ⊆ L̄* ⊆ T_max = T_min`; `W₀(1, u₂) = Δu₂′ → C ≠ 0`, `W₀(1,1) = 0`: proper symmetric extension of a `(1,1)` operator | self-adjoint |
| 1.2 `U L̄ U⁻¹ = M` and surjectivity | `(1/2, −1/2)`: `φ_λ = sin λt/(λ sinh t)`, `f̃ = (4/λ) ∫ f sinh t sin λt dt` | `∫|f̃|² λ²/(2π) dλ = (8/π)(π/2) ∫|f sinh|² = ∫|f|² Δ`; sine transform onto; `v = u sinh t`, `v″ − v` Dirichlet | agrees; general argument checked step by step |
| 1.2 core invariance used in `U L f = M U f` | `f` smooth even | `(Δ′/Δ) f′ = ((2α+1) coth t + (2β+1) tanh t) f′`, `t coth t` and `f′/t` smooth even: `Lf` smooth even, so `h f̃ = (Lf)~ ∈ L²(μ)` | agrees |
| 1.2 Stieltjes step | complex `ν = f̃ ḡ dμ` pushed by `h` | `h` injective on `(0, ∞)`; `T(ν̄)(z) = conj T(ν)(z̄)`; Tau Ceti `ext_of_resolventTransform` on positive parts | true; C01 |
| 2.5 negative control | `J′ = diag(1, −1, −1, 1, …)`, `n ≥ 2`; identity map | `J′ a_t J′ = a_{−t}`, so `a_{−t} ∈ K a_t K`; identity sends `a_t ↦ a_t ≠ a_{−t}` for `t ≠ 0` | repaired |
| 1.3 `W⁰` | `α + 1/2 = k ∈ ℕ` | `(−d/du)^k W^k = id`, with `W^{k−α−1/2} = W⁰ = id` | repaired |

The rows for the statements the change does not touch stand as in the previous review, of `71569a2`.

- Source locators checked against a text: 0 this round (the changed passages cite Klimyk–Vilenkin pp. 233–234 and two papers, none readable; the sources cache has none of them).
- Cross-roadmap citations resolved on main: OperatorTheory/UnboundedOperators §1.7 (maximal multiplication operator closed, dense, self-adjoint for real symbol: README line 122 and its API), §4.5 (line 478), §4.8 (line 649: coefficient class, `T_min* = T_max`, Green's formula with `W_x(u,v) = p(uv′ − u′v)`, Weyl's alternative, deficiency indices equal to the number of limit-circle endpoints). The contract in this README states exactly these.
- Library declarations opened at the pin: Tau Ceti `MeasureTheory.Measure.ext_of_resolventTransform` (`TauCeti/MeasureTheory/Measure/ResolventTransform/Inversion.lean` line 173); Mathlib `Mathlib/MeasureTheory/Measure/ResolventTransform.lean` (no uniqueness statement).
- Dependency check: `depcheck: 157 roadmaps, 1816 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is not yet in the merge order and is placed after its last supplier. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: no error, `sorry` the only warning (58), no `set_option`, the single import of Mathlib. The file did not change since `71569a2`, so the elaborated types stand as compared before.
- Pull request text against the head: the description lists OperatorTheory/UnboundedOperators §4.8 with §4.5 and Layer 1, §1.7 among the suppliers on main and names the spectral representation of 1.2 as a prose headline; 58 statements and 58 `sorry` agree with the file. No sentence is contradicted.

Overlap check: read OperatorTheory/UnboundedOperators (main) for the changed passages, and searched the roadmaps on main and at the open heads for the Jacobi transform and for Stieltjes inversion; the lists of closest roadmaps (SpecialFunctionsSU11MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsGroupModels) are those of the earlier reviews and were not read again. Sturm–Liouville endpoint theory and multiplication operators: OperatorTheory/UnboundedOperators. The spectral representation of the Jacobi operator `L`: this roadmap (SpecialFunctionsSU11MatrixElements leaves the general Jacobi transform to it). Uniqueness of the resolvent transform: Tau Ceti.

Source independence: changed passages only; 0 passages compared with a source text, since none of the sources the changed passages cite could be read; the new route (endpoint classification, the resolvent argument for surjectivity) is a derivation I recomputed and its contract is written against OperatorTheory/UnboundedOperators in this roadmap's own words; no layer added, removed or reordered, so the arrangement was not compared again; largest share Wawrzyńczyk, 27 of 79 source mentions, unread as before.

Research link: The Jacobi transform with inversion, Plancherel and Paley–Wiener is Koornwinder's theory (1984), cited by DLMF §15.9(ii); Layer 4 is the rank-one case of the Helgason–Fourier analysis on symmetric spaces (Heckman–Schlichtkrull 1994), a prerequisite of the Selberg trace formula for hyperbolic manifolds. Rests on the README's references and DLMF §15.9.

## Not verifiable

- Flensted-Jensen (1972) and Koornwinder (1975): not in the sources cache, and the previous review found both DOIs paywalled; the attribution of the factorization of `𝒜_{α,β}` for `α > β > −1/2` to Koornwinder (1975) was not checked against a text.
- Klimyk–Vilenkin pp. 233–234, cited in 1.2 for the form of (14) as an eigenfunction expansion: paywalled.
- As in the previous reviews, every locator into Vilenkin–Klimyk Vol. 2, Klimyk–Vilenkin, Wawrzyńczyk, Koornwinder (1984) and Heckman–Schlichtkrull.

Automatic checks set aside as false positives: the report of a section header in `Suggested.lean` with no declaration under it (the header carries the `#check` lines that pin the Mathlib names the README cites, which the form rules allow); the report that `SU11.boostMatrixElement_eq_jacobiFunction` is found nowhere (it is declared in `Suggested.lean` inside the namespace `SU11`).

## Source issues

- none

## For the human reviewers

- **Not tested.** Wawrzyńczyk, *Group Representations and Special Functions* (1984), has the largest share of the locators (27 of 79 mentions); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
- **Licence.** The README's section on prior formalization says the roadmap reuses the names and conventions of the author's own lean-SFVK (Apache-2.0, commit `2a512fe`); `Suggested.lean` appears adapted from it. I did not open that repository.
- **Licence.** The theorems of Layer 1 go back to Koornwinder (1984), Flensted-Jensen (1972) and Koornwinder (1975); the README cites them after Klimyk–Vilenkin, and none of the three could be read here.
