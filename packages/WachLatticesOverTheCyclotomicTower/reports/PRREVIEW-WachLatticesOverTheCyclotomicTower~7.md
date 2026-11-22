# Review of WachLatticesOverTheCyclotomicTower (pull request #2899 at da69b99)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/WachLatticesOverTheCyclotomicTower/`
**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: this is an incremental re-review of the paragraph added to 6.4 since `c3d9386` (the norm `ν₀` of the formal proof beside the trace `π₀`). Every identity of that paragraph was recomputed and holds, except the clause "nothing below depends on the choice": the Sen weights of 6.5 (2) and the standing hypothesis of 6.6 change sign in the coordinate `X′` (one finding, P2, repaired by rewording that clause). Three format notes, none blocking. The human reviewers decide on scope, on the licence of the formal proof (the family index now records that it was published without one), and on the new section of the family index about reviews.

## R01 (P2) — The statements below 6.4 do depend on the choice between `π₀` and `ν₀`: in the coordinate `X′` the Sen weights of 6.5 (2) are `−ū` and the hypothesis of 6.6 fails

The added paragraph of 6.4 says (line 49) "so `k[[X′]] = k[[X]]` and nothing below depends on the choice". The paragraph exists so that a reader can pass between the roadmap and [FormalProof], which works with `ν₀`; a reader who takes the clause at its word and reads 6.5 or 6.6 with `X′`, `ν₀` in place of `X`, `π₀` gets every Sen weight with the wrong sign.

The computation. Since `X′ = −X·(1 + O(X))`, the operator `X′^{−1}(γ − 1)` is `−∇` modulo `X`, so its characteristic polynomial on `N̄_i/XN̄_i` is `∏(Y + ū)`, not the `∏(Y − ū)` of 6.5 (2). Rank-one witness with `γe = e`: `(γ − 1)(X^h e) = X^h((1 − X + …)^h − 1)e = −hX^{h+1}e + …`, so `∇` has the value `−h` on `X^h e`; while `(γ − 1)(X′^h e) = X′^h((1 + X′ + …)^h − 1)e = +hX′^{h+1}e + …`, value `+h`. Integrally, `π₀/ν₀` is a unit with value `−p/p = −1` at the zeros `ζ − 1`, so `ν₀^{−1}(γ − 1) ≡ −ν` modulo `π₀ + p` and the eigenvalues of 6.5 (1) become `−c(−u)`. And the paragraph's own last sentence gives `γ(X′) ∈ X′ + X′² + X′³k[[X′]]`, which is not the hypothesis `γ(X) ∈ X − X² + X³k[[X]]` under which 6.6–6.9 are stated (line 283). What is independent of the choice is the ring `k[[X]]` with its `φ` and `γ`, its `X`-adic orders, the ideals `(π₀) = (ν₀)` and `(π₀ + p) = (ν₀ − p)` of `O_E[[π]]^{Γ_F^{tor}}`, and hence the lattices and every exponent.

The smallest change: replace "and nothing below depends on the choice" by, for instance, "and the ring, the ideals `(π₀) = (ν₀)`, `(π₀ + p) = (ν₀ − p)`, the lattices and all `X`-adic orders below are the same for both; formulas written in the coordinate change by its sign: `X′^{−1}(γ − 1) ≡ −∇` modulo `X`, so in the coordinate `X′` the Sen weights of 6.5 are `−ū`".

## N01 — Three citations name a paper or a range of sections where a numbered statement exists

Unchanged at this head. For 6.4 (8) (line 154), Wach 1996: the Théorème on p. 380 with Remark a) on p. 381. For `γ − 1` on `ψ`-zero parts and the complex in 6.7 (line 398), Herr 1998: Théorème 3.8 (1), p. 584, and Théorème 2.1, p. 572, in place of "§§2–4". Cherbonnier–Colmez 1999 (lines 398, 871) has no locator.

## N02 — The family index and the description say that the family "follows" a source

Unchanged at this head: the index (index README, line 10) and the description say "The family follows the formal Lean proof". Would "The theorems of the family are those of the formal Lean proof of …" do, with the sentence on generality kept?

## N03 — The References of this README do not name the commit that the family index now names

The index now says that the cited files are to be looked up at the first commit of the repository, under `src/` (index README, lines 12–19); the entry [FormalProof] of this README (line 873) still gives the repository alone. One clause there ("at its first commit, under `src/`; see the family index") would let a reader of this README open the paths, including the two new ones of 6.4.

## Previous findings

The previous report had no finding (R) and no small correction; its format notes and its question are accounted for here.

