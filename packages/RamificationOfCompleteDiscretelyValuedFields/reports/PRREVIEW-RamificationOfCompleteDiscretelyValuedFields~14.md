# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 34fcfb5)

**Verdict:** needs changes

This is an incremental re-review of the 48 lines that changed since 9205014. All of them are in `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`, and they name ProfiniteProPGroups' predicate `TauCeti.IsProP` for §4a.1's wild inertia:
- the scope sentence (lines 89–91);
- the new contract `### From TauCetiRoadmap.ProfiniteProPGroups` (lines 238–246);
- the third API bullet of §4a.1 (lines 746–749);
- the pro-`p` step of §4a.1's proof (lines 799–804);
- §4a.1's *Needs* (lines 826–828);
- two new §4a.1 Checks (lines 867–874);
- Layer 4a *Dependencies* (lines 1080–1081);
- the dependency order (lines 1088–1096).

`Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged since c89caf8 (`git diff c89caf8 HEAD` is empty for all three). No file outside the folder changed.

- **Gate.** I reran it at this head. Every check passed (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). The worker's run also reports `build=0`.
- **Dependency check.** `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. Its only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Gaps.** The package has no `design/plan.json`, so no gaps are declared.

The new mathematics is correct. Rows 54–65 check:
- the contract's description of `TauCeti.IsProP`;
- the `p = 0` vacuity;
- the pro-`p` route;
- both new Checks.

The two findings are citation and description defects.

## R01 (P3) — The description still names two suppliers the README does not consume

**Location.** The pull-request description, *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia) and ReductiveGroupsPartII §RG2.0.4 (§4a.3)".

**Claim.**
- This head repairs the ProfiniteProPGroups part: the README now consumes it (lines 238–246, 1080–1081, 1091–1094).
- ProfiniteCohomology and EtaleCohomologyFoundations §F.3a are still named as suppliers, but nothing in the README consumes them.
- §4a.1 states no tame-inertia target. It takes inertia from Mathlib's `ValuationSubring.inertiaSubgroup` and Tau Ceti's `TauCeti.inertiaSubgroup`.
- ProfiniteCohomology is also not a completed roadmap: it is on main at `TauCetiRoadmap/ProfiniteCohomology`, not under `Completed/`.

**Witness.**
- At this head, a case-insensitive grep of the README for `ProfiniteCohomology`, `EtaleCohomology` and `F.3a` finds nothing.
- EtaleCohomologyFoundations §F.3a (main, line 776) is "Henselian traits, inertia and the tame character", and this roadmap uses none of it.

**Repair.** Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. No open pull request is a supplier."

**Tested.** After this edit, the description names exactly the seven suppliers of README lines 135–263 and 1086–1096.

## R02 (P3) — The pro-`p` statement does not cite its local-field instance at the pin

**Location.** README lines 746–749: "when `p > 0`, `P_K` is pro-`p`, `TauCeti.IsProP p P_K` for the subspace topology". Also the LocalFieldsRamification contract bullet at lines 221–225, which lists the wild-inertia declarations consumed.

**Claim.**
- On a nonarchimedean local field, the new pro-`p` statement is already a Tau Ceti theorem, through §4a.1's own agreement `G_K^(0+) = TauCeti.wildInertiaSubgroup` (lines 754–755).
- The completed roadmap owns that theorem: LocalFieldsRamification README line 1264 reads "Prove … that `P_K` is pro-`p`".
- This roadmap's scope (lines 64–72) says it defines nothing a second time on local fields and records the local-field instances it recovers, as §3a.3 does for `TauCeti.LocalFieldsRamification.hasseArf`.
- The change introduces the predicate but cites neither the Tau Ceti theorem nor the recovery.

**Witness.** `TauCeti.isProP_wildInertiaSubgroup : IsProP p (wildInertiaSubgroup K)`, under `[IsNonarchimedeanLocalField K]` and `[CharP 𝓀[K] p]` (`TauCeti/NumberTheory/LocalField/WildInertia.lean`, line 520). The README does not mention it anywhere.

**Repair.**
1. Add `TauCeti.isProP_wildInertiaSubgroup` (pro-`p` for the residue characteristic `p`) to the absolute-Galois-group bullet of `### From TauCetiRoadmap.LocalFieldsRamification`, after `TauCeti.map_wildInertiaSubgroup_restrictNormalHom`.
2. End the fourth §4a.1 API bullet with: "so that there the pro-`p` statement of the third bullet is Tau Ceti's `TauCeti.isProP_wildInertiaSubgroup`, consumed, not restated."
3. Add the name to the local-field part of §4a.1's *Needs*.

