# Review of PadicPeriodRings (pull request #940 at 038fba6)

**Verdict:** accepted

🤖 AI review by independent-review-PRREVIEW-PadicPeriodRings~4. Incremental re-review of the 25 lines changed since 2362d7e (13 insertions, 12 deletions, README only; `Suggested.lean` unchanged). The change repoints every citation of the perfect-residue ramification package from LocalFieldsRamification §§3a/4a to the new roadmap RamificationOfCompleteDiscretelyValuedFields, which the merge order lists at line 2, sixteen places above this roadmap. Every section, declaration name and statement now attributed to it resolves at its open head with the content the README attributes to it, and its scope paragraph leaves to this roadmap exactly what §2 still owns. The gate passes, the dependency check reports no upward edge or cycle, elaboration has `sorry` as its only warning, and the 22 signatures keep their binders. Three P3 notes, none blocking. No file of the pull request was changed.

## R01 (P3) — The scope paragraph still names LocalFieldsRamification for the perfect-residue inputs

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:7` ("records the ramification inputs over perfect residue fields that this roadmap consumes from LocalFieldsRamification (§0.3)").

**Claim:** §0.3 records inputs consumed from LocalFieldsRamification.

**Witness:** `README.md:9` ("Ramification over complete discretely valued fields with perfect residue field, in both characteristics, is RamificationOfCompleteDiscretelyValuedFields's"), `README.md:32` (the supplier row) and `README.md:75` (§0.3 itself) all name RamificationOfCompleteDiscretelyValuedFields; LocalFieldsRamification on main (`Completed/LocalFieldsRamification/README.md`, layer headings at its lines 72, 281, 576, 724, 1154) has no perfect-residue package. The sentence at line 7 is the one citation the repointing missed.

**Repair:** At `README.md:7` replace "consumes from LocalFieldsRamification (§0.3)" with "consumes from RamificationOfCompleteDiscretelyValuedFields (§0.3)". Retest: `grep -n LocalFieldsRamification README.md` then lists only the finite-residue-field citations (lines 31, 115, 137, 170).

## R02 (P3) — The subgroup rule is attributed to §3a.2; the supplier states it in §3a.1

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:75` ("the subgroup rule `H_u = G_u ∩ H`, Herbrand's theorem … tower transitivity … (§3a.2)").

**Claim:** RamificationOfCompleteDiscretelyValuedFields §3a.2 states the subgroup rule.

**Witness:** At its open head, §3a.1 states "For a subgroup `H = Gal(L/K′)`, `H_i = H ∩ G_i`" and names it "the subgroup formula" (`TauCeti.IsLocalRing.subgroupOf_ramificationGroup`); §3a.2 states Herbrand's theorem, tower transitivity, the intersection formula `Gal(M/L) ∩ Gal(M/K)^v = Gal(M/L)^{ψ_{L/K}(v)}` and the agreement with the pinned Herbrand declarations, and its proof cites "`H_i = H ∩ G_i` of 3a.1".

**Repair:** Move the clause "the subgroup rule `H_u = G_u ∩ H`" into the §3a.1 group of the sentence (after the different formula, before "(§3a.1)"), or add "(§3a.1)" after it. Nothing else changes: the rule is consumed with the rest of the package and the Needs lines cite §§3a.1–3a.2 together.

## R03 (P3) — The pull request's merge-order block still omits the two open revisions the README consumes

**Location:** the pull request description's merge-order block ("#1199 → #820 → #816 → this pull request"), against `README.md:32` (RamificationOfCompleteDiscretelyValuedFields) and `README.md:33,119` (ClassFieldTheory Layer 7, `map_unitFiltration_normResidue`).

**Claim:** The roadmaps this one depends on are listed in the merge-order block.

**Witness:** RamificationOfCompleteDiscretelyValuedFields exists only as a new-roadmap pull request (draft, head 0968401), and ClassFieldTheory Layer 7 with `map_unitFiltration_normResidue` exists only at the open ClassFieldTheory revision (draft; its README line 1457 and `Suggested.lean:2221`), not on main (`TauCetiRoadmap/ClassFieldTheory/README.md` on main: no "Layer 7", no `map_unitFiltration_normResidue`). Neither is in the block. The merge order itself is right (RamificationOfCompleteDiscretelyValuedFields at line 2, this roadmap at line 18), so the dependency check cannot see the omission.

