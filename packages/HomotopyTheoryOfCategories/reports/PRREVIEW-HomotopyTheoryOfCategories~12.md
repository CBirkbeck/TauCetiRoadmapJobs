# Review of HomotopyTheoryOfCategories (pull request #1521 at 013a1e4)

**Verdict:** needs changes

Incremental re-review of the 41 lines changed since 765f978, all in `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md`: the HigherToposTheory F1.8 row of the supplier table (line 58), the **Comparisons** paragraph (lines 76–82), the **From HigherToposTheory** contract (lines 200–203), the build paragraph (lines 226–229), the Theorem A sentence of 2.4 (lines 511–514), the F1.8 sentence and `*Needs:*` line of 7.2 (lines 923–927, 934–935), the Layer 7 Dependencies (lines 1001–1002) and the StableHomotopyKTheory sentence of Downstream consumers (lines 1579–1581). `Suggested.lean` and `metadata.toml` are byte-identical to 765f978. The previous report had no findings. This one has two, both P3.

## R01 (P3) — the F1.8 contract drops "for some α", misstates the endomorphism condition and leaves `≺₀` undefined

**Location.** `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md`:

- lines 200–203: "a category admits a `ReedyStructure W₁ W₂ α` exactly when every morphism factors uniquely … no non-identity endomorphism lies in `W₁` or `W₂`, and the relation `≺₀` has no infinite descending chain";
- line 58: "no endomorphisms in either class";
- lines 922–924: "`isDirect_iff_nonempty_reedyStructure` (with `α = Ordinal.{u}`). The equivalence is the case `W₁ = identities`, `W₂ = ⊤` of the characterization of HigherToposTheory F1.8".

**Claim.** The contract states what F1.8 supplies, and 7.2's equivalence is an instance of it.

**Witness.**

- *The quantifier on `α`.* HigherToposTheory F1.8 (at its open head) says "J admits a `ReedyStructure W₁ W₂ α` for some well-ordered α exactly when …". Lines 200–203 leave `α` free. Read for a given `α` the statement is false, by this README's own Check in 7.2: `C = ω + 1`, `W₁ = identities`, `W₂ = ⊤`, `α = ℕ`. Every `f` factors uniquely as `𝟙 ≫ f`, there is no non-identity endomorphism, and no infinite descending chain, yet no `ℕ`-valued structure exists, since `deg ω` would exceed every `deg n`.
- *The same gap in 7.2.* F1.8 yields a structure for *some* `α`. `isDirect_iff_nonempty_reedyStructure` fixes `α = Ordinal.{u}`, which F1.8 alone does not give. The step from "some `α`" to `Ordinal.{u}` is the rank of the same subsection.
- *Line 58.* Identities are endomorphisms and lie in both classes (the classes are multiplicative). F1.8 excludes only non-identity endomorphisms.
- *`≺₀`.* It is Lurie's notation, introduced in HigherToposTheory F1.8 and nowhere in this README. Whether it is strict decides the statement. Take the walking isomorphism `a ≅ b` with `W₁ = identities`, `W₂ = ⊤`: factorization is unique and there is no non-identity endomorphism. With `≺₀` strict (`X ≠ Y`), `a ≻₀ b ≻₀ a ≻₀ ⋯` is an infinite descending chain, the condition fails, and the category is correctly excluded (it is not direct). With "chains of pairwise distinct objects" there is no such chain and the characterization would wrongly admit it.

**Repair.**

- Lines 200–203: "a category admits a `ReedyStructure W₁ W₂ α` for some `α` as in convention 15 exactly when every morphism factors uniquely as a `W₁`-morphism followed by a `W₂`-morphism, no non-identity endomorphism lies in `W₁` or `W₂`, and the relation `≺₀` (`X ≺₀ Y` when `X ≠ Y` and there is a `W₂`-morphism `X ⟶ Y` or a `W₁`-morphism `Y ⟶ X`) has no infinite descending chain".
- Line 58: "no non-identity endomorphisms in either class".
- Lines 923–926: "With some `α` in place of `Ordinal.{u}`, the equivalence is the case `W₁ = identities`, `W₂ = ⊤` of … ; the rank below gives `α = Ordinal.{u}`."

Tested on the refuting instances: `ω + 1` now satisfies both sides (`α = ω + 1` or `Ordinal.{u}`, `deg = rank`); the walking isomorphism fails both sides.

## R02 (P3) — the pull-request description no longer matches the supplier contracts

**Location.** The description, under "Ownership and suppliers": "It consumes: … StableHomotopyKTheory §§2.30, 2.31, 2.34 (homology spectral sequence of a functor, Quillen's Theorems A and B)"; and the generated `depends-on` block, which lists GrothendieckInfinityGroupoids and StableHomotopyKTheory only.

**Claim.** The list is what the roadmap consumes, and the block lists the suppliers still open.

**Witness.** At the head:

- lines 200–203 add HigherToposTheory F1.8 as a supplier (also line 58, the `*Needs:*` line of 7.2 at 934 and the Layer 7 Dependencies at 1001). HigherToposTheory is a new roadmap in an open pull request, and neither the list nor the `depends-on` block names it;
- lines 77–79 now say of StableHomotopyKTheory §2.31 that it is "compared with 2.4 and none is an input to it", and the contract at lines 193–198 consumes §§1.21, 2.26, 2.29, 2.30 and 2.34, not 2.31.

**Repair.** In the description, replace the StableHomotopyKTheory bullet by "StableHomotopyKTheory §§1.21, 2.26, 2.29, 2.30, 2.34 (`π₁(BC)`, homotopy colimits and Thomason's comparison, the homology spectral sequence of a functor, Quillen's Theorem B)", add a bullet "HigherToposTheory F1.8 (the characterization of Reedy structures), for 7.2", and have the `depends-on` block regenerated so that it lists HigherToposTheory.

## Previous findings

The previous report (PRREVIEW-HomotopyTheoryOfCategories~11, at 765f978) had no findings, so there is nothing to account for.

## Verified sound

**Gate and build.**

- The worker's gate at this head: every check 0, including `build=0` and `depcheck=0`, result `OK`.
- My re-run of the gate (`gate … HomotopyTheoryOfCategories --base origin/main`): every text scanner 0 (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, metadata, stray-files, dirty, outside-folder, source-material). The one non-zero check is `depcheck=1`, "NOT IN ORDER: HomotopyTheoryOfCategories (insert it after its last supplier)", read against the public merge order, which does not list this roadmap yet. By the brief that is not a finding.
- The dependency check against the candidate order prints `depcheck: 234 roadmaps, 2265 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line. The candidate order has StableHomotopyKTheory at line 16 and this roadmap at line 17. HigherToposTheory is not in the order: it is another author's open pull request that adds a new roadmap folder, which the brief permits as a supplier.
- `lake env lean` on `TauCetiRoadmap/HomotopyTheoryOfCategories/Suggested.lean`, from the worktree: exit 0, 52 "declaration uses `sorry`" warnings, no other message.
- The Lean file is unchanged since 765f978, so the `#check @name` signature comparison, the one-tactic padding probe and the reading of the 41 "lost binder" leads as universe renderings stand from PRREVIEW-HomotopyTheoryOfCategories~7 to ~11.
- Pins, from `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopyTheoryOfCategories'` is empty. The files listed in the change summary come from the merge of main into the branch (a495ae40), not from the pull request.

**Cross-roadmap citations resolved (7, all at the open heads).**

- HigherToposTheory F1.8 "Reedy categories": exists; it states the characterization "for some well-ordered α", with `≺₀` as "a `J^R`-map `X ⟶ Y` or a `J^L`-map `Y ⟶ X`" and its proposed `r.Prec` requiring `X ≠ Y`. Its `*Needs:*` is Mathlib `HomotopicalAlgebra.ReedyStructure` only.
- HigherToposTheory L5.4 "Joyal's Theorem A": exists; `SSet.isCofinal_iff_isWeaklyContractible` (HTT Theorem 4.1.3.1) and "Quillen's Theorem A" (HTT Corollary 4.1.3.3) with `C ×_D D_{d/}`, matching "for cofinal maps of simplicial sets" and "with comma categories `d\F`".
- StableHomotopyKTheory §1.10 (a natural transformation induces a homotopy), §1.11 (adjoints induce homotopy equivalences), §1.12 (initial or terminal object gives contractibility): exist, with realised classifying spaces, as the Comparisons paragraph says.
- StableHomotopyKTheory §2.31 `quillenTheoremA`: contractible `B(F↓d)` makes `BF` a homotopy equivalence, with the opposite-category dual. This matches "for realised nerves, with homotopy equivalences".
- The Downstream-consumers sentence: StableHomotopyKTheory's Scope paragraph does name this roadmap as owner of Theorem A for an arbitrary basic localizer (its §§2.3–2.4), compares it with §§1.10–1.12 and 2.31, and says this roadmap "is a consumer of this one and not a supplier".
- No cycle: HigherToposTheory's README does not mention this roadmap; StableHomotopyKTheory mentions it only as owner and consumer. This README cites neither §2.31 nor §§1.10–1.12 in a `*Needs:*` line (2.3 and 2.4 need 2.1 and Mathlib only).

**Source locator checked.** HTT Corollary 4.1.3.3, cited in 2.4: Lurie's text (the copy on his page, lines 11291–11294 of the cached extraction, PDF p. 256) states it for a functor of ordinary categories with `C ×_D D_{D/}` weakly contractible, concluding a weak homotopy equivalence of nerves. The `d\F` form in the README is the source's.

**Library declarations opened at the pin (unchanged, relied on by the changed text).** `HomotopicalAlgebra.ReedyStructure` (`Mathlib/AlgebraicTopology/Reedy/Basic.lean` line 45), `SimplexCategory.reedyStructure` (`Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean` line 42). `Suggested.lean` lines 590–602 state `isDirect_iff_nonempty_reedyStructure` with `Ordinal.{u}` and `IsDirect.of_reedyStructure` for any `α : Type w` with Mathlib's instance list, as 7.2 describes.

