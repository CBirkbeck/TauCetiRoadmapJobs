# Review of ProjectiveModulesOverPolynomialRings (pull request #2295 at bde4633)

**Verdict:** accepted

No findings. Incremental re-review: the folder is identical to the one read at `dd3913d` (0 changed lines; the head only merges main), and the pull request's description was rewritten.

## Previous findings

- R01 — repaired: the description now says “There are two supplier edges, and both suppliers come earlier in the merge order” and “Placed after its last supplier, RelativeFarguesFontaine, it has two edges and no UPWARD or CYCLE”; the Layer 4 bullet names the route.
- R02 — repaired: “states 17 headline theorems”; the Layer 3 bullet has the dilation lemma (3.2); Review cites (3.3) and (3.4); “Research context (three paragraphs)”; Lindel has its locator; V.2.10 (p. 253) is listed.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.4 route, determinant `det H′ = Yʳh` | `A=ℤ`, `n=2`, `H=[[X,1],[−1,0]]`, `s=1`, `d=1`; `n=1`, `H=(X+3)`, `d=1` | `H′=[[1,Y],[−Y,0]]`, det `Y²`, so `r=n(d−deg s)=2`, `h=1`; `H′=1+3Y`, `r=0`, `h(0)=1` | Agrees with README 537–539 | None |
| 4.4 route, glueing pair against the supplier's three fields | `R=ℤ[Y]`, `R′=ℤ[Y]_(1+3Y)`, `f=Y` | `(1+3Y)⁻¹ ≡ Σ(−3Y)ʲ` mod `Yⁿ`, so the quotients agree for every `n`; `Y`-power torsion `0` on both sides; `Y↦0` sends `h` to `1` | `GlueingPair` holds; `M(0)=Q`, `M(1)=P` | None |
| 1.1 `exists_specialLinearGroup_row_pow` (cited by the description's Layer 1 bullet) | `r=2`, `a=(2,3,5)`, `m=(2,1,1)`; `r=0`, `a=(2)` over `ℚ` | `2!∣2`; row `(4,3,5)`, gcd `1`, completable over `ℤ`; `SL₁={1}`, row `(2)` not a first row, excluded by `hr : r ≠ 0` | Lean and description agree | None |
| 3.2 `exists_unit_lift_dilation` (cited by the description) | `f` a unit; `f=0` | `Localization.Away f ⊗ R = R`, `ψ=θ(g₁X)θ(g₂X)⁻¹`, `k=0`; zero ring, `ψ=1` | Agrees | None |

The rows for every other statement stand as in the previous review, of `dd3913d`: no statement changed.

- The description read sentence by sentence against the head: three files with `topic = "math.AC"`; module form (`module`, `public import Mathlib`, `@[expose] public section`); 17 `sorry` theorems and 4 definitions (21 declarations); numbering 3.1–3.5, 4.1–4.5, 5.1–5.4; Mathlib pin `1b1ccf4`; Research context of three paragraphs (README 729, 744, 766); two supplier edges. No sentence contradicts the head and no change of the pull request is left unstated.
- Nothing outside the folder differs from the merge base of main (`git diff --stat origin/main...HEAD` outside the folder is empty); the files listed as changed since `dd3913d` come from the merge of main.
- Cross-roadmap citations resolved again at the open heads: RelativeFarguesFontaine §6.4 `GlueingPair` (fields `quotient_surjective`, `quotient_injective`, `torsion_bijOn`, one universe) and §6.5 `beauvilleLaszlo_effective` (`IsLocalization.Away (algebraMap R R' f) L`, finite projective `M′`, `M₁`, compatibility with `α`), matching README 168–177; PadicDifferentialEquationsAndRigidCohomology §RD.0.55 (b), (d) and §RD.0.56 (b) with the names the contract cites; §RD.3.27 present. 5 citations, all found.
- Duplication by object after the merge of main: no Horrocks, Quillen–Suslin, monic-submonoid or extended-module statement in the pinned Mathlib or Tau Ceti; `roadmaps grep` over main and the open heads finds no second owner (PadicDifferentialEquationsAndRigidCohomology keeps the rigid-analytic theorem §RD.3.27; QuadraticFormsOverABase names the analogue as not a target).
- Dependency check: `depcheck: 242 roadmaps, 2194 edges, 0 problem(s)`; the merge order lists this roadmap directly after RelativeFarguesFontaine.
- Gate: every check passed (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`). Elaboration of `Suggested.lean` at the pins: 17 `sorry` warnings, nothing else. Signatures and the one-tactic probe stand as in the previous review (the file is byte-identical).

Overlap check: read HomologicalStabilityOfGeneralLinearGroups, PadicDifferentialEquationsAndRigidCohomology, RelativeFarguesFontaine, AlgebraicKTheory; finite free resolutions and the unimodular extension property are PadicDifferentialEquationsAndRigidCohomology's (§RD.0.55–§RD.0.56), glueing pairs and the gluing of finitely generated projective modules RelativeFarguesFontaine's (§6.4–§6.5), `Eₙ`, stable range and Milnor squares AlgebraicKTheory's; nothing else shared.

Source independence: changed passages only: 0 passages changed in the folder, so none compared in this round (the previous review compared 29 passages with 4 sources, none shared); largest share LombardiQuitte2015, about 25 of 72 locators; no layer added, removed or reordered, so the contents comparison with LombardiQuitte2015, Chapter XVI, stands: independent.

## Not verifiable

- Suslin 1977, Theorem 2, p. 479 (1.1): not read (the sources service could not fetch it in the previous round; not retried, the text is unchanged); the statement and page stand on the locator alone.
- Suslin 1976 (5.2, 5.4), Horrocks 1964, Theorem 1, and Lang, Theorem XXI.3.4: not read; supported through Quillen1976, LombardiQuitte2015 and Kedlaya2004 as recorded in the previous review.
- The works cited only in Research context (Fasel–Rao–Swan, Schäppi, Lindel 1981, Swan 1962, Swan–Towber 1975, Bass 1973, Murthy 1966, Mohan Kumar 1985, Popescu 1986/1990, Swan 1998, Swan 1978, Lequain–Simis 1980, Asok–Hoyois–Wendt 2018, Lam 2006): not read; no target depends on them.

## Source issues

- none

(The two issues of the previous review, in Quillen1976 at the proof of Theorem 4 and in LombardiQuitte2015 after Theorem XVI.5.15, were reported there; no source was reopened in this round.)

## For the human reviewers

- **Licence.** Quillen1976 lines 22–27: the GDZ scan carries terms restricting reproduction; the README and this report give locators and restatements only.
- **Licence.** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:770-772` cites an unpublished preprint (Schäppi, arXiv:2311.04104v1) for a claimed counterexample in Research context; no target depends on it.
- **Scope.** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:168-177`: target 4.4 depends on RelativeFarguesFontaine §6.5 (Beauville–Laszlo), a roadmap still in a pull request, for a gluing over two comaximal localisations.
