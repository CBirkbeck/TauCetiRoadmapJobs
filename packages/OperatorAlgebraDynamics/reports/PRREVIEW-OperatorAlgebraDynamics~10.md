# Review of OperatorAlgebraDynamics (pull request #1097 at a5d7f8b)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since aff3537, all in `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`: the file now begins with `module`, both imports are `public import`, and the declarations sit in an `@[expose] public section`. That is the module form the previous review asked for, it is the form of the two module-form roadmap files on main (`CoboundaryExpansion`, `TypeAHeckeAlgebras`), the worker's gate passes with `build=0`, and the six declarations elaborate to the same types as before. `README.md` is byte-identical to the head the previous review read, and nothing outside the folder changes. No finding remains.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 1, 7–8 and 41 read `module`, `public import Mathlib`, `public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic`, `@[expose] public section`; the worker's gate at a5d7f8b reports every scanner 0 and `build=0 OK`, and `lake env lean` gives only the four `sorry` warnings (lines 55, 72, 107, 116), no module-system advisory. The repair introduced nothing new: the elaborated types of all six declarations are unchanged (see the signature check below).

The notes the previous report carried from PRREVIEW-OperatorAlgebraDynamics~5 (its R01–R05: no `design/plan.json` for the ten declared gap slugs, the paywalled Bratteli–Robinson 2 §5.2.1 locator, QuantumFoundations §6.4's overlap, the un-rebased sibling revision #1137, the standing hypotheses of `continuous_action` and the KMS theorems) are notes, not findings; nothing this change touches bears on them. The sibling heads are unchanged since that report (#1137 at f3a756d, #1187 at 66ed0d4, #1771 at 944ed3c, per `roadmaps list` on the index of 2026-11-05).

## Verified sound

**The changed lines.** The diff since aff3537 is `Suggested.lean` only (6 insertions, 2 deletions, one commit a5d7f8ba); `git diff --stat origin/main...HEAD` outside the folder is empty; inside it only `README.md` and `Suggested.lean` differ from main, so `PROGRESS.md` and `STATUS.md` are main's. The previous review's tested repair left the Tau Ceti import plain; this head makes it `public import`, which is the correct variant: the Tau Ceti pin (358314d4) compiles `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` and `TauCeti.lean` (line 13) as `module` files, and because `@[expose] public section` makes every declaration public, `ContRepresentation` in the public signatures of `IsCovariant` and `exists_integratedOperator` must come from a public import. `@[expose]` on the section exposes the bodies of the two `def`s (`#print` shows `@[expose] def … IsCovariant` and `… IsKMS` with their bodies), which is what a consumer unfolding the covariance or KMS predicate needs; the four `theorem`s are unaffected. Main's module-form files use the same header: `CoboundaryExpansion/Suggested.lean` lines 1–3 and 36 (`module`, `public import Mathlib`, `@[expose] public section`), `TypeAHeckeAlgebras/Suggested.lean` lines 6–12 (`module`, `public import TauCeti.…`, `public import Mathlib.…`).

**Gate.** The worker's gate at a5d7f8b: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. My rerun of the gate (text scanners and dependency check) at this head: the same counters, `OK`, exit 0.

**Elaboration.** `lake env lean TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` from the pull-request worktree, pins Mathlib f6090c70 and Tau Ceti 358314d4 (the manifest's revisions, equal to `git rev-parse HEAD` in both package checkouts): exactly four `declaration uses sorry` warnings (lines 55, 72, 107, 116), no other warning, exit 0, 12 s.

**Elaborated signatures.** A scratch copy of the head's file with the namespace renamed and `#check @name` for all six declarations, elaborated once in the same module form: `continuous_action` under `[IsTopologicalGroup G]`; `IsCovariant` without the group topology (correct: the identity is algebraic, README line 145); `exists_integratedOperator` with `U.IsUnitary`, the strong-continuity hypothesis, `[μ.InnerRegularCompactLTTop]` and `Integrable f μ`; `IsKMS` with `[PartialOrder A] [StarOrderedRing A]`; `kms_invariant` with `β ≠ 0`; `kms_entire_identity` for every real `β`. All six equal the types in the worker's `signatures.md` and in the previous report, and each agrees with its README statement (lines 127, 145, 148–150 and the D7 KMS paragraphs compared in the previous reports); nothing changed. The worker's "looks dropped" lead on `IsCovariant` is the same intended omission the previous reports accepted.

**One-tactic probe.** In the same scratch file the four sorried theorems were restated and tried: `continuous_action` with `first | (simp; done) | (simp_all; done) | fun_prop | continuity | infer_instance | rfl | exact hα _`; `exists_integratedOperator` with `first | exact ⟨_, fun _ => rfl, le_rfl⟩ | (simp; done) | (simp_all; done) | fun_prop | infer_instance | rfl | exact hU | exact hf`; `kms_invariant` with `first | (simp; done) | (simp_all; done) | rfl | exact (hφ.2 _ _).choose_spec.2.2.2.1 t | exact (hφ.2 _ _).choose_spec.2.2.2.2 t | simp [IsKMS] at hφ`; `kms_entire_identity` with `first | (simp; done) | (simp_all; done) | rfl | (rw [← hreal]; done) | simp [IsKMS] at hφ`. Every alternative fails (errors at the probe's lines 130, 139, 144, 152, the last two with the goal unsolved after unfolding `IsKMS`). Nothing is padding.

**Dependency check** (verbatim): `depcheck: 237 roadmaps, 2105 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.

**Headline theorems.** Unchanged: the four statable headlines (joint continuity, integrated covariant form, KMS invariance, analytic KMS identity) are stated; the module docstring (lines 26–38) names the rest with the carrier each lacks (crossed products and duality, groupoid C*-algebras and disintegration, modular theory, CAR/Weyl and Fock, the thermodynamic limit).

**Seeded sample.** No sample file came with this job and the README flags no locator as unverified; the changed lines are a file header and contain no source locator, so no sampled target falls in them. The locators of the untouched passages stand as verified by the previous reports.

**Cross-roadmap citations and ownership.** The README is unchanged, so its citations are those resolved in the previous reports; the worker's citation check lists nothing found nowhere. The change introduces no object, so ownership against open pull requests was checked only for the sibling heads named above (through `roadmaps list`), not re-searched by object.

**Adversarial table.** Rows for the changed lines carry values computed this round; the rest cite the previous reports.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| module header: `module`, `public import Mathlib`, `public import TauCeti.…Unitary.Basic` (lines 1, 7–8) | fresh elaboration at the pins; the Tau Ceti file's own header; the gate's build | `lake env lean`: 4 sorry warnings, 0 other, exit 0; `grep -c '^module'` on `Unitary/Basic.lean` at the pin = 1, `TauCeti.lean` line 13 = `module`; gate `build=0`, `imports=0`, `mathlib-subimports=0` | correct form; the Tau Ceti import must be public because `ContRepresentation` occurs in public signatures | none |
| `@[expose] public section` (line 41) | `#print IsCovariant`, `#print IsKMS`; `#check` of the four theorems | both defs print as `@[expose] def` with bodies `∀ g a, U g ∘SL π a = π (α g a) ∘SL U g` and the five-clause KMS conjunction; the theorems' types equal signatures.md | bodies exposed to consumers, types unchanged | none |
| `exists_integratedOperator`, `hU : ContRepresentation.IsUnitary U` | as PRREVIEW-OperatorAlgebraDynamics~8 | that report's values (`δ₁`: `T ξ = π(f 1) ξ`; `f = 0`: `0 ≤ 0`; non-unitary control `U n = 2ⁿ` gives `‖T‖ = 2 > 1`) | unchanged text, carried | none |
| `IsKMS` β=0, β<0, convention; `kms_invariant`; `kms_entire_identity`; `continuous_action`; `IsCovariant` | as PRREVIEW-OperatorAlgebraDynamics~5 (carrying ~4) | values in those reports' tables (Gibbs sign on `M₂(ℂ)`, `uIcc 0 0={0}`, `uIoo 0 0=∅`, approximate-unit estimate, rotation counterexample at β=0) | unchanged text, carried | none |
| D8 CAR Checks (README lines 709, 716, 723), `CAR(h)≃CAR(completion h)` at `h=0`, the gap sentences, D2 line 210, D4 line 309, Attal locator line 801 | as PRREVIEW-OperatorAlgebraDynamics~5 | values in that report's table (`E₁₂` family, `‖f_N−f_M‖²≤4^(−M)/3`, `√2` separation, V8/V11 units, Attal cache lines 654, 661, 695) | unchanged text, carried | none |
| D8 exponential vectors, Fock Weyl operators, Bogoliubov relations, Weyl generator unitarity, D5 Checks | as PRREVIEW-OperatorAlgebraDynamics~5 (carrying ~4) | values in those tables (`−‖f‖²/4`, `⟨f,g⟩/2`, `e^{−1/4}`, `e^{−i}`, `‖f‖²/2`) | unchanged text, carried | none |

## Not verifiable

- Bratteli–Robinson, *Operator Algebras and Quantum Statistical Mechanics 2* (Springer): resolves only to paywalled pages; §5.2.1 and §5.3.1 are cited by locator alone (`uncertified`), untouched this round.
- Renault, *A Groupoid Approach to C*-Algebras*, LNM 793: same, untouched this round.
- The board manifest `sources.toml` records de la Harpe, Williams (draft 3.1), Muhly–Williams, Sims–Williams, Takeishi, Delfín–Farsi–Packer and Cuntz (`uncertified`); none is cited by a changed line.

## Source issues

- none
