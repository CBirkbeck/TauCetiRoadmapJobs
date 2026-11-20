# Review of NilpotentOrbits (pull request #2628 at a91852e)

**Verdict:** accepted

**Summary.** Accepted. The one small correction of the previous review is repaired: §2.2 now cites the pinned Tau Ceti declarations for the open orbit of `C_G(h)` on `𝔤(2)` and for the conjugacy of the nilpositive elements, and keeps as targets only what the pin lacks; the cited declarations say what the README says of them, with the hypotheses the contracts record. The description agrees with this head. There are no findings, no small corrections and no format notes, and nothing is left for a human to decide.

## Previous findings

- The previous report had no finding (R01, …).
- C01 (small correction) — repaired: "So the `C_G(h)`-orbit of `e` is open in `𝔤(2)` (`TauCeti.Comodule.isOpen_range_projectiveOrbitMap_mk_one_of_range_eq_top`)", §2.2 lines 440–446; *Needs:* lines 455–458; contracts lines 1351–1358; scope lines 1187–1189, 1197–1198, 1209–1210.

## Verified sound

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.2, open orbit of `C_G(h)` on `𝔤(2)` (pinned) | sl₂ standard triple; zero triple; pin | `C_G(h) = T`, `𝔤(2) = ℂe`, orbit `ℂ^×e` open; `h = 0`: `𝔤(2) = 0`, orbit a point; `Centralizer/Eigenspace.lean:190` needs `CharZero` only | true; pinned as cited |
| §2.2, conjugacy of nilpositive elements under `C_G(h)` (pinned) | sl₂, `e′ = ce`, `c ≠ 0`; pin | `diag(t, t⁻¹)` with `t² = c` carries `e` to `ce`; `Representation/Orbit.lean:278, 287`: alg. closed, finite type, `Module.Finite`, `CharZero`, as the contract says | true; pinned as cited |
| §2.2, target: `G(0) = C_G(λ)` is the identity component of `C_G(h)` | sl₂; sl₃ `h = diag(1, 0, −1)` | sl₂: both `T`; sl₃: `C_G(λ) = C_G(h) =` diagonal torus, Lie algebra `𝔤(0)` of dimension 2 on both sides | true |
| §2.2, target: equal dominant neutral element ⇒ conjugate | sl₃ (Check of §2.2) | `(2,2)`, `(1,1)`, `(0,0)`: three diagrams, three orbits; follows from the pinned conjugacy by a point of `C_G(h) ⊆ G` | true |
| DG07 §3, Lemma 3 and proof, p. 4 | DG07 lines 143–153 | stabilizer of `h` has Lie algebra `𝔤(0)`, stabilizes `𝔤(2)`; differential `u ↦ [u, x]` onto `𝔤(2)`; orbit dense; page 4 (marker at line 160) | locator supports |
| DG07 §2, p. 3 | DG07 lines 92–94 | same orbit iff same weighted diagram | locator supports |

The rows for the untouched statements stand as in the previous review, of `a982a9c`.

- Source locators read against the text: 2 (DG07 lines 92–94 and 143–153), both supporting the changed passage; no sampled section other than those of the previous review falls in the changed lines.
- Library declarations opened at the Tau Ceti pin: `IsSl2Triple.range_differential_flip_eigenspace_two_eq_top` (`Algebra/AlgebraicGroup/Tangent/Lie/Adjoint/Centralizer/Eigenspace.lean:190`), `TauCeti.Comodule.isOpen_range_projectiveOrbitMap_mk_one_of_range_eq_top` and `TauCeti.Comodule.exists_basePointsRepresentation_eq_of_range_eq_top` (`Algebra/AlgebraicGroup/Representation/Orbit.lean:278, 287`, variable block at `:211–212`), `TauCeti.centralizerHopfIdeal` (`Algebra/AlgebraicGroup/Tangent/Lie/Adjoint/Centralizer/Basic.lean:81`).
- Cross-roadmap citations: the diff adds none; no supplier added or dropped.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2203 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives nine `sorry` warnings and nothing else; the diff changes no Lean statement.
- The description against the head: revision of a roadmap on main, old labels mapped by the table at README lines 1237–1240, 22 removed declarations accounted for in three groups, thirteen supplier subsections as listed, `import Mathlib` and five Tau Ceti modules, 54 Checks in 30 sections (counted), the library list with "the open orbit of the centralizer of `h` on `𝔤(2)` (§2.2)" and the remaining targets of §2.2 as the head has them. No sentence contradicted, no change left unstated.
- Overlap facts: no other open pull request changes this roadmap; no cited id is dropped or defined only by an open revision; no id dropped here is cited elsewhere.

Overlap check: read LieHighestWeightPartII (main and open head), ReflectionInvariantTheory, LieHighestWeight, AdoIwasawa, RealSemisimpleLieGroups and ReductiveGroups as in the previous review; the change moves no ownership. `Ad(G) = Int(L)`: LieHighestWeightPartII §0.2, cited. Conjugacy of triples over other algebraically closed fields: LieHighestWeightPartII §0.3, a variant both record, which consumes the same three pinned declarations. Weyl invariants: ReflectionInvariantTheory §3, cited. Nothing else shared.

Source independence: changed passages only; 2 passages compared with 1 source (the added sentences of §2.2 and the contract entry, against DG07 lines 143–153), none sharing more than standard terms; largest share Yun16, 10 of 31 locators; contents not compared again (no layer added, removed or reordered).

Research link: Layer 5's exponential isomorphism is Proposition 2.3 of Bertoloni Meli–Imai–Youcis (2022), used for Jacobson–Morozov parameters; Layers 6–8 are the subregular slice setting of Lehn–Namikawa–Sorger (2010) after Brieskorn and Slodowy; Layer 7 is the Springer resolution of Yun's lectures (2016). Rests on the README's references and BMIY22 §2.1, LNS10 §§1–2, Yun16 §1.

## Not verifiable

- Slo80, §6 (the restricted resolution as the minimal resolution and the `−2`-curves for `Bₙ`, `Cₙ`, `F₄`, `G₂`, cited in §§7.3 and 8.2): paywalled and settled as uncertified; cited by its section and not opened.

## Source issues

- **Misprint** in BMIY22 at §2.1, p. 5: the source says the nilpotent variety is the unique reduced subscheme whose k-points are the nilpotent elements; it should be points over every extension of k, since an anisotropic form has only the k-point 0; affects nothing.

## For the human reviewers

- none