**Repair:** None to the roadmap folder. Name the two pull requests in the merge-order block of the pull request description, or say there in one line that revisions and the new ramification roadmap merge first. This carries forward the previous review's R01.

## Previous findings

- R01 — partly repaired: the LocalFieldsRamification half is now a new roadmap folder that the merge order lists before this one (`README.md:32`, "RamificationOfCompleteDiscretelyValuedFields | On every field complete for a discrete valuation with perfect residue field"), which is the clean form of the contract; the pull request's merge-order block still names neither it nor the ClassFieldTheory revision (R03 above, P3).

## Verified sound

I read the full 25-line change set, every line of the README that names RamificationOfCompleteDiscretelyValuedFields or LocalFieldsRamification (lines 7, 9, 31, 32, 75, 115, 119, 137, 170, 295, 299, 308, 312, 320, 324, 374), §0.3 in full with its Checks, the whole README of RamificationOfCompleteDiscretelyValuedFields at its open head (696 lines) and the relevant sections of LocalFieldsRamification on main and of the ClassFieldTheory revision.

**Gate, dependency check, elaboration.** The worker's gate at this head: every scanner 0, `build=0`, OK. `lake env lean TauCetiRoadmap/PadicPeriodRings/Suggested.lean` from the project root: 14 `declaration uses sorry` warnings, nothing else, exit 0. `git diff --stat origin/main...HEAD` outside the folder: empty. `git diff --stat 2362d7e HEAD -- Suggested.lean`: empty, so the previous reports' one-tactic probe (none of the 14 theorems closes under `first | rfl | trivial | simp | infer_instance | simp_all | (intro; rfl) | exact fun _ => rfl`), headline audit and padding audit apply unchanged. The movable dependency check returned:

```text
depcheck: 205 roadmaps, 1656 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists RamificationOfCompleteDiscretelyValuedFields at line 2, PerfectoidTowers at 17 and this roadmap at 18; LocalFieldsRamification (under `Completed/`), ClassFieldTheory and DerivedModuleAlgebra are on main.

**Signatures.** The worker's elaborated signatures of all 22 declarations flag two as having lost a binder (`bDeRhamPlus_isDiscreteValuationRing`, `bDeRham_isField`, "`[IsAdicComplete (Ideal.span {(p : R)}) R]`"); both elaborated types contain `[inst_7 : IsAdicComplete (Ideal.span {↑p}) ↥R]`, so the lead is a printing mismatch, not a dropped binder. The Lean file is byte-identical to the one the previous two reviews checked with `#check @name`, so the rest of that comparison carries forward.

**The new supplier, resolved at its open head.** RamificationOfCompleteDiscretelyValuedFields (new roadmap folder, same author, draft) at head 0968401: its summary says it "continues LocalFieldsRamification past the nonarchimedean local fields it treats"; `perfectResidueHerbrand` is named at its Layer 3a opening ("The perfect-residue Herbrand package (`perfectResidueHerbrand`)") with an export table mapping exactly the six sections the README's row lists. Statement by statement against `README.md:75`:

