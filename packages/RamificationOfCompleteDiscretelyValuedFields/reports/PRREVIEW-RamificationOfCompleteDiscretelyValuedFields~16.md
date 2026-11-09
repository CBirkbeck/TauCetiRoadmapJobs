# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 9b92470)

**Verdict:** needs changes

This is an incremental re-review of the 19 lines that changed since 0572f17. All of them are in `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`, in three hunks of §4a.1:
- the third API bullet now states `G_K^(u+) ⊆ G_K^u` for every `u`, and `G_K^(0+) ⊆ G_K^0` in particular (lines 750–755);
- the proof adds a sentence deriving that inclusion (lines 786–788);
- the Check at `Frac W(F̄_p)(ζ_p)` is reworded to say the inclusion can be strict (lines 881–883).

`Suggested.lean` and every file outside the folder are unchanged: `git diff --stat 0572f17 HEAD` lists only the README, and the diff against `origin/main` outside the folder is empty.

- **Gate.** I reran it at this head and every check passed (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). The worker's run also reports `build=0`.
- **Dependency check.** `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. Its only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Gaps.** The package has no `design/plan.json`, so no gaps are declared.

The repair of the previous R02 is correct. A Lean probe checks the proof step it adds, and every changed statement is computed below (rows 76–80). No new finding. The finding about the pull-request description is carried over unrepaired.

## R01 (P3) — The description still names two suppliers the README does not consume

**Location.** The pull-request description, *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia) and ReductiveGroupsPartII §RG2.0.4 (§4a.3)".

**Claim.**
- The description is unchanged since the previous review.
- It lists ProfiniteCohomology and EtaleCohomologyFoundations §F.3a as suppliers, but the README consumes neither. §4a.1 states no tame-inertia target, and its inertia comes from Mathlib's `ValuationSubring.inertiaSubgroup` and Tau Ceti's `TauCeti.inertiaSubgroup`.
- ProfiniteCohomology is also not a completed roadmap: on main (373d88d) it sits at `TauCetiRoadmap/ProfiniteCohomology`, and `Completed/ProfiniteCohomology` does not exist.
- No repair report marks this finding as not actionable.

**Witness.** At this head, `grep -c -i 'ProfiniteCohomology\|EtaleCohomology\|F\.3a' README.md` returns `0`. The README's suppliers are the contract headings at lines 137, 191, 243 and 253, and the dependency order at lines 1104–1114.

**Repair.** Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. No open pull request is a supplier."

**Tested.**
- After this edit, the description names exactly the suppliers of README lines 137–268 and 1104–1114.
- Each of them resolves on main at 373d88d:
  - `Completed/LocalFieldsRamification` and `Completed/ProfiniteProPGroups`;
  - ReductiveGroups `### Layer 3: subgroups, quotients, components` (line 234);
  - SchemeAndStackFoundations `### 0.24 Perfect schemes and perfection` (line 1565);
  - AdicSpacesPartII R0.19.9 (line 292);
  - ReductiveGroupsPartII `### RG2.0.4 the completed maximal unramified extension` (line 852).

## Previous findings

- R01 — not repaired: the description's *Dependencies* still reads "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)". It is written again as R01 above.
- R02 — repaired: the third bullet now reads "`G_K^(u+) ⊆ G_K^u` for every `u`, in particular `G_K^(0+) ⊆ G_K^0`" (line 751). The proof derives it from closedness and antitonicity (lines 786–787), so the fourth bullet's attribution (lines 761–765) is now accurate.

## Verified sound

### The changed passages

- **Third bullet, line 751.** `G_K^(u+)` is defined at line 734 as the Krull closure of `⋃_(w > u) G_K^w`. The bullet already states that each `G_K^u` is closed and that the family is antitone, so the inclusion follows in one step. On images in a finite `Gal(M/K)`, `G_K^(u+)` maps to `⋃_(w > u) Gal(M/K)^w`: the image of a closure under a continuous map from a compact group to a finite discrete group is the image of the set, and by the finite projections the image of `G_K^w` is `Gal(M/K)^w`. At `ℚ_2(ζ_8)` and `ℚ_3(ζ_9)` the inclusion is strict exactly at the upper jumps (row 76).
- **Fourth bullet, lines 756–766.** Unchanged text, now accurate: all four recovered statements are stated in the third bullet:
  - `G_K^0` closed and normal (the `u = 0` case of "each `G_K^u` is a closed normal subgroup");
  - `G_K^(0+) ⊆ G_K^0` (line 751);
  - `P_K` pro-`p` (lines 753–754).

  `grep -n '⊆ G_K^0' README.md` hits lines 751, 764 and 882.
