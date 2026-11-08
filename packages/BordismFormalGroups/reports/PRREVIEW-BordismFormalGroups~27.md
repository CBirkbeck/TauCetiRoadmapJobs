# Review of BordismFormalGroups (pull request #1807 at 3e107fa)

**Verdict:** needs changes

This is an incremental re-review: 0 lines of the folder changed since 7e8275c. `git diff --stat 7e8275c..HEAD -- TauCetiRoadmap/BordismFormalGroups` prints nothing, and the md5 sums of `README.md` (8df92e05…) and `Suggested.lean` (20256d6c…) are the same at both heads. Since 7e8275c the pull request has changed only RigidAnalyticGeometry and TopologicalKTheory. Neither names this roadmap. README line 329 relies on TopologicalKTheory's Bott-class convention, which the rewrite left unchanged in substance.

The gate fails when re-run at this head. The project's dropped-names list now contains HomotopySpheres, and the README names it three times (R01). The worker's `gate.md` recorded `dropped=0`. Line 329's citation of the rewritten TopologicalKTheory README uses an undefined abbreviation and gives no section (R02). Both findings are P3. Nothing is blocking, but a gate failure excludes acceptance.

## R01 (P3) — the README names a roadmap on the project's dropped-names list

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md`:
- lines 44–45: "HomotopySpheres consumes F4's Toda brackets and F6.2's James construction."
- lines 425–426: "TangentialBordism and HomotopySpheres consume these operations, algebras and towers."
- line 1013: "…targets of the James–Hopf maps of item 3; HomotopySpheres consumes them."

**Claim.** The push gate refuses any mention of a name on the project's dropped-names list, even in a consumer sentence. HomotopySpheres is on that list, and it is not a roadmap on main.

**Witness.** The gate re-run at 3e107fa with `--base origin/main` reports `dropped=3` and lists exactly these three lines. Every other rule is 0 except `outside-folder`, which is explained under Verified sound.

**Repair.** Delete the three consumer clauses. Ownership of the F4 Toda brackets and the F6.2 James construction stays as the owners paragraph states it (lines 37–39).
- Lines 44–45: drop the sentence "HomotopySpheres consumes F4's Toda brackets and F6.2's James construction."
- Lines 425–426: change the sentence to "TangentialBordism consumes these operations, algebras and towers."
- Line 1013: end the sentence at "…of item 3."

I tested this on a scratch copy of the README. With the project's list, the gate's text scanners give `dropped=0` and every other text rule 0. The dependency check gives `245 roadmaps, 2473 edges, 0 problem(s)`.

## R02 (P3) — the K-theory formal-group law cites "TopK", an undefined abbreviation with no section

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 329–330 (F2): "Include K-theory's multiplicative law with its Bott grading: for TopK's u=β=[O(−1)]−1 and the normalized coordinate on L=O(1)".

**Claim.** This is a cross-roadmap citation. It does not use the roadmap's name, gives no section, and "TopK" is defined nowhere in this README. The README never names TopologicalKTheory, so the dependency check cannot see this edge.

**Witness.**
- `grep -c TopK` on the README gives 1; `grep -c TopologicalKTheory` gives 0.
- At this head, TopologicalKTheory's `## Conventions` (heading at line 223) sets `β=[L]−1` at line 239, with L the tautological O(−1) (line 237).
- On main the same convention sits at line 150.

**Repair.**
1. Lines 329–330: replace "for TopK's u=β=[O(−1)]−1 and" with "for TopologicalKTheory's Bott class u=β=[O(−1)]−1 of its Conventions (O(−1) the tautological line on CP¹=S²) and".
2. Owners paragraph (line 31): after "…operadic foundations." add "TopologicalKTheory's Conventions fix the Bott class β=[O(−1)]−1 on CP¹=S² that F2 uses for K-theory's multiplicative law."

I tested both edits on the same scratch copy:
- The text scanners all give 0.
- The dependency check gives 0 problems. TopologicalKTheory is on main, and at this head it is upstream of GeneralizedCohomology (GeneralizedCohomology README line 38 consumes T1.5). It names this roadmap nowhere, so the new edge creates no cycle.
- The mathematics is unchanged; see the adversarial row for line 329.

## Previous findings

- (r21 recorded none) — nothing to account for. The r21 report at 7e8275c accepted with no finding, and the folder is byte-identical at this head. R01 and R02 are new: R01 comes from a change to the project's dropped-names list, R02 from re-checking a citation into the TopologicalKTheory README this increment rewrote.

