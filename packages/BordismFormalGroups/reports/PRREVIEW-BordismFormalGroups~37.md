# Review of BordismFormalGroups (pull request #1807 at 3adc047)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since ac36c47. `TauCetiRoadmap/BordismFormalGroups/README.md` and `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` are byte-identical to the head the previous review accepted (md5 `021a9f96…` and `20256d6c…` at both heads). The increment consists of two commits outside the folder, in `TauCetiRoadmap/TopologicalKTheory/README.md` and `TauCetiRoadmap/ClassifyingSpaces/README.md`, both folders this brief declares as the pull request's own. Neither breaks anything this roadmap cites, the gate passes, and no finding remains.

## Previous findings

The previous report (r32, at ac36c47) listed no findings of its own; its `## Previous findings` section accounted for r27's R01 and R02 as repaired. There is nothing to carry forward.

## Verified sound

**Scope of the increment.**
- `git diff --stat ac36c47..HEAD -- TauCetiRoadmap/BordismFormalGroups` is empty. The md5 of each of the two files equals the md5 of its copy at ac36c47.
- `git diff --stat ac36c47..HEAD` lists 2 files: `TauCetiRoadmap/ClassifyingSpaces/README.md` (270 lines) and `TauCetiRoadmap/TopologicalKTheory/README.md` (93 lines).
- Over the whole pull request, `git diff --name-only origin/main...HEAD` lists 22 files. Filtering out the fourteen declared folders leaves nothing (grep exit 1).
- The pins (`lake-manifest.json`, `lean-toolchain`) are unchanged against origin/main.

