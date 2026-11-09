# Review of TeichmullerGeometry (pull request #1169 at 0fcc3db)

**Verdict:** needs changes

This is an incremental re-review of the 3 lines changed since `38aedd4`. All of them are in `README.md`, and `Suggested.lean` has not changed. The change rewords the lead-in sentence of the list of earlier ids (line 993) and adds one bullet to that list (line 1003): `Layer 4.1` → §0.4a. The bullet is correct and it repairs the previous R04.

The other three previous findings are still open:

- **R01 is not repaired.** §0.4a and ArithmeticFuchsianGroups Layer 3 still both prove that every isometry of `ℍ` lies in `PGL₂(ℝ)`. #2026 is unchanged at `e4e4f9a`, and so is §0.4a.
- **R02 is partly repaired.** The description's generated "Depends on" block and its merge-order paragraph now name #2026. Its "Dependencies:" paragraph still describes a two-way exchange with FuchsianOrbifolds that #1168 no longer has.
- **R03 is not repaired.** #903 moved to `a6ba2997`, but its line 1458 still gives path smoothing to its §3.3, which does not state it.

No new problem was introduced.

## R01 (P2) — §0.4a and ArithmeticFuchsianGroups Layer 3 both prove that every isometry of ℍ lies in PGL₂(ℝ) and that quotient isometries lift

**Location.**
- `TauCetiRoadmap/TeichmullerGeometry/README.md` line 337 (§0.4a): "What this roadmap proves is that every isometry of `ℍ` arises, by the following argument, which is the roadmap's own". The same paragraph adds: "Prove the **isometry lifting** statement used below".
- Scope line 21 and the new line 1003, "Layer 4.1, the identification of `Isom(ℍ)` with `PGL₂(ℝ)` and isometry lifting: §0.4a", both credit this to §0.4a.

**Claim.**
- **#2026 is unchanged.** At `e4e4f9a`, ArithmeticFuchsianGroups (merge-order line 284, just before this roadmap at 285) still proves both statements in its Layer 3.
  - Lines 1064–1068 take a bijective isometry `F` of `ℍ²` and show it is one element `c ∈ PGL₂(ℝ)`. The steps are transitivity, the rotation stabilizer of `i`, the reflection `z ↦ −z̄` and R4.7's rigidity. The argument never uses that `F` is a lift.
  - They then conclude `cΓ₁c⁻¹ = Γ₂`, which is §0.4a's lifting statement.
  - Line 1080 reuses the argument for the normalizer.
- **No citation can resolve this.** This roadmap consumes ArithmeticFuchsianGroups, so ArithmeticFuchsianGroups cannot cite §0.4a. The object has two owners.
- **The new line 1003 makes this explicit.** #2026 line 88 ("Its Layer 4.1 owns the group identification") now resolves to §0.4a, the section whose content #2026 Layer 3 also proves.

**Witness.** Take `F = z ↦ −2z̄`. Both routes produce the same element:
- `F(i) = 2i`, and `diag(2,1)⁻¹F` is `z ↦ −z̄`, which fixes `i` with a reflection differential.
- So `c = diag(2,1)·diag(−1,1) = diag(−2,1)`. This is the element §0.4a's Check 3 assigns to `F`, and the one #2026 lines 1064–1068 produce.

**Repair.** Give both statements one owner, at or before ArithmeticFuchsianGroups in the merge order.
- **Recommended: FuchsianOrbifolds Layer 2 item 1, at #1168.** That item already owns the identity-coordinate isometry and the isometric PSL and PGL actions. Add there:
  - (i) every isometry of `ℍ` is the action of exactly one element of `PGL₂(ℝ)`;
  - (ii) an isometry `ℍ/Γ₁ → ℍ/Γ₂`, with `Γᵢ ≤ PGL₂(ℝ)` discrete and torsion free, lifts to `a` with `aΓ₁a⁻¹ = Γ₂`, unique up to `Γ₂`.
- **Changes in this README.**
  - In §0.4a, replace the two sentences beginning "What this roadmap proves" and "Prove the **isometry lifting** statement" with a citation of that item. Keep `exists_mulEquiv_isometryEquiv_glAction` as the packaging.
  - Add the item to the FuchsianOrbifolds contract, to §0.4a's *Needs* line and to scope line 21.
  - Move line 1003 into the "supplied elsewhere" group, as "FuchsianOrbifolds Layer 2 item 1, read in §0.4a", and change "two objects" (line 993) to "three objects".
