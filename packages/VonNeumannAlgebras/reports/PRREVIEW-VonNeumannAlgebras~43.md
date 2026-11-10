# Review of VonNeumannAlgebras (pull request #1041 at 779e1be)

**Verdict:** accepted

Incremental re-review of the 18 lines changed since 0621c4c (two locator passages, no statement change). No finding remains; the gate passes.

## Previous findings

- R01 — repaired: README `:4128–4133` and the `HasPropertyGamma` docstring (`Suggested.lean:595–603`) now cite "the form of Anantharaman–Popa, Theorem 15.2.3(iv), p. 262; Jones, Definition 16.1.1, p. 107, defines Γ by a nontrivial central sequence", and the equivalence by Theorem 15.2.3 with Remarks 15.2.2.

The repair introduced no new problem: the diff touches prose and one docstring only, and the body of `HasPropertyGamma` (`Suggested.lean:604–608`) is byte-identical to the one the previous review read.

## Verified sound

**The changed passages, against the sources**
- anantharaman-popa line 11529 (PDF 268 = printed p. 262): Theorem 15.2.3, for a separable II₁ factor, (i) Property Gamma ⇔ (ii) ⇔ (iii) ⇔ (iv) a central sequence of unitaries `v_n` with `τ(v_n)=0` (lines 11531–11535). "Central" is defined at line 11503 as operator-norm bounded with `‖[y,x_i]‖₂→0` for every y, which is the Lean predicate's last clause. Locator and hypotheses agree with README `:4129` and the docstring.
- anantharaman-popa line 11513 (p. 262): the heading is "Remarks 15.2.2" (plural, as now cited); (b) is the finite-set form (line 11515), (c) the sequential form for separable M (line 11518). This supports "for the finite-set and sequential forms" at README `:4132–4133`.
- jones-vna lines 3364–3367 (p. 107): Definition 16.1.1 defines central sequences, trivial central sequences, and Γ by a central sequence; no unitaries, no trace-zero clause. The new wording "defines Γ by a nontrivial central sequence" is accurate.
- The other citation of §15.2 (README `:5167`, References) is a section-level entry and stays consistent with the new theorem-level locators.

**Gate, dependencies, build (run this round)**
- `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main`: every counter 0, `OK`.
- Dependency check output, no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
  ```

- `lake env lean` on `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`: exit 0, 32 "declaration uses `sorry`" warnings, nothing else (the same count as at 0621c4c).
- `git diff --stat origin/main...HEAD` outside the folder is empty. The diff 0621c4c → 779e1be is 10 insertions and 8 deletions in the two folder files.
- The elaborated signature of `HasPropertyGamma` (one explicit `M : VonNeumannAlgebra H`, with `[CompleteSpace H]`) is unchanged; no declaration was added, removed or renamed, so the previous round's `#check` comparison of all declarations and its one-tactic padding probe (all 32 theorems fail to close) stand.

**Overlaps and ownership**
- Overlap report at this head: no open pull request changes this folder, no cited id dropped, no id defined only by an open revision. The diff changes no id, section number, supplier or `*Needs:*` line, so the previous round's ownership and supplier checks carry over.

**Seeded sample (13.1, 13.2)**
- Neither target is touched by the diff. Their locators were read in full in the previous review (Hiai Theorem 6.5; Peterson Theorems 6.2.1, 6.3.8; Anantharaman–Popa 10.2.1–10.2.9, 10.3.1, 10.3.4, 11.1.1–11.1.3, 11.2.2, Corollary 11.2.4; Jones §16.2) and are carried forward.

**Adversarial table**

Changed passage (values recomputed this round):

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `HasPropertyGamma` with its new locator, Anantharaman–Popa 15.2.3(iv) | the source's own witness `v=2p−1`, `τ(p)=1/2`; `M₂(ℂ)`, `tr/2`; `R=⊗M₂`; Jones's form on the same data | `v*v=4p−4p+1=1`, `τ(v)=2·(1/2)−1=0`: unitary and trace zero, the two Lean clauses; `M₂`: a limit point is a central unitary λ1, `τ=λ`, `|λ|=1≠0`, predicate fails; R: `u_n=diag(1,−1)` at site n, `τ(u_n)=(1−1)/2=0`, `[u_n,y]=0` for y in sites `<n`, predicate holds; the same `u_n` has `‖u_n−τ(u_n)‖₂=1`, so it is a nontrivial central sequence in Jones's sense (the easy direction (iv)⇒(i)) | locator matches the predicate | none |
| README `:4131–4133`, equivalence with the finite-set and sequential forms | separable R; non-separable case | Remarks 15.2.2(b) holds with no separability, (c) and Theorem 15.2.3 assume M separable; README says "For separable II₁ factors": hypotheses agree | holds | none |

Rows carried forward unchanged from the review of 0621c4c (statements the diff leaves untouched; values are in that report's table): `rTensorCompletion`/`lTensorCompletion`, `spatialTensor`, `commutant_spatialTensor`, `isFiniteProjection_iff_modular`, `exists_starAlgEquiv_multiplicationAlgebra`, `nonempty_starAlgEquiv_spatialTensor_of_isTypeIIInfinity`, `leftRegular`/`groupVonNeumannAlgebra`, `isFactor_groupVonNeumannAlgebra_iff`, `exists_linearIsometryEquiv_withLp_of_generalPosition`, `not_hasPropertyGamma_groupVonNeumannAlgebra_freeGroup`, `hasPropertyGamma_of_isHyperfinite`, `tomiyama` (13.1), `IsInjective`/`IsHyperfinite`/`isInjective_iff_isHyperfinite` (13.2), the 13.2 Checks, uniqueness of the injective II₁ and II∞ factors (13.2), `tracialState_unique`/`exists_faithful_tracialState`, `double_commutant_iff_isClosed_image_ofCLM`, `dye`/`exists_unique_extension_of_finitelyAdditive`. All 19 rows: holds, no change.

**Remarks on untouched text (no change requested)**
- The branch still pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c` against main's `2fd255d9` and `1b1ccf4b`; this was settled in earlier rounds as outside the folder (the merge of main changes `lake-manifest.json`), and the previous review elaborated the file at main's pins.
- The pull-request description still describes the branch as a staged snapshot; it is not folder text.

## Not verifiable

- Uncertified and settled, cited by locator: Arveson 1969, Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- Jones, Definition 16.1.1: the cached extraction breaks off after "there is a central" (jones-vna line 3367). The definitions of central and trivial sequences before it are complete, which is what the new wording relies on.
- Texts cited outside the changed passages and not in the cache (Takesaki I–III, Sakai, and the others listed in the previous report) were not read this round.

## Source issues

- none
