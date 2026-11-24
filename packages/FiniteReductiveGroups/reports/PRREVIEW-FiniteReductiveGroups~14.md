# Review of FiniteReductiveGroups (pull request #3027 at 094da69)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 2212 changed lines since `74a09b7`. Needs changes, for the one reason the previous review gave, which this head does not repair: 3.4 and the scope still claim as this roadmap's own the finiteness of stabilisers of a diagonalisable group and the trivial action of every connected algebraic group, which EtaleDualityAndPerverseSheaves §7.6 (in this pull request) states and proves, and 3.4 still misdescribes that section. What changed since the previous head is the re-pointing of every citation of ReductiveGroups Layer 9F and RepresentationTheory/CharacterTheory Layer 9a to the new DeligneLusztigTheory §§1.1–1.11 and 2.1–2.12; I resolved each against that roadmap at this head and all agree, and every statement I recomputed holds. There is one small correction (also carried over) and no format note; two points are left for the human reviewers.

## R01 (P2) — 3.4 and the scope claim as this roadmap's own two statements that EtaleDualityAndPerverseSheaves §7.6 states and proves, and misdescribe that section

An implementer finds the finiteness of stabilisers and the action of connected groups planned twice, with two routes and two owners, and 3.4 tells them that §7.6 has less than it has.

In 3.4 the Origin (lines 1223–1225) reads "(a) for a connected algebraic group that need not be linear, by the same route, and (d) are this roadmap's own formulation". The Route (lines 1237–1239) reads "(b), (c), and (a) for a connected linear algebraic group, are EtaleDualityAndPerverseSheaves §7.6 (*lefschetzGroupActions*), which cites the published proof of (b); (a) is proved here for every connected algebraic group". The scope (lines 2770–2772) lists under "owns" "the triviality of the action of a connected algebraic group on cohomology, the route of the torus fixed-point formula and the finiteness of the stabilisers of a diagonalisable group (3.4)".