- **Proof, lines 786–787.** "For `w > u` the subgroup `G_K^u` contains `G_K^w`, and it is closed, so it contains the closure `G_K^(u+)` of their union." The probe below checks this step in Lean (row 78).
- **Check, lines 881–883.** The reworded Check says the same as before (`≠` became "the inclusion … can be strict"), and the inclusion it qualifies is now stated. At `p = 3` and `p = 5` the values are computed in row 79. "Odd `p`" is needed, because at `p = 2` the extension `K(ζ_2) = K` is trivial.
- **Who cites the changed text.** `roadmaps grep` finds §4a.1 cited by:
  - ArithmeticGaloisRepresentations, README lines 292, 519 and 2719, and `Suggested.lean` line 38;
  - PadicPeriodRings, README line 137;
  - ClassFieldTheory, `Suggested.lean` line 102.

  Each cites the section as a whole. None quotes the third bullet or the reworded Check, and the old wording `G_K^(0+) ≠ G_K^0` occurs only in this roadmap at its previous head in the index. `roadmaps overlaps` lists no other pull request that changes this roadmap and no dropped id.
- **Main moved since the overlap index**, from 172efce to 373d88d. `git diff --stat` over the six supplier folders is empty: `Completed/LocalFieldsRamification`, `Completed/ProfiniteProPGroups`, ReductiveGroups, SchemeAndStackFoundations, AdicSpacesPartII and ReductiveGroupsPartII.
- **House style.** The added lines contain no LaTeX, process words, pull-request numbers, new backticked names or new locators, and the gate's `statement-hygiene=0` and `readme-ids-missing=0` agree. The change adds no object, so ownership against the open pull requests is unchanged from the previous review.
- **Generality of the new inclusion.** The probe proves `G_K^u` closed for every valuation subring `O`, and finite-level antitonicity holds for any finite group acting on a local ring. So the inclusion holds for every `O`. The bullet states it in the layer setting, together with the closedness and antitonicity it rests on. No consumer needs the general form, and this is not a change request.
- **Seeded sample.** None of the five targets falls in the changed passages:
  - "The perfect-residue Herbrand package" and "Residue enlargement and preservation of ramification" (§§3a.2–3a.3);
  - "Proalgebraic units and norm-kernel components" and "Graded norms and filtered norm-kernel components" (§3a.3);
  - "Agreement with `Breve E` on a local field" (§4a.3).

  Their locator verification is carried from r12 and r13 (rows 39–43): serre1961 lines 860–950 and 1092–1232; ega3 lines 637–639 and 733–737; serre1960 lines 162–1261; brinon-conrad lines 259 and 378–386.

### Probe (scratch copy of `Suggested.lean` with two added theorems; `lake env lean` exits 0, with only the file's nine `sorry` warnings)

- `probe_isClosed` proves, for every field `K`, every `O` and every real `u`, that `absoluteUpperRamificationGroup K O u` is closed in `Field.absoluteGaloisGroup K`. The proof uses `Subgroup.coe_iInf`, `isClosed_iInter`, `InfiniteGalois.restrictNormalHom_continuous` (`Mathlib/FieldTheory/Galois/Profinite.lean`, line 148) and `isClosed_discrete` on the finite `Gal(M/K)`.
- `probe_closure_le` proves `(⨆ w : Set.Ioi u, absoluteUpperRamificationGroup K O w).topologicalClosure ≤ absoluteUpperRamificationGroup K O u` from `Antitone (absoluteUpperRamificationGroup K O)`. The proof uses `Subgroup.topologicalClosure_minimal` (`Mathlib/Topology/Algebra/Group/Subgroup.lean`, line 59) and `iSup_le`.
- This is the Lean form of `G_K^(u+)` used by `topologicalClosure_iSup_absoluteUpperRamificationGroup` (line 239).

