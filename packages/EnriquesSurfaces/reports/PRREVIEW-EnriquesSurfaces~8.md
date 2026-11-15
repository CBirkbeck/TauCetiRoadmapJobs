# Review of EnriquesSurfaces (pull request #1286 at 1ed6f57)

**Verdict:** accepted

:robot: Independent AI-assisted incremental re-review: 0 changed lines in the folder since e852f4d (the head only merges main). This round reads the pull request's title and description against the head. No finding; the folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: the description now says "`Suggested.lean` states the two headline theorems statable at the pins … The pull request changes only `README.md`, `Suggested.lean` and `metadata.toml`"; the tree at 1ed6f57 has exactly those three files.
- R02 — repaired: "Use AbelianSchemesAndArithmeticModuli A4.8 for the polarized formal algebraization behind the Witt lift of §1.1. Use RootSystems §§1.1–1.4 on main …" agrees with `TauCetiRoadmap/EnriquesSurfaces/README.md:9`, `:41`, `:44`, `:147`.
- R03 — repaired: "K3Surfaces consumes nothing from this roadmap: §6.2 owns the canonical-cover comparison (U0) … so the supply runs one way" agrees with `README.md:11`, `:42`, `:642–646`; no K7.C is named.

## Verified sound

Adversarial table (the diff changes no statement; rows are for the statements the description cites, recomputed in `scratch/work/compute.py` or by hand).

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `reyeReductionImage` | all 1024 vectors of (ℤ/2)¹⁰, 10 generators | 9 edges; radical {0, {0,5,7,9}, {1,3,5,7,9}, {0,1,3}} with q = 0,0,1,1; 512 vectors with q=1, 510 nonradical; orbit of e₀ has 510 elements; every generator preserves q and fixes the radical | consistent; none |
| `reyeCongruenceKernels`, existence of ρ | 90 ordered pairs i≠j | mod-two sᵢsⱼ has order 3 on the 18 adjacent ordered pairs, 2 on the 72 others; b(eᵢ,eᵢ)=0, q(eᵢ)=1, so sᵢ²=1 | relations hold, ρ exists; none |
| §1.1 Witt lift through A4.8 and K0.A (description, second and third paragraphs) | W(k)/pⁿ⁺¹→W(k)/pⁿ, p>2; ample L on S | kernel pⁿW/pⁿ⁺¹W≅k, square zero; line-bundle obstruction in H²(O_S)⊗k, h²(O)=p_g=0; H²(T_S) dual to H⁰(Ω¹⊗K), which injects into H⁰(Ω¹_X)=0 | holds; none |
| §6.2 U0 one-way supply (description, third paragraph) | e·f=1 in Num(S) | (π*e,π*f)=2; discriminant group of M(2) is (ℤ/2)¹⁰, order 1024=\|M/2M\|; uses only §1.5's lattice and K7.A's gluing criterion | holds; none |

Every other row stands as in the previous review, of e852f4d.

- Description against the head, sentence by sentence: title and summary block (U⊕E₈(−1) outside characteristic 2, `README.md:17`, `:250`; primes {2,3,5,7,17} and Aut(S)≃Wbar(2) with rational-curve transitivity, `:621–628`; T237 kernel, `:666`; separate very-general and generic-open statements, `:642`, `:689`; counts 34,780 and 136, `:757`; consumers, `:784`); supplier paragraphs (`:9`, `:11`, `:41–44`, `:127–147`, `:219`, `:242`, `:642–687`); the `Suggested.lean` paragraph (2 sorried theorems at `:81`, `:97`, 8 definitions, parabolic node sets {0,2,…,8}, {0,1,…,6}, {0,2,…,7}, generator K′s₉). No sentence contradicts the head and no change is unstated.
- Cross-roadmap citations re-resolved, 9: K3Surfaces at its open head a23ff3a (K0.A `:265–267`, for algebraically closed k of characteristic p>2, both H⁰(T_X) and H⁰(Ω¹_X); simple connectivity in Layer 2 `:535`; K6.A `:774`; K7.A `:863`; K7.B `:1016`; §7.3 `:1107`; `:49` and `:1179` consume nothing from this roadmap); AbelianSchemesAndArithmeticModuli A4.8 at its open head (`:2341`); RootSystems on main §§1.1–1.4 (`:430`, `:462`, `:515`, `:564`) and §2.1 (`:616`), with its ownership boundary at `:63–66`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EnriquesSurfaces/Suggested.lean` gives exactly two `sorry` warnings (lines 81 and 97), nothing else; the file has no `variable` block, so no binder can be lost.
- Gate: the worker's gate at 1ed6f57 passes every check. Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Changes outside the folder: none against the base (`git diff --stat origin/main...HEAD` outside the folder is empty; the files that differ from e852f4d come from the merge of main).
- Overlaps: no other pull request changes this roadmap, no dropped id, no second copy (the roadmap is not on main).
- Overlap check: read EnriquesSurfacesAndIntegralNonexistence, K3Surfaces, RootSystems (main); nothing shared (EnriquesSurfacesAndIntegralNonexistence `:3–9` is the arithmetic Part II consuming E0–E1f; K3Surfaces `:49` leaves the canonical-cover comparison here; RootSystems `:63–66` assigns the T246 application to §5.2).
- Source independence: changed passages only; the diff changes no passage, 0 passages compared; arrangement not compared again (no layer added, removed or reordered). No locator changed and the seeded sample falls in no changed passage; the previous locator table stands.

## Not verifiable

- Averbukh, Chapter X of Shafarevich (ed.), *Algebraic surfaces* (1964): no legal text; the README keeps the relation behind 34,780 and 136 as a reconstruction target.
- Cossec–Dolgachev 1985, Proposition 1 (i): announced without proof in the text read; checked only as far as finite computation reaches.

## Source issues

- none

## For the human reviewers

- **Scope.** `reyeCongruenceKernels` (`TauCetiRoadmap/EnriquesSurfaces/Suggested.lean:97`) rests on Proposition 1 of `cossec-dolgachev-1985`, a research announcement that states it without proof (lines 62–72).