**Seeded sample.** Of the fifteen targets, 2.4 contains changed lines and 2.3 is cited by them; both are in the table below. The other thirteen are untouched and stand from the earlier reports.

**Overlaps.** The overlap report lists no other pull request changing this roadmap, no cited id that an open pull request drops and no id only an open revision defines. Ownership after the change: this roadmap owns Theorem A for a basic localizer and direct categories; HigherToposTheory owns the general Reedy characterization and the simplicial Theorem A; StableHomotopyKTheory owns the topological forms. No object has two owners.

**Adversarial table.** Rows for statements the diff leaves untouched are carried forward: the 49 rows of PRREVIEW-HomotopyTheoryOfCategories~7 (0.1–13.3), the 1.4, 4.1, 4.6 and 12.6 rows of ~8, the 1.4 and 8.3 rows of ~9, the 8.3-remark and Out-of-scope rows of ~10 and the six rows of ~11. The rows below cover the changed statements.

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| F1.8 contract (lines 200–203), `α` read as given | `C = ω + 1`, `W₁ = identities`, `W₂ = ⊤`, `α = ℕ` | Right side: factorization `𝟙 ≫ f` unique; no non-identity endomorphism; strict `≺₀` is `<`, well-founded: true. Left side: `deg ω > deg n` for all `n` is impossible in `ℕ`: false. | false as written; true with "for some `α`" (R01) |
| F1.8 contract | `C = [1]`, same classes, `α = ℕ` | Right side true. Left side: `deg 0 = 0`, `deg 1 = 1`. | true |
| F1.8 contract, `≺₀` | walking isomorphism `a ≅ b`, same classes | Unique factorization and no non-identity endomorphism hold. Strict `≺₀`: `a ≻₀ b ≻₀ a ⋯` infinite, right side false. Left side false (`DirectRel` chain; an isomorphism in a Reedy structure is an identity). | true only with `≺₀` strict; definition needed (R01) |
| F1.8 contract, both classes nontrivial | `Δ`, `W₁` epimorphisms, `W₂` monomorphisms | Right side: epi–mono factorization unique; an epi or mono endomorphism of `[n]` is `𝟙`; each `≺₀` step lowers `len`. Left side: `SimplexCategory.reedyStructure`, `α = ℕ`. | true |
| Line 58, "no endomorphisms in either class" | any `C`, `𝟙 X` | `𝟙 X` is an endomorphism in `W₁` and `W₂`. | literal reading false (R01) |
| 7.2, "`≺₀` is `DirectRel`" | `SingleObj (ℤ/2)`; `ℤ`; empty category | `ℤ/2`: non-identity endomorphism in `⊤`, F1.8 condition fails; `DirectRel ★ ★` holds, not direct. `ℤ`: `≺₀` chain `⋯ < −1 < 0`, not direct. Empty: all conditions vacuous, direct, empty degree map. | both sides agree in each case |
| 7.2, "the equivalence is the case … of F1.8" | `C = ω + 1` | F1.8 gives some `α`; the Lean statement asks `Ordinal.{u}`: `deg = rank`, `rank ω = ω`. The passage from "some `α`" to `Ordinal.{u}` uses the rank, not F1.8. | true after the R01 rewording |
| 2.4, "with comma categories `d\F`" | `F : e ⥤ [1]` picking `1`, `W∞` | `0\F` and `1\F` are one-point categories: contractible, so the `d\F` form gives `F ∈ W∞` (true, `[1]` has a terminal object). `F/0` is empty: the slice form does not apply. The label `d\F` matters and matches HTT Corollary 4.1.3.3. | true |
| 2.4, same sentence | `F : e ⥤ [1]` picking `0` | `F/0`, `F/1` one-point: the slice form of 2.4 applies. `1\F` is empty: the `d\F` form does not. Consistent with the Check "`e ⥤ [1]` picking `1` is in `W` and not aspherical". | true |
| Comparisons, "§§1.10–1.12 are the homotopy forms of 2.3" | `[1] ⥤ e` and `0, 1 : e ⥤ [1]` | 2.3: both functors `e ⥤ [1]` are in `W` (membership). §1.10: `0 ⟶ 1` gives a homotopy `B(e) × I → B[1]` between the two realised maps. §1.12: `B[1]` contractible. Membership in `W₀` holds for `e ⊔ e ⥤ e ⊔ e` with no homotopy statement needed. | consistent |
| Downstream consumers, StableHomotopyKTheory sentence | StableHomotopyKTheory Scope paragraph | It names §§2.3–2.4 here, §§1.10–1.12 and 2.31 there, and "not a supplier". | matches |

**Remarks on untouched text** (no change requested): in 8.3, line 1018 still holds the single word "its"; the paragraph renders correctly.

## Not verifiable

- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993 are `uncertified` in the manifest and cited by locator. No changed line cites them.
- Hirschhorn 2003 (8.3) remains verified through secondary sources only, as in the previous report. No changed line cites it.

## Source issues

- none