- §3a.1: `B` a complete DVR free over `A`; generator `x` with `lowerIndex B σ = v_L(σx − x)`; `G_0` the inertia group; `G_i = 1` for large `i`; Hilbert's formula `d(L/K) = Σ_{i≥0}(#G_i − 1)`, which is the README's `Σ_{g≠1} i_G(g)` by the counting identity the section cites. Also the subgroup formula (R02).
- §3a.2: `φ(u) = ∫_0^u #G_t/#G_0 dt` (the README's `∫ dt/[G_0 : G_t]`), `ψ`, `G^{φ(u)} = G_u`, Herbrand's theorem `(G/H)^v = G^vH/H`, tower transitivity in both forms, the intersection formula, and agreement with `TauCeti.LocalFieldsRamification.herbrandOrderIso`, `herbrand`, `inverseHerbrand`, `psiNat`, `upperRamificationGroup` on local fields (`README.md:75` last sentence). The README's `G^v = (G_0)^v` for `v ≥ 0` is the intersection formula with `L` the maximal unramified subextension (`ψ_{L/K} = id`), and §3a.3's proof uses it in that form ("For `v ≥ 0` the upper groups of `G` are those of its inertia group `G_0`"); unchanged from the previous review's reading.
- §3a.3: Hasse–Arf for abelian `G` with separable residue extension, "No finiteness of the residue field is assumed"; the proalgebraic unit group `U_F` over an algebraically closed residue field with its principal-unit subgroups, connectedness, the norm `U_E → U_F`, `V = ker N`, `V⁰ = I_H U_E` and `H/[H,H] ≅ π₀(V)`; and the line "These comparisons do not require geometric reciprocity, which PadicPeriodRings builds on these unit groups". Its Scope says "PadicPeriodRings owns the geometric reciprocity construction on the proalgebraic unit groups built in §3a.3, with its finite-isogeny fundamental group, reciprocity map and Sen tower estimates", which is exactly `README.md:9` and §2's senUpperBreaks. One owner per object.
- §4a.1: `G_K^u` as compatible restrictions (the inverse limit), closed, normal, antitone, surjecting onto `Gal(M/K)^u` for every finite Galois `M`, `G_K^0 = I_K`, trivial intersection; the README lists these six.
- §4a.2: `ψ_{L/K}` for finite separable `L/K` and `G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)}`.
- §4a.3: `K′` the completion of `K^ur`, `e(K′/K) = 1`, residue field an algebraic closure of `k` (equal to `k^s` for perfect `k`, as the README says), `L₀ ↦ L₀ ⊗_{K^ur} K′` an equivalence, `G_{K′} ≅ I_K`, `e` and the normalized different preserved, `G_i(L′/K′) = G_i(L/K)` for `i ≥ 0` and `G^v` for `v ≥ 0`, "in both characteristics". The README's "preservation of `ord_K(p)`" is `e(K′/K) = 1`.

RamificationOfCompleteDiscretelyValuedFields's own suppliers are ProfiniteCohomology, ProfiniteProPGroups, LocalFieldsRamification, ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24 and AdicSpacesPartII §R0.19.9; it cites PadicPeriodRings only as a downstream owner (lines 72 and 410 of its README), never in a `*Needs:*` line, so the pair has one direction.

**The unchanged half of the split row.** `README.md:31` cites LocalFieldsRamification on main for "Layer 2's maximal unramified extension" and "Layer 3's … Hasse–Arf for finite abelian extensions, and the different": on main, `Completed/LocalFieldsRamification/README.md` has `### Layer 2: unramified extensions and Frobenius` (line 576) with the maximal unramified extension defined at line 665, and `### Layer 3: ramification, the tame and wild cases, and the filtration` (line 724) with Hasse–Arf at line 1022 and its `hasseArf` export at 1039. The open LocalFieldsRamification revision by another author (Layers 0–2 on cyclic `p`-power breaks and Hasse–Arf arithmetic, 570 lines) has no "3a", "4a" or `perfectResidueHerbrand`, so there is no second builder of the perfect-residue package: `roadmaps grep perfectResidueHerbrand` over main and the 440 open pull requests hits only the new roadmap and this one; `roadmaps grep -i 'proalgebraic unit'` likewise. `roadmaps grep 'namespace TauCetiRoadmap.PadicPeriodRings' --lean-only`: only this folder.

**ClassFieldTheory Layer 7, unchanged citation re-resolved.** At the open ClassFieldTheory revision: README line 598 (export table row "unit-filtration reciprocity | `map_unitFiltration_normResidue`, `conductorExponent_eq_sInf_upperRamificationGroup`"), line 1457 (the target, finite abelian `L/K`), `Suggested.lean:2221` (`theorem map_unitFiltration_normResidue`). Not on main (R03).

**Citation leads.** The worker's resolve tool lists `Tower.limOne_exact` and `Tower.limOne_subsingleton_of_isMittagLeffler` (`README.md:38`) as found in no pinned library: they are DerivedModuleAlgebra's own declarations, on main at `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean:478` and `:407`, cited as that roadmap's; not a finding.

**Sources.** Brinon–Conrad, read through the sources cache (author page copy; printed page = PDF page): `brinon-conrad line 259` Definition 1.3.1 lies between the page-7 and page-8 markers (lines 231, 273), stating a `p`-adic field as complete for a discrete valuation with perfect residue field of characteristic `p`; `line 375–386` Exercise 1.4.4 lies between the page-10 and page-11 markers (359, 401): (2) `K^un` is not complete when `k` is not algebraically closed, (3) `K̂^un` has residue field an algebraic closure of `k`, `I_K ≅ G_{K̂^un}` by Krasner, and `L ↦ L ⊗_{K^un} K̂^un` is an equivalence with `L ⊗ K̂^un ≅ L̂`. This is the §4a.3 content `README.md:75` restates, in mixed characteristic; the equal-characteristic extension is the supplier's own argument (its §4a.3 proof), consistent with what the README consumes. `line 8585` Lemma 13.1.6 (p. 201) as in the previous review. Serre, Local Fields III §6, IV §§1–3: paywalled, uncertified, unchanged.

**Computed adversarial table.** New rows recompute the consumed statements on the new supplier's own instances; rows for untouched statements carry forward from the previous two reports (49 rows in the full review's table, 8 in the previous incremental one).

