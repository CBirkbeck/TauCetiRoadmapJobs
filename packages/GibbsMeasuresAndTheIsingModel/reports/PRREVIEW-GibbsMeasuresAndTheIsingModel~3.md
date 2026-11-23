# Review of GibbsMeasuresAndTheIsingModel (pull request #2976 at 4c55550)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 46 README lines changed since 888dbad, and no finding remains. The one finding of the previous review, the false absolute-continuity sentence in the proof route of 3.2, is repaired: the route now states the two-sided bound for cylinder events only, as Friedli–Velenik's Lemma 6.43 does, and the rest of the argument was recomputed and holds. The three small corrections and three format notes of the previous review are all applied; one new format note, not blocking. The printed page numbers and the four secondary books remain unread and are listed for the human reviewers.

## N01 — In the supplier contract (README lines 640–643), "`Γ` does not enter them" is said of §§4.4–4.5, whose `Subshift` is defined through `Γ`

What the proofs of the listed items do not use is the supplier's standing hypotheses on `Γ` (countable, infinite, acting properly); "since those hypotheses do not enter them" would say that. Of §4.3 only the tail triviality is consumed, as the bullet above it says; its ergodicity half does use §4.2.

## Previous findings

- R01 — repaired: "The bound `D` gives, for every cylinder event `C` and every `n` such that `[−n, n]` contains the base of `C`, `e^{−2D} γ(C|ω') ≤ γ(C|ω) ≤ e^{2D} γ(C|ω')`", with the singularity of the kernels now stated (README lines 316–324).
- C01 — repaired: the extremality of `Q ω` cites Proposition 6.70, and Corollary 6.71 is cited for the existence of the fixed extremal measure (lines 172–173, 182–183).
- C02 — repaired: "at most `4M` times the number of sets of diameter at most `R` that cross a given boundary point, since `[−n, n]` has two" (lines 313–314).
- C03 — repaired: the contract says which supplier sections are consumed for an arbitrary action and which under the supplier's standing hypotheses (lines 640–643); wording in N01.
- N01, N02, N03 — repaired: no "open pull request" is left in the README; the route of 4.3 reads `μ⁺(n_A) ≥ μ⁻(n_A)`; the last Check of Layer 1 says "for infinite `I`".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.2 route: two-sided bound on cylinder events | zero potential, `n = 0`, `C = {σ_0 = +}`; nearest-neighbour chain, `β = 0.5`, `n = 0`, `ω = +`, `ω' = −` | `½ ≤ ½ ≤ ½` at `D = 0`; `γ(C|+) = 0.8808`, `γ(C|−) = 0.1192`, ratio `e^{4β} = 7.389 ≤ e^{2D} = e^{8β} = 54.60` (`D = 4β`) | true; matches Lemma 6.43 | none |
| 3.2 route: the kernels are mutually singular off the interval | zero potential, `n = 0`, `ω = +`, `ω' = −`, event `{x(1) = +}` | mass `1` under the first kernel, `0` under the second | true | none |
| 3.2 route: `μ ≤ e^{2D} ν` and the conclusion | `ω` in the good set of `μ`, `ω'` in that of `ν` (1.3); the class `{A : μ(A) ≤ e^{2D} ν(A)}` | limit of the bound gives `μ(C) ≤ e^{2D} ν(C)`; the class is monotone and contains the algebra of cylinders; `μ ≪ ν` contradicts singularity of 1.2 | true; source's proof of Theorem 6.40 has these steps | none |
| 3.2 finite range: bound on (6.55) | nearest-neighbour chain, `R = 1`, `M = β` | crossing sets `{−n−1, −n}`, `{n, n+1}`: (6.55) is `2(β + β) = 4β`; text gives `4M · 1 = 4β` | true | none |
| 1.3 decomposition: locators | Propositions 6.69, 6.70, Corollary 6.71 | 6.70: `Q·` extremal `μ`-a.s. for Gibbs `μ`; 6.71: extremal set non-empty when a Gibbs measure exists | match the text as cited | none |
| Layer 1, last Check | `I` finite; `I` infinite, `ν ≠ ν'` | finite: tail trivial, midpoint tail-trivial (excluded now); infinite: frequency event has masses `1` and `0`, midpoint `½` | true as restated | none |
| 4.3 route | `A = {i}`; `|A| = 2` | `n_A` nondecreasing, `σ_A = σ_iσ_j` is not (`+−` ↦ `−1`, `−−` ↦ `+1`) | corrected sentence true | none |
| Contract of DimerModelsAndLozengeTilings Layer 4 | trivial group; `ℤ^d` on itself, `d ≥ 1`; `d = 0` | supplier's layer assumes `Γ` countable infinite, proper; `ℤ^d` free on itself, so proper, infinite iff `d ≥ 1`; §4.2 used only in 4.2 under `[NeZero d]` | consistent | N01 (wording) |

