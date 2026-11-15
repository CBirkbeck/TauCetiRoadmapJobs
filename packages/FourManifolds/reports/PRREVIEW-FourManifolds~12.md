# Review of FourManifolds (pull request #936 at 46ee76a)
**Verdict:** needs changes

Incremental re-review of 0 changed lines since `46ee76a`; this round reads the pull request's title and description against the head, and re-runs the gate, which now fails.

## R01 (P3) — Twelve missing spaces in the §4.3 all-rank block (carried)

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2155` (“In rank3 it translates the difference coordinate by σ_w(x); in the rank4 half-spin coordinates”), and lines 2156, 2170, 2172, 2175–2178, 2182, 2185.

**Claim:** Words run into numbers: “rank3”, “rank4”, “rank1”, “rank0”, “Rank2”, “by2”, “with2-torsion”, “Theorems1–2”, “printed671–674”. The rest of the README writes “rank 3”.

**Witness:** `grep -n -o 'rank[0-9]\|Rank[0-9]\|by2\|with2\|Theorems1\|printed671' README.md` returns twelve tokens, all in lines 2155–2185.

**Repair:** Insert the space in each: “rank 3”, “rank 4”, “rank 1”, “rank 0”, “Rank 2”, “by 2”, “with 2-torsion”, “Theorems 1–2”, “printed 671–674”.

## R02 (P3) — Dold–Whitney is cited inline but absent from the References (carried)

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2184` (“See Dold–Whitney, *Classification of Oriented Sphere Bundles Over a 4-Complex*, Theorems1–2 and the corollary, printed671–674.”).

**Claim:** The References section has no entry for this work, and the inline citation gives no journal, volume or year for the printed pages.

**Witness:** `grep -n -i 'dold' README.md` returns line 2184 only. The paper is Ann. of Math. (2) 69 (1959), 667–677.

**Repair:** Add to the References paragraph “The remaining works cited inline are …”: “Dold–Whitney, *Classification of oriented sphere bundles over a 4-complex*, Ann. of Math. 69 (1959), 667–677”; at line 2184 write “(Dold–Whitney, Theorems 1–2 and the corollary, pp. 671–674)”.

## R03 (P3) — “Existing” results without named owners, and no *Needs:* line (carried)

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2162` (“using the existing Stiefel connectivity and bundle classification”) and 2179 (“existing Euler/complex-line classification”).

**Claim:** Neither result is stated in this README and the block has no *Needs:* line naming its owners, which exist on main.

**Witness:** `grep -n 'Stiefel connectivity\|complex-line' README.md` returns 2162 and 2179 only; owners: `TopologicalKTheory/README.md:504` (T1), `CharacteristicClasses/README.md:300–310` (C1.1b) and `:537–541` (C1.6).

**Repair:** End the block with “*Needs:* TopologicalKTheory T1's Stiefel connectivity; CharacteristicClasses C1.1b's oriented classification with its finite-rank and stable inclusions, and C1.6's complex-line classification; AlgebraicTopology Stage 8's Postnikov lifts; StringOrientation S1.3's dimension-≤7 BSpin classification for the w₂ = 0 branch.”, and replace the two “existing …” phrases by those names.

## R04 (P3) — σ_w has no Checks; the stable branch does not say why its fibre action vanishes (carried)

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2154` (“`σ_w(x)=β(x)∪β(x)+β(x∪w)`, for w=w₂ and x∈H¹(X;F₂)”), and the rank ≥ 5 sentence “absolute equivalence iff d=0”.

**Claim:** The new formula has no Check, and “iff d=0” holds only because the stable fibre action is trivial, which the block does not say.

**Witness:** `grep -n 'σ_w' README.md` returns lines 2154–2157 only. On RP⁴ with w₂ = 0, σ₀(a) = β(a)² ≠ 0 while the stable lifts 0 and β(a)² differ in w₄.