## Verified sound

**Changes outside the folder.** `git diff --name-only origin/main...HEAD` lists 22 files: the 2 in this folder and 20 inside the thirteen other folders this brief names as the pull request's own. Filtering out those fourteen folders leaves nothing (grep exit 1). Main has not touched this folder since the merge base eaf17b1: `git log eaf17b1..origin/main -- TauCetiRoadmap/BordismFormalGroups` is empty.

**Gate**, re-run at 3e107fa with `--base origin/main`:

```
gate BordismFormalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=3 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=20 source-material=0 FAIL
```

`dropped=3` is R01. `outside-folder=20` lists exactly the 20 files of the thirteen declared folders, which the worker's gate allows (its `gate.md` records `outside-folder=0 build=0`). That line is not a finding.

**Dependency check**, run on this head with `--movable`:

```
depcheck: 245 roadmaps, 2473 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line for BordismFormalGroups.

**Elaboration.** I ran `lake env lean` on `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9; `lake-manifest.json` and `lean-toolchain` unchanged against origin/main). It exits 0 in 7 s with the single warning `56:8 declaration uses 'sorry'`.

The elaborated signature in `signatures.md` is `∀ {k} [Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm], Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p`. README lines 269–274 state the same hypotheses and conclusion. Every binder is the declaration's own. The extraction's entries `,` and `and` are parse artefacts of the module docstring; the file declares one theorem in 61 lines.

**Padding probe**, on scratch copies with one tactic in place of `sorry`:
- `simp`: "made no progress".
- `rfl`: fails, since `Nonempty (TauCeti.FormalGroupIso F G)` is not definitionally `F.height p = G.height p`.
- `infer_instance`: "type class instance expected".
- No single library lemma can close it: `IsSepClosed` and `IsAlgClosed` occur in no file of the pinned `TauCeti/RingTheory/FormalGroup/` tree (recursive grep, no match).

The theorem is not padding.

**Pinned declarations re-opened at Tau Ceti 2fd255d9:**
- `TauCeti.FormalGroupIso`: `RingTheory/FormalGroup/Hom.lean` line 351.
- `FormalGroup.height`: `Height/Basic.lean` line 200, valued in `ℕ∞`.
- `TauCeti.FormalGroupIso.height_eq`: `Height/Basic.lean` line 346, over `[Field K]`.
- `FormalGroup.height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`: `Logarithm/InfiniteHeight.lean` line 278.

These match the docstring's attributions: the forward direction and the infinite-height case are pinned, and the finite-height converse needs the separable closure.

**Seeded sample.** No sampled target lies in a changed passage. The full-review verifications stand: ravenel-green lines 19937–20817, quillen-fgl-bulletin 72 and 110, hatcher-at 21563–22197, guillou-weibel 748–788, miller-cobordism 1023–1373, and GeometricTopology README on main 930–943. I re-checked two afresh:
- "Height and Lazard's classification": ravenel-green line 20790 (page 387) is Theorem A2.2.12, for a separably closed field of characteristic p > 0 and height n. With A2.1.18 and (A2.2.4) for n = ∞, it supports README line 274 and the Lean docstring as written.
- "Unoriented coefficients": quillen-fgl-bulletin line 72 (Theorem 2, the complex law) and line 110 (Theorem 3, the unoriented law) match README lines 459 and 481.

The README flags no locator as unverified.

**Overlap leads (`overlaps.md`).**
- **GeneralizedCohomology §G2.11** (README lines 30, 1896, 2333, 2377) is defined in this pull request's own GeneralizedCohomology README as item 11 of G2, "Enriched, quasicategorical and monoidal foundations" (line 669). Main has none (grep count 0). It is this pull request's own ownership move, so no merge-order clause is needed.
- **#1808 and #1854** both carry BordismFormalGroups. Each one's folder history is a prefix of this pull request's own commits: #1808 stops at 54a7a0cd and #1854 at 3039e5ed, while this head adds 0f7ed58d and b0ef6366 on top. `git merge-tree` of 3e107fa with either head reports no conflict in this folder, so this text survives in either merge order.
  - The 3e107fa/#1808 conflicts are in AlgebraicCurves, CharacteristicClasses, ClassifyingSpaces and RigidAnalyticGeometry.
  - The 3e107fa/#1854 conflict is only in `AlgebraicCurves/Suggested.lean`.
  - The description states this pull request needs no predecessor and that the stacked move follows it.
