# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 79f03ba)

**Verdict:** needs changes

This is a full review of the same head the previous review read: the folder has not changed (0 lines), and nothing outside it has either. One new problem has appeared since then, and it is in another open pull request, not in this folder. At 01:50 today, #1215 made ClassFieldTheory the owner of the absolute upper filtration on nonarchimedean local fields, and this README claims that object for §4a.1 (R01). Two smaller items: `K′` means three different fields in this README (R02), and the description still names suppliers the README does not use (R03, the previous R01, not repaired).

Mechanical checks at this head:
- **Gate:** re-run, every check passes (`… outside-folder=0 source-material=0 OK`).
- **Dependency check:** `depcheck: 239 roadmaps, 2354 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` exits 0; the only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Declared gaps:** none (no `design/plan.json`).

## R01 (P2) — Two roadmaps own the absolute upper filtration of a nonarchimedean local field

**Location.** `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`:
- lines 110–112: "The absolute upper ramification groups `G_K^u` of a nonarchimedean local field, at every real depth `u ≥ −1` … are §4a.1's";
- lines 116–117: "A roadmap that uses either object on local fields cites §4a.1 or §4a.2 and does not define it a second time";
- lines 1136–1138: "ClassFieldTheory consumes §4a.1".

**Claim.**
- The open pull request #1215 (LocalGaloisGroups, ClassFieldTheory, …) is now at head b9e8822. Its commit "own local absolute filtration and remove upward dependency" (2026-11-09 01:50, after the previous review) gives the same object to ClassFieldTheory Layer 7:
  - `TauCetiRoadmap/ClassFieldTheory/README.md` lines 187–191 say that Layer 7 owns the absolute upper filtration on every nonarchimedean local field, that only the general filtration is this roadmap's, and that nothing from it is an input there.
  - Lines 1188–1218 of the same README define `localAbsoluteUpperRamificationGroup K v`, also declared in its `Suggested.lean` at line 109. It is the intersection of the preimages of `LocalFieldsRamification.upperRamificationGroup K M v`.
  - That definition carries the API this README's §4a.1 fourth bullet states: finite projections, the term at `0` as Tau Ceti's inertia, and the closure of the positive terms as Tau Ceti's wild inertia.
- So each README claims the local-field object for itself, and there is no single owner.
- Lines 1136–1138 inherit the conflict. They match ClassFieldTheory at #1411's head (its line 179 gives ownership to this roadmap) but contradict #1215's head. ClassFieldTheory on main (2083308) does not mention this roadmap at all.

**Witness.** On `ℚ_2(ζ_8)/ℚ_2`, this README's Check (lines 862–866) and #1215's Check (its ClassFieldTheory README line 1234) compute the same images at depths `0, 1, 2, 3`: `(ℤ/8)ˣ, (ℤ/8)ˣ, {1, 5}, {1}`. They compute them for two carriers, `absoluteUpperRamificationGroup ℚ_2 O u` and `localAbsoluteUpperRamificationGroup ℚ_2 u`.

**Repair.** Settle one owner. ClassFieldTheory is on main, so it comes before this roadmap in the merge order, and #1215 dropped its citation of §4a.1 as an upward edge. That favours ClassFieldTheory, and the edits in this folder are then:

1. Replace lines 109–113, from "Two objects" to "`… upperRamificationGroup K M u`.", with: "On a nonarchimedean local field, the absolute upper filtration cut out by the finite upper groups `TauCeti.LocalFieldsRamification.upperRamificationGroup K M v` is ClassFieldTheory Layer 7's. §4a.1 owns the filtration relative to a valuation subring over every complete discretely valued field with perfect residue field, and its fourth bullet proves that, for the valuation subring over `𝒪[K]` of a local field, it is the set of `σ` whose finite restrictions lie in those groups, which is ClassFieldTheory's filtration. One object of nonarchimedean local fields is this roadmap's, because the completed roadmap stops at finite Galois levels:" and keep the `ψ_(L/K)` sentence that follows.
2. In line 116, change "either object" to "this object" and "§4a.1 or §4a.2" to "§4a.2".
3. Replace the ClassFieldTheory sentence of lines 1136–1138 with one that matches the ClassFieldTheory revision that is settled. With #1215's head it is: "ClassFieldTheory's local-field absolute filtration agrees with §4a.1's and takes no input from it."
4. In the description's merge-order paragraph, name #1215 before this pull request, and say which of #1215 and #1411 is rebased on the other. The two ClassFieldTheory revisions assign this object in opposite directions.

