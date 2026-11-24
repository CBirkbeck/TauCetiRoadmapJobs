# Review of FiniteReductiveGroups (pull request #3027 at 7c341e7)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** accepted

**Summary.** Accepted. This head repairs all five points of the previous review:
- 2.1 now cites ReductiveGroups §7i.1 for the general definitions of regular characters and of `Γ_ψ`, and the scope claims only the `GL_n` clause (R01).
- The vanishing of `*R_L^G J_n(θ̃)` is listed as restated from CharacterTheory §9a.8 (b) (C01).
- The description now states the change of suppliers and the exceptions 0.1, 0.3 and 2.2 (C02, C03).
- 3.2 cites the stable Stacks tag (N01).

No repair introduced a new problem. There are no small corrections or format notes. The two points for the human reviewers from the previous review remain.

## Questions for the author

- 4.10 and 4.11 are stated for the `q`-Frobenius of an `𝔽_q`-structure, and their Remarks say the Steinberg case has no route. Does Digne and Michel (2020) give `Q_T^G(u) = 1` at regular unipotent elements for every Steinberg endomorphism? The README cites that book for 4.3 and 4.6 in that generality. I could not read the book.

## Previous findings

- R01 — repaired: 2.1 (lines 610–611) reads "This is ReductiveGroups §7i.1 (its opening statement and (b)), extended to Steinberg endomorphisms in ReductiveGroups Layer 9E". Its *Needs:* line, the Layer 2 Dependencies and the supplier table name §7i.1. The scope restates "2.1 but for its `GL_n` clause".
- C01 — repaired: the restated list (lines 2799–2800) adds "the vanishing of the proper Harish-Chandra restrictions of `J_n(θ̃)` in 4.5 (b) and 4.9". The Layer 4 bullet keeps "inner products, degree, irreducibility and values" (4.4, 4.5 (d), 4.7, 4.9, 4.10).
- C02 — repaired: the description says FiniteReductiveGroups now cites ReductiveGroups Layers 7h, 7i and 9F, CharacterTheory Layer 9a, EtaleDualityAndPerverseSheaves §7.6, CharacterSumsOverFiniteFields §3.1a and SR.7. It "no longer cites OrbitMeasuresOnAdelicGroups, InverseGaloisAndArithmeticFundamentalGroups or SchemeAndStackFoundations".
- C03 — repaired: the description now adds "and in FiniteReductiveGroups 0.1, 0.3 and 2.2, which keep the general statement for every connected reductive group."
- N01 — repaired: "The Stacks Project, Tag 0F14" at lines 1152 and 3041.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.1, general part, now restated from ReductiveGroups §7i.1 | `SU₃(𝔽₂)`; `GL₂(𝔽₂)` | `|U₀^F| = 8`, `|U₀*^F| = 2`, quotient `𝔽₄`: `3 = q² − 1` regular characters; `deg Γ_ψ = 216/8 = 27 = (q²−1)(q³+1)`; `GL₂`: `6/2 = 3 = (q−1)(q²−1)` | holds; §7i.1 (b) states the same definition and degree | none |
| 2.1, `GL_n` clause (this roadmap's own) | `GL₃(𝔽₃)`; `t = diag(1, 2, 1)` | `(q−1)² = 4` regular characters; `|T^F| = 8`, stabiliser the centre (order 2), one orbit of 4; `(a₁, a₂) ↦ (2a₁, 2a₂)` | transitive, as stated | none |
| 2.1 Check on `SU₃` | `q = 2`, `q = 3` | `|U₀^F| = q³`: 8, 27; `|U₀*^F| = q`; `(U₀/U₀*)^F` of order `q²`; `q² − 1 = 3, 8` regular characters | holds | none |
| 3.2 Origin, locator Tag 0F14 | Stacks étale cohomology chapter, Lemma 97.2 (p. 202); `X = E` an elliptic curve, `Y = ℙ¹` | Lemma: `X` proper, `Y` qcqs, `k` separably closed, torsion coefficients; `dim H¹ = 2·1 = 2`, `dim H² = 1·1 + 1·1 = 2` | holds; the tag is that lemma | none |
| 4.5 (b), 4.9 vanishing, now restated from CharacterTheory §9a.8 (b) | `n = 2`, `θ̃ = 1`; `θ` regular | `J₂(1) = b^{(2)} − J₁ × 1 = 2 − (1 + St) = 1 − St`, `*R_T(1 − St) = 1 − 1 = 0`; `J₂ = −σ_θ`, restriction `0` | holds; §9a.8 (b) states the vanishing | none |
| Scope, Layer 2 bullet and restated list | 2.1, 2.2 | 2.1: `GL_n` clause in "owns", rest in "restated" (owner §7i.1); 2.2: `GL_n` case in "owns", general statement owned by §7i.2 | one owner each | none |

The rows for the untouched statements stand as in the previous review, of `c832fa9`.

- Source locators checked against the text: 2. The Stacks Project étale cohomology chapter, Lemma 97.2 = Tag 0F14 (p. 202). Steinberg1965 lines 263–280 (Lemma 3.2, pp. 54–55), compared with 2.1's changed sentences for wording.
- Cross-roadmap citations resolved at this head:
  - ReductiveGroups §7i.1 (opening statement and (a), (b)) and §7i.2;
  - ReductiveGroups Layer 9E, whose text names the extension of Layer 7i to Steinberg endomorphisms;
  - CharacterTheory §9a.8 (b), which states `*R_L^G J_n(θ̃) = 0` for every proper standard Levi subgroup.
- Library: `Suggested.lean` is unchanged since `c832fa9`. `lake env lean` on it gives three `sorry` warnings (lines 125, 187, 206) and nothing else.
- Automatic checks: the worker's run passed every check. Dependency check: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`.
- Changes outside the folder since `c832fa9`: all are in folders this pull request owns. None adds or changes a citation of this roadmap, and none touches the sections that 2.1 and the scope now cite.
- Overlap check: read ReductiveGroups Layers 7i and 9E, CharacterTheory §9a.8, BesselPoincareSeriesAndGramBounds and the closest-roadmap lists, which are unchanged since the previous review (ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, SmoothRepresentationsOfLocalGroups, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison, BaseChangeAndGaloisRepresentationsForUnitaryGroups, LocalFactorsOfTwistsAndTypes, BesselPoincareSeriesAndGramBounds). The objects the change touches and their owners:
  - regular characters and `Γ_ψ` for every `G^F`: ReductiveGroups §7i.1, cited;
  - the `GL_n` clause: this roadmap;
  - the vanishing of `*R_L J_n(θ̃)`: CharacterTheory §9a.8 (b), cited.

  BesselPoincareSeriesAndGramBounds consumes this roadmap's §§2.2, 2.4, 2.5, 2.7 and 5.8 and defines no regular character of its own. #3036 also edits this README; the description's merge-order block orders it first.
- Source independence: 3 passages compared with 2 sources, changed passages only: 2.1's citation and route sentences with Steinberg1965 Lemma 3.2, and 3.2's Origin and its References entry with the Stacks Project Lemma 97.2. None shares wording. The largest share of the locators is Green 1955, 17 of about 162 author–year citations, which could not be read. The arrangement was not compared again: the diff adds, removes and reorders no layer.
- Research link: Layers 4 and 5 are the character theory of finite reductive groups and of `GL_n(𝔽_q)` of Deligne–Lusztig (1976) and Green (1955). Layer 6 is the depth-zero theory of Moy–Prasad (1996) and Carayol (1984). The README ties them to Alpöge's 2026 formal proof of GRH for Dirichlet `L`-functions through the theta-chain and base-change roadmaps. This rests on the README, MoyPrasad1996 and Carayol1984.

## Not verifiable

- Nothing in the changed passages. The sources the previous review could not read (Green 1955, Deligne–Lusztig 1976, Dudas–Michel 2015, Digne–Lehrer–Michel 1992, Kondo 1963, Bushnell–Henniart 2005, and the books) bear on no passage this change touches.

Automatic checks set aside as false positives: the check that a pull request changes no file outside the roadmap folder under review (so that nothing merges without a review of its own), run once without the list of the other roadmap folders this pull request carries, flagged 119 files in those folders. Every one of them is in a folder this pull request owns, and each such folder has a review of its own.

## Source issues

- none

## For the human reviewers

- The family's Method labels and the formal-proof declaration names rest on [FormalProof], Alpöge's Lean formalisation (README, References, entry [FormalProof], with a public repository URL). It was not opened; its status and licence are for the humans.
- Not tested: Green 1955, the source with the largest share of the locators, could not be read, so the wording was not compared with it.