- **Changes in #2026.**
  - Lines 1064–1068 and 1080 cite the item.
  - Line 88 drops "Its Layer 4.1 owns …".
- **Alternative.** ArithmeticFuchsianGroups Layer 3 states (i) and (ii) as named items. §0.4a and line 1003 then cite it.
- **Re-test.** `roadmaps grep 'every isometry of .ℍ'` returns one owning statement.

## R02 (P3) — The description's "Dependencies:" paragraph still describes an exchange with FuchsianOrbifolds that #1168 no longer has

**Location.** The pull-request description, "Dependencies:" paragraph: "Its early quotient/area/Riemann–Hurwitz and arithmetic L7.4 targets feed Teich; this roadmap's T0/T4a/T9/T10 feed Fuchsian late L9."

**Claim.**
- **The first half of the previous repair is done.** The generated "Depends on" block lists "#2026 ArithmeticFuchsianGroups", and the merge-order paragraph reads "… → #2026 (ArithmeticFuchsianGroups) → **this pull request**".
- **This sentence is still false at #1168's head.**
  - FuchsianOrbifolds has no Layer 7 or Layer 9.
  - No FuchsianOrbifolds layer consumes this roadmap.
  - The arithmetic lattices now come from ArithmeticFuchsianGroups.
- **It contradicts this README.** README line 41 says supply runs one way.
- **Minor.** The hand-written task list still names only #903 and #1168.

**Witness.**
- #1168 at `4b6bb3d` has `## Layer` headings 0, 1, 2, 3, 4, 4a, 5 and 6 (lines 239–462).
- Its lines 30–31: this roadmap "takes Layer 0 items 2 and 3, … and no layer here consumes any layer of it".

**Repair.**
- Replace the quoted sentence with: "FuchsianOrbifolds (#1168) and ArithmeticFuchsianGroups (#2026) supply this roadmap and consume nothing from it."
- Add "- [ ] depends on: #2026" to the hand-written task list, so that it agrees with the generated block.

## R03 (P3) — #903 still assigns the smoothing of paths to its §3.3, which does not state it

**Location.**
- #903, `TauCetiRoadmap/GeometricTopology/README.md` line 1458 at head `a6ba2997`: "and the smoothing of paths is Layer 3.3's."
- This README's scope line 12, which owns the parameter-smoothing converse.

**Claim.**
- **#903's head moved, but the sentence did not.** The head went from `fa2b5cc0` to `a6ba2997`. The change does not touch Layer 3's path-smoothing sentence.
- **§3.3 (lines 1502–1548) still states no path smoothing.** It states:
  - the restriction fibration;
  - relative isotopy extension;
  - the continuous lift of paths in `Emb(N, M)` to `Diff_c(M)`;
  - the disc theorem for arbitrary centres.

  None of these turns a continuous path in `Diff(M)` into a smooth isotopy.
- **Consequence.** Two roadmaps claim the object, and only this one plans it.

**Witness.** At `a6ba2997`, `grep -n "smoothing of paths"` returns only line 1458. Over lines 1502–1548, a grep for "smooth\|path" finds only embedding-space and isotopy-extension statements.

**Repair.**
- **In #903.** Replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is not planned here".
- **In this README.** No change is needed.

## Previous findings

- R01 — not repaired: §0.4a line 337 still reads "What this roadmap proves is that every isometry of `ℍ` arises"; #2026 at `e4e4f9a` lines 1064–1068 still identify `F` with one `c ∈ PGL₂(ℝ)`. Carried as R01.
- R02 — partly repaired: the generated block now lists "#2026 ArithmeticFuchsianGroups" and the merge order names it; the "Dependencies:" paragraph still says "arithmetic L7.4 targets feed Teich; … feed Fuchsian late L9". Carried as R02.
- R03 — not repaired: #903 at `a6ba2997` line 1458 still reads "and the smoothing of paths is Layer 3.3's"; its §3.3 (lines 1502–1548) states no path smoothing. Carried as R03.
- R04 — repaired: line 1003 reads "Layer 4.1, the identification of `Isom(ℍ)` with `PGL₂(ℝ)` and isometry lifting: §0.4a."

