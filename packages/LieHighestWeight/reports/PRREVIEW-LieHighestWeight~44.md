# Review of LieHighestWeight (pull request #1220 at cf5c2bd)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

Incremental re-review of the 116 lines of `README.md` changed since `ab80440`. 2 findings, both P3 and both carried from the previous review; 0 blocking. The four previous findings that concerned the folder (the ReductiveGroups cycle, the Part II owner, the former-layer rows, the pinned centre action) are repaired, and the repairs introduce no new problem. Nothing in the folder needs a change: what remains is one sentence of the family index and two sentences of the generated description block.

`README.md` and `Suggested.lean` below are the folder's files. Library paths start with `TauCeti/` and are read at the pins of this head's manifest. "Main" is the roadmap repository's main branch.

## R01 (P3) — The family index still assigns PBW to this roadmap

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:82–84`, "The highest-weight roadmap owns the concrete PBW project; Ado–Iwasawa consumes its injectivity, ordered-monomial, filtration, domain, and Noetherian consequences".

**Claim:** Ado–Iwasawa receives PBW from this roadmap.

**Witness:** `README.md:71–73` of this folder: "AdoIwasawa consumes native ordered PBW directly; this roadmap's additional exports are the central-monic finiteness adapter, the normalized symmetrization and the first-order bracket". Previous R05; no file outside the folder changed since `ab80440`, and the description lists the sentence as open. The pull request already edits lines 36–39 of the same file.

**Repair:** Replace the sentence by: both roadmaps consume Tau Ceti's PBW basis, filtration, domain and Noetherian theorems; the highest-weight roadmap adds the central-monic finiteness adapter that Ado–Iwasawa uses.

## R02 (P3) — Two sentences of the generated summary describe content the head does not have

**Location:** pull-request description, block `roadmap-summary`: "while the type-A tensor decomposition weakens the highest-weight gap bound from strict to weak inequality" and "general-linear comparisons and applications to compact group centers as targets".

**Claim:** These describe the head.

**Witness:** The README has no type-A stable tensor decomposition. `README.md:109–117`: "The compact-group applications of this theory are not targets of this roadmap: … so they follow LieGroups in the order of supply and are not targets of this roadmap". The author's text below the block says the same. Previous R06; the block is unchanged.

**Repair:** Regenerate the `roadmap-summary` block from this head. The author's own text was compared with the head sentence by sentence and matches: fifteen theorems and one definition, former Layers 0, 1, 2, 4, 5 and 6F in the table, ReductiveGroups Layer 10C named once (`README.md:742`), no simplicity binder on the Serre headline.

## Previous findings

- R01 — repaired: `README.md:123–127`, "is not a target of this roadmap either: ReductiveGroups consumes the split Serre presentation of Layer 7, so nothing of ReductiveGroups is consumed here". No `*Needs:*` line or contract names ReductiveGroups; §9.2 uses `Sym(L)^L` throughout.
- R02 — repaired: `README.md:116–119`, "are not targets of this roadmap. The type-A group character identity is ClassicalGroups Layer 4, and the density and irreducibility halves of the unitary comparison are native". No Part II is named anywhere in the README.
- R03 — repaired: `README.md:63`, `67`, `68`, rows "Layer 0: `sl₂` representation theory", "Layer 5: complete reducibility (Weyl's theorem)" and "Layer 6F: Fourier boundary values of the Weyl formula".
- R04 — repaired: `README.md:490–503` and `1616–1651`; the four pinned declarations are cited and the target is "for dominant integral `λ, μ` … `χ_λ = χ_μ` implies `λ = μ`", by the cone route.
- R05 — not repaired: family index lines 82–84, "The highest-weight roadmap owns the concrete PBW project". Written again as R01.
- R06 — not repaired: the `roadmap-summary` block is unchanged. Written again as R02.

## Verified sound

**Gate, build, direction of supply.** The worker's gate passes with every counter 0. My rerun differs only in `outside-folder=1` for `TauCetiRoadmap/RepresentationTheory/README.md`, the family index, which is this pull request's own; the diff against main outside the folder and the family index is empty. `lake env lean` on `Suggested.lean`: exit 0, fifteen `sorry` warnings, nothing else. Dependency check:

```text
depcheck: 235 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The two-way edge the check cannot see was read directly: the README names ReductiveGroups three times (lines 125, 126, 742), each time to say it is not consumed or that a model differs, and LieGroups only as a consumer of §7.1.