**Tested.** For `K = ℚ_3`, `CharP 𝓀[ℚ_3] 3` holds, and the declaration gives `IsProP 3 P_K`. This agrees with the new Check, where the quotient at `ℚ_3(ζ_9)` is `G_1 = {1, 4, 7}` of order `3`.

## Previous findings

- R01 — partly repaired: the README now consumes ProfiniteProPGroups (lines 238–246), but the description's *Dependencies* still names "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)", which the README does not consume. Written again as R01 above.

## Verified sound

### The changed passages

- **The contract, lines 238–246.** At the pinned Tau Ceti, `TauCeti.IsProP` is in `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean`, line 68.
  - Its body is `∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U.toSubgroup)`, and its binders are `[Group G] [TopologicalSpace G]`. So "every quotient … by an open normal subgroup is a `p`-group" and "does not include compactness" are both exact.
  - Mathlib's `IsPGroup` (`Mathlib/GroupTheory/PGroup.lean`, line 45) is `∀ g, ∃ k, g ^ p ^ k = 1`. With `p = 0` and `k = 1` this gives `g^0 = 1`, as the contract says.
- **Ownership.** `Completed/ProfiniteProPGroups/README.md` maps `IsProP` to `TauCeti.IsProP` (lines 54 and 86) and owns its API (lines 439–450). The relative link `../../Completed/ProfiniteProPGroups/README.md` resolves in the worktree.
  - ProfiniteProPGroups is completed on main, so the edge is not upward. depcheck reports 0 problems.
  - The scope sentence (lines 89–91) agrees with that roadmap. LocalGaloisGroups keeps the maximal pro-`p` quotient.
- **The API bullet and proof route (lines 746–749, 799–804).**
  - Each `G_1` is a `p`-group, and it is trivial when `p = 0`. Both are stated in §3a.1 (lines 349–351) for separable residue extension, which a perfect `k` gives.
  - An open `N ⊴ P_K` is `P_K ∩ U` with `U` open in the Krull topology, so it contains `P_K ∩ G_M` for some finite Galois `M`.
  - `P_K/N` is then a quotient of `P_K/(P_K ∩ G_M)`, which embeds in `G_1`, so `IsPGroup` passes to it.
  - The route needs no compactness, matching the predicate.
- **The new Checks (lines 867–874).** The `ℚ_3(ζ_9)` values and the `ℂ((t))` values are recomputed in rows 57 and 60.
- **House style.** The changed text has no LaTeX, no process words, no pull-request numbers and no new locator.
- **Untouched by the change.** The seeded sample (perfect-residue Herbrand package, residue enlargement, proalgebraic units, graded norms, `Breve E` agreement) lies in §§3a.2, 3a.3 and 4a.3, none of which the diff touches. Their verification is carried from r12/r13, rows 39–43:
  - serre1961 lines 860–950 and 1092–1232;
  - ega3 lines 637–639 and 733–737;
  - serre1960 lines 162–1261;
  - brinon-conrad lines 259 and 378–386.

### Probes (scratch file, elaborated with `lake env lean`, exit 0, no output)

The scratch file checks four things:
- `TauCeti.IsProP p P` elaborates for `P : Subgroup (Field.absoluteGaloisGroup K)`, with the subspace topology.
- `TauCeti.IsProP 0 G` holds for every topological group, by `fun _ g => ⟨1, by simp⟩`.
- `¬ IsPGroup 3 (ZMod 9)ˣ` holds: `(−1)^(3^k) = −1`.
- Every unit `a` with `a ∈ {1, 4, 7}` satisfies `a^3 = 1` (`decide`).

It also checks `#check @TauCeti.isProP_wildInertiaSubgroup`, whose type is quoted in R02.

### Adversarial pass

Rows 1–53 cover statements the diff leaves untouched. They are carried from r13 at 9205014, which carried rows 1–43 from r12 and computed rows 44–53. Rows 54–65 are new and cover the changed passages.

