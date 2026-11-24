# Review of GlobalGaloisDeformations (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 12 lines changed since `3b77a6a`. The previous review had no finding and two small corrections; both are made: the *Needs* line of 3.6a now cites LocalGaloisDeformationRings §F.2.1 for `Φ_p`, which is where that roadmap states it for topologically finitely generated groups, and the DDT entry no longer gives the printed article as pp. 1–107. The third changed line, the *Needs* line of 8.4, is the text of `main` taken in by the merge, and both sections it cites exist there. Accepted with no finding, no small correction and no format note; nothing is left for a human to decide.

## Previous findings

- (The previous review had no finding R01, R02, …; its two small corrections are accounted for here.)
- C01 — repaired: "§§F.2.1, F.2.9 (`Φ_p` for topologically finitely generated groups, and fixed-determinant representability)" (README line 367); §F.2.1 of LocalGaloisDeformationRings on `main` has that statement as its last API bullet (its line 529).
- C02 — repaired: "International Press (1995), 1–154" (README line 2328). The range 1–107 is gone; 1–154 is the range of the MathSciNet record of the article, while Darmon's own publication list prints 1–157. No locator depends on it: all are pages of the authors' PDF.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 3.6a *Needs*: `Φ_p` for the group of the theorem | `G` topologically finitely generated profinite; §F.2.1 against §F.2.2 on `main` | F.2.1: "topologically finitely generated profinite groups satisfy `Φ_p`" (lines 510, 529); F.2.2: only `G_{F,S}` and `G_K` (line 549). `G = ℤ_p`: open subgroups `pᵏℤ_p`, each with `p` maps to `𝔽_p` | the cited section states what 3.6a uses | none |
| 3.6a *Needs*: fixed-determinant representability | §F.2.9 on `main` (line 813) | F.2.9 represents `Def_{ρ̄,χ}` under `Φ_p` and Schur; its own *Needs* cite F.2.1 (line 834), so the chain F.2.1 → F.2.9 is the one 3.6a states | agrees | none |
| 3.6a representability (DDT Theorem 2.36), cited by the changed line | locator re-read: DDT line 2747, on page 73 (page marker at DDT line 2718) | `n = 1`: lifts are `χ_A` alone, `R_ℳ` a quotient of `𝒪`; hypotheses (closure under subobjects, quotients, products) as in the source | locator and statement agree | none |
| 3.6a Lemmas 2.39 and 2.40 locators | DDT lines 2810 and 2825 | Lemma 2.39 lies after the page-75 marker (line 2789), Lemma 2.40 directly after the page-76 marker (line 2824) | pp. 75 and 76 as the README says | none |
| 8.4 *Needs*: LocalGaloisDeformationRings §§1.1 and 1.4 | head against `main`; the two sections on `main` | the line is identical to line 1760 of the README on `main` (it is not in the pull request's change against `main`); §1.1 is the local framed ring `R□` (line 1250), §1.4 its tangent and obstruction count, `dim ≥ 1 + d²(1 + [K:ℚ_p])` above `p`, `1 + d²` away (line 1308) | both sections exist and supply `R^loc_v` and its dimension, which the bound of 8.4 uses | none |
| DDT reference entry | Darmon's publication list; MathSciNet record | 1–157 on the author's list, 1–154 in the record; the README had 1–107 | the wrong range is gone | none |
| Headlines 4.10 and 5.6 in `Suggested.lean` (untouched) | elaborated again at this head | two `sorry` warnings, lines 50 and 65; types as in the previous review (`[IsLocalRing A]`, finite residue field of characteristic 2; `Module.finrank k H ≤ q`, `[FiniteDimensional k H]`) | agrees | none |

The rows for the untouched statements stand as in the previous review, of `3b77a6a`.

- Source locators checked against the text: 3 (DDT Theorem 2.36 p. 73, Lemma 2.39 p. 75, Lemma 2.40 p. 76; DDT lines 2718–2825), the locators of the one section a changed line belongs to.
- Cross-roadmap citations resolved on `main`: LocalGaloisDeformationRings §§F.2.1, F.2.2, F.2.9, 1.1, 1.4, F.0.2. This pull request does not change that roadmap.
- Record: against `main` the folder's change is still 93 lines (90 insertions, 3 deletions): the new §3.6a and its matching lines, one heading added, none removed or retitled, `Suggested.lean` unchanged. The 8.4 line belongs to `main`'s text, not to that change.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 50 and 65), nothing else; no section binder lost in its 3 declarations.
- Seeded sample (3.4, 3.6a, 4.3, 4.10, 4.11, 5.1, 5.2, 5.6, 5.7, 6.1, 6.5, 6.7, 8.3, 8.5, 8.6): only 3.6a lies in a changed passage, and its locators were re-read (above); the others neither cite nor depend on the three changed lines.
- Overlaps: no other open pull request changes this roadmap, none drops an id it cites, and it drops no id.
- Pull request text: the part of the description available names no section of this folder; nothing in it is contradicted by the three changed lines.

Overlap check: read LocalGaloisDeformationRings §§F.2.1–F.2.2, F.2.9, 1.1 and 1.4 (main), the sections the changed lines cite; PotentialAutomorphyInfrastructurePartII and GL2ModularityLifting (main) stand as in the previous review, since the change adds no object. Shared: `Φ_p` and the local framed rings, owned by LocalGaloisDeformationRings and cited here; the rings of type `ℳ` for a topologically finitely generated profinite group are owned by §3.6a here, which cites §8.6 there for the local finite-length form. Nothing else is shared.

Source independence: changed passages only; 3 passages compared with 1 source (DDT): two *Needs* lines, which are citations with no source wording, and one bibliographic entry; none shared. Largest share of locators: KW final (21 page locators, against 13 for Gee, 6 for ACC, 4 for DDT), as in the previous review. Contents not compared: the change adds, removes or reorders no layer.

Research link: §3.6a is Wiles's computation of `℘/℘²` by a Selmer group (Wiles 1995, as presented by Darmon–Diamond–Taylor 1995, §2.6), the Galois side of `R = T`; the roadmap's headlines are the presentations used by Khare–Wintenberger (2009) and ACC (2023). Rests on the README's overview and References and on DDT line 2787.

## Not verifiable

- The printed volume of *Current Developments in Mathematics, 1995* was not opened: the author's publication list gives pp. 1–157 and the MathSciNet record pp. 1–154, and which is the printed extent was not settled.
- Wiles (1995): the README credits the result of 3.6a to it without a locator; every locator is into DDT, which was read.
- The pull request's description is cut off in the copy given to this review; its remaining text was not read.

## Source issues

- **Error** in DDT at §2.6, the definition before Lemma 2.39, p. 75: the source says the trace-zero group is the intersection of `H¹(G, End⁰M)` with `H¹_D(G, End M)`, as if the first were a subgroup of `H¹(G, End M)`; it should be the intersection with the image of `H¹(G, End⁰M)`, the map not being injective when `p` divides `d`; affects a stated result.

## For the human reviewers

- none
