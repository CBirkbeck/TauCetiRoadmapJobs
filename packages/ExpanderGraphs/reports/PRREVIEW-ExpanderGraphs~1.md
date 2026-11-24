# Review of ExpanderGraphs (pull request #3069 at faf24d8)

**Verdict:** accepted

**Summary.** Accepted: no statement of the README or of `Suggested.lean` was found false, vacuous or unowned, and every supplier section it cites exists where cited. The mathematics was recomputed independently (all 26 Lean statements, the degenerate cases, and the numerical Checks), but only two of the seven books could be read legally, so most source locators are unverified. There are three small corrections (two library claims that fail at the pin, a Summary sentence the layers do not make, one rounded digit), two format notes and one question, none blocking. The humans who approve should note that the source cited most (Davidoff–Sarnak–Valette) was not read.

## C01 — Tau Ceti at the pin has neither relative property (T) of `(ℤ² ⋊ SL₂(ℤ), ℤ²)` nor a Cayley tree of a free group

An implementer of 8.2 or 4.1 who reads "formalized in Tau Ceti" will look for a declaration to import and find none, and will not know that 8.2 waits on FactorRigidity 3.2 being proved.

The claim is made three times: in Scope and ownership ("the latter is formalized in Tau Ceti", line 761; "Formalized in Tau Ceti and not restated: the Cayley tree of a free group as a Serre graph, and the relative property (T) of …", lines 803–805) and in the supplier contract for FactorRigidity (line 893). In the pinned Tau Ceti (2fd255d) no file contains `RelativePropertyT`, `HasAlmostInvariantVectors` or the phrase "property (T)" other than in bibliography lines of `TauCeti/GroupTheory/Amenable/*.lean`; `Suggested.lean` itself copies both definitions locally for that reason. `TauCeti/Combinatorics/Graph/Serre/Tree.lean` defines trees of Serre graphs (`IsTree`, line 47) but no file of the library mentions a Cayley graph, and no file that mentions `FreeGroup` also states an `IsTree` result.

The smallest change: in the three places, say that FactorRigidity 3.2 states the pair's relative property (T) as a target (it is on main, with `relativePropertyT_inl_slTwo` still `sorry`), and replace the Cayley-tree sentence by what the library has, Serre graphs and their trees, or drop it.

## C02 — The Summary says the Margulis graphs have isoperimetric constants bounded away from `0`; Layer 8.2 states a bound on the second eigenvalue of a multigraph

A reader of the Summary expects a target about `isoperimetricConstant` for the Margulis graphs and finds none: the roadmap defines the isoperimetric constant only for simple graphs (1.1), the Margulis graph is a multigraph given by its matrix (Conventions, "Multigraphs"), and no Cheeger inequality for multigraphs is stated.

In the Summary, "Groups" bullet (lines 31–33): "have isoperimetric constants bounded away from `0`, and so do the Margulis graphs on `ℤ/m × ℤ/m`". What 8.2 and `exists_pos_eigenvalues₀_margulis_le` state is that the second-largest eigenvalue of `margulisMatrix m` is at most `8 − ε`.

The smallest change: in the Summary, "…bounded away from `0`; the Margulis multigraphs on `ℤ/m × ℤ/m` have second eigenvalue at most `8 − ε` for one `ε > 0`". (Or, if the edge-expansion form is wanted, state it as a target in 8.2 with the multigraph boundary defined.)

## C03 — The largest eigenvalue of the ball of radius `80` in the `3`-regular tree is `2.8264`, not `2.8265`

In the first Check of 4.3 (line 376) the three values are given to four decimals. Recomputing the largest eigenvalue of the ball through its radial quotient (the tridiagonal matrix with off-diagonal entries `√3, √2, √2, …`) gives `2.628596`, `2.803970` and `2.826449`; the third rounds to `2.8264`. The values for `k = 4` (`3.1833`, `3.4317`, `3.4616`) are confirmed. Replace `2.8265` by `2.8264`.

## N01 — The Layer 9 section comment of `Suggested.lean` reads "spectra of binomial random graphs"; the README's Layer 9 is "spectra of random graphs"

Use one title in both.

## N02 — The Friedman bullet under "Beyond this roadmap" cites [Sp, §43.2, p. 341] for a uniformly random `k`-regular graph

At that locator Spielman describes Friedman's theorem for the sum of `d` random perfect matchings (a multigraph model), not the uniform model. Either cite Friedman alone for the uniform model or name the model the manuscript uses.

## Questions for the author

