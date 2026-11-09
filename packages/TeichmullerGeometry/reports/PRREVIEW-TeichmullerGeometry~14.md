# Review of TeichmullerGeometry (pull request #1169 at 38aedd4)

**Verdict:** needs changes

This is an incremental re-review of the 39 changed lines since `da7dcd5`. All of them are in `README.md`; `Suggested.lean` is unchanged.

The change does two things:

- It moves the arithmetic supply from FuchsianOrbifolds Layer 7 to the new roadmap ArithmeticFuchsianGroups, Layer 1 items 1 and 4 (#2026).
- It credits `OuterAut` to §4.2 and Layer 4.

What happened to the previous findings:

- **R01 (the cycle) is repaired.** At its new head, #1168 no longer consumes this roadmap, and ArithmeticFuchsianGroups consumes nothing from it.
- **That repair introduced a new double owner (R01 below).** ArithmeticFuchsianGroups Layer 3 avoids consuming §0.4a by proving §0.4a's two statements itself.
- **R03 is partly repaired.** The description still omits #2026.
- **R02 is not repaired.**

## R01 (P2) — §0.4a and ArithmeticFuchsianGroups Layer 3 both prove that every isometry of ℍ lies in PGL₂(ℝ) and that quotient isometries lift

**Location.**
- `TauCetiRoadmap/TeichmullerGeometry/README.md` line 337 (§0.4a): "What this roadmap proves is that every isometry of `ℍ` arises, by the following argument, which is the roadmap's own". The same paragraph continues: "Prove the **isometry lifting** statement used below … lifts to `a ∈ Isom(ℍ) = PGL₂(ℝ)` with `a Γ₁ a⁻¹ = Γ₂`".
- Scope line 21 claims both statements for Layer 0, §0.4a.

**Claim.**
- **ArithmeticFuchsianGroups proves the same two statements.** It is at #2026, head `e4e4f9a`, and sits at line 284 of the merge order, just before this roadmap at line 285.
  - *Its isometry argument.* Its Layer 3 lifts an isometry `S₁ → S₂` to a bijective isometry `F` of `ℍ²`. It then proves `F` is one element of `PGL₂(ℝ)` by four steps: transitivity, the rotation stabilizer of `i`, the reflection `z ↦ −z̄`, and R4.7's rigidity. It concludes `cΓ₁c⁻¹ = Γ₂`.
  - *Generality.* The argument never uses that `F` is a lift. So it is §0.4a's surjectivity for an arbitrary isometry, followed by §0.4a's lifting statement.
  - *Its L3.1.* Line 1080 reuses the argument to lift every isometry of `S₀` to the normalizer.
- **ArithmeticFuchsianGroups' line 88 disclaims the identification, but its Layer 3 proves the substance.** Line 88 says this roadmap owns "the group identification". Yet surjectivity is the only part of §0.4a that FuchsianOrbifolds Layer 0 item 2 does not already supply: that item gives the action, its isometry and its kernel. The index-two statement of ArithmeticFuchsianGroups Layer 2 item 3 repeats §0.4a's "of index two" as well.
- **The merge order rules out a citation from ArithmeticFuchsianGroups.** This roadmap consumes ArithmeticFuchsianGroups Layer 1, so ArithmeticFuchsianGroups cannot cite §0.4a. The object has two owners, and the single supply direction forbids one citing the other.

**Witness.**
- `TauCetiRoadmap/ArithmeticFuchsianGroups/README.md` at `e4e4f9a`, lines 1064–1068: "Identify `F` with one element of `PGL₂(ℝ)` … gives `F=c`, so `cΓ₁c⁻¹=Γ₂`".
- Take `F` to be `z ↦ −2z̄`. Both routes produce the same element:
  - `F(i) = 2i`, and `diag(2,1)⁻¹F` is `z ↦ −z̄`.
  - That map fixes `i` with a reflection differential.
  - So `c = diag(2,1)·diag(−1,1) = diag(−2,1)`, the element §0.4a's Check 3 assigns to `F`.

**Repair.** Give both statements one owner, at or before ArithmeticFuchsianGroups in the merge order.
- **Recommended: FuchsianOrbifolds Layer 2 item 1, at #1168.** That item already owns "the Layer0 PSL and PGL actions are smooth Riemannian isometries" for the identified metric. Add two statements there:
  - (i) every isometry of `ℍ` is the action of exactly one element of `PGL₂(ℝ)`;
  - (ii) an isometry `ℍ/Γ₁ → ℍ/Γ₂`, with `Γᵢ ≤ PGL₂(ℝ)` discrete and torsion free, lifts to `a ∈ PGL₂(ℝ)` with `aΓ₁a⁻¹ = Γ₂`, unique up to `Γ₂`.
- **Changes in this README.**
  - In §0.4a, replace the sentence from "What this roadmap proves" to "the action of `diag(−1, 1)`" with a citation of that item. Do the same for the sentence beginning "Prove the **isometry lifting** statement".
  - Keep `exists_mulEquiv_isometryEquiv_glAction` as the packaging of the group isomorphism.
  - Add the item to the FuchsianOrbifolds contract (line 98), to §0.4a's *Needs* line, and to scope line 21's list of what is consumed.
- **Changes in #2026.**
  - Lines 1064–1068 and 1080 cite the item.
  - Line 88 drops "Its Layer 4.1 owns …".
  - Layer 2 item 3 cites the index-two statement.
- **Alternative.** ArithmeticFuchsianGroups Layer 3 states (i) and (ii) as named items, and §0.4a cites ArithmeticFuchsianGroups Layer 3.
- **Re-test.** `roadmaps grep 'every isometry of .ℍ'` returns one owning statement and citations elsewhere.

## R02 (P3) — The description does not name ArithmeticFuchsianGroups' pull request, a supplier that exists only at #2026

**Location.**
- Pull-request description:
  - the task list "- [ ] depends on: #903", "- [ ] depends on: #1168";
  - the merge-order paragraph "#271 (SurfaceTopology, mccorvie) → #903 (GeometricTopology) → #1168 (FuchsianOrbifolds) → **this pull request**".
- README lines 3, 20, 27, 41, 100–102, 114, 859, 867, 871, 877, 879, 899, 989 and 1003, all of which cite ArithmeticFuchsianGroups.

**Claim.**
- **#2026 is missing from the dependencies.** ArithmeticFuchsianGroups is a new roadmap that exists only at #2026 (CBirkbeck, head `e4e4f9a`), which is stacked on #1168. The description names #1168 but not #2026. If this pull request merges first, every ArithmeticFuchsianGroups citation, including the *Needs* lines of §9.1 and §9.2, points at nothing.
- **The description's "Dependencies:" paragraph is now false.** It still says that "arithmetic L7.4 targets feed Teich" and "this roadmap's T0/T4a/T9/T10 feed Fuchsian late L9". At #1168's head `4b6bb3d`, FuchsianOrbifolds has no Layer 7 or Layer 9.

**Witness.**
- `roadmaps list` shows "#2026 ArithmeticFuchsianGroups (new)".
- Main has no `TauCetiRoadmap/ArithmeticFuchsianGroups/`.
- #1168's `## Layer` headings at `4b6bb3d` are 0, 1, 2, 3, 4, 4a, 5 and 6 (lines 239–462).

**Repair.**
- Add "- [ ] depends on: #2026" to the task list. The computed chain then reads #271 → #903 → #1168 → #2026 → #1169.
- In the "Dependencies:" paragraph, replace the two sentences about L7.4 and L9 with: "FuchsianOrbifolds (#1168) and ArithmeticFuchsianGroups (#2026) supply this roadmap and consume nothing from it."

## R03 (P3) — #903 still assigns the smoothing of paths to its Layer 3.3

**Location.**
- #903, `TauCetiRoadmap/GeometricTopology/README.md` line 1432 at head `fa2b5cc0`: "and the smoothing of paths is Layer 3.3's."
- This README, line 12. It owns the parameter-smoothing converse, and says GeometricTopology Layer 3 does not state it.

**Claim.**
- **#903 has moved again, but this sentence has not.** Its head went from `68bf156f` to `fa2b5cc0`.
- **§3.3 still contains no path smoothing.** §3.3 is lines 1476–1522 at the new head. It states:
  - pinned isotopy extension;
  - relative isotopy extension;
  - the continuous lift of paths in `Emb(N, M)` to `Diff_c(M)`;
  - the disc theorem.

  None of these turns a continuous path in `Diff(M)` into a smooth isotopy.
- **Consequence.** Two roadmaps claim the object.

**Witness.** At `fa2b5cc0`, `grep -n "smoothing of paths"` returns only line 1432. `grep -n -i "smooth\|path"` over lines 1476–1522 finds no path-smoothing statement.

**Repair.**
- **In #903.** Replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is not planned here".
- **In this README.** No change is needed.

## R04 (P3) — ArithmeticFuchsianGroups cites this roadmap's "Layer 4.1", which is now §0.4a, and the id list has no old → new line

**Location.**
- README lines 993–1004, the list beginning "Other roadmaps cite this one by its earlier milestone ids".
- #2026, `TauCetiRoadmap/ArithmeticFuchsianGroups/README.md` line 88, where "Its" refers to TeichmullerGeometry: "Its Layer 4.1 owns the group identification of `Isom(ℍ)` with `PGL₂(ℝ)`".

**Claim.**
- This roadmap's Layer 4 begins at §4.2 (line 516). The identification is §0.4a (line 335).
- So the one open roadmap that cites the old id cites a section that does not exist.
- The list of earlier ids maps `T0`–`T10` but not `4.1`.

**Witness.** `roadmaps grep 'Its Layer 4\.1'` returns only #2026 line 88. `grep -n "^### 4\.1"` on this README returns nothing.

**Repair.**
- Add this bullet to the list at lines 995–1004: "- `Layer 4.1`, the group identification `Isom(ℍ) ≃ PGL₂(ℝ)`: §0.4a."
- In #2026, line 88 should read "§0.4a". The repair of R01 rewrites that line in any case.

## Previous findings

- R01 — repaired: #1168 at `4b6bb3d` has no Layer 7 or 9; lines 29–31 say this roadmap "takes Layer 0 items 2 and 3, Layer 1 items 1–3, Layer 2 item 1, Layer 4 item 5 and Layer 4a, and no layer here consumes any layer of it". The repair introduced R01 of this report.
- R02 — not repaired: #903 is now at `fa2b5cc0`; its line 1432 still reads "and the smoothing of paths is Layer 3.3's", and its §3.3 (lines 1476–1522) states no path smoothing. Carried as R03.
- R03 — partly repaired: the task list now reads "depends on: #903" and "depends on: #1168", and #953 is gone; the newly cited ArithmeticFuchsianGroups (#2026) is not named. Carried as R02.

## Verified sound

### Mechanical checks at `38aedd4`

- **Gate.** My run prints `set_option=0 … statement-hygiene=0 … dropped=0 readme-ids-missing=0 … layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. This agrees with the worker's `gate.md`, which also records `build=0`.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. It gives 22 `declaration uses 'sorry'` warnings and no other diagnostic.
- **Lean diff.** `git diff --stat da7dcd5 HEAD` lists `README.md` only. So no elaborated type changed, and the earlier `#check @name` comparison stands. The worker's `signatures.md` reports 0 lost binders out of 56 entries.
- **Dependency check** (the brief's command):

  ```text
  depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. ArithmeticFuchsianGroups is merge-order line 284, TeichmullerGeometry 285 and FuchsianOrbifolds 49.
- **Other changes.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty.
- **Overlaps**, recomputed:
  - no open pull request changes this roadmap;
  - none drops an id it cites;
  - no id is defined only by an open revision.

  ArithmeticFuchsianGroups is a new roadmap, which is why R02 is a description defect.

### The new ArithmeticFuchsianGroups contract (README lines 100–102) against #2026 at `e4e4f9a`

- **Item 1** (#2026 lines 155–167) matches the contract:
  - a totally real `k`;
  - `B` split at exactly one real place `v₀`;
  - an order `O` and a chosen splitting;
  - the projective image of `O¹` is a lattice of `PSL₂(ℝ)`, cocompact exactly when `B` is division;
  - arithmetic means commensurable up to conjugacy, including finite-index and non-maximal-order subgroups.
- **Item 4** (#2026 lines 520–622):
  - It fixes `g, c ≥ 0`, `r ≥ 0` and `m_j ≥ 2` (lines 521–523), so `r = c = 0` is included, as the contract's "What is assumed" says.
  - It concludes finiteness "up to `PSL₂(ℝ)`-conjugacy" (lines 620–621), as §9.2 and line 27 say.
  - Its signature convention is FuchsianOrbifolds Layer 4 item 5's `(g; m₁,…,m_r; c)` (#2026 line 122). #1168 line 357 derives it "from the compact surface, elliptic stabilizer orders, and cusp set".
- **ArithmeticFuchsianGroups consumes nothing from this roadmap.**
  - Line 35: "no layer here consumes any layer of it".
  - Line 1100: "It consumes nothing from TeichmullerGeometry".
  - Its dependency table (lines 1104–1114) has no TeichmullerGeometry row.

### The FuchsianOrbifolds contract (README line 98) against #1168 at `4b6bb3d`

#1168 line 30 lists exactly the items this README consumes. All of them exist with the stated content:

- Layer 0 item 2, the `PGL₂(ℝ)` formulas, isometry, kernel and `PSL₂ → PGL₂` (lines 244–252);
- item 3, proper discontinuity (253–255);
- Layer 1 items 1–3 (268–276);
- Layer 2 item 1, the identity-coordinate isometry and the isometric PSL/PGL actions (288–293);
- Layer 4 item 5 (357–359);
- Layer 4a, `π/21` with equality exactly at `(0;2,3,7)` (365–371).

No README line cites FuchsianOrbifolds Layer 7 any longer.

### Other changed passages

- **Supply sentence (line 41).** Its claim that the suppliers consume nothing from this roadmap was checked against each supplier:
  - At #1168, `grep -n -i teichm` returns lines 29, 30, 125, 157, 402 and 497, all ownership notes or edges into this roadmap.
  - At #903, lines 163, 209 and 7897 name TeichmullerGeometry as a consumer.
  - On main, ComplexCurveModuli does not cite it.
- **`OuterAut` (lines 15 and 587, and the build paragraph at line 114).** §4.2 (line 518) defines it, and `Suggested.lean` line 558 declares it under the comment "Layer 4: the outer automorphism group (§4.2)". §5.4's *Needs* line (632) lists §4.2. Layer 5's Dependencies paragraph includes Layer 4. This resolves the previous report's remark on line 16.
  - `TauCeti.ContinuousOut` is at `TauCeti/Topology/Algebra/Group/ContinuousAut/Basic.lean` line 311.
  - FiniteGroupInvariants §3.1's `Out(G)` is at #1708 lines 663–667.
- **DNB wording (line 16).** "An isomorphism from the topological mapping class group onto §4.2's `OuterAut`" matches `dehn_nielsen_baer`: `MappingClassGroupFull S ≃* OuterAut (FundamentalGroup S x₀)` under `hb`, `ho` and `1 ≤ Surface.genus S` (`Suggested.lean` lines 608–616), and §5.4 (line 622).
- **§9.1, §9.2 and the Layer 9 Dependencies paragraph (859–899).**
  - The supplier is renamed consistently in both *Needs* lines and in Check 3.
  - The Dependencies paragraph lists FuchsianOrbifolds Layer 4, which §9.2 uses for the covolume, and ArithmeticFuchsianGroups Layer 1.
  - §9.3 and §9.4 cite neither.
- **Downstream consumers (line 989).** It agrees with #2026 lines 1016–1018: genus `≥ 3`, nonarithmetic and `PGL₂`-maximal. It also agrees with lines 1085–1087, which hand the application to Layer 11's generic locus downstream. ArithmeticFuchsianGroups' spectral inputs, PDO P7a and NQS M1, are named as theirs.

### Seeded sample

- **§9.1 falls in changed text.** I re-read Takeuchi 1975 (J-STAGE, in the worker's cache):
  - lines 9–30, on printed p. 600: `Γ(A, 𝒪)` is the image of the norm-one units, discrete in `SL₂(ℝ)`;
  - lines 40–41: changing the splitting conjugates by `GL₂(ℝ)`, hence "up to conjugacy";
  - the Definition, lines 42–46, on p. 601.

  The locator "§1 and the Definition, pp. 600–601" holds.
- **§9.2's changed line carries the Borel locators.** In Borel 1981 (Numdam), Lemma 8.1 is at lines 779–789 (printed p. 25): the generator count `2g + m + r − 1` is bounded by the covolume. Theorem 8.2 is at lines 811–815 (p. 26): finitely many arithmetic subgroups of `G_{a,b}` of covolume `≤ c`, up to conjugacy. Both support the text as written.
- **§5.4 is cited by changed line 16.** It is checked above.
- **The other sampled targets are untouched.** Their locators were verified in rounds `~8` to `~10`.

### Adversarial table

Rows G1–G11 are new and cover the changed statements. Rows marked "~13" are carried from `PRREVIEW-TeichmullerGeometry~13`, and through it from `~12`, `~11` and `~10`, for statements this diff leaves untouched. ~13 E9 (the supply claim) is replaced by G8.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| G1 | Contract, ArithmeticFuchsianGroups L1 item 1 | `k = ℚ`, `B = M₂(ℚ)`, `O = M₂(ℤ)`; `(2,3,7)` with `k = ℚ(cos 2π/7)` | `Γ(O) = PSL₂(ℤ)`, signature `(0;2,3;1)`, area `2π(−2 + 1/2 + 2/3 + 1) = π/3 ≈ 1.0472`, noncocompact since `B` is split; the cubic field `B` is ramified at 2 real places, so division, cocompact, area `2π/42 ≈ 0.1496` | matches #2026 lines 155–167 | none |
| G2 | Contract, L1 item 4 at `(g; −)` | `r = c = 0`, `g = 0, 1, 2` | `A = 2π(2g − 2)`: `−4π`, `0` (both in #2026's `A ≤ 0` branch: no lattice), `4π ≈ 12.566`; `r₀ = 4`, `C_sig = 2⁴·4π = 64π ≈ 201.06`; conjugacy in `PSL₂(ℝ)` | the signature is in scope | none |
| G3 | §9.2: covolume `4π(g − 1)` | Bolza; Klein quartic | `48·(π/12) = 4π` (`g = 2`); `168·(π/21) = 8π` (`g = 3`) | true | none |
| G4 | §9.2 Check 3 | `(0;2,3,7)`, `(0;2,3,8)`, `m → ∞` | `π/21 ≈ 0.14960`, `π/12 ≈ 0.26180`, limit `π/3 ≈ 1.04720`, all `< π/3`; Borel's bound: `2h − 2 + r/2 = −1/2 ≤ (π/21)/2π = 1/42` | true and discriminating | none |
| G5 | §9.1, Takeuchi's definition | `PSL₂(ℤ)`; a point of `Teich(S₂)` with a transcendental trace | `M₂(ℤ)` gives `SL₂(ℤ)`, which maps to `PSL₂(ℤ)`: arithmetic. Takeuchi's condition (I) fails for the transcendental trace: not arithmetic | matches lines 42–46 | none |
| G6 | Line 15, `OuterAut` | `S₃`, `Q₈`, `ℤ`, `ℤ²` | `6/6 = 1`; `24/4 = 6`; `{±id}`, order 2; `GL₂(ℤ)` | agrees with §4.2 and Lean line 558 | none |
| G7 | Line 16, DNB | `T²`; `S²`; genus 2 | `GL₂(ℤ) = GL₂(ℤ)`; `S²`: 2 versus 1 element, excluded by `hg` since the genus is 0; genus 2: all hypotheses `hb`, `ho`, `hg` hold | true; the statement matches the Lean | none |
| G8 | Line 41, supply runs one way | #1168 `4b6bb3d`; #2026 `e4e4f9a`; #903 `fa2b5cc0` | ids of this roadmap consumed: 0, 0 and 0 | true | R01 (prev.) repaired |
| G9 | §0.4a versus ArithmeticFuchsianGroups L3 | `F = z ↦ −2z̄`; `F = z ↦ −z̄` | both routes give `c = diag(−2,1)`; both give `c = diag(−1,1)` | two owners of one statement | R01 |
| G10 | Line 989 versus ArithmeticFuchsianGroups L3 | `g = 3`; `g = 2` | covers of genus `8·3 − 7 = 17`, with `χ = 8·(−4) = −32 = 2 − 2·17`; for `g = 2` the hyperelliptic involution gives an index-2 discrete overgroup, so the group is never maximal | consistent with "genus at least three" | none |
| G11 | Layer 4 supplies `OuterAut` | §5.4 *Needs*; Layer 5 Dependencies | §4.2 is listed at line 632; Layer 5 consumes Layers 0, 3 and 4 | consistent | none |
| ~13 E1–E3 | §0.4a: proper discontinuity; the glide Check; isometry lifting | `diag(−2,1)`, `K = B(i,1)`; `⟨z ↦ 2z, z ↦ 3z⟩` | `d(i, gⁿi) = 0.693147·\|n\|`, 5 elements; not discrete; the lifts `a` and `ag⁻¹` differ by `g` | true | none |
| ~13 E4–E8 | Layer order; §1.2/§2.1; §2.2/§3.2; line 97; `exists_mulEquiv_isometryEquiv_glAction` | 52 *Needs* lines; `τₙ = i(1 + 1/n)`; `τ ↦ −τ̄`; `i, 2i` | 0 upward citations; chart distance `1/n`; `∂_τ̄ = −1`; `0.693147` on both sides | true | none |
| ~13 (~12 D1–D8, ~11 C1–C2, ~10 N1–N7) | §§0.0a–0.5, §2.4, §3.1–§11.1, the conventions | `S = ∅`, Dyck, `Q₈`, Bolza, Klein; genus-2 Euler number | `χ = 1, 0, −1`; `96 ≤ 168`; `e = −2` | true (the §0.2 ownership is R03) | R03 |

### Headline theorems

- **Unchanged.** `Suggested.lean` states the same 22 sorried headlines:
  - `exists_pl_approximation_open`, `exists_pl_approximation_halfPlane`, `image_boundary`;
  - `isotopic_of_homotopic_closedSurface`, `isotopicRel_of_homotopicRel`;
  - `StandardSurface.isSurface_model`, `StandardSurface.eulerChar_model`, `StandardSurface.homeomorph_unique`;
  - `classification_of_surfaces`, `homeomorph_iff_invariants`, `Surface.eulerChar_eq_two_sub_two_mul_genus`;
  - `IsBranchedCover.exists_degree`, `riemannHurwitz`, `MappingClassGroupPL.toTop_bijective`;
  - `exists_mulEquiv_isometryEquiv_glAction`, `exists_diffeomorph_mapOfEq_eq`, `baer_epstein_smooth`, `dehn_nielsen_baer`;
  - `mcg_sphere_full`, `mcg_torus_full`, `measurable_riemann_mapping`, `nielsen_realization`.
- **The "not statable" list is unchanged.** The docstring (lines 59–80) still names `Teich(Σ)`, the open dense loci with the arithmetic locus, Teichmüller's theorem, the Euler number and coherent orientations.
- **No new headline is statable.** The arithmetic locus still needs the missing `Teich(Σ)` carrier.
- **No padding.** No statement changed, so the earlier one-tactic probe stands: 22 of 22 sorries resist.

### Remarks on untouched text

- none

## Not verifiable

- **Changed passages.** Every external locator in a changed line was re-read: Takeuchi 1975 and Borel 1981.
- **Carried from earlier rounds.**
  - Imayoshi–Taniguchi and Hubbard are commercial and not in the cache.
  - Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified.
  - Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled.
  - Kerckhoff 1983 is waived.
- **Ownership against open pull requests.** It was checked against the sibling heads the brief lists: #1168, #2026, #903 and #1708.

## Source issues

- none