**Repair:** Add three Checks to §4.3: “On RP⁴ with w₂ = 0, σ₀(a) = β(a)² generates H⁴(RP⁴;ℤ) = ℤ/2, so rank 3 has one class with w₂ = 0; dropping the β(x)² term would give two.” “On RP²×RP² with w₂ = 0, σ₀ vanishes on H¹, and the lifts 0 and ab give two non-isomorphic bundles with equal w₂ and p₁.” “In rank ≥ 5 over RP⁴ the lifts 0 and β(a)² have w₄ = 0 and a⁴, so the stable fibre action is trivial; applying σ₀ there would identify the trivial bundle with 4L.” Add to the rank ≥ 5 paragraph: “the stable fibre action is trivial, the stable Postnikov invariant being twice the rank-3 one”.

## R05 (P3) — Stray article at line 1530 (carried)

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1530` (“using this section's the normal-bundle theorem for locally flat submanifolds of TOP four-manifolds;”).

**Claim:** “this section's the” is a slip.

**Witness:** `grep -n "this section's the" README.md` returns line 1530.

**Repair:** “using this section's normal-bundle theorem for locally flat submanifolds of TOP four-manifolds;”.

## R06 (P3) — Gate, `statement-hygiene`: `letI` in the signature of `exoticFourSpace_exists`

**Location:** `TauCetiRoadmap/FourManifolds/Suggested.lean:146–147` (“letI : TopologicalSpace M := t” / “letI : ChartedSpace (EuclideanSpace ℝ (Fin 4)) M := c”).

**Claim:** The gate refuses `letI` in a theorem's signature (two hits, P3 each, lines 146 and 147).

**Witness:** Gate line: “statement-hygiene: line 146: P3 `letI` in the signature of theorem `exoticFourSpace_exists`”; the same for line 147.

**Repair:** Bind the two structures as anonymous existential binders, which the elaborator uses as instances:

```lean
theorem exoticFourSpace_exists :
    ∃ (M : Type) (_ : TopologicalSpace M)
      (_ : ChartedSpace (EuclideanSpace ℝ (Fin 4)) M),
      IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin 4)) ∞ M ∧
      Nonempty (M ≃ₜ EuclideanSpace ℝ (Fin 4)) ∧
      IsEmpty (Diffeomorph 𝓘(ℝ, EuclideanSpace ℝ (Fin 4))
        𝓘(ℝ, EuclideanSpace ℝ (Fin 4)) M
        (EuclideanSpace ℝ (Fin 4)) ∞) := by
  sorry
```

Tested at the pins: it elaborates with `sorry` as its only warning, and the statement at the head is proved from it by the bare term `exoticFourSpace_exists'`, so the two are the same proposition.

## R07 (P3) — Gate, `dropped`: nineteen lines name HomotopySpheres

**Location:** `TauCetiRoadmap/FourManifolds/README.md:184` (“| HomotopySpheres §3C/§4B/§6B/§6C/§7A–7C/§9 | Unstable link/Hopf, real stable-space and low-stem inputs to F2/F3; …”), and lines 66, 74, 153, 195, 290, 658, 689, 745, 769, 806, 861, 1613, 1646, 1663, 1665, 1915, 1922, 1965.

**Claim:** The gate's rule “no name of the project's dropped-names list” fails on each line; the list holds `HomotopySpheres`, and the gate does not pass while they stand.

**Witness:** Gate: “dropped=19 … FAIL”. Against this: HomotopySpheres is on main (`TauCetiRoadmap/HomotopySpheres/README.md`, sections 3C, 4B, 6B, 6C, 7A–7C, Layer 9 at lines 1234–2803), and its line 3306 names FourManifolds as consumer of exactly these.

**Repair:** I believe this is a false positive of the list for a roadmap now on main (see the note for the human reviewers): every citation resolves, and main's HomotopySpheres is the only owner of the E₈ tree plumbing and L₅(ℤ)=0 (`roadmaps grep` finds them in this README and on main only). No edit that keeps single ownership removes the hits; ask the operators to confirm the list entry. If it is confirmed for main's roadmap, the nineteen citations become targets stated here.

## R08 (P3) — The description presents amendments of an existing text, with a file and line counts the head does not have

**Location:** Description: “The new `RadialControlTargets.lean` signature elaborates at the exact shared local/public dependency pin with one intentional unproved theorem target.”; “The complete final README (1,431 lines), … unchanged 97-line companion”; “retains the complete F1–F7 programme”.

