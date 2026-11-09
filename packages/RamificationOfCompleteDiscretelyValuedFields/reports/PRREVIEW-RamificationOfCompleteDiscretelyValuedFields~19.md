# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at c948d04)

**Verdict:** needs changes

This is an incremental re-review of the 69 lines that changed in the README since 79f03ba. `Suggested.lean` is unchanged, and nothing outside the folder changed.

The README now gives the absolute upper filtration of a nonarchimedean local field to ClassFieldTheory Layer 7, as #1215 has it, and it repairs the `K′` clash. Three problems remain:

- The description and #1411 still route that object through §4a.1 (R01, previously R01, partly repaired).
- The new ownership makes the downstream-consumers paragraph wrong (R02).
- The rewritten summary sentence overclaims (R03).
- The description's supplier list is still unrepaired (R04, previously R03).

Mechanical checks at this head:
- **Gate:** re-run; every check passes (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`).
- **Dependency check:** `depcheck: 239 roadmaps, 2354 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` exits 0. The only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Declared gaps:** none (no `design/plan.json`).

## R01 (P2) — #1411 and the description still hand the local-field absolute filtration back to §4a.1

**Location.**
- `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md` lines 109–112: "the absolute upper filtration taken directly from the completed roadmap's finite upper groups … is ClassFieldTheory Layer 7's; ClassFieldTheory precedes this roadmap and takes no input from it."
- The description, *Merge order*: "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411". *Why*: "the ClassFieldTheory amendment #1411 consumes the absolute upper filtration".

**Claim.**
- This head made edits 1–3 of the previous R01 in the README, and they agree with #1215 at b9e8822: its `TauCetiRoadmap/ClassFieldTheory/README.md` lines 187–191 give Layer 7 the local-field filtration and take no input from this roadmap.
- Edit 4 was not made, because the description is unchanged:
  - It does not name #1215, which is the only revision that defines the Layer 7 object cited at line 112. ClassFieldTheory on main (19d2a1c) has no absolute upper filtration: its Layer 7, at line 1312, is the absolute Artin map.
  - It still orders #1411 after this pull request as a consumer of §4a.1.
- #1411 at 656f837 says the opposite of line 112:
  - its ClassFieldTheory README lines 136–139 make this roadmap the owner of `G_K^u` "on nonarchimedean local fields as on every complete discretely valued field";
  - line 507 lists §4a.1 as the supplier of `G_K^u`;
  - lines 538–547 consume `absoluteUpperRamificationGroup` and its local-field description for `closure_map_artinMap_unitFiltration`.
- So this README and #1411 each hand the local-field object to the other. If the two merge in the order the description plans, neither owns it, and line 112's "takes no input from it" is false.

**Witness.**
- README line 112: "takes no input from it".
- #1411 ClassFieldTheory line 138–139: "Layer 7 takes them, with their finite projections and their term at `0`".
- `grep -c "absolute upper" TauCetiRoadmap/ClassFieldTheory/README.md` on main returns `0`.

**Repair.** README lines 109–121 stay as they are.
- In the description, replace the *Merge order* paragraph with: "ClassFieldTheory's revision #1215, which defines the absolute upper filtration of a nonarchimedean local field in its Layer 7, precedes this pull request; the scope section names it as that object's owner. #1411 is rebased on #1215 and takes the local-field `G_K^u` from ClassFieldTheory Layer 7, citing §4a.1 only for the general filtration and its agreement. #940 and #856 cite §§3a.1–3a.3 and §§4a.1–4a.3 and merge after this pull request."
- In *Why*, replace "and the ClassFieldTheory amendment #1411 consumes the absolute upper filtration" with "and ClassFieldTheory Layer 7's local-field filtration agrees with §4a.1's".
- In #1411 (the same author's pull request), drop the local-field ownership clause of lines 136–139 and the row at line 507.
- If the operators keep #1411's direction instead, restore §4a.1 as the owner in README lines 109–121; the repair then moves to #1215.

**Tested.**
- After the description edit, the pull request names the only revision that defines the cited Layer 7 object.
- No text in it says that ClassFieldTheory consumes §4a.1's local-field object.
- Line 112 then holds on main, at #1215, and at a #1411 that drops lines 136–139 and 507.

## R02 (P3) — The downstream paragraph still sends local-field users of `G_K^u` to §4a.1

**Location.** README lines 1146–1149: "FilteredLocalGaloisGroups and FieldOfNorms consume §§4a.1–4a.2 on nonarchimedean local fields (the absolute upper filtration with its finite projections and inertia, `ψ_(L/K)` with its tower law, the open-subgroup identity …".

**Claim.**
- Lines 109–112 now give the absolute upper filtration of a nonarchimedean local field to ClassFieldTheory Layer 7.
- The rule at line 120–121 was narrowed from "either object … cites §4a.1 or §4a.2" to `ψ_(L/K)` and §4a.2.
- This paragraph was not updated. It still lists two roadmaps that take that local-field object from §4a.1. Both work only over nonarchimedean local fields:
  - FilteredLocalGaloisGroups at #1795: README line 133, and §4a.1 cited for `G_K^u` at lines 50–53 and 94;
  - FieldOfNorms at #1812: README line 84, and §4a.1 cited at lines 70–72 and 115.
- So the README names two owners of the same object for these consumers. The previous review's "Tested" step missed this paragraph.

**Witness.** README line 111–112 ("is ClassFieldTheory Layer 7's") against line 1147 ("consume §§4a.1–4a.2 on nonarchimedean local fields (the absolute upper filtration …").

**Repair.** Replace lines 1146–1149, from "FilteredLocalGaloisGroups and FieldOfNorms consume" to "and the integral formula)", with: "FilteredLocalGaloisGroups and FieldOfNorms consume §4a.2 on nonarchimedean local fields (`ψ_(L/K)` with its tower law, the open-subgroup identity `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` and the integral formula), reading `G_K^u` as ClassFieldTheory Layer 7's absolute upper filtration through §4a.1's fourth-bullet agreement)". Keep the clause that follows ("the first for … fields of norms"). Those two roadmaps' own citations are a matter for their own reviews.

**Tested.**
- After the edit, the README routes no local-field consumer of `G_K^u` to §4a.1.
- On `ℚ_2(ζ_8)/ℚ_2`, the images at depths `0, 1, 2, 3` are `(ℤ/8)ˣ, (ℤ/8)ˣ, {1, 5}, {1}`. They become ClassFieldTheory's values (#1215 line 1234), and §4a.1's Check at line 869 becomes the agreement.

## R03 (P3) — The rewritten summary says every finite-level object on a local field is the completed roadmap's

**Location.** README lines 16–17: "On a nonarchimedean local field each finite-level object is the completed roadmap's, and the agreement is a target here."

**Claim.**
- Lines 116–121, rewritten in the same commit, make `ψ_(L/K)` of a finite separable, non-Galois extension of nonarchimedean local fields this roadmap's (§4a.2), because the completed roadmap's Herbrand functions assume `IsGalois K L`.
- Lines 58–59 give `ψ_(L/K)` "its finite-level form at every finite Galois `M ⊇ L`".
- The summary contradicts both.

**Witness.**
- At the pinned Tau Ceti, `herbrandOrderIso`, `herbrand` and `inverseHerbrand` are declared under `[IsGalois K L]`, in `TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean` lines 251 and 255–262. The raw integral at line 235 is `private`.
- For `L = ℚ_3(∛3)` over `ℚ_3`, the completed roadmap has no `ψ_(L/K)`, while §4a.2 gives `ψ_(L/K)(2) = 3`.

**Repair.** Replace the sentence with: "On a nonarchimedean local field each object of a finite Galois extension is the completed roadmap's and the absolute upper filtration is ClassFieldTheory's, and the agreements are targets here; `ψ_(L/K)` of a finite separable, non-Galois extension is this roadmap's there."

**Tested.** The edited sentence matches lines 109–121, and the `ℚ_3(∛3)` function is then claimed only by §4a.2.

## R04 (P3) — The description still names suppliers and a consumer the README does not have

**Location.** The pull-request description:
- *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)".
- *Why* and *Merge order*: "FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) consume this package" and "#940, #856 and #879 cite its §§3a.1–3a.3 and §§4a.1–4a.3".

**Claim.** The description is unchanged since the previous review, whose R03 this is.
- README line 95 says this roadmap "consumes nothing from that section" (§F.3a).
- The README never names ProfiniteCohomology.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory does not cite this roadmap. README lines 1151–1152 send integral `p`-adic Hodge theory through PadicPeriodRings.

**Witness.**
- `grep -c ProfiniteCohomology README.md` returns `0`.
- `roadmaps grep RamificationOfCompleteDiscretelyValuedFields` returns 65 lines, none of them from FiniteFlatGroupsAndIntegralPadicHodgeTheory.

**Repair.**
- Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. EtaleCohomologyFoundations §F.3a and ClassFieldTheory Layer 7 (#1215) are named in the scope as owners and are not suppliers."
- In *Why* and *Merge order*, drop #879 and say that integral `p`-adic Hodge theory reaches the package through PadicPeriodRings.

**Tested.**
- Each named section resolves on main at 19d2a1c: ReductiveGroups line 234, SchemeAndStackFoundations line 1565, AdicSpacesPartII line 7793 and ReductiveGroupsPartII line 852.
- `Completed/LocalFieldsRamification` and `Completed/ProfiniteProPGroups` both resolve.
- The edited text then names exactly the suppliers of README lines 150–283 and 1121–1129.

## Previous findings

- R01 — partly repaired: README 109–121 now cede the local-field filtration ("is ClassFieldTheory Layer 7's … takes no input from it"). The description still reads "#1411 consumes its §4a.1 absolute filtration" and omits #1215. Carried as R01; the change also makes lines 1146–1149 wrong (R02).
- R02 — repaired: line 360–361 now reads "`H_i = H ∩ G_i` for every subgroup `H` of `G`, acting on `B` by restriction"; §3a.2 writes `L^H`; line 681 reads "`L̃ = K̃(π_L)` … `K̃ = Frac A′`". `K′` is now used only in the Conventions' Layer 4a sense.
- R03 — not repaired: the description's *Dependencies* still reads "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)", and *Why* still names #879. Carried as R04. No repair report marks it not actionable.

## Verified sound

### Changed passages (7 hunks, all read in full)

**Summary, lines 16–20.**
- "Serre's geometric local class field theory" matches PadicPeriodRings' ownership of geometric reciprocity at line 102–104.
- The overclaim in the summary is R03.

**Scope, lines 109–121.**
- The agreement claim holds. §4a.1's fourth bullet (lines 771–775) proves that the image of `G_K^u` at every finite Galois `M` is `TauCeti.LocalFieldsRamification.upperRamificationGroup K M u` for `u ≥ −1`, so `G_K^u` is the set ClassFieldTheory at #1215 defines (its README 1188–1199 and `Suggested.lean` 109–118).
- The `IsGalois` reason given for owning `ψ_(L/K)` holds at the pin (R03 witness).
- ClassFieldTheory is on main, so "precedes" is right.

**Conventions, lines 143–148.**
- Over `F_p(s)((t))`:
  - `K(s^(1/p))` has `e = 1`, `f = p`.
  - For `y = (s + t)^(1/p)` we have `v(y) = 0` and `ȳ^p = s`, so `f = p` and `e = 1`.
  - `y − s^(1/p) = t^(1/p)` has valuation `1/p`, so the compositum has `e ≥ p`.
- Over a perfect residue field, every finite `L/K` with `e = 1` is separable. A purely inseparable top step `L/L_s` of degree `p^m` has purely inseparable residue extension over the perfect field `l_s`, so `f = 1` and `e = p^m`, which forces `m = 0`.
- `K^ur`, `I_K`, `P_K`, `K′` and `Breve` occur nowhere in lines 306–732 (Layer 3a).

**§3a.1, lines 360–361.**
- `TauCeti.IsLocalRing.subgroupOf_ramificationGroup (H : Subgroup G) (i : ℤ)` at `TauCeti/RingTheory/LocalRing/RamificationGroup.lean` lines 561–563 states `(G_i).subgroupOf H = ramificationGroup H S i` for every subgroup, with `H` acting by restriction.

**§3a.2, lines 447–460 and 489–494.**
- The inheritance of residue separability by both steps of `K ⊆ F ⊆ L` holds, since `k ⊆ k_F ⊆ l`.
- The class formula `(1/e(L/L^H)) Σ` and Herbrand's lemma `(G/H)_(φ_(L/L^H)(u)) = G_u H/H` agree with *Local Fields* IV §1 Prop. 3 and IV §3 Lemma 5. They are recomputed in rows 60–61 below.

**§3a.3, line 681.**
- `K̃ = Frac A′` has residue field an algebraic closure of `k`, and no other symbol in the README collides with it.

**Downstream, lines 1131–1152.**
- Removing the ClassFieldTheory sentence is consistent with line 112.
- The FilteredLocalGaloisGroups clause is R02.

### Seeded sample

Where it falls in the changed passages:
- **Residue enlargement and preservation of ramification.** The changed proof step at line 681 uses it.
  - ega3 (10.3.1) is at lines 637–639, on PDF page 17, which is printed p. 20; the header at line 730 shows the offset of 3.
  - (10.3.1.5) and the completion remark are at lines 733–737 (printed p. 23).
  - The proposition gives a flat local map with any prescribed residue extension and `B/𝔪_A B` the given field, as the target and line 678 state.
- **Agreement with `Breve E` on a local field.** It depends on the changed `K′` convention.
  - brinon-conrad Exercise 1.4.4(2) is at lines 378–381 and (3) at lines 382–386, printed p. 10. Both concern `p`-adic fields, whose residue field is perfect, which matches the Conventions' new restriction of `K′` to Layer 4a.

Untouched by the diff, carried from the previous report (rows 44–48), which checked them at the same locators:
- the perfect-residue Herbrand package;
- proalgebraic units and norm-kernel components;
- graded norms and filtered norm-kernel components.

### Adversarial table

Notation as in the previous report:
- `Z8 = ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`;
- `Z9 = ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`;
- `S3 = ℚ_3(ζ_3, ∛3)/ℚ_3`, with `#G_0..#G_4 = 6, 3, 3, 3, 1`;
- `T6 = ℚ_2(ζ_3, ∛2)/ℚ_2`;
- `AS` is `y^p − y = t⁻¹`;
- `I2` is `F_2(s)((t))` with `M = K(y, w)`;
- `W = Frac W(F̄_p)`.

Rows 1–48 concern statements the diff leaves untouched. They are carried from the previous report (r18) with its values; rows 49–66 are this review's.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `5 + 2 + 2 = 9`; disc `ℚ(ζ_9) = 3^9` | agrees (r18) | none |
| 2 | Hilbert | `S3` | `Σ = 11`; tower `1 + 2·5 = 11` | agrees (r18) | none |
| 3 | Hilbert | `T6` | `Σ = 3 − 1 = 2 = e − 1` | agrees (r18) | none |
| 4 | Hilbert, separability dropped | `CpCp`, `p = 2` | `d = 2`, `Σ = 3` | hypothesis needed (r18) | none |
| 5 | §3a.1 Check `z^p − t^(p−1)z = s` | `p` | `#G_0 = p`, `e = 1`, `d = p − 1 = Σ` | consistent (r18) | none |
| 6 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees (r18) | none |
| 7 | same, below `−1` | unramified quadratic | `φ(−2) = −3`, `ψ(−2) = −3/2` | stated on `[−1, ∞)` (r18) | none |
| 8 | same, trivial action | `C_2` on `ℤ_2` | ratio `1`, `φ = id` | agrees (r18) | none |
| 9 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees (r18) | none |
| 10 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs `G_3 = {1, 5}` | wrong model excluded (r18) | none |
| 11 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `ψ_G(1/2) = 1`; `(G/H)^(1/2) = 1` | agrees (r18) | none |
| 12 | Herbrand | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ G/H = (G/H)^2` | agrees (r18) | none |
| 13 | Herbrand | `T6`, `H = A_3`, `v = 0, −1` | `A_3 ↦ 1`; `G ↦ G/H` | agrees (r18) | none |
| 14 | Herbrand, separability dropped | `I2`, `v = 1/2` | order `2` vs `1` | hypothesis needed (r18) | none |
| 15 | tower (Lean 130) | `Z9`, `H = C_3`, `u = 5` | `φ_G(5) = 3/2`; `φ_(G/H)(φ_H(5)) = φ_(G/H)(3) = 3/2` | agrees (r18) | none |
| 16 | tower | `Z8`, `H = {1, 7}`, `u = 7` | `φ_G(7) = 3`; `φ_(G/H)(4) = 3` | agrees (r18) | none |
| 17 | tower below `−1` | any | both `−1 + f(u + 1)` | harmless (r18) | none |
| 18 | tower, separability dropped | `I2`, `u = 1` | `1` vs `1/2` | hypothesis needed (r18) | none |
| 19 | Hasse–Arf (Lean 151) | `Z9` | `6 ∣ 0`, `6 ∣ 6`; non-jump `6 ∤ 3` | agrees (r18) | none |
| 20 | Hasse–Arf | `Z8` | `4 ∣ 4`, `4 ∣ 8`; non-jump `4 ∤ 6` | agrees (r18) | none |
| 21 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed (r18) | none |
| 22 | Hasse–Arf, infinite residue | `AS` over `F̄_p((t))` | `p ∣ p` | agrees (r18) | none |
| 23 | negative control | abstract `C_9` | `9 ∤ 21`, `φ(5) = 7/3` | consistent (r18) | none |
| 24 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees (r18) | none |
| 25 | same, non-henselian | `ℚ`, `ℤ_(5)`, `ℚ(i)` | `D_M = 1` | decomposition groups needed (r18) | none |
| 26 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | `𝔪 = 0`, `G_0 = 1` = inertia | agrees (r18) | none |
| 27 | `_zero` | `W` | `ψ(0) = 0`; inertia `= G_K` | agrees (r18) | none |
| 28 | `_zero` | `ℚ_p`, Frobenius lift | outside both sides | agrees (r18) | none |
| 29 | `_zero`, `q`-power step | `F_p((t))`, `t^(1/p)` | `(σx − x)^p = 0` | sound (r18) | none |
| 30 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G`; `G_2 = {1, 5}` | agrees (r18) | none |
| 31 | same, perfectness dropped | `I2`, `u = 1/2` | `≤ 2` vs `4` | hypothesis needed (r18) | none |
| 32 | `0+` (Lean 239) | `W`, `K(ζ_3)` | `P_K ↦ 1`, `I_K ↦ C_2` | strict inclusion (r18) | none |
| 33 | `0+` | `ℂ((t))` | `G_1 = 1`; both `⊥` | agrees (r18) | none |
| 34 | `0+` | `AS` over `F̄_p((t))` | `G_1 = C_p` for `0 < w ≤ 1` | agrees (r18) | none |
| 35 | subgroup identity (Lean 263) | `S3`, `H = ⟨(12)⟩`, `u = 0, 1/2, 2` | LHS `H, 1, 1` = RHS `H, 1, 1` | agrees (r18) | none |
| 36 | same | `H = G`; `H = ⊥` | `φ_G ∘ ψ_G = id`; `⊤ = ⊤` | agrees (r18) | none |
| 37 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ(1) = 2`, `H^2 = H`; `ψ(3/2) = 5`, `1 = H^3` | agrees (r18) | none |
| 38 | same, `L` not Galois | `L = ℚ_3(∛3)` | `ψ_(L/K) = u` on `[0, 3/2]`, `3u − 3` after; `ψ(2) = 3` | agrees (r18) | none |
| 39 | same, `u = −1` | any | `G_K ↦ G_L` | agrees (r18) | none |
| 40 | same, `hO′` dropped | `W`, trivial `O′` | `G_L` vs `⊥` | hypothesis needed (r18) | none |
| 41 | integral formula | `L = ℚ_3(∛3)` | slopes `1`, then `3` | agrees (r18) | none |
| 42 | integral formula | unramified quadratic | `(1/2)·∫_0^u 2 dt = u` | agrees (r18) | none |
| 43 | §4a.3 base change | `Z9` | `d/e = 9/6 = 3/2`; upper jumps `0, 1` | agrees (r18) | none |
| 44 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; upper `1, 2` | agrees (r18) | none |
| 45 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `ℚ_(p²)`; `X^e − t` | uniformizer kept; splits; `#G_0 = e` | agrees (r18) | none |
| 46 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p` | agrees (r18) | none |
| 47 | sampled: graded norms | `AS`; tame `C_e`; `F_3` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`; kernel `μ_e`; `{0, ±√2}` | agrees (r18) | none |
| 48 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; unbounded degree; `v = 1/2 ∉ ℤ` | agrees (r18) | none |
| 49 | ownership of local-field `G_K^u` (README 109–112) | main 19d2a1c; #1215 b9e8822; #1411 656f837 | main: 0 hits for "absolute upper"; #1215 187–191: Layer 7 owns; #1411 136–139, 507: §4a.1 owns | handed back by #1411 | R01 |
| 50 | "takes no input from it" (112) | the same three texts | main: 0 citations; #1215 190–191: none; #1411 538–547: consumes `absoluteUpperRamificationGroup` | false at #1411 | R01 |
| 51 | agreement claimed at 113–116 | `Z8`, depths `0..3` | §4a.1 Check (869): `(ℤ/8)ˣ, (ℤ/8)ˣ, {1,5}, {1}`; #1215 line 1234: same four | agrees | none |
| 52 | `IsGalois` reason (116–117) | pin `Herbrand/Basic.lean` | `herbrandOrderIso` (251) and `herbrand`/`inverseHerbrand` (255–262) under `[IsGalois K L]`; raw function private (235) | agrees | none |
| 53 | Conventions example (146–148) | `F_p(s)((t))` | `e(K(s^(1/p))) = 1`; `e(K((s+t)^(1/p))) = 1` (`ȳ^p = s`); difference `t^(1/p)`, `v = 1/p` | agrees | none |
| 54 | `K^ur` over perfect `k` | `F̄_p((t))`, `K(t^(1/p))` | `e = p`, `f = 1`; `e = 1` forces separable | agrees | none |
| 55 | "four objects used only in Layer 4a" | grep lines 306–732 | 0 occurrences of `K^ur`, `I_K`, `P_K`, `K′` | agrees | none |
| 56 | `K′` at old line 354 (r18 row 51) | `ℚ_3 ⊂ ℚ_3(ζ_9)` | line 360 now quantifies over subgroups of `G`; no `K′` | repaired | none |
| 57 | `K̃ = Frac A′` (681) vs Conventions | `k = F_2(s)` | `s^(1/2)` in the residue field of `A′`; `K′` not defined for imperfect `k` | repaired | none |
| 58 | `H_i = H ∩ G_i` for every subgroup (360–361) | `S3`, `H = ⟨(12)⟩` (not normal) | `L/ℚ_3(∛3)` tame quadratic: `H_0 = H`, `H_1 = 1`; `H ∩ G_0 = H`, `H ∩ C_3 = 1` | agrees | none |
| 59 | separability inherited (447–448) | `k ⊆ k_F ⊆ l`; `I2` | both steps separable when `l/k` is; `I2` fails at the top step | agrees | none |
| 60 | class formula (492) | `Z8`, `H = {1, 7}`, `L^H = ℚ_2(√2)` | `i_G(5) = 4`, `i_G(3) = 2`, `(4 + 2)/2 = 3`; `v(−2√2) = 3` | agrees | none |
| 61 | Herbrand's lemma (497) | `Z8`, `H = {1, 7}`, `u = 1, 3, 4` | `φ_H(1) = 1`, `φ_H(3) = 2`, `φ_H(4) = 5/2`; `(G/H)_1 = (G/H)_2 = G/H`, `(G/H)_3 = 1` = `G_uH/H` | agrees | none |
| 62 | summary (16–17) | `L = ℚ_3(∛3)` | completed roadmap: no `ψ` (needs `IsGalois`); §4a.2: `ψ(2) = 3` | contradicts 116–121 | R03 |
| 63 | downstream 1146–1149 | #1795 133, 50–53, 94; #1812 84, 70–72, 115 | both are local-field-only and take `G_K^u` from §4a.1; README 111 gives it to ClassFieldTheory | two owners | R02 |
| 64 | description *Dependencies* | grep of README | `ProfiniteCohomology` 0 hits; §F.3a consumed 0 times (line 95) | contradicts | R04 |
| 65 | description: #879 cites §§3a–4a | `roadmaps grep` | 0 of 65 lines from FiniteFlatGroupsAndIntegralPadicHodgeTheory | false | R04 |
| 66 | description: #1411 consumes §4a.1 | README 112 | "takes no input from it" | contradicts | R01 |

### Lean form and signatures

- **Signatures.** `Suggested.lean` is byte-identical to 79f03ba. I put `#check @name` for all 13 declarations in one scratch copy and elaborated it once (exit 0). Every elaborated type matches `signatures.md` after whitespace normalisation (13/13), and none lost a binder. The three Layer 4a theorems other than `absoluteUpperRamificationGroup_zero` carry `IsDiscreteValuationRing`, `IsAdicComplete` and `PerfectField` on `O ∩ K`, as README 758–760 says.
- **Padding probe.** A copy with each `sorry` replaced by `first | rfl | (simp; done) | infer_instance | (simp_all; done) | (aesop; done)` fails at all 9 theorems (errors at lines 71, 121, 140, 162, 201, 228, 252, 267 and 313 of the copy). Nothing is padding.
- **Headlines.** These are unchanged from the previous report: every headline is stated except §4a.3, which the docstring (lines 41–44) names as not statable.

### Library declarations opened at the pins (this round)

All in Tau Ceti:
- `TauCeti/RingTheory/LocalRing/RamificationGroup.lean` 561–563 (`subgroupOf_ramificationGroup`, every `H : Subgroup G`) and 567–575;
- `TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean` 104–107 (local-field binders, no `IsGalois`), 235 (private raw function), 251 (`herbrandOrderIso [IsGalois K L]`), 255–262 and 511 (`psiNat`);
- `TauCeti/NumberTheory/LocalField/RamificationGroup.lean` 99 and 278.

The previous report's 16 Mathlib and 49 Tau Ceti locations are unaffected, because the pins are unchanged.

### Cross-roadmap citations resolved

- **Main** moved from 2083308 to 19d2a1c. The change is six PROGRESS/STATUS files of AbhyankarLemma, Neuromanifolds and PseudoholomorphicCurveAnalysis only, so no supplier README changed.
- **ClassFieldTheory:**
  - main: Layer 7 at line 1312; no absolute upper filtration.
  - #1215 at b9e8822: 187–191, 1188–1234, `Suggested.lean` 109.
  - #1411 at 656f837: 95, 136–139, 507, 538–547.
- **Consumers.** `roadmaps grep` returns 65 lines: #1713 (21), #856 (18), #940 (13), #1411 (9), #1410 (2), #617 (1) and #1215 (1). #1795 and #1812 cite this roadmap by pull-request number.
- **Overlap and citation tools:** `roadmaps overlaps` finds no pull request that changes this folder, no dropped id, and no id only an open revision defines. Its id check does not see that the Layer 7 content exists only at #1215 (R01). `roadmaps resolve` finds nothing unresolved.
- **Remark on untouched text:** none.

## Not verifiable

- `serre-local-fields` is settled as uncertified, and its locators are cited without the text.
- #1411, #1795 and #1812 have no checkout in this brief. I read them at their indexed heads through `roadmaps show` and `roadmaps grep`; line numbers are those of the files.
- The `n° 3.4` heading in the serre1961 text layer (line 1091) may be a printed misprint or an OCR artefact. This is unchanged from the previous report.

## Source issues

- none
