# Review of SemisimpleAlgebras (pull request #989 at 7a39a1d)
Folder: `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/`

**Verdict:** accepted

Incremental re-review of the 10 lines changed since 7edf172 (the head r10 read): the header of `Suggested.lean` is now in module form (`module`, three `public import` lines, `@[expose] public section` before the namespace), which is exactly the repair R01 of r10 asked for. Nothing else in the folder changed; the README is byte-identical to the head r10 read. The change is correct, the gate passes with the build included, and no finding remains, so this roadmap folder is ready for a human's final approval. This is an AI review, not an approval or merge.

## Previous findings

- R01 — repaired: `Suggested.lean:1–5` read `module`, blank, `public import Mathlib`, `public import TauCeti.Algebra.BrauerGroup.Group`, `public import TauCeti.Algebra.CentralSimple.Splitting`; line 31 `@[expose] public section`. The worker's gate on this head: `build=0`; mine: one warning, the `sorry`.

## Verified sound

**Scope and pins.** HEAD `7a39a1dd6951153a08a8c24c58493721a149fe6f`; the worktree is clean. `git diff 7edf172 HEAD --stat`: one file, `Suggested.lean`, 7 insertions and 3 deletions, all in lines 1–5 and 31; the README and the module docstring are unchanged. `git diff --stat origin/main...HEAD` outside the roadmap folder and outside the family index `TauCetiRoadmap/RepresentationTheory/` is empty, and the family index files are identical to main's. Pins: the branch's `lake-manifest.json` has Mathlib `1b1ccf4b088b` and Tau Ceti `2fd255d997f4`, the revisions README lines 81–83 declare; `.lake/packages/mathlib` and `.lake/packages/TauCeti` are checked out at those commits.

**Gate and dependency check.** My own gate on this head (the text checks and the dependency check):

    gate SemisimpleAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The worker's gate on the same head adds `build=0` and reports OK: the module-system warning that failed r10 is gone. The gate's import rule accepts the `public import` lines (`imports=0`, `mathlib-subimports=0`, `no-import-mathlib=0`). The dependency command prints `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line. The worker's citation check lists no cross-roadmap citation and no Lean name found nowhere; the overlap file lists no other pull request changing this roadmap, no id cited that an open pull request drops, no id defined only by an open revision, and no id this pull request drops that another roadmap cites.

**Elaboration of the changed file.** `lake env lean TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean` from the pull request's worktree at the pin: exactly one warning, `44:8 declaration uses sorry`, no error. The elaborated type of `skolemNoether` (worker's signature file, and `#check @skolemNoether` from a scratch importer) is `Field K`, `Ring A`, `Ring B`, `Algebra K A`, `Algebra K B`, `Algebra.IsCentral K A`, `IsSimpleRing A`, `FiniteDimensional K A`, `IsSimpleRing B`, `f g : B →ₐ[K] A`, conclusion a unit `u` of `A` with `g x = u * f x * u⁻¹` for all `x`, over three universes: this is README §5.1 (lines 618–622) binder for binder, with no finiteness on `B` and no centrality of `B`, as the README states. The `@[expose] public section` and `public import` lines lose no binder: the type is identical to the one r9 and r10 recorded.

