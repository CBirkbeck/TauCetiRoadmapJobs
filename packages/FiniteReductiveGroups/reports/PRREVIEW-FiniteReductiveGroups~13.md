# Review of FiniteReductiveGroups (pull request #3027 at 3b77a6a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 2208 changed lines since `74a09b7`. Needs changes, for one reason: since the previous review, EtaleDualityAndPerverseSheaves §7.6 (in this pull request) has come to state and prove the finiteness of stabilisers of a diagonalisable group and the trivial action of every connected algebraic group, which 3.4 and the scope still claim as this roadmap's own and prove a second time. The folder itself is unchanged since the head the previous review accepted; every other statement I recomputed holds, and the sampled locators I could read are right. There is one small correction and no format note; the two points for the human reviewers stand.

## R01 (P2) — 3.4 and the scope claim as this roadmap's own two statements that EtaleDualityAndPerverseSheaves §7.6 now states and proves, and misdescribe that section

An implementer finds the finiteness of stabilisers and the action of connected groups planned twice, with two routes and two owners, and 3.4 tells them that §7.6 has less than it has.

In 3.4 the Origin (lines 1223–1225) reads "(a) for a connected algebraic group that need not be linear, by the same route, and (d) are this roadmap's own formulation". The Route (lines 1237–1239) reads "(b), (c), and (a) for a connected linear algebraic group, are EtaleDualityAndPerverseSheaves §7.6 (*lefschetzGroupActions*), which cites the published proof of (b); (a) is proved here for every connected algebraic group". The scope (lines 2770–2772) lists under "owns" "the triviality of the action of a connected algebraic group on cohomology, the route of the torus fixed-point formula and the finiteness of the stabilisers of a diagonalisable group (3.4)".

