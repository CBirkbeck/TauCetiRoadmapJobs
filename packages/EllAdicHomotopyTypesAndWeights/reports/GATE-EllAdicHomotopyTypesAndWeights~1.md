# GATE-EllAdicHomotopyTypesAndWeights~1: answers to the review of b61fda1

One review (CBirkbeck, 2026-10-27), split into seven points. H01–H04 come from its Finding 1, H05 from Finding 2, H06 from Finding 3 and H07 from Finding 4. Repairs are in commit `ce640e6` on top of `b61fda1`. Only `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md` changed.

## H01 (CBirkbeck) — disputed

AlgebraicTopologyPartII is a roadmap package on the design board. It is line 110 of the merge order (this roadmap is line 318), and its review is accepted. Its Layer 4, "tame fibres and rational homotopy" (§§4.4 rational homotopy of spheres, 4.6 rational double-loop model), is the rational-homotopy direction that the five `gap:` contracts extend, and the board's acceptance of this roadmap lists those five slugs as conditional gaps on that supplier. Nothing has to move, because no roadmap on main or in any open pull request owns Sullivan models, polynomial forms or Hirsch extensions: `roadmaps grep -i 'sullivan (minimal )?model|minimal sullivan|polynomial (differential )?forms|A_PL|Hirsch extension'` matches only this roadmap. The reviewer looked only at the roadmap repository, where board packages do not appear yet. No change.

## H02 (CBirkbeck) — applied differently

EtaleHomotopyTypes is also a board package earlier in the merge order (line 299). Its design has §EH.0 "Local-coefficient detection", §EH.3 "Rigid hypercovers of simplicial schemes", "Rigid étale topological type" and "Cohomology of the rigid étale type", and §EH.6 "Betti–étale comparison zigzag", which are the sections cited here. The overlap with AnabelianGeometryAndNonabelianChabauty §1.5 is real but does not affect what this roadmap consumes. §1.5 builds the raw pointed type only as an object of the homotopy category of pointed pro-spaces. The form functor Ω needs a strict pro-simplicial object with strict refinement maps, so only the rigid object can serve. Change: README.md line 13 (Scope) gains the sentence "AnabelianGeometryAndNonabelianChabauty §1.5 constructs the raw pointed étale homotopy type as an object of the homotopy category of pointed pro-spaces; the form functor needs a strict pro-simplicial representative … no target here uses §1.5." Which of those two roadmaps owns the raw type is a matter between them; this roadmap cites neither for it.

## H03 (CBirkbeck) — answered

MixedHodgeModulesAndIrregularHodgeTheory is a design-board package at merge-order line 270. Its Layer H.1 has `H.1/operations` ("Derived Hodge-module operations") and `H.1/weight-bounds` ("Weight bounds and duality"), with the standing convention of algebraic maps between quasi-projective varieties. That matches the Scope sentence on line 13, which only marks the boundary: this roadmap does not consume it. No change.

## H04 (CBirkbeck) — answered

The pull-request description is not part of the roadmap files; the worker maintains it. The README follows the house rule of citing suppliers by roadmap name and section, never by pull-request number, so no table of pull-request numbers belongs in it.

## H05 (CBirkbeck) — applied differently

The reviewer is right. In Weil II (5.2.4) (weil-II line 3835), the targets are Čech nerves of single étale covers, and a degree-zero lift determines a map into a Čech nerve. Deligne's hypercover remark (weil-II line 3813) does not supply the matching lifts. A new Check in §4.3 exhibits the failure: for a 1-coskeletal hypercover of 𝔾_m whose degree-one piece over one off-diagonal copy is the connected double cover, there are exactly 2·2=4 simplicial maps with the same degree-zero lift from the two-arc cover. The repair keeps general hypercovers, because a Čech presentation would need Artin's Čech-equals-étale theorem, which holds only when every finite set of points lies in an affine open. That would narrow the domain below separated finite type. The changes are:

- The `finite-component-etale-presentation` contract (line 91) now asks for an ℕ-indexed tower U^α of finite-type étale hypercovers whose transition maps are relative hypercovers. Such a tower exists: take U^(α+1)=W×_X U^α for the next hypercover W in a countable cofinal enumeration. Each map (W×U)_n → U_n ×_(M_nU) M_n(W×U) = M_nW ×_X U_n is a base change of W_n→M_nW.
- `compatible-good-cover-refinement` (line 101) now asks for a tower of open hypercovers V^α of X(C) with contractible pieces and simplicial maps V^α→U^α(C) whose squares commute strictly. The maps are built by lifting through the analytified matching maps, which are surjective local homeomorphisms. The analytic fibre product V^α×_(U^α(C))U^(α+1)(C) is again a local-homeomorphism hypercover, because the transitions are relative hypercovers. The contract also asks for the zigzag π₀V^α←diag Sing V^α→Sing X(C), citing Dugger–Isaksen Theorem 1.2 (dugger-isaksen line 57).
- §4.3 (title, statement, proof, new Check) and the §4.4 proof are rewritten to use these. The AlgebraicTopology contract (line 55) now says "nerve theorem for open hypercovers with contractible pieces".

## H06 (CBirkbeck) — applied

