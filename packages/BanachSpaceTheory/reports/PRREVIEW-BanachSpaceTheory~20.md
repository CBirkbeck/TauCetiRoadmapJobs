# Review of BanachSpaceTheory (pull request #1854 at 9288dee)

**Verdict:** accepted

**Summary.** An incremental re-review of the 12 lines changed since `2f1f33b`, together with a reading of the pull request's title and description against this head. The five small corrections of the previous review are all repaired, the repairs introduce no new problem, and the title and description agree with the head. Accepted, with no finding, no small correction and no format note. One point is left for the human reviewers: the most-cited textbook could not be read.

## Previous findings

The previous review had no finding; its five small corrections are accounted for here.

- C01 — repaired: the Check of §7.1 reads "For reflexive `E` the supremum over the unit ball of `L(E)` is the supremum over the unit ball of `L(E, E**)`, since `J_E` is onto" (`README.md:1924–1925`); Examples names `c₀` with §4.2's metric approximation property (`:2071–2072`).
- C02 — repaired: the build guide adds "B4.0 also uses the signed Riesz–Markov–Kakutani representation of §5.4 and the local reflexivity of §7.1, both realised in Tau Ceti and neither depending on B4; the trace duality of §7.1 in turn uses B4.0" (`:62–64`).
- C03 — repaired: the description states that pull request #3027 conflicts with this head, that this pull request merges first, and that #3027 then carries B7.HermitianNorms into B7 after §7.2 with its clause and references.
- C04 — repaired: the description's list of statements that differ from main now has the lines for §1.1 (any subspace), §2.3 and §2.1 (no completeness), §6.2 (`π₁(T) ≤ 16 ‖T‖`, inner product space) and §7.1 (Banach–Mazur distance for all spaces of equal dimension).
- C05 — repaired: `dvoretzky` reads `(hE : ¬ FiniteDimensional ℝ E) (n : ℕ) (ε : ℝ) (hε : 0 < ε)` (`Suggested.lean:288–289`), as `dvoretzky_finite` and §7.3 do; the description records the change.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| `dvoretzky` (§7.3), without `ε < 1` | `ε ≥ 1` with `T = 0`; `ε < 1` with `T = 0`, `n = 1`; `n = 0`; `#check @dvoretzky` | `(1 − ε)‖x‖ ≤ 0 ≤ (1 + ε)‖x‖` true; at `ε = 1/2`, `‖x‖ = 1`: `1/2 ≤ 0` false, so not trivial; `n = 0` trivial; binders `[CompleteSpace E]`, `0 < ε` only | holds; agrees with README `:2004–2009` and `dvoretzky_finite` | none |
| §7.1 Check, reflexive `E` | `E = 𝕜`; `T ∈ L(E, E**)`, `S = J_E⁻¹ ∘ T` | `‖S‖ = ‖T‖` since `J_E` is an isometry onto; both suprema `|u|` at `E = 𝕜` | holds | none |
| B7 Examples, `c₀` for trace duality | `u = e₁* ⊗ e₁`, `S` the first coordinate projection; pin `ApproximationProperty/SequenceSpace.lean:43` | `‖u‖π = 1`, `⟨u, S⟩ = 1`, `‖S‖ = 1`, finite rank; `1 ∈ ℓ∞ = c₀**` not in `J(c₀)`; MAP of `C₀(ι, 𝕜)` pinned | holds | none |
| Build guide, B4.0 uses §5.4 and §7.1 | imports of pinned `Dual/LocalReflexivity.lean:8–15` and `RieszMarkovKakutani/Signed.lean:8–9` | neither imports tensor products, approximation properties or nuclear operators; B4.0 *Needs:* (`:927–930`) and §7.1 *Needs:* (`:1934–1935`) name the same edges | holds; no cycle between items | none |
| §7.1 trace duality under MAP (cited by the changed Check and example) | daws04 lines 1717–1727 (printed pp. 43–44), `M = 1` | Theorem 2.3.14 (1)⇔(3): bound `1` iff `E ⊗̂ E′ → A(E)′` bounded below by `1`, i.e. `‖Θ_E u‖ = ‖u‖π` | holds; locator matches | none |