Notation:
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`.
- `S3` is `ℚ_3(ζ_3, ∛3)/ℚ_3`.
- `AS` is `y^p − y = t⁻¹` over `k((t))`.
- `I2` is the `F_2(s)((t))` example of §3a.2.
- `CpCp` is the §3a.1 monogenicity example.
- `W` is `Frac W(F̄_p)`.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `5 + 2 + 2 = 9`; `disc ℚ(ζ_9) = 3^9`, `f = 1` | agrees | none (carried: r13 row 1) |
| 2 | same | `Z8` | `3 + 3 + 1 + 1 = 8`; `disc ℚ(ζ_8) = 2^8` | agrees | none (carried: r13 row 2) |
| 3 | same | `G = 1` | `differentIdeal = ⊤ = 𝔪^0`; sum `0`; no `ℕ`-subtraction junk | agrees | none (carried: r13 row 3) |
| 4 | same, separability dropped | `CpCp`, `p = 2` | `d = 2(p−1) = 2`; `Σ = p² − 1 = 3` | hypothesis needed | none (carried: r13 row 4) |
| 5 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees | none (carried: r13 row 5) |
| 6 | same, below `−1` | unramified quadratic | `φ(−2) = −3`, `ψ(−2) = −3/2` | stated on `[−1, ∞)` | none (carried: r13 row 6) |
| 7 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees | none (carried: r13 row 7) |
| 8 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs `G_3 = {1, 5}` | wrong model excluded | none (carried: r13 row 8) |
| 9 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `ψ_G(1/2) = 1`; `(G/H)_1 = 1` | agrees | none (carried: r13 row 9) |
| 10 | same | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ G/H = (G/H)^2` | agrees | none (carried: r13 row 10) |
| 11 | same, separability dropped | `I2`, `v = 1/2` | `G^(1/2)H/H = G/H` vs `(G/H)^(1/2) = 1` | hypothesis needed | none (carried: r13 row 11) |
| 12 | tower (Lean 130) | `Z9`, `u = 5` | `φ_G(5) = 3/2 = φ_(G/H)(φ_H(5)) = φ_(G/H)(3)` | agrees | none (carried: r13 row 12) |
| 13 | same | `S3`, `u = 5` | `11/6 = φ_(G/H)(11/3)` | agrees | none (carried: r13 row 13) |
| 14 | same, separability dropped | `I2`, `u = 1` | `1` vs `1/2` | hypothesis needed | none (carried: r13 row 14) |
| 15 | Hasse–Arf (Lean 151) | `Z9` | `6 ∣ 0`, `6 ∣ 6`; non-jump `6 ∤ 3` | agrees | none (carried: r13 row 15) |
| 16 | same | `Z8` | `4 ∣ 4`, `4 ∣ 8`; non-jump `4 ∤ 6` | agrees | none (carried: r13 row 16) |
| 17 | same, commutativity dropped | `S3` | `j = 3`: `9`, `6 ∤ 9` | hypothesis needed | none (carried: r13 row 17) |
| 18 | same, infinite residue field | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | none (carried: r13 row 18) |
| 19 | same, negative control | abstract `C_9` filtration | `9 ∤ 21` | Check consistent | none (carried: r13 row 19) |
| 20 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees | none (carried: r13 row 20) |
| 21 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | both sides `1` | agrees | none (carried: r13 row 21) |
| 22 | same | `W` | inertia `= G_K` | agrees | none (carried: r13 row 22) |
| 23 | same | `ℚ_p`, Frobenius lift | outside both sides | agrees | none (carried: r13 row 23) |
| 24 | same, `q`-power step | `F_p((t))`, `t^(1/p)` | `(σx − x)^p = 0` | step sound | none (carried: r13 row 24) |
| 25 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G`; `G_2 = {1, 5}` | agrees | none (carried: r13 row 25) |
| 26 | same, perfectness dropped | `I2`, `u = 1/2` | image order `≤ 2` vs `4` | hypothesis needed | none (carried: r13 row 26) |
| 27 | `0+` (Lean 239) | `W`, `K(ζ_p)` | `P_K ↦ 1`, `I_K ↠ C_(p−1)` | `G^(0+) ≠ G^0` | none (carried: r13 row 27) |
| 28 | same | `ℂ((t))` | both sides `⊥` | agrees | none (carried: r13 row 28) |
| 29 | same | `AS` over `F̄_p((t))` | both sides onto `C_p` | agrees | none (carried: r13 row 29) |
| 30 | subgroup identity (Lean 263) | `S3`, `u = 1, 2` | `H^1 = 1`, `H^3 = 1` | agrees | none (carried: r13 row 30) |
| 31 | same | `H = G`, `H = ⊥` | `G^u`; `⊤ = ⊤` | agrees | none (carried: r13 row 31) |
| 32 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `H^2 = H`, `H^3 = 1` | agrees | none (carried: r13 row 32) |
| 33 | same, `L` not Galois | `S3`, `L = ℚ_3(∛3)` | `ψ(1) = 1`, `ψ(2) = 3` | agrees | none (carried: r13 row 33) |
| 34 | same | `u = −1` | both `⊤` | agrees | none (carried: r13 row 34) |
| 35 | same | `L = M` | `ψ_(L/K) = ψ_(M/K)` | agrees | none (carried: r13 row 35) |
| 36 | same, `hO'` dropped | `W`, trivial `O′` | `G_L` vs `⊥` | hypothesis needed | none (carried: r13 row 36) |
| 37 | integral formula | `S3`, `L = ℚ_3(∛3)` | `3u − 3` at `u = 2` is `3` | agrees | none (carried: r13 row 37) |
| 38 | §4a.3 base change | `Z9` | `d/e = 3/2`; upper jumps `0, 1` | agrees | none (carried: r13 row 38) |
| 39 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; upper `1, 2` | agrees | none (carried: r13 row 39) |
| 40 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)`; `X^e − t` | uniformizer kept; `F̄_p × F̄_p`; `#G_0 = e` | agrees | none (carried: r13 row 40) |
| 41 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p` | agrees | none (carried: r13 row 41) |
| 42 | sampled: graded norms | `AS`; tame `C_e`; `F_3` | `t⁻¹ + λ^p − λ`; `μ_e`; `−λ` | agrees | none (carried: r13 row 42) |
| 43 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; unbounded series; `1/2 ∉ ℤ` | agrees | none (carried: r13 row 43) |
| 44–50 | Downstream consumers paragraph | PadicPeriodRings, ArithmeticGaloisRepresentations, ClassFieldTheory, PadicExtensionFamilies, FilteredLocalGaloisGroups, FieldOfNorms, FiniteFlatGroupsAndIntegralPadicHodgeTheory | section unions as recorded in r13 | agrees | none (carried: r13 rows 44–50) |
| 51 | consumer completeness | grep over main and open heads | 6 consumers, 6 named | agrees | none (carried: r13 row 51) |
| 52 | quoted identity `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` | `ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `H^2 = H`, `H^3 = 1` | agrees | none (carried: r13 row 52) |
| 53 | Summary: bases `F̄_p((t))`, `W` | ArithmeticGaloisRepresentations contract | perfect residue field `F̄_p` in both | agrees | none (carried: r13 row 53) |
| 54 | Contract: `TauCeti.IsProP p G` is "every quotient by an open normal subgroup is a `p`-group" (README 241–243) | pinned `ProP/Basic.lean` line 68 | body `∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U.toSubgroup)`; path `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean` | agrees | none |
| 55 | Contract: for `p = 0` the predicate holds for every group (README 245–246) | any `G`; Mathlib `IsPGroup` (PGroup.lean 45) | `k = 1`: `g ^ 0 ^ 1 = g ^ 0 = 1`; probe `fun _ g => ⟨1, by simp⟩` elaborates | agrees | none |
| 56 | Contract: no compactness in the predicate; `P_K` compact as closed in `G_K` (README 244–245) | binders of `IsProP`; `P_K = ⋂_M res_M⁻¹(G_1(M))` | binders `[Group G] [TopologicalSpace G]` only; each preimage closed (finite discrete target, continuous restriction), `G_K` compact | agrees | none |
| 57 | Bullet: `p > 0` gives `IsProP p P_K`; Check: being pro-`p` separates `P_K` from `I_K` (README 748, 867–870) | `Z9`, `p = 3`, `N = P_K ∩ G_M` | `(ℤ/9)ˣ = {1, 2, 4, 5, 7, 8}`; `G_1 = {a ≡ 1 mod 3} = {1, 4, 7}`: `i(σ_4) = v_M(ζ_3 − 1) = 3`, so `σ_4 ∈ G_2 \ G_3`; `#P_K/N = 3 = 3^1`; `#I_K/(I_K ∩ G_M) = 6`, `(−1)^(3^k) = −1 ≠ 1` (probe) | agrees; wrong model `P_K := I_K` excluded | none |
| 58 | same bullet, `p = 2` | `Z8` | `G_1 = G = (ℤ/8)ˣ`, order `4 = 2^2`, a `2`-group | agrees | none |
| 59 | same bullet, tame level | `W`, `p = 3`, level `K(ζ_3)` | image of `P_K` is `G_1 = 1` (order `3^0`); image of `I_K` has order `2`, not a power of `3` | agrees with row 27 | none |
| 60 | Bullet: `p = 0` gives `P_K = 1`; Check: the predicate says nothing there (README 749, 871–874) | `ℂ((t))` | finite levels `ℂ((t^(1/n)))`, `G_0 = μ_n`, `G_1 = 1`, so `P_K = 1`; `I_K = G_K ≅ Ẑ ≠ 1`, yet `IsProP 0 I_K` holds (row 55) | agrees; only `P_K = 1` discriminates | none |
| 61 | same bullet, infinite residue field | `AS` over `F̄_p((t))` | image of `P_K` at the `AS` level is `G_1 = C_p`, order `p` | agrees with row 29 | none |
| 62 | Proof step: an open normal `N ≤ P_K` contains `P_K ∩ G_M`, and `P_K/N` is a quotient of a subgroup of `G_1` (README 799–804) | `Z9`, `N = P_K ∩ G_M`; `N = P_K` | `P_K/(P_K ∩ G_M) ≅ G_1`, order `3`; `P_K/P_K = 1`, order `3^0` | step sound | none |
| 63 | Image of `P_K` is all of `G_1` (used in the `Z9` Check) | `Z9`, `w ∈ (0, 1]` | `[G_0 : G_1] = 2` and `G_1 = G_2`, so `φ(u) = u/2` on `[0, 2]` (`φ(2) = 1`, as in row 52) and `ψ(w) = 2w ∈ (0, 2]`; `Gal^w = G_⌈2w⌉ = G_1`, and `G_K^w ⊆ P_K` maps onto it; Tau Ceti `map_wildInertiaSubgroup_restrictNormalHom` (WildInertia.lean 702) agrees on `ℚ_3` | agrees | none |
| 64 | Dependency order and Layer 4a *Dependencies* name ProfiniteProPGroups (README 1080–1081, 1091–1094) | merge order, main | `Completed/ProfiniteProPGroups` on main; depcheck `0 problem(s)` | not upward | none |
| 65 | Local-field instance of the bullet | `ℚ_3`, `TauCeti.isProP_wildInertiaSubgroup` (WildInertia.lean 520) | `[CharP 𝓀[ℚ_3] 3]` gives `IsProP 3 (wildInertiaSubgroup ℚ_3)`; through `G_K^(0+) = wildInertiaSubgroup` (README 754–755) this is the bullet at `p = 3`; README cites it nowhere | agrees, uncited | R02 |

