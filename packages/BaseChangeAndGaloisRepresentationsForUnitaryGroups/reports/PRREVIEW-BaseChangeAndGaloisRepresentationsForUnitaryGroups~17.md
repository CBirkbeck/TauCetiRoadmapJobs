# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #3027 at 4b01d78)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 37 lines changed since `cd123f8`: accepted, with no finding. The change repairs the six small corrections of the previous review (the Corollary-of line of 10.29a, the Method label of 10.35, the comparison sentence of 16.1, the convention on corollaries, and two sentences of the description) and moves the citations of the Harish-Chandra series of a label from RepresentationTheory/CharacterTheory §§9a.6, 9a.9 to DeligneLusztigTheory §§2.6 (d), 2.9, which state at this head what is cited. One small correction (the family index keeps the sentence the roadmap corrected) and one format note remain, neither blocking. Three points are left for the human reviewers.

## C01 — The family index still says the proof "needs only that case, not the general theorem in full"

The roadmap's convention (line 41) now reads "needs no more of the general theorem than that case (for 13.0a, all of it)", but the paragraph on `*Corollary of:*` in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (line 203) keeps the earlier contrast, and says that each roadmap states these conventions in its own Conventions. For 13.0a the case is the whole of AnabelianGeometryAndNonabelianChabauty §2.0a (any field of characteristic zero, any linearly ordered alphabet), so the index and the roadmap now differ. Would the index read "needs no more of the general theorem than that case"?

## N01 — The citation of [FormalProof] in 10.27 (line 178) is the only one without a file path

## Questions for the author

- The Origin label of 13.8a (line 747) credits the comparison of simple trace formulas for inner forms of unitary groups to "Kottwitz, Clozel, Harris and Taylor, Labesse", with no works and no locators. Which works and statements are meant? The References list these authors only for other purposes, so there was nothing to open.

## Previous findings

- none: the previous report (of `cd123f8`) raised no finding. Its small corrections and format note are accounted for as follows.
- C01 — repaired: 10.29a carries "*Corollary of:* EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30 … with 10.34 (iii) and 10.35 (d) for the clauses on depth zero" (line 216); the scope paragraph says the same.
- C02 — repaired: "Clauses (a), (b) and, over a field isomorphic to `ℚ_p`, (c) and the direction 'depth zero ⇒ tame' of (d) hold by construction" (line 670).
- C03 — repaired: "(in the remark; in the statement, crystalline with these weights where `Π` is unramified at every place above `ℓ`)" (line 1285), as the statement of 16.1 has it.
- C04 — repaired: the description now excepts 16.1 ("it is only a remark"), and 10.29a names the general roadmap in its Corollary-of line.
- C05 — partly repaired: the roadmap's convention reads "no more of the general theorem than that case (for 13.0a, all of it)"; the family index keeps the old sentence (C01 above).
- C06 — repaired: the description names both new suppliers, DeligneLusztigTheory §§2.6 (d), 2.9 and AnabelianGeometryAndNonabelianChabauty §2.0a.
- N01 — not repaired: carried above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 10.29a, the Corollary-of line (`r_n = rec_n`) | `n = 1`; `GL_2(ℚ_p)`, `π_θ̃`; Steinberg of `GL_2`; twist by `ν^s` | `χ∘Art_geo⁻¹` (§10.20); inertia `θ∘t₂ ⊕ θ^p∘t₂` (10.34 (iii), `q = p`); tame with `N ≠ 0` (10.35 (d)); twist rule with `χ = |·|^s` | every clause of the statement follows; 10.34 and 10.35 are proved from `rec_n`, not from 10.29a, so no circle | none |
| 10.35, Method label | `F = ℚ_p`; `F` unramified quadratic over `ℚ_p`, `π_θ̃` of `GL_2(F)` | over `ℚ_p`: tame value by construction; over `F`: value "not a twist of a tame representation", and the label no longer claims (c), (d) there | consistent | none |
| 16.1, comparison with AG2.7 (line 1285) | statement; remark | statement: crystalline when `Π` unramified at every place above `ℓ`; remark: de Rham at every `w ∣ ℓ` | the sentence now says which is which | none |
| Convention on corollaries (line 41) | 13.0a against §2.0a; 10.0a against InductionRestriction §6.2 | 13.0a: same generality; 10.0a: any `H` against elementary `H` | true for all seven sections | C01 (index only) |
| 10.33d route, citation of DeligneLusztigTheory §2.6 (d) | `n = 2`, `κ = 2·{1}`; `n = 2`, `κ = {O}`, `|O| = 2` | `E_κ = {1, St}`, `R_T^G(1) = 1 + St`, pairings `f^{(2)} = f^{(1,1)} = 1`; `L_κ = G`, `E_κ = {σ_θ}`, pairing 1 | every character of label `κ` is a constituent of `R_{L_κ}^G σ_κ`, as the route uses | none |
| 10.34, 14.2: citation of DeligneLusztigTheory §2.9 | `GL_2` over `𝔽_q` | labels are monic polynomials with nonzero constant term, `q² − q` of them; one Harish-Chandra series each | §2.9 states the series of a label over every finite field | none |