At this head, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` §7.6 says otherwise:

- Lines 7522–7529 state *finitelyManyStabilizers*: for a diagonalisable group over any field acting on a separated scheme of finite type, the stabilisers are finitely many; a full proof by generic flatness follows. This contains 3.4 (d).
- Line 7565 states *lefschetzGroupActions* (a) for "a connected algebraic group `G`", not a linear one, and lines 7605–7607 give it a published source in that generality (Deligne–Lusztig, Proposition 6.4, as recorded in Serre's Bourbaki exposé 487, Proposition 3; I read the exposé: its Proposition 3 is for a connected algebraic group). So the general (a) is neither this roadmap's own nor unpublished.
- Lines 7584–7596 prove (b) in the section, through *finitelyManyStabilizers*, and line 7607 calls (b) "this roadmap's own formulation, proved by the route above". No published proof of (b) is cited there.

The smallest change is in 3.4 and the scope:

- In the Origin, drop the clause that makes the general (a) and (d) this roadmap's own.
- In the Route, say that (a)–(c) are §7.6 *lefschetzGroupActions*, with (a) there for every connected algebraic group, and that (d) is §7.6 *finitelyManyStabilizers*. The routes written here may stay as second routes or shrink to the citation.
- Add *finitelyManyStabilizers* to the *Needs:* line of 3.4 and to the §7.6 row of the supplier table (line 2949).
- In the scope, move the three items of 3.4 from "owns" to the list of restated statements, so that "3.4 (b), (c)" there (line 2799) becomes "3.4".

## C01 — The Origin of 3.4 gives Dudas–Michel, Propositions 13.7–13.9, for (a)–(c), and those propositions do not contain (b)

A reader who looks up the torus formula `L(g, X) = L(g, X^S)` at that locator does not find it. In the lectures (the copy on J. Michel's page), Proposition 13.7 is the cohomology of affine space, 13.8 the fibration in affine spaces (3.4 (c)) and 13.9 the trivial action of a connected linear group (3.4 (a)): DudasMichel2015 lines 2648, 2664, 2678. Propositions 13.1–13.10 contain no fixed-point formula for a torus. I could not read Deligne–Lusztig §3, the other locator, and EtaleDualityAndPerverseSheaves §7.6 gives no published source for (b). Either give the locator where (b) is stated, or say in the Origin that (b) is the formulation of §7.6, with 13.8 and 13.9 for (c) and (a).

## Questions for the author

- 4.10 and 4.11 are stated for the `q`-Frobenius of an `𝔽_q`-structure, and their Remarks say the Steinberg case has no route. Does Digne and Michel (2020) give `Q_T^G(u) = 1` at regular unipotent elements for every Steinberg endomorphism? The README cites that book for 4.3 and 4.6 in that generality. I could not read the book.

## Previous findings

- R01 — not repaired: 3.4 still reads "(a) for a connected algebraic group that need not be linear, by the same route, and (d) are this roadmap's own formulation", and the scope still lists the three items of 3.4 under "owns". The folder's change since the previous head touches neither passage. Raised again as R01.
- C01 — not repaired: the Origin of 3.4 still reads "Dudas and Michel (2015), Propositions 13.7–13.9, (a)–(c)". Raised again as C01.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.4 class numbers; 5.9 counts | product to order `t⁶` | `k_n = q−1, q²−1, q³−q, q⁴−q, q⁵−q²−q+1, q⁶−q²`; `q^n − k_n = 1, 1, q, q, q²+q−1, q²` | holds | none |
| 0.4 pairs, `n = 2` | `GL₂` | `½q(q−1) + ½(q²+q−2) = q² − 1 = k₂` | holds | none |
| 1.2 cuspidal support (`GL_n(𝔽_p)`) | source | DudasMichel2015 lines 1846, 1869, 1983: Lemma 10.3, Proposition 10.6, Theorem 10.11 as cited | locators right | none |
| 1.3 endomorphism algebras | `GL₂`, `σ = α ⊠ β`; source | `α ≠ β`: norm `1 + [α = β] = 1`; `α = β`: `2`, hypothesis needed; DudasMichel2015 lines 2110–2117, 2126, 1924 | holds; locators right | none |
| 2.7 (b) Bessel-type decomposition | multiplicities; `n = 2, k = 1, i = 0` | `1 + Σ_{j<k}(q^{k−j} − q^{k−j−1}) = q^k = [U : H_i]`; `χ(1) = (χ(1)+(q−1)χ(u))/q + (q−1)(χ(1)−χ(u))/q` | holds | none |
| 3.1 integrality, `L = −R(∞)` | `𝔾_m`, `g = 1`; source | `R = qt/(1−qt) − t/(1−t)`, `R(∞) = 0 = L`; DudasMichel2015 lines 2573–2581; Serre exposé line 119 (Deligne–Lusztig Prop. 3.3) | holds; locators right | none |
| 3.3 Jordan formula | `x ↦ x⁻¹` on `𝔾_m`, `p ≠ 2`; source | trace side `1 + 1 = 2`; fixed points `{±1}`: `2`; DudasMichel2015 line 2689; Serre exposé line 144 (Thm 3.2) | holds; locators right | none |
| 3.4 (a)–(d) | EtaleDualityAndPerverseSheaves §7.6; sources | §7.6 has (a) for connected groups (line 7565) and (d) (line 7522); Serre exposé line 163 (Prop. 6.4); DM 13.7–13.9 lack (b) | true; owned twice | R01, C01 |
| 4.3 character formula | regular elliptic `s ∈ GL₂`; source | `C°(s) = T_s`, `Q = 1`: `R_{T_s}(θ)(s) = θ(s) + θ(s^q)`; `−` that is the pinned `GL₂` value; Serre exposé line 332 (Thm 4.2) | holds; locator right | none |
| 4.7 degree, irreducibility | `n = 2`; two characters of `GL₁(𝔽_p)` | `J₂(1) = 1 − q = ε_Gε_{T_s}(q²−1)(q−1)/(q²−1)`; `ψ₂/(ψ₁ψ₁) = p + 1` | holds | none |
| 4.11 Gelfand–Graev pairings | `GL₂` | `q(q−1) + ½(q−1)(q−2)(q+1) + ½q(q−1)² = (q−1)(q²−1) = Γ_ψ(1)`; `q² − q` generic characters | holds | none |
| 5.5 parametrisation, degrees | `GL₂`, `q = 2, 3` | `Σ deg² = 6 = |GL₂(𝔽₂)|`; `2·24 = 48 = |GL₂(𝔽₃)|` | holds | none |
| 5.7 labels, generic and semisimple | label `(X−1)^n`; `GL₂` | generic degree `q^{n(n−1)/2}ψ_n/ψ_n` (St), semisimple `1`; count `q² − q` | holds | none |
| 5.8 weights | `n = 2`, `q = 2, 3, 4, 5, 7`; `q = 2, 3`, `n ≤ 5` | totals `= 1`; non-squarefree `q/(q²−1) ≤ 2/q`; `S′_n = 1, 3, 5, 11` and `4, 14, 40, 122`, equal to `q^n − q^{n−1} − S′_{n−1}`, `≥ q^n − 2q^{n−1}` | holds | none |
| 5.10 (a) Gauss sums | `GL₂(𝔽₃)`, `θ = ω, ω², ω⁵`; source | `w(σ_θ)` by summing over classes `= −3·G₂(θ)` (e.g. `9 = 9` for `ω²`); Kondo, Theorem of the Introduction, p. 245 (lines 39–54) | holds; locator right | none |
| 5.11 (a)–(c) Shintani descent | `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)` by enumeration; source | norm fibres `30, 90, 60` of `180`; Shintani lines 219–223, 244–251, 285–288, 344, 126, 357, 363 (Lemmas 2-6, Corollary, 2-8, 2-9, 1-4, 2-10, 2-11) | holds; locators right | none |
| 6.3 labels of depth-zero representations | source | MoyPrasad1996 lines 455, 481–483 (Theorem 5.2 (1), p. 110); Dat preprint lines 1389–1396 (Proposition 6.3 (ii)) | locators right | none |
| 6.4 depth zero up to twist | `n = 1`; [FormalProof] | every character is `χ ⊗ 1`; the proof's class is rank one or `ℚ_p` with a twist of a `K₁`-fixed member, as 6.4 says | consistent | none |
| `bessel_pairing_eq` (2.7 (b)) | `n = 2, k = 1, i = 0`; indices | both sides `χ(1)`; `0`-based block `i..i+k−1`, column `i+k` equal the README's `W`, `c` | holds | none |
| `exists_cuspidal_of_regular`, `HasCuspidalValues` (5.2) | `n = 1`; `s = u = 1` | `χ(a) = θ(a)` (empty product); `(−1)^{n−1}∏_{i<n}(1 − q^i) = ∏(q^i − 1)`, the stated `finrank` | consistent | none |
| `exists_regular_of_isCuspidal`, `IsCuspidal` (5.5, 1.1) | `n = 1` | no `k` with `0 < k < 1`: every character cuspidal, and `θ = χ` on `L = K` | consistent | none |
| Citations of DeligneLusztigTheory (all of Layers 0–6) | each cited clause | §1.5 (a)–(d), §1.7 (a), §1.10 (`q`-Frobenius), §1.11 (connected centre), §2.2 (b), §2.5 (`∏ S_{m_i}`), §2.6 (a)–(d) with `κ`, §2.8 (a), (b), §2.9, §2.10, §2.11 (`g_n`), §2.12 (d) say what is cited | agree | none |

- Source locators checked against the text: 22. Dudas–Michel 2015 (12), Moy–Prasad 1996 (1), Dat (1, arXiv preprint numbering), Kondo 1963 (1), Shintani 1976 (7); Deligne–Lusztig Proposition 3.3, Theorems 3.2 and 4.2 and Proposition 6.4 confirmed through Serre's exposé 487.
- Library declarations opened at the pin: `TauCeti.upperUnitriangularGroup` (the import elaborates); [FormalProof] names of 2.7, 5.2, 5.5, 5.11, 6.3 and 6.4 (19) found by exact name in the kernel export, and the five file paths of 6.4 at the first commit.
- Cross-roadmap citations resolved at this head: DeligneLusztigTheory §§1.1–1.11, 2.1, 2.2, 2.4–2.12 (read in full); EtaleDualityAndPerverseSheaves §7.6; ReductiveGroups Layers 7h, 7i (headings); CharacterTheory §3.5 and Layer 9. No citation of ReductiveGroups Layer 9F or CharacterTheory Layer 9a remains in the folder.
- Record against the merge base: the `##` and `###` headings differ only in three supplier-contract subsections removed and three added, which the description states; no layer or numbered section is removed, renumbered or retitled; 40 Checks blocks before and after; the seven Lean declarations are unchanged in name.
- Automatic checks: the worker's run passed every check. Dependency check: `depcheck: 132 roadmaps, 1471 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings (lines 125, 187, 206) and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the three theorems closes. `#check @name` on the seven declarations: every binder of the README statements is present (`[Finite K]`, `hψ₀`, `hk`, `hi`, `hn`, `hL`).
- The pull request's text: the sentences on this folder (the new DeligneLusztigTheory and what cites it; the exceptions 0.1, 0.3, 2.2; the wider 3.2, 4.8, 5.4, 5.7; the suppliers gained and dropped) agree with the head.
- Overlap check: read DeligneLusztigTheory (scope and both layers), EtaleDualityAndPerverseSheaves §7.6, and the closest-roadmap lists (ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, SmoothRepresentationsOfLocalGroups, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison, BaseChangeAndGaloisRepresentationsForUnitaryGroups, LocalFactorsOfTwistsAndTypes, BesselPoincareSeriesAndGramBounds). Shared objects: the finiteness of stabilisers of a diagonalisable group and the trivial action of a connected algebraic group on `H^*_c`, owner EtaleDualityAndPerverseSheaves §7.6 (R01). Deligne–Lusztig induction and Green's theory in general: owner DeligneLusztigTheory, cited here. Nothing else is shared.
- Source independence: 13 passages compared with 6 sources, changed passages only (1.2, 1.3, 3.1, 3.3, 3.4 (a), (c) with Dudas–Michel; 4.3 with Serre's exposé; 5.10 with Kondo; 5.11 (a), (b), (c) with Shintani; 6.3 with Moy–Prasad and Dat); none shares wording beyond formulas. Largest share of the locators: Green 1955, 17 of about 162, which could not be read. The arrangement was not compared: the diff adds, removes and reorders no layer.
- Research link: Layers 4 and 5 are the character theory of finite reductive groups and of `GL_n(𝔽_q)` of Deligne–Lusztig (1976) and Green (1955), with Kondo (1963) and Shintani (1976); Layer 6 is the depth-zero theory of Moy–Prasad (1996). The README ties them to Alpöge's 2026 formal proof of GRH for Dirichlet `L`-functions. Rests on the README and the sources read.

## Not verifiable

- Green 1955 (0.4, 4.7, 5.5, 5.7): no legal copy the sources service can read; not read.
- Deligne–Lusztig 1976 (§3 for 3.4 (b); §10 and Theorem 10.7 for 4.11): no legal copy; the other locators into it were confirmed through Serre's exposé only.
- Carter 1985, Theorem 7.2.8 (4.3), Digne–Michel 2020 (4.3, 4.11), Macdonald 1995 (0.4, 5.5): not read from a legal place.
- Brundan–Dipper–Kleshchev 2001, Theorem 2.5d and (2.3.5)–(2.3.7) (2.7, 5.5): not read; Zelevinsky 1981, Proposition 9.4, is recorded as uncertified.
- Piatetski-Shapiro 1983 (5.10 (b)) and Kawanaka 1987 (5.11 (d)): not read.
- Dat 2009 was read in its arXiv preprint; I did not compare its numbering with the published version.
- The description as given to this review is cut short, so I could not read whether it states an order with the other open pull request that edits this README ("Roadmaps: cite the sections a need uses, not whole layers").

## Source issues

- none

## For the human reviewers

- This roadmap is on `main` and now names as a supplier DeligneLusztigTheory, a roadmap this same pull request adds (README, supplier contracts, "From TauCetiRoadmap.DeligneLusztigTheory"); the dependency check reports no upward edge. Whether that is acceptable is yours to decide.
- The family's Method labels and the formal-proof declaration names rest on [FormalProof], Alpöge's Lean formalisation (README, References, entry [FormalProof]), a public repository that states no licence; names and paths are cited, no code.
- Not tested: Green 1955, the source with the largest share of the locators, could not be read, so the wording was not compared with it.