If the operators settle ownership here instead, as #1411 assumes, these lines stay. The repair then moves to #1215, which drops lines 187–191 and `localAbsoluteUpperRamificationGroup`, cites §4a.1 and lists #1410 before itself. Either way, one of the two texts must change before this folder can be accepted.

**Tested.**
- After edits 1–3, this README claims the local-field object nowhere: §4a.1's fourth bullet remains as the agreement.
- #1215's lines 187–191 then say the same as this README's scope (the general filtration here, the local-field filtration there).
- The `ℚ_2(ζ_8)` values that the two Checks share become an agreement between an owner and a roadmap that compares with it, not a second definition.
- `ψ_(L/K)` is not contested: #1215's README contains no `ψ_(L/K)`, no non-Galois Herbrand function and no open-subgroup identity.

## R02 (P3) — `K′` denotes three different fields

**Location.**
- README line 141 (Conventions): "`K′` is the completion of `K^ur`". §4a.3 and lines 59–62, 107 and 275 use it in that sense.
- Line 354 (§3a.1): "`H_i = H ∩ G_i` for a subgroup `H = Gal(L/K′)`", with no local definition.
- Lines 441–446 and 482–487 (§3a.2): `K′ = L^H`, an intermediate field.
- Line 674 (§3a.3 proof): "`L′ = K′(π_L)` … of `K′ = Frac A′`".

**Claim.** Read with the Conventions, line 354 is malformed. The completion of `K^ur` is not inside `L`, so `Gal(L/K′)` is not a subgroup of `G`. In §3a.3, `Frac A′` has residue field an algebraic closure of `k_0`, while the Conventions' `K′` has the separable closure. The two differ when `k` is imperfect, which is exactly the case §3a.3 allows.

**Witness.**
- For `K = ℚ_3` and `L = ℚ_3(ζ_9)`: the Conventions' `K′` is `Breve ℚ_3`, whose residue field `F̄_3` is not contained in `L` (residue field `F_3`).
- For `k = F_2(s)`: `s^(1/2)` lies in the residue field of `A′` but not in `k^sep`.

**Repair.**
- Line 354: replace "for a subgroup `H = Gal(L/K′)`" with "for every subgroup `H` of `G`".
- Lines 441–446 and 482–487: write `L^H` for `K′` throughout (`L/L^H`, `L^H/K`, `e(L/L^H)`, `φ_(L/L^H)`, "the integer ring of `L^H`").
- Line 674: write `K̃ = Frac A′` and `L̃ = K̃(π_L)`. Neither symbol occurs elsewhere in the README.

**Tested.** After the edit, `grep -n "K′"` lists only lines 59–62, 107, 141, 275 and 1001–1097, all in the Conventions' sense. On the `ℚ_3(ζ_9)` instance, line 354 now names a subgroup of `G`.

## R03 (P3) — The description names suppliers and consumers the README does not have

**Location.** The pull-request description:
- *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)".
- *Why*: "FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) consume this package".
- *Merge order*: "#940, #856 and #879 cite its §§3a.1–3a.3 and §§4a.1–4a.3".

