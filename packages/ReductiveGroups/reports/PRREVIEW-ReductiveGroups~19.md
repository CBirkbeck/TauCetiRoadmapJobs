# Review of ReductiveGroups (pull request #1676 at 92ab639)

**Verdict:** accepted

Incremental re-review of the 6 lines changed since 83157e1 (3 insertions, 3 deletions, two files, nothing outside the folder). The change repairs the single finding of the previous review and introduces nothing new. No finding remains, the gate passes with the build, and the adversarial rows for the touched statement are recomputed below.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/ReductiveGroups/README.md:1179` now reads "isomorphism (McNinch §3.1, p. 6; in characteristic `p` the Greenberg transform of `SL₂` … McNinch (3.2.1), p. 7)"; `README.md:3702` "§3.1, p. 6; (3.2.1), p. 7"; `Suggested.lean:195` "§3.1, p. 6".

The repair was tested against the text: `mcninch` line 230 is the page-6 marker, line 236 opens §3.1 "Definitions and first remarks", lines 237–243 give the definition (a closed `k`-subgroup `M` with `M ⋉ R → G` an isomorphism, hence `M → G/R` an isomorphism), and lines 244–252 state that linear algebraic groups in characteristic zero always have a Levi decomposition, with conjugacy under the unipotent radical. The second locator is unchanged and correct: line 278 is the page-7 marker, line 280 is (3.2.1), and Remark (a) at line 282 names `SL₂(W₂)`. §1.1 (line 29, page 1) is no longer cited for the definition. The repair introduced no new problem: the three passages are otherwise byte-identical to the previous head, the Lean statement of `exists_levi_complement` (lines 198–206) is untouched, and the section list at `README.md:1298` ("§§2.2–2.3, 3.1, 4.1, 4.3–4.5, 5.1–5.2") still matches `mcninch` lines 138, 169, 236, 330, 399, 421, 448, 485, 507. The References entry now names §3.1 twice (once with the page, once in the section list); that is redundant but not wrong, and needs no change.

## Verified sound

**Scope of this round.** Head `92ab639b300b9781fa689e21429040d884a38d04`; worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty. The diff of the folder touches only the McNinch locator in three places (README lines 1179 and 3702, `Suggested.lean` line 195); every other line of both files is as the previous review read it. The pull-request description describes an older state of the branch (companion modules, an SL coordinate dictionary) that the folder no longer contains; it is data and was not relied on.

**Gate.** Rerun on this head with the Lake build and the board's merge order:

```text
gate ReductiveGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Dependency check** (`--movable`, against the content checkout and the board's `ORDER.txt`):

```text
depcheck: 235 roadmaps, 2063 edges, 0 problem(s)
```

No UPWARD or CYCLE line. (The previous round reported 203 roadmaps and 1660 edges; the difference is growth of the index, not of this README, whose `*Needs:*` lines and supplier citations are unchanged.)

**Elaboration.** `lake env lean` on `TauCetiRoadmap/ReductiveGroups/Suggested.lean` from the worktree: exit 0, exactly **12 `sorry` warnings** (lines 121, 130, 141, 150, 160, 181, 198, 214, 227, 249, 297, 303) and no other output, the same lines as the previous round. Pins of the worktree's `lake-manifest.json`: Tau Ceti `a91d3aaf…`, Mathlib `6b7abb3c…` (unchanged since the previous review). The file still has the single `import Mathlib` followed by ten `TauCeti.*` modules, no `set_option`, no sorry'd data. The elaborated signatures are unchanged from the previous round's `#check` run (the diff touches only a docstring), so the binder audit was not repeated; `exists_levi_complement` still carries `[CharZero k]`, `Algebra.Smooth k H` and `geometricallyConnectedCommHopfAlgProperty k H.obj` in its own signature (lines 198–201).

**Seeded sample.** The three sampled targets (1.1 Rational cohomology and algebraic induction; 8.1 Split reductive data; 8.2 Pinnings) lie outside the changed passages: their text, locators and Lean statements are byte-identical to the head the previous review read. The previous report's verification of them is carried forward (Jantzen §2.8 pp. 36–38, §3.9 p. 60, §§4.14–4.16 pp. 77–79, §§3.3–3.7 pp. 52–57; Conrad Definition 5.1.1 p. 136, Definition 6.1.1 and Remark 6.1.2 pp. 186–187; see PRREVIEW-ReductiveGroups~18). The only locator the diff changes, McNinch §3.1 p. 6, was read this round at `mcninch` lines 230–252. The README flags no locator as unverified. No manifest was edited.

**Adversarial table.** Rows for the one statement the diff touches (`exists_levi_complement`, whose docstring changed) were recomputed this round; every other row of the previous report's table is carried forward unchanged, since the diff leaves those statements untouched (PRREVIEW-ReductiveGroups~18, "Adversarial calculations", 93 rows).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6A Levi headline: Borel of SL₂ over ℚ | `B` = upper triangular, `O(B) = k[a,a⁻¹,b]` | `R_u = {[[1,c],[0,1]]}`, `I_u = (a−1)`; right translation `[[a,b],[0,a⁻¹]]·[[1,c],[0,1]] = [[a,ac+b],[0,a⁻¹]]`, so right `I_u`-coinvariants `= k[a,a⁻¹]`; `J = (b)`, `O(B)/J = k[a,a⁻¹]`, composite the identity, bijective | Pass; headline instance |
| 6A Levi headline: wrong `J` on the same instance | `J = (a−1)` | `O(B)/J = k[b]`; composite `k[a,a⁻¹] → k[b]` sends `a ↦ 1`, kernel `(a−1) ≠ 0`, not injective; `J = (a−1)` is a Hopf ideal (it cuts out `R_u`), so the statement is not satisfied by every Hopf ideal | Pass (excludes the "take any `J`" model) |
| 6A Levi headline: McNinch's definition versus the coordinate form | `M ⋉ R → G` iso (mcninch 237–240) vs `O(Q) → O(G)/J` bijective | `M → G/R` iso (mcninch 242) ⇔ `O(G/R) → O(M)` iso; conversely from `L ≅ Q` the inverse of `L × R_u → G` is `g ↦ (s(q(g)), s(q(g))⁻¹ g)` with `ker(G(A) → Q(A)) = R_u(A)` (README 1172–1174) | Pass |
| 6A Levi headline: the characteristic hypothesis | `SL₂(W₂)` over `𝔽_p` | mcninch 280–281: reductive quotient `SL₂`, no Levi decomposition; excluded by `[CharZero k]` at `Suggested.lean:198` | Pass (source read) |
| 6A Levi headline: trivial, `𝔾_a`, `𝔾_m`, `𝔾_a ⋊ 𝔾_m` | as in the previous report | `J = 0, (t), 0`, ideal of the `𝔾_a` factor; composites bijective | Pass (carried from ~18) |
| All other statements (Layers 0–5P, 6, 6B, 7–7f, 8, 9A–9E, 10, 11, SL presentation) | as in the previous report | unchanged text and Lean; values as recorded there | Pass (carried from ~18) |

**Pinned-library and supplier audit.** No library name, `*Needs:*` line, supplier citation or cross-roadmap citation changed in the diff; the previous round's resolutions stand (SchemeAndStackFoundations, ModularCurves, RootSystems, LieHighestWeight, LieGroups, SmoothBundlesConnections, InductionRestriction, GroebnerGeometry, AlgebraicVectorBundles, AlgebraicTopology, DGFloer, ReflectionInvariantTheory, IntegralLattices, ReductiveGroupsPartII on main; IntegralHeckeAndGaloisDeterminants, ComplexComparisonPartII, AdelicAlgebraicGroups at their open heads, all consumers). The resolver's 23 leads are the same 22 `Suggested.lean` names plus `Gassmann.almostConjugate_iff_permutation_equiv`, as before; none is a missing dependency.

**Headlines and padding.** Unchanged since the previous round: twelve headlines stated, every other endpoint named in the module docstring with its missing carrier; the one-tactic probe of the previous round applies unchanged since no statement or definition body changed.

**Principles and shape.** The diff introduces no process word, pull-request number, LaTeX delimiter, local path, `set_option`, sorry'd data, copied passage or algorithm; the References entry stays in the house shape.

## Not verifiable

- Jantzen and Conrad were not re-read this round because the sampled targets lie outside the changed passages; their locators are carried from the previous report.
- Conrad–Feng Appendix F, Brieskorn, Salvetti, Callegaro, Fox–Neuwirth, Fadell–Neuwirth, SGA 3 Exposé XIX, Jantzen's 2003 edition, Waterhouse, Borel, Springer, Carter, Serre, Lang 1956, Steinberg 1968, Howlett–Lehrer, Dipper–Du, Gassmann and Conrad–Gabber–Prasad are cited by locator only, as before; none is in the seeded sample and none is touched by the diff.
- Ownership against open pull requests whose files this brief does not give was checked only through the roadmap index in the previous round; the diff states no new object.

## Source issues

- none
