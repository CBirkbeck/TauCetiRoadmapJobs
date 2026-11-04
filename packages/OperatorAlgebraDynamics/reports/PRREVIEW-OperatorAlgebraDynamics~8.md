# Review of OperatorAlgebraDynamics (pull request #1097 at aff3537)

**Verdict:** needs changes

Incremental re-review of the 60 lines changed since 443d35c. The change is the merge of main into the branch: `PROGRESS.md` and `STATUS.md` are main's generated files (byte-identical to main; the folder differs from `origin/main` in `README.md` and `Suggested.lean` only), one README link follows OneParameterSemigroups' move to `Completed/`, and one hypothesis of `exists_integratedOperator` follows Tau Ceti's move of `ContRepresentation.IsUnitary` to the root namespace at the new pin. Both updates are correct at the pins and on main, and the elaboration gives exactly four `sorry` warnings. One finding remains: the worker's push gate fails its build check at this head on Lake's module-system advisory, so the file must take the module form that main's newest roadmap already uses.

## R01 (P1) — the push gate's build check fails on the module-system advisory

**Location.** `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` line 5, `import Mathlib`, with no `module` line before it.

**Claim.** The worker's gate at aff3537 reports `build=1 FAIL`, its single build line being the Lake warning that the file "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". The compile itself succeeds (`lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested` ends "Build completed successfully (8957 jobs)", exit 0), but the gate counts the warning as a build failure, and no roadmap folder is accepted while the gate fails.

**Witness.** `scratch/gate.md` of this job: every scanner 0, `build=1`, the one warning quoted above. Main's newest merged roadmap, `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` lines 1–3, reads `module`, a blank line, `public import Mathlib`, and passed the same gate.

**Repair.** Make line 1 of `Suggested.lean` the word `module`, keep the copyright header after it, and change `import Mathlib` to `public import Mathlib`; the `import TauCeti.RepresentationTheory.Continuous.Unitary.Basic` line stays as it is. Tested: a scratch copy of the head's file with exactly these three edits, elaborated with `lake env lean` at the pins, exits 0 with the four `declaration uses sorry` warnings (now at lines 53, 70, 105, 114) and no module-system warning; the six declarations elaborate unchanged.

## Previous findings

The ids below are those of the previous report, PRREVIEW-OperatorAlgebraDynamics~5, not of this one.

- R01 — not repaired (not actionable in the folder): the ten `gap:` slugs stand at lines 50, 53, 63, 66, 68, 72, 76, 80, 84, 108 with named suppliers; the board package directory holds `reports/` and `sources.toml`, no `design/plan.json`. No supplier is `none` and nothing asked for exists at the pins, so under the enumerated gap rules this is not a finding; it stays a note for the board.
- R02 — not repaired: line 706 still reads "State represented-family uniqueness for nonzero unital CAR families … Preserve the source's omitted zero-representation exception", with the section locator "(Bratteli–Robinson 2, §5.2.1)" at line 682. Not re-raised: a section locator is a locator, the text is paywalled (`uncertified`), and the theorem number the previous report proposed was from memory, so no repair can be witnessed here; see Not verifiable.
- R03 — not repaired (outside this folder): QuantumFoundations at its open head (944ed3c) §6.4, line 739, still says "Prove strong continuity of `h ↦ W(h)` from the Weyl relations and the characteristic function on the coherent-vector span", with "*Needs:* … OperatorAlgebraDynamics D8" at line 745. Nothing in this folder changes; a note for that roadmap's author.
- R04 — not repaired (outside this folder): the sibling revision #1137 is open at f3a756d; its README carries no `gap:` slug and none of this head's exponential-vector or `W_F` paragraphs (grep counts 0 and 0). The second to merge must be rebased onto the first. A third open pull request, #1187 (a Tau Ceti bump), also touches this folder's `Suggested.lean`; its hypothesis spelling agrees with this head.
- R05 — not repaired (a note, not a defect): `continuous_action` still elaborates under `[IsTopologicalGroup G]` (pulled in as a section instance whose arguments the type mentions) and the KMS theorems keep `hα`; both match the README's standing generality (line 14, line 21), so no change is asked.

## Verified sound

