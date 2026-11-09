# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 0572f17)

**Verdict:** needs changes

This is an incremental re-review of the 25 lines that changed since 34fcfb5. All of them are in `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`. They cite the local-field inertia theorems that §4a.1 recovers from the pinned Tau Ceti:
- the absolute-Galois-group bullet of the LocalFieldsRamification contract (lines 221–230);
- the fourth §4a.1 API bullet (lines 755–765);
- the local-field paragraph of §4a.1's proof (lines 824–825);
- §4a.1's *Needs* (lines 844–848);
- Layer 4a *Dependencies* (lines 1091–1093).

`Suggested.lean` and every file outside the folder are unchanged (`git diff 34fcfb5 HEAD --stat` lists only the README).

- **Gate.** I reran it at this head and every check passed (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). The worker's run also reports `build=0`.
- **Dependency check.** `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. Its only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Gaps.** The package has no `design/plan.json`, so no gaps are declared.

Every newly cited declaration exists at the pin with the hypotheses the README states, and each elaborates at `ℚ_3` (rows 66–75). One finding is new: the repair attributes to the third §4a.1 bullet an inclusion that the bullet does not state. The finding about the description is carried over.

## R01 (P3) — The description still names two suppliers the README does not consume

**Location.** The pull-request description, *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia) and ReductiveGroupsPartII §RG2.0.4 (§4a.3)".

**Claim.**
- The description is unchanged since the previous review.
- It still lists ProfiniteCohomology and EtaleCohomologyFoundations §F.3a as suppliers. The README consumes neither: §4a.1 states no tame-inertia target, and its inertia comes from Mathlib's `ValuationSubring.inertiaSubgroup` and Tau Ceti's `TauCeti.inertiaSubgroup`.
- ProfiniteCohomology is also not a completed roadmap: on main it sits at `TauCetiRoadmap/ProfiniteCohomology`, not under `Completed/`.
- This repeats R01 of the previous review. No repair report marks it as not actionable.

**Witness.** At this head, `grep -c -i 'ProfiniteCohomology\|EtaleCohomology\|F\.3a' README.md` returns `0`. The README's suppliers are the contract headings at lines 135–269 and the dependency order at lines 1101–1111.

**Repair.** Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. No open pull request is a supplier."

**Tested.** After this edit, the description names exactly the seven suppliers of README lines 135–269 and 1101–1111.

## R02 (P3) — The inclusion `G_K^(0+) ⊆ G_K^0` is credited to the third bullet, which does not state it

**Location.** README lines 760–764: "so that there the following statements of the third bullet are the completed roadmap's theorems, which the general statements recover: … `G_K^(0+) ⊆ G_K^0` (`TauCeti.wildInertiaSubgroup_le_inertiaSubgroup`)".

**Claim.**
- The third bullet (lines 750–754) states the following:
  - each `G_K^u` is closed and normal;
  - antitonicity;
  - `G_K^(−1) = G_K`;
  - a trivial intersection;
  - the decomposition group;
  - `G_K^0 = I_K`;
  - the pro-`p` and `p = 0` statements for `P_K`.
- It states no inclusion of `G_K^(0+)` in `G_K^0`, and the README states that inclusion nowhere else.
- So one of the four statements that the new sentence calls statements of the third bullet does not appear there. A reader looking for the general statement that `TauCeti.wildInertiaSubgroup_le_inertiaSubgroup` instantiates will not find it.
- The inclusion is true. Antitonicity gives `G_K^w ⊆ G_K^0` for every `w > 0`, and since `G_K^0` is closed, the closure `G_K^(0+)` of their union also lies in `G_K^0`.

**Witness.**
- `grep -n '⊆ G_K^0' README.md` returns only line 763, the new sentence.
- Lines 750–754 contain no `0+`.
- At `ℚ_3(ζ_9)/ℚ_3` the inclusion holds on images: `G_1 = {1, 4, 7} ⊆ G_0 = (ℤ/9)ˣ` (row 70).

**Repair.** At line 763, replace "`G_K^(0+) ⊆ G_K^0`" with "`G_K^(0+) ⊆ G_K^0`, which follows from the antitonicity and the closedness of `G_K^0` there,".

**Tested.**
- After the edit, each of the four recovered statements is either stated in lines 750–754 (closedness, normality, pro-`p`) or derived there in one step (the inclusion).
- The derivation gives `{1, 4, 7} ⊆ (ℤ/9)ˣ` at `ℚ_3(ζ_9)`.
- It gives `1 ⊆ A_3` at `ℚ_2(∛2, ζ_3)` (row 70).

## Previous findings

- R01 — not repaired: the description's *Dependencies* still reads "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)". It is written again as R01 above.
- R02 — repaired: line 229 lists "`TauCeti.isProP_wildInertiaSubgroup`, under `CharP 𝓀[K] p`". Lines 764–765 end the fourth bullet with it, and line 848 adds it to *Needs*. The repair's added inclusion clause raises the new R02.

## Verified sound

### The changed passages

- **Contract, lines 221–230.** I opened each declaration at the pinned Tau Ceti:
  - `TauCeti.isClosed_inertiaSubgroup`: `Unramified/Inertia/Basic.lean`, line 159;
  - `TauCeti.inertiaSubgroup_normal`: line 164 of the same file, declared as an `instance`, as the README says;
  - `TauCeti.isClosed_wildInertiaSubgroup`: `WildInertia.lean`, line 285;
  - `TauCeti.wildInertiaSubgroup_le_inertiaSubgroup`: `WildInertia.lean`, line 294;
  - `TauCeti.isProP_wildInertiaSubgroup`: `WildInertia.lean`, line 520.

  All five take `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` with `K` explicit. The last one adds `(p : ℕ) [CharP 𝓀[K] p]`, matching "under `CharP 𝓀[K] p`". `𝓀[K]` is Mathlib's scoped notation for `IsLocalRing.ResidueField ↥𝒪[K]` (`Mathlib/Topology/Algebra/Valued/ValuativeRel.lean`, line 94), and the README introduces it in place. The file list in the bullet ("`Unramified/Inertia/`, `WildInertia.lean`") contains all five.
- **Fourth §4a.1 bullet, lines 755–765.**
  - "`G_K^0` is closed and normal" is the third bullet's "each `G_K^u` is a closed normal subgroup" at `u = 0`.
  - "`P_K` is pro-`p`" is the third bullet's `p > 0` clause.
  - On a local field the residue field is finite, so `p > 0` is the only case: `CharP 𝔽_3 0` fails because `(3 : 𝔽_3) = 0`.
- **Proof, lines 824–825.** Both closedness theorems are proved at the pin by `fixingSubgroup_isClosed_of_isAlgebraic` (Inertia/Basic.lean line 161, WildInertia.lean line 287). So "fixing subgroups, hence closed" is exactly their proof.
  - Citing closedness in the identification step creates no circularity: the proof's earlier paragraph proves `G_K^0 = I_K` through unramified subextensions, and the Tau Ceti theorems are already proved.
- **Needs and Dependencies, lines 844–848 and 1091–1093.** The five names match the contract one for one. "The closedness, normality, inclusion and pro-`p` theorems listed in the supplier contract" names exactly lines 225–229.
- **Ownership.** The completed roadmap LocalFieldsRamification on main (172efce) owns these statements:
  - `Completed/LocalFieldsRamification/README.md` line 1224 cites `TauCeti.isClosed_inertiaSubgroup` and `TauCeti.inertiaSubgroup_normal`;
  - line 1264 states `P_K ≤ I_K` and that `P_K` is pro-`p`.

  This roadmap cites the pinned declaration names, not that roadmap's catalogue name `wildInertia_le_inertia`. The change adds no ownership claim.
- **House style.** The added lines contain no LaTeX, process words, pull-request numbers or new source locators. `roadmaps resolve` and `roadmaps overlaps` report nothing for this roadmap, so no open pull request changes it or drops an id it cites. Ownership against the open roadmap pull requests listed in the brief is unchanged by this diff, which only cites a completed roadmap's Tau Ceti declarations.
- **Seeded sample.** None of the five targets falls in the changed passages:
  - "The perfect-residue Herbrand package" and "Residue enlargement and preservation of ramification" (§§3a.2–3a.3);
  - "Proalgebraic units and norm-kernel components" and "Graded norms and filtered norm-kernel components" (§3a.3);
  - "Agreement with `Breve E` on a local field" (§4a.3).

  Their locator verification is carried from r12 and r13 (rows 39–43): serre1961 lines 860–950 and 1092–1232; ega3 lines 637–639 and 733–737; serre1960 lines 162–1261; brinon-conrad lines 259 and 378–386.

### Probe (scratch file, elaborated with `lake env lean`, exit 0, no output besides the `#check` lines)