- Are "Theorem 11.7, p. 116" and "Theorem 11.15, p. 118" of [Ni] the numbers of the 2018 EMS edition? In the arXiv version (1609.08072v1), the only one that could be read, the bound `β ≥ λ₂/2` is Theorem 12.7 (p. 83) and `β ≤ √(2dλ₂)` is Theorem 12.15 (p. 85), and Theorem 11.7 is Weyl's inequality. The published book could not be opened, so its numbering was not checked.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 isoperimetric constant, `isoperimetricConstant_spec` | `K₂, K₃, K₅, C₄, C₆`, Petersen, `2K₂`, one vertex | `1, 2, 3, 1, 2/3, 1, 0`; index set empty at `n = 1` gives `0`; `K₃,₃`: `5/3` | holds; `2 ≤ n` present in Lean |
| 1.2 expander families, `secondAdjEigenvalue`, `nontrivialSpectralRadius` | `K₄, C₆, K₃,₃`, Petersen, constant family `K₄` | `θ₂ = −1, 1, 0`; radius `1, 3, 2`; constant family fails `tendsto_card` | holds |
| 1.3 weighted dictionary | `P₃` with `W = A` and with `c = (1,0,1)`; `C₆` | conductances all `1`; constant degree `2` gives `1/2 = h/2`; `C₆`: `1/3 = h/2` | holds |
| 2.1 Cheeger, `isoperimetricConstant_bounds` | `C₄, P₃, K_{1,3}, K₂`, `d = 0`, disconnected | `1 ≤ 1 ≤ √8`; `1/2 ≤ 1 ≤ 2`; `1/2 ≤ 1 ≤ √6`; `1 ≤ 1 ≤ 2`; `0 ≤ 0 ≤ 0` | holds; route `ν/d ≤ 2h/d`, `(h/d)²/2 ≤ ν/d` checked |
| 2.2 regular graphs and spectral characterization | Petersen, `C₆`, `k = 0`, cycles | `1 ≤ 1 ≤ √12`; `1/2 ≤ 2/3 ≤ 2`; `0 ≤ 0 ≤ 0`; gap `2 − 2cos(2π/n) → 0`, `h → 0` | holds, both directions |
| 2.3 diameter, `diam_le_of_le_isoperimetricConstant` | `K₂`, Petersen, `C₂₀` with `ε = 2 > h` | bounds `2`, `16.008`, `8.644 < 10 =` diameter; ball growth `(1+ε/D)^r ≤ n` rederived | holds; `ε ≤ h` needed |
| 3.1 Ramanujan families | `q = 2, 3, 4`; `q = 1`; `2K₄`; `K₅`, `C₇`, 4-cube | gap `0.1716, 0.5359, 1`; `q = 1` gives `0`; `2K₄` spectrum `3, 3, −1⁶` | holds; `q ≥ 2` and connectedness needed |
| 3.2 existence, `exists_isExpanderFamily` | `d = 3, m = 0`; `d = 2` | `K₃,₃` on `6 = 2·3·2⁰` vertices; supplier 3.3 gives `Fin (2d·2^k)`, connected, `IsRamanujan (d−1)` | holds; matches RamanujanGraphs 3.3 |
| 4.1 the tree, `regularTree_spec` | `k = 0, 1, 2, 3`; `K₄` | one vertex; `K₂`; bi-infinite path; sphere `3·2^{r−1}`; neighbours `1 + (k−1) = k`, root `k` | holds |
| 4.2 closed walks, `card_walk_regularTreeRoot` | `k = 0, 1, 2, 3, 4`, `ℓ ≤ 8` | `k=3`: `3, 15, 87, 543`; `k=4`: `4, 28, 232, 2092` (McKay's formula); `k=1`: `1,0,1,0`; `k=0`: `1,0,…` | holds |
| 4.3 spectrum of the tree | `k = 1, 2, 3, 4`; Schur weights at root | root ratio `k/√(k−1) ≤ 2√(k−1)` iff `k ≥ 2`; balls `2.6286, 2.8040, 2.8264`; `3.1833, 3.4317, 3.4616` | holds; one digit, C03 |
| 5.1 coverings | `C₆ → C₃`; `P₃ → K₂`; `K₂ ⊔ K₂ ⊔ K₁`; empty graphs | `(x−2)(x+1)²` divides `(x−2)(x−1)²(x+1)²(x+2)`; `x²−1 ∤ x³−2x`; fibres `2, 1` | holds; connected base needed |
| 5.2 switching, `twoLift_switchSigning` | `C₄`, `K₃` with one negative edge | lifts `C₈`, `C₆`; signed `K₃` spectrum `1, 1, −2`; conjugation by `diag(−1 at v)` | holds; [Sp, §44.2, p. 350] supports the two extreme signings |
| 6.1 cyclically reduced sequences | `K₄`, `m ≤ 6`; `C₄`; `K_{2,3}`; `m = 0, 1, 2` | `N = 0, 0, 24, 24, 0, 96` (from the Hashimoto eigenvalues); `8`; `24`; `m=0`: `1` versus `n` | holds; `m ≥ 1` needed |
| 6.2 primitive sequences | `K₄`, `C₄`, `K_{2,3}` | `P₆ = 96 − 24 = 72`, `6 ∣ 72`; `P₄ = 8`, `24`; `d = 1, 2` contribute `0` | holds |
| 6.3 Euler product, `trunc_iharaZeta` | `M = 0`; `C₄`; `K₄` at `u⁶` | both sides `1`; `(1−u⁴)^{−2}`; exponent `12` versus `16` with `N_d/d` | holds; `d ∣ P_d` makes `ℕ` division exact |
| 7.1 construction | `p = 5, 3`; `q = 13`; determinant | `12` and `8` quaternions; `0² + 5² + 1 = 26 ≡ 0`; `det ψ(α) = a²+c²−(b²+d²)(x²+y²) = N(α)` | holds |
| 7.2 structure, `lpsGraph_spec` | `(p,q) = (5,13), (5,11), (3,5), (3,7), (7,11)`; `(11,3), (29,5), (5,3)` | orders `2184, 660, 120, 336, 1320`; girth `8, 6, 6, 8, 6`; bounds `5.51, 2.98, 4.60, 5.82, 4.22`; images `6, 27, 6` | holds; injectivity uses `q > 2√p` as stated |
| 7.3 connectedness and expansion | `p = 5`, `ε = 0.01`, `ε = 1/6`; `(5,13)` | `5.172 < 6`; `p + 1` at `ε = 1/6`; `(5,13)` connected (component `2184`) | consistent; theorem itself rests on [DSV], not read |
| 8.1 property (T) | trivial quotient; `ℤ`; finite `Γ`; universe `{0,0}` | `h = 0` on one vertex; `h(Cₙ) → 0`; `ℓ²₀(Γ/N)` lies in `Type` | holds as stated; hypothesis weaker than all universes |
| 8.2 Margulis graphs | `m = 1, 2, 3, 4, 8, 16, 32`; torus grid | row sums `8`; second eigenvalues `3.4641, 4.4142, 5.4319, 6.9880, 7.5483, 7.7422`; grid `→ 4` | Checks confirmed; Summary wording, C02 |
| 8.3 abelian obstruction | `ℤ/10`, `ℤ/5²`, `(ℤ/2)³`, `ℤ/12` with `{±1, 6}`, `S = ∅`, `ℤ/4` with `{2}` | diameters `5, 4, 3, 3` against `2.16, 1.24, 1, 1.29`; `S = ∅`: `1 − 1 = 0 ≤ 0` | holds; connectedness needed |
| 9.1 spectrum of `G(n, p)` | `n = 2, 3, 4`; `p = 0`; Weyl split | `E tr A² = 2p, 6p, 12p`; `θ₂ ≤ −p + σλ_max(W)`, `θₙ ≥ −p + σλ_min(W)`; support `±2√(p(1−p))` | holds; hypotheses of RandomMatrices 4.5 met by a zero diagonal |
| Library claims of C01 | pinned Tau Ceti, whole tree | `RelativePropertyT`: 0 files; "Cayley": 0 files under graphs or groups | claim fails at the pin |

- Source locators checked against the text: 5 (Ni: definition of the isoperimetric constant, the two Cheeger bounds, the expander remark; Sp: §44.2, §43.2).
- Library declarations opened at the pin: `SimpleGraph.mulCayley` (`Mathlib/Combinatorics/SimpleGraph/Cayley.lean:36`), `SimpleGraph.binomialRandom` (`Mathlib/Probability/Combinatorics/BinomialRandomGraph/Defs.lean:50`), `Matrix.IsHermitian.eigenvalues₀_add_le` (`TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean:208`), `Matrix.IsHermitian.abs_spectralMeasure_Iic_sub_le_rank_div_card` (`TauCeti/Analysis/Matrix/SpectralMeasure/RankPerturbation.lean:51`), `TauCeti.Probability.semicircleReal` (`TauCeti/Probability/Distributions/Semicircle/LocationScale.lean:39`); the 29 `#check` lines of the file all elaborate.
- Cross-roadmap citations resolved: 15 supplier sections (GraphSpectra 1.2, 3.2; GraphSymmetryAndCayleyGraphs 3.1; SpectralGraphBounds 1.1; LaplacianEigenvaluesOfGraphs 1.1; KernelsAndSpectralMethods 1.1, 2.2, 3.1, 3.2; LaplacianSpectraAndSpanningTrees 6.4; IharaZetaFunction 1.2, 2.1, 5.3; MatchingPolynomial 2.1; RamanujanGraphs 3.1, 3.3, 5.1; FactorRigidity 3.1, 3.2; RandomMatrices 1.2, 4.3, 4.5; RandomGraphs 0.2); the eleven copied definitions agree with their owners' Lean text.
- Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`; no supplier's README names this roadmap.
- Elaboration of `TauCetiRoadmap/ExpanderGraphs/Suggested.lean`: 26 `sorry` warnings, no error. Every elaborated signature was compared with its README statement; the binders that definitions shed (`Fintype`, `DecidableEq`, `Fact q.Prime` on `pslInPGL`) are ones their types do not need.
- Padding probe: each of the 26 `sorry` replaced by `first | rfl | simp | infer_instance`; none closes.
- Pull request text: title and description agree with the head (26 statements, three Tau Ceti imports, the supplier list, no change outside the folder).
- Overlap check: read RamanujanGraphs, ExpanderWalksAndCodes, SpectralGraphBounds, GraphSymmetryAndCayleyGraphs, IharaZetaFunction, CoboundaryExpansion and KestenAmenabilityAndSpectralRadius; `2`-lifts, tree numbers and bipartite Ramanujan graphs: RamanujanGraphs (cited); `IsRamanujan` and `iharaZeta`: IharaZetaFunction (cited); the regular tree as a graph, the Euler product, the isoperimetric constant of finite graphs: this roadmap (each of the others excludes it in its scope).

Source independence: 7 passages compared with 2 sources (Ni, Sp), none shared; largest share DSV, 23 of 46 bracketed citations; contents of DSV not compared, since neither its text nor its contents page was read (only Layers 1–2 and 7 cite it, Layers 3–6, 8 and 9 rest on other sources).

Research link: Layer 7 states the Lubotzky–Phillips–Sarnak graphs as in Davidoff–Sarnak–Valette (2003); Layer 3 uses the bipartite Ramanujan graphs of Marcus–Spielman–Srivastava; Layer 9 is Füredi–Komlós (1981), with Vu (2007), Friedman (2008) and Bordenave (2020) named as continuations. Rests on the README's references.

## Not verifiable

- [DSV] (Definitions 0.9.9, 1.2.1, 1.2.2; Theorem 1.2.3; Corollary 1.2.4; Theorem 2.4.1; Propositions 2.5.2, 2.5.3; §2.6; §4.2–4.4): no legal copy; the publisher's page is paywalled. Sampled targets 1.1, 1.2, 2.2, 3.1, 7.1, 7.3 have their locators unverified.
- [KS] (Lemma 4.5, Proposition 4.6, Corollary 4.8, Proposition 4.25, Corollary 4.26): no legal copy found. Sampled target 2.3.
- [Lu] (Propositions 3.3.1, 3.3.5, 3.3.7, 4.5.2; Definition 4.5.6; p. 58): paywalled; a copy on a university page could not be shown to be the author's own. Sampled targets 4.3, 8.1, 8.2.
- [BH] (§4.1, §6.4): paywalled; a copy on a personal page could not be shown to be an author's own. Sampled target 4.1.
- [VM] (Theorems 50, 52; art. 190), Füredi–Komlós, Vu, Friedman, Bordenave: not read.
- [Ni] page and theorem numbers of the 2018 edition: only the arXiv version was read (see the question).
- Ownership against open pull requests was checked through the roadmap search over the open heads and main, not against every sibling checkout.

Automatic checks set aside as false positives: the heading "Library declarations consumed" at the end of `Suggested.lean` was reported as a section heading with no declaration under it; it is followed by 29 `#check` lines that pin library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: [DSV], the source with the largest share of the locators (23 of 46), could not be read, nor its contents page; wording and arrangement were not compared with it.
- Licence: [Sp] is an unpublished author's manuscript (2025) on the author's own page, cited in 5.2 and under "Beyond this roadmap".
- Licence: copies of [BH] and [Lu] exist on pages that appear to be an author's own, but the host could not be classified, so they were not read.
- Sources: five of the seven books were unread; twelve of fifteen sampled targets were checked by computation only, not against their locators.