**`Suggested.lean` is unchanged since `ab80440`** (the change set is `README.md` alone), so the signature comparison, the one-tactic probes (0 of 15 closed), the headline list and the four "not statable" claims of the previous report stand as written there. No changed README passage touches a Lean statement: the new separation target has no Lean counterpart, which is right for a short corollary of pinned lemmas.

**Library declarations opened at the pin for the changed passages (17).**

- `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:151` (`exists_int_of_hasEigenvalue`), `Sl2/WeightString.lean:324` (`finrank_eq_of_hasPrimitiveVectorWith`), `Sl2/ClebschGordan.lean:275` (`Sl2Std.isInternal_cgSummand`): the former Layer 0 row.
- `TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean:259` (`exists_isCompl_of_isKilling`), `UniversalEnveloping/Casimir.lean:125` (`casimirElement`): the former Layer 5 row.
- `HighestWeight/CentralCharacter/Isotypic.lean:121`, `127`, `164`, `180`. Lines 121 and 127 sit before the `[IsAlgClosed K] [FiniteDimensional K M]` block opened at line 138, lines 164 and 180 after it; the README states exactly that split. The file's docstring says the dominant-weight separation "is not proved here", and no other pinned theorem about `vermaCentralCharacter` states it (ten were listed and read by name).
- `CentralCharacter/Isomorphism.lean:159` (`vermaCentralCharacter_eq_iff`, `χ_λ = χ_μ ↔ ∃ w, w·λ = μ`).
- `TauCeti/LinearAlgebra/RootSystem/Weyl/DominantIntegral.lean:251` (`sub_dotAction_mem_posRootCone_of_dominantIntegral`: `[Invertible (2 : R)]` only, no order, conclusion `λ − w·λ ∈ Q⁺`); `RootSystem/Positive.lean:483` (`eq_zero_of_add_eq_zero_of_mem_posRootCone`).
- `HighestWeight/Basic.lean:286` (`IsDominantIntegral`: natural-number pairing with each simple coroot, the same shape as the hypothesis of line 251, so the route applies without transport).
- `UniversalEnveloping/PBW/Symmetrization.lean:412` (`pbwSymmetrization_mem_center_iff`), `LinearAlgebra/SymmetricAlgebra/LieModule.lean:171` (`lieInvariants`).
- `TauCeti/RepresentationTheory/ClassicalGroups/UnitaryTrick.lean`: its docstring states Zariski density of U(n) and equality of invariant subspaces and of irreducibility, as Scope says.

**Cross-roadmap citations resolved for the changed passages (on main).** LieHighestWeight's own headings at lines 319, 567 and 870 carry the three former titles the new rows use. TensorProductCombinatorics §1.5 (line 599), §1.6 (line 694, "Rational cone series, Fourier boundary values and lattice endpoints") and §2.6 (line 1191); its lines 76 and 2575 are the two citations of Layer 6F, which the new row now serves. LieGroups line 795 cites Layer 0's `sl₂` strings, which the new row sends to pinned declarations. ReductiveGroups line 3111 still needs Layer 7 here, and nothing here needs ReductiveGroups. ClassicalGroups Layer 4 and CharacteristicClasses C5 as in the previous report.

**Sources.** Of the seeded sample, only §7.1 and §9.2 fall in changed passages. The new §7.1 bullet is a derived statement whose inputs are pinned declarations; it makes no source claim, and the locators of the surrounding Harish-Chandra statements are unchanged and were verified in the previous report. In §9.2 the change removes a passage; the Dixmier §1.6 locator at line 2414 is untouched. The other ten sampled subsections are untouched; the previous report's table stands.