**Claim.**
- The description is unchanged since the previous review.
- README line 95 says this roadmap "consumes nothing from that section" (§F.3a).
- The README never names ProfiniteCohomology, and on main it sits at `TauCetiRoadmap/ProfiniteCohomology`, not under `Completed/`.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory does not cite this roadmap. Its README (line 126) takes the completed unramified comparison from PadicPeriodRings §0.3, which is what README lines 1146–1147 say.

**Witness.**
- `grep -c ProfiniteCohomology README.md` returns `0`.
- `EtaleCohomologyFoundations` occurs only at line 91, as an owner.
- `roadmaps grep RamificationOfCompleteDiscretelyValuedFields` returns no line of FiniteFlatGroupsAndIntegralPadicHodgeTheory.

**Repair.**
- Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. EtaleCohomologyFoundations §F.3a is named in the scope as an owner and is not a supplier."
- In *Why* and *Merge order*, drop #879 and say that integral `p`-adic Hodge theory reaches the package through PadicPeriodRings.
- Add the #1215 ordering of R01's repair.

**Tested.** Each named section resolves on main at 2083308:
- ReductiveGroups line 234;
- SchemeAndStackFoundations line 1565;
- AdicSpacesPartII line 7793;
- ReductiveGroupsPartII line 852;
- `Completed/LocalFieldsRamification` and `Completed/ProfiniteProPGroups`.

The edited description then lists exactly the suppliers of README lines 143–277 and 1099–1122.

## Previous findings