The rows for the untouched statements stand as in the previous review, of `cd123f8`.

- **Source locators checked against the text:** none falls in the changed passages (they add no locator); the sampled targets 10.29a, 10.33d, 10.35 and 16.1 were checked where the diff touches them, against the supplier sections.
- **Cross-roadmap citations resolved at this head: 5.** DeligneLusztigTheory §2.6 (d) (README line 657, clause (d) at 672) and §2.9 (line 842), both read in full with the notation of its Layer 2; EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30 (headings at lines 3870–4109); this roadmap's 10.34 (iii) (line 523) and 10.35 (d) (line 683). No citation of RepresentationTheory/CharacterTheory remains in the folder; the supplier subsection is renamed to match.
- **Library declarations opened at the pin:** none; the change names no library declaration.
- **Record:** against the merge base no heading is removed or retitled; two supplier subsections are added (DeligneLusztigTheory, AnabelianGeometryAndNonabelianChabauty).
- **Pull request text:** title and description read against this head; the sentences on this roadmap (its two new suppliers, 16.1 as a remark, RepresentationTheory/CharacterTheory unchanged: its diff against `main` is empty) hold.
- **Dependency check:** `depcheck: 129 roadmaps, 1440 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with no message; the file is unchanged since `cd123f8` (a docstring and an empty namespace, no declaration, so no one-tactic probe or signature comparison applies).
- **Automatic checks:** all passed at this head.

Overlap check: read DeligneLusztigTheory, FiniteReductiveGroups, LocalFactorsOfTwistsAndTypes, EndoscopicTransferAndUnitaryTraceComparison (the cited sections); the Harish-Chandra series of a label of `GL_n` over a finite field is owned by DeligneLusztigTheory §§2.6, 2.9, the labels of depth-zero representations by FiniteReductiveGroups §6.3, the trace-defined correspondence by EndoscopicTransferAndUnitaryTraceComparison Layer 10, the uniqueness by LocalFactorsOfTwistsAndTypes §6.5; nothing is owned twice. No other open pull request changes this roadmap and none drops an id it cites.

Source independence: changed passages only; 5 passages (the Corollary-of line of 10.29a, the Method label of 10.35, the comparison sentence of 16.1, the convention on corollaries, the supplier contract for DeligneLusztigTheory) compared with the 6 sources of the previous review (Del73, Hof99, Cog04, Scholze 2013, BLGGT 2014, Guerberoff 2011), none shared; largest share [FormalProof], 32 file-path locators, not read; contents not compared: the change adds, removes and reorders no layer.

Research link: Layers 10 and 14–16 state the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005; Scholze 2013) and properties of the Galois representations of polarized cuspidal representations and of definite unitary groups (Shin 2011; Caraiani 2012; BLGGT 2014; Guerberoff 2011). Rests on the README's Summary and References and on Scholze Thm 1.2, BLGGT Thm 2.1.1, Guerberoff Thm 2.3.

## Not verifiable

- [FormalProof]: no legal copy was found at the repository address the References give. Its 32 file paths, its declaration names and every *Method of the formal proof* label (among them the changed label of 10.35) were not checked against it, nor the convention's claim on what the proof needs.
- DeBacker–Reeder 2009, Henniart 1992, Bushnell–Henniart 2005, Deligne–Henniart 1981, Kottwitz 1986, Caraiani 2012, Kudla 1994, Harris–Kudla–Sweet 1996 and Radford 1979 (uncertified): no text read, as in the previous review; the change touches none of their locators.
- The comparison of 13.8a with published simple trace formulas: the Origin label gives no work to open (the question above).

## Source issues

- none

## For the human reviewers

- Scope: the statements of 10.27, 10.29a and 16.1 (README lines 172, 220, 1260) are forms particular to [FormalProof], a Lean formalization announced on 20 November 2026; published or general forms stand beside them as remarks or in EndoscopicTransferAndUnitaryTraceComparison.
- Not tested: [FormalProof], the source with the largest share of locators (32), could not be read; the wording and arrangement checks were not run against it.
- Supplier: this roadmap, on `main`, now cites DeligneLusztigTheory (§§2.6 (d), 2.9), a roadmap this same pull request adds and the merge order does not list; the dependency check reports no problem.
- Decisions: no section leaves this folder (no heading removed against the merge base), so neither recorded decision was needed here.
