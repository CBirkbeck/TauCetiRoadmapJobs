# Review of BordismFormalGroups (pull request #1807 at 64a16e1)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since 3adc047. `TauCetiRoadmap/BordismFormalGroups/README.md` and `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` are byte-identical at 3adc047 and at 64a16e1 (md5 `021a9f96…` and `20256d6c…` at both heads). The only commit in the increment (64a16e11) touches `TauCetiRoadmap/ComplexKahlerGeometry/README.md` and `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean`. This brief declares that folder as the pull request's own. This roadmap does not cite ComplexKahlerGeometry, and ComplexKahlerGeometry does not cite this roadmap. The gate passes and no finding remains.

## Previous findings

- none: the previous report (r37, at 3adc047) listed no findings of its own, and it accounted for every earlier finding as repaired. There is nothing to carry forward.

## Verified sound

**Scope of the increment.**
- `git diff --stat 3adc047..HEAD -- TauCetiRoadmap/BordismFormalGroups` is empty. Each file's md5 equals the md5 of its copy at 3adc047 (`git show 3adc047:<file> | md5sum`).
- `git diff --stat 3adc047..HEAD` lists 2 files: `TauCetiRoadmap/ComplexKahlerGeometry/README.md` (1178 lines) and `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` (137 lines).
- Over the whole pull request, `git diff --name-only origin/main...HEAD` lists 22 files. Filtering out the fourteen declared folders leaves nothing (grep exit 1).
- `lake-manifest.json` and `lean-toolchain` are unchanged against origin/main. The Tau Ceti pin is `2fd255d9`.
- Main moved from b0fe353 to 8d9e0a0 during this review. The new commit is a progress report for ChevalleyGroups and touches nothing this roadmap reads.

**The ComplexKahlerGeometry increment against this roadmap.**
- `grep -n "ComplexKahler\|Kähler\|Kahler"` on this README finds nothing.
- `grep "BordismFormalGroups\|Bordism"` on ComplexKahlerGeometry's README and Suggested.lean finds nothing, at this head or at 3adc047.
- I grepped the added and removed lines of the increment for this roadmap's objects (Steenrod, Thom, MO, MU, formal group, Lazard, Adams, bordism, cobordism, Todd, chromatic). The only hits are the surface-genus dictionary and the Chern connection, which are ComplexKahlerGeometry's own objects and are not cited here.
- No supply edge of this roadmap changes, and the dependency check below confirms that no cycle closes through it.

**Gate.** I re-ran it at 64a16e1 with `--base origin/main`:

```
gate BordismFormalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=20 source-material=0 FAIL
```

The only non-zero rule is `outside-folder=20`. The gate prints the first ten of those files, all in AlgebraicCurves, AlgebraicTopology, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry and GeneralizedCohomology. The `git diff --name-only` filter above shows that all 22 changed files lie in folders this brief declares as the pull request's own. The worker's gate, which allows those folders, records `outside-folder=0 build=0 OK`. This line is not a finding.

**Dependency check** (`--movable`, against content main 8d9e0a0):

```
depcheck: 240 roadmaps, 2368 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` exits 0 in 7 s. Its single warning is `56:8 declaration uses 'sorry'`. Both `TauCeti.*` imports have object files at the pin.

**`#check @name`.** I ran it on a scratch copy against the README. The elaborated type is `∀ {k} [Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm], Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p`. It matches README lines 270–276 binder for binder, and no binder was lost. The `,` and `and` entries in `signatures.md` come from the tool parsing the module docstring as code; they are not declarations.

**The pinned declarations the docstring and README name**, opened at Tau Ceti `2fd255d9`:
- `TauCeti.FormalGroupIso.height_eq : F.height p = G.height p` for `e : FormalGroupIso F G` over any field. Confirmed by `#check`, and the underlying `height_eq` is at `Height/Basic.lean:316`.
- `FormalGroup.height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` is at `RingTheory/FormalGroup/Logarithm/InfiniteHeight.lean:278`. It needs `[Fact p.Prime] [CharP K p] [F.IsComm]` and gives `F.height p = ⊤ ↔ Nonempty (FormalGroupIso F 𝔾ₐ)`, which is the infinite-height case the docstring at Lean line 54 and README line 259 attribute to it. The name is unknown under the file's two imports only because its module is not imported, and it is cited, not used.
- `FormalGroup.height : FormalGroup K → ℕ → ℕ∞` (`#check`).
- No Lean name in the pinned `RingTheory/FormalGroup` tree contains `IsSepClosed` or `IsAlgClosed`, and no `*formalGroupIso_iff_height*` theorem exists there. The headline is therefore not at the pin.

