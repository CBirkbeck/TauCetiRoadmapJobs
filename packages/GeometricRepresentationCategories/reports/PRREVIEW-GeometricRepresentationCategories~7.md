# Review of GeometricRepresentationCategories (pull request #2579 at a29acfe)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the four lines changed since `5979b2e` and of the pull request's description: both small corrections of the previous review are repaired (§2.2 and the Tau Ceti contract now name the lemma whose hypothesis is the neighbourhood basis, and the description now says that `Suggested.lean` is rewritten and its 28 declarations removed), and the description agrees with this head sentence by sentence. Three format notes are carried from the previous review, none blocking; nothing is left for a human to decide.

## N01 — Convention 9 and the opening of "From Tau Ceti" say names in `CategoryTheory` drop that prefix, but the `MonoidalLeftAction` names are in `CategoryTheory.MonoidalCategory`

Mathlib `CategoryTheory/Monoidal/Action/Basic.lean:42` opens `namespace CategoryTheory.MonoidalCategory`, so restoring `CategoryTheory.` alone finds none of `MonoidalLeftAction`, `MonoidalLeftAction.pseudofunctor`, `MonoidalLeftAction.curriedActionMop`. Name the second namespace at lines 99–100 and 1015–1016.

## N02 — In §1.2 (line 169), "an action of `D` by exact functors" should read "an action on `D`": `D` is the category acted on.

## N03 — The References list Johnson–Yau, Theorem 8.4.1, p. 238 (line 1096), which no layer cites. Cite it where it is used, or drop the locator.

## Previous findings

The previous review (of `5979b2e`) had no finding. Its small corrections and format notes:

- C01 — repaired: the description now reads "`Suggested.lean` is rewritten. The file on main declares 28 interfaces … under twenty module imports. All of them are removed"; main's file has 28 declarations and 20 import lines.
- C02 — repaired: "the two agree when the `J_N` form a basis of neighbourhoods of zero (`TauCeti.smoothModules_eq_discreteModules`)" (line 273), and the same name in "From Tau Ceti" (line 1021).
- N01 — not repaired: "names in the namespace `CategoryTheory` are written without that prefix" (lines 99–100, 1015–1016). Carried as N01.
- N02 — not repaired: "an action of `D` by exact functors" (line 169). Carried as N02.
- N03 — not repaired: "Theorem 8.4.1, p. 238 (coherence for bicategories)" (line 1096). Carried as N03.

The repair introduced no new problem: the old name `TauCeti.discreteModules_eq_smoothModules` no longer occurs in the folder, and the new name is the only change.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.2, smooth = discrete when the `J_N` are a neighbourhood basis of zero (the sentence the diff changes; sampled) | `A = ℂ[[x]]`, `J_N = (x^N)`; `∏_N ℂ[[x]]/x^N`; control `J_N = 0` with the `x`-adic topology | `ℂ[[x]]/x^M`: killed by `J_M`, annihilators `⊇ (x^M)` open: both hold. Product: `x^M·(1,1,…) ≠ 0` at `N > M`: both fail. Control: every module smooth, `A` not discrete (`Ann(1) = 0` not open) | true; the basis hypothesis is needed and is the hypothesis `hJ` of the pinned lemma | none |
| "From Tau Ceti", list of smooth-module declarations (changed line 1021) | each name of the bullet at the pin | `smoothModules_eq_discreteModules` at `Smooth/Basic.lean:376`: `(𝓝 0).HasBasis (fun _ => True) (J ·) → smoothModules J = discreteModules A`; `discreteModules_iff_isOpen` at line 241 | names exist; statement is the one cited | none |
| Description against the head | every sentence of its five sections | *In Tau Ceti:* lines at §§1.1, 1.2, 1.3, 2.1, 2.2, 4.1, 4.3, 4.5 and three in §5.2, as listed; a *Needs:* line in each of the 19 sections; four supplier subsections; Checks named at lines 141, 182, 375, 451, 640, 806, 809; main's file: 28 declarations, 20 imports; head's file: `import Mathlib`, docstring, empty namespace | no sentence contradicted; nothing a reader must know is unstated | none |

The rows of the previous review for the untouched statements stand as in that review, of `5979b2e`.

- Library declarations opened at the pin: Tau Ceti `Algebra/Category/ModuleCat/Smooth/Basic.lean:241, 337, 376` (and the use of the line-337 lemma at `Smooth/Coinduction.lean:266`). The line-337 lemma has no family `J`; the line-376 lemma is the cited statement.
- Source locators: the diff changes none; the sampled sections' locators stand as checked in the previous review (22 of 22).
- Cross-roadmap citations: the changed passages cite AffineLieAlgebras A5.1–A5.2, on main as before. Main's README already cited AffineLieAlgebras and FormalConnectionsOpers, so the pull request adds or drops no supplier.
- Record against the merge base: unchanged since the previous review; the diff adds, removes and reorders no layer or item.
- Automatic checks at this head: all passed, none set aside. Dependency check output: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives no message. The file has no declaration, so there is no signature to compare and no padding to probe; its docstring names each headline result and what it lacks at the pins.
- Ownership against open pull requests: no open pull request changes this roadmap, drops an id it cites, or is close to it in vocabulary or results.

Overlap check: read AffineLieAlgebras, FormalConnectionsOpers, AlgebraicModuliForArithmeticGeometry (the lists of open roadmaps and of results are empty). Shared objects and owners, as in the previous review: the completion, loop and coordinate lifts, smooth and discrete modules with strict fibres, the deformation, the Feigin–Frenkel normalizations and the coordinate character equation belong to AffineLieAlgebras; opers, `K_N`, the gauge groupoid, the cotangent algebroid and `IsomOp` belong to FormalConnectionsOpers; nothing shared with AlgebraicModuliForArithmeticGeometry.

Source independence: changed passages only; 2 passages compared (the changed sentence of §2.2 and the changed contract line) with 0 sources, since both are a library name and cite no source; largest share Frenkel2007, 14 of 22 locators; contents not compared again, the diff adding, removing or reordering no layer (previous result: independent).

Research link: the roadmap makes precise the local geometric Langlands proposal of Frenkel–Gaitsgory (2006, (0.8)–(0.9)) and Frenkel's Conjectures 10.1.2 and 10.3.10 (2007); §5.2 is Frenkel–Gaitsgory's Lemma 7.4.1, Theorem 7.4.2 and map (7.2); §5.1 uses the Frenkel–Zhu oper-reduction theorem. Rests on the README and the three sources read.

## Not verifiable

- The Zulip discussion and the Mathlib pull request listed in the References were not opened; they are design references and carry no statement.
- The printed editions of Frenkel's book and of Johnson–Yau were not compared with the open copies read in the previous review.

## Source issues

- none

## For the human reviewers

- none
