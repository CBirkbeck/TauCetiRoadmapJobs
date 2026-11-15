# Review of QWittVectors (pull request #1351 at a42588c)

**Verdict:** needs changes

Incremental re-review of the 4 lines changed since 9d7d86f (README §8.2a only), plus the first check of the pull request's title and description against this head. The folder's files have no finding; the one finding is in the description.

## R01 (P3) — The description says every non-main, non-chain roadmap named in the README is a consumer; three prerequisites are not

**Location:** pull request description, Dependencies paragraph: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** apart from roadmaps on main and the open pull requests of the merge chain, the README names only consumers, so the listed chain is the whole of what this roadmap waits for.

**Witness:** `TauCetiRoadmap/QWittVectors/README.md:52,62,70` name "DerivedModuleAlgebra, Part II" and "DGAInfinity, Part II" as suppliers of `gap:cohomology-completion`, `gap:dga-bockstein`, `gap:dga-quotient` (used by §§7.2, 9.3, 9.5). Neither is on main or in an open pull request.

**Repair:** replace the sentence by: "Roadmaps on main are cited by name. Seven supplier contracts are declared as gaps under 'Exact supplier contracts': `gap:cohomology-completion` (DerivedModuleAlgebra, Part II) and `gap:dga-bockstein`, `gap:dga-quotient` (DGAInfinity, Part II), which extend roadmaps on main and are not yet in any pull request, and `gap:cyclotomic-contract`, `gap:ordinary-derham`, `gap:prismatic-frobenius`, `gap:pd-presentation`, asked of suppliers in the chain below. HabiroRings, HabiroCohomologyFoundations (and its Part II) and RefinedTraceMethods are consumers, not prerequisites." Tested against README lines 52, 62, 70, 124–130 and 1419–1422: seven slugs, four consumers.

## Previous findings

- R01 — repaired: line 1121 now reads "a D-algebra map f:E→E′ of such framed algebras lying over an injection ι of coordinate sets, so f(X_s)=X′_(ι s), and intertwining the automorphisms and the divided differences"; line 1124 cites "the coordinate compatibility".

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| §8.2a naturality (line 1121), induced map commutes with ρ | E=ℤ[X][[h]]→E′=ℤ[X,Y][[h]], f(X)=X, ι(X)=X | ρ′(f(a)e′_X)=f(a)·hX·x′_X; f(ρ(a e_X))=f(a·hX)x′_X=f(a)·hX·x′_X | Equal; the clause f(X_s)=X′_(ι s) is what the proof at line 1124 uses |
| Same, extra target direction | s′=Y, a∈E | γ′_Y(f(a))=f(a) ⇒ hY·D′_Y(f(a))=0 ⇒ D′_Y(f(a))=0 (hY regular) | No Y-component in d′ on the image |
| Same, product | a e_X, b | f(a)γ′_X(f(b))e′_X=f(aγ_X(b))e′_X by f∘γ_X=γ′_X∘f | Product preserved |
| Same, wrong models now excluded | f(X)=X+c; f(X)=qX | γ′(X+c)=qX+c vs f(γX)=qX+qc, differ unless hc=0; D′(qX)=q vs f(D X)=1 | Both fail the stated hypotheses; no new case admitted or lost |
| New clause against the supplier | PrismaticCohomologyPartII §5.0 at its open head (README lines 1420, 1432) | supplier: "Coordinate-injective maps intertwine them, and extra target directions fix the image"; here: the same, with f(X_s)=X′_(ι s) explicit | Agree |
| Description summary block against the head | each sentence | `BigWitt.ghost_image` declared (`Suggested.lean:82`); §2.1a, §§1.4a, 1.5 present; "no global framing" at README line 1345; nonunital coefficients in Conventions; consumers at lines 1419–1422 | Agree, except the sentence of R01 |
| Description's change statement | worker's diff against base | folder added, 1556 insertions, 0 deletions, 4 declarations added, 0 removed; outside-folder diff empty | Title "roadmap" and "Roadmap folder (README, `Suggested.lean`, `metadata.toml`)" agree |
| Description's open suppliers | README supplier headings | 13 roadmap suppliers: 5 on main (DerivedModuleAlgebra, DGAInfinity, EnhancedDerivedSheaves, BordismFormalGroups, SchemeAndStackFoundations), 8 open, the same 8 as the depends-on block | Agree |

Rows for statements the diff leaves untouched stand as in the previous review, of 9d7d86f.

- Diff since 9d7d86f: 2 insertions, 2 deletions, README lines 1121 and 1124 only; `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder.
- Gate at this head: every scanner count 0, `OK`, exit 0; the worker's gate adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean` at the pins: exit 0, two `sorry` warnings (lines 82 and 102), nothing else; the four elaborated signatures are those of the previous review.
- Cross-roadmap citations of the changed section resolved at the open heads: PrismaticCohomologyPartII §5.0 (`QFraming.qDeriv`, `QFraming.qDeRhamComplex`), §5.18 (`QDeRham.skewDGA`), AInfCohomology §AI.1.7 (`AInf.koszul_products_and_cohomology`): 3 of 3 found. No new library declaration is cited.
- Gaps: 7 slugs in the README, the same 7 in the plan's `gaps`.
- Seeded sample: none of the fifteen targets lies in the changed lines; source locator of the changed section re-read (wagner lines 2858–2872, §4.8, p. 57): 1 of 1 agrees.
- Remark, no change asked: the summary block's "The route follows Wagner's q-Witt vectors" describes the sources of the proofs; the README itself makes no such statement and the diff changes no layer, so the arrangement was not compared again.

Overlap check: read HabiroCohomologyFoundations, PrismaticCohomologyPartII, HabiroRings; framed q-de Rham complexes and the q-PD-envelope skew product are owned by PrismaticCohomologyPartII §§5.0, 5.18 and cited, the arbitrary-base skew product by this roadmap's §8.2a; the two Habiro roadmaps only consume.

Source independence: 2 passages compared with 1 source (changed passages only; wagner §4.8), none shared; largest share wagner, as in the previous reviews; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The description's sentence on AI assistance (two review rounds and two red-team rounds before the port) describes the job board's history, which is not part of the head; the reports folder holds four red-team reports, consistent with it.
- LeanSearch was unavailable to the worker's library near-match run (Loogle: no hits for the four declarations); the file is unchanged since the previous reviews' duplication audit.

## Source issues

- none

## For the human reviewers

- none