The rows for the statements the change does not touch stand as in the previous review, of 888dbad.

- Source locators checked against the text: 6 in Friedli–Velenik, authors' revised version of 22 August 2017 (Theorem 6.40 and (6.54)–(6.55), FriedliVelenik2017 lines 15565–15579; Corollary 6.41, line 15586; Lemma 6.43, lines 15618–15635; Proposition 6.70, line 16619; Corollary 6.71, line 16621; proof of Theorem 6.40, lines 16717–16731).
- Library declarations opened at the pin: none new; `Suggested.lean` is unchanged since 888dbad.
- Cross-roadmap citations resolved: DimerModelsAndLozengeTilings Layer 4 on main (standing hypotheses, 4.1–4.6); BernoulliPercolation 5.1, 6.1, 6.2 at its open head; ConstructiveFieldTheoryPhi4, still open, cited in the scope section by name and section only.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (33) and no error.
- The pull request's title and description agree with the head: the supplier paragraph already states the split between an arbitrary action and the supplier's standing hypotheses; counts (42, 33) unchanged; nothing changes outside the folder.
- Overlap check: read DimerModelsAndLozengeTilings and BernoulliPercolation again at this head; CurieWeissModel, ConstructiveFieldTheoryPhi4, GlauberDynamicsOfTheIsingModel and RestrictedBoltzmannMachines as read in the previous review (the change adds no object; HopfieldModelThermodynamics, new among the closest, was not read); shared: the surrounding dual cycle and the path count, owner BernoulliPercolation 6.1–6.2 and 5.1, cited here; specifications and the tail σ-algebra, owner DimerModelsAndLozengeTilings Layer 4, cited here.

Source independence: changed passages only; 5 passages compared with 1 source (Friedli–Velenik), none shared beyond the forced inequality of Lemma 6.43; largest share Friedli–Velenik, 56 of 68 locators (the previous count of 54 of 66 and the two the change adds); the change adds, removes or reorders no layer, so the contents comparison stands as in the previous review: independent. Ruelle, Koralov–Sinai, Ellis and Grimmett could not be read.

Research link: Layers 1–3 are the Dobrushin–Lanford–Ruelle theory of Gibbs measures as in Friedli–Velenik (2017), Chapter 6, and Ruelle (2004), Chapter 1; Layer 5 is Peierls' argument (Friedli–Velenik §3.7). ConstructiveFieldTheoryPhi4 names Peierls-type phase transitions as building on its layers. Rests on the README and the text read.

## Not verifiable

- The printed page numbers of Friedli–Velenik (among them pp. 317 and 319 in the changed passages): the copy read is the authors' revised version, whose pagination differs from the printed book; theorem, lemma and equation numbers agree.
- Ruelle, *Thermodynamic Formalism*; Koralov–Sinai; Ellis; Grimmett, *Probability on Graphs*: not readable legally, second locators only, none in a changed passage.

Automatic checks set aside as false positives: the scanner for TeX subscripts flagged the Hamiltonian formula of 2.2, which lies inside an inline code span that wraps over a line break; the scanner for names that may not be cited as suppliers flagged PointProcesses in a sentence of the scope section that says that roadmap's notion is a different one and is not used.

## Source issues

- **Error** in Friedli–Velenik, *Statistical Mechanics of Lattice Systems* (2017) at Corollary 6.41, Section 6.5.5: the source says every finite-range potential on ℤ has a unique Gibbs measure; it should be assumed uniformly bounded (or translation invariant), since nearest-neighbour couplings `J_i` with `∑ e^{−2J_i} < ∞` give two; affects a stated result.

## For the human reviewers

- Not tested: the page numbers of the Friedli–Velenik locators refer to the printed book; only the authors' revised version (other pagination) was read, so numbers of theorems and equations are checked and pages are not.
- Licence: the README's *Prior formalization* names the GibbsMeasure project (Apache 2.0) as having the same shape of `Specification`; the copies here are those of DimerModelsAndLozengeTilings on main. That repository was not opened in this review.
