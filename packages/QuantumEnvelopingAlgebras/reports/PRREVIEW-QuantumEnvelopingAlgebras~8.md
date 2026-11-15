# Review of QuantumEnvelopingAlgebras (pull request #2363 at c1f4398)

**Verdict:** needs changes

## R01 (P3) — The section `QuantumPlaneLattice` still stands in for the Layer 8 module comparisons and contains two padding theorems

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/Suggested.lean:579–684` and the docstring paragraph at `:25–28` ("the full comparisons as modules over the specialized integral algebra remain README targets").

**Claim:** Re-raised: F01 (R01 of the review at ccc89ca). The docstrings and the process paragraph are repaired; the rest stands. The reason given, that the section is on the base, does not answer it: the form rules hold for the file at this head. The seven matrix theorems encode in coordinates the comparisons that `:50–51` lists as not statable; 16 of the section's names occur nowhere in `README.md`; `gaussian_at_one` restates an API bullet of 0.3 and `gaussian_first_root` is `quantumLucas` at `m = l`.

**Witness:** `grep -c` in `README.md` gives 0 for `monomialE`, `weylE`, `dualE`, `hopfDualComparison`, `specializedComparison`, `comparison_intertwines`, `gaussian_at_one`, `gaussian_first_root`. `quantumLucas`, `l = m = 3`: `r = 1` gives `[0 choose 1] = 0`, `r = 3` gives `ζ¹⁸·1·1 = 1`.

**Repair:** Delete `Suggested.lean:579–684` and the docstring lines `:25–28`; the README keeps 8.1–8.2 as targets and Checks. A scratch copy without these lines elaborates with 16 `sorry` warnings and nothing else. The author asks for a human decision on this point; it is also listed in the last section.

## Previous findings

- R01 — partly repaired: every declaration of `Suggested.lean:579–684` now has a docstring and `:583–587` gives the basis conventions; the section, its seven theorems and the 16 names absent from the README remain (R01 here).
- R02 — repaired: `README.md:559` "*Needs:* 1.0–1.3."; the category `O`, Casimir and character formula are `### 2.3` (`:786–823`) with "*Needs:* 1.3a–1.4, 2.1; KacMoody §§1.4, 2.1, 4.1 and 4.3–4.4"; `:31`, `:68`, `:172`, `:694`, `:833` follow.
- R03 — repaired: `:397–399` and `:453–455` carry the HeckenbergerDoubles2010 locators; "§14.2" is gone from the References; `:1432` and `:1488` read "Proposition 3.3, p. 23".

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.0 skew derivatives, locators | HeckenbergerDoubles2010 lines 1054–1061, 1081–1084, 1178–1179; `x = θ²` | (4.35) `∂(Eⱼ) = δᵢⱼ`; (4.36) two skew Leibniz rules; (4.39) `∂ᴷᵢ∂ᴸⱼ = ∂ᴸⱼ∂ᴷᵢ`; both derivatives of `θ²` are `(1 + qᵢ²)θ` | holds |
| 1.1 commutator formula, locator | `x = θⱼ`; source lines 1056, 984–986 | `[Eᵢ, Fⱼ] = δᵢⱼ(Kᵢ − Kᵢ⁻¹)/(qᵢ − qᵢ⁻¹)`, the mixed relation; source `[E, Fᵢ] = ∂ᴷ(E)Kᵢ − Lᵢ∂ᴸ(E)`, `Lᵢ ↦ Kᵢ⁻¹`; 4.9(6) swaps `E, F` and `K, L` | holds |
| 1.3a *Needs* 1.0–1.3 | the proof at `:562–603` read for uses of 1.4, 2.x, KacMoody | none: string equations, `S_H²`, PID `R`, Gram ranks only; the character formula no longer precedes it | holds |
| 2.1 simple-root factorizations | `A₂`, degree `α₁ + α₂`, `i = 1`; Tanisaki2016 lines 308–330, 420–452 | `dim U⁺ = 2`; `T₁⁻¹(E₂) = E₂E₁ − q⁻¹E₁E₂ ∈ U⁺`, `T₁⁻¹(E₁) = −K₁⁻¹F₁ ∉ U⁺`; bases `{T₁(E₂), E₂E₁}` and `{T₁(E₂), E₁E₂}`: `1 + 1 = 2` on both sides | holds |
| 2.3 Casimir and character formula | `A₁`, `X = ℤω`; `λ = 0`; Tanisaki2016 lines 525, 695, 712, 749 | `f_C(n) − f_C(n−2) = ((n+1)² − (n−1)²)/2 = 2n`; `f_C(−(n+2)) = f_C(n)`; `1 = (1 − e(−α))·Σ e(−mα)` | holds |
| 8.2 locator | AndersenPoloWen1991 lines 991, 1005–1013 | running head of the page gives printed p. 23; the proposition identifies `H⁰(λ)` with the dual of `D′(−λ)` | holds |
| 8.2 matrices of `Suggested.lean` (R01) | `n = 1, 2`; `ell = 3` | `C₂·weylE = monomialE·C₂`: entries `[2], [2]` both sides; `n = 1`: `H = [[0, −v], [1, 0]]`, `H·diag(v, v⁻¹) = diag(v⁻¹, v)·H = [[0, −1], [v, 0]]`; `ζ⁻² + 1 + ζ² = 0` | true; form R01 |