New target §8.3a, "Minimal presentations of the dual Lie tower", owned here: `roadmaps grep` finds no owner for presentations of pronilpotent Lie algebras, and AnabelianGeometryAndNonabelianChabauty §§2.1–2.3 has none. For F̂(V)→u with kernel I ⊆ cl[F̂,F̂], it states three things:

- H²(M^(1)) ≅ (I/cl[F̂,I])^∨_cont. This uses that each finite stage Λ(V_n) of §8.3 is the Chevalley–Eilenberg algebra of u_n, so H²(M^(1)) is the colimit of the stage cohomologies.
- Closed-ideal generation by any subspace whose image is dense.
- A graded form: cofinality of the weight and lower-central filtrations, weight w ↔ Lie weight −w, and u≅(L(V)/(R))^∧.

It cites Morgan Theorem 9.4, proof (morgan line 2270), and has five Checks with computed values. In §8.5 the proof now restricts §8.1's grading to the subalgebra generated by M¹, proves its degree-one weight pieces are finite-dimensional (dim M¹_w ≤ dim H¹_w + dim Λ²(M¹_(<w))_w), and applies §8.3a before the weight bounds. Its Needs line adds §8.3a and §6.5.

## H07 (CBirkbeck) — answered

That is correct as a description of the file. `Suggested.lean` contains `import Mathlib`, a docstring naming every headline theorem with the carrier it lacks at the pins, and an empty namespace. It has no declarations and no `sorry`, so its build checks only that the module and docstring elaborate. The pull-request description should say this; the worker edits that text. The file is unchanged: the new §8.3a is an intermediate algebraic target, not a headline, and is not statable at the pins either, since Mathlib's `Mathlib/Algebra/Lie/Cochain.lean` has low-degree cochains and `twoCocycle` but no cohomology quotient.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Relative-hypercover tower exists (contract l.91) | U^(α+1)=W×_X U^α; X=Spec k | matching map = base change of W_n→M_nW, étale surjective; Spec k: all π₀ finite | true | — |
| Strict analytic tower (contract l.101) | P=V^α×_(U^α(C))U^(α+1)(C) | P_n→M_nP factors as two base changes of surjective local homeos | true | — |
| Degree-zero lift insufficient (Check §4.3) | 1-coskeletal U on 𝔾_m, two-arc cover | 2 components of A∩B × 2 sheets = 4 maps; Čech target: 1 | Check added | added |
| Nerve zigzag | contractible pieces; two geometric points | π₀V ≃ diag Sing V levelwise; H⁰ rank 2 both sides | true | — |
| §8.3a duality, elliptic Λ(a,b) | d=0 | I/cl[F̂,I]=Γ₂/Γ₃, dim 1; H²=⟨ab⟩, dim 1; weights −2 ↔ 2 | agrees | Check |
| §8.3a duality, Heisenberg Λ(a,b,c), dc=ab | weights 1,1,2 | H²=⟨ac,bc⟩ dim 2; Γ₃/Γ₄ dim 2 (Lyndon words of length 3); weights −3 ↔ 3 | agrees | Check |
| §8.3a, free (ℙ¹ minus 3 points) | 1-minimal free | H²(M^(1))=0, I=0 | agrees | Check |
| Wrong model I/cl[I,I] | Λ(a,b) | dim ≥3 in weights −2,−3 vs H² dim 1 | excluded | negative Check |
| Minimality hypothesis | generators A,B,D, D↦0 | I/cl[F̂,I]=⟨D,[A,B]⟩ dim 2 vs 1 | hypothesis needed | negative Check |
| Weight pieces of M¹ finite (§8.5) | 𝔾_m; elliptic; Heisenberg | dims (w=2:1); (w=1:2); (w=1:2, w=2:1) ≤ bound | true | added sentence |
| §8.5 weight range | elliptic | R=⟨[a,b]⟩ weight −2 ∈ [−4,−2] | agrees with existing Check | — |
| H² injection of ⟨M¹⟩ | ℙ¹ | ⟨M¹⟩=K, H²: 0→K injective | true | — |

Context: Suggested.lean has no declarations, so the `#check @name` comparison was not needed; the file is unchanged.

## Ownership, citations, sources

- Ownership was checked against open pull requests through `roadmaps grep` over main and all 359 open heads, and against the board packages by reading AlgebraicTopologyPartII, EtaleHomotopyTypes and MixedHodgeModulesAndIrregularHodgeTheory directly. `roadmaps resolve` still lists those three as "found nowhere". That is a false positive of the resolver, which does not index board packages: all three are earlier in the merge order and have the cited sections.
- New source `dugger-isaksen` (Dugger–Isaksen, *Topological hypercovers and A¹-realizations*, Math. Z. 246 (2004), arXiv math/0111287v1). It was fetched through the sources service as open-repository text and is cited as Theorem 1.2, dugger-isaksen line 57. This job does not edit the manifest, so the worker must add its `sources.toml` entry: locator_scheme theorem, locator "Theorem 1.2", cited_for ["4.3", "Exact supplier contracts"]. No text is missing and no `needs-references.toml` was written.

## Build and gate

- `lake build TauCetiRoadmap.EllAdicHomotopyTypesAndWeights.Suggested`: `Build completed successfully (8976 jobs).`
- Gate at `ce640e6`: `gate EllAdicHomotopyTypesAndWeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 154 roadmaps, 1046 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
