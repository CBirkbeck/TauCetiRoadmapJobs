# Review of SchemeKTheoryOperations (pull request #1229 at 1dfb7dd)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the description now reads “The suppliers still open are GeneralAlgebraicKTheory and AlgebraicModuliForArithmeticGeometry, listed with their pull requests below. StableHomotopyKTheory is already on main, as are the other suppliers”; main and the open index agree.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: suppliers still open / on main | 11 suppliers named in the README's contracts, on main `3cf7342` and in the open index | Text: 2 open (GeneralAlgebraicKTheory #1212, AlgebraicModuliForArithmeticGeometry #853), rest on main. Heads: the same 2 open; 9 folders on main | agree | none |
| Description: “Every other roadmap named in the README is a consumer” | Every roadmap name in the README that is open and not on main | MotivicEtaleKTheory, PadicHodgeRegulators, EllipticKTheory, KTheoryFiniteLocalFields, ColemanIntegration: 0 `*Needs:*` lines each; suppliers have 1–62 | agree | none |
| Description: `c_{i,j}:K_j(X)→H^{2i−j}(X,Γ(i))` (§7.3a T3) | (i,j)=(1,0), (1,1) | (1,0): K₀→H², the first Chern class of a line bundle; (1,1): K₁→H¹(X,Γ(1)), receiving H⁰(O^×) through O^×[−1]→Γ(1); README line for T3 has the same indices | agree | none |
| Description: §7.3a consumers and sections | KTheoryFiniteLocalFields §§1.8, 6.10; MotivicEtaleKTheory §§2.0b, 7.1; PadicHodgeRegulators §4.1, at their open heads | All five headings exist; KTheoryFiniteLocalFields §1.8 and §6.10 each apply §7.3a's construction (étale/continuous étale; integral motivic); README scope paragraph names the same sections | agree | none |
| Description: §6.4 lift “unique up to weak homotopy”, unique class when `lim¹_N[ΣBGL_N(A),H]=0` | README §6.4, Milnor sequence | Text and README both: `0→lim¹→[BGL(A),H]→lim_N[BGL_N(A),H]→0`; kernel is lim¹, so vanishing gives one class; operations on `[T,BGL(A)⁺]`, T finite, factor through some `BGL_N` | agree | none |
| `groupHomology_stabilizeGL_of_ringKrullDim_le` and `…_of_isSemisimpleRing`, cited in the description | R=𝔽₂ (d=0, both forms apply), m=1, n=1,2,3 | Both forms: onto for n≥2, bijective for n≥3. n=2: `H₁(GL₂)=ℤ/2→H₁(GL₃)=0`, onto, not injective (not claimed); n=3: `0→H₁(GL₄(𝔽₂))=0`, bijective; n=1: nothing claimed, `0→ℤ/2` not onto | agree | none |

Untouched statement rows stand as in the previous review, of `1dfb7dd`.

- Incremental scope: 0 changed folder lines, 0 files changed outside the folder; title, prose and the `roadmap-summary` block read against the head (3368 added lines, 98 headings, 5 declarations: `IsStrictlyPerfect`, `IsPerfectComplex`, `IsPerfectComplex.exists_strictlyPerfect`, and the two stability theorems, as the description lists).
- Description against `TauCetiRoadmap/SchemeKTheoryOperations/Suggested.lean`: imports are `Mathlib` and `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable` only; the docstring names the `SR_(s+2)` form and the scheme K-groups as not statable, as the description says; folder holds README, `Suggested.lean`, `metadata.toml`.
- Summary block against the README: 7 claims located (doubled plane `K(k)×K(k)` versus `K(k)`, §2.1; Frobenius pairs, §1.5; homotopy invariance not assumed, §7.3a; `higherKGroup` retained with the Adams comparison, Scope and Downstream consumers; Witt and Chow consumers), none contradicted.
- Source locators newly checked: 0; the seeded sample lies entirely in settled text and no passage changed. Pinned declarations newly opened: 0.
- Cross-roadmap citations resolved: 5 consumer sections at their open heads, 11 supplier statuses; the citation resolver lists 0 cross-roadmap citations found nowhere.
- Gate rerun: every check 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 3 `sorry` warnings (lines 74, 92, 110), nothing else; the 5 elaborated signatures keep every binder of their README statements.
- Overlap check: read GeneralAlgebraicKTheory, KTheoryFiniteLocalFields, MotivicEtaleKTheory, StableHomotopyKTheory, EnhancedDerivedSheaves, SchemeAndStackFoundations; Chern classes out of higher K-theory are owned here (§7.3a) and instantiated, not rebuilt, by KTheoryFiniteLocalFields and MotivicEtaleKTheory; categorical K-machines belong to GeneralAlgebraicKTheory; nothing else shared; the overlap report lists 0 conflicts and 0 dropped ids.
- Source independence: changed passages only; 0 passages changed, 0 new comparisons; largest share remains Weibel (previous audit: 209 of 684 locators); no layer added, removed or reordered, so the contents comparison of the previous review stands.

## Not verifiable

- TT90, Soulé's operations paper, GS99, Riou and Geisser were not obtained through the sources service in the earlier audit; no passage depending on them changed.
- Gillet.1981 is settled as uncertified and cited by locator only.
- The description's line on AI assistance is a statement about authorship, not about the head; not checked.

## Source issues

- none

## For the human reviewers

- **Licence.** TT90 is linked at a personal site (`TauCetiRoadmap/SchemeKTheoryOperations/README.md` line 3206); the sources-service search assigned no licence class and found no other copy. The copy's status remains unsettled.
- **Licence.** Quillen (a third party's university page), Schlichting (another author's university page), GS99 (web archive of a preprint server), Zhang.2021 (a university archive) and Schneider (a seminar's book-chapter copy) have hosts not classified here.
