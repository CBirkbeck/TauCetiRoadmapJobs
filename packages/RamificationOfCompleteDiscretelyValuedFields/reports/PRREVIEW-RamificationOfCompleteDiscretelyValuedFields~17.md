# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 79f03ba)

**Verdict:** needs changes

This is an incremental re-review of the 12 lines that changed since 9b92470 (10 insertions, 2 deletions). All of them are in `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`, in one hunk of *Scope and ownership* (lines 91–99 at this head). The new sentences:
- name EtaleCohomologyFoundations §F.3a as the owner of trait inertia, wild inertia, the tame character `t_ℓ` and the tame quotient;
- say that this roadmap consumes nothing from that section;
- say what §3a.1 and §4a.1 state instead.

`Suggested.lean` and every file outside the folder are unchanged: `git diff --stat 9b92470 HEAD` lists only the README, and the diff against `origin/main` outside the folder is empty.

- **Gate.** I reran it at this head and every check passed (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). The worker's run also reports `build=0`.
- **Dependency check.** `depcheck: 239 roadmaps, 2354 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. Its only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Gaps.** The package has no `design/plan.json`, so no gaps are declared.

The new paragraph is accurate. Each claim was checked against §F.3a, both on main and at the head of the open EtaleCohomologyFoundations revision (rows 81–88). It introduces no new finding.

It does not repair R01, which is about the pull-request description, not the README. The description is unchanged, and it now contradicts the README directly: it still lists §F.3a as the supplier of "§4a.1's tame inertia", while the README says this roadmap consumes nothing from that section.

## R01 (P3) — The description still names two suppliers the README does not consume

**Location.** The pull-request description, *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia) and ReductiveGroupsPartII §RG2.0.4 (§4a.3)".

**Claim.**
- `gh pr view 1410` at head 79f03ba returns this text unchanged since the previous review.
- It lists EtaleCohomologyFoundations §F.3a as a supplier of §4a.1. README line 95 now says the opposite: "This roadmap consumes nothing from that section and states neither the tame character nor the tame quotient".
- It lists ProfiniteCohomology as a completed supplier. The README never names it, and on main (bbbde05) it is at `TauCetiRoadmap/ProfiniteCohomology`; `Completed/ProfiniteCohomology` does not exist.
- This head's README change is accurate, but it leaves the description untouched, and the description is what the finding is about.
- No repair report marks this finding as not actionable.

**Witness.**
- At this head, `grep -c 'ProfiniteCohomology' README.md` returns `0`.
- `EtaleCohomologyFoundations` occurs only at README line 91, as an owner. It is absent from the contract headings (lines 145, 199, 251, 261), Layer 4a *Dependencies* (lines 1099–1110) and *Dependency order* (lines 1112–1122).

**Repair.** Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. EtaleCohomologyFoundations §F.3a is named in the scope as the owner of trait inertia and the tame character and is not a supplier. No open pull request is a supplier."

**Tested.**
- After this edit, the description names exactly the suppliers of README lines 143–277, 1099–1110 and 1112–1122, and it agrees with README lines 91–95 on §F.3a.
- Each named section resolves on main at bbbde05:
  - `Completed/LocalFieldsRamification` and `Completed/ProfiniteProPGroups`;
  - ReductiveGroups `### Layer 3: subgroups, quotients, components` (line 234);
  - SchemeAndStackFoundations `### 0.24 Perfect schemes and perfection` (line 1565);
  - AdicSpacesPartII R0.19.9 (line 292);
  - ReductiveGroupsPartII `### RG2.0.4 the completed maximal unramified extension` (line 852);
  - EtaleCohomologyFoundations `## F.3a Henselian traits, inertia and the tame character` (line 776).

## Previous findings

- R01 — not repaired: the description's *Dependencies* still reads "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)". README line 95 now says §F.3a is not consumed. It is written again as R01 above.

## Verified sound