**What this roadmap cites in the two changed folders.** `grep -n "TopologicalKTheory\|ClassifyingSpaces"` on the README gives exactly two lines, both into TopologicalKTheory: line 31 (owners sentence, Conventions fix β=[O(−1)]−1 on CP¹=S²) and line 331 (F2's K-theory law, u=β=[O(−1)]−1 of its Conventions). ClassifyingSpaces is cited nowhere, and neither changed README names BordismFormalGroups (`grep -c` gives 0 for both at this head), so no supply edge changes direction.

**The TopologicalKTheory change, read in full.** The diff (commit 3adc0470) edits four places: the supplier list at lines 188–210 (the real Bott supplier becomes DGFloerPartII 4.2a–4.2c in place of HomotopySpheres §4A–4B), T1.6a at lines 494–517 (owns ΩBO≃O and ΩBSO≃SO with a fibre-sequence route), T1.6d at lines 821–839 (comparison with the Clifford chain's Grassmannian member Ω₇), and T7 at lines 1502–1577 and 1623–1626 (the degree-8 class and the bridge B_n read through DGFloerPartII 4.2c). None of these touches the two passages this roadmap consumes:
1. `## Conventions` is at line 229 at this head. Lines 243–245 still identify L on CP¹=S² with transition `s₀=(z,1)=z·s∞`, so L is the tautological O(−1), and set `β=[L]−1`. This is what README lines 31–33 and 331–332 say.
2. T4 item 8 still sets `u=β` at line 1149, so the `u⁻¹` in F2's `x_K(L)=u⁻¹([L⁻¹]−1)` makes sense in `K*(pt)=Z[u,u^−1]`.
DGFloerPartII, which TopologicalKTheory now consumes, is earlier than BordismFormalGroups in the merge order and is not cited by this roadmap; the new edge is TopologicalKTheory's own and the dependency check below confirms it closes no cycle through this roadmap.

**The ClassifyingSpaces change.** The diff (commit e473a36c) mentions none of this roadmap's objects: a grep of its added and removed lines for Steenrod, Thom, MO, MU, formal group, Lazard, Adams, bordism and cobordism finds nothing. This roadmap cites ClassifyingSpaces nowhere, so nothing here can be made wrong by it.

**Gate**, re-run at 3adc047 with `--base origin/main`:

```
gate BordismFormalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=20 source-material=0 FAIL
```

The only non-zero rule is `outside-folder=20`, and all 20 files lie in the thirteen other folders this brief declares as the pull request's own; the worker's gate, which allows them, records `outside-folder=0 build=0 OK`. That line is not a finding.

**Dependency check** (`--movable`, content main):

```
depcheck: 239 roadmaps, 2365 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` exits 0 in 5 s with the single warning `56:8 declaration uses 'sorry'`. The elaborated type in `signatures.md` is unchanged: `∀ {k} [Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm], Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p`. It matches README lines 270–275 binder for binder; the entries `,` and `and` in `signatures.md` are parse artefacts of the module docstring, as before. The padding probe carries forward unchanged from r27/r32 (`simp`, `rfl` and `infer_instance` each fail; `IsSepClosed` occurs nowhere in the pinned `RingTheory/FormalGroup` tree, so no single library lemma closes the theorem).

**Headline theorems.** Unchanged. Lazard's height classification is stated; the module docstring names each headline not statable at the pins with its missing carrier (Lubin–Tate, Quillen and Thom, Conner–Floyd, Landweber, nilpotence and periodicity, smashing and fracture, Tate vanishing, torus Euler cancellation).

**Seeded sample.** All seven sampled targets lie in untouched text, and their locator checks in the previous reports stand. As a spot-check of the headline's source at this head I re-opened Ravenel's Theorem A2.2.12 (ravenel-green line 20790, printed page 387): a separably closed field K of characteristic p>0, a formal group law of height n over K is isomorphic to F_n, with n=∞ handled in the proof's first case. This is the statement README lines 270–277 and the Lean docstring attribute to it, with the hypotheses as stated. The README flags no locator as unverified.

**Cross-roadmap citations resolved (3).** TopologicalKTheory `## Conventions` (line 229, content at 243–245) and T4 item 8 (line 1149) at this head, as above; `roadmaps resolve` on the README finds no unresolved citation or Lean name (`citations.md`: none).

**Overlap leads (`overlaps.md`).** Unchanged from r32 and re-read: #1808 and #1854 conflict with this pull request outside this folder (#1854 also in this README, carrying the older text); the description states that no open pull request must merge before this one. GeneralizedCohomology §G2.11 (README lines 1897, 2378) is defined at this pull request's own head; no cited id is dropped by an open pull request, and this pull request drops no id of this roadmap.

**Ownership and duplication.** No object is added or moved in this increment. `nonempty_formalGroupIso_iff_height_eq` is declared only here.

**Adversarial table.** The folder is unchanged, so every row is carried from the previous report (r32), which computed or carried them; the two rows that cite TopologicalKTheory were recomputed against the supplier at this head.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Owners sentence, lines 31–33: TopologicalKTheory fixes β=[O(−1)]−1 on CP¹=S² (recomputed at this head) | TopologicalKTheory Conventions lines 243–245 at 3adc047; wrong model β′=[O(1)]−1 | L has transition z↦z with `s₀=z·s∞`, so L=O(−1) and β=[L]−1, the same as the sentence; with `K(S²)=Z[β]/(β²)`, [O(1)]=(1+β)⁻¹=1−β, so β′=−β≠β | true; citation resolves | none |
| F2 K-theory law, lines 329–333 (recomputed at this head) | a=[L⁻¹], b=[M⁻¹], ux=a−1, uy=b−1; restriction to CP¹; inverse series; grading; u invertible | x_K(L⊗M)=u⁻¹(ab−1)=x+y+uxy=F_K; restriction u⁻¹β=+1 (β′ would give −1); F(x,−x/(1+ux))=0; a₁₁=u of degree 2; T4 item 8 line 1149 sets u=β in `Z[u,u^−1]` | true | none |
| Steenrod/Adams target, lines 346–427 (r32) | degree-one class of RP^∞; Milnor degrees at p=2,3; d₂ bidegree; M(ℤ/2^∞) | Sq¹a=a², Sq²a=0; \|ξ₂\|=3, \|Q₁\|=3 at p=2; \|ξ₁\|=4, \|τ₀\|=1, \|τ₁\|=5, \|Q₁\|=5 at p=3; d₂:(1,2)↦(3,3); lim(ℤ/2^∞)/2^k=0 while derived π₁=ℤ₂ | all true; finite-type hypothesis present | none |
| James construction, lines 1002–1019 (r32) | Y=S², Y=S⁰; wrong model J₂/J₁=S²×S² | J₂/J₁=S⁴; H₂(J₂S²)=ℤ versus rank 2; J(S⁰)=ℕ versus π₀ΩS¹=ℤ | true | none |
| `nonempty_formalGroupIso_iff_height_eq` (Lean 56–58; README 270–275) (r27, r32) | 𝔾ₐ vs 𝔾ₘ over 𝔽̄_p; F=G; 𝔾ₘ and its ℤ_p^×-twist over 𝔽_p | heights ⊤ and 1, no iso, both sides false; F=G both true; the twist has height 1 with no iso over 𝔽_p, so `IsSepClosed` is needed and present | true | none |
| Lemma A2.2.7 general form; universal strict coordinate; obstruction in degree p^k (README 80–87, 139–146, 288–299) (r27) | f=X^p, X^(p²) over 𝔽_p; height 2 over 𝔽₂ with f=X+X²; 𝔾ₐ vs 𝔾ₘ over 𝔽₂ | h=1 and h=2 with g=id; ord 4>2, degree-2 part 2XY=0; control coefficient 1·C₂=XY≠0 | true | none |
| Height, exponent-two, Lazard grading, `lazardGcd`, invariant differential, log/exp, Frobenius-twist and n-series Checks (README 64–79, 122–132, 150–245, 251–269) (r14) | r14 instances | r14 values | all true | none |
| Toda brackets, Kudo–Borel, Milnor, MU/MO Hurewicz, π₀MO, Serre–Cartan basis, K(n)-local Tate, smooth implies PL (r9) | r9 instances | r9 values | all correct | none |

**Remark on untouched text** (not a finding). As noted in r32, the README keeps the layout it has on main: the title has no "Roadmap:" prefix, the opening section is "Carriers, conventions and owners", and there are no per-layer `### Examples` and `### Dependencies` headings. Previous reviews passed this shape.

**Policy.** The scanners report `prnum=0 round-labels=0 private-paths=0 latex=0 tex=0 set_option=0 sorry-data=0 stray-files=0`. Nothing in the folder changed.

## Not verifiable

- Bousfield (1979) Theorem 6.6, Thom (1954) Chapitre IV, Quillen (1971), Devinatz–Hopkins–Smith (1988), James (1955), Toda (1962), Johnson–Wilson (1975), Würgler (1976), Greenlees–Sadofsky and Symonds: recorded as uncertified, cited by locator, untouched in this increment.
- Whether TangentialBordism and StringOrientation, at their open heads, consume F2 and F3–F5 as the consumer sentences say: for their own reviews; the sentences make no supplier claim of this roadmap.

## Source issues

- none
