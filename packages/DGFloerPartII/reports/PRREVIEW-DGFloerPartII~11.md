# Review of DGFloerPartII (pull request #1799 at 9e65f2b)

**Verdict:** needs changes

This is an incremental re-review of the 95 changed lines since aeddaae. Only
`TauCetiRoadmap/DGFloerPartII/README.md` changed; `Suggested.lean` is identical to aeddaae.

- **Previous findings.** R03 (`BSp`) and R05 (4.6 residue) are repaired. R01 is partly repaired:
  the direct TopologicalKTheory supply is gone, but the mutual supply remains through
  GeneralizedCohomology (R01 below). R02 and R04 concern the pull request description, which has
  not changed (R02 and R03 below).
- **Gate.** My re-run fails only on `depcheck`, against the unmoved merge order. The `--movable`
  check reports it as the `moved:` case with 0 problems, so it is not a defect (details under
  Verified sound). `lake env lean` gives 23 `sorry` warnings and no error.

## R01 (P2) — TopologicalKTheory still supplies 4.2a–4.2b, so the consumption Downstream consumers offers it in T1.6 closes a cycle

**Location.** README lines 1879–1881: "TopologicalKTheory can consume 4.2a–4.2c in T1.6a, T1.6d
and T7: the stable `O`, compared with the loop space of its stable real Grassmannian `BO`; the
Grassmannian member `Ω₇` with its stabilization, compared with `ℤ × BO`".

**Claim.** TopologicalKTheory T1.6a and T1.6d can consume 4.2a–4.2b without the two roadmaps
supplying each other.

**Witness.** 4.2a and 4.2b consume GeneralizedCohomology G4.0b (lines 1341, 1398). Main's
GeneralizedCohomology, line 2612: G4.0a/b consume TopologicalKTheory T1.5–6. TopologicalKTheory
#1807 (64a16e1): T1.6a (line 499) consumes 4.2a, and T1.6d (line 824) consumes 4.2b.

**Why it matters.**

- The supply runs in a cycle at section level. TopologicalKTheory T1.5–T1.6 supply
  GeneralizedCohomology G4.0a–G4.0b, which supply 4.2a–4.2b, which supply TopologicalKTheory
  T1.6a and T1.6d.
- #1807 states the first edge itself. Its TopologicalKTheory lines 142–146 give G4.0b's direct
  inputs as T1.5's cells and smooth upgrade and "T1.6's stable carriers". Its GeneralizedCohomology
  line 3444 repeats main's line 2612.
- This roadmap's supplier contract (lines 371–373) takes `Sp(r)` and the quaternionic
  Grassmannians of 4.2a–4.2b from G4.0b, so that edge cannot be dropped here.
- The dependency check reads main's TopologicalKTheory, which does not cite this roadmap, so it
  reports nothing.
- This corrects the bullet the previous review proposed. Its R01 removed the direct edge
  (4.2c → T1.6a, T1.6d) but did not trace the path through G4.0b.

**Repair.**

1. Replace the first bullet of Downstream consumers by:

   > TopologicalKTheory can consume 4.2a–4.2c in T7: the stable `O` for its loop comparison
   > `ΩBO ≃ O`, the Grassmannian member `Ω₇` with its stabilization for its comparison with
   > `ℤ × BO`, and the eight stable Bott maps with real Bott periodicity for the periodicity of
   > `KO`. It cannot consume them in T1.5–T1.6: GeneralizedCohomology G4.0a–G4.0b consume those
   > sections, and 4.2a–4.2b consume G4.0b. Those comparisons with `BO` are TopologicalKTheory's,
   > and nothing in this roadmap uses them.

2. In the description's merge-order paragraph, place #1807 (TopologicalKTheory) after this pull
   request. Make that conditional on #1807 moving its citations of 4.2a and 4.2b from T1.6a
   (line 499) and T1.6d (line 824) to T7, or to another target that G4.0a–G4.0b do not consume.

**Tested.**

- With the consumption in T7, the paths out of 4.2a–4.2c reach:
  - G4.0b → G4.0a → TopologicalKTheory T1.5–T1.6 and T2's `K`/`KO` groups (G4.0a's
    scalar-forgetting maps, main's GeneralizedCohomology lines 1072–1076);
  - RiemannianGeometry R1 → TopologicalKTheory T6.6 (main's RiemannianGeometry line 287).
- In #1807's TopologicalKTheory nothing before T7 consumes T7: its dependency order (lines
  1613–1628) and every earlier mention of T7 (for instance lines 517–518) supply into T7. So none
  of these paths returns to T7.