**What the module form exposes to consumers.** The docstring (lines 26–28) and README line 189–192 say the file imports the Brauer group law and re-exports `TauCeti.Algebra.IsSplittingField` into its namespace for consumers. I tested both import forms against the built olean of this head (`.lake/build/lib/lean/TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.olean`, built by the worker's targeted build): a non-module scratch file with `import TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras.Suggested`, and a module scratch file with `public import` of the same. In both, `#check @TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras.skolemNoether` prints the type above, `#check @TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras.IsSplittingField` resolves through the `export` with type `(K A L : Type _) → [Field K] → [Ring A] → [Algebra K A] → [Field L] → [Algebra K L] → Prop`, `inferInstance : CommGroup (BrauerGroup ℚ)` synthesises (`TauCeti.BrauerGroup.instCommGroup : {K} → [Field K] → CommGroup (BrauerGroup K)`), and an `example` with the headline's hypotheses closes by `skolemNoether f g`. So the `export` and the instance survive the module boundary, and the README's description of the file stays true. On main no roadmap Lean file imports this module (grep of `TauCetiRoadmap/` for the module name returns only this file), so no consumer build can be broken by the header change; the QuadraticFormInvariants README on main cites this roadmap by README section (its lines 590, 749, 3382), not by import.

**Headline and padding, at this head.** The sole owned headline `skolemNoether` (line 44) re-probed on a module-form scratch copy with the pinned `TauCeti.Algebra.CentralSimple.SkolemNoether` also imported: `simp` makes no progress; `infer_instance` fails (not a class); `exact TauCeti.skolemNoether K f g` fails to synthesise `Algebra.IsCentral K B`, because the pinned theorem (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107–108`, in `namespace TauCeti`, `section SkolemNoether`) assumes a central simple source and a merely simple target, the opposite distribution from the roadmap's statement; `exact?` finds only my own scratch copy of the statement. Not padding; no stand-in; the docstring's three consumed centralizer names are unchanged since r9. The headline's locator: `stacks-brauer` line 215, Theorem 6.1 (tag 074Q), printed p. 5 (page markers p. 5 at line 176, p. 6 at line 218): a finite central simple ambient algebra `A`, a simple `B`, two homomorphisms, conjugacy by an invertible element of `A`, as the Lean states. Lemma 4.6 (074E) line 135, p. 4, is the route's module-classification input (README line 630).

**The sampled sections.** The seeded sample (§§0.2, 2.1–2.3, 3.1, 3.2, 4.1, 4.3, 4.4, 5.1, 5.2, 6.1–6.4) falls in the README, which this head leaves byte-identical to the head r10 read; those sections were verified in full in r7 and r8 and re-checked in r9 and r10. The one sampled target the diff touches is §5.1, the headline, re-verified above (locator, hypotheses, signature, pinned declaration). No locator is flagged unverified in the README.

**Ownership, duplication, consumers.** The change introduces no object, target, name or citation; the ownership grep of r8 (`skolemNoether|skolem_noether|SkolemNoether` in roadmap Lean files: this roadmap only) and the consumer resolutions of r8–r10 stand, since every heading, section number and Lean name they cite is untouched. The three closest roadmaps in vocabulary (GrothendieckNotesLemmas, ModularCharactersAndBlocks, BorelRegulators) share no id with this roadmap in the overlap file.

**Adversarial table.** Rows 1–49 (r7), 50–56 (r8), 57–58 (r9) and 59–60 (r10) are rows for statements this head leaves untouched; their values are as recorded in those reports and are not recopied. Rows 61–62 are computed here for the changed file.

| # | Statement | Instances | Values computed | Result | Change / evidence |
|---|---|---|---|---|---|
| 1–49 | Layers 0–6 statements, Checks and conventions | as in r7 | as in r7 | sound | none (r7) |
| 50–56 | §2.2 enumeration, §2.2 K^ℕ Check, §2.3 block count and uniqueness, §5.2 simplicity, §5.3 double centralizer, §6.2 separable maximal subfield | as in r8 | as in r8 | sound | none (r8) |
| 57–58 | Pin declaration (README 81–83); headline signature and probes | as in r9 | as in r9 | sound | none (r9) |
| 59–60 | Relabelling Layer 1.5 → §1.3 (README 246–251); headline at the merged-in pin | as in r10 | as in r10 | sound | none (r10) |
| 61 | Module-form header (`Suggested.lean` 1–5, 31) | the file as is; a non-module importer; a module importer | warnings 1 (`sorry`), errors 0; worker's `build=0`; importers: `skolemNoether` type 9 binders, `IsSplittingField` arity 3 types + 5 instances → `Prop`, `CommGroup (BrauerGroup ℚ)` found, `example` closed by `skolemNoether f g`; main Lean importers of the module: 0 | true | none (R01 of r10 repaired) |
| 62 | Headline `skolemNoether` vs the pinned `TauCeti.skolemNoether` | roadmap: central simple `A`, simple `B`; pin: simple `A`, central simple `B` | `exact TauCeti.skolemNoether K f g` → missing `Algebra.IsCentral K B`; `simp` no progress; `exact?` no library lemma; Stacks 074Q p. 5 hypotheses = roadmap's | sound, not padding | none |

## Not verifiable

- None. Every cited text is in the cache or at the pinned revision.

## Source issues

- **Misprint** in stacks-brauer at Proposition 8.5 (tag 0752), printed p. 7, stacks-brauer line 304: the source says the last clause with the word for a splitting field missing a letter; it should be splitting field; affects nothing.
