# Review of SpectralSequencesAndConvergence (pull request #2302 at b60fcaf)

**Verdict:** accepted

No findings. Incremental re-review of the 74 lines changed since `00c2247` (README Scope and 5.4, `Suggested.lean` module docstring and `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow`), and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: `Suggested.lean:286–289` now reads `(hFa : ∀ m : ℤ, n ≤ m → m ≤ n + 1 → ∀ i : ℤ, i ≤ a → IsZero ((F i : CochainComplex C ℤ).homology m))`, likewise `hGa`; README 5.4, its Checks and the Scope sentence follow.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.4 comparison, `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow` | R01's witness `K = L = (ℤ →(id) ℤ)` in degrees `n, n+1`, `F_i = K`; `ℤ → ℤ_ℓ`, `ℓ`-adic; stupid filtration of `ℤ →(×2) ℤ`, `a = −2` | `H^n(F_i) = H^{n+1}(F_i) = 0`, hypotheses hold, `H^n(K) = 0 = H^n(L)`; `H^0(F_i) = ℓ^{−i}ℤ ≠ 0`, `hFa` fails, `ℤ → ℤ_ℓ` not iso; `F_i = 0` for `i ≤ −2` | holds; binders equal the pin's `hFa`, `hGa` | none |
| 5.4 classical convergence, cohomological hypothesis at the bounded end | `x ∈ F^p K^n` with `dx ∈ F^{p+r} K^{n+1}`, `p + r ≥ p₀`; `ℓ`-adic `ℤ`; termwise bounded below | `dx = dy`, `y ∈ F^{p+r} K^n`, so `x − y` a cycle and `Z_r = Zᵗ`; `F^p H^n = im H^n(F^p K) = 0` for `p ≥ p₀`; `H^0(F^s K) = ℓ^s ℤ ≠ 0`; `F^s K^n = F^s K^{n+1} = 0 ⇒ H^n = H^{n+1} = 0` | holds | none |
| 5.4 weak convergence with the new hypothesis | `E_∞ = Zᵗ/Bᵗ` against `gr^p H^n` | both equal `Z(F^p K^n) / (Z(F^{p+1} K^n) + B(K)^n ∩ F^p K^n)`; no termwise vanishing used | holds | none |
| Scope sentence "its hypothesis at the bounded end is Tau Ceti's" | pin against the Lean | pin `hFa`: `∀ m, n ≤ m → m ≤ n + 1 → ∀ i, i ≤ a → IsZero ((F i).homology m)`; same in the Lean | holds | none |

The rows for the untouched statements stand as in the previous review, of `00c2247`.

- Source locators checked against the text: 2, both in a changed passage (stacks-012K line 3202–3210, Lemma 24.13, hypotheses on `H^n(F^p K)` at both ends; stacks-012K line 3219–3227, proof of Lemma 24.13, the cycle equality from exactness of `F^{p+r} K` in degree `n + 1`); both match. The seeded sample's targets lie outside the changed passages.
- Library declarations opened at the pin: Tau Ceti `Algebra/Homology/SpectralSequence/Filtered/Exhaustive.lean:193–230` (`CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`).
- Text that cites the changed passages (README Summary, Scope lines 66–77, 3.5's instance bullet, 5.3, the 5.4 module bullet for DGFloer Layer 1 item 3, the module docstring's not-statable entry for 5.4): consistent with the new hypothesis; the termwise case is stated as a special case throughout.
- Pull request text: title and description read against the head, the summary block included (three files added, 53 headings, 14 declarations, no change outside the folder; layers, hypotheses of Layer 7, owners of the module, spectrum and sheaf versions, downstream consumers, validation counts): no sentence contradicted, no change left unstated.
- Gate: every check passed. Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 10 `sorry` warnings, nothing else. One-tactic probe on the changed theorem (`simp_all`, `infer_instance`, `tauto`, `rfl`, `exact h _`, `aesop`): stays open. The elaborated type of the changed theorem agrees with README 5.4's comparison bullet.
- Overlaps: no open pull request changes this roadmap, no cited id is dropped; the change adds no object and no citation of another roadmap.

Overlap check: read SpectralSequencesAndConvergencePartII, AlgebraicTopology, DerivedModuleAlgebra, StableHomotopyKTheory (scope and ownership); the change touches no shared object, and the owners stand as in the previous review: exact couples and Boardman convergence for towers of spectra StableHomotopyKTheory §§7.22, 7.26; first-quadrant double complexes DerivedModuleAlgebra §S.1; nothing with two owners.

Source independence: changed passages only; 5 passages compared with 1 source (stacks-012K), none shared; largest share stacks-012K, 43 of 88 locators; contents not compared again (the change adds, removes and reorders no layer): independent as in the previous review.

## Not verifiable

- weibel1994 Theorems 5.2.12 and 5.5.1 (cited in the changed passages of 5.4): uncertified, cited by locator, not read.
- The other items of the previous review stand: the uncertified sources' 21 locators, boardman1999 Theorems 7.1 and 8.2, and the numbering of helle-rognes2024 against its published version.

## Source issues

- **Misprint** in stacks-012K at Lemma 24.13, proof, printed page 67 (line 3229–3232): the source says the boundary identity holds for `p − r + 1 < p₁(n − 1)` by the isomorphism on cohomology in degree `n − 1`; it should be `p − r + 1 ≤ p₁(n)` and injectivity on cohomology in degree `n`; affects the proof.

## For the human reviewers

- **Not tested.** Six cited works are uncertified (README References); the comparison theorem 3.5 and the consequences 3.6 carry locators only into weibel1994, eilenberg-moore1962 and mccleary2001.
