# Review of EtaleCohomologyFoundations (pull request #3027 at 4b01d78)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 2 lines changed since `7e87b98`: the consumer bullet for §§F.2.5a and F.10.4a now names DeligneLusztigTheory Layer 1 where it named ReductiveGroups Layer 9F, and that is what the head shows (ReductiveGroups has no Layer 9F and no longer cites §F.2.5a; DeligneLusztigTheory Layer 1 does). No finding and no small correction; one format note, not blocking. One fact about the sources of §F.2.5a is left for the human reviewers, as before.

## N01 — The list of consumer roadmaps does not name DeligneLusztigTheory, which the bullet below it now does

The sentence "The consumer roadmaps include …" (README line 2315) lists ReductiveGroups and FiniteReductiveGroups but not DeligneLusztigTheory, although the bullet at line 2323 gives it as a consumer of §F.2.5a. The list says "include", so nothing is false; adding the name would keep the two in step. ReductiveGroups stays in the list correctly: it still cites §§F.0.1 and F.0.2.

## Previous findings

- none: the previous report, of `7e87b98`, had no finding, small correction or format note; its five earlier points (R01, C01–C03, N01) were repaired there and the passages they concern are unchanged at this head.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Consumer bullet, line 2323 (the changed line) | the citing roadmaps at this head | DeligneLusztigTheory Layer 1 cites §F.2.5a at lines 186, 221, 283, 296, 371 and in its supplier contract (1112); ReductiveGroups: 0 occurrences of "9F" and of "F.2.5a" | holds | none |
| Same bullet, the unchanged consumers | FiniteReductiveGroups 3.2, 4.1; EtaleDualityAndPerverseSheaves §7.6 | 3.2 cites §§F.2.5a, F.10.4a (lines 1177–1200); 4.1 cites §F.2.5a (1295–1308); §7.6 cites both (7466–7486) | holds | none |
| §F.2.5a (cited by the changed line), a Deligne–Lusztig instance | torus `𝔾_m` over `𝔽̄_q`, `Γ = 𝔽_q^×` by multiplication (kernel of the Lang map) | quotient `𝔾_m` via `x ↦ x^{q−1}`; `Γ` lies in a connected group, acts trivially on `H¹_c = ℚ̄_ℓ`, `H²_c = ℚ̄_ℓ(−1)`; invariants `(0,1,1)` = `H_c(𝔾_m)` | holds | none |

The rows for the untouched statements stand as in the previous review, of `7e87b98`.

- Diff since `7e87b98`: one line of `README.md`; `Suggested.lean` unchanged. No heading or layer removed or retitled against the merge base (0 headings removed, 2 added: §§F.2.5a, F.10.4a).
- Cross-roadmap citations resolved at this head: 4 (DeligneLusztigTheory Layer 1; FiniteReductiveGroups 3.2 and 4.1; EtaleDualityAndPerverseSheaves §7.6). DeligneLusztigTheory is named as a consumer, not as a supplier.
- Source locators checked: 0; the changed line cites no source. Library declarations opened: 0; the change names none.
- Seeded sample: none of its targets lies in the changed line. "Free finite group actions on quasi-projective schemes" (§F.10.4a) is named by it and is unchanged since the previous review, which checked it.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1424 edges, 0 problem(s)`. Against the merge base, every file the pull request changes lies in one of its own folders (93 folders, nothing outside `TauCetiRoadmap/`); RepresentationTheory/CharacterTheory has no net change, as the description says.
- Elaboration: `lake env lean` of `Suggested.lean` gave six `declaration uses 'sorry'` warnings and nothing else.
- The pull request's text: its sentence on this roadmap ("§F.2.5a over every algebraically closed field, with the proof in the section, and §F.10.4a for quasi-projective schemes") matches the head; it does not mention a Layer 9F of ReductiveGroups, and it introduces DeligneLusztigTheory as a new roadmap.
- Overlap check: read ClassicalAdicEtaleCohomology, EtaleDualityAndPerverseSheaves, LefschetzPencilsAndVanishingCycles on main, and DeligneLusztigTheory at this head; SchemeAndStackFoundations §1.17 owns projective quotients by finite groups, and this roadmap owns the compact-support quotient formula and free-action perfectness, which DeligneLusztigTheory, FiniteReductiveGroups and EtaleDualityAndPerverseSheaves cite and do not restate. Nothing else shared. The other open pull request that touches this roadmap conflicts with this one only in files of other folders.

Source independence: changed passages only; 1 passage (the consumer bullet) compared with 0 sources, since it cites none and states no source's result; the arrangement was not compared, as no layer was added, removed or reordered.

Research link: the roadmap builds the foundations that Deligne's Weil II (1980) rests on, from SGA 4, SGA 4½ and Bhatt–Scholze (2015). §§F.2.5a and F.10.4a are cohomological inputs of Deligne–Lusztig character theory (Deligne–Lusztig 1976), and §F.10.4a is Theorem 3.2 (b) of Illusie–Zheng (2013). This rests on the README's references and illusie-zheng-odds-and-ends lines 796–818.

## Not verifiable

- SGA 4½ [Th. finitude] §§1–2, the locator of §F.3's finiteness, which §F.10.4a uses: settled as uncertified, no text held (untouched by this change).
- The published version of Illusie–Zheng (Int. Math. Res. Not. 2013) is behind a paywall; the previous review read arXiv v3, the version the README links.

## Source issues

- none

## For the human reviewers

- §F.2.5a's cohomological clause (README lines 1708–1715) is stated over every algebraically closed field. Its one locator, Dudas–Michel's 2015 lecture notes (dudas-michel-2015, an author's page, not refereed), covers only `𝔽̄_q`. The general case rests on the section's own route.