- R01 of the previous review (the description's suppliers): **not repaired**. The description still reads "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)". It is carried forward as R03 above and extended to the #879 claims. No repair report marks it as not actionable.

## Verified sound

### Seeded source sample (5 targets)

**1. The perfect-residue Herbrand package (README 311–333).**
- serre1961 n° 3.1 starts at line 856 (printed p. 126). In that section, Serre drops the algebraically closed residue field and keeps total ramification.
- Prop. 1 and Cor. 1–2 are at lines 875–886 (p. 126); Prop. 2 is at line 889 (p. 127).
- Formula (5) with properties a–d′ is at lines 903–926 (pp. 127–128).
- Formula (8), Prop. 3, the paragraph after it, Prop. 4 and the Remarque are at lines 929–950 (p. 128).
- n° 3.4–3.5 are at lines 1091–1246 (pp. 132–136).
- brinon-conrad Exercise 1.4.4(3) is at lines 382–386 (p. 10).
- The page mapping is PDF page `n` = printed `103 + n` (the line-54 header is p. 106 on PDF page 3).
- All three Checks are recomputed in rows 44–46.

**2. Residue enlargement (566–585).**
- ega3 (10.3.1) is at lines 637–639 (printed p. 20): a flat local map from a Noetherian local ring with any prescribed residue extension.
- (10.3.1.5) and the completion remark are at lines 733–737 (p. 23).
- A flat local `R → R′` with `R′/𝔪_R R′` a field makes `𝔪_(R′) = 𝔪_R R′` principal and generated by a nonzerodivisor, so `R′` is a DVR, as the target asserts.

**3. Proalgebraic units (587–628).**
- serre1961 §1 n° 1.1–1.6 is at lines 74–365 (pp. 106–113); Prop. 4, `U = G_m × U¹`, is at line 318.
- §2 n° 2.1–2.3 is at lines 556–658 (pp. 118–120): the norm is a morphism (565–570) and is surjective (Cor., 598–602); Prop. 2 and its Cor. are at 607–615.
- Prop. 3 (`V⁰ = I·U_L`) and its Cor. (`π₀(V_L) = g/g′`) are at 630–639, and the remark giving `σ ↦ σ(π)/π` is at 616–621.
- serre1960:
  - Definition 2 is at line 162, with the induced and quotient structures at 172–178 (printed p. 8);
  - Prop. 10 is at line 313 (p. 11);
  - Props. 6–7 are at 546 and 575 (pp. 17–18);
  - Prop. 10 with Cor. 1–2 is at 625–636 (p. 19);
  - n° 5.1 Props. 1–2 are at 1246 and 1260 (p. 35).

**4. Graded norms (630–661).**
- serre1961 Prop. 6(a)(b) is at lines 1092–1099: for an arbitrary finite Galois extension, not necessarily abelian, as the target says.
- (22) `V_n = V_L ∩ U_L^(ψ(n))` is at line 1150.
- Prop. 7 and Cor. 1–3 are at 1152–1184.
- Prop. 8(i)–(iii) is at 1187–1192 (p. 135); Cor. 1 is at 1224–1232 (p. 136).
- The README's construction of the first map (multiply by `y ∈ U_E^(ψ(s+1))` with `N(y) = N(x)`) is well defined because `N(U_E^(ψ(s+1))) = U_F^(s+1)`.

**5. Agreement with `Breve E` (1045–1091).**
- brinon-conrad Exercise 1.4.4(2) is at lines 378–381 and (3) at 382–386 (printed p. 10). Part (2) gives a unique extension of the valuation and says `K^un` is not complete unless `k` is algebraically closed. Part (3) gives a residue field that is an algebraic closure of `k`, Krasner's lemma and the equivalence `L ↦ L ⊗ K̂^un`.
- Lemma 13.1.6 and its proof are at lines 8585–8614 (p. 201).
- At the pin, `IntermediateField.le_maximalUnramifiedExtension_iff` is at `Unramified/Maximal.lean` line 298, under the local-field instances on `E`, as the proof uses it.
- ReductiveGroupsPartII §RG2.0.4 on main (lines 852–885) proves `breveIsDiscrete`, `residueField_isAlgClosed` and `isUniformizer_algebraMap`, which are the three properties the agreement matches.

### Adversarial table

Notation:
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`.
- `S3` is `ℚ_3(ζ_3, ∛3)/ℚ_3`, with `G = S_3` and `#G_0..#G_4 = 6, 3, 3, 3, 1`.
- `T6` is `ℚ_2(ζ_3, ∛2)/ℚ_2`, with `G_0 = A_3` and `G_1 = 1`.
- `AS` is `y^p − y = t⁻¹`.
- `I2` is `K = F_2(s)((t))`, `M = K(y, w)` (§3a.2 Check).
- `CpCp` is the §3a.1 monogenicity example.
- `W` is `Frac W(F̄_p)`.

Every value below was recomputed in this review.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `5 + 2 + 2 = 9`; disc `ℚ(ζ_9) = 3^9`, `f = 1` | agrees | none |
| 2 | Hilbert | `S3` | `Σ = 5+2+2+2 = 11`; tower `d(M/L) + e(M/L)·d(L/K) = 1 + 2·5 = 11` with `d(ℚ_3(∛3)) = v(3π²) = 5` | agrees | none |
| 3 | Hilbert | `T6` | `Σ = 3 − 1 = 2`; tame cubic over unramified quadratic `d = e − 1 = 2` | agrees | none |
| 4 | Hilbert, separability dropped | `CpCp`, `p = 2` | `d = v(f₁′(z₁)) + v(f₂′(z₂)) = 1 + 1 = 2`; `Σ = 4 − 1 = 3` | hypothesis needed | none |
| 5 | §3a.1 Check `z^p − t^(p−1)z = s` | `p` | `σz − z = t`, `v = 1`: `#G_0 = p`, `G_1 = 1`, `e = 1`; `d = v(t^(p−1)) = p − 1 = Σ` | Check claims only `#G_0 ≠ e`; consistent | none |
| 6 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 4/4 = 1`, `φ(3) = 8/4 = 2`, `φ(7) = 12/4 = 3` | agrees | none |
| 7 | same, below `−1` | unramified quadratic | `φ(−2) = −(2 + 1) = −3`, `ψ(−2) = −3/2` | stated on `[−1, ∞)` | none |
| 8 | same, trivial action | `C_2` on `ℤ_2` | ratio `2/2 = 1` for all `t`, so `φ = id` | agrees with Check | none |
| 9 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees | none |
| 10 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs lower `G_3 = {1, 5}` | wrong model `G^v = G_v` excluded | none |
| 11 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `ψ_G(1/2) = 1`, `G_1 = C_3 ↦ 1`; `(G/H)^(1/2) = (G/H)_1 = 1` | agrees | none |
| 12 | Herbrand | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ G/H`; `v(−2√2) = 3`, so `(G/H)_2 = G/H = (G/H)^2` | agrees | none |
| 13 | Herbrand | `T6`, `H = A_3`, `v = 0, −1` | `G^0 = A_3 ↦ 1 = (G/H)_0`; `G ↦ G/H` | agrees | none |
| 14 | Herbrand, separability dropped | `I2`, `v = 1/2` | `G^(1/2)H/H` of order `2` vs `(G/H)^(1/2) = 1` | hypothesis needed | none |
| 15 | tower (Lean 130) | `Z9`, `H = C_3`, `u = 5` | `φ_G(5) = 1 + 3/6 = 3/2`; `φ_H(5) = 2 + 1 = 3`; `φ_(G/H)(3) = 3/2` | agrees | none |
| 16 | tower | `Z8`, `H = {1, 7}`, `u = 7` | `φ_G(7) = 3`; `φ_H(7) = 1 + 6/2 = 4`; `φ_(G/H)(4) = 2 + 2/2 = 3` | agrees | none |
| 17 | tower below `−1` | any | both sides `−1 + f_(M/K)(u + 1)` since `f_(M/K) = f_(L/K)·f_(M/L)` | `hu` harmless | none |
| 18 | tower, separability dropped | `I2`, `u = 1` | `1` vs `φ_(L₁/K)(1) = 1/2` | hypothesis needed | none |
| 19 | Hasse–Arf (Lean 151) | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 6`; non-jump `j = 1`: `6 ∤ 3` | agrees | none |
| 20 | Hasse–Arf | `Z8` | `4 ∣ 4`, `4 ∣ 8`; non-jump `4 ∤ 6` | agrees | none |
| 21 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` (upper jump `3/2`) | hypothesis needed | none |
| 22 | Hasse–Arf, infinite residue | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | none |
| 23 | negative control | abstract `C_9` | `9 + 3·4 = 21`, `9 ∤ 21`, `φ(5) = 7/3` | Check consistent | none |
| 24 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees | none |
| 25 | same, non-henselian | `ℚ`, `ℤ_(5)`, `ℚ(i)` | `D_M = 1`, so `G_K^u ⊆ D(O)` | decomposition groups needed | none |
| 26 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | `𝔪 = 0`, every `G_0 = 1`; Mathlib inertia `1` | agrees | none |
| 27 | `_zero` | `W` | `ψ(0) = 0`; inertia `= G_K` | agrees | none |
| 28 | `_zero` | `ℚ_p`, Frobenius lift | `x ↦ x^p` on `F̄_p`: outside both sides | agrees | none |
| 29 | `_zero`, `q`-power step | `F_p((t))`, `x = t^(1/p)` | `(σx − x)^p = σt − t = 0` | step sound | none |
| 30 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | image `G`; `G_(ψ(3/2)) = G_2 = {1, 5}` | agrees | none |
| 31 | same, perfectness dropped | `I2`, `u = 1/2` | image order `≤ 2` vs `#Gal(M/K)^(1/2) = 4` | hypothesis needed | none |
| 32 | `0+` (Lean 239) | `W`, `K(ζ_3)` | `P_K ↦ 1`, `I_K ↦ C_2` | `G^(0+) ⊊ G^0` | none |
| 33 | `0+` | `ℂ((t))` | `G_1 = 1` at every level; both sides `⊥` | agrees | none |
| 34 | `0+` | `AS` over `F̄_p((t))` | `Gal^w = G_1 = C_p` for `0 < w ≤ 1` | agrees | none |
| 35 | subgroup identity (Lean 263), non-normal `H` | `S3`, `H = ⟨(12)⟩`, `u = 0, 1/2, 2` | LHS `H, 1, 1`; RHS `H^0 = H`, `H^(φ_H(1)) = H^(1/2) = H_1 = 1`, `H^(φ_H(6)) = H^3 = H_6 = 1` | agrees | none |
| 36 | same | `H = G`; `H = ⊥` | `φ_G ∘ ψ_G = id`; `⊤ = ⊤` | agrees | none |
| 37 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ_(L/K)(1) = 2`, `H^2 = H = G_2 ∩ H`; `ψ_(M/K)(3/2) = 5`, `G_5 ∩ H = 1 = H^3` | agrees | none |
| 38 | same, `L` not Galois | `S3`, `L = ℚ_3(∛3)` | `ψ_(L/K) = u` on `[0, 3/2]`, `3u − 3` after; `ψ(2) = 3` | agrees | none |
| 39 | same, `u = −1` | any | `G_K ↦ G_L`; `ψ_(L/K)(−1) = −1` | agrees | none |
| 40 | same, `hO′` dropped | `W`, trivial `O′` | `G_L` vs `⊥` | hypothesis needed | none |
| 41 | integral formula | `S3`, `L = ℚ_3(∛3)` | slope `[G : G^t H] = 1` on `(0, 3/2)`, `3` after | agrees | none |
| 42 | integral formula | unramified quadratic | `(1/2)·∫_0^u 2 dt = u = ψ_(L/K)(u)` | agrees | none |
| 43 | §4a.3 base change | `Z9` | `d = 9`, `e = 6`, `d/e = 3/2`, upper jumps `φ(0) = 0`, `φ(2) = 1` | agrees | none |
| 44 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; upper `1, 2` | agrees | none |
| 45 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `ℚ_(p²)/ℚ_p`; `X^e − t` | `t` stays uniformizer; `ℚ_(p²) ⊗ Breve ℚ_p ≅ Breve ℚ_p × Breve ℚ_p`; `#G_0 = e`, `G_1 = 1` | agrees | none |
| 46 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ G^ab = C_p` | agrees | none |
| 47 | sampled: graded norms | `AS`; tame `C_e`; `F_3` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t` exactly; kernel `μ_e`; `λ³ − 2λ ≡ −λ` on `F_3`, kernel `{0, ±√2}` | agrees | none |
| 48 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; unbounded-degree coefficients in `K′ ∖ K^ur`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| 49 | Ownership of the local-field `G_K^u` (README 109–117) | `Z8` at depths `0..3`; #1215 ClassFieldTheory 187–191, 1234 | this README: `(ℤ/8)ˣ, (ℤ/8)ˣ, {1,5}, {1}`; #1215: the same four groups for `localAbsoluteUpperRamificationGroup` | two owners | R01 |
| 50 | "ClassFieldTheory consumes §4a.1" (1136–1138) | main; #1411; #1215 | main: 0 citations; #1411 line 179: owned here; #1215 line 191: no input | contested | R01 |
| 51 | `K′` at line 354 under Conventions | `ℚ_3 ⊂ ℚ_3(ζ_9)` | `K′ = Breve ℚ_3` has residue field `F̄_3 ⊄ F_3` | malformed | R02 |
| 52 | `K′ = Frac A′` (674) vs Conventions | `k = F_2(s)` | `s^(1/2) ∈ k̄ ∖ k^sep` | different fields | R02 |
| 53 | Description *Dependencies* | grep of README | `ProfiniteCohomology` 0 hits; §F.3a consumed 0 times (line 95) | contradicts | R03 |
| 54 | Description: #879 cites §§3a–4a | `roadmaps grep` | 0 lines of FiniteFlatGroupsAndIntegralPadicHodgeTheory; its line 126 cites PadicPeriodRings §0.3 | false | R03 |

### Lean form and signatures

- **Signatures.** I put `#check @name` for all 13 declarations in one scratch file (the 9 theorems plus `herbrandFun`, `inverseHerbrandFun`, `upperRamificationGroup` and `absoluteUpperRamificationGroup`) and elaborated it once. Every elaborated type equals the type in `signatures.md` up to instance-binder names (13/13), and none lost a binder. Each was compared with its README statement:
  - Hilbert's formula, Herbrand, the tower and Hasse–Arf carry `IsLocalHom` and residue separability; the README discharges the extra `IsLocalRing (FixedPoints.subalgebra A B H)` hypothesis of Herbrand and the tower at line 445.
  - §4a.1–4a.2 carry `IsDiscreteValuationRing`, `IsAdicComplete` and `PerfectField` on `O ∩ K`, as in README lines 751–754 and 923–929.
- **Padding probe.** A copy with each `sorry` replaced by `first | rfl | (simp; done) | infer_instance | (simp_all; done) | (aesop; done)` left all 9 theorems open. Nothing is padding.
- **Headlines.**
  - The README's headlines (summary lines 3–17) are Hilbert, Herbrand with the upper numbering, the tower, Hasse–Arf, `G_K^u` with its finite projections, `0` and `0+`, `ψ_(L/K)` with the open-subgroup identity, and §4a.3. All are stated in `Suggested.lean`, except §4a.3, which the docstring (lines 41–44) names as not statable: no general `K^ur` exists at the pins.
  - The Hasse–Arf statement is the lower-numbering form that Serre 1961 n° 3.5 Cor. 1 states (lines 1224–1225), not a stand-in.
- **File form.** It has one module docstring; the imports are `Mathlib` and `TauCeti.RingTheory.LocalRing.RamificationGroup` only; it uses `theorem` throughout, with no `set_option`, no sorry'd data and no process words.

### Library declarations opened at the pins (16 locations in Mathlib, 49 in Tau Ceti)

**Mathlib:**
- `RingTheory/RamificationInertia/Basic.lean` 82 (`sum_ramification_inertia_eq_card`, under `IsGaloisGroup`);
- `RingTheory/IsGaloisGroup/Defs.lean` 53–56 (fields `faithful`, `commutes`, `isInvariant`, as the README's contract says);
- `DedekindDomain/Different.lean` 481, 638;
- `FieldTheory/AbsoluteGaloisGroup.lean` 52–59 (`mapOfAlgebra`: binders `Algebra K L`, `Algebra (AC K) (AC L)` and `IsScalarTower K (AC K) (AC L)` only);
- `Valuation/RamificationGroup.lean` 29, 39, 49;
- `IsAlgClosed/Basic.lean` 236;
- `Galois/Profinite.lean` 148;
- `Normed/Field/Krasner.lean` 73;
- `Galois/Basic.lean` 457;
- `GaloisClosure.lean` 35;
- `IntermediateField/Basic.lean` 903;
- `Invariant/Basic.lean` 76, 84.

**Tau Ceti:**
- `RingTheory/LocalRing/RamificationGroup.lean` 118 (definition `Ideal.inertia G (𝔪^(i+1).toNat)`), 145, 166, 183, 220, 233, 260, 325, 351, 444, 469, 520, 561, 722 (`G_⌈u⌉`), 750;
- `DiscreteValuationRing/Monogenic.lean` 70;
- `Galois/AbsoluteGaloisGroup/Basic.lean` 227, 374;
- `Map.lean` 187;
- `LocalField/Herbrand/Basic.lean` 104–106 (local-field binders), 251, 258, 262, 421, 511, 517;
- `Herbrand/Tower.lean` 226, `UpperQuotient.lean` 98, `Jump.lean` 42;
- `HasseArf/Abelian.lean` 44–50 (`IsAbelianGalois`);
- `RamificationGroup.lean` 86, 99;
- `Different/Hilbert.lean` 93;
- `UnitFiltration/RamificationGroup.lean` 481, 566;
- `Monogenic.lean` 54;
- `FiniteExtension/IntermediateField.lean` 81, 97;
- `AlgebraicExtension/Basic.lean` 368;
- `Unramified/Maximal.lean` 97, 298;
- `Inertia/Basic.lean` 112, 164;
- `WildInertia.lean` 251, 518–520 (`(p : ℕ) [CharP 𝓀[K] p]`);
- `Tame/Quotient.lean` 152;
- `RamificationIndex.lean` 114, `InertiaDegree.lean` 75;
- `ProP/Basic.lean` 68.

None of them is a general Herbrand function, upper numbering, absolute upper filtration or non-Galois `ψ_(L/K)`: grep of both libraries finds only the local-field Herbrand objects and the cohomological `herbrandQuotient`. That justifies this roadmap's definitions.

### Cross-roadmap citations resolved on main (2083308) and at open heads

- **Suppliers on main (9):**
  - `Completed/LocalFieldsRamification`, `Completed/ProfiniteProPGroups` and `Completed/LocalGaloisGroups`;
  - ReductiveGroups `### Layer 3` (line 234);
  - SchemeAndStackFoundations `### 0.24` (1565);
  - AdicSpacesPartII `### R0.19.9` (7793);
  - ReductiveGroupsPartII `### RG2.0.4` (852);
  - EtaleCohomologyFoundations `## F.3a` (776);
  - `TauCetiRoadmap/ClassFieldTheory`.
- **Main since the last review:** main moved bbbde05 → 2083308. The only changes are the PROGRESS and STATUS files of ProfiniteProPGroups and GroebnerGeometry; no supplier README changed.
- **Consumers.** `roadmaps grep` finds this roadmap cited by #1713 (21 lines), #856 (18), #940 (13), #1411 (12), #617 and #1215. #1795 and #1812 cite it by pull-request number (their defect). The README's six named consumers match.
  - #1713's citation of `TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields.subgroupOf_upperRamificationGroup` resolves to `Suggested.lean` line 263.
- **Ownership by object:**
  - #617's LocalFieldsRamification (its line 39) defers general Hasse–Arf to §3a.3.
  - PadicPeriodRings §0.3 consumes §§3a–4a without building them.
  - #1713 consumes §4a.2.
  - FunctionFieldArithmetic (#1474) and its Part II (#1831) claim no absolute filtration.
  - #1002 cites "LocalFieldsRamification Layers 3–4" for this content. That is its own citation drift, not an ownership claim.
  - #1215 is the only conflict (R01).
- **Overlaps.** `roadmaps overlaps` lists no pull request that changes this folder and no dropped id.

## Not verifiable

- `serre-local-fields` is settled as uncertified in the manifest; its locators (II §2 Prop. 3; III §6 Prop. 12; IV §1 Props. 1, 2, 4; IV §3 Props. 14–15 and Exercise 3; V §7 Theorem 1) are cited without the text.
- In the serre1961 text layer (line 1091), n° 3.4 has the heading "Extensions abéliennes", the same as n° 3.5, although its Proposition 6 treats arbitrary finite Galois extensions. Without the page image I cannot tell whether this is a printed misprint or an OCR artefact, so it is not entered below.
- PadicPeriodRings, FieldOfNorms, FilteredLocalGaloisGroups, ClassFieldTheory at #1411 and FiniteFlatGroupsAndIntegralPadicHodgeTheory have no checkout in this brief; they were read at their indexed heads through `roadmaps show` and `roadmaps grep`.

## Source issues

- **Misprint** in brinon-conrad at Lemma 13.1.6, proof, printed p. 201: the source says the reciprocity morphism "carries maps" the unit filtration onto the ramification filtration, two verbs in a row; it should be one verb ("carries" or "maps"); affects nothing.
