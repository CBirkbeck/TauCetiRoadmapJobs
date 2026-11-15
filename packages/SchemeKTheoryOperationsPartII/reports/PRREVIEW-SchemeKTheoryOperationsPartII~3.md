# Review of SchemeKTheoryOperationsPartII (pull request #1741 at 26d3d86)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description says “Suggested.lean declares nothing” and “the targeted Lake build succeeds with no warning”; the empty namespace and thirteen docstring bullets agree. The revised affine-carrier qualification matches the pin.
- R02 — repaired: `packages/SchemeKTheoryOperationsPartII/sources.toml` now records the more-algebra, coherent and varieties chapter URLs and hashes under STACKS, with its shared open-repository licence classification; all three cached extractions exist.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.1 affine stalk/completion comparison, cited by the revised docstring | A = 𝔽₂[t], I = 0, prime (t) | All three rings are 𝔽₂[t]_(t); dimensions (1,1,1), regularities (true,true,true); maximal-ideal completions all 𝔽₂⟦t⟧. | Agrees; distinguishes the two completions | none |
| §0.1 regularity comparison, negative control | A = 𝔽₂[ε]/(ε²), I = (ε) | All three rings equal A; dimensions (0,0,0), cotangent dimensions (1,1,1), regularities (false,false,false). | Agrees for nonreduced input | none |
| §0.4 codimension comparison named in the revised docstring | X = Spf ℤ₂⟦t⟧; Z = V(t), then V(2,t) | Codimensions 1 and 2; height ideals 1 and 2; dimension differences 2−1=1 and 2−0=2. | Agrees | none |

The rows for untouched statements stand as in the previous review, of `8c24078`.

- Source checks: 5 affine-comparison locators, EGA-I lines 2849–2892 and 7294–7299; STACKS (more-algebra) lines 5216–5221, 5224–5228, 5229–5235; restored chapter witnesses at STACKS (coherent) line 478 and (varieties) line 4401.
- Pinned declarations opened: `TauCeti.FormalScheme.Spf.structureSheaf`, `TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean:262`; `TopCat.Presheaf.stalk`, `Mathlib/Topology/Sheaves/Stalks.lean:82`; `IsRegularLocalRing`, `Mathlib/RingTheory/RegularLocalRing/Defs.lean:52`.
- Layer 4: all 7 targets' needs and proof routes read; none uses Layer 3. The 5 supplier roadmaps on the changed dependency line resolve at their permitted versions; no new supplier or object is introduced.
- Gate: every scanner passed; targeted build passed; dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Direct `lake env lean` elaboration: exit 0, no output or warnings. Zero declarations: signature checks and one-tactic probes have zero subjects; the extracted name “sheaf” occurs inside the docstring, not a declaration.
- PR title, prose and roadmap-summary block match the new folder, 54 added headings, zero removed headings and zero Lean declarations. The description now states the proper-direct-image gap and the affine/non-affine carrier distinction. Outside-folder merge-base diff: 0 paths; worktree clean.
- Declared gap: README line 55 and `design/plan.json` share `proper-formal-coherent-direct-images`; EGA-III1 lines 4444–4507 support its contract. AdicSpacesPartIII §F0.6 on main, line 3206, still supplies only the completion comparison. Acceptance retains this declared supplier contract.

Overlap check: read SchemeKTheoryOperations, AdicSpacesPartIII (main and open revision), SchemeAndStackFoundations, DirectSummandsAndBigCohenMacaulay, DeformationAndDerivedPatchingAlgebra and CrystallineCohomology; ordinary K-theory belongs to SchemeKTheoryOperations, formal carriers/completed localisations to AdicSpacesPartIII, ordinary Cohen–Macaulay and curve-degree foundations to SchemeAndStackFoundations, and the formal supported comparisons to this Part II; no duplicate ownership introduced.

Source independence: 1 changed mathematical prose passage compared with 2 sources (EGA-I and STACKS), no copied expression; the dependency-only edit adds no source expression (changed passages only). Largest share ZHANG21, 34 of 95 line locators; contents comparison not repeated because no layer was added, removed or reordered.

## Not verifiable

- none.

## Source issues

- **Gap** in ZHANG21 at Appendix B.1, printed page 972: the source says regular pure-dimensional noetherian formal schemes have an isomorphism between strict supported K₀ and coherent K′₀; it should require the resolution property for the global locally-free complex model, or use a locally perfect model; affects a stated result.
- **Gap** in LIZHANG22 at §1.8, printed page 9: the source says properness of the reduced morphism suffices to define coherent pushforward by higher direct images; it should require EGA properness: adic, finite type and proper reduction; Spf k⟦t⟧ → Spec k otherwise has noncoherent direct image; affects a stated result.

## For the human reviewers

- **Not tested.** Earlier reviews recorded no comparison of the layers with ZHANG21's contents (34 of 95 line locators). This incremental review does not supply that comparison; the former description's claim to follow Appendix B is gone.
- **Licence.** ZHANG21 is read from `archive.ymsc.tsinghua.edu.cn` (README line 809), an Annals copy classified as institutional and certified in the manifest; whether that host's copy is licensed remains for human confirmation.
