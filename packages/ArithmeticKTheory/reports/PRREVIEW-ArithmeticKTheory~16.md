# Review of ArithmeticKTheory (pull request #1418 at d682d86)

**Verdict:** accepted

Incremental re-review of the 21 lines changed since 51e8c9f (README only: the GeneralAlgebraicKTheory and KTheoryFiniteLocalFields contracts, the *Needs:* lines of §§2.4, 3.3 and 5.5, the Layer 2 Dependencies). No finding.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/ArithmeticKTheory/README.md` line 977 reads “GeneralAlgebraicKTheory §13.8c for K_n(𝔽_q)=0 at even n≥2; KTheoryFiniteLocalFields §§1.1–1.6 for its normalized classes and transfers”; lines 304–306, 455–456 and 991–992 carry the three other requested texts. The same repointing was made at lines 1399 (§3.3) and 2347 (§5.5).

## Verified sound

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| GeneralAlgebraicKTheory contract, §13.8c (added, README 304–306) | q=2, 4, 5 against the supplier's head | Supplier §13.8c (its README line 3028): K₀=ℤ, K₂ᵢ=0, K₂ᵢ₋₁≅ℤ/(qⁱ−1), i≥1. K₃(𝔽₂)=ℤ/3, K₁(𝔽₄)=ℤ/3, K₃(𝔽₅)=ℤ/24, K₄=0 in each: the contract's three formulas agree. | Pass |
| §2.4 *Needs:* (changed) | R=ℤ, n=2 and n=3 | n=2: K₂(𝔽_p)=0 (i=1 of §13.8c), so K₂(ℤ)=ℤ/2↪K₂(ℚ). n=3: K₃(𝔽_p)=ℤ/(p²−1), ℤ/3 at p=2, nonzero; the cited vanishing is even-degree only, as written. | Pass |
| §3.3 *Needs:* “finiteness and even vanishing of the residue groups” (changed) | S=∅, T={p}, n=2, 3 | n=2: 0→K₂(ℤ)→K₂(ℤ[1/p])→K₁(𝔽_p)=ℤ/(p−1): injective, finite cokernel. n=3: K₃(𝔽_p)=ℤ/(p²−1)→K₃(ℤ)→K₃(ℤ[1/p])→K₂(𝔽_p)=0: onto, finite kernel. Both properties come from §13.8c. | Pass |
| Contract clause “the vanishing used by §§2.4, 3.3 and 5.5” (added) | §5.5 at q=7, ℓ=3, i=1 | §5.5 (README 2277–2278) uses K_(2i)(k;ℤ/N)≅K_(2i−1)(k)[N]; the kernel is K_(2i)(k)/N=0 by even vanishing. N=3: K₁(𝔽₇)[3]=(ℤ/6)[3]=ℤ/3. So §5.5 does use the vanishing. | Pass |
| KTheoryFiniteLocalFields contract “normalize … and supply the Bott classes and finite-field transfers” (changed) | its head | Its Layer 1 is “finite fields over the supplied Brauer–Quillen comparison”; §1.2 Bott classes, §1.4 normalized classes, §1.5 restriction and transfer, §0.5 Burnside transfer detection all exist; its contract imports the groups from §13.8c. | Pass |

Rows for the untouched statements stand as in the previous review, of `51e8c9f`.

- Source locators checked: 1 (kbook lines 15636–15640, Corollary IV.1.13: ℤ/(qⁱ−1) at n=2i−1, 0 at even n≥1; cited at README 966 and 1360). The seeded sample has no target in the changed passages.
- Cross-roadmap citations resolved at the open heads: 3 (GeneralAlgebraicKTheory §13.8c; KTheoryFiniteLocalFields §§0.5 and 1.1–1.6). Merge order: GeneralAlgebraicKTheory (19) before KTheoryFiniteLocalFields (95) before this roadmap (143), so every repointed citation is downward. GeneralAlgebraicKTheory is already in the description's dependency list; no supplier is added or dropped, and the title and description agree with this head.
- Gate, rerun: `gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean`, exit 0, four `declaration uses sorry` warnings (lines 67, 73, 98, 115) and nothing else. The file is unchanged since 51e8c9f, so the binder comparison and the one-tactic probe of the previous review stand.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ArithmeticKTheory'` is empty.
- Remark on untouched text: the Dependencies of Layers 3 and 5 (README 1698, 2360) still say “finite-field K-theory” and “finite-field Bott classes” without naming §13.8c, which the *Needs:* lines of §§3.3 and 5.5 now name.
- Declared gaps: both unchanged; the diff does not touch them.

Overlap check: read KTheoryFiniteLocalFields, CyclotomicClassGroupsAndStickelberger, K2SymbolsBrauerPartII, K3BlochGroups, EllipticKTheory, StableHomotopyKTheory, ClassicalArithmeticCompletion (the result-and-heading list is empty); for the changed passages the one shared object is the finite-field K-group calculation, owner GeneralAlgebraicKTheory §13.8c, which this roadmap, KTheoryFiniteLocalFields, K3BlochGroups and EllipticKTheory all cite.

Source independence: changed passages only: 6 passages compared with 1 source (kbook, at IV.1.13), none shared beyond the formula for K_n(𝔽_q), which the mathematics forces; largest share kbook, 81 of about 226 locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- As in the previous review: Bass–Tate, Groenewegen's preprint, Grayson, Quillen's Seattle notes, Harris–Segal, Mitchell and Serre are waived or uncertified and were not read; the changed passages cite none of them.
- GeneralAlgebraicKTheory §13.8c's own locator (Quillen's finite-field paper) is the supplier's to verify and was not opened.

## Source issues

- none

## For the human reviewers

- none
