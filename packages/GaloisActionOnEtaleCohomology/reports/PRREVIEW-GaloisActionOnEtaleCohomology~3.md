# Review of GaloisActionOnEtaleCohomology (pull request #2271 at 1947660)

**Verdict:** accepted

No findings. This is an incremental re-review: the folder has 0 changed lines since `1947660`, and this round read the pull request's title and description against that head.

## Previous findings

- The previous review, of `1947660`, had no findings; nothing to carry.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.2 end theorem, `exists_galois_continuousAut_equiv` (cited by the description as the one Lean headline) | `K` algebraically closed; `K = ℚ_3`, `σ(√3) = −√3`; `K = 𝔽_p((t))`; `S₃` on the splitting field of `T³ − 2` over `ℚ_2` | `G_K = 1`, `C = K`, only `id`; `σ̂ ≠ id`, isometric; `σ̂` fixes `t^{1/p}`, so bijection holds through `K^sep`; `e(στ) = e σ ∘ e τ` matches Mathlib's `(σ * τ) x = σ (τ x)`, the reversed order differs on `2^{1/3}` | holds; elaborated type has all three instance binders | none |
| §4.4 (c) with `ℓ = char K` (cited by the description: Artin–Schreier, coherent cohomology, semilinear algebra) | `Y` an elliptic curve over `K̄`, `char = p`: supersingular, ordinary; degree 1 | `H¹(𝒪) = K̄`; `F = 0`: `ker(F − 1) = 0`, so `H¹(𝔽_p) = 0`; `F` bijective: kernel `𝔽_p`, dimension 1 ≤ 1; both agree with the `p`-rank | holds; bound sharp | none |

Rows for untouched statements stand as in the previous review, of `1947660`.

- Pull request text against the head, 14 claims checked, none contradicted: the field hypotheses (README Conventions, line 47); the functoriality list (Summary); the three named consumers (README lines 559–561); arbitrary `Λ`, unbounded complexes, commutativity for cup products (Conventions, §1.1); torsion retained in the carrier (`TauCeti.ContinuousRep` contract); residue-characteristic torsion in §4.2; the characteristic-p route and `j = 0` in §4.4 (c); the invertibility qualifier on the projective-space Check; the one Lean headline and its docstring; the three files of the folder.
- The change the text must state: it adds a roadmap (not on main at `8ad4192`; 721 insertions, 0 deletions, 41 headings and 3 Lean declarations added, none removed), and the title and description say so; no section, declaration or supplier is removed.
- Gate, run again at `1947660`: every check 0, OK, as in the worker's record including the targeted build. `lake env lean` on `Suggested.lean`: one `sorry` warning at line 120, nothing else. The 3 elaborated signatures are unchanged and none lost a binder.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line. Files changed outside the folder: 0.
- Cross-roadmap citations: the resolver lists none as found nowhere; the 16 unresolved Lean names are suppliers' planned names, none of this roadmap's own. Supplier folders confirmed on main: AdicEtaleGeometry, AdicSpacesPartII, AdicSpacesPartIV, SchemeAndStackFoundations, EtaleCohomologyFoundations, ProfiniteCohomology, EnhancedDerivedSheaves, DiamondsAndVStacks, JacobianChallenge; the open suppliers are in the merge order before this roadmap.
- Source locators: no passage changed, so the seeded sample falls on no changed text; no locator re-read this round.
- Declared gap `gap:proper-rigid-finiteness`: untouched, same slug and wording in the README (line 104 and §4.4 (d)).
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped, no second copy on main; no `Suggested.lean` at an open head or on main declares `SpectralAlgClosure`, `CompletedAlgClosure` or `exists_galois_continuousAut_equiv`.

Overlap check: read ClassicalAdicEtaleCohomology, DiamondEtaleCohomology, AdicCoefficientsAndComparisons, ProetaleCohomologyOfPAdicCurvesAndTowers (open) and EtaleCohomologyFoundations, AdicSpacesPartIV, AdicEtaleGeometry (main); nothing shared. ClassicalAdicEtaleCohomology's `G_η`-action is on nearby cycles over a henselian valuation ring, a different object; the others use a completed algebraic closure without constructing the Galois action on it.

Source independence: changed passages only; 0 passages changed, so 0 compared; largest share stacks03N1, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- huber1996, huber1994, sga4half, serreGC1997: settled as uncertified, no readable text; nothing changed adds a locator into them.

## Source issues

- none

## For the human reviewers

- none
