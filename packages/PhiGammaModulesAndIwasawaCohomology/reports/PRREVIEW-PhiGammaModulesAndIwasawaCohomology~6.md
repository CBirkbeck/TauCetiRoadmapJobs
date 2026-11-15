# Review of PhiGammaModulesAndIwasawaCohomology (pull request #1310 at e1f38c1)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 09f2de3; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "By section, the README uses: PadicPeriodRings §§1.1–1.5 and 3–4.3; PerfectoidTowers P9.0; CrystallineCohomology §CR.4.7; IntegralIwasawaTheory §7.1; NoncommutativeAndEquivariantIwasawa §§F.3 and F.6; ColemanPowerSeries §§1.45–1.49."
- R02 — repaired: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and for the Lean acceptance test in `Suggested.lean`; Claude Opus 5.5 for revisions answering AI red-team and review findings."

Neither repair introduced a new problem: the six suppliers of the new sentence are exactly the six of the depends-on block, and each section resolves (below).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `wittProjective_of_flat_phi` (`Suggested.lean:65`; named in the description's summary) | n=1, R=𝔽_p, M=𝔽_p^d, F=id, d=0,1,2, p=2,3 | W₁(𝔽_p)=𝔽_p; `truncatedWittFrobenius` is a↦a^p=a, so F(a•x)=a•F(x); M free of rank d, projective | Pass; none |
| same, flatness hypothesis | p=2, n=2, R=𝔽₂, M=ℤ/2 over W₂(𝔽₂)=ℤ/4, F=id | F is semilinear (Frobenius trivial on ℤ/4); Tor₁^{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2≠0, so M is neither flat nor projective | Excluded by `Module.Flat (ZMod (p ^ n)) M`; none |
| same, the two scalar structures | M any abelian group with p^n M=0 | A ℤ/p^n-module structure on M is unique (k•x is the k-fold sum), so the free `Module (ZMod (p ^ n)) M` instance cannot disagree with the Witt one | Pass; none |
| Description: "flattening base change is restricted to dominant transforms, since the unrestricted claim fails" against README §7.6 (:3048, :3077, :3112) | A=E⟨X,Y⟩→E⟨X,T⟩, Y↦XT | Ordinary chart pullback satisfies X(U−T)=0 (extra component X=0); the dominant transform has U=T | Description agrees with the head; none |

All other rows stand as in the previous review, of `09f2de3`.

- Description sentences checked against the head: 15 (summary block, 3 paragraphs; 4 prose paragraphs); none contradicted. Title: a shortening of the README's title. It states that the pull request adds the folder (3403 insertions, 80 headings, 2 declarations added, none removed), and names all six open suppliers.
- Cross-roadmap citations of the description resolved at the suppliers' open heads: PadicPeriodRings §§1.1–1.5, 3, 4.1–4.3; PerfectoidTowers P9.0; CrystallineCohomology §CR.4.7; IntegralIwasawaTheory §7.1; NoncommutativeAndEquivariantIwasawa §§F.3, F.6; ColemanPowerSeries §§1.45–1.49: all present under those ids. README `:170–206`, `:236–241`, `:1194–1195` cite the same sections.
- "Roadmaps on main are cited by name": the 12 other suppliers the README cites (AdicSpaces, AdicSpacesPartII, AdicSpacesPartIII, AlgebraicVectorBundles, ClassFieldTheory, DerivedModuleAlgebra, LocalFieldsRamification, PadicFunctionalAnalysis, PadicMeasuresIwasawaAlgebras, PerfectoidSpaces, ProfiniteCohomology, RigidAnalyticGeometry) are on main (3cf7342). The 7 open roadmaps named besides the suppliers occur only in scope and consumer sentences (README `:32–59`, `:514`, `:2184`), in no `*Needs:*` line.
- Validation paragraph: the targeted build completes (18239 jobs) with exactly the two warnings the description names (`sorry` at `Suggested.lean:65:8`; the module-system notice for `import Mathlib`). `lake env lean` on the file: the `sorry` warning only. The two elaborated signatures agree with README §0.4; no binder lost.
- Gate rerun at this head: every rule 0, OK (`readme-ids-missing=0 round-labels=0 empty-sections=0 set_option=0 outside-folder=0`). Dependency check: `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Changes outside the folder: `git diff --stat origin/main...HEAD` outside the roadmap folder is empty; the files listed as changed since `09f2de3` come from the merge of main.
- Seeded sample: all 15 targets lie in text unchanged since the previous reviews; no source locator was reread. Remark: README `:25` cites PadicPeriodRings as "§§1–4" in the scope paragraph, the supplier contract (`:170–172`) and the description as §§1.1–1.5 and 3–4.3.
- Overlap check: no folder change; the overlap list shows no shared id, second copy, dropped id or conflicting head, and no roadmap close in results or headings; the scopes of PadicHodgeTheory, NoncommutativeAndEquivariantIwasawa and PadicMeasuresIwasawaAlgebras were not reread and stand as in the previous reviews; nothing shared.

Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Which model made each repair commit: two commits carry a co-author trailer (Codex, Claude Opus 5.5); the description's attribution is consistent with them and otherwise the author's statement.
- Carried: NSW Theorem 2.4.1, p.111, remains an uncertified paywalled locator; unchanged and not reopened.

## Source issues

- none

(No source was opened this round; the entries of the earlier reviews stand.)

## For the human reviewers

- none