**Gate.** The worker's gate at aff3537 reported every scanner 0 and `build=1 FAIL` on the single line "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". That is Lake's advisory at this Mathlib pin (f6090c70, whose `Mathlib.lean` begins with `module`); it attaches to every roadmap file that begins with the required `import Mathlib` (108 of the 126 `Suggested.lean` files on main do not start with `module`); the 18 that do, among them the newest merge `CoboundaryExpansion`, put `module` first and import with `public import Mathlib`, which the gate accepts. The targeted build `lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested` ends "Build completed successfully (8957 jobs)", exit 0, with that advisory and the four `sorry` warnings. My rerun of the full gate: `gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. Because the gate counts that line as a build failure, it is reported as R01 with the module-form repair, tested on a scratch copy as described there; every other gate check passes.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` in the pull-request worktree, pins Mathlib f6090c70 and Tau Ceti 358314d4 (the manifest's revisions, confirmed with `git rev-parse` in both package checkouts): exactly four `declaration uses sorry` warnings (lines 51, 68, 103, 112), exit 0, 11 s. Diff outside the folder against `origin/main` (a0ad405): none. Diff inside the folder against `origin/main`: `README.md` and `Suggested.lean` only, so `PROGRESS.md` and `STATUS.md` are main's.

**The renamed hypothesis.** At the Tau Ceti pin, `ContRepresentation.IsUnitary` is `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` line 48, inside `namespace ContRepresentation` (line 29) with no enclosing `TauCeti` namespace, body `∀ g v w, ⟪π g v, π g w⟫ = ⟪v, w⟫`, equivalent to every `π g` being an isometry (line 62) and norm-preserving (line 53); the old spelling `TauCeti.ContRepresentation.IsUnitary` no longer exists at this pin. Main's own `Suggested.lean` for this roadmap (lines 46, 56, 63) and the sibling #1137 (line 82) use the same root spelling, and README line 26 names it as `ContRepresentation.IsUnitary`. The merge kept the branch's headline-only file over main's import list, as the merge commit says; the file is otherwise byte-identical to the head the previous review read.

**The changed link.** `Completed/OneParameterSemigroups/README.md` exists on main (a0ad405) and in the worktree; `TauCetiRoadmap/OneParameterSemigroups/` does not. Main's copy of this README already carries the same link (line 54 there). The notions the sentence consumes are in that README: `LinearPMap` generators (lines 7, 40–41, 93–94), two-sided strongly continuous groups (line 35), Part A strongly continuous semigroups (line 90). Every other relative link in the README resolves on main except the three to roadmaps still in pull requests (CStarAlgebras #860, HilbertModules #861/#1149, VonNeumannAlgebras #889/#1041), unchanged since the previous review and resolved at their heads there; the worker's citation check lists nothing found nowhere.

**Elaborated signatures.** A scratch copy with the namespace renamed and `#check @name` for all six declarations, elaborated once: the six types equal those in the worker's `signatures.md` and the previous report (`continuous_action` under `[IsTopologicalGroup G]`; `IsCovariant` without the group topology, correct since the identity is algebraic, README line 145; `exists_integratedOperator` with `U.IsUnitary`, `hcont`, `[μ.InnerRegularCompactLTTop]`, `Integrable f μ`; `IsKMS`, `kms_invariant`, `kms_entire_identity` as before). Each agrees with its README statement (lines 127, 145, 148–150, and the D7 KMS paragraphs the previous review compared).

**One-tactic probe.** In the same scratch file the touched theorem `exists_integratedOperator` was restated and tried with `first | exact ⟨_, fun _ => rfl, le_rfl⟩ | (simp; done) | (simp_all; done) | fun_prop | infer_instance | rfl | exact hU | exact hf`: every alternative fails (final error at the probe's line 151). The other three sorried theorems are byte-identical to the head the previous review probed. Nothing is padding.

**Dependency check** (verbatim): `depcheck: 234 roadmaps, 2040 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.

**Headline theorems.** Unchanged: the four statable headlines (joint continuity, integrated covariant form, KMS invariance, analytic KMS identity) are stated; the module docstring names the rest with the carrier each lacks (crossed products and duality, groupoid C*-algebras and disintegration, modular theory, CAR/Weyl and Fock, the thermodynamic limit).

**Seeded sample.** No sample file came with this job and the README flags no locator as unverified; the changed passages (a link, a Lean hypothesis name) contain no source locator, so no locator fell in them. The locators of the untouched passages stand as verified by the previous reports.

**Cross-roadmap citations resolved this round.** OneParameterSemigroups on main under `Completed/`; QuantumFoundations #1771 at 944ed3c lines 739–745 (R03); the sibling #1137 at f3a756d (R04); #1187 at 66ed0d4 (its `Suggested.lean` spelling). Ownership against open pull requests was checked only for these and through `roadmaps show`; nothing in the change introduces a new object.

**Adversarial table.** Rows for the two changed statements carry values computed this round; the rest cite the previous report.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_integratedOperator`, `hU : ContRepresentation.IsUnitary U` (line 69) | trivial `G` with `μ = δ₁`; `f = 0`; non-unitary control `G = ℤ`, counting measure, `A = H = ℂ`, `π = id`, `U n = 2ⁿ`, `f = 1_{{1}}` | `δ₁`: `T ξ = π(f 1) ξ`, `‖T‖ ≤ ‖f 1‖ = ∫‖f‖ dδ₁`; `f = 0`: `T = 0`, `0 ≤ 0`; control: `∫‖f‖ = 1` but `T ξ = 2ξ`, `‖T‖ = 2 > 1`; with `hU`, `‖U g ξ‖ = ‖ξ‖` (`IsUnitary.norm_map`, Unitary/Basic.lean line 78) gives `‖π(f g)(U g ξ)‖ ≤ ‖f g‖‖ξ‖`, integrable by `hf` and `hcont` | `hU` and `hcont` both needed; bound right | none |
| the spelling `_root_.ContRepresentation.IsUnitary` | the pin's file; dot-notation elaboration | declaration at line 48 of Unitary/Basic.lean, no `TauCeti.` prefix anywhere in that file; `#check` prints `U.IsUnitary`; isometry form at line 62 | resolves to the intended predicate | none |
| README line 95 link | main a0ad405; worktree | `Completed/OneParameterSemigroups/README.md` present, `TauCetiRoadmap/OneParameterSemigroups` absent; supplies `LinearPMap` generators (lines 40–41) and C₀ groups (line 35) | correct | none |
| `IsKMS` β=0, β<0, convention; `kms_invariant`; `kms_entire_identity`; `continuous_action`; `IsCovariant` | as PRREVIEW-OperatorAlgebraDynamics~5 (carrying ~4) | values in those reports' tables (Gibbs sign on `M₂(ℂ)`, `uIcc 0 0={0}`, `uIoo 0 0=∅`, approximate-unit estimate, rotation counterexample at β=0) | unchanged text, carried | none |
| D8 CAR Checks (lines 709, 716, 723), `CAR(h)≃CAR(completion h)` at `h=0`, the four gap sentences, D2 line 210, D4 line 309, Attal locator line 801 | as PRREVIEW-OperatorAlgebraDynamics~5 | values in that report's table (`E₁₂` family, `‖f_N−f_M‖²≤4^(−M)/3`, `√2` separation, V8/V11 units, Attal cache lines 654, 661, 695) | unchanged text, carried | none |
| D8 exponential vectors, Fock Weyl operators, Bogoliubov relations, Weyl generator unitarity, D5 Checks | as PRREVIEW-OperatorAlgebraDynamics~5 (carrying ~4) | values in those tables (`−‖f‖²/4`, `⟨f,g⟩/2`, `e^{−1/4}`, `e^{−i}`, `‖f‖²/2`) | unchanged text, carried | none |

## Not verifiable

- Bratteli–Robinson, *Operator Algebras and Quantum Statistical Mechanics 2* (Springer): resolves only to paywalled pages; §5.2.1 (line 682) cited by locator alone, and the theorem number the previous report suggested for line 706 (R02) cannot be certified from a legal copy here.
- Renault, *A Groupoid Approach to C*-Algebras*, LNM 793: same, untouched this round.
- The board manifest `sources.toml` records de la Harpe, Williams (draft 3.1), Muhly–Williams, Sims–Williams, Takeishi, Delfín–Farsi–Packer and Cuntz (`uncertified`); none is cited by a changed passage.

## Source issues

- none