### The changed passage (README lines 91–99)

- **What §F.3a owns.** The paragraph attributes to §F.3a: for every henselian discrete valuation ring with residue characteristic `p ≥ 0`, the inertia group `I`, the wild inertia `P` as the inverse limit of the finite wild inertia groups, `t_ℓ : I → ℤ_ℓ(1)` for `ℓ ≠ p`, and `I/P ≅ ∏_(ℓ ≠ p) ℤ_ℓ(1)`. Each of these matches EtaleCohomologyFoundations on main (bbbde05):
  - the trait and `I` as the kernel of `Gal(η̄/η) → Gal(s̄/s)`, at lines 778–786 (the kernel at 783–786);
  - `p ≥ 0`, `P = lim P_L` and `t_ℓ`, at lines 816–821;
  - `tameCharacter_surjective`, with `I/P ≅ ∏_{ℓ' ≠ p} ℤ_{ℓ'}(1)`, at line 825.

  The same text is at the head of the open revision of EtaleCohomologyFoundations (pull request #1891), lines 1141–1197. That revision keeps the label `F.3a`, and `roadmaps overlaps` lists no dropped id.
- **"Consumes nothing from that section".** This is true. The README names `EtaleCohomologyFoundations` only once, at line 91, and no *Needs:* line, contract or dependency paragraph cites it. The merge order lists EtaleCohomologyFoundations at line 42, after this roadmap at line 2. Because it is on main it could be consumed, but the README cites it only as an owner, and the depcheck reports no edge problem.
- **"§3a.1 stays at the finite-level embedding of `G_0/G_1` in the residue units".** README line 355 states this embedding, for separable residue extension. The residue-extension hypothesis stays in §3a.1, and the scope sentence only places the boundary.
- **"Tame character" is used in two senses, without conflict.** In the sentence "states neither the tame character", the antecedent is §F.3a's profinite `t_ℓ`. §3a.1's proof (line 379) uses Tau Ceti's finite-level `TauCeti.tameCharacter`, which I opened at `TauCeti/NumberTheory/LocalField/UnitFiltration/RamificationGroup.lean` line 566: `ramificationGroup G 𝒪[L] 0 →* 𝓀[L]ˣ`, `σ ↦` the residue of `σϖ/ϖ`. That is exactly "the finite-level embedding" the new sentence says §3a.1 stays at.
- **What §4a.1 states, as the paragraph describes it.**
  - `G_K^(0+)` is wild inertia `P_K` (second bullet, line 754).
  - `G_K^0` is inertia `I_K` (third bullet, line 761).
  - `P_K` is pro-`p` when `p > 0` and trivial when `p = 0` (lines 762–763).
  - `I_K` and `P_K` are defined in the Conventions (lines 140–141).
- **No second owner of inertia.** §4a.1's first bullet identifies `G_K^0` with Mathlib's `ValuationSubring.inertiaSubgroup`. §F.3a's own Check `VanishingCycles.inertia_eq_valuation_inertia` (main line 810) identifies its `I` with the same Mathlib subgroup, and at the revision head §F.3a defines `I` as it. So all three names denote one pinned Mathlib object. The roadmap's `I_K` and `P_K` are notation, not new carriers, and §F.3a states no theorem identifying `I` or `P` with a filtration term, nor that `P` is pro-`p`.
- **Local-field ownership agrees with lines 64–67.** Those lines say the completed roadmap owns the tame character on nonarchimedean local fields; the new paragraph gives §F.3a the general henselian version. §F.3a's `VanishingCycles.tameCharacter_eq_inertiaTameCharacter` identifies the two, so the README states no double ownership.
- **The consumer that takes both objects agrees.** ArithmeticGaloisRepresentations, at the head of its open pull request #856, takes the tame character from §F.3a (its README lines 650, 702 and 1774). From this roadmap it takes only `G_K^0 = I_K`, `G_K^(0+) = P_K` and pro-`p` (its lines 449–470). This is the split the new paragraph states.
- **Who cites the changed text.** `roadmaps grep` finds this roadmap cited by #856, #940, #1411, #1713 and #617. Each cites §§3a.x or 4a.x, none cites *Scope and ownership*, and none cites this roadmap for `t_ℓ` or the tame quotient. `roadmaps overlaps` lists no other pull request that changes this roadmap and no dropped id.
- **Main moved** from 373d88d to bbbde05. The only change is two `PurityOfBranchLocus` progress files, so every supplier folder is unchanged.
- **House style.** The added lines contain:
  - no LaTeX, process word or pull-request number;
  - mathematics in backticked Unicode;
  - no backticked Lean name of this roadmap's own.

  The gate's `statement-hygiene=0`, `latex=0`, `prnum=0` and `readme-ids-missing=0` agree, and `roadmaps resolve` finds no unresolved citation or name.
- **Seeded sample.** None of the five sampled targets falls in the changed passage:
  - "The perfect-residue Herbrand package" and "Residue enlargement and preservation of ramification" (§§3a.2–3a.3);
  - "Proalgebraic units and norm-kernel components" and "Graded norms and filtered norm-kernel components" (§3a.3);
  - "Agreement with `Breve E` on a local field" (§4a.3).

  Their locator verification is carried from r12 and r13 (rows 39–43): serre1961 lines 860–950 and 1092–1232; ega3 lines 637–639 and 733–737; serre1960 lines 162–1261; brinon-conrad lines 259 and 378–386.

### Signatures, padding and headlines

`Suggested.lean` has not changed since c89caf8, so the r12 results stand:
- `signatures.md` lists 13 declarations (4 definitions and 9 theorems), none with a dropped binder, and each agrees with its README statement.
- The one-tactic probe left all nine theorems open.
- The headline list is unchanged, with §4a.3 named in the docstring as not statable.
- The new paragraph adds no target.

### Adversarial pass

Rows 1–80 are carried from r16 at 9b92470, because the diff leaves their statements untouched. Rows 1–75 use 0572f17's line numbering, as r16 recorded, and rows 76–80 use 9b92470's. At this head, every README line after old line 95 is 8 lines lower; for example, r16's line 751 is now line 759. Rows 81–88 are new and cover the changed passage.

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
| 1 | Hilbert (Lean 62) | `Z9` | `5 + 2 + 2 = 9`; `disc ℚ(ζ_9) = 3^9`, `f = 1` | agrees | none (carried: r16 row 1) |
| 2 | same | `Z8` | `3 + 3 + 1 + 1 = 8`; `disc ℚ(ζ_8) = 2^8` | agrees | none (carried: r16 row 2) |
| 3 | same | `G = 1` | `differentIdeal = ⊤ = 𝔪^0`; sum `0` | agrees | none (carried: r16 row 3) |
| 4 | same, separability dropped | `CpCp`, `p = 2` | `d = 2`; `Σ = 3` | hypothesis needed | none (carried: r16 row 4) |
| 5 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees | none (carried: r16 row 5) |
| 6 | same, below `−1` | unramified quadratic | `φ(−2) = −3`, `ψ(−2) = −3/2` | stated on `[−1, ∞)` | none (carried: r16 row 6) |
| 7 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees | none (carried: r16 row 7) |
| 8 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs `G_3 = {1, 5}` | wrong model excluded | none (carried: r16 row 8) |
| 9 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `ψ_G(1/2) = 1`; `(G/H)_1 = 1` | agrees | none (carried: r16 row 9) |
| 10 | same | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ (G/H)^2` | agrees | none (carried: r16 row 10) |
| 11 | same, separability dropped | `I2`, `v = 1/2` | `G/H` vs `1` | hypothesis needed | none (carried: r16 row 11) |
| 12 | tower (Lean 130) | `Z9`, `u = 5` | `φ_G(5) = 3/2 = φ_(G/H)(3)` | agrees | none (carried: r16 row 12) |
| 13 | same | `S3`, `u = 5` | `11/6 = φ_(G/H)(11/3)` | agrees | none (carried: r16 row 13) |
| 14 | same, separability dropped | `I2`, `u = 1` | `1` vs `1/2` | hypothesis needed | none (carried: r16 row 14) |
| 15 | Hasse–Arf (Lean 151) | `Z9` | `6 ∣ 0`, `6 ∣ 6`; non-jump `6 ∤ 3` | agrees | none (carried: r16 row 15) |
| 16 | same | `Z8` | `4 ∣ 4`, `4 ∣ 8`; non-jump `4 ∤ 6` | agrees | none (carried: r16 row 16) |
| 17 | same, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed | none (carried: r16 row 17) |
| 18 | same, infinite residue field | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | none (carried: r16 row 18) |
| 19 | same, negative control | abstract `C_9` filtration | `9 ∤ 21` | Check consistent | none (carried: r16 row 19) |
| 20 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees | none (carried: r16 row 20) |
| 21 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | both sides `1` | agrees | none (carried: r16 row 21) |
| 22 | same | `W` | inertia `= G_K` | agrees | none (carried: r16 row 22) |
| 23 | same | `ℚ_p`, Frobenius lift | outside both sides | agrees | none (carried: r16 row 23) |
| 24 | same, `q`-power step | `F_p((t))`, `t^(1/p)` | `(σx − x)^p = 0` | step sound | none (carried: r16 row 24) |
| 25 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G`; `G_2 = {1, 5}` | agrees | none (carried: r16 row 25) |
| 26 | same, perfectness dropped | `I2`, `u = 1/2` | image order `≤ 2` vs `4` | hypothesis needed | none (carried: r16 row 26) |
| 27 | `0+` (Lean 239) | `W`, `K(ζ_p)` | `P_K ↦ 1`, `I_K ↠ C_(p−1)` | `G^(0+) ≠ G^0` | none (carried: r16 row 27) |
| 28 | same | `ℂ((t))` | both sides `⊥` | agrees | none (carried: r16 row 28) |
| 29 | same | `AS` over `F̄_p((t))` | both sides onto `C_p` | agrees | none (carried: r16 row 29) |
| 30 | subgroup identity (Lean 263) | `S3`, `u = 1, 2` | `H^1 = 1`, `H^3 = 1` | agrees | none (carried: r16 row 30) |
| 31 | same | `H = G`, `H = ⊥` | `G^u`; `⊤ = ⊤` | agrees | none (carried: r16 row 31) |
| 32 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `H^2 = H`, `H^3 = 1` | agrees | none (carried: r16 row 32) |
| 33 | same, `L` not Galois | `S3`, `L = ℚ_3(∛3)` | `ψ(1) = 1`, `ψ(2) = 3` | agrees | none (carried: r16 row 33) |
| 34 | same | `u = −1` | both `⊤` | agrees | none (carried: r16 row 34) |
| 35 | same | `L = M` | `ψ_(L/K) = ψ_(M/K)` | agrees | none (carried: r16 row 35) |
| 36 | same, `hO'` dropped | `W`, trivial `O′` | `G_L` vs `⊥` | hypothesis needed | none (carried: r16 row 36) |
| 37 | integral formula | `S3`, `L = ℚ_3(∛3)` | `3u − 3` at `u = 2` is `3` | agrees | none (carried: r16 row 37) |
| 38 | §4a.3 base change | `Z9` | `d/e = 3/2`; upper jumps `0, 1` | agrees | none (carried: r16 row 38) |
| 39 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; upper `1, 2` | agrees | none (carried: r16 row 39) |
| 40 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)`; `X^e − t` | uniformizer kept; `F̄_p × F̄_p`; `#G_0 = e` | agrees | none (carried: r16 row 40) |
| 41 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p` | agrees | none (carried: r16 row 41) |
| 42 | sampled: graded norms | `AS`; tame `C_e`; `F_3` | `t⁻¹ + λ^p − λ`; `μ_e`; `−λ` | agrees | none (carried: r16 row 42) |
| 43 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; unbounded series; `1/2 ∉ ℤ` | agrees | none (carried: r16 row 43) |
| 44–50 | Downstream consumers paragraph | seven consumers | section unions as recorded in r13 | agrees | none (carried: r16 rows 44–50) |
| 51 | consumer completeness | grep over main and open heads | 6 consumers, 6 named | agrees | none (carried: r16 row 51) |
| 52 | `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` | `ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `H^2 = H`, `H^3 = 1` | agrees | none (carried: r16 row 52) |
| 53 | Summary bases | ArithmeticGaloisRepresentations contract | perfect residue field `F̄_p` | agrees | none (carried: r16 row 53) |
| 54 | `TauCeti.IsProP` contract | `ProP/Basic.lean` line 68 | `∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U)` | agrees | none (carried: r16 row 54) |
| 55 | `p = 0` vacuity | any `G` | `g ^ 0 ^ 1 = 1` | agrees | none (carried: r16 row 55) |
| 56 | no compactness in `IsProP` | binders | `[Group G] [TopologicalSpace G]` only | agrees | none (carried: r16 row 56) |
| 57 | `IsProP p P_K`; Check separating `P_K` from `I_K` | `Z9` | `#P_K/N = 3`, `#I_K/(I_K ∩ G_M) = 6` | agrees | none (carried: r16 row 57) |
| 58 | same, `p = 2` | `Z8` | `G_1` of order `4` | agrees | none (carried: r16 row 58) |
| 59 | same, tame level | `W`, `K(ζ_3)` | `P_K ↦ 1`, `I_K ↦` order `2` | agrees | none (carried: r16 row 59) |
| 60 | `p = 0` gives `P_K = 1` | `ℂ((t))` | `G_1 = 1` at every level; `I_K ≅ Ẑ` | agrees | none (carried: r16 row 60) |
| 61 | same bullet, infinite residue field | `AS` over `F̄_p((t))` | image `C_p` | agrees | none (carried: r16 row 61) |
| 62 | pro-`p` proof step | `Z9` | `P_K/(P_K ∩ G_M) ≅ G_1`, order `3` | step sound | none (carried: r16 row 62) |
| 63 | image of `P_K` is `G_1` | `Z9`, `w ∈ (0, 1]` | `ψ(w) = 2w`, `Gal^w = G_1` | agrees | none (carried: r16 row 63) |
| 64 | ProfiniteProPGroups in the order | main, depcheck | `0 problem(s)` | not upward | none (carried: r16 row 64) |
| 66 | Contract: five cited inertia declarations, files and hypotheses | pinned Tau Ceti; `#check @` probe | Inertia/Basic.lean 159, 164; WildInertia.lean 285, 294, 520; local-field binders, plus `(p : ℕ) [CharP 𝓀[K] p]` for the last | agrees | none (carried: r16 row 66) |
| 67 | the normality instance `TauCeti.inertiaSubgroup_normal` | `ℚ_[3]` | declared `instance` (line 164); `inferInstance` elaborates | agrees | none (carried: r16 row 67) |
| 68 | Fourth bullet, pro-`p` on a local field under `CharP 𝓀[K] p` | `ℚ_3`, `p = 3`; `p = 0` | `IsProP 3 (wildInertiaSubgroup ℚ_[3])` elaborates; `CharP 𝔽_3 0` false; `Z9` image of `P_K` is `{1, 4, 7}` | agrees | none (carried: r16 row 68) |
| 69 | Fourth bullet: `G_K^0` closed and normal | `T6`; `Z9` | `T6`: image `A_3`, index `2`, normal, fixed field `ℚ_2(ζ_3)` unramified; `⟨(12)⟩` not normal, `e = 3`; `Z9`: `G_0 = (ℤ/9)ˣ` | wrong model excluded | none (carried: r16 row 69) |
| 71 | Fourth bullet at `p = 2` | `Z8`; `T6` | image of `P_K`: `(ℤ/8)ˣ`, order `2^2`; `1`, order `2^0` | agrees | none (carried: r16 row 71) |
| 72 | Proof: "fixing subgroups, hence closed" | pinned proofs | `fixingSubgroup_isClosed_of_isAlgebraic` (Inertia/Basic.lean 161, WildInertia.lean 287) | agrees | none (carried: r16 row 72) |
| 73 | Recovery is not circular | the `G_K^0 = I_K` paragraph | proved through unramified subextensions without closedness | sound | none (carried: r16 row 73) |
| 74 | *Needs* and Layer 4a *Dependencies* | contract lines | the same five names; 2 + 1 + 1 + 1 declarations | agrees | none (carried: r16 row 74) |
| 75 | Owner of the recovered statements | `Completed/LocalFieldsRamification/README.md` | line 1224; line 1264 | owned by the completed supplier | none (carried: r16 row 75) |
| 76 | Third bullet: `G_K^(u+) ⊆ G_K^u` (now line 759) | `Z8` at `u = −1, 1, 3/2, 2`; `Z9` at `u = 0, 1/2, 1` | `Z8`: `G ⊆ G`; `{1, 5} ⊊ (ℤ/8)ˣ`; `{1, 5} = {1, 5}`; `1 ⊊ {1, 5}`. `Z9`: `{1, 4, 7} ⊊ (ℤ/9)ˣ`; equal; `1 ⊊ {1, 4, 7}` | holds; strict exactly at upper jumps | none (carried: r16 row 76) |
| 77 | `G_K^(0+) ⊆ G_K^0`, recovered in the fourth bullet (now lines 759, 772) | `Z9`; `T6`; `Z8` | `{1, 4, 7} ⊆ (ℤ/9)ˣ`; `1 ⊆ A_3`; equality `(ℤ/8)ˣ` | agrees | none (carried: r16 row 77) |
| 78 | Proof: closed `G_K^u` contains `G_K^(u+)` (now line 795) | Lean probe | `probe_isClosed`, `probe_closure_le`; exit 0 | step sound | none (carried: r16 row 78) |
| 79 | Check: strict at `W(ζ_p)`, odd `p` (now line 890) | `p = 3, 5, 2` | images `1` vs `C_2`, `C_4`; `K(ζ_2) = K` | agrees | none (carried: r16 row 79) |
| 80 | Wrong model: closure of `⋃_(w ≥ u)` | `W`, `K(ζ_3)`; `Z9` | wrong model gives `C_2`, definition `1`; `(ℤ/9)ˣ` vs `{1, 4, 7}` | wrong model excluded | none (carried: r16 row 80) |
| 81 | New: §F.3a's tame quotient `I/P ≅ ∏_(ℓ ≠ p) ℤ_ℓ(1)` (README 94–95) | `ℂ((t))`, `p = 0`; `ℚ_3` at `Z9`; wrong model with `ℓ = p` included | `I = G_K ≅ Ẑ(1) = ∏_ℓ ℤ_ℓ(1)`, `P = 1`; `I ↠ (ℤ/9)ˣ`, `P ↠ {1, 4, 7}`, `I/P ↠ C_2 = μ_2(F̄_3)`, with `2 ≠ 3`; the `3`-part of `G_0` is `G_1 ⊂ P`, so an `ℓ = 3` factor would be killed | matches §F.3a main line 825; wrong model excluded | none |
| 82 | New: §F.3a's scope is every henselian DVR with residue characteristic `p ≥ 0` (README 91–92) | complete `A` (this roadmap's setting); the henselization of `k[t]` at `(t)` | complete gives henselian, so this roadmap's `K` is in §F.3a's scope; the henselization is in §F.3a's scope and not this roadmap's, so the attribution is wider than this roadmap's setting, in the right direction; `p` from main line 816 | agrees | none |
| 83 | New: "consumes nothing from that section" (README 95) | grep of README | `EtaleCohomologyFoundations` 1 hit (line 91); 0 hits in contracts (143–277), Layer 4a *Dependencies* (1099–1110), *Dependency order* (1112–1122) | true | none |
| 84 | New: "§3a.1 stays at the finite-level embedding of `G_0/G_1` in the residue units" (README 96–97) | `T6`; `Z9`; `W(ζ_5)`; `AS` over `F̄_p((t))` | `A_3 ≅ C_3 ↪ F_4ˣ ≅ C_3`; `C_2 ↪ F_3ˣ = {±1}`; `C_4 ↪ F̄_5ˣ`; `G_0 = G_1 = C_p`, quotient `1`; stated at line 355 | agrees | none |
| 85 | New: §4a.1 identifies `I_K`, `P_K` with `G_K^0`, `G_K^(0+)`; `P_K` pro-`p` or trivial at `p = 0` (README 97–99) | `ℂ((t))`; `Z9`; `W` | `p = 0`: `P_K = 1`, `I_K = G_K`; `p = 3`: image of `P_K` order `3`, of `I_K` order `6`; `W`: `G_K^0 = I_K = G_K`; matches lines 754, 761–763 | agrees | none |
| 86 | Inertia carriers coincide: Mathlib `ValuationSubring.inertiaSubgroup` (§4a.1 first bullet), §F.3a's `I`, Conventions' `I_K` | `W` (strictly henselian); `ℚ_3` at `Z9` | §F.3a `inertia_eq_top_of_strictlyHenselian` (main 808) gives `I = Gal(η̄/η)`, as r16 row 22 gives `G_K^0 = G_K`; §F.3a `inertia_eq_valuation_inertia` (main 810); at `Z9` all three map onto `(ℤ/9)ˣ` | one object, no second owner | none |
| 87 | "Tame character": new sentence vs §3a.1's `TauCeti.tameCharacter` (README 95, 379) | pinned `UnitFiltration/RamificationGroup.lean` 566 | the pinned map is `G_0 →* 𝓀[L]ˣ`, `σ ↦ σϖ/ϖ mod 𝔪`, finite level; the new sentence's antecedent is `t_ℓ : I → ℤ_ℓ(1)`; at `Z9`, `t_2` reduces mod 2 to `θ_0 : (ℤ/9)ˣ ↠ {±1}` | consistent | none |
| 88 | Local-field tame character: lines 64–67 (completed roadmap) vs line 94 (§F.3a) | `ℚ_3` | §F.3a `tameCharacter_eq_inertiaTameCharacter` (main 833) sends `t_ℓ` to the `ℓ`-component of `TauCeti.inertiaTameCharacter`; this is the general case vs the local-field case, and this roadmap states neither | agrees | none |

### Remarks on untouched text (no change requested)

- The description's *Why* and *Merge order* paragraphs still say that FiniteFlatGroupsAndIntegralPadicHodgeTheory cites §§3a.1–3a.3 and §§4a.1–4a.3. The README's last downstream sentence (lines 1146–1147) states the actual route, through PadicPeriodRings.
- The README does not mention Tau Ceti's `TauCeti.wildInertiaSubgroup_normal` (WildInertia.lean, line 290), and it states no normality of `G_K^(0+)`. Neither is needed by any target here.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is settled in the manifest as uncertified. Its locators are cited without the text.
- The changed passage carries no source locator. The Stacks locators of §F.3a belong to EtaleCohomologyFoundations and were not rechecked here.

## Source issues

- none
