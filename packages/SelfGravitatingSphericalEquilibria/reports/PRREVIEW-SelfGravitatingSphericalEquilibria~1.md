# Review of SelfGravitatingSphericalEquilibria (pull request #2948 at 4ccad93)

**Verdict:** needs changes

**Summary.** Needs changes, for one reason: the finite-radius theorem (3.1) and the mass–radius relation (4.2) are stated for `n < 3` only, although both hold for `n < 5` and the missing range follows in a paragraph from the roadmap's own identity of 3.2; the restriction comes from the range of the cited lemma, not from the mathematics, and it excludes the polytrope of index `3`. Every other statement, Check and route was recomputed and is sound, including Buchdahl's inequality in the stated generality; there are no small corrections and no format notes. Two of the four sources (Pols, Reall) could not be read through the sources service, so their locators are unverified and a human should confirm the two author pages.

## R01 (P2) — The solution has a zero for every `0 ≤ n < 5`, and the roadmap's own virial computation proves it; 3.1 and 4.2 stop at `n < 3` because the cited lemma does

A library that states "a zero for `n < 3`, none for `n ≥ 5`" leaves the classical dichotomy (a zero if and only if `n < 5`) unproved on `[3, 5)`, and 4.2 then gives no radius, mass or mass–radius relation for the index `3`, the one where `K = C G M^(2/3)` fixes the mass. The scope section (line 550) gives the reason: "a zero of the Lane–Emden solution for `3 ≤ n < 5` (classically true; no open source with a proof was found, and Layer 3 proves only `n < 3`)". That is a restriction to the range of one source's lemma, which a general roadmap does not make.

The proof is already in Layers 1 and 3. Let `1 < n < 5` and suppose `θ > 0` on `[0, ∞)`. Keep the boundary terms in the three steps of 3.2 on `[0, ξ]`: with `I(ξ) = ∫₀^ξ μ²/s² ds`, step 1 gives `(n+1) W = 3J − ξ³ θ^(n+1)` with `J = ∫₀^ξ s² θ^(n+1)`, step 2 gives `J = θ μ + I`, step 3 gives `W = μ²/(2ξ) + I/2`, hence

    (5 − n) I(ξ)/2 = (n + 1) μ(ξ)²/(2ξ) − 3 θ(ξ) μ(ξ) + ξ³ θ(ξ)^(n+1).

The limit of `θ` is `0` (the first case of the proof in 3.1). Since `μ` increases, `θ(ξ) = ∫_ξ^∞ μ/s² ds ≥ μ(ξ)/ξ`; since `θ` decreases, `μ(ξ) ≥ ξ³ θ(ξ)ⁿ/3`, so `(θ^(1−n))' ≥ (n−1) ξ/3` and `θ(ξ) ≤ (1 + (n−1) ξ²/6)^(−1/(n−1))` (both are the estimates (3.2), (3.3) the route of 3.1 already uses). The right side is therefore at most `(n+1) ξ θ²/2 + ξ³ θ^(n+1) = O(ξ^((n−5)/(n−1)))`, which tends to `0`, while the left side is at least `(5 − n) I(1)/2 > 0` for `ξ ≥ 1`: a contradiction. I checked the identity at `n = 5`: with `θ = (1 + ξ²/3)^(−1/2)`, `μ = (ξ³/3) θ³`, the right side is `ξ³ θ⁶ (ξ²/3 − (1 + ξ²/3) + 1) = 0`, as the factor `5 − n` requires.

