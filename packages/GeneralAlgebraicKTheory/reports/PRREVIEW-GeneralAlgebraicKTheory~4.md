# Review of GeneralAlgebraicKTheory (pull request #1212 at 43e9df6)
**Verdict:** accepted

Incremental re-review of 0 changed lines since 43e9df6: the head is the one the previous review read. No finding. `accepted` means ready for a human's final approval.

## Previous findings

- The previous report (of `43e9df6`) raised no finding, so there is none to account for. Its own `## Previous findings` bullets (R01–R03 of the review before it, all repaired) stand: the folder is byte-identical.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `DenseClasses.membership_iff` (§11.4) | T = bounded complexes of finite-dimensional k×k-modules, K₀ = ℤ²; A = objects with class (a,b), a ≡ b mod 3 | X⊕X⊕X has class 3(a,b) ∈ A, so A is dense. (1,0): 1 ≢ 0, outside A and outside the image. (1,1) and (3,0): inside both. | Pass; none |
| `DenseClasses.membership_iff`, hypothesis `hdense` | Same T; A = zero objects (not dense) | Image of K₀(A) is 0; X = k⊕k[1] has class 1−1 = 0 in the image but X ≇ 0. The iff fails without density, so the hypothesis is needed. | Pass; none |
| `DenseClasses.classification` (§11.4) | T = 0; H = 0 | K₀ = 0; the only isomorphism-closed triangulated property contains 0, hence is ⊤; exactly one A, and A X ↔ 0 ∈ H holds. | Pass; none |
| `restrictedCompletion_eulerCriterion` (§12.7) | A = finite free k×k-modules, Karoubi A = finite projectives, image of split K₀ = diagonal of ℤ² | K = (k,0)[0]: χ = (1,0), not diagonal, and no free L since χ is a homotopy invariant. K = ((k,0) --id→ (k,0)): χ = 0, L = 0. | Pass; none |

The rows for all other statements stand as in the previous review, of `43e9df6`.

- Gate rerun at this head: every counter 0, `OK`; the worker's gate (`build=0`) agrees. `git status` clean; no file changed outside the folder.
- Dependency check: `depcheck: 245 roadmaps, 2208 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/GeneralAlgebraicKTheory/Suggested.lean` with `lake env lean`: exit 0, five `sorry` warnings (lines 51, 58, 65, 101, 117), no other output. The six declarations were read in the file: every hypothesis is an explicit binder or a section variable the type mentions; nothing changed.
- Source locators: none rechecked; no passage changed and the README flags no locator as unverified. The seeded sample falls only in untouched text.
- Cross-roadmap citations: the worker's resolution lists none found nowhere. The 14 Lean names it lists are StableHomotopyKTheory names (on main) or declared in `Suggested.lean`, as the previous review resolved.
- Overlap lead checked: README line 71 links `GeneralizedCohomology/README.md#g2-a-concrete-spectral-model-and-represented-theories`; the open revision of GeneralizedCohomology renames that heading to "Layer 2", but its "How to read the build" carries a table headed "Former heading and numbering" mapping G2 → Layer 2, and it keeps the identifiers G2.3–G2.10, G3.4, G3.7 and G5.4 this README cites (`### 2.10 … (G2.10)` etc.). The citation stays valid; GeneralizedCohomology is cited as it is on main.
- Pull-request text read against the head: title, summary block and prose agree with the 13 layers, the three files of the folder, the six Lean declarations, and the suppliers named (StableHomotopyKTheory, AlgebraicKTheory, GeneralizedCohomology, all on main).
- Overlap check: read SchemeKTheoryOperations, KTheoryFiniteLocalFields, KTheoryLowDegrees, GeneralAlgebraicKTheoryPartII (open), StableHomotopyKTheory, AlgebraicKTheory, GrothendieckEulerForms (main); nothing shared. The four open ones name GeneralAlgebraicKTheory as their supplier for Q/S/plus theory and the finite-field calculation (owner: this roadmap); generic plus, group completion and Waldhausen foundations are StableHomotopyKTheory's, low-degree ring K-theory AlgebraicKTheory's, K₀ GrothendieckEulerForms's.

Source independence: changed passages only; 0 passages compared with 0 sources (no passage changed); largest share weibel-1, about 105 of 170 parenthesised locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

Carried from the previous review; nothing new.

- `quillen-3` (Annals 1972): only the bibliographic page is readable; Theorem 8 is cross-checked through weibel-1 only.
- `evens-friedlander`: paywalled landing page only; the §13.9a input is not certified against the primary proof.
- `aisbett-lluis-puebla-snaith`: AMS Memoirs landing page only; the dual-number calculation is not certified.
- `thomason-trobaugh-8`: the hosted PDF gave no readable text; its proof locators are not certified.

## Source issues

Carried from the previous review; none new.

- **Misprint** in weibel-1 at IV Lemma 7.7 proof, printed p.IV.63: the source says the final natural-map arrow goes from E to φ*E; it should be φ*E to E, as in the statement; affects the proof.
- **Gap** in schlichting-2003-11 at Appendix A.10 proof, printed p.26: the source says apply the finite-poset hypothesis to the discrete category of all connected components; it should be applied to two chosen components at a time, since there may be infinitely many; affects the proof.
- **Error** in schlichting-2002-12 at §1.6, printed p.114: the source says the displayed finite-ring K₃ distinction applies to every odd prime; it should be restricted to p>3 in this argument; affects the proof; corrected in print at Dugger–Shipley, Remark 4.9, p.156.

## For the human reviewers

- **Licence.** `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` References link copies of published texts on third-party academic pages (Quillen's LNM 341 paper on a Rochester page; Waldhausen, Thomason–Trobaugh, Carlsson–Pedersen on an Edinburgh page); their hosting status was not classified.
- **Not tested.** weibel-1 has the largest share of locators (about 105 of 170); this incremental round did not compare the layer arrangement with its table of contents, and the previous report carries no `Source independence:` line recording that comparison.
- **Not tested.** Four cited primary sources were unreadable (listed under Not verifiable): the finite-field and Artin-ring numerical inputs of Layer 13 rest on secondary cross-checks.