The probe states `#check @` for the five declarations above, `TauCeti.wildInertiaSubgroup_normal` and `TauCeti.inertiaSubgroup`. `TauCeti.inertiaSubgroup` has type `Subgroup (Field.absoluteGaloisGroup K)`. It also checks four instances at `ℚ_[3]`, using Mathlib's instance `IsNonarchimedeanLocalField ℚ_[p]` from `Mathlib/NumberTheory/Padics/LocalField.lean`, line 28:
- `TauCeti.isProP_wildInertiaSubgroup ℚ_[3] 3 : TauCeti.IsProP 3 (TauCeti.wildInertiaSubgroup ℚ_[3])`, under `[CharP 𝓀[ℚ_[3]] 3]`;
- `(TauCeti.inertiaSubgroup ℚ_[3]).Normal`, by `inferInstance`;
- `IsClosed` of `TauCeti.inertiaSubgroup ℚ_[3]`;
- `TauCeti.wildInertiaSubgroup ℚ_[3] ≤ TauCeti.inertiaSubgroup ℚ_[3]`.

### Signatures, padding and headlines

`Suggested.lean` has not changed since c89caf8, so the r12 results stand:
- `signatures.md` lists 13 declarations (4 definitions and 9 theorems), none with a dropped binder, and each agrees with its README statement.
- The one-tactic probe left all nine theorems open.
- The headline list is unchanged, with §4a.3 named in the docstring as not statable.
- The recovered local-field statements are Tau Ceti theorems cited in the README, not headlines, so their absence from `Suggested.lean` is correct.