Smallest change: state 3.1 for `0 ≤ n < 5` (the Lean `laneEmden_exists_zero` with `n < 5`), with this route for `1 < n < 5` beside the present one; state 4.2 and `polytrope_mass_radius` for `0 < n < 5`; and replace the sentence of the scope section and the Check of 3.1 that says the zero of index `3` is not proved. The Summary's "For `0 ≤ n < 3` the solution has a zero" and the description of the pull request change with it.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Nonlinearity (design) | `(−1)^(4/3)` unclamped; `n = 0` | `exp(0)·cos(4π/3) = −1/2`; clamped `0`; `x^0 = 1` incl. `x = 0` | Checks true |
| `n = 0` alternative convention | continuation past `√6` | `2√6(1/ξ − 1/√6)`; `θ''` jumps `−1/3 → 2/3` | Check true |
| 1.1 solution predicate | `cos ξ/ξ`; `X ≤ 0` | solves on `(0, π/2)`, unbounded at `0`; `Ico 0 X` empty, only `θ 0 = 1` left | excluded as claimed |
| 1.2 integral form | `n = 1`, `sin ξ/ξ`; `ξ = 0`; `X ≤ 0` | right side `= 1 − (1 − cos ξ) + (sin ξ − ξ cos ξ)/ξ = sin ξ/ξ`; at `0` gives `θ 0 = 1`; right side vacuous | both directions rederived |
| 1.3 existence, uniqueness | `0 < n < 1` at the zero; `n = 1` past `π` | after zero `θ' < 0` so `N = 0`, `θ = μ(ξ₁)(1/ξ − 1/ξ₁)`; `μ(π) = π`, `θ'' = 2/π²` both sides | sound without Lipschitz at `0` |
| 1.4 monotonicity | `n = 0` | `θ' = −ξ/3 < 0` | sound |
| 2.1 index 0 | `ξ = √6` | `∫₀^ξ s(1 − s/ξ) ds = ξ²/6`; `μ(√6) = 2√6`; `θ' = −√6/3` | sound |
| 2.2 index 1 | junction at `π` | values `0, 0`; slopes `−1/π, −1/π`; second derivatives `2/π², 2/π²` | sound |
| 2.3 index 5 | equation; `ξ = √3`; limit | `θ'' + 2θ'/ξ = −u^(−5/2) = −θ⁵`; `θ = 1/√2`, `μ = √3/2^(3/2)`; `μ → 3^(3/2)/3 = √3` | sound |
| 3.1 zero for `n < 3` | `n = 3` in the last inequality of Lemma 3.1 | right side `(1/(2c))(1 − y²/y*²) + C₂y² → 1/(2c)`; exponent test `2/(n−1) > 1 ⇔ n < 3` | sound; range too narrow (R01) |
| 3.2 virial identity | `n = 0`; `n = 1` | `W = 12√6/5`, `5W = 12√6 = 3·24/√6`; `W = π/2 + π/4`, `4W = 3π = 3π²/π` | sound |
| 3.3 no zero, `n ≥ 5` | `n = 5` | `(5 − n)W = 0` against `3ω²/ξ₁ > 0` | sound |
| 4.1 polytrope iff | `ρ(0) = 0`, `n ≠ 1` and `n = 1`; `K = 0`; `G < 0`; `n = 0`; signed `sin` density | scale `0` (resp. `√(K/(2πG))`), right side `ρ = 0` both; scale `0`, constant density passes right side, fails left; `ρ^(2:ℝ) = ρ²` for `ρ < 0`, linear equation holds with `α² = K/(2πG)` | all six Checks true |
| 4.2 mass–radius | `n = 1` | exponents `(3−n)/n`, `(n−3)/n`, `(1−n)/n`, `(4π)^(1/n)` recomputed; `C = 2π/π² = 2/π = 0.63662` | sound; range (R01) |
| 4.3 virial | uniform ball; discontinuous `p`; `R = 0` | `E = −(16/15)π²Gρ₀²R⁵ = −3GM²/(5R)`; `12π∫r²p` same value; `4πR³ ≠ 0`; `0 = 0` | sound |
| 4.4 Betti–Ritter | `n = 1`, `α = 1`; `R > πα` | `M = 4π²`, `E = −16π²G·3π/4 = −12π³G = −3GM²/(4R)`; left fixed, right shrinks | sound |
| 5.1 TOV predicate | constant `ρ₀` | `2m/r = 8πρ₀r²/3` | sound |
| 5.2 Buchdahl | `M ≤ 0`; identity `(S/r)ζ' = Y`; final step | `9M ≤ 0 < 4R`; `∫₀^R r(1 − 2Mr²/R³)^(−1/2) = (R³/2M)(1 − S(R))`; `2S > 1 − S ⇔ 2M/R < 8/9` | sound without `ρ ≥ 0`, `p ≥ 0` |
| 5.3 constant density | TOV by differentiation; `β = 3/4` | both sides `−2ρ₀kbr/(a(3b − a)²)`, `k = 2M/R³`; central pressure `ρ₀(1/2)/(1/2) = ρ₀` | sound |
| Ramming–Rein change of variables | `ξ = √(4π) r` | `dθ/dξ = −ξ⁻²∫₀^ξ t² g` | agrees with (2.5)–(2.6), `l = 0` |