- T2's `realKOClassifyingMap` (#1807 line 938) needs only T1.6d's integer components on `BO`, not
  the `Ω₇` comparison, so moving that comparison to T7 leaves T2 intact.

## R02 (P2) — Not repaired: main's DGFloer and two AlgebraicTopology revisions own this material, and the order against them is not stated

This carries R02 of the review at aeddaae (itself carried from earlier rounds). No repair report
gives a reason for leaving it.

**Location.**

- README lines 41–42: "The base roadmap, cited as **DGFloer** by layer and item, owns every other
  numbered statement of the source".
- The description's merge-order paragraph still ends "#1742 (GeneralAlgebraicKTheoryPartII) →
  **this pull request** (#1799)".

**Claim.** This roadmap is the only owner of Theorem B, §§6.3–6.4, §7 and 1.0's convenient
category.

**Witness.** Main's DGFloer still owns Theorem B (Layer 10 item 5, line 1562) and Layer 11 (line
1577); DGFloer #1798 (a64ca16, line 50) moves them here. AlgebraicTopology #1652 (287181d) and
#1663 (2dc8cf2), line 137 each, claim single ownership of 1.0's material.

**Repair.** As before, in the description's merge-order paragraph:

- **DGFloer.** Put #1798 (DGFloer) before this pull request. The README needs no change: every
  DGFloer id it cites resolves both on main and at #1798. For example, Layer 10 items 2–5 are
  #1798's §§10.2–10.5 (headings at lines 3905–4018), and Layer 11 is §§11.1–11.3 (headings at
  lines 4147–4244).
- **AlgebraicTopology.** State whether this pull request or AlgebraicTopology #1652/#1663 merges
  first. If AlgebraicTopology merges first:
  - cut 1.0's coreflection, convenient products, exponential law and pointed smash and
    suspension–loop constructions to a citation of its Stage 4 item 8;
  - keep in 1.0 only the sequential-colimit bullet and the raw-quotient comparison.

**Tested.** With #1798 first, main's DGFloer owns none of 1.3, 1.4, Layer 2, 3.2 or Layer 4 when
this pull request merges. #1798 lines 50–54 say that DGFloerPartII consumes DGFloer and supplies
nothing to it, which agrees with this README's last Downstream consumers bullet.

## R03 (P3) — Not repaired: the pull request description is stale

This carries R04 of the review at aeddaae. No repair report gives a reason for leaving it.

**Location.** The description says:

- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`";
- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones".

**Claim.** The description describes this head.

**Witness.** `Suggested.lean` declares no rotation family. It does state Theorem B (line 117),
the capacity theorems (lines 138–214) and Theorem G (line 340). The README cites no
HomotopySpheres: the James construction is GeneralAlgebraicKTheoryPartII §4.30b (line 348), and
4.2a–4.2c prove Bott periodicity.

**Repair.**

- Regenerate the description's summary and its last paragraph from the README Summary (lines
  3–26) and the module docstring of `Suggested.lean`.
- 1.1 compares the base roadmap's raw carriers with 1.0's convenient carriers, which are owned
  here.
- 3.1 uses TangentialBordism B5 and B6.3, not a "compact-image embedding".
- Add the merge-order statements of R01 and R02.

**Tested.** After regeneration, the description names no HomotopySpheres supply. Every Lean name
it mentions is one of the 27 declarations of `Suggested.lean`.

## Previous findings

- R01 — partly repaired: the Scope row, the supplier contract, 4.2c's `ℤ × BO` comparison and its
  *Needs:* entry are gone. Downstream consumers (lines 1879–1883) now offers 4.2a–4.2c to
  TopologicalKTheory T1.6a and T1.6d, which still supply 4.2a–4.2b through G4.0a–G4.0b (R01).
- R02 — not repaired: the description's merge-order paragraph still ends "#1742
  (GeneralAlgebraicKTheoryPartII) → this pull request (#1799)" and names neither DGFloer #1798
  nor AlgebraicTopology #1652/#1663 (R02).
- R03 — repaired: 4.2c (lines 1490–1498) now reads "`Ω₃ ≅ colim_m ⊔_(0≤p≤4m) G_p(ℍ^(4m))`",
  with components `colim_m G_(2m+d)(ℍ^(4m))`; the eight equivalences use `Ω₃`, and `BSp` appears
  nowhere in the folder.
- R04 — not repaired: the description still says `Suggested.lean` states "the rotation family at
  a fixed pole", and it still cites "HomotopySpheres' James construction and Bott periodicity"
  (R03).
- R05 — repaired: lines 1846–1848 read "reading it as `π_j(Q) ⊗ ℚ = 0` for every `j ≥ 2` … would
  put this `Q` outside Theorem B's hypothesis on `Q`, whereas `π_k(Q) ⊗ ℚ ≠ 0`".

## Verified sound

**Gate.**

- My run of the push gate on this head:

      gate DGFloerPartII: … depcheck=1 … FAIL
        depcheck: UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#332) at README lines [346, 653, 864, 1278, 1859]

  Every other scanner is 0.
- This is a false positive of the unmoved merge order: the board's merge order lists this roadmap
  at line 46. The same check with `--movable` on that order prints:

      moved: DGFloerPartII moved in the merge order from #46 to #332, right after its last supplier GeneralAlgebraicKTheoryPartII; checked as moved (the worker moves it there when it submits)
      depcheck: 238 roadmaps, 2352 edges, 0 problem(s)

- The worker's gate on this head passes every check, including `build`.
- The dependency check of the brief, against the moved order, prints
  `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`. In that order:
  - TangentialBordism is line 14;
  - GeneralAlgebraicKTheoryPartII is line 331;
  - DGFloerPartII is line 332.

**Build and Lean form.**

- `lake env lean` on `TauCetiRoadmap/DGFloerPartII/Suggested.lean` exits 0 in 13 s. It gives 23
  "declaration uses `sorry`" warnings, at lines 91, 100, 117, 138, 153, 171, 201, 214, 253, 260,
  267, 273, 280, 286, 294, 297, 300, 304, 308, 312, 316, 323 and 340, and no error. The lines are
  identical to the previous review's.
- `git diff aeddaae HEAD` touches only `README.md`. The previous review's `#check @` comparison of
  all 27 declarations and its one-tactic padding probe (all 23 goals fail) therefore stand.