**Padding probe.** On a scratch copy, `simp` fails ("made no progress") and `rfl` fails (the two sides are not definitionally equal). `exact ⟨fun ⟨e⟩ => e.height_eq p, fun h => by exact?⟩` closes the converse only by citing the probe theorem itself, so no library lemma closes it. The headline is not padding.

**Headline theorems.** These are unchanged. Lazard's height classification is stated. The module docstring names each headline that is not statable at the pins, with its missing carrier: Lubin–Tate, Quillen `L ≅ MU_*` and Thom `π_*MO`, Conner–Floyd, Landweber, Devinatz–Hopkins–Smith and Hopkins–Smith, Hopkins–Ravenel smashing and fracture, Greenlees–Sadofsky/Kuhn Tate vanishing, and torus Euler cancellation.

**Seeded sample.** All seven targets are in untouched text, at README lines 120, 162, 202, 251, 346, 487 and 2126. The locator checks from earlier reports stand. As fresh evidence I re-checked three of them at this head:
- **Height and Lazard's classification** (lines 251–277). Ravenel, Theorem A2.2.12 is at ravenel-green line 20790 (printed page 387). Its hypotheses are a separably closed field of characteristic p>0, and a law of height n is isomorphic to F_n, with n=∞ giving the additive law (line 20795). These are the hypotheses and conclusion stated here.
- **Exponent two** (lines 202–250). Every one of the 17 Tau Ceti names in the paragraph exists at the pin, in the module the README names. Examples: `exponentTwoLog` at `ExponentTwo/Basic.lean:64`; `existsUnique_logarithm_of_nsmulSeries_eq_zero` at `Logarithm/InfiniteHeight.lean:249`; `exponentTwoExp` and `exponentTwoLogIso` at `ExponentTwo/Iso.lean:72,128`; `ExponentTwoLazardRing.lift`, `grading` and `gradedLift` at `ExponentTwo/Universal.lean:215,258,332`.
- **Unoriented coefficients** (lines 487–522). Miller, Chapter 1 has Proposition 10.4 at miller-cobordism line 1023 (a connected Hopf algebra over a field, and a connected module coalgebra with A→M monic, is free), Theorem 12.1 at line 1226, Corollary 12.2 at line 1238, Theorem 12.3 at line 1239 and Theorem 12.4 at line 1261. Section 13, line 1373, states `π_*MO = F₂[x_n : n ≠ 2^i−1]` and leaves the proof to Thom. That is why the README cites Thom 1954 alongside it.

The README flags no locator as unverified.

**Cross-roadmap citations resolved (2).**
- GeneralizedCohomology G2.11 is cited at README lines 1897 and 2378. It is item 11 of §G2, "Enriched, quasicategorical and monoidal foundations", at `TauCetiRoadmap/GeneralizedCohomology/README.md:669` at this pull request's own head. Main has no G2.11 (`grep -c` gives 0) because this pull request adds it by moving F6.5's generic foundations there, as its description says.
- `roadmaps resolve` reports no unresolved citation or Lean name (`citations.md`: none).

**Overlap leads (`overlaps.md`), each checked.**
- #1808 and #1854 both change this README. Their copies differ from this head by 410 lines (#1854) and 421 lines (#1808), and both carry the older text. This pull request's merge-order paragraph says no open pull request must merge before it, and that the stacked ModularCurves/SchemeAndStackFoundations move (#1808) follows it, so the order is stated.
- G2.11 is listed as "only an open revision defines" for #1808 and #1854, but it is defined at this pull request's own head (above), so it is not a dependency on those revisions.
- No cited id is dropped by an open pull request, and this pull request drops no id of this roadmap.

**Ownership and duplication.** `roadmaps grep` for `nonempty_formalGroupIso_iff_height_eq`, and for the statement shape `FormalGroupIso F G) ↔`, finds it only in this roadmap's own folder (at this head and in the #1808 and #1854 copies of the same folder). No other roadmap, on main or open, declares it.