The rows for the untouched statements stand as in the previous review, of `ccc89ca`.

- Source locators checked against the text: 11 in 3 sources (HeckenbergerDoubles2010 lines 960–986, 1054–1061, 1081–1084, 1178–1179; Tanisaki2016 lines 264–272, 308–330, 420–452, 525, 695, 712–749; AndersenPoloWen1991 lines 991–1013). Sampled targets touched by the change (1.0, 1.1, 1.3a, 2.1, 2.3, 8.2) checked there; the other sampled targets are untouched.
- Cross-roadmap citations resolved on main (1a19c9f): KacMoody §§1.4, 2.1, 4.1, 4.3, 4.4 (`KacMoody/README.md:408, 484, 710, 761, 777`).
- Gate at c1f4398: every check 0, `OK`. Changes outside the folder: none. Dependency check: `depcheck: 245 roadmaps, 2234 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean` at the pins: 23 `declaration uses sorry` warnings and nothing else. The diff changes docstrings only, so the elaborated signatures are those of the previous review. One-tactic probe (`simp`, `rfl`, `simp` with the definitions, `decide`, `exact?`) on the seven theorems of R01: none closes.
- Pull-request text against the head: §2.3 and its *Needs*, the prerequisites of §1.3a, the factorizations of §2.1, the locators of the last bullet, 23 theorems, 70 and 18 declarations agree with the head.
- Overlap check: read KacMoody, QuantumGroups, HopfologicalAlgebra, ReductiveGroups, SpringerResolutionAndCharacteristicCycles; the bicharacter-braided ambient: owner HopfologicalAlgebra, cited; `U_q(sl₂)`: owner QuantumGroups, cited; the quantum Casimir: owned here (§2.3), see the last section; nothing else shared.
- Source independence: changed passages only; 5 passages compared with 3 sources, none shared beyond formulas; largest share McGerty2006, as in the previous review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Lusztig1993 (uncertified): Chapters 5, 37–38 for 2.3 and Theorem 33.1.3 for 1.3a are cited by locator only.
- Ownership against open pull requests was checked through the overlap lists only.

## Source issues

- none

## For the human reviewers

- **Form.** The author keeps `Suggested.lean:579–684` (on main before this pull request) and asks that R01's deletion be decided by a human; the description says so under "`Suggested.lean`".
- **Ownership.** Main's `TauCetiRoadmap/KacMoody/README.md:52–54` names KacMoody, Part II as the home of "the quantum Casimir"; `README.md:30–31` here owns it (§2.3). The description says so and leaves that line to a separate change.
- **Pin.** As reported at ccc89ca, the generated `STATUS.md` lists `TauCeti.CartanDatum`, `signedLaurentQuantumBinomial` and `quantumFactorial` in Tau Ceti; the pin has none, so the Layer 0 definitions of `Suggested.lean` duplicate nothing today.