**Claim:** The pull request adds the roadmap (it is not on main); the folder has no `RadialControlTargets.lean` and no companion file; the README has 3,267 lines and eight layers. The prose never says that a new roadmap is added.

**Witness:** The folder holds `README.md`, `Suggested.lean`, `metadata.toml` (3,425 insertions, 0 deletions against the base); `wc -l README.md` = 3267; `README.md:409` “The labels F1–F8 identify the layers”.

**Repair:** Replace the paragraphs from “The radial-coordinate step …” to “… remain unproved by this review or by elaboration.” by: “This pull request adds the roadmap FourManifolds: a README of eight layers (F1–F8) and a `Suggested.lean` with thirteen declarations, six of them headline theorems stated with `sorry`. It changes nothing outside the folder.”

## R09 (P3) — The description says F5 consumes SmoothBundlesConnections B8; the head says F5 owns that calculus

**Location:** Description: “F5 now explicitly consumes SmoothBundlesConnections B8’s Yang–Mills variational calculus: stationarity, Hessian, the linear gauge-fixed operator and four-dimensional conformal invariance.”

**Claim:** The head cites no B8 and makes the calculus Layer 5's own.

**Witness:** `README.md:2226` “Own the Yang–Mills variational calculus this layer uses, since SmoothBundlesConnections stops before the Yang–Mills energy”; the supplier row at line 186 reads “SBC B1–B5”; `grep -n 'B8' README.md` is empty.

**Repair:** “F5 owns the four-dimensional Yang–Mills variational calculus (stationarity, Hessian, the gauge-fixed operator, conformal invariance) and consumes SmoothBundlesConnections B1–B5 for bundles, connections, curvature and the gauge action.”

## R10 (P3) — The description says three gap declarations were removed; the head declares them

**Location:** Description, last paragraph: “§1.4 consumes GeometricTopology's finite/Seifert Arf, linking and deck-equivariant Alexander interfaces, removing the three corresponding gap declarations while retaining the other explicit gaps.”

**Claim:** The three gaps are declared at this head and §1.4 consumes them as gaps.

**Witness:** `README.md:328` “What GeometricTopology must provide (gap:oriented-linking-number)”, `:352` (gap:alexander-module-presentation), `:369` (gap:finite-quadratic-arf); §1.4 uses them at lines 495 and 546–547.

**Repair:** “§1.4 takes the oriented linking number, the Alexander-module presentation and the Arf invariant of finite quadratic forms from GeometricTopology through the declared gaps gap:oriented-linking-number, gap:alexander-module-presentation and gap:finite-quadratic-arf; fifteen gaps are declared in all.”

## R11 (P3) — The description pins the Sard–Smale supplier to a pull-request commit and calls main's HeegaardFloer a different edition

**Location:** Description: “The analytic parameter theorem is the inspectable HeegaardFloer #957 F0 contract at f34838f9 … the older main-branch HeegaardFloer file is a different edition.”

**Claim:** The README cites HeegaardFloer F0 by name, and main's HeegaardFloer has that lane; nothing at the head depends on a commit of #957, which is not among the open pull requests.

**Witness:** `README.md:2520` “Only then apply HeegaardFloer F0's Sard–Smale theorem on Banach manifolds”; main `TauCetiRoadmap/HeegaardFloer/README.md:178` “Build F0's sharp Fredholm Sard–Smale theorem and its Banach-manifold/bundle …”.

**Repair:** “§5.2 applies HeegaardFloer F0's Sard–Smale theorem on Banach manifolds, as HeegaardFloer states it on main.”

## Previous findings

- R01 — not repaired: line 2155 still reads “In rank3 it translates the difference coordinate by σ_w(x); in the rank4 half-spin coordinates”; twelve tokens remain (R01).
- R02 — not repaired: `grep -i dold` returns line 2184 only; no References entry (R02).
- R03 — not repaired: lines 2162 and 2179 still say “existing”; the block has no *Needs:* line (R03).
- R04 — not repaired: σ_w occurs at lines 2154–2157 only; no Check on it (R04).
- R05 — not repaired: line 1530 still reads “using this section's the normal-bundle theorem” (R05).

