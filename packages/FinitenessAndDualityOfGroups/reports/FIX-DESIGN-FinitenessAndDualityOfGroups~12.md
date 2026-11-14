# FIX-DESIGN-FinitenessAndDualityOfGroups~12

Review settled: `REV-DESIGN-FinitenessAndDualityOfGroups~11`. It has four findings, F01–F04, all P3.
All four were verified and repaired: two as asked, two in a more general or more exact form than the
review suggested.

Files changed:
- `packages/FinitenessAndDualityOfGroups/design/README.md`
- `packages/FinitenessAndDualityOfGroups/design/plan.json`
- `packages/FinitenessAndDualityOfGroups/sources.toml` (locators only; no new work cited)

The review's "For the human reviewers" section lists no finding, and nothing was changed because of
it.

## F01 (P3) — applied differently

Verified. The proof of BieriEckmann1973 Theorem 4.6 (lines 625–643) uses two inputs that 6.4 did
not list:
- the homology of a directed union of subgroups (lines 626–628);
- Shapiro's lemma in permutation-module form (line 638).

The proof also needs finite generation as `FP_1`. BieriEckmann1974 Proposition 3.2 (lines 288–295)
takes "finitely generated" as condition (i), and here that condition is 1.4(b). So 1.4 was missing
from 6.4 as well as from 6.2. The review's repair added it only to 6.2.

Old → new:
- **6.4 Needs.** Old: "6.1–6.3, 1.5, 2.1". New: "6.1–6.3, 1.4, 1.5, 2.1; CohomologyOfGroups §1.4;
  Tau Ceti `TauCeti.groupHomology.isZero_groupHomology_of_directed`".
- **6.4 route.** It now says which input gives each step.
- **6.2 Needs.** Adds 1.4 and CohomologyOfGroups §1.4.
- **Layer 6 Dependencies.** Updated to match.
- **Tau Ceti contract.** The pinned lemma now has its own bullet.

Why this differs from the suggested repair:
1. **Pinned lemma instead of SchemeKTheoryOperations §6.7.** The step only needs "`Hₙ(G, ℤ_sgn) ≠ 0`
   forces `Hₙ(S, ℤ_sgn) ≠ 0` for some finitely generated `S`". That is the contrapositive of the
   pinned `TauCeti.groupHomology.isZero_groupHomology_of_directed`
   (`TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean` line 132). It was
   already in the contract, and its family is the directed family of finitely generated subgroups.
   A pinned declaration blocks nobody, while §6.7 is an open roadmap.
2. **CohomologyOfGroups §1.4 instead of bare `groupHomology.indIso`.** `indIso` gives
   `Hₙ(G, Ind_S^G Res ℤ_sgn)`. The route needs `Hₙ(G, ℤ[G/S] ⊗ ℤ_sgn)`. CohomologyOfGroups §1.4
   (its line 666) states `Hₙ(G, k[G ⧸ H] ⊗ M) ≅ Hₙ(H, M)` directly.

Same pattern elsewhere:
- **6.2(e) and 6.3(b).** Both use "the homology of an induced module vanishes in positive degrees"
  (BieriEckmann1973 Lemma 1.3). This is CohomologyOfGroups §1.4 for a free `G`-set. Both Needs lines
  now list it, and the 6.3 route says so.