| Statement / object | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §0.3 different formula `ord_L(𝔇) = Σ_{g≠1} i_G(g)` against the supplier's §3a.1 Check | Artin–Schreier `y^p − y = t⁻¹` over `F̄_p((t))`, uniformizer `y⁻¹`, `σ(y) = y+1` | `σ(y⁻¹) − y⁻¹ = −1/(y(y+1))`, valuation 2, so `i_G(σ) = 2` for all `p−1` nontrivial `σ`: `Σ = 2(p−1)`; Hilbert's form `(#G_0−1)+(#G_1−1) = 2(p−1)` with `G_0 = G_1 = C_p`, `G_2 = 1` | agree; the supplier's stated `d = 2(p−1)` |
| §0.3 Herbrand function and upper jump, same extension | `u ∈ [−1,1]`, `u ≥ 1` | `φ(u) = u` on `[−1,1]`, `φ(u) = 1 + (u−1)/p` for `u ≥ 1`; lower jump 1 ↦ upper jump `φ(1) = 1`, an integer (abelian, Hasse–Arf); `ψ(2) = p+1` | agree with the supplier's §3a.2 Check |
| §0.3 Check 1 (tame quadratic over infinite residue field) | `K = Frac W(𝔽_p(s)^perf)`, `p` odd, `L = K(√p)` | `i_G(σ) = ord_L(2√p) = 1` (2 a unit); `𝔇` exponent 1; `G_0 = G`, `G_t = 1` for `t > 0`, so `φ(u) = ∫_0^u dt/2 = u/2`; the lower jump 0 gives upper break `φ(0) = 0` | pass |
| §0.3 Check 2 at `p = 2` against the supplier's §4a.1 Check | `ℚ₂(ζ₈)/ℚ₂`, `(ℤ/8)^×` | lower jumps 1, 3 (`#G_0 = #G_1 = 4`, `#G_2 = #G_3 = 2`); `φ(1) = 1`, `φ(3) = (4+2+2)/4 = 2`; image all for `u ≤ 1`, `{1,5}` for `1 < u ≤ 2`, trivial for `u > 2`; `d = 3+3+1+1 = 8` | both roadmaps print the same values |
| §0.3 `G^v = (G_0)^v`, `v ≥ 0`, as the intersection formula | `ℚ_3(ζ_9)/ℚ_3`, `L =` maximal unramified subextension `= ℚ_3` | `ψ_{L/K} = id`; `Gal(M/L) ∩ Gal(M/K)^v = Gal(M/K)^v`; under §4a.3 base change to `K′`: `e = 6`, `#G_0 = 6`, `#G_1 = #G_2 = 3`, `G_3 = 1`, `d = 5+2+2 = 9`, `d/e = 3/2`, upper jumps `0` and `φ(2) = (3+3)/6 = 1` | agree with the supplier's §4a.3 Check and with the previous report's §1.3 real-depth row (`G^v` of order 3 on `(0,1]`, trivial for `v > 1`) |
| §0.3 `K̂^un` residue field "`k^s`" versus the supplier's "algebraic closure" | `k` perfect; `k = F̄_p` | perfect `k`: `k^s = k̄`; `k = F̄_p`: `K^un = K`, `K′ = K`, `I_K = G_K` (supplier §4a.1 Check 2) | consistent; the README's §0.3 hypothesis "perfect residue field" makes the two readings equal |
| §2 senUpperBreaks: `π₁(U_F^{⌈v⌉}) ↦ G^v` against the supplier's graded norms | `v = 0`; `v ∈ (0,1]`; `E = F` | supplier §3a.3: `N(U_E^{ψ(s)}) = U_F^s` for integer `s`, `π₀(V) = 1` for `E = F`; `v = 0`: image `G^0 = G_F = I_F` (residue field algebraically closed); `v ∈ (0,1]`: `U_F^1` ↦ `G^v` | pass; the ceiling is forced by the integrality of the supplier's filtration index |
| §2 senUpperBreaks spacing `ord_K(p)` through §4a.3 | cyclotomic `ℤ_2`-tower over `K = ℚ_2(ζ_4)`; `K′` its completed maximal unramified extension | `e(K′/K) = 1` so `ord_{K′}(2) = ord_K(2) = 2`; the previous report's row gives `y_{k+1} − y_k = 2` | consistent after base change |
| §2 general-base `senTowerEstimates` different formula `v(𝔇_{L_n/F′}) = n + c + p^{−n}a_n` | cyclotomic tower, `p` odd, `F′ = ℚ_p(ζ_p)`, `L_n = ℚ_p(ζ_{p^{n+1}})`, `v(p) = 1` | `v(𝔇_{ℚ_p(ζ_{p^m})/ℚ_p}) = m − 1/(p−1)`; transitivity: `v(𝔇_{L_n/F′}) = (n+1 − 1/(p−1)) − (1 − 1/(p−1)) = n`; so `c = 0`, `a_n = 0` | pass; the form is attained with the supplier's §3a.1 different |
| §2 completedUnramifiedDescent, degenerate base | `k` algebraically closed | `K^un = K`, `R′ = R`, `G_k = 1`, `M^{G_k} = M`, `R′ ⊗_R M → M` the identity | pass, consistent with the supplier's §4a.1 Check 2 |
| §3a.3 `H^ab ≅ π₀(ker N)` as consumed in §2 | `E = F`; tame cyclic degree `e`; Artin–Schreier `C_p` | `V = 1`, `π₀ = 1`; supplier's graded-norm Check: `π₀(V_0) ≅ C_e`, `π₀(V_s) = 1` for `s ≥ 1`; `π₀(V_1) ≅ C_p`, `π₀(V_2) = 1`; `H^ab = C_e`, `C_p` | pass |
| All Lean statements | unchanged since ded1f45 | previous reports' rows "0.1 discrete torsion" through "4.3 filtered surjectivity" | carried forward |

**Shape of the changed passages.** §0.3 remains a record of a consumed contract (no target, no `*Needs:*` line, three Checks); the split supplier row keeps the finite-residue and perfect-residue halves under their owners; the `*Needs:*` lines at 137, 299, 312, 324 and 374 name the supplier by roadmap name and section. No process words, pull-request numbers, round labels or local paths in the diff (grep over the 13 inserted lines: none). The References section is unchanged and lists no roadmap, so nothing there needed repointing.

**Ownership against open pull requests** was checked through the tool's index of 2026-11-03 (440 pull requests) for the three objects the change touches (the perfect-residue Herbrand package, the proalgebraic unit group, this roadmap's namespace); the sibling checkouts the brief lists do not include the new ramification roadmap or the ClassFieldTheory revision, which were read through `roadmaps show --pr`.

## Not verifiable

- Serre, Local Fields (1979), III §6 and IV §§1–3 (cited at `README.md:76` as the source of the consumed statements): Springer, paywalled; uncertified. Checked instead against Brinon–Conrad Definition 1.3.1, Exercise 1.4.4 and §13.1, and against the supplier's own sections, which cite Serre at the same places.

## Source issues

- none
