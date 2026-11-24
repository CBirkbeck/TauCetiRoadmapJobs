# Review of AlgebraicModuliForArithmeticGeometry (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** This is an incremental re-review of the 37 lines changed since `71bbefa`. Its subject is the proof route of §9.12 (Ein–Lazarsfeld global division) and the sentences that cite it. The previous finding and both small corrections are repaired.

The chase now asks for `H^{p−1}` only of the degree-`p` term. The dimension disposes of `p ≥ n + 2`, and the remaining range has exactly the bound of the statement. The iteration from `k − 1` to `k` reproduces the hypothesis `ℓ ≥ min(m + k − 1, n + k)` with `A − ℓD` unchanged. Both Tau Ceti Koszul declarations exist at the pin and say what the *Needs:* line claims.

There are no findings, no small corrections and no format notes, and nothing is left for a human to decide.

## Previous findings

- R01 — repaired: "For `p ≥ n + 2` this holds because `dim Y = n`. For `2 ≤ p ≤ min(m, n + 1)` the exponent `ℓ − p` is nonnegative because `ℓ ≥ min(m, n + 1)`" (§9.12, lines 10179–10180).
- C01 — repaired: "For `k ≥ 2`, apply the case `k = 1` to `(A, ℓ)` and then the case `k − 1` to `(A − D, ℓ − 1)`". The *Needs:* line names `TauCeti.koszulComplex` and `TauCeti.koszulComplex.smul_homology_eq_zero` (lines 10183–10192).
- C02 — repaired: "and on the vanishing theorems and multiplier ideals the Ein–Lazarsfeld global division theorem (§9.12)" (line 69).

## Verified sound

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §9.12 against its source (cited by the changed route) | ein_lazarsfeld_nullstellensatz lines 473–483 (Prop. 1.2 (ii), p. 12) | Source: `ℓ ≥ min(m+k−1, n+k)`, `A−ℓD` ample or big and nef. README: identical | Agree; none |
| Route, the degree-`p` term (`k = 1`) | `Λ^p(N^{−1})^{⊕m}` twisted by `O(K_{Y/X}−ℓF)⊗f^*O(K_X+A)` | `O(−ℓF) = N^ℓ⊗f^*L^{−ℓ}`, which gives `K_Y⊗f^*(A−ℓD)⊗N^{ℓ−p}`. Source line 434 agrees | True; none |
| Route, range of the chase | `p = j+1` against (***) at source line 449 | README: `2 ≤ p ≤ min(m, n+1)`, exponent `ℓ−p`. Source: `0 < j ≤ min(m−1, n)`, exponent `ℓ−j−1` | Same range; none |
| Route on the old R01 instance | ℙ¹, sections `x, y, x+y`, `J = O`, `ℓ = 2`, `deg A = 3`, `f = id` | Terms `O(1), O³, O(−1)³, O(−2)`. `H¹(O(−1)) = 0`. `H²(O(−2)) = 0` because `p = 3 ≥ n+2` | Covered; R01 repaired |
| Negative control: `ℓ` below the bound | ℙ¹, sections `x, y`, `ℓ = 1 < 2`, `deg A = 2` | `H⁰(O(−1))² = 0 → H⁰(O) = ℂ` is not onto. The route's `p = 2` term is `O(−2)`, with `h¹ = 1` | Bound needed; none |
| Iteration, `k ≥ 2` | `(A, ℓ)`, then `(A−D, ℓ−1)` at `k−1` | `ℓ−1 ≥ min(m+k−2, n+k−1)` iff `ℓ ≥ min(m+k−1, n+k)`. `(A−D)−(ℓ−1)D = A−ℓD`. `ℓ ≥ k` since `m ≥ 1` | Same hypotheses; none |
| Iteration on ℙ¹ | `x, y`, `k = 2`, `ℓ = 3`, `deg A = 4`, `J = O` | `H⁰(O(1))² → H⁰(O(2))` onto; `H⁰(O)² → H⁰(O(1))` onto; `x², xy, y²` span `H⁰(O(2))` | True; none |
| The Koszul *Needs:* parenthetical | `TauCeti/RingTheory/KoszulComplex/Basic.lean:219`, `:346` at the pin | `koszulComplex (φ : Module.Dual R M)`; `φ m • z = 0`. On `Y∖D′_j`, `φ` takes the value 1, so homology vanishes | Exists; claim true |
| Guide sentence, line 69 | §9.12 *Needs:* (line 10189) and Dependencies (line 10225) | Uses `algebraicAdjointVanishing`, `algebraicMultiplierIdeal` (§9.10) and §9.4; not §9.11 | True; C02 repaired |
| §9.10 adjoint vanishing as §9.12 uses it (sample) | EV92 Cor. 5.12 (c), lines 1896–1900, printed p. 49 | `N=1`, `D=0`: `M` nef with `M^n > 0` gives `H^b(M^{−1}) = 0` for `b < n`; Serre duality gives `H^q(K_Y⊗M) = 0` for `q > 0` | Supports; none |
| §9.10 multiplier-ideal vanishing (sample) | demailly_very_ample (1.2) line 173, (1.4) line 184, §2 line 225 | Nadel vanishing and algebraic weights on p. 4; on p. 5, only the algebraic case is needed | Locator holds; none |