At this head, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` §7.6 says otherwise:

- Lines 7522–7529 state *finitelyManyStabilizers*: for a diagonalisable group over any field acting on a separated scheme of finite type, the stabilisers are finitely many. A full proof by generic flatness follows. This contains 3.4 (d).
- Line 7563 states *lefschetzGroupActions* (a) for "a connected algebraic group `G`", not a linear one.
- Lines 7582–7594 prove (b) in the section, through *finitelyManyStabilizers*, and lines 7605–7606 call (b) "this roadmap's own formulation, proved by the route above". No published proof of (b) is cited.

The smallest change is in 3.4 and the scope:

- In the Origin, drop the clause that makes the general (a) and (d) this roadmap's own.
- In the Route, say that (a)–(c) are §7.6 *lefschetzGroupActions*, with (a) there for every connected algebraic group, and that (d) is §7.6 *finitelyManyStabilizers*. The routes written here may stay as second routes or shrink to the citation.
- Add *finitelyManyStabilizers* to the *Needs:* line and to the §7.6 row of the supplier table.
- In the scope, move the three items of 3.4 from "owns" to the list of restated statements, so that "3.4 (b), (c)" there becomes "3.4".

## C01 — The Origin of 3.4 gives Dudas–Michel, Propositions 13.7–13.9, for (a)–(c), and those propositions do not contain (b)

A reader who looks up the torus formula `L(g, X) = L(g, X^S)` at that locator does not find it. In the lectures (the copy on J. Michel's page), Proposition 13.7 is the cohomology of affine space, 13.8 the fibration in affine spaces (3.4 (c)) and 13.9 the trivial action of a connected linear group (3.4 (a)): DudasMichel2015 lines 2648, 2664, 2678. Propositions 13.1–13.10 contain no fixed-point formula for a torus. I could not read Deligne–Lusztig §3, the other locator. EtaleDualityAndPerverseSheaves §7.6 gives no published source for (b). Either give the locator where (b) is stated, or say in the Origin that (b) is the formulation of §7.6, with 13.8 and 13.9 for (c) and (a).

## Questions for the author

- 4.10 and 4.11 are stated for the `q`-Frobenius of an `𝔽_q`-structure, and their Remarks say the Steinberg case has no route. Does Digne and Michel (2020) give `Q_T^G(u) = 1` at regular unipotent elements for every Steinberg endomorphism? The README cites that book for 4.3 and 4.6 in that generality. I could not read the book.

## Previous findings

The previous review, of `7c341e7`, accepted with no finding, small correction or format note; its one question is repeated above. The folder has not changed since that head. What changed is EtaleDualityAndPerverseSheaves §7.6, which 3.4 cites; R01 comes from that change.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.2 cuspidal support, series (`GL_n(𝔽_p)`) | `GL₂(𝔽₃)`; source | 3 cuspidals (orbits `{1,3},{2,6},{5,7}` of exponents mod 8) `= ½q(q−1)`; DudasMichel2015 lines 1846, 1869, 1983 | holds; locators right | none |
| 2.3 generic representations | `GL₂(𝔽_q)` | generic count `(q−1) + ½(q−1)(q−2) + ½q(q−1) = q² − q`; degrees sum to `(q−1)(q²−1)` | holds | none |
| 2.7 (a) derivatives of `Γ_n` | `n = 1`; general `n` | `Σ_{j≤n} a_j = q^n − 1`, so `a_n = q^n − q^{n−1}`; `n = 1`: `Γ₁^{(1)} = (q−1)·Γ₀`, dimension `q − 1` | holds | none |
| 2.7 (b), (c) Bessel-type decomposition | `GL₂`, `k = 1`; `GL₃`, `k = 2` | `GL₂`: `1, q, q+1, q−1` (the degrees, `H₀ = 1`); `GL₃`: `q²−q`, `q²`, `q²+2q`, `q²`, `0` | holds | none |
| 2.8 (a), (b) | `q = 2, n = 7, k = 3`, `L = T`; `n ≤ q` | `m = 35 + 4 + 14 + 21 = 74 > 60`; `(1+1/q)^n ≤ 1 + (2n−1)/q` from `Σ_{r≥2} ≤ (n−1)/q` | holds; hypothesis needed | none |
| 3.1 integrality, `L = −R(∞)` | `𝔾_m`, `g = 1`; source | `R = qt/(1−qt) − t/(1−t)`, `R(∞) = 0 = L`; DudasMichel2015 lines 2573–2581 (their `R` has the opposite sign) | holds; locators right | none |
| 3.3 Jordan formula | `x ↦ x⁻¹` on `𝔾_m`, `p ≠ 2`; source | both sides `2`; DudasMichel2015 line 2689 | holds; locator right | none |
| 3.4 (a)–(d) | `𝔾_m` on `ℙ¹`; weights `(1, 2)` on `𝔸²`; EtaleDualityAndPerverseSheaves §7.6 | `2 = 2`; stabilisers `𝔾_m, μ₂, 1`; §7.6 states (a) for connected groups, (d) as *finitelyManyStabilizers* | true; owned twice | R01, C01 |
| 4.2 `R_T^G(θ)`, Green functions | `B` rational; `G = T`; source | `Ind_{B^F} θ` (with `θ(t)⁻¹`); `R_T^T(θ) = θ`; DudasMichel2015 lines 2709, 2790, 2793 | holds; locators right | none |
| 4.4 inner product | `SL₂(𝔽₂)`, non-split torus | points of `ab = c − c⁻²`: `k` even `q²+q+1`, odd `q²−q+1` `= 4^k + (−2)^k + 1` | holds | none |
| 4.6 Steinberg character | `GL₃`, `s = diag(a, a, b)`; `GL₂` at `T₁` | flags `3(q+1)`, planes `q+2`, lines `q+2`: `St(s) = q`; average `(q(q−1) + (q−1)(q−2))/(q−1)² = 2 ≠ 1` | holds | none |
| 5.1 (a), (b) | `n = 1`; `(q, n) = (2, 2)`; source | (b): `0 ≤ 0`; `0 ≤ 2 − 2`; bound `π_p(k) ≤ p^k/k` at the Bary-Soroker–Koukoulopoulos–Kozma text, line 2263 | holds; locator right | none |
| 5.2 separation | all `(q, n)` with `q^{n/2} < 2n + 1` | `(2,2)`: `2 < 3`; `(2,4)`: `12 < 15`; `(2,8)`: `120 < 255`; `(3,3)`: `6 < 26`; `(2,6)`: `60 < 63` after dropping `d = 1` | holds | none |
| 5.3 comparison with `GL₂` | pinned value | `−(θ(u) + θ(u^q))` at elliptic `u`, Tau Ceti `RepresentationTheory/CharacterTable/GL2/Cuspidal/Basic.lean:207–213`; 5.2 gives `(−1)^{2−1}Σ_j θ(z^{q^j})` | agree | none |
| 5.4 squarefree label | degree | `[G:P]_{p′}·∏ψ_{d−1} = ψ_n/∏ψ_d·∏ψ_{d−1} = ψ_n(q)/∏(q^{|O|} − 1)`; `GL₂`: `q + 1`, `q − 1` | holds | none |
| 5.7 labels, generic count | `GL₂` | `(q−1) + ½(q−1)(q−2) + ½q(q−1) = q² − q = q^n − q^{n−1}` | holds | none |
| 5.8 weights | `n = 2` | totals `(q−2)/(2(q−1)) + q/(2(q+1)) + q/(q²−1) = 1`; share `(q+1)²/|G| = wt·(1 + q⁻¹)` | holds | none |
| 5.9 counts | `n ≤ 6` | `q^n − k_n = 1, 1, q, q, q²+q−1, q²`; `N*_q(3) = (q³−q)/3` | holds | none |
| 5.10 (a) | `n = 2` | class sums `(q−1) − (q²−1) = −q(q−1)` on the centre terms; total `−q(q−1)G₂(θ)`; `w = −qG₂(θ)` | holds | none |
| 6.2 parametrisation | `n = 2`, `q` odd | `(q+1−2)/2` or `(q+1)/2`; sum `½(q−1)·q` | holds | none |
| 6.3 labels of depth-zero representations | source | MoyPrasad1996 lines 455, 481–483 (Theorem 5.2 (1), p. 110); Dat, Proposition 6.3 (ii), preprint line 1395 | locators right | none |
| `bessel_pairing_eq` (2.7 (b)) | `n = 2, k = 1, i = 0`, `K = 𝔽₂`; `ψ₀ = 1` | `χ(1) = ½(χ(1)+χ(u)) + ½(χ(1)−χ(u))`; with `ψ₀ = 1`, `χ = 1`: `1 ≠ q^k`, so `hψ₀` is needed | holds; indices match 2.7 | none |
| `exists_cuspidal_of_regular`, `HasCuspidalValues` (5.2) | `n = 1`; `s = u = 1` | `χ(s) = θ(s)` (empty product); `(−1)^{n−1}∏_{i<n}(1 − q^i) = ∏(q^i − 1)`, the stated `finrank` | consistent | none |
| `exists_regular_of_isCuspidal`, `IsCuspidal` (5.5, 1.1) | `n = 1`; `GL₂(𝔽₂)` | no `k` with `0 < k < 1`: every character cuspidal; sign cuspidal, trivial not | consistent | none |

- Source locators checked against the text: 14. Dudas–Michel 2015 (10: Lemma 10.3, Proposition 10.6, Theorem 10.11, Proposition 13.1 (iii), Corollary 13.2, Propositions 13.7–13.10 for 3.3 and 3.4, Definitions 14.2 and 14.7 with Proposition 14.8); MoyPrasad1996 (Theorem 5.2 (1), Proposition 6.7); Dat (Proposition 6.3 (ii), arXiv preprint numbering); Bary-Soroker–Koukoulopoulos–Kozma (Proposition 8.1).
- Library declarations opened at the pin: `Matrix.card_GL_field` (Mathlib `LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:122`), `TauCeti.GL2Cuspidal` (`RepresentationTheory/CharacterTable/GL2/Cuspidal/Irreducible.lean:333`), `TauCeti.upperUnitriangularGroup` (`LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Basic.lean:108`), `TauCeti.ReductiveCommHopfAlgCat`, `TauCeti.FiniteField.rationalPointsMulEquiv`, `TauCeti.UniversalEnvelopingAlgebra.kostantRootSubgroupPoints`.
- Cross-roadmap citations resolved at this head: ReductiveGroups §§7.1, 7a.1–7a.3, 7b.1, 7c.1, 7C.6, 7h.1–7h.3, 7i.1–7i.3, 9F.1–9F.11 and Layer 9E; CharacterTheory §§3.5, 9a.1, 9a.2, 9a.4–9a.12; EtaleCohomologyFoundations §§F.2.4, F.2.5, F.2.5a, F.2.7, F.3, F.4.5, F.10.4a; EtaleDualityAndPerverseSheaves §7.6 (read in full); CharacterSumsOverFiniteFields §3.1a; SmoothRepresentationsOfLocalGroups SR.2.1, SR.2.2, SR.3.1, SR.3a.1, SR.5.2, SR.7.1, SR.7.2; TensorInductionAndFiniteGroupInputs §§6.1, 6.2 (b′); LocalFactorsOfTwistsAndTypes §2.1; ReductiveGroupsPartII RG2.3.6.
- Record against the merge base: the `##` and `###` headings of the two READMEs differ only in three supplier-contract subsections removed and two added, which the description states; no layer or numbered section is removed, renumbered or retitled.
- Automatic checks: the worker's run passed every check. Dependency check: `depcheck: 132 roadmaps, 1471 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings (lines 125, 187, 206) and nothing else. Padding decided by reading: none of the three theorems restates a definition or follows from one library lemma.
- The pull request's text: the sentences on this folder (the exceptions 0.1, 0.3, 2.2; the wider 3.2, 4.8, 5.4, 5.7; the suppliers gained and dropped; the mutual citations 4.4/4.5 and 5.4/5.7) agree with the head. Its merge-order block places #3036, which also edits this README, before this pull request.
- Overlap check: read EtaleDualityAndPerverseSheaves §7.6, ReductiveGroups Layers 7h, 7i, 9F, CharacterTheory Layer 9a, and the closest-roadmap lists (ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, SmoothRepresentationsOfLocalGroups, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison, BaseChangeAndGaloisRepresentationsForUnitaryGroups, LocalFactorsOfTwistsAndTypes, BesselPoincareSeriesAndGramBounds). Shared objects: the finiteness of stabilisers of a diagonalisable group and the trivial action of a connected algebraic group on `H^*_c`, owner EtaleDualityAndPerverseSheaves §7.6 (R01). Nothing else is shared.
- Source independence: 9 passages compared with 4 sources, changed passages only (1.2, 3.1, 3.3, 3.4 (a), (c), 4.2 with Dudas–Michel; 6.3 with MoyPrasad1996 and Dat; 5.1 with Bary-Soroker–Koukoulopoulos–Kozma); none shares wording beyond formulas. Largest share of the locators: Green 1955, 17 of about 162, which could not be read. The arrangement was not compared: the diff adds, removes and reorders no layer.
- Research link: Layers 4 and 5 are the character theory of finite reductive groups and of `GL_n(𝔽_q)` of Deligne–Lusztig (1976) and Green (1955); Layer 6 is the depth-zero theory of Moy–Prasad (1996) and Carayol (1984). The README ties them to Alpöge's 2026 formal proof of GRH for Dirichlet `L`-functions. Rests on the README, MoyPrasad1996 and Dudas–Michel 2015.