- N01 — not repaired: line 154 "Wach 1996 (the criterion of (8))"; line 398 "Herr 1998, §§2–4; Cherbonnier–Colmez 1999". Written again as N01.
- N02 — not repaired: index README line 10 and the description, "The family follows the formal Lean proof". Written again as N02.
- Question (which commit the paths refer to) — answered in the family index (lines 12–19: the first commit, directory `src/`), not in this README: N03.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `ν₀ − p` vanishes simply at `π = ζ − 1` | `p` odd; `p = 3`; `p = 2` (excluded by the setting) | `δ_a(π) ↦ ζ^a − 1`; `∏_{a=1}^{p−1}(ζ^a − 1) = (−1)^{p−1}Φ_p(1) = p`. `ν₀ ≡ −π^{p−1}` mod `p`: Weierstrass degree `p − 1`, `p − 1` distinct zeros, all simple. `p = 2`: product `4 ≠ 2` | holds for `p` odd | none |
| `X′ ≡ −X` mod `X²`, `k[[X′]] = k[[X]]` | leading terms in `π` | `π₀`: coefficient of `π^{p−1}` is `(p−1)/(p−1)! ≡ 1`; `ν₀`: `∏ω(a) = −1`. Both `Γ_F^{tor}`-invariant, so `X′ = −X + O(X²)` | holds | none |
| `γ_u(ν₀) = ν₀(1 + η_u(ν₀)(ν₀ − p))`, `η_u(0) ≡ c` | `u = 1 + pc`; `π = 0`; `π = ζ − 1`; `u ≢ 1` mod `p` | ratio at `π = 0`: `u^{p−1} ≡ 1 − pc` mod `p²`, so `η_u(0) = (1 − u^{p−1})/p ≡ c`. At `ζ − 1`: `∏(ζ^{ua} − 1) = p`, ratio `1`. `ν₀ − p` distinguished of degree 1 in `ν₀`: unique quotient | holds; needs `u ≡ 1` mod `p`, as stated | none |
| `γ(X′) ∈ X′ + X′² + …` is `γ(X) ∈ X − X² + …` | `χ(γ) = 1 + p` (`c = 1`); direct from `γ(π) ≡ π + π^p + π^{p+1}` | direct: `γ(X) = X + f′(π)π^p + … = X − π^{2p−2} + … = X − X²`; `γ(X′) = X′ + π^{2p−2} = X′ + X′²`. With `X′ = −X + aX²`: both sides `−X + (1 + a)X²` mod `X³` | holds | none |
| `φ` on `O_E[[ν₀]]` induces `X′ ↦ X′^p` | reduction mod `λ` | `φ(π) ≡ π^p`, `φ` is `O_E`-linear on a factor, `X′` has coefficients in `𝔽_p`: `φ(X′) = X′(π^p) = X′^p`; consistent with `φ(X) ∈ X^pk[[X]]^×` | holds | none |
| "nothing below depends on the choice" against 6.5 (2) and 6.6 | rank one, `γe = e`, lattice `X^h k[[X]]e` | `X^{−1}(γ − 1)`: `−h`; `X′^{−1}(γ − 1)`: `+h`. `π₀/ν₀ = −1` at `ζ − 1`. Hypothesis of 6.6 has `−X²`, `X′` has `+X′²` | false as written | R01 |

The rows for the untouched statements stand as in the previous review, of `c3d9386`.

- Changed passage: one paragraph of 6.4 (README lines 45–56, 13 lines); no statement, section number, supplier or Lean declaration changes. Outside the folder the family index README changed (the pull request's own): the name GRH, the commit of the formal proof, and a new section "When a roadmap is wrong".
- Source locators read this round: 0 of the 2 new file paths and 6 new declaration names into [FormalProof]; the source service refuses the repository's host (see Not verifiable). The mathematics they are cited for was recomputed independently (table). The seeded sample falls outside the changed passage except 6.4, where only this paragraph changed.
- Library declarations opened: none (the passage names no Mathlib or Tau Ceti declaration).
- Cross-roadmap citations: none added or changed; the five suppliers stand as resolved at `c3d9386`, and precede this roadmap in the candidate merge order (it is at line 444).
- Dependency check: `depcheck: 133 roadmaps, 1478 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: no message, exit 0; it declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Automatic checks: all passed in the worker's run. Run with the default order they report this roadmap as not yet listed in the merge order and the three family-index files as outside the folder; neither is a defect (the index is the pull request's own).
- Title and description against the head: they describe `X` as the reduction of the trace, which the head keeps; the added remark changes nothing they state. No sentence contradicted, no change a reader must know of left unstated.

Overlap check: read SelmerLengthBoundsAndLocalLifting, PhiGammaModulesAndIwasawaCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, LengthBoundsInPadicFamilies, CongruenceModulesOfThetaLifts (as at the previous rounds; the change touches no owned object); nothing shared. No other open pull request changes this roadmap, and none drops an id it cites.

Source independence: changed passages only: 1 passage compared with 0 sources (its only source, FormalProof, is not readable; the passage is formulas and declaration names), none shared; largest share FormalProof, 52 of 69 locators, text and layout not readable; the arrangement was not compared again (no layer added, removed or reordered).

Research link: Wach modules of crystalline representations (Wach 1996; Berger 2004) and Herr's complexes (Herr 1998); 6.10 (2) extends Berger 2004, Proposition IV.1.3. The family's other roadmaps use 6.4–6.11 towards the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026). Rests on the README and the texts read.

## Not verifiable

- [FormalProof]: the two file paths and six declaration names added in 6.4, and the fifty cited in 6.4–6.11 before; one fetch of the first new path at the commit the family index names was refused, the host being in no class the source service reads.
- That the module names differ from the file paths they are cited with (for example a declaration under `Formalism.CohomologicalDescent` in a file under `Formalism/PieriBlockIdeals/`) could not be checked for the same reason.
- Cherbonnier–Colmez 1999 and Fontaine 1990: not among the texts held; cited without locators, for standard facts.

## Source issues

- none

## For the human reviewers

- **Scope.** 6.6–6.11 (lattice families, counting theorem, position data and residual bound, carries) cite only [FormalProof], announced 20 November 2026 with no written proof ([Announcement] lines 45–49); no refereed source states them. 6.4, 6.5, 6.10 (2) have refereed sources.
- **Licence.** The family index now records (index README, lines 16–18) that the formal proof was published without a licence and is mirrored for verification only. The README cites fifty-two of its file paths and declaration names; `Suggested.lean` declares nothing.
- **Not tested.** [FormalProof] has the largest share of the locators (52 of 69); its text and file layout could not be read, so wording and arrangement were not compared with it.
- **Review policy in the family index.** The new section "When a roadmap is wrong" (index README, lines 45–75) tells reviewers of implementing contributions when not to block a departure from a roadmap. Whether an index may set this is a project decision.