The rows of the previous review for untouched statements stand as in the previous review, of `71bbefa`. These are the `m = 1` case, Checks 1–3, `I_ℓ` against §9.10, family 9.13a and the docstring.

- **Seeded sample.** §9.10 is the only sampled target that the changed text cites, and it is checked above. The other fourteen sampled targets lie in text the change neither alters nor cites: Layers 1, 2, 4, 5 and 7, and §§9.2, 9.3 and 9.5. They were not re-checked.
- **Source locators checked against the text.**
  - ein_lazarsfeld_nullstellensatz lines 404–452 (proof of Prop. 1.1 (ii), pp. 10–11) and 461–494 (Prop. 1.2 and sketch, pp. 11–12).
  - EV92 lines 1699–1712, 1763–1774 and 1877–1907 (Cors. 5.2, 5.6, 5.12 and Claim 5.13, printed pp. 43–49).
  - demailly_very_ample lines 150–225 (pp. 3–5).
- **Library declarations opened at the pins** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): `TauCeti.koszulComplex` (`Basic.lean:219`) and `TauCeti.koszulComplex.smul_homology_eq_zero` (`Basic.lean:346`, inside `namespace koszulComplex`, lines 246–418).
- **Cross-roadmap citations.** The change adds none. The README cites AlgebraicModuliForArithmeticGeometryPartII 0 times, so supply still runs one way. The linear-functional Koszul complex is also DerivedModuleAlgebra §0.K.1 on main, and citing the Tau Ceti declaration directly duplicates nothing.
- **Record.** Since `71bbefa` only `README.md` changed (25 insertions, 12 deletions). No heading, layer, item or Lean declaration was added or removed. Against the merge base the README still has its 9 layers, with §9.12 as the only new heading.
- **Automatic checks.** The worker's run passed every check. The dependency check with `--movable` reports `depcheck: 132 roadmaps, 1467 edges, 0 problem(s)`.
- **Elaboration of `Suggested.lean`.** It produces five `sorry` warnings (lines 50, 75, 89, 121, 133) and nothing else. The file is unchanged since `71bbefa`, and the elaborated signatures show no lost binder.
- **Pull request text.** Its sentences about this folder hold at this head:
  - only the module docstring of `Suggested.lean` changes;
  - §9.12 needs nothing of Part II, and the first part cites Part II nowhere;
  - the additions mention neither the family nor the formal proof.

  The Koszul declarations come from Tau Ceti, already a supplier, so no supplier is added that the text leaves unstated.

Overlap check: read FunctionFieldArithmeticPartII, SchemeAndStackFoundations (main and both open heads), FunctorOfPoints, ResolutionOfSingularitiesCharacteristicZero (main and open head) and StableReductionPartII. The change adds no owned object, since the Koszul complex is Tau Ceti's and is cited by declaration. The shared objects stand as in the previous review: global division belongs to this roadmap (§9.12), and principalization belongs to ResolutionOfSingularitiesCharacteristicZero, consumed through §9.4.

Source independence: changed passages only. Three passages were compared with two texts:
- the `k = 1` chase, against ein_lazarsfeld_nullstellensatz lines 404–452;
- the `k ≥ 2` iteration, against lines 484–494 (the source uses a Schur complex there instead);
- the Koszul parenthetical, against the Tau Ceti docstring at `Basic.lean:343–345`.

The longest shared run is about six words ("f^*(A − ℓD) is … nef"), which the mathematics forces. Of the source locators that these passages rest on, Ein–Lazarsfeld 1999 has the largest share, 2 of 2: Propositions 1.1 (ii) and 1.2 (ii). The arrangement was not compared, since no layer is added, removed or reordered.

Research link: §9.12 is Ein–Lazarsfeld's global division theorem (1999, Proposition 1.2), the algebraic Skoda theorem behind their geometric effective Nullstellensatz. MultiplierIdealsOfPairsAndPointSeparation deduces its 9.13a division by sections with simple common zeros from it. This rests on the README and the sources read.

## Not verifiable

- Lazarsfeld 2004, *Positivity in Algebraic Geometry II*, §9.6 (the secondary locator of §9.12): a Springer book behind a paywall, recorded as uncertified.
- The numbering of the published Inventiones version of Ein–Lazarsfeld 1999: I read its arXiv v3, which the reference line names.

Automatic checks set aside as false positives: run on its own, without the list of this pull request's folders, the check for changes outside the folder lists 114 files. All of them belong to the other roadmap folders that this pull request changes and that the review brief names as its own. The worker's run, which knows those folders, passed.

## Source issues

- **Misprint** in demailly_very_ample at Remark (1.6), p. 5: the source says the remark concerns Corollary (1.6), twice; it should be Corollary (1.5), the jet-generation corollary just above; affects nothing.
- **Misprint** in demailly_very_ample at §1, after formula (1.4), p. 4: the source gives the Lelong number of the weight (1.4) as `1/m` times the minimal vanishing order; it should be `1/µ`, the root taken in (1.3)–(1.4); affects nothing.

## For the human reviewers

- none