### Adversarial pass

Rows 1–64 cover statements this diff leaves untouched and are carried from r14 at 34fcfb5. That report computed rows 54–64 itself and carried rows 1–53 from r13, which carried rows 1–43 from r12. Rows 66–75 are new; row 65 is replaced by row 68.

Notation:
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`.
- `S3` is `ℚ_3(ζ_3, ∛3)/ℚ_3`.
- `T6` is `ℚ_2(∛2, ζ_3)/ℚ_2`, with `Gal = S_3`, `e = 3`, `f = 2`, `G_0 = A_3` and `G_1 = 1`.
- `AS` is `y^p − y = t⁻¹` over `k((t))`.
- `I2` is the `F_2(s)((t))` example of §3a.2.
- `CpCp` is the §3a.1 monogenicity example.
- `W` is `Frac W(F̄_p)`.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `5 + 2 + 2 = 9`; `disc ℚ(ζ_9) = 3^9`, `f = 1` | agrees | none (carried: r14 row 1) |
| 2 | same | `Z8` | `3 + 3 + 1 + 1 = 8`; `disc ℚ(ζ_8) = 2^8` | agrees | none (carried: r14 row 2) |
| 3 | same | `G = 1` | `differentIdeal = ⊤ = 𝔪^0`; sum `0` | agrees | none (carried: r14 row 3) |
| 4 | same, separability dropped | `CpCp`, `p = 2` | `d = 2`; `Σ = 3` | hypothesis needed | none (carried: r14 row 4) |
| 5 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees | none (carried: r14 row 5) |
| 6 | same, below `−1` | unramified quadratic | `φ(−2) = −3`, `ψ(−2) = −3/2` | stated on `[−1, ∞)` | none (carried: r14 row 6) |
| 7 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees | none (carried: r14 row 7) |
| 8 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs `G_3 = {1, 5}` | wrong model excluded | none (carried: r14 row 8) |
| 9 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `ψ_G(1/2) = 1`; `(G/H)_1 = 1` | agrees | none (carried: r14 row 9) |
| 10 | same | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ (G/H)^2` | agrees | none (carried: r14 row 10) |
| 11 | same, separability dropped | `I2`, `v = 1/2` | `G/H` vs `1` | hypothesis needed | none (carried: r14 row 11) |
| 12 | tower (Lean 130) | `Z9`, `u = 5` | `φ_G(5) = 3/2 = φ_(G/H)(3)` | agrees | none (carried: r14 row 12) |
| 13 | same | `S3`, `u = 5` | `11/6 = φ_(G/H)(11/3)` | agrees | none (carried: r14 row 13) |
| 14 | same, separability dropped | `I2`, `u = 1` | `1` vs `1/2` | hypothesis needed | none (carried: r14 row 14) |
| 15 | Hasse–Arf (Lean 151) | `Z9` | `6 ∣ 0`, `6 ∣ 6`; non-jump `6 ∤ 3` | agrees | none (carried: r14 row 15) |
| 16 | same | `Z8` | `4 ∣ 4`, `4 ∣ 8`; non-jump `4 ∤ 6` | agrees | none (carried: r14 row 16) |
| 17 | same, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed | none (carried: r14 row 17) |
| 18 | same, infinite residue field | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | none (carried: r14 row 18) |
| 19 | same, negative control | abstract `C_9` filtration | `9 ∤ 21` | Check consistent | none (carried: r14 row 19) |
| 20 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees | none (carried: r14 row 20) |
| 21 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | both sides `1` | agrees | none (carried: r14 row 21) |
| 22 | same | `W` | inertia `= G_K` | agrees | none (carried: r14 row 22) |
| 23 | same | `ℚ_p`, Frobenius lift | outside both sides | agrees | none (carried: r14 row 23) |
| 24 | same, `q`-power step | `F_p((t))`, `t^(1/p)` | `(σx − x)^p = 0` | step sound | none (carried: r14 row 24) |
| 25 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G`; `G_2 = {1, 5}` | agrees | none (carried: r14 row 25) |
| 26 | same, perfectness dropped | `I2`, `u = 1/2` | image order `≤ 2` vs `4` | hypothesis needed | none (carried: r14 row 26) |
| 27 | `0+` (Lean 239) | `W`, `K(ζ_p)` | `P_K ↦ 1`, `I_K ↠ C_(p−1)` | `G^(0+) ≠ G^0` | none (carried: r14 row 27) |
| 28 | same | `ℂ((t))` | both sides `⊥` | agrees | none (carried: r14 row 28) |
| 29 | same | `AS` over `F̄_p((t))` | both sides onto `C_p` | agrees | none (carried: r14 row 29) |
| 30 | subgroup identity (Lean 263) | `S3`, `u = 1, 2` | `H^1 = 1`, `H^3 = 1` | agrees | none (carried: r14 row 30) |
| 31 | same | `H = G`, `H = ⊥` | `G^u`; `⊤ = ⊤` | agrees | none (carried: r14 row 31) |
| 32 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `H^2 = H`, `H^3 = 1` | agrees | none (carried: r14 row 32) |
| 33 | same, `L` not Galois | `S3`, `L = ℚ_3(∛3)` | `ψ(1) = 1`, `ψ(2) = 3` | agrees | none (carried: r14 row 33) |
| 34 | same | `u = −1` | both `⊤` | agrees | none (carried: r14 row 34) |
| 35 | same | `L = M` | `ψ_(L/K) = ψ_(M/K)` | agrees | none (carried: r14 row 35) |
| 36 | same, `hO'` dropped | `W`, trivial `O′` | `G_L` vs `⊥` | hypothesis needed | none (carried: r14 row 36) |
| 37 | integral formula | `S3`, `L = ℚ_3(∛3)` | `3u − 3` at `u = 2` is `3` | agrees | none (carried: r14 row 37) |
| 38 | §4a.3 base change | `Z9` | `d/e = 3/2`; upper jumps `0, 1` | agrees | none (carried: r14 row 38) |
| 39 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; upper `1, 2` | agrees | none (carried: r14 row 39) |
| 40 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)`; `X^e − t` | uniformizer kept; `F̄_p × F̄_p`; `#G_0 = e` | agrees | none (carried: r14 row 40) |
| 41 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p` | agrees | none (carried: r14 row 41) |
| 42 | sampled: graded norms | `AS`; tame `C_e`; `F_3` | `t⁻¹ + λ^p − λ`; `μ_e`; `−λ` | agrees | none (carried: r14 row 42) |
| 43 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; unbounded series; `1/2 ∉ ℤ` | agrees | none (carried: r14 row 43) |
| 44–50 | Downstream consumers paragraph | seven consumers | section unions as recorded in r13 | agrees | none (carried: r14 rows 44–50) |
| 51 | consumer completeness | grep over main and open heads | 6 consumers, 6 named | agrees | none (carried: r14 row 51) |
| 52 | `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` | `ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `H^2 = H`, `H^3 = 1` | agrees | none (carried: r14 row 52) |
| 53 | Summary bases | ArithmeticGaloisRepresentations contract | perfect residue field `F̄_p` | agrees | none (carried: r14 row 53) |
| 54 | `TauCeti.IsProP` contract | `ProP/Basic.lean` line 68 | `∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U)` | agrees | none (carried: r14 row 54) |
| 55 | `p = 0` vacuity | any `G` | `g ^ 0 ^ 1 = 1` | agrees | none (carried: r14 row 55) |
| 56 | no compactness in `IsProP` | binders | `[Group G] [TopologicalSpace G]` only | agrees | none (carried: r14 row 56) |
| 57 | `IsProP p P_K`; Check separating `P_K` from `I_K` | `Z9` | `#P_K/N = 3`, `#I_K/(I_K ∩ G_M) = 6` | agrees | none (carried: r14 row 57) |
| 58 | same, `p = 2` | `Z8` | `G_1` of order `4` | agrees | none (carried: r14 row 58) |
| 59 | same, tame level | `W`, `K(ζ_3)` | `P_K ↦ 1`, `I_K ↦` order `2` | agrees | none (carried: r14 row 59) |
| 60 | `p = 0` gives `P_K = 1` | `ℂ((t))` | `G_1 = 1` at every level; `I_K ≅ Ẑ` | agrees | none (carried: r14 row 60) |
| 61 | same bullet, infinite residue field | `AS` over `F̄_p((t))` | image `C_p` | agrees | none (carried: r14 row 61) |
| 62 | pro-`p` proof step | `Z9` | `P_K/(P_K ∩ G_M) ≅ G_1`, order `3` | step sound | none (carried: r14 row 62) |
| 63 | image of `P_K` is `G_1` | `Z9`, `w ∈ (0, 1]` | `ψ(w) = 2w`, `Gal^w = G_1` | agrees | none (carried: r14 row 63) |
| 64 | ProfiniteProPGroups in the order | main, depcheck | `0 problem(s)` | not upward | none (carried: r14 row 64) |
| 66 | Contract: five newly cited declarations, their files and hypotheses (README 225–230) | pinned Tau Ceti; `#check @` probe | Inertia/Basic.lean 159, 164; WildInertia.lean 285, 294, 520; binders `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`, plus `(p : ℕ) [CharP 𝓀[K] p]` for the last | agrees | none |
| 67 | "the normality instance `TauCeti.inertiaSubgroup_normal`" (README 226–227) | `ℚ_[3]` | declared `instance` (line 164); `(inertiaSubgroup ℚ_[3]).Normal := inferInstance` elaborates | agrees | none |
| 68 | Fourth bullet, pro-`p` on a local field: `isProP_wildInertiaSubgroup` under `CharP 𝓀[K] p` (README 228–230, 764–765) | `ℚ_3`, `p = 3`; `p = 0` | probe gives `IsProP 3 (wildInertiaSubgroup ℚ_[3])`; `CharP 𝔽_3 0` is false since `(3 : 𝔽_3) = 0`, so `p > 0` is forced; `Z9` image of `P_K` is `{1, 4, 7}`, order `3^1` | agrees; replaces r14 row 65 (R02 repaired) | none |
| 69 | Fourth bullet: `G_K^0` closed and normal (README 762–763) | `T6` (non-abelian level); `Z9` | `T6`: image of `I_K` is `G_0 = A_3`, index `2` in `S_3`, normal, with fixed field `ℚ_2(ζ_3)` unramified; wrong model `⟨(12)⟩ = Gal(M/ℚ_2(∛2))` is not normal and has ramified fixed field (`e = 3`); `Z9`: `G_0 = (ℤ/9)ˣ` | agrees; wrong model excluded | none |
| 70 | Fourth bullet: `G_K^(0+) ⊆ G_K^0`, credited to the third bullet (README 760–764) | `Z9`; `T6`; `Z8` | images `{1, 4, 7} ⊆ (ℤ/9)ˣ`; `1 ⊆ A_3`; `G_1 = G_0 = (ℤ/8)ˣ`; derivation from antitonicity and closedness: `G_K^w ⊆ G_K^0` for `w > 0`, closure in the closed `G_K^0`; lines 750–754 state no such inclusion | true, misattributed | R02 |
| 71 | Fourth bullet: residue field finite of characteristic `p > 0` gives `P_K` pro-`p`, at `p = 2` | `Z8`; `T6` | image of `P_K`: `(ℤ/8)ˣ`, order `2^2`; `1`, order `2^0` | agrees | none |
| 72 | Proof: "fixing subgroups, hence closed" (README 824–825) | pinned proofs | both proved by `fixingSubgroup_isClosed_of_isAlgebraic` (Inertia/Basic.lean 161, WildInertia.lean 287) | agrees | none |
| 73 | Recovery is not circular (README 760–762, 824–828) | the proof's `G_K^0 = I_K` paragraph | `G_K^0 = I_K` is proved through unramified subextensions without closedness; the Tau Ceti theorems are already proved | sound | none |
| 74 | *Needs* (README 844–848) and Layer 4a *Dependencies* (README 1091–1093) | contract lines 225–229 | the same five names; "closedness, normality, inclusion and pro-`p` theorems" maps to 2 + 1 + 1 + 1 declarations | agrees | none |
| 75 | Owner of the recovered statements | `Completed/LocalFieldsRamification/README.md` on main | line 1224 (`isClosed_inertiaSubgroup`, `inertiaSubgroup_normal`); line 1264 (`P_K ≤ I_K`, pro-`p`) | owned by the completed supplier | none |

### Remarks on untouched text (no change requested)

- The description's *Why* and *Merge order* paragraphs still say that FiniteFlatGroupsAndIntegralPadicHodgeTheory cites §§3a.1–3a.3 and §§4a.1–4a.3. The README's last downstream sentence states the actual route, through PadicPeriodRings.
- The README does not mention Tau Ceti's `TauCeti.wildInertiaSubgroup_normal` (WildInertia.lean, line 290), and it states no normality of `G_K^(0+)`. Neither is needed by any target here.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is settled in the manifest as uncertified. Its locators are cited without the text.
- The changed passages carry no new source locator.

## Source issues

- none
