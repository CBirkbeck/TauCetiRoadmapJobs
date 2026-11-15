# GATE-ClassicalAdicEtaleCohomologyPartII~7: answers to human review

One unanswered comment, making one point.

## H01 (mycaule) — applied

The README had no citation of AxiomMath/Weil. A new section `## Existing formalizations outside Tau Ceti`, placed after `## Worked examples` and before `## References` in `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md`, now cites AxiomMath/Weil at commit `27cdb20` (Apache-2.0, Lean `v4.34.0-rc2`, not a dependency) and records the overlap. It is with scheme inputs that this roadmap takes from EtaleCohomologyFoundations. `Constructible/` is §F.0.1 material. `CompactificationIndependence/Independence.lean` is §0.8 material. `DerivedLowerShriek/ConstructibilityUnconditional.lean` is the constructibility part of the compact-support finiteness in §F.3. `Duality/` is ℓ-adic duality over finite fields with ℓ invertible, which is not the p-primary rigid duality of Layer 5. `RingTheory/Henselian` matches no target here, because the stalks this roadmap uses are the analytic strict localisations of ClassicalAdicEtaleCohomology §1.5(c).

Evidence, checked at commit `27cdb2049be62ee2911429b47f54774078450e32` (GitHub tree and file contents, read-only):

- The two directories contain 283 and 37 `.lean` files, which matches the counts in the comment. The repository's `LICENSE` is Apache 2.0. `lean-toolchain` is `v4.34.0-rc2`, while this repository pins `v4.36.0-rc2`. `lakefile.toml` requires Mathlib `16edf57` and AxiomMath/Stacks `012108f`. The repository's README describes it as a Freitag–Kiehl formalization of the Weil conjectures, about 980 AI-written modules not reviewed by humans.
- None of the 988 file paths names adic, rigid-analytic or formal spaces, affinoids or almost modules; the only "adic" files are about adic completion of rings. A code search of the repository for `AdicSpace`, `Huber`, `almost` and `Affinoid` returns nothing. So Layers 0–5 (almost coherent sheaves, formal canonical sheaves, Faltings traces, polystable duality and its descent, p-adic Poincaré duality) have no counterpart there.
- All eleven `Duality/*.lean` module docstrings were read. Every geometric statement is about a scheme proper and smooth over a finite field (`X_k̄` connected), with `hℓ : ℓ ≠ p` or `IsUnit (ℓ : k̄)`. The other files are abstract pairing and cup-product lemmas.
- `Constructible/ConstructibleIffGenericEtaleNbhdFlc.lean` proves the criterion for constructibility by étale neighbourhoods of generic points, on schemes with Noetherian underlying space (FK I.4). That is the notion owned by EtaleCohomologyFoundations §F.0.1.
- `CompactificationIndependence/Independence.lean` proves that `Rf̄_*∘j_!` on `D⁺` with torsion cohomology does not depend on the compactification, for a separated finite-type map to a qcqs base. The compactification is taken as given data. This matches EtaleCohomologyFoundations §0.8, which defines `Rf_!` once on `D⁺` with torsion cohomology.
- `DerivedLowerShriek/ConstructibilityUnconditional.lean` proves that every `R^v f_!` of a constructible abelian sheaf is constructible, for a separated finitely presented map with a compactification over a qcqs base. EtaleCohomologyFoundations §F.3 (`compactSupportFiniteness`) asks for more: `Rf_!` on `Dᵇ_ctf` with `N` invertible. So the file covers the constructibility part, for single sheaves.
- `grep -i henselian` over the README finds no occurrence. The stalks used here come from ClassicalAdicEtaleCohomology §1.5(c) (supplier contract, README line 176).