**Overlaps.** #1797 still conflicts in both files; the generated merge-order block puts it first and the description says this pull request is rebased after it: no finding. No id is dropped; the citation resolver lists nothing missing.

**Adversarial table.** Rows for the changed statements, computed for this review. For every statement the diff leaves untouched (all fifteen headlines and Layers 0, 3, 5, 6, 8, 10), the rows of the previous report (review at `ab80440`, "Adversarial table") carry forward unchanged.

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| §7.1 separation: dominant integral `λ, μ`, `χ_λ = χ_μ ⇒ λ = μ` | A₁ with `ρ = 1`, weights as integers; rank 0 | dot orbits `s·n = −n−2`: {0,−2}, {1,−3}, {2,−4}; each contains one integer ≥ 0; rank 0: `0 = 0` | holds |
| §7.1 route | general; A₁, `λ = 0`, `w = s` | `λ − w·λ ∈ Q⁺` and `μ − w⁻¹·μ = μ − λ ∈ Q⁺`, sum 0, so both 0; `0 − (−2) = 2 = α ∈ Q⁺`, and `−2 − 0 = −α ∉ Q⁺` because `−2` is not dominant | both dominance hypotheses used |
| §7.1 Check 1 (negative control) | `λ = 0`, `μ = −2` | same central character, `λ ≠ μ`, `μ(h) = −2 < 0` | statement without dominance of `μ` is false, as the Check says |
| §7.1 Check 2 | `((h+1)² − 1)/3` at 0, −2, 1, −3 | 0, 0, 1, 1 | agrees; agrees with the untouched orbit Check above it |
| §7.1 Check 3 | `A₁ × A₁`, (2,0) and (0,2), factor Casimir scalar `n(n+2)` | total 8+0 = 0+8; first factor 8 versus 0 | single Casimir fails, full centre separates |
| §7.1 reading on modules | `V(0) ⊕ V(1)` for sl₂ | centre eigenspaces for `χ₀`, `χ₁` (Casimir scalars 0, 3) are the two isotypic components | eigenspace decomposition = isotypic decomposition |
| §9.2 centrality by generators | sl₂, `C = h² + 2h + 4fe` | `[e,h²] = −2eh − 2he`, `[e,2h] = −4e`, `[e,4fe] = 4he`; sum `2[h,e] − 4e = 0`; `e, f, h` generate `U` | holds; no group needed |
| §9.2 `gr Z(U(L)) ≃ Sym(L)^L` | sl₂; abelian `L = K` | `Z = K[C]`, symbol `h² + 4ef`, `Sym^L = K[h² + 4ef]`; `Z = U = Sym = K[x]` | agree |
| §9.2 symmetrization on invariants | sl₂, `p = h² + 4ef` | `h² + 2(ef + fe) = h² + 2h + 4fe = C`, central; `p` is `ad`-invariant (untouched row of the previous report) | lands in the centre; the README claims linearity only |
| Scope: group comparison removed | characteristic p, `G_m`, weight-p character | differential 0, character nontrivial | the removed equality needed characteristic 0 and connectedness; nothing here states it now |
| Former-numbering table | identifiers on main and here | main: 0–10 and 6F; table: 0, 1, 2, 4, 5, 6F; cited from outside: 0 (LieGroups 795), 6F (TensorProductCombinatorics 76, 2575) | every externally cited former identifier has a row |
| Layer 0 remark on ReductiveGroups Layer 10C | diagonal weight | weight of `e_i^d` is `(d−i, i)`; the sentence now only says the conventions differ | no dictionary promised, none owed |

Remark on untouched text, no change asked: none found in the passages adjacent to the diff.

## Not verifiable

- `HumphreysIntroLieAlgebras`, `BourbakiLie78`, `GoodmanWallachSymmetry`: settled uncertified; not read.
- Dixmier §1.6 (`README.md:2414`): no readable legal text on this worker; the locator is untouched by this change.
- The ten sampled subsections outside the diff and the Layer 8 locators were not re-read in this incremental round; the previous report read them.
- The five closest open roadmaps were not re-read: the change adds no construction that another roadmap could own (it removes one and cites pinned declarations for another).

## Source issues

- none