## Verified sound

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| `exoticFourSpace_exists` (R06) | head form with `letI`; repaired form with anonymous instance binders; M = ℝ⁴ with its standard structure | repaired form elaborates to `∃ M x x_1, IsManifold (𝓡 4) ∞ M ∧ Nonempty (M ≃ₜ EuclideanSpace ℝ (Fin 4)) ∧ IsEmpty (M ≃ₘ⟮𝓡 4, 𝓡 4⟯ …)`; head form closed by the repaired one as a term; `Diffeomorph.refl` inhabits the third conjunct's type for the standard ℝ⁴ | same proposition; standard ℝ⁴ is no witness; repair in R06 |
| `annulusTheorem_four`, `freedmanSliceTheorem` (named in the description's summary) | elaborated types at the pins | `TauCeti.AnnulusConjecture 3`; `TauCeti.FreedmanSliceTheorem`; main `GeometricTopology/README.md:183` leaves dimension four to FourManifolds | the summary block's sentence agrees with the head |
| §5 ownership of the Yang–Mills calculus (R09) | description against README lines 76, 186, 2226 | description: “consumes SBC B8”; head: “Own …”, “SBC B1–B5”, 0 occurrences of “B8” | description contradicted |
| Declared gaps (R10) | count of distinct `gap:` slugs | 15, including the three the description calls removed | description contradicted |

Rows for statements this head does not touch stand as in the previous review, of `46ee76a`.

- Gate, my run on `46ee76a`: FAIL, `statement-hygiene=2` and `dropped=19`, every other scanner 0 (R06, R07); the worker's run adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives six `declaration uses sorry` warnings (lines 68, 77, 96, 120, 134, 143) and nothing else; the thirteen elaborated signatures were compared with the worker's list, none lost a binder.
- Folder diff since the previous review: 0 lines; files outside the folder: none; the worktree was left clean.
- Description, summary block: the claims I checked agree with the head (`README.md:86` `ChartedSpace` substrate, `:89` no triangulation, `:903` Powell–Ray–Teichner, `:984` Krushkal–Quinn, `:3194` SeibergWittenTheory SW1, the three Lean names). The generated depends-on and merge-order blocks are outside the check; GeneralAlgebraicKTheory is an open new-roadmap pull request earlier in the order.
- Cross-roadmap citations: the worker's resolver reports none unresolved against main `4d169a9` and 476 open heads; I resolved HomotopySpheres 3C, 4B, 6B, 6C, 7A–7C and Layer 9 (main lines 1234, 1640, 2133, 2377, 2465, 2527, 2631, 2803) and HeegaardFloer F0 (main line 178).
- Overlap check: read HomotopySpheres, GeometricTopology, TangentialBordism (main), InstantonFloerTheory, RibbonKnots (open); E₈ tree plumbing and L_n(ℤ): HomotopySpheres, consumed here; dimension-four annulus and disc embedding: FourManifolds (GeometricTopology line 183); ASD core F5: FourManifolds, consumed by InstantonFloerTheory; ℤ/4 Pontryagin square: FourManifolds (TangentialBordism line 1288). No object has two owners.
- Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Dold–Whitney, Ann. of Math. 69 (1959), 667–677: JSTOR only, no legal copy found in the previous round; cited by locator alone.
- No `design/plan.json` is readable, so the fifteen gap slugs were not cross-checked against a plan.
- The description was checked as quoted to me, through its last paragraph (“31 October …”); anything beyond that quote was not read.
- The items of the earlier reports' lists concern text this head does not change and stand as recorded there.

## Source issues

- none

## For the human reviewers

- **Gate list.** `HomotopySpheres` is on the dropped-names list, yet it is on main (merged, sections intact) and names FourManifolds as its consumer (`TauCetiRoadmap/HomotopySpheres/README.md:3306`); ten roadmaps on main cite it. Whether the entry should bind main's roadmap is yours to decide (R07).
- **Previous verdict.** The previous report on this same head said “accepted” while listing five P3 findings; they are unrepaired and carried here as R01–R05.
- **Licence.** Dold–Whitney (1959) could not be read legally; the §4.3 block's wording was not compared with it.
