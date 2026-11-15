# Review of CrystallineCohomologyPartII (pull request #2265 at edf9add)

**Verdict:** accepted

Incremental re-review of 5 changed lines since `f0dfe4d` (the section *Provenance: existing formalizations outside Tau Ceti* and its entry in References). No finding.

## Deferred findings

- D01 — stands

## Previous findings

- none: the previous review, of `f0dfe4d`, raised no finding (its carried R01 is D01).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Provenance: the envelope of §3.2 step 2 is DerivedDeRhamCohomology §PD.6, "applied there to an ideal J containing p, the case the directory covers" | P = Spf W⟨t⟩, X = {t = 0}, J = (p, t), F(t) = t^p; p = 2, m = 2; J = (t) as control | t ↦ [0] = 0, p ↦ V(1); γ_m(V1) = (p^{m−1}/m!)·p = p^m/m! = γ_m(p); p = 2: both sides 2; W_n⟨t⟩ → W_n(k) kills t^[m]. J = (t) ∌ p lies outside tag 07H8's hypothesis IB ⊂ J | holds; §3.2 has J ∋ p, §PD.6 allows any J, the directory's case is IB ⊂ J | none |
| Provenance: Frobenius of a nondegenerate F-crystal is "an isomorphism after inverting p" (tag 07N5) | X = Spec k, E = O with F_E = p | the map W ⊗_σ W → W is p·σ: cokernel k integrally, bijective on K | described as the tag states it; the integral form would be false | none |
| Provenance: "enters only through the comparisons of CrystallineCohomology §CR.4.7 and PadicDifferentialEquationsAndRigidCohomology §RD.4.37 and §RD.4.38" | every occurrence of `crys` in `README.md` | lines 73, 355, 772, 793, 830–835, 1751–1760: each cites §CR.4.7, §RD.4.37 or §RD.4.38 (line 1751 through line 1760 and §3.5) | holds | none |

The rows for the untouched statements stand as in the previous review, of `f0dfe4d`.

- Stacks tags of the new passage read at the Stacks project site (the cached Stacks text is the Weil cohomology chapter only): 07H8, 07H9, 07HA, 07HB, 07HC, 07HD, 07HE are Section 60.2 (envelope, universal property, quotients, presentation, base change; hypothesis IB ⊂ J); 07MW is Remark 60.24.11; 07LG Proposition 60.21.3; 07N5 Theorem 60.26.4; 07Q9 and 07QB Lemmas 60.25.4 and 60.25.6 (iterated α_p-covers). Eleven tags, each says what the passage says of it.
- The repository at commit c496df0: LICENSE Apache-2.0; `lean-toolchain` v4.35.0 and Mathlib `inputRev` v4.35.0 (this repository: Lean v4.36.0-rc2); top level `StacksCore` (human-reviewed) and `StacksFrontier` (written by AI agents), as described; the directory exists with about 277 entries, among them `DividedPowerEnvelope`, `SmallSite`, `BigSite`, `CrystalsQuasiCoherent`, `CrystalConnectionIntegrable.lean`, `Computes07LG…`, `FCrystal.lean`, `FrobeniusNondegeneracy.lean`, `AlphaPCover…07Q9`; no entry named for Witt vectors, de Rham–Witt, rigid cohomology, slopes or zeta functions.
- Cross-roadmap citations of the passage resolved at the open heads: DerivedDeRhamCohomology §PD.6, *Universal base-compatible divided power envelope* (`README.md` line 2278, J any ideal); CrystallineCohomology §CR.4.7 (line 6510); PadicDifferentialEquationsAndRigidCohomology §RD.4.37 and §RD.4.38 (lines 8051, 8079). `README.md` line 755 (step 2 of §3.2) uses the universal property, as the passage says.
- Shape: the repository's `README.md` (Writing a roadmap, "a clearly secondary provenance section") provides for the section; it opens by calling itself secondary and prescribing nothing; roadmaps on main carry such sections (ModularCurves, EllipticCurves, ThetaSeries). The seeded sample has no target in the changed passage.
- Pull request text against this head: the folder change adds no supplier, no layer, no target and no Lean declaration, and removes nothing; the passage itself says the repository is not a dependency, so the description's dependency list and merge order stand. No sentence contradicted.
- Gate at this head: every check passed (all counters 0). Nothing changed outside the folder. `lake env lean` on `TauCetiRoadmap/CrystallineCohomologyPartII/Suggested.lean`: five `sorry` warnings, nothing else. Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`.
- Overlap check: read CrystallineCohomology, PadicDifferentialEquationsAndRigidCohomology, ArcTopologyAndDescent, SchemeAndStackFoundations, EnhancedDerivedSheaves; the change adds no object, owners as in the previous review (divided power envelopes: DerivedDeRhamCohomology §PD.6; convergent-coefficient descent and Cartier transforms: D01).
- Source independence: changed passages only; 6 passages compared with 2 sources (Stacks Chapter 60 at the eleven tags, the AxiomMath repository's README), none shared; largest share CR12, 102 of 280 locators; no layer added, removed or reordered, so contents not compared again.

## Not verifiable

- The Lean files of the directory were not opened: what it formalizes was read from its file and directory names and the tags in them. That "no target of Layers 0–6 and no statement of `Suggested.lean` is proved there" rests on the absence of any file on Witt vectors, rigid cohomology or point counts.
- The items of the earlier reviews stand (Stacks tags 02RH and 0BED; the eight uncertified sources; §5.12 (ii) in its shifted form).

## Source issues

- none

## For the human reviewers

- **Scope.** `README.md` §§1.3–1.5 and §5.12 (ii) state results in a form no cited source prints (a constructed pushout and universal descent for BS17 Proposition 11.41; a degree-shifted form of CR12 Theorem 4.8.1).
- **Licence.** Ser58Top was read from a copy of the whole proceedings volume on a third party's university page; its status was not settled.
- **Licence.** `README.md` line 1814 records the Apache-2.0 repository AxiomMath/Stacks (its text source, the Stacks project, is GFDL) as nearby code, not a dependency; no declaration of `Suggested.lean` has a counterpart among the directory's file names.