- **2.5(a).** It already cites SchemeKTheoryOperations §6.7 and is unchanged (see "For the
  maintainer").

## F02 (P3) — applied

Verified. The README cites BrownGTM87 22 times, at §§III.10, VI.3, VIII.2, 3, 5, 6, 7, 11, IX.2,
X.2 and X.3. The manifest locator lacked III and VI and listed IX §§6–7 and 9, which nothing cites.

Old → new:
- **Old:** "Ch. VIII §§2-11; Ch. IX §§2, 6-7, 9; Ch. X §§2-3".
- **New:** "Ch. III §10; Ch. VI §3; Ch. VIII §§2-3, 5-7, 11; Ch. IX §2; Ch. X §§2-3".

This lists exactly the cited sections: §§VIII.4 and 8–10 are cited nowhere, so they are not in it.
`cited_for` needed no change.

Same pattern elsewhere: three certified entries had locators that missed sections the README
cites.
- **BieriEckmann1973.** Added Propositions 1.2, 1.6, 2.1–2.2, Lemma 1.3, Theorem 4.2 and §4.1.
- **BieriEckmann1974.** Added Lemma 1.1 and §§3.2–3.3. Dropped Theorem 3.1, which is cited nowhere.
- **Brown1975.** Added the Corollary of Theorem 1, Lemma 1 and §3.

Each addition was checked in the cached text: Brown1975 Lemma 1 is at line 105 and §3 at line 216;
BieriEckmann1973 §4.1 is at lines 540–544.

## F03 (P3) — applied differently

Verified. Read alone, the 8.9 bullet "acts on an acyclic simplicial complex with finitely many
orbits … finite stabilizers … then virtually of type `FL`" lacks a hypothesis. The conclusion forces
virtual torsion-freeness: a finite-index subgroup of type `FL` has finite `cd_ℤ`, hence is
torsion-free (2.7). So no hypothesis-free version can hold where that fails. Deligne's extensions,
as the review says, are such a case; that example is cited, not recomputed here.

Old → new:
- **Old:** "If `G` acts on …".
- **New:** "If `G` is virtually torsion-free and acts on …"; a torsion-free normal `Γ'` of finite
  index then acts freely, so `G` is virtually `FL` and of finite homological type (4.4), and 8.7
  applies.
- **Locator:** Brown1974 Proposition 4, lines 558–563 (same hypothesis).
- **Check added:** the amalgam acting on its tree.

Why this differs from the suggested repair: the review proposed "has finite homological type".
That hypothesis implies virtual torsion-freeness (4.1), and it presupposes part of what the bullet
concludes. The weaker hypothesis is the source's and is sufficient. plan.json target 8.9 was updated
to match and gained the test `SL2_tree_action`.

Same pattern elsewhere: no other statement draws a virtual-type conclusion from an action. The 5.4
Checks and the Layer 5 Examples assume `vcd < ⊤`.

## F04 (P3) — applied

Verified at Tau Ceti `2fd255d9`, with one correction. The CW structure is
`AbstractSimplicialComplex.realizationCWComplex`, in the root namespace
(`…/Realization/CWComplex/Basic.lean` lines 43 and 172), not `TauCeti.realizationCWComplex` as the
review writes. `TauCeti.cellularChainComplexRealizationIso` (`…/OrderedChainComplex.lean` line 132)
is correct.

Old → new:
- **Tau Ceti contract.** New bullet: both declarations and `TauCeti.orderedSimplicialChainComplex`,
  with binders (`ι : Type u` linearly ordered, `R : Type u`).
- **5.4(a).** A second route builds `W` from `K_≤` (weakly increasing vertex strings spanning
  faces), with no nerve comparison or subdivision.
- **Also:** 5.4 Needs, Layer 5 Dependencies, plan prerequisites and tests.
- **Checks recomputed:** edge `(2, 1)`, `χ = 1`; `∂Δ²` `(3, 3)`, `H₁ = ℤ`.

The original route, gap:order-complex-nerve-realization and the contract sentence "nothing at the
pins compares either with the realization of a simplicial set" are kept, and the sentence is still
true.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed (each side) | Result / change |
|---|---|---|---|
| 6.4(b) route, directed-union step | `n = 0`, `G = 1`; `n = 1`, `G = ℤ`, `sgn = 1`; `G = ℚ` (hypotheses fail) | `G = 1`: `H₀(1, ℤ) = ℤ = H⁰`, `S = 1` index 1. `ℤ`: `H₁(ℤ, ℤ) = ℤ`, `S = ℤ`. `ℚ`: `H₁(ℚ, ℤ) = ℚ ≠ ℤ = H⁰(ℚ, ℤ)`, so the hypotheses fail; still every cyclic `S` has `H₁(S) = ℤ ≠ 0`, consistent with the lemma | holds; lemma binders `{k G : Type u}`, `ι = Finset G` nonempty, closures directed with supremum `⊤` |
| 6.4(b), `n = 0` | `G` finite nontrivial, `sgn = 1` | `S = 1`: `H₀(G, ℤ[G]) = ℤ ≅ H⁰(G, ℤ[G]) = ℤ·Σg` needs `G` finite; then `cd_ℤ G = 0` forces `G = 1` (2.7) | holds; only `G = 1`, the PD group of dimension 0 over `ℤ` |
| 6.4(b), Shapiro step | `S` of infinite index (e.g. `S = 1 ≤ ℤ`) | `H₀(ℤ, ℤ[ℤ]) = ℤ` (coinvariants), `H⁰(ℤ, ℤ[ℤ]) = 0` (invariants of an infinite orbit) | the abstract isomorphism would give `ℤ ≅ 0`, so infinite index is excluded |
| 6.4(b), `FP_1` and 1.5(e) | `k = 0`: `∏ℤG → ∏ℤ`; `k ≥ 1`: both sides | bijective at `k = 0` by `FP_1` (1.5 with `n = 1`); for `k ≥ 1`, `0 → 0` | 1.5(e) holds in every degree |
| 6.2(e), 6.3(b), free `G`-set | `X = G`; `X = G × I`; `X = ∅` | `Hⱼ(G, k[G] ⊗ M) ≅ Hⱼ(1, M) = 0` for `j > 0`; direct sum over `I` of zeros; `F = 0` gives `0` | holds |
| 6.2(d), `FP_1` | `R = 0` (excluded); `R = ℤ`, `G = ℤ` | over `0` every group is `FP_1` (1.4 Check); `ℤ` is generated by `t` | 1.4(b) needs `R` nontrivial, which 6.2 assumes |
| Contract: directed-union lemma | `G = 1`, `S = ⊤`; `ℚ = ⋃ (1/i!)ℤ` | trivial; `H₁` of the members is `ℤ`, so the lemma's hypothesis fails, consistent with `H₁(ℚ) = ℚ` | statement matches the pin (line 132); colimit half absent, as stated |
| Contract: CW structure and iso | `K` a vertex; `K` an edge; `K = ∂Δ²` | cells `(1)`; `(2, 1)`; `(3, 3)`; boundary `[a, b] ↦ [b] − [a]` (`j = 0` deletes `a`) | matches the pinned docstring (sign `(−1)ʲ`, unit `sₙ`) |
| 5.4 second route, `K_≤` | `K` a vertex; an edge; `∂Δ²`; `dim K = N` | point; ranks `(2, 1)`, `χ = 1`; `(3, 3)` with `H₀ = H₁ = ℤ` (boundary rank 2, cycle `[0,1] + [1,2] − [0,2]`); nondegenerate means strictly increasing means a face, so dimension `≤ N` | holds; Checks extended |
| 5.4 `K_≤`, wrong model | all strings instead of weakly increasing ones | an edge gets nondegenerate `(0,1)`, `(1,0)`, `(0,1,0)`, …, so it is infinite-dimensional; strict strings alone have no degeneracies | weakly increasing is forced |
| 8.9 bullet (new hypothesis) | `G` finite on a point; `ℤ/2 × ℤ` on the line (`s` trivial); `D_∞` on its tree; `ℤ/4 ∗_{ℤ/2} ℤ/6` on its tree | `1/|G|`, `m_C = |G|`; `1/2 − 1/2 = 0 = χ`; `1/2 + 1/2 − 1 = 0`, `Γ' = ℤ` with `2/2 + 2/2 = 2` vertex and `2` edge orbits; `−1/12`, `Γ'` with `5` vertex and `6` edge orbits, `χ = −1` | holds; Check added |
| 8.9 bullet, necessity | group with no torsion-free finite-index subgroup | virtually `FL` gives finite `cd_ℤ` on a finite-index subgroup, hence torsion-free (2.7): contradiction | hypothesis necessary |
| 8.9 bullet, `C` form | `C_p = ⊕ Ind_{G_σ}^G(ℤ_σ)`, `Γ'` normal torsion-free | Mackey: `Res_{Γ'} Ind_{G_σ}^G = ⊕_{Γ'gG_σ} Ind_{Γ' ∩ gG_σg⁻¹}^{Γ'} = ⊕ ℤΓ'`, at most `[G : Γ']` summands | finite free resolution of finite type |
| BrownGTM87 locator | all 22 README occurrences | III.10, VI.3, VIII.2, 3, 5, 6, 7, 11, IX.2, X.2, X.3 each inside the new locator; nothing outside it | matches |

## Checks run

Dependency check, as prescribed:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

- **Citation resolver.** `roadmaps resolve` gives the same five leads as before this round and no
  missing Lean name. They are:
  - CohomologyOfGroups §4.6 and MotivicStructuresInModuliOfCurves §2.1, which are board packages;
  - three source locators misread as roadmap names.
- **Pinned names that the tool could not check.** Each name added this round was opened at Tau Ceti
  `2fd255d9`:
  - `TauCeti.groupHomology.isZero_groupHomology_of_directed` (`DirectedUnion.lean` line 132)
  - `AbstractSimplicialComplex.realizationCWComplex` (`Realization/CWComplex/Basic.lean` line 172,
    root namespace)
  - `TauCeti.cellularChainComplexRealizationIso` (`OrderedChainComplex.lean` line 132)
  - `TauCeti.orderedSimplicialChainComplex` (`SimplicialComplex/ChainComplex.lean` line 186)

  `Realization K` is Hausdorff by `instT2SpaceRealization` (`Realization/Basic.lean` line 204), as
  `TauCeti.cellularResolutionOfIsAspherical` requires of `B`.
- **Not run.** There is no `Suggested.lean` at the design stage, so no `#check` comparison and no
  elaboration were run. plan.json parses, and its formatting round-trips unchanged.
- **Process words.** A search of the README for process words, machine paths and LaTeX delimiters
  returned nothing.
- **Ownership.** No new object is owned:
  - `K_≤` is a construction inside a route, not a target;
  - the directed-union vanishing is pinned;
  - CohomologyOfGroups §1.4 was already a supplier, with its contract bullet and plan section in
    place.

  So ownership against open pull requests needed no new search.

## For the maintainer

- **2.5(a) could drop an open supplier.** 2.5(a) cites SchemeKTheoryOperations §6.7 (an open
  roadmap) for `hd_R G = sup_i hd_R G_i`. The inequality `≤` needs only the pinned vanishing lemma
  now in the contract, and `≥` is 2.3(a). Switching would remove SchemeKTheoryOperations as a
  supplier. It was not done here, since no finding raises it and the citation is valid.
- **The gap is no longer on the only path.** With the second route of 5.4(a),
  `gap:order-complex-nerve-realization` (AlgebraicTopology §4.7) no longer blocks 5.4. The gap
  stays declared because the first route still uses it.
- **No id changed.** No target, section or plan name changed, and no supplier was added.
- **Review text.** No suspicious instructions were found in it.