## Verified sound

### Mechanical checks at `0fcc3db`

- **Gate.** The brief's command printed:

  `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

  It exited 0. The worker's `gate.md` records the same result, with `build=0`.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0 with 22 `declaration uses 'sorry'` warnings and no other diagnostic.
- **Lean unchanged.** `git diff --stat 38aedd47 HEAD` lists `README.md` only, so no elaborated type changed. The worker's `signatures.md` reports 0 of 56 declarations with a dropped binder, and the earlier `#check @name` comparison stands.
- **Dependency check** (the brief's command):

  ```text
  depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line. The merge order has FuchsianOrbifolds at line 49, ArithmeticFuchsianGroups at 284 and TeichmullerGeometry at 285. GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds are on main.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty.
- **Overlaps**, recomputed with `roadmaps overlaps TeichmullerGeometry`:
  - no open pull request changes this roadmap;
  - none drops an id it cites;
  - no cited id is defined only by an open revision.
- **Citation leads.** All 15 "Lean names found nowhere" in `citations.md` are this roadmap's own declarations in `Suggested.lean`, for example `PLStructure.IsPLHomeomorph`, `StandardSurface.holeWord` and `MappingClassGroupPL.toTop_bijective`. The cross-roadmap citations have no unresolved lead.

### The changed passages (README lines 993 and 1003)

- **The new bullet is correct.** §0.4a (line 335) contains both items it names:
  - the identification `GL(2,ℝ)/Z ≃* Isom(ℍ)`, which is `exists_mulEquiv_isometryEquiv_glAction` (`Suggested.lean` line 538);
  - the isometry-lifting statement (line 337).

  No `### 4.1` heading exists at this head. Layer 4 begins at §4.2 (line 516).
- **The list now covers every id other roadmaps cite.** `roadmaps grep` over main and all open heads finds eleven distinct ids that other roadmaps cite from this one:

  | Cited by | Ids | Resolves to (README line) |
  |---|---|---|
  | #1728 | §3.3, §5.6, §8.4, §10.1, Layers 0–8 | 494, 659, 822, 903, Layers 0–8 |
  | #1722 | §9.1 | 857 |
  | main, PseudoholomorphicCurveAnalysis line 65 | Layer 7.4 | 739 |
  | #903, line 166 | Layer 3.1 | 470 |
  | #1168, line 402 | Layer 10 | 901 |
  | #2026 | Layer 11 | 965 |
  | #2026, line 88 | Layer 4.1 | no heading; now mapped by line 1003 |

  So ten resolve to a heading, and the stale one is mapped.
- **The lead-in is accurate.**
  - "Two objects … supplied elsewhere" still counts the two final bullets: `Γ(O)` from ArithmeticFuchsianGroups, and `π/21` from Tau Ceti and FuchsianOrbifolds.
  - "Milestone and section ids" now covers the `T`-ids and the new layer-section id.
- **The seeded sample is untouched.** None of the fifteen seeded targets falls in the changed lines. Their locators were verified in earlier rounds (`~8` to `~10`, and §9.1 again in `~14`). The README flags no locator as unverified.

### Adversarial table

Rows H1–H3 are new. Rows marked "~14" are carried from `PRREVIEW-TeichmullerGeometry~14`, and through it from `~13` back to `~10`, for statements this diff leaves untouched.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| H1 | Line 1003: Layer 4.1 maps to §0.4a (identification and lifting) | `g = diag(−2,1)`, `diag(−4,2)`, `diag(2,−1)`; `Γ₁ = Γ₂ = ⟨z ↦ −2z̄⟩` | All three act by `z ↦ −2z̄` (`−4z̄/2`; `2z̄/(−1)`), one class mod the centre including the negative scalar `−1`; `dist(i,2i) = log 2 ≈ 0.693147 = dist(2i,4i)`. The identity of `ℍ/Γ` lifts to each `γ ∈ Γ`, unique up to `Γ₂`; `Γ⁺ = ⟨z ↦ 4z⟩`, index 2 | §0.4a states both; mapping true | none |
| H2 | Line 993: the list covers the earlier ids other roadmaps cite | the 11 cited ids above | 10 resolve to headings at lines 470–965; 1 (`Layer 4.1`) is mapped; supplied-elsewhere bullets: 2 = "two objects" | true | none |
| H3 | §0.4a versus ArithmeticFuchsianGroups L3 (recomputed ~14 G9) | `F = z ↦ −2z̄`; `F = z ↦ −z̄` | both routes give `c = diag(−2,1)`; both give `c = diag(−1,1)` | two owners of one statement | R01 |
| ~14 G1–G2 | ArithmeticFuchsianGroups contract, L1 items 1 and 4 | `M₂(ℤ)`; `(2,3,7)`; `(g; −)` with `g = 0, 1, 2` | area `π/3 ≈ 1.0472`, noncocompact; `2π/42 ≈ 0.1496`, cocompact; `A = −4π, 0, 4π` | true | none |
| ~14 G3–G5 | §9.2 covolume and Check 3; §9.1 Takeuchi | Bolza; Klein; `(0;2,3,8)`; `PSL₂(ℤ)` | `48·π/12 = 4π`; `168·π/21 = 8π`; `π/12 < π/3`; `M₂(ℤ)` arithmetic | true | none |
| ~14 G6–G7, G11 | `OuterAut`; DNB; Layer 4 supplies §4.2 | `S₃`, `Q₈`, `ℤ²`; `T²`, `S²`, genus 2 | `\|Out\|` 1, 6; `GL₂(ℤ)`; `S²` excluded by `hg` (genus 0) | true | none |
| ~14 G8, G10 | supply runs one way; line 989 | #1168, #2026, #903; `g = 3`, `g = 2` | 0 ids consumed by each supplier; genus `17 = 8·3 − 7`; genus 2 never maximal (hyperelliptic index 2) | true | none |
| ~13 E1–E8 | §0.4a proper discontinuity, glide, lifting; layer order; §§1.2–3.2; the `glAction` packaging | `diag(−2,1)`, `K = B(i,1)`; `⟨z ↦ 2z, z ↦ 3z⟩`; 52 *Needs* lines | `d(i, gⁿi) = 0.693147·\|n\|`, 5 elements; not discrete; 0 upward citations | true | none |
| ~13 (~12 D1–D8, ~11 C1–C2, ~10 N1–N7) | §§0.0a–0.5, §2.4, §3.1–§11.1, conventions | `S = ∅`, Dyck, `Q₈`, Bolza, Klein | `χ = 1, 0, −1`; `96 ≤ 168`; `e = −2` | true (§0.2 ownership is R03) | R03 |

### Headline theorems

- **Unchanged.** `Suggested.lean` states the same 22 sorried headlines, among them:
  - `exists_pl_approximation_open`, `image_boundary`, `isotopic_of_homotopic_closedSurface`;
  - `classification_of_surfaces`, `riemannHurwitz`, `MappingClassGroupPL.toTop_bijective`;
  - `exists_mulEquiv_isometryEquiv_glAction`, `baer_epstein_smooth`, `dehn_nielsen_baer`;
  - `mcg_sphere_full`, `mcg_torus_full`, `measurable_riemann_mapping`, `nielsen_realization`.
- **The "not statable" list is unchanged.** The module docstring still names `Teich(Σ)` and the open dense and arithmetic loci, Teichmüller's theorem, the Euler number and coherent orientations.
- **No new headline became statable,** and the one-tactic padding probe of earlier rounds stands: 22 of 22 sorries resist.

### Remarks on untouched text

- The description's "Validation" paragraph still says that the main-only CI fails on a `ComplexKahlerGeometry.Suggested` import. `Suggested.lean` now imports only `Mathlib` and 13 `TauCeti.*` modules (lines 1–14).

## Not verifiable

- **Changed passages.** No changed line carries an external locator.
- **Carried from earlier rounds.**
  - Imayoshi–Taniguchi and Hubbard are commercial and not in the cache.
  - Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified.
  - Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled.
  - Kerckhoff 1983 is waived.
- **Ownership against open pull requests.** It was checked against the sibling heads the brief lists:
  - #1168 at `4b6bb3d`;
  - #2026 at `e4e4f9a`;
  - #903 at `a6ba2997`;
  - #1722 and #1728 for their citations of this roadmap.

## Source issues

- none