No target, owner, hypothesis or `Suggested.lean` declaration changed. AxiomMath/Weil is not at the pins, so nothing there replaces a target (the repository README's "defer to Mathlib" rule applies to Mathlib, and its "Porting existing work" rule asks for citation and coordination). The provenance section follows the shape the parent roadmap ClassicalAdicEtaleCohomology uses for AxiomMath/Stacks.

## Adversarial pass on the added sentences

| Statement added | Instances / evidence | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Weil is Apache-2.0, built on Mathlib and AxiomMath/Stacks, Lean `v4.34.0-rc2`, its own pins | `LICENSE`, `lean-toolchain`, `lakefile.toml` at `27cdb20`; this repo's `lean-toolchain` | Apache 2.0; `v4.34.0-rc2` vs ours `v4.36.0-rc2`; Mathlib `16edf57` vs ours `1b1ccf4` | true | none |
| README at that commit: modules AI-written and not human-reviewed | Weil `README.md`, "Structure" paragraph | "about 980 modules written by AI agents … not yet been reviewed by humans" | true; phrased for the pinned commit to stay timeless | none |
| Directory sizes 283 and 37 | recursive tree, `.lean` filter | 283 / 37 | true | none |
| No adic, rigid or formal spaces, no almost modules in these directories | all 320 paths; code search | 0 matching paths; 0 search hits for `AdicSpace`, `Huber`, `almost`, `Affinoid` | true | none |
| Étale-directory duality is ℓ-adic over finite fields with ℓ invertible | 11 `Duality` docstrings | finite field in 7 geometric files; `ℓ ≠ p`, `ℓ ∤ q` or `IsUnit ℓ` in each; 4 abstract-algebra files | true. The first draft said "their duality" for both directories, but the Henselian directory has none, so it now says "the étale directory" | reworded |
| Analytic prime-to-residue duality is ClassicalAdicEtaleCohomology §9.7 | README line 176 | "9.7 supplies Galois equivariance and prime-to-residue duality" | consistent | none |
| No target concerns henselian rings | README grep | 0 occurrences of "henselian" | true | none |
| Overlap is with EtaleCohomologyFoundations inputs (§§F.0, 0.5–0.11, extension of §F.3) used by §7.2 | README lines 184–188 and §7.2 *Needs* | the contract names F.0 and §§0.5–0.11 and extends §F.3; §7.2 *Needs* names F.0, G.1–G.3 and the quasi-excellent contract | true. The first draft said "scheme inputs of §7.2", but §7.2's *Needs* line omits §0.8, so the sentence now cites the supplier contract | reworded |
| `Constructible` is §F.0.1 material | ECF §F.0.1 on main (line 173 onward) vs Weil docstring | both define constructible étale sheaves by finite stratifications with locally constant pieces | true | none |
| Compactification independence is §0.8 material | ECF §0.8 (line 964) vs Weil docstring | both: `Rf_!` on `D⁺` with torsion cohomology, independent of compactification | true | none |
| Constructibility of `R^v f_!` is the constructibility part of §F.3, single sheaves, no invertibility | ECF §F.3 line 1158 vs Weil docstring | ECF: `Rf_!` on `Dᵇ_ctf`, `N` invertible; Weil: each `R^v f_!F` constructible, no invertibility | true as scoped | none |

Degenerate and convention cases (rank 0, p = 2 and 3, signs) do not apply: the section states no mathematics of its own and changes no target or hypothesis.

## Ownership and overlap

Ownership is unchanged: the section moves nothing and names EtaleCohomologyFoundations, which is on main and already a supplier, as owner of the scheme material. `scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped ids. Rerunning `roadmaps resolve` on the edited README finds no cross-roadmap citation or Lean name missing anywhere.

## Suspicious text

None. The comment contains only the overlap claim and two links.

## Build and gate

- `Suggested.lean` is unchanged. Its 8 declarations are as listed in `scratch/signatures.md`. I did not rerun the `#check @name` comparison because no signature changed.
- `lake build TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII.Suggested`: `Build completed successfully (18239 jobs).` The only warning is `Suggested.lean:89:8: declaration uses 'sorry'` (the headline `monomial_root_duality`).
- Gate after commit `3cf97a57`: `gate ClassicalAdicEtaleCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Commit: `3cf97a57 ClassicalAdicEtaleCohomologyPartII: review repairs (provenance section citing AxiomMath/Weil étale-cohomology and Henselian overlap)`. Not pushed.