- The elaborated-signature listing has 29 entries. Two of them, `of` (line 115) and `on` (line 189), are
  misparses of the docstring words "class of" and "structure on", so the file has 27
  declarations. Its two "Unknown identifier" errors come from those misparses, not from
  `Suggested.lean`.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat
  origin/main...HEAD` outside the folder is empty. The pins are Mathlib 1b1ccf4b and Tau Ceti
  2fd255d9.

**Library declarations opened at the pins** (for the edited 4.2c *Needs:* line):

- `HomotopyGroup.pathLoopSpaceMulEquiv`, `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:321`;
- `TauCeti.realClifford_classification`, `TauCeti/LinearAlgebra/CliffordAlgebra/Classification.lean:339`;
- Mathlib `HomotopyGroup.Pi`, `Mathlib/Topology/Homotopy/HomotopyGroup.lean:460`.

AlgebraicTopology's `cofibrationTowerHomotopyEquivalence` (main README line 683) is still used by
4.2c's CW-type argument (lines 1480–1483). The trimmed *Needs:* line therefore lists every input
the remaining route uses.

**Cross-roadmap citations resolved.**

- **TopologicalKTheory #1807 (64a16e1).**
  - Its supplier entry (line 191), T1.6a (lines 489–499), T1.6d (lines 821–832) and T7 (lines
    1504–1538, 1576, 1626) consume 4.2a–4.2c as the new Downstream bullet says.
  - It owns the comparisons with `BO`, so the bullet's last sentence is right; R01 concerns only
    where those consumptions sit.
  - T1.6d still reads 4.2b's stages `⊔_(0≤p≤2n) G_p(ℝ^(2n))` and its stabilization, which agree
    with 4.2b (lines 1374–1395).
  - #1807 never mentions `BSp` or `Ω₃`, so the R03 repair breaks no citation.
- **Other citations of this roadmap.** `roadmaps grep DGFloerPartII` finds citations only in
  DGFloer #1798 and TopologicalKTheory #1807. The TopologicalKTheory revisions in #1808 and #1854
  do not cite it.
- **Main's GeneralizedCohomology.**
  - G4.0a (lines 990–1003) consumes TopologicalKTheory T1.5–6's colimit construction.
  - Lines 1072–1076 give the scalar-forgetting maps to TopologicalKTheory's `K`/`KO` groups.
  - Line 2612 gives the dependency summary.
- **Main's RiemannianGeometry.** R1 (line 287) consumes TopologicalKTheory T6.6.
- **The R02 witnesses.**
  - Main's DGFloer: Layer 10 item 5 (line 1562) and Layer 11 (line 1577).
  - DGFloer #1798 (a64ca16): lines 50–54, §§10.1–10.5 (headings at lines 3879–4018) and
    §§11.1–11.3 (headings at lines 4147–4244).
  - AlgebraicTopology #1652 (287181d) and #1663 (2dc8cf2): line 137 in each.

**Ownership.**

- Searched by object, on main and at the open heads above, for:
  - the stable Grassmannian comparisons, now cut;
  - `BSp`, now unused;
  - the Clifford-chain colimits `Ω₃` and `Ω₇`.
- No other roadmap states the colimits as Grassmannian unions with the index `d`. TopologicalKTheory
  #1807 T1.6d builds its own homogeneous tower and compares it with 4.2b's stages.
- The two conflicts are R01 and R02.

**Seeded source sample, where it falls in the changed passages.**

| Target | Locator checked | Result |
| --- | --- | --- |
| 4.2c, the stable members | `eschenburg-hanke-bott` lines 165–181 (p. 5, table (2)): the third centriole of the `SO_(4n)` chain is `G_p(ℍ^n)` and that of the `Sp_n` chain is `G_p(ℝ^n)`; the minimal centriole is the middle Grassmannian | supports `Ω₃`, `Ω₇` and the components of `J₃`, `J₇`; the colimit identification itself is Milnor §24 (not verifiable) |
| 4.2c, the module dimensions and periodicity | `eschenburg-hanke-bott` lines 240–246 (Theorem 2), 283–293 (Theorem 3) | `m_j` and the homotopy periodicity as used |
| 4.6, the last Check | `bdho-cotangent` lines 5382–5396 (Example 7.4, p. 124): `Y` is `(2k−2)`-connected; for `k ≥ 3` and `Q′ = Tⁿ`, `π₂` vanishes and `Q` is rationally essential in Gromov's sense | as stated; `T⁸ # (S³ × S⁵)` meets `n ≥ 3k − 1 = 8` with `S⁵` `4`-connected |

The other sampled targets (1.0–3.2, 4.2a, 4.2b, 4.5) are untouched. They were checked in the
review at aeddaae, whose seven source issues stand.

