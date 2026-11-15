# Review of GlobalShtukasAndFunctionFieldLanglands (pull request #1490 at de1f7c1)

**Verdict:** accepted

Incremental re-review of the 2 changed lines since `ede1562` (one README paragraph, the statement of §4.1 *Drinfeld’s lemma for finite étale covers*, reworded), and the first check of the pull request's title and description against this head. No finding.

## Previous findings

- none: the review at `ede1562` accepted with no finding, so no repair was due at this head.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §4.1 statement (reworded) against VL Lemma 8.11 | Hypotheses and the two categories, VL lines 5925–5941 (p. 111) | Source: connected F_q-schemes X₁…X_k, geometric points z_i, commuting F_{i} over Frob_{X_i} × id, composite Frob_T. README: the same four data; finite I for 1…k. | Agrees; no hypothesis dropped or added. |
| §4.1, I = ∅ | Empty product Spec F_q, trivial group | Covers T of Spec F_q with empty composite id = Frob_T: finite disjoint unions of Spec F_q, i.e. finite sets. Group side: finite sets. | Both sides finite sets; holds. |
| §4.1, I = {1} | One connected X | F₁ is forced to be Frob_T, which lies over Frob_X; the category is FÉt(X). Group side: finite π₁(X,z)-sets. | The ordinary Galois correspondence, as the first Remark says. |
| §4.1 functor, Frobenius condition | U_i Galois, A a finite ∏Gal(U_i/X_i)-set | Composite of `Frob_{U_i} × id` over i is Frob of ∏U_i times id_A; it commutes with the group, so it descends to Frob_T on the contracted product. | The object satisfies both stated conditions. |
| §4.1 functor reaches every finite continuous set | Open subgroup of ∏π₁(X_i) | An open subgroup of a product of profinite groups contains a product of open normal subgroups, so every action factors through some ∏Gal(U_i/X_i). | The functor is defined on the whole group-side category. |
| §4.1 second Remark against the reworded statement | X₁ = A², X₂ = A¹, T = `A²_{F_{q²}} × A¹` | Degree 2; F₁F₂ = Frob × Frob = Frob_T; T connected, so the 2-point fibre is transitive: Frobenius of π₁(A²) the transposition, π₁(A¹) trivial. | Consistent. |
| §4.1 against a wrong model (diagonal action only) | Two C₂ covers, A of 4 points | Product group C₂×C₂ acts with image of order 4; a single diagonal Frobenius gives order 2. The statement keeps one F_i per i. | Wrong model excluded by "one for each i∈I". |

Rows for the untouched statements stand as in the previous review, of `ede1562`.

- Source locators checked against the text: 1 (VL Lemma 8.11, statement at VL lines 5925–5941, proof reductions at VL lines 5942–5956, pp. 111–112). No seeded-sample target falls in the changed passage.
- Cross-roadmap citations of §4.1's `*Needs:*` resolved: EtaleCohomologyFoundations §F.0.2 (main, `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` line 312); ReductiveGroupsPartII §RG2.3.7 *lang-theorem* (main, its README lines 5201–5203). Library: `CategoryTheory.GaloisCategory`, `Mathlib/CategoryTheory/Galois/Basic.lean` line 28 at the pin.
- Internal citations of §4.1 (the `*Needs:*` lines of §§4.2, 4.3, 4.12, 7.4): the heading and anchor are unchanged; the statement they consume is mathematically the same.
- Pull request text, read against the head: title (adds a roadmap; the folder is not on main), the three summary paragraphs (objects built, the five downstream consumers in their order, the sequel, the GL_r boundary with AutomorphicLFunctionsAndLocalFactors, smooth affine models with connected fibres, finite-form L-group at README lines 37 and 533, levels with nilpotents at line 35, faithful-representation truncations at line 398, LanglandsParameterStacks) and the prose paragraphs. No sentence is contradicted. AutomorphicSpectralTheory, the supplier added at `ede1562`, is in the dependency list.
- Remark: `Suggested.lean` declares nothing (its docstring names each headline and the carrier it lacks); the description's "the Lean states only real-bodied definitions and theorems statable" is true of an empty list.
- Gate at this head (the worker's, with the targeted build): `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. Outside-folder diff against `origin/main`: empty. Diff `ede1562..de1f7c1`: one file, 1 insertion, 1 deletion.
- Dependency check output: `depcheck: 241 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean` with `lake env lean`: exit 0, no warning and no `sorry` (no declaration, so no `#check` comparison and no one-tactic probe to run).

Overlap check: read GeometricSatakeAndFusion, GlobalShtukasAndFunctionFieldLanglandsPartII, HeckeStacksAndLocalShtukas (boundaries as stated in Scope and ownership, untouched since `ede1562`); the change touches no shared object; `overlaps.md` lists no changed, dropped or revision-only id.

Source independence: changed passages only; 1 passage compared with 1 source (VL lines 5925–5941, French), no sentence translated clause by clause: the README states the hypotheses first, then defines the cover category by its objects and two conditions, where the source gives a two-item list; the contracted-product formula is forced. No layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- **Del73:** the settled uncertified source, cited by locator only; untouched by this diff.
- **The original 1997 printing behind README correction E5:** the correction is read in LL (pp. 31–32); the earlier printing was not opened. Untouched by this diff.
- Ownership against open pull requests whose files the brief does not give was not checked.
- The description's sentence on AI assistance (review and red-team round counts) describes the job board, not the folder; not checked.

## Source issues

- none

## For the human reviewers

- none