### Signatures, padding and headlines

`Suggested.lean` is byte-identical to c89caf8, so everything here is unchanged.
- `signatures.md` lists 13 declarations (4 definitions and 9 theorems), none with a dropped binder. Each agrees with its README statement as recorded in r12.
- The one-tactic probe of r12 left all nine theorems open.
- The headline list is unchanged:
  - Hilbert (§3a.1);
  - `φ`, `ψ`, the upper numbering, Herbrand and tower transitivity (§3a.2);
  - Hasse–Arf (§3a.3);
  - `G_K^u`, `G_K^0`, the finite projections and `G_K^(0+)` (§4a.1);
  - the finite and open-subgroup identities (§4a.2).
  - §4a.3 is named in the docstring as not statable.
- The pro-`p` statement is an API bullet of `G_K^(0+)`, like closedness and normality, not a headline, so its absence from `Suggested.lean` is correct.

### Ownership and citations

- `roadmaps resolve` and `roadmaps overlaps` report nothing for this roadmap. No open pull request changes it or drops an id it cites.
- ProfiniteProPGroups is completed on main, and no open revision of it appears among the overlaps.
- The change adds no ownership claim. It names an existing owner of the predicate.

### Remark on untouched text (no change requested)

- The description's *Why* and *Merge order* paragraphs still say that FiniteFlatGroupsAndIntegralPadicHodgeTheory cites §§3a.1–3a.3 and §§4a.1–4a.3. The README's last downstream sentence states the actual route, through PadicPeriodRings.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is settled in the manifest as uncertified. Its locators (II §2 Proposition 3; III §6 Proposition 12; IV §1 Propositions 1, 2, 4; IV §3 Propositions 14, 15 and Exercise 3; V §7 Theorem 1) are cited without the text.
- The changed passages carry no new locator.

## Source issues

- none