**Adversarial table.** The rows marked "new" were computed in this review. The rows marked "carried"
are the review at aeddaae's, for statements this diff leaves untouched.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 4.2c, `Ω₃` as a colimit (new) | `m = 1, 2`; `d = 0, ±2, 3` | stages `p = 0..4` (`d = −2..2`) and `p = 0..8` (`d = −4..4`); `p ↦ p + 2` gives `(p+2) − 2(m+1) = d`; `d = 3` first at `m = 2` (`p = 7`); the dimension of the `d = 0` stage is `16m²`: 16, 64 | as stated | none |
| 4.2c, `Ω₇` as a colimit (new) | `m = 1, 2` | stages `p = 0..2` (`d = −1..1`) and `p = 0..4` (`d = −2..2`); `p ↦ p + 1` preserves `p − m`; `dim G_m(ℝ^(2m)) = m²`: 1, 4 | as stated | none |
| 4.2c, wrong model: rank label (new) | `Ω₃`, `m = 1 → 2` | `G₂(ℍ⁴)` goes to `G₄(ℍ⁸)`: `p` changes 2 → 4, while `d` stays 0 → 0 | the Check excludes it | none |
| 4.2c, eight equivalences, low degrees (new) | `π₀` against `π₁` | `π₀(Ω₃) = ℤ = π₁(U/Sp)`; `π₀(Sp) = 0 = π₁(G_(2m)(ℍ^(4m)))`; `π₀(Ω₇) = ℤ = π₁(U/O)`; `π₀(O) = ℤ/2 = π₁(G_m(ℝ^(2m)))` for `m ≥ 2`; `π₃(Sp) = ℤ = π₄(G₂(ℍ⁴))` | consistent | none |
| 4.2c Check, tangent space at `J₃` (new) | `n = 16`, `ℍ⁴` | `dim 𝔰𝔭(4) = 4·9 = 36`. `K = J₁J₂J₃` has `K² = +1` and `Kᵀ = K`, and `J₄K = −KJ₄`, so the eigenspaces are `ℍ² ⊕ ℍ²`. Blocks: `𝔰𝔭(2)² = 20` plus `ℍ^(2×2) = 16`, total 36. `dim G₂(ℍ⁴) = 4·2·2 = 16`; the stage dimensions `4p(4−p)` are 0, 12, 16, 12, 0 | as stated | none |
| 4.2b identification used by the change (new) | an `ℍ`-linear symmetric involution `K′` | `J = −J₁J₂K′` satisfies `J² = (J₁J₂)² = −1`, `Jᵀ = −J` and `J₁J = −JJ₁` | a bijection with `⊔ G_p(ℍ^(4m))` | none |
| 4.6 Check, rational essentiality (new) | `T⁸ # (S³ × S⁵)`; control `T⁸` | `π₂ = 0` and `π₃ ⊗ ℚ ⊇ ⊕_(ℤ⁸) ℚ ≠ 0`, so B's hypothesis holds (`ℓ = 3`). The wrong model gives `π_j ⊗ ℚ = 0`, so with `π₂ = 0` B's hypothesis fails. The degree-1 collapse to `T⁸` makes `Q` rationally essential. `T⁸` is both, and B's hypothesis fails there | the negative control separates the notions | none |
| Downstream consumers, TopologicalKTheory (new) | the section edges, read as "consumes" | T1.6a consumes 4.2a and T1.6d consumes 4.2b (#1807); 4.2a and 4.2b consume G4.0b (lines 1341, 1398); G4.0a/b consume T1.5–6 (GeneralizedCohomology line 2612); T7 is consumed by nothing upstream of 4.2a–4.2c | a cycle at section level through T1.6, none through T7 | R01 |
| Scope, out-of-scope sentence (new) | grep `BO`, `BSp` | no occurrence outside Downstream consumers | "nothing here uses them" holds | none |
| 2.6, `CPᵈ` class (carried) | `CP¹`; `d = 2` | one frame `(u, Iu)` per `u`; fibre degree 1; `dim Σ_p × S¹ = 2d` | `±g` | none |
| 2.6, `HPᵈ` class (carried) | `d = 1, 2` | involution degree `+1`, so degree 2; `dim = 4d + 2` = 6, 10 | `±2g` | none |
| 1.4, `deg τ_u = 1 + (−1)ⁿ` (carried) | `n = 2, 3, 4` | 2, 0, 2 | as stated | none |
| 1.4, rotation family (carried) | `n = 1, 2, 3` | `1 + (−1)^(n−1)` = 2, 0, 2; `H₂(SO(3)) = 0`; `H₃(SO(4)) = ℤ²` | as stated | none |
| 4.2, Proposition 6.17 (carried) | `n = 2, 4` | `deg τ = ±2`, `x̄ = −x`, `β_* = ∓2x²` | as stated | none |
| Theorem G (Lean), satisfiable (carried) | `T⁸ # (S³ × S⁵)`, `k = 3` | `ℓ = 2`; `S⁵` is 4-connected; one transverse point; trivial normal bundle | hypotheses hold | none |
| Theorem G, `k = n` (carried) | `Y = pt` | `⊤ ⊔ ⊥ = ⊤`; `S ≠ ∅`; `Sⁿ` is abundant | true | none |
| Theorem G, `d ≠ 0` (carried) | `T⁶ ⊔ (S² × S⁴)`, `S = ∅` | `0 = 0·[Y]`; closed geodesics of `T⁶` are noncontractible | `hd` is needed | none |
| Theorem G, `ℓ` (carried) | `k = 2, 3, 4` | `ℓ` = 2, 2, 6; `n` ≥ 5, 6, 11 | matches the source | none |
| Theorem G, disconnected `Q` (carried) | `Q₁ ⊔ Q₂` | reduces to `Q₁` | true | none |
| 4.2c index bounds (carried) | `n = 16m` | `8m−1`, `4m−1`, `2m−1`, `2m−1`, `2m−1`, `m−1`; `(n/m_k − |c|)/4` | as stated | none |
| `m_j` (carried) | `j = 0..8` | 1, 2, 4, 4, 8, 8, 8, 8, 16 | as stated | none |
| Stable groups (carried) | `i = 1..8` | `ℤ/2, 0, ℤ, 0, 0, 0, ℤ, ℤ/2` | as stated | none |
| Lean Bott ranges (carried) | the smallest `m` per class | `π₂(SO 4) = 0`, `π₁(SO 3) = ℤ/2`, `π₃(SO 5) = ℤ`, `π₉(SO 11) = ℤ/2`; `π₃(SO 4) = ℤ²` | the bounds are needed | none |
| Lemma 6.35 (Lean) (carried) | `n = 3..15`; `n = 4` | 0, `ℤ/2`, 0, `(ℤ/2)²`, `ℤ/2`, `ℤ/2`, `ℤ/2`; `π₃(SO 4) = ℤ²` | `Odd` is needed | none |
| 4.3 splitting (carried) | `n = 3, 7` | `0 ⊕ ℤ/2` against `π₂(SO 3) = π₆(SO 7) = 0` | the Check holds | none |
| 2.1 indices (carried) | `CP²`, `k = 2`; `HP¹` | `5 = 2·2·1 + 1`; `6k − 3` | as stated | none |
| 2.2 / 2.3 degrees (carried) | `CP²`; `HP²` | 0, 1, 4, 5, 8, 9; 3, 10, 13, 20 | as stated | none |
| 2.5 bidegrees (carried) | `CPᵈ`, `HPᵈ` | `E_(2d,1) → E_(0,2d)`; `E_(4d,3) → E_(0,4d+2)` | as stated | none |
| Theorem B route (carried) | Theorem 5.10, condition 2 | infinite order is not `dᵐ`-torsion | as stated | none |
| Theorem B (Lean) (carried) | `T^r`; `ℝP³`; `U = ∅`; `S² ⊔ T²` | `hQ` false; `π₃ = ℤ`; `H_n(∅) = 0`; connectedness needed | true | none |
| 3.3 sign (carried) | `T*ℝ²`, `σ = q₁dq₂` | `ω + dq₁∧dq₂` | as stated | none |
| 4.2a ranges (carried) | `U(r)`, `Sp(r)` | `i ≤ 2r − 1`, `i ≤ 4r + 1` | as stated | none |
| 1.3 quaternion Check (carried) | `v = (1, j)`, `λ = i` | `vλ = (i, −k)`; `iv = (i, k)` | as stated | none |
| 1.0 product Check (carried) | `ℝ/ℤ₊`, `ℚ` | `X ×_k ℚ` strictly finer | as stated | none |
| Capacity theorems (Lean) (carried) | `CP⁰`; `S¹`; `ℓ = 0`; `T^r` | 0; `n ≥ 2`; `A = 0`; `¬IsAspherical` false | true | none |

**Headline theorems.** These are carried; `Suggested.lean` is unchanged.

- Theorem B: line 117.
- Theorem I's spheres, Lie groups, covered manifolds, `CPᵈ` and `HPᵈ`: lines 138–214.
- Theorem G: line 340.
- The finite-rank Bott ranges and Lemma 6.35: lines 253–324.
- 1.0's convenient category: lines 91 and 100.
- Not statable at the pins, and named in the docstring: Theorem H (no evaluation shriek), fibered
  families, sphere bundles, products and Proposition 6.36, and stable `O`.
- Nothing in the diff adds or removes a headline. Stable `O` remains a README target, and the
  colimit form of `Ω₃` and `Ω₇` introduces no new carrier.

## Not verifiable

- **Milnor, *Morse Theory*, §24** (paywalled). This is the identification of the stable `Ω₃` and
  `Ω₇` with colimits of Grassmannians, and of their components with the index `d`. The values
  were recomputed above, and `eschenburg-hanke-bott` lines 165–181 support the finite stages.
- **R. Bott, Ann. of Math. 70 (1959)** (paywalled).
- **Carried from the review at aeddaae; untouched by this diff:**
  - Ziller (Invent. Math. 41, 1977);
  - BDHO, *Morse homology with DG coefficients*;
  - Thom (1954); Jap87;
  - Hatcher, Steenrod, Milnor–Stasheff, Pontryagin and Munkres.

## Source issues

- **Misprint** in eschenburg-hanke-bott at §1, table (2), first row, printed page 5: the source lists the first centriole of the `SO_(4n)` chain as `SO_(4n)/U_(4n)`; it should be `SO_(4n)/U_(2n)`, as the next entry `U_(2n)/Sp_n` and the dimensions show; affects nothing.