## Not verifiable

- Green 1955 (4.4, 5.4, 5.7, 5.8): the publisher's page is on a host the sources service does not classify; not read.
- Deligne–Lusztig 1976 (3.1, 3.3, 3.4, 4.2, 4.6), Curtis 1966 and Solomon 1966 (4.6), Digne–Michel 2020 (4.6): no legal copy found.
- Gelfand–Graev 1962 and Steinberg's *Lectures on Chevalley groups* (2.3): not read.
- Brundan–Dipper–Kleshchev 2001, Theorem 2.5d (2.7): not read; Zelevinsky 1981, Proposition 9.4, is recorded as uncertified.
- Rosen 2002, Proposition 2.1 (5.1): not read; the bound and the attribution to that proposition are confirmed through Bary-Soroker–Koukoulopoulos–Kozma, Proposition 8.1.
- Dat 2009 was read in its arXiv preprint; I did not compare its numbering with the published version.

## Source issues

- none

## For the human reviewers

- The family's Method labels and the formal-proof declaration names rest on [FormalProof], Alpöge's Lean formalisation (README, References, entry [FormalProof], with a public repository URL). It was not opened; its status and licence are for the humans.
- Not tested: Green 1955, the source with the largest share of the locators, could not be read, so the wording was not compared with it.
