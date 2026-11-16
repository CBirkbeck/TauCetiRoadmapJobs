# Review of GrothendieckUniverses (pull request #1783 at 017d471)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: README lines 346–349 now say "ordinals whose cofinality exceeds a given cardinal (Tag 05N3) and the factorisation through one stage of a map from a set of cardinality `< cf(β)` into a colimit indexed by the ordinals below `β` (Tag 05N2)". The description now says "ordinals of large cofinality (05N3), maps into ordinal-indexed colimits (05N2)".

## Verified sound

No statement changed in the diff. Rows 1–2 cover the statements the changed text cites ("They border on 1.3 and 2.3"). Rows 3–5 cover the changed claims, checked against AxiomMath at c496df0 and the Stacks Project.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 `IsGrothendieckUniverse.isInaccessible_card` | `V_ ω`; `V_ κ.ord`, `κ` inaccessible; `{∅}` | `V_ ω`: card `preBeth ω = ℵ₀`, fails `aleph0_lt` (Regular.lean:304); `omega ∉ V_ ω`. `V_ κ.ord`: card `κ`, `omega ∈`. `{∅}`: `P(∅) = {∅} ∉ {∅}`, not a universe | both sides agree in each case | none |
| 2.3 `forall_exists_isGrothendieckUniverse_iff` | no inaccessible; exactly one inaccessible `κ`; ⇐ Check | None: left fails at `x = omega`, right at `c = 0`. One: left fails at `x = V_ κ.ord`, right at `c = κ`. ⇐: `κ > card V_(rank x+1) ≥ ∣rank x∣`, so `rank x < κ.ord` | true; `le_preBeth_ord` at Aleph.lean:633 | none |
| Provenance ¶1: the tiers | AxiomMath README at c496df0, lines 11, 13, 14, 53 | Line 13: `StacksCore` is human-reviewed. Line 14: `StacksFrontier` was written by AI agents. Line 53: maintainers review pull requests to both tiers, so the old "unreviewed by humans" is rightly dropped | supported | none |
| Provenance ¶2: Tag 05N3 | `κ = 0`, `κ = ℵ₀`; Stacks Prop. 3.7.2 | Witness `(κ ⊔ ℵ₀)⁺.ord`: `κ = ℵ₀` gives `ω₁`, `cf = ℵ₁ > ℵ₀`. `Cofinality.lean:60` tags `exists_ordinal_cof_gt` | matches the new text | none |
| Provenance ¶2: Tag 05N2 | `β = ω` with `S` finite, `S = ℕ`; Stacks Lemma 3.7.1 | Finite `S`: `∣S∣ < ℵ₀ = cf ω`, so it factors. `T_n = {0..n}`, `id : ℕ → colim = ℕ`: no factorisation, and `∣S∣ = cf ω` is excluded. `Cofinality.lean:77` | matches the new text | none |

The other rows stand as in the review of `6888244`.

- **Change since 6888244.** 22 lines of `README.md`, in the first two Provenance paragraphs. No layer, target, supplier, reference or Lean declaration changed. Nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside the folder is empty).
- **Gate.** My run with `--base origin/main` passes every check (exit 0); the worker's run gives `build=0`. Depcheck: `depcheck: 257 roadmaps, 2432 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 8 `declaration uses sorry` warnings (lines 67, 72, 78, 85, 91, 99, 104, 112) and nothing else. The file is unchanged since 6888244. All 9 elaborated signatures keep their binders.
- **External sources opened at c496df0 (4).** AxiomMath `README.md`, `lean-toolchain` (`v4.35.0`), `lake-manifest.json` (Mathlib `inputRev` `v4.35.0`) and `StacksFrontier/SetTheory/Cardinal/Cofinality.lean`. That file imports `StacksCore.Tactic.StacksAttribute`, so `StacksCore` exists. Our pin is `v4.36.0-rc2`.
- **Stacks tags resolved (2).** 05N2 is Lemma 3.7.1 and 05N3 is Proposition 3.7.2.
- **Pinned declarations opened (3).** `Cardinal.IsInaccessible` (Regular.lean:302), `ZFSet.card_vonNeumann` (VonNeumann.lean:141) and `Cardinal.le_preBeth_ord` (Aleph.lean:633).
- **Pull request text.** The Provenance paragraph matches the head, including 05N2/05N3 and v4.35.0. The description says nothing about human review of the external code, so the change to ¶1 leaves nothing in it wrong. Its file list (3 files in the folder, none outside) and its 9 declarations are still correct.
- **Remark (untouched text, as in the review of 6888244).** Gabriel 1962 puts "Les univers de Grothendieck" (§1, p. 328) in Chapitre I, both in its table of contents and in its heading. README lines 62, 109, 128, 263 and 362, `Suggested.lean` lines 48 and 103, and the description's "Ch. 0, §1" say Chapitre 0.

Overlap check: read HanfNumbers; nothing shared. HanfNumbers owns partition calculus, Ehrenfeucht–Mostowski models and Hanf numbers, and defines no universe. `roadmaps grep` for "Grothendieck universe", `IsGrothendieckUniverse` and "inaccessible stage" on main and at the open heads finds only convention sentences (HabiroCohomologyFoundationsPartII line 41, AnalyticToricGeometryPartII line 33), so there is no other owner. The overlap file lists no dropped id, no second copy and no other pull request changing this folder.

Source independence: changed passages only. 3 passages (the ¶1 sentence on the tiers, the 05N3 clause and the 05N2 clause) were compared with 3 sources: the AxiomMath README, the `Cofinality.lean` docstrings, and Stacks Tags 05N2/05N3. The longest shared run is "ordinal whose cofinality", 3 words, forced by the statement. No sentence follows a source clause by clause. The largest share of locators is williams1969, as counted in the earlier full reviews. Contents were not compared again because no layer changed.

## Not verifiable

- The description says the AxiomMath maintainers have not been contacted. That is the author's own statement and has no public record to check.

## Source issues

- **Misprint** in AxiomMath, *The Stacks Project in Lean* at README line 7 (commit c496df0): the README gives the Lean version as v4.34.0-rc2; it should be v4.35.0, as `lean-toolchain` and `lake-manifest.json` at the same commit record; affects nothing.

## For the human reviewers

- none