- No id this README cites is dropped by an open pull request, and no id it drops is cited elsewhere.

**Ownership.** `roadmaps grep --fixed nonempty_formalGroupIso_iff_height_eq` (index of 2026-11-08T04:00:22Z) finds the name only in this pull request (README line 274, Suggested.lean line 56).

**Cross-roadmap citations.** `citations.md` lists nothing unresolved. Beyond R02's form, I re-resolved TopologicalKTheory's β convention at this head (Conventions, lines 237–239) and on main (lines 148–150).

**Adversarial table.** The first row and the last three carry forward from the r21 report; the K-theory and James rows are new or re-computed for this increment.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `nonempty_formalGroupIso_iff_height_eq` (Lean 56–58; README 269–274) | 𝔾ₐ vs 𝔾ₘ over 𝔽̄_p; F = G; 𝔾ₘ and its ℤ_p^×-twist over 𝔽_p (r21, carried from r14) | heights ⊤ and 1 with no iso, both sides false; F = G gives the identity series, both sides true; the twist over 𝔽_p has height 1 but no iso over 𝔽_p, so `IsSepClosed` is needed, and it is present | true as stated | none |
| K-theory law (README 329–332), which depends on the changed TopologicalKTheory README; touched by R02 | a=[L⁻¹], b=[M⁻¹] with u·x=a−1; restriction of x_K(O(1)) to CP¹; inverse series; wrong model β′=[O(1)]−1 | ab−1=(a−1)+(b−1)+(a−1)(b−1), so x+y+uxy, matching F_K; u⁻¹([O(−1)]−1)=u⁻¹β=1, matching "+1"; F(x, −x/(1+ux)) = (x+ux²−x−ux²)/(1+ux) = 0; in K(S²), [O(1)]=(1+β)⁻¹=1−β, so β′=−β and the restriction would be −1, excluded by the "+1" Check; TopologicalKTheory head lines 237–239 give β=[L]−1 with L=O(−1), the same convention | true | rename the citation (R02) |
| James construction (README 1008–1016); target of a clause R01 deletes | Y=S²; Y=S⁰; wrong model J₂/J₁=S²×S² | J₁=S²; J₂/J₁=S²∧S²=S⁴; H₂(J₂S²)=ℤ·b, while S²×S² would give rank 2; J(S⁰)=ℕ, discrete, against ΩS¹≃ℤ, so π₀ differs and connectivity is needed, as the Check says | true | drop the consumer clause only (R01) |
| Lemma A2.2.7 general form; universal strict coordinate; obstruction in degree p^k (README 80–87, 139–146, 288–299) | as in r21 (from r17): f=X^p and X^(p²) over 𝔽_p; F=G of height 2 over 𝔽₂ with f=X+X²; control 𝔾ₐ vs 𝔾ₘ over 𝔽₂ | h=1 and h=2 with g=id; ord 4>2 on both sides, degree-2 part 2XY=0; control: coefficient 1, 1·C₂=XY≠0 | true, hypotheses present | none (r21) |
| Height, exponent-two, Lazard grading, `lazardGcd`, invariant differential, log/exp, Frobenius-twist, n-series Checks (README 64–79, 122–132, 150–245, 251–269) | r14 instances (carried by r21) | r14 values | all true | none (r21) |
| Toda brackets (F4; touched by R01's line 44), Kudo–Borel, Steenrod/Milnor, MU/MO Hurewicz, π₀MO, Serre–Cartan basis, K(n)-local Tate, smooth implies PL (README 335–512, 634–660, 985–1012, 1945–2000, 2109–2111) | r9 instances (carried by r21) | as in r9 | all correct | none (r21) |

**Policy.** The scanners report `prnum=0 round-labels=0 private-paths=0 latex=0 tex=0 set_option=0 sorry-data=0 stray-files=0`.

## Not verifiable

- Bousfield (1979) Theorem 6.6, Thom (1954) Chapitre IV, Quillen (1971), Devinatz–Hopkins–Smith (1988), James (1955), Toda (1962), Whitehead (1940), Munkres (1966), Lubin–Tate, Wilson, Johnson–Wilson, Hovey–Strickland, Symonds. These are uncertified, or there is no open copy in the cache; they are cited by locator and untouched since the full review.
- Whether TangentialBordism and HomotopySpheres, at their open heads, have repointed to F2, F4 and F6.2. That is their reviews' business.

## Source issues

- none