The rows of the previous review, of `2f1f33b`, stand for every untouched statement.

- Source locators read against the cached texts: 1 (Daws, Theorem 2.3.14, daws04 lines 1717–1727; the theorem begins on printed p. 43 and continues on p. 44).
- Library declarations opened at the pin: 4 in Tau Ceti (`TauCeti.hasMetricApproximationProperty_zeroAtInfty`, `Analysis/Normed/Module/ApproximationProperty/SequenceSpace.lean:43`; `LinearIsometry.exists_continuousLinearMap_of_doubleDual`, `Analysis/Normed/Module/Dual/LocalReflexivity.lean:228`; `TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart`, `MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean:262`; the imports of the last two files).
- Cross-roadmap citations: the diff adds none; the citation resolver reports none unresolved on main or at the open heads.
- Description against the head: 41 *In Tau Ceti:* lines naming 188 declarations (counted); 24 theorems and the two definitions `rademacherSecondMoment`, `HasCotype` in `Suggested.lean` (counted); 17 declarations dropped, 10 added, `james`, `kadec_snobar`, `dvoretzky` restated; main's `dvoretzky` had `hε' : ε < 1` (`Suggested.lean:335` on main), as the description says; layers B1–B7 and the five lettered targets kept; the supplier PseudodifferentialOperators Layer 5 added and SelfAdjointSpectralTheory dropped, both stated. The title names the three folders and the two loops. No sentence contradicted.
- Automatic checks: every check passes at this head. Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`, no UPWARD or CYCLE line. No change outside the pull request's own folders.
- Lean: `lake env lean` on `Suggested.lean` gives 24 `declaration uses sorry` warnings and nothing else; single `import Mathlib` plus six `TauCeti.*` modules, no `set_option`, no sorry'd data. One-tactic probe on a copy: `dvoretzky` is not closed by `simp`, `rfl`, `infer_instance` or the zero map (the goal `(1 − ε)‖x‖ ≤ 0` remains).
- Overlap check: read BochnerSpaces, VonNeumannAlgebras, SchattenClassesAndSchurMultipliers (open), SNumbers, VariationalMethods, BanachAlgebras (main), as in the previous review; the reflexive-target density theorem of B4.0 is shared with BochnerSpaces §7 and SchattenClassesAndSchurMultipliers, both of which cite BanachSpaceTheory B4.0 as owner; nothing else shared. Pull request #3027 changes this README and the description now states the order.

Source independence: changed passages only; 3 passages compared with 1 source (daws04), none shared; largest share albiackalton06, about 12 of 80 locator-bearing lines, text not readable; contents not compared: the diff adds, removes and reorders no layer.

Research link: B4.0 and B4.1 state Enflo (1973) and Argyros–Haydon (2009, scalar-plus-compact); B6 is Grothendieck's theorem as surveyed by Pisier (2011); B7 is the local theory of John and Dvoretzky. SNumbers, BanachAlgebras A8 and SelfAdjointSpectralTheory consume them. Rests on the README's sources and its downstream-consumers section.

## Not verifiable

- `megginson98` (§§1.2, 2.1–2.5, 3.2, 4.2): uncertified, no text in the cache; cited by theorem number only.
- `albiackalton06` (§§3.5, 5.7, 6.1, 6.2, 7.1–7.3, including 12.3.13 and 13.3.2–13.3.7 for `dvoretzky`): uncertified, no text in the cache.
- `conway90`, `ryan02`, `hewittross63`, `garlinggordon71` and Pietsch 1.7.17, `enflo73`: uncertified or without a readable copy; untouched by this change.

## Source issues

- none

## For the human reviewers

- Not tested: Albiac–Kalton, *Topics in Banach Space Theory* has the largest share of the README's locators (about 12 of 80 lines) and is recorded as uncertified with no readable text; wording and arrangement were not compared with it.