- Source locators checked against the text: 7 (RR lines 325–330, 331–345, 444–483, 522–533, 534–595, 714–730; AN lines 66–73 and 269–280); 16 locators into PO and HR not checked.
- Library declarations opened at the pin: 18, all present in the files the README names (for example `Mathlib/Analysis/ODE/ExistUnique.lean:57` and `:194`, `Mathlib/Analysis/SpecialFunctions/Pow/Real.lean:94`, `Mathlib/Topology/MetricSpace/Contracting.lean:172`, `Mathlib/Analysis/Complex/Exponential.lean:280`).
- Cross-roadmap citations resolved: 1 (PDE §3.4 on main, the Newtonian potential theorem for `C_c^∞` densities).
- Automatic checks: all passed; the dependency check reports `depcheck: 170 roadmaps, 1983 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (15 theorems); every binder is in its own signature, there is no `variable` line, and the 25 elaborated types agree with the README statements.
- One-tactic probe (`rfl`, `simp`, `simp` with all ten definitions unfolded, `positivity`, `nlinarith`, `aesop`): closes none of the 15 theorems.
- Headline theorems of the README (regular solution, three explicit solutions, zero and virial identity, positivity, polytrope reduction, mass–radius, virial, Betti–Ritter, Buchdahl and its sharpness): all stated in `Suggested.lean`; none is named as not statable.
- Duplication: no Lane–Emden, polytrope, hydrostatic or Tolman–Oppenheimer–Volkoff object in the pinned Mathlib or Tau Ceti, on main or in an open roadmap. Ownership against the open pull requests was checked by object search.

Overlap check: read NBodyProblemAndCentralConfigurations (its virial theorem is a time average for point masses, a different object), PDE (owns the Newtonian potential, cited and not used) and CompressibleEulerEquations (polytropic law as an equation of state for the flow); nothing shared.

Source independence: 8 passages compared with 2 sources (RR, AN), none shared beyond formulas; largest share PO, about 14 of 24 locators; contents of PO not readable, and by the README's own locators Layers 2 and 4 both draw on its §4.1 and 4.3 on its §2.3, Layers 1, 3 and 5 on other sources: independent as far as that shows.

Research link: The finite-radius lemma is Ramming and Rein (2012) on compact support of self-gravitating equilibria, and Buchdahl's inequality is the starting point of Andréasson (2007) on sharp bounds for `2m/r`; this rests on the README's references and on those two texts.

## Not verifiable

- PO (Pols, *Stellar Structure and Evolution*, 2011): the sources service refused the author's page because the address does not contain the author's name; §2.3, §4.1, Table 4.1, §4.1.1 and eqs. (4.8)–(4.10), (4.11)–(4.15), (4.19) were not read. This covers the sampled targets 2.2, 2.3, 4.1–4.3 in part; their mathematics was recomputed.
- HR (Reall, *Black Holes*, 2024): the same refusal; §1.5, §1.7 and eqs. (1.10)–(1.12), (1.20) were not read. This covers the sampled targets 5.1–5.3; their mathematics was recomputed.

## Source issues

- none

## For the human reviewers

- **Not tested.** PO has the largest share of the locators (about 14 of 24) and its text and table of contents could not be read: wording and arrangement were not compared with it.
- **Licence.** PO and HR are lecture notes on personal directories of their authors' institutions (`~onnop` at Radboud, `hsr1000` at DAMTP); the service could not classify either as an author page.
- **Scope.** PO and HR are unpublished lecture notes; RR and AN are cited as arXiv preprints (arXiv:1203.2590v1, arXiv:gr-qc/0702137v2). The README cites no journal article or published book.