### Signatures, padding and headlines

`Suggested.lean` has not changed since c89caf8, so the r12 results stand:
- `signatures.md` lists 13 declarations (4 definitions and 9 theorems), none with a dropped binder, and each agrees with its README statement.
- The one-tactic probe left all nine theorems open.
- The headline list is unchanged, with §4a.3 named in the docstring as not statable.
- The new inclusion is a one-step consequence of stated API, not a headline, so its absence from `Suggested.lean` is correct.

### Adversarial pass

Rows 1–75 cover statements this diff leaves untouched and are carried from r15 at 0572f17. Row 70 (the misattributed inclusion) is replaced by rows 76–77. The carried rows' README line numbers are those of 0572f17; at this head the text after old line 754 is one line lower, after old line 789 two lines lower, and after old line 879 three lines lower. Rows 76–80 are new.

Notation:
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1` and upper jumps `1, 2`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1` and upper jumps `0, 1`.
- `S3` is `ℚ_3(ζ_3, ∛3)/ℚ_3`.
- `T6` is `ℚ_2(∛2, ζ_3)/ℚ_2`, with `Gal = S_3`, `e = 3`, `f = 2`, `G_0 = A_3` and `G_1 = 1`.
- `AS` is `y^p − y = t⁻¹` over `k((t))`.
- `I2` is the `F_2(s)((t))` example of §3a.2.
- `CpCp` is the §3a.1 monogenicity example.
- `W` is `Frac W(F̄_p)`.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `5 + 2 + 2 = 9`; `disc ℚ(ζ_9) = 3^9`, `f = 1` | agrees | none (carried: r15 row 1) |
| 2 | same | `Z8` | `3 + 3 + 1 + 1 = 8`; `disc ℚ(ζ_8) = 2^8` | agrees | none (carried: r15 row 2) |
| 3 | same | `G = 1` | `differentIdeal = ⊤ = 𝔪^0`; sum `0` | agrees | none (carried: r15 row 3) |
| 4 | same, separability dropped | `CpCp`, `p = 2` | `d = 2`; `Σ = 3` | hypothesis needed | none (carried: r15 row 4) |
| 5 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees | none (carried: r15 row 5) |
| 6 | same, below `−1` | unramified quadratic | `φ(−2) = −3`, `ψ(−2) = −3/2` | stated on `[−1, ∞)` | none (carried: r15 row 6) |
| 7 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees | none (carried: r15 row 7) |
| 8 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs `G_3 = {1, 5}` | wrong model excluded | none (carried: r15 row 8) |
| 9 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `ψ_G(1/2) = 1`; `(G/H)_1 = 1` | agrees | none (carried: r15 row 9) |
| 10 | same | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ (G/H)^2` | agrees | none (carried: r15 row 10) |
| 11 | same, separability dropped | `I2`, `v = 1/2` | `G/H` vs `1` | hypothesis needed | none (carried: r15 row 11) |
| 12 | tower (Lean 130) | `Z9`, `u = 5` | `φ_G(5) = 3/2 = φ_(G/H)(3)` | agrees | none (carried: r15 row 12) |
| 13 | same | `S3`, `u = 5` | `11/6 = φ_(G/H)(11/3)` | agrees | none (carried: r15 row 13) |
| 14 | same, separability dropped | `I2`, `u = 1` | `1` vs `1/2` | hypothesis needed | none (carried: r15 row 14) |
| 15 | Hasse–Arf (Lean 151) | `Z9` | `6 ∣ 0`, `6 ∣ 6`; non-jump `6 ∤ 3` | agrees | none (carried: r15 row 15) |
| 16 | same | `Z8` | `4 ∣ 4`, `4 ∣ 8`; non-jump `4 ∤ 6` | agrees | none (carried: r15 row 16) |
| 17 | same, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed | none (carried: r15 row 17) |
| 18 | same, infinite residue field | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | none (carried: r15 row 18) |
| 19 | same, negative control | abstract `C_9` filtration | `9 ∤ 21` | Check consistent | none (carried: r15 row 19) |
| 20 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees | none (carried: r15 row 20) |
| 21 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | both sides `1` | agrees | none (carried: r15 row 21) |
| 22 | same | `W` | inertia `= G_K` | agrees | none (carried: r15 row 22) |
| 23 | same | `ℚ_p`, Frobenius lift | outside both sides | agrees | none (carried: r15 row 23) |
| 24 | same, `q`-power step | `F_p((t))`, `t^(1/p)` | `(σx − x)^p = 0` | step sound | none (carried: r15 row 24) |
| 25 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G`; `G_2 = {1, 5}` | agrees | none (carried: r15 row 25) |
| 26 | same, perfectness dropped | `I2`, `u = 1/2` | image order `≤ 2` vs `4` | hypothesis needed | none (carried: r15 row 26) |
| 27 | `0+` (Lean 239) | `W`, `K(ζ_p)` | `P_K ↦ 1`, `I_K ↠ C_(p−1)` | `G^(0+) ≠ G^0` | none (carried: r15 row 27) |
| 28 | same | `ℂ((t))` | both sides `⊥` | agrees | none (carried: r15 row 28) |
| 29 | same | `AS` over `F̄_p((t))` | both sides onto `C_p` | agrees | none (carried: r15 row 29) |
| 30 | subgroup identity (Lean 263) | `S3`, `u = 1, 2` | `H^1 = 1`, `H^3 = 1` | agrees | none (carried: r15 row 30) |
| 31 | same | `H = G`, `H = ⊥` | `G^u`; `⊤ = ⊤` | agrees | none (carried: r15 row 31) |
| 32 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `H^2 = H`, `H^3 = 1` | agrees | none (carried: r15 row 32) |
| 33 | same, `L` not Galois | `S3`, `L = ℚ_3(∛3)` | `ψ(1) = 1`, `ψ(2) = 3` | agrees | none (carried: r15 row 33) |
| 34 | same | `u = −1` | both `⊤` | agrees | none (carried: r15 row 34) |
| 35 | same | `L = M` | `ψ_(L/K) = ψ_(M/K)` | agrees | none (carried: r15 row 35) |
| 36 | same, `hO'` dropped | `W`, trivial `O′` | `G_L` vs `⊥` | hypothesis needed | none (carried: r15 row 36) |
| 37 | integral formula | `S3`, `L = ℚ_3(∛3)` | `3u − 3` at `u = 2` is `3` | agrees | none (carried: r15 row 37) |
| 38 | §4a.3 base change | `Z9` | `d/e = 3/2`; upper jumps `0, 1` | agrees | none (carried: r15 row 38) |
| 39 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; upper `1, 2` | agrees | none (carried: r15 row 39) |
| 40 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)`; `X^e − t` | uniformizer kept; `F̄_p × F̄_p`; `#G_0 = e` | agrees | none (carried: r15 row 40) |
| 41 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p` | agrees | none (carried: r15 row 41) |
| 42 | sampled: graded norms | `AS`; tame `C_e`; `F_3` | `t⁻¹ + λ^p − λ`; `μ_e`; `−λ` | agrees | none (carried: r15 row 42) |
| 43 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; unbounded series; `1/2 ∉ ℤ` | agrees | none (carried: r15 row 43) |
| 44–50 | Downstream consumers paragraph | seven consumers | section unions as recorded in r13 | agrees | none (carried: r15 row 44–50) |
| 51 | consumer completeness | grep over main and open heads | 6 consumers, 6 named | agrees | none (carried: r15 row 51) |
| 52 | `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` | `ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `H^2 = H`, `H^3 = 1` | agrees | none (carried: r15 row 52) |
| 53 | Summary bases | ArithmeticGaloisRepresentations contract | perfect residue field `F̄_p` | agrees | none (carried: r15 row 53) |
| 54 | `TauCeti.IsProP` contract | `ProP/Basic.lean` line 68 | `∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U)` | agrees | none (carried: r15 row 54) |
| 55 | `p = 0` vacuity | any `G` | `g ^ 0 ^ 1 = 1` | agrees | none (carried: r15 row 55) |
| 56 | no compactness in `IsProP` | binders | `[Group G] [TopologicalSpace G]` only | agrees | none (carried: r15 row 56) |
| 57 | `IsProP p P_K`; Check separating `P_K` from `I_K` | `Z9` | `#P_K/N = 3`, `#I_K/(I_K ∩ G_M) = 6` | agrees | none (carried: r15 row 57) |
| 58 | same, `p = 2` | `Z8` | `G_1` of order `4` | agrees | none (carried: r15 row 58) |
| 59 | same, tame level | `W`, `K(ζ_3)` | `P_K ↦ 1`, `I_K ↦` order `2` | agrees | none (carried: r15 row 59) |
| 60 | `p = 0` gives `P_K = 1` | `ℂ((t))` | `G_1 = 1` at every level; `I_K ≅ Ẑ` | agrees | none (carried: r15 row 60) |
| 61 | same bullet, infinite residue field | `AS` over `F̄_p((t))` | image `C_p` | agrees | none (carried: r15 row 61) |
| 62 | pro-`p` proof step | `Z9` | `P_K/(P_K ∩ G_M) ≅ G_1`, order `3` | step sound | none (carried: r15 row 62) |
| 63 | image of `P_K` is `G_1` | `Z9`, `w ∈ (0, 1]` | `ψ(w) = 2w`, `Gal^w = G_1` | agrees | none (carried: r15 row 63) |
| 64 | ProfiniteProPGroups in the order | main, depcheck | `0 problem(s)` | not upward | none (carried: r15 row 64) |
| 66 | Contract: five newly cited declarations, their files and hypotheses (README 225–230) | pinned Tau Ceti; `#check @` probe | Inertia/Basic.lean 159, 164; WildInertia.lean 285, 294, 520; binders `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`, plus `(p : ℕ) [CharP 𝓀[K] p]` for the last | agrees | none (carried: r15 row 66) |
| 67 | "the normality instance `TauCeti.inertiaSubgroup_normal`" (README 226–227) | `ℚ_[3]` | declared `instance` (line 164); `(inertiaSubgroup ℚ_[3]).Normal := inferInstance` elaborates | agrees | none (carried: r15 row 67) |
| 68 | Fourth bullet, pro-`p` on a local field: `isProP_wildInertiaSubgroup` under `CharP 𝓀[K] p` (README 228–230, 764–765) | `ℚ_3`, `p = 3`; `p = 0` | probe gives `IsProP 3 (wildInertiaSubgroup ℚ_[3])`; `CharP 𝔽_3 0` is false since `(3 : 𝔽_3) = 0`, so `p > 0` is forced; `Z9` image of `P_K` is `{1, 4, 7}`, order `3^1` | agrees; replaces r14 row 65 (R02 repaired) | none (carried: r15 row 68) |
| 69 | Fourth bullet: `G_K^0` closed and normal (README 762–763) | `T6` (non-abelian level); `Z9` | `T6`: image of `I_K` is `G_0 = A_3`, index `2` in `S_3`, normal, with fixed field `ℚ_2(ζ_3)` unramified; wrong model `⟨(12)⟩ = Gal(M/ℚ_2(∛2))` is not normal and has ramified fixed field (`e = 3`); `Z9`: `G_0 = (ℤ/9)ˣ` | agrees; wrong model excluded | none (carried: r15 row 69) |
| 71 | Fourth bullet: residue field finite of characteristic `p > 0` gives `P_K` pro-`p`, at `p = 2` | `Z8`; `T6` | image of `P_K`: `(ℤ/8)ˣ`, order `2^2`; `1`, order `2^0` | agrees | none (carried: r15 row 71) |
| 72 | Proof: "fixing subgroups, hence closed" (README 824–825) | pinned proofs | both proved by `fixingSubgroup_isClosed_of_isAlgebraic` (Inertia/Basic.lean 161, WildInertia.lean 287) | agrees | none (carried: r15 row 72) |
| 73 | Recovery is not circular (README 760–762, 824–828) | the proof's `G_K^0 = I_K` paragraph | `G_K^0 = I_K` is proved through unramified subextensions without closedness; the Tau Ceti theorems are already proved | sound | none (carried: r15 row 73) |
| 74 | *Needs* (README 844–848) and Layer 4a *Dependencies* (README 1091–1093) | contract lines 225–229 | the same five names; "closedness, normality, inclusion and pro-`p` theorems" maps to 2 + 1 + 1 + 1 declarations | agrees | none (carried: r15 row 74) |
| 75 | Owner of the recovered statements | `Completed/LocalFieldsRamification/README.md` on main | line 1224 (`isClosed_inertiaSubgroup`, `inertiaSubgroup_normal`); line 1264 (`P_K ≤ I_K`, pro-`p`) | owned by the completed supplier | none (carried: r15 row 75) |
| 76 | Third bullet: `G_K^(u+) ⊆ G_K^u` for every real `u` (README 751) | `Z8` at `u = −1, 1, 3/2, 2`; `Z9` at `u = 0, 1/2, 1` | image of `G_K^(u+)` is `⋃_(w>u) Gal^w`. `Z8`: `G ⊆ G`; `{1, 5} ⊊ (ℤ/8)ˣ`; `{1, 5} = {1, 5}`; `1 ⊊ {1, 5}`. `Z9`: `{1, 4, 7} ⊊ (ℤ/9)ˣ`; `{1, 4, 7} = {1, 4, 7}`; `1 ⊊ {1, 4, 7}` | holds; strict exactly at the upper jumps | none |
| 77 | Third bullet's `G_K^(0+) ⊆ G_K^0`, recovered in the fourth bullet (README 751, 761–765) | `Z9`; `T6`; `Z8` | `{1, 4, 7} ⊆ (ℤ/9)ˣ`; `ψ(w) > 0` gives `G_1 = 1 ⊆ A_3`; `G_1 = G_0 = (ℤ/8)ˣ`, equality; now stated at line 751, so the attribution holds | agrees; replaces r15 row 70 (R02 repaired) | none |
| 78 | Proof: `G_K^u` is closed and contains `G_K^w` for `w > u`, so it contains `G_K^(u+)` (README 786–787) | Lean probe, every `K`, `O`, `u` | `probe_isClosed` proves closedness with no hypothesis; `probe_closure_le` proves the `topologicalClosure ≤` form from `Antitone`; exit 0 | step sound | none |
| 79 | Check: for odd `p`, `G_K^(0+) ⊆ G_K^0` can be strict at `W(ζ_p)` (README 881–883) | `p = 3`; `p = 5`; `p = 2` | tame, totally ramified: `G_0 = Gal` of order `p − 1 = 2`, `4`, `G_1 = 1`; `ψ(w) = (p − 1)w > 0` for `w > 0`, so the image of `P_K` is `1`, against `I_K ↠ C_2`, `C_4`; at `p = 2`, `K(ζ_2) = K`, order `1`, so "odd" is needed | agrees | none |
| 80 | Wrong model: `G_K^(u+)` as the closure of `⋃_(w ≥ u)` | `W`, `K(ζ_3)` | the wrong model gives `G_K^(0+) = G_K^0`, image `C_2`; the Check computes the image of `P_K` as `1`, which excludes it; at `Z9` the wrong model gives `(ℤ/9)ˣ`, the definition gives `{1, 4, 7}` | wrong model excluded | none |

### Remarks on untouched text (no change requested)

- The description's *Why* and *Merge order* paragraphs still say that FiniteFlatGroupsAndIntegralPadicHodgeTheory cites §§3a.1–3a.3 and §§4a.1–4a.3. The README's last downstream sentence (lines 1138–1139) states the actual route, through PadicPeriodRings.
- The README does not mention Tau Ceti's `TauCeti.wildInertiaSubgroup_normal` (WildInertia.lean, line 290), and it states no normality of `G_K^(0+)`. Neither is needed by any target here.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is settled in the manifest as uncertified. Its locators are cited without the text.
- The changed passages carry no new source locator.

## Source issues

- none