**Adversarial table.** The folder is unchanged, so no row is required for a changed statement. The rows marked "this round" were recomputed at 64a16e1; the others are carried from r37, which computed or carried them.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `nonempty_formalGroupIso_iff_height_eq` (Lean 56–58; README 270–276), this round | 𝔾ₐ vs 𝔾ₘ over 𝔽̄_p; F=G; 𝔾ₘ and a ℤ_p^×-twisted form over 𝔽_p; forward direction at the pin | heights ⊤ and 1 (`height_𝔾ₐ`, `height_𝔾ₘ`), no iso, so both sides are false; F=G makes both sides true; the twist has height 1 but no iso over 𝔽_p, so `IsSepClosed` is needed, and it is in the signature; `FormalGroupIso.height_eq` proves → over any field, and `IsSepClosed` occurs nowhere in the pinned FormalGroup tree | true, not padding | none |
| Unoriented coefficients Checks (README 517–522), this round | degrees 1–5; wrong model A_* = 𝔽₂[ξ_k, ξ_k²] | π₁=π₃=0 and π₂=𝔽₂x₂; π₄ has rank 2 (x₄, x₂²); in degree 5, H_*(MO) has 7 (partitions of 5), A_* has 2 (ξ₁⁵, ξ₁²ξ₂), P has 1 (x₅); Σ dim A_i·dim P_(5−i) = 1+2+0+2+0+2 = 7 | true | none |
| Owners sentence, lines 31–33: TopologicalKTheory fixes β=[O(−1)]−1 on CP¹ (r37) | TopologicalKTheory Conventions 243–245; wrong model β′=[O(1)]−1 | L=O(−1), β=[L]−1; [O(1)]=1−β, so β′=−β≠β | true | none |
| F2 K-theory law, lines 329–333 (r37) | a=[L⁻¹], b=[M⁻¹], ux=a−1, uy=b−1; restriction to CP¹ | x_K(L⊗M)=x+y+uxy; restriction u⁻¹β=+1 (β′ gives −1); a₁₁=u of degree 2 | true | none |
| Steenrod/Adams target, lines 346–427 (r37) | RP^∞ class; Milnor degrees at p=2,3; d₂ bidegree; M(ℤ/2^∞) | Sq¹a=a², Sq²a=0; \|ξ₂\|=3 at p=2; \|ξ₁\|=4, \|τ₁\|=5 at p=3; d₂:(1,2)↦(3,3); derived π₁=ℤ₂ | true | none |
| James construction, lines 1002–1019 (r37) | Y=S², Y=S⁰; wrong model J₂/J₁=S²×S² | J₂/J₁=S⁴; H₂(J₂S²)=ℤ vs rank 2; J(S⁰)=ℕ vs ℤ | true | none |
| Lemma A2.2.7 general form; universal strict coordinate; obstruction in degree p^k (README 80–87, 139–146, 288–299) (r37 from r27) | f=X^p, X^(p²) over 𝔽_p; height 2 over 𝔽₂; 𝔾ₐ vs 𝔾ₘ over 𝔽₂ | h=1, h=2 with g=id; degree-2 part 2XY=0; control coefficient XY≠0 | true | none |
| Height, exponent-two, Lazard grading, `lazardGcd`, invariant differential, log/exp, Frobenius-twist and n-series Checks (README 64–79, 122–132, 150–245, 251–269) (r37 from r14) | r14 instances | r14 values | true | none |
| Toda brackets, Kudo–Borel, Milnor, MU/MO Hurewicz, π₀MO, Serre–Cartan basis, K(n)-local Tate, smooth implies PL (r37 from r9) | r9 instances | r9 values | true | none |

**Policy.** The scanners report `prnum=0 round-labels=0 private-paths=0 latex=0 tex=0 set_option=0 sorry-data=0 stray-files=0`. `PROGRESS.md`, `STATUS.md` and `metadata.toml` in the folder are unchanged against main and are accepted by `stray-files`.

**Remark on untouched text** (not a finding). As r32 and r37 noted, the README keeps the layout it has on main: the title has no "Roadmap:" prefix, the opening section is "Carriers, conventions and owners", and there are no per-layer `### Examples` and `### Dependencies` headings. Earlier reviews passed this shape.

## Not verifiable

- Bousfield (1979) Theorem 6.6, Thom (1954) Chapitre IV, Quillen (1971), Devinatz–Hopkins–Smith (1988), James (1955), Toda (1962), Johnson–Wilson (1975), Würgler (1976), Greenlees–Sadofsky and Symonds. These are recorded as uncertified, cited by locator, and untouched in this increment.
- Whether TangentialBordism and StringOrientation, at their open heads, consume F2 and F3–F5 as the consumer sentences say. That is for their own reviews; the sentences make no supplier claim of this roadmap.

## Source issues

- none
