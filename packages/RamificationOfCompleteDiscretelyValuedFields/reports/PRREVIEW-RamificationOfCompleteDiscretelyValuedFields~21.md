# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 20db688)

**Verdict:** needs changes

This is an incremental re-review of the 50 README lines that changed since b6dc85b. They fall in three hunks:
- the summary, lines 16–21;
- the ownership paragraph of the scope section, lines 113–126;
- the downstream-consumers paragraph, lines 1151–1159.

`Suggested.lean` is byte-identical to b6dc85b, and nothing outside the folder changed.

This head settles the ownership of the local-field absolute upper filtration the second way the previous R01 allowed: §4a.1 is the owner, and ClassFieldTheory consumes it, as #1411 assumes. The dependency check closes that route. Run on #1411's ClassFieldTheory README, it reports the citation of this roadmap as UPWARD, because ClassFieldTheory is on main and supplies two of this roadmap's suppliers. #1215 still defines the same object. R01 is therefore not repaired, and the repair below is the only settlement the order allows. R02, which is about the description, is unchanged.

Mechanical checks at this head:
- **Gate:** re-run; every check passes (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`).
- **Dependency check of this README:** `depcheck: 239 roadmaps, 2322 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. It passes because the reversed edge is written as a downstream claim, not as a supplier citation (see R01).
- **Elaboration:** `lake env lean` exits 0. The only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Declared gaps:** none (no `design/plan.json`).

## R01 (P2) — §4a.1 claims the local-field `G_K^u`, but ClassFieldTheory precedes this roadmap, cannot consume it, and owns it at #1215

**Location.** `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`:
- lines 115–116: "The absolute upper filtration `G_K^u` of a nonarchimedean local field, at every real depth `u ≥ −1`, is §4a.1's";
- lines 120–122: "The filtration taken directly from the completed roadmap's finite upper groups is therefore this one, and is not defined a second time";
- lines 1156–1158: "ClassFieldTheory consumes §4a.1 on nonarchimedean local fields … for the absolute form of unit-filtration reciprocity";
- lines 19–21 repeat the claim in the summary.

The description's *Merge order* reads: "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411".

**Claim.** The route this head takes fails on two counts.

1. **Direction.** ClassFieldTheory is on main, and it supplies two of this roadmap's suppliers on main:
   - ReductiveGroupsPartII takes ClassFieldTheory layer 9, the local Weil group (main README lines 377–381). §4a.3 consumes ReductiveGroupsPartII §RG2.0.4 (this README, lines 282–288).
   - SchemeAndStackFoundations takes ClassFieldTheory Layers 5 and 10 (main README line 424). §3a.3 consumes SchemeAndStackFoundations §0.24 (lines 276–280).

   So ClassFieldTheory precedes this roadmap, and any ClassFieldTheory citation of §4a.1 is upward. The new sentence at 1156–1158 states that edge, and line 125 directs every local-field user, ClassFieldTheory included, to cite §4a.1. This README's own dependency check cannot see the edge, because it is written as a consumer claim.
2. **Two owners.** #1215 (kim-em; head 024927f, ClassFieldTheory unchanged since b9e8822) still owns the same object:
   - `ClassFieldTheory/README.md` lines 187–191 give it to Layer 7 and say that nothing from §4a.1 is an input there;
   - lines 1188–1199 define `localAbsoluteUpperRamificationGroup`;
   - its `Suggested.lean` line 109 declares it as the infimum over finite Galois `M` of the comaps of `LocalFieldsRamification.upperRamificationGroup K M v`.

   That is exactly the filtration that lines 120–122 say "is not defined a second time".

**Witness.** I ran `gate --depcheck` on the two ClassFieldTheory READMEs:
- at #1411: `UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#2) at README lines [507, 538, 1435, 1488]`;
- at #1215: `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`.

**Repair.** ClassFieldTheory owns the local-field object. §4a.1 keeps the general filtration and the local-field agreement of its fourth bullet (lines 776–786), and `ψ_(L/K)` stays §4a.2's.

1. **Summary, lines 16–21.** Restore b6dc85b's sentence: "On a nonarchimedean local field the objects of a finite Galois extension and the inertia and wild inertia subgroups are the completed roadmap's, the absolute upper filtration is ClassFieldTheory Layer 7's and the completed maximal unramified extension is ReductiveGroupsPartII's `Breve E`; the agreements with these are targets here, and the function `ψ_(L/K)` of a finite separable extension that is not Galois is this roadmap's there."
2. **Scope, lines 113–126.** Restore b6dc85b's paragraph (its lines 112–124). It runs from "On a nonarchimedean local field, the absolute upper filtration taken directly from the completed roadmap's finite upper groups … is ClassFieldTheory Layer 7's; ClassFieldTheory precedes this roadmap and takes no input from it." to "A roadmap that uses this function on local fields cites §4a.2 and does not define it a second time."
3. **Downstream, lines 1156–1158.** Replace the ClassFieldTheory sentence with: "ClassFieldTheory precedes this roadmap and takes no input from it; its Layer 7 local-field filtration is the one §4a.1's fourth bullet compares with." Keep this head's FilteredLocalGaloisGroups and FieldOfNorms sentence (lines 1151–1156), which matches their heads (row 83). Both are new roadmaps after this one, so their citations of §4a.1 point downward.
4. **Description.**
   - Replace *Merge order* with: "ClassFieldTheory's revision #1215, which defines the absolute upper filtration of a nonarchimedean local field in its Layer 7, precedes this pull request; the summary and the scope name it as that object's owner, and ClassFieldTheory takes no input from this roadmap. #940, #856, #1795 and #1812 cite §§3a–4a and merge after this pull request."
   - In *Why*, delete "and the ClassFieldTheory amendment #1411 consumes the absolute upper filtration".
   - In the roadmap-summary block, replace "ClassFieldTheory needs the absolute upper filtration for reciprocity–filtration compatibilities" with "On a nonarchimedean local field its absolute upper filtration agrees with ClassFieldTheory Layer 7's".
5. **#1411 (the same author's pull request).** Drop the citations of §4a.1 that the dependency check flags:
   - README lines 94–95, 136–139, 507, 538–548, 1435–1443 and 1488;
   - the `AbsoluteUpper` section of its `Suggested.lean`, lines 1122–1148, which names §4a.1 at line 1130.

   Take `localAbsoluteUpperRamificationGroup` from #1215's Layer 7 instead. #1411 already conflicts with #1215 in `ClassFieldTheory/README.md` and `ClassFieldTheory/Suggested.lean` (`roadmaps overlaps ClassFieldTheory`), so it has to be rebased on #1215 anyway.

**Tested.**
- After step 5, #1411's README cites this roadmap nowhere, which is the shape that gives #1215's README `0 problem(s)`.
- After steps 1–3, this README no longer claims the object that #1215's `Suggested.lean` line 109 defines. #1215's lines 187–191 then say the same as this scope section: the general filtration here, the local-field filtration there, and the agreement in §4a.1's fourth bullet.
- `ψ_(L/K)` stays uncontested: #1215's ClassFieldTheory README has 0 hits for `ψ_(L/K)`, `ψ_{L/K}` or "open-subgroup identity".
- On `ℚ_2(ζ_8)` at `u = 3/2`, both carriers give `{1, 5}` (row 77). That becomes an agreement between an owner and a comparison, not a second definition.

## R02 (P3) — The description still lists suppliers and a consumer the README does not have, and its summary sentence is false

**Location.** The pull-request description:
- *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)";
- *Why* and *Merge order*: "FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) consume this package" and "#940, #856 and #879 cite its §§3a.1–3a.3 and §§4a.1–4a.3";
- **Summary**: "On a nonarchimedean local field every object restricts to the completed roadmap's, and that agreement is a target."

**Claim.** The description is unchanged since the previous review.
- README line 99 says this roadmap "consumes nothing from that section" (§F.3a).
- ProfiniteCohomology is never named in the README.
- #879 does not cite this roadmap. It reaches the package through PadicPeriodRings §0.3 (#879 README lines 119–125), and #940 line 9 takes it from this roadmap.
- The **Summary** sentence is false under both the current README and the repaired one: on a local field, `Breve E` is ReductiveGroupsPartII's and non-Galois `ψ_(L/K)` is this roadmap's.

**Witness.**
- `grep -c ProfiniteCohomology README.md` returns `0`.
- `roadmaps grep RamificationOfCompleteDiscretelyValuedFields` returns lines only from #1215, #1410, #1411, #1713, #617, #856 and #940, none from #879.
- For `L = ℚ_3(∛3)`, the pinned `herbrandOrderIso` needs `[IsGalois K L]` (`Herbrand/Basic.lean` lines 251–255), while §4a.2 gives `ψ_(L/K)(2) = 3`.

**Repair.**
- Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. EtaleCohomologyFoundations §F.3a and ClassFieldTheory Layer 7 (#1215) are named in the scope as owners and are not suppliers."
- In *Why* and *Merge order*, drop #879 and say that integral `p`-adic Hodge theory reaches the package through PadicPeriodRings.
- In **Summary**, replace the quoted sentence with README lines 16–20 as restored by R01, step 1.

**Tested.** Each section named in the edited text resolves on main at deebc70:
- ReductiveGroups line 234;
- SchemeAndStackFoundations line 1565;
- AdicSpacesPartII line 7793;
- ReductiveGroupsPartII line 852;
- EtaleCohomologyFoundations line 776.

The edited text then names exactly the suppliers of README lines 155–288 and 1111–1135.

## Previous findings

- R01 — not repaired: the README now reads "The absolute upper filtration `G_K^u` of a nonarchimedean local field … is §4a.1's" (lines 115–116). The dependency check reports #1411's citation of it as UPWARD, and #1215 still defines `localAbsoluteUpperRamificationGroup`. Carried as R01.
- R02 — not repaired: the description's *Dependencies* still reads "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)", and *Why* still names #879. Carried as R02. No repair report marks it not actionable.

## Verified sound

### Changed passages (3 hunks, read in full against the diff)

The mathematics of the new text is correct; only its ownership and direction are wrong (R01).
- **Summary, lines 16–21.** The finite images of `G_K^u` on a local field are the completed roadmap's upper groups, as §4a.1's fourth bullet states (lines 776–779; rows 77–78). The finite-Galois, inertia and `Breve E` clauses are unchanged in substance (rows 67, 68, 70).
- **Scope, lines 113–126.** The stated reason is true at the pin:
  - `TauCeti.LocalFieldsRamification.upperRamificationGroup` is a `Subgroup (L ≃ₐ[K] L)` declared under `[IsGalois K L]` (`Herbrand/Basic.lean` lines 255 and 421);
  - `RamificationIndexDomain` is `Set.Ici (−1)` (`RamificationGroup.lean` line 86);
  - pinned Tau Ceti and Mathlib have 0 hits for an absolute upper filtration.
- **Downstream, lines 1151–1156.** The FilteredLocalGaloisGroups and FieldOfNorms sentence matches their heads (row 83).

### Seeded sample

These are checked where they fall in the changed passages.
- **Agreement with `Breve E` on a local field** (line 1057), cited by the summary clause. brinon-conrad Exercise 1.4.4 is at lines 375–386, PDF page 10:
  - part (2), lines 378–381: the unique extension of the valuation, and incompleteness of `K^un` for a residue field that is not algebraically closed;
  - part (3), lines 382–386: the completion's algebraically closed residue field, and the equivalence of finite extensions.

  These are stated for `p`-adic fields, matching "in mixed characteristic".
- **The perfect-residue Herbrand package** (line 323), whose "comparisons with the finite-local-field API" the scope paragraph concerns. serre1961 n° 3.1 has Proposition 3 and the paragraph after it, which defines the upper groups of an infinite Galois extension by passing to the limit, at lines 931–938 (page 25 of the extraction, printed p. 128). Proposition 4 is at lines 942–947. This matches §4a.1's locator (lines 788–791).
- **Residue enlargement**, **proalgebraic units** and **graded norms** are untouched by the diff. They are carried from r19 (rows 45–47), checked at the same locators.

### Adversarial table

Notation:
- `Z8 = ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`;
- `Z9 = ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`;
- `S3 = ℚ_3(ζ_3, ∛3)/ℚ_3`, with `#G_0..#G_4 = 6, 3, 3, 3, 1`;
- `T6 = ℚ_2(ζ_3, ∛2)/ℚ_2`;
- `AS` is `y^p − y = t⁻¹`;
- `I2` is `F_2(s)((t))` with `M = K(y, w)`;
- `W = Frac W(F̄_p)`.

Which rows come from where:
- Rows 1–48, 51–61, 67–68 and 70–76 cover statements the diff leaves untouched. They are carried from the previous report (r20), which carried rows 1–61 from r19.
- Rows 49, 50, 66 and 69 tested the ownership texts this head rewrote, and are replaced by rows 80–82 and 84–85.
- Rows 64–65 test the unchanged description.
- Rows 77–87 are new.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `5 + 2 + 2 = 9`; disc `ℚ(ζ_9) = 3^9` | agrees (r20) | none |
| 2 | Hilbert | `S3` | `Σ = 11`; tower `1 + 2·5 = 11` | agrees (r20) | none |
| 3 | Hilbert | `T6` | `Σ = 3 − 1 = 2 = e − 1` | agrees (r20) | none |
| 4 | Hilbert, separability dropped | `CpCp`, `p = 2` | `d = 2`, `Σ = 3` | hypothesis needed (r20) | none |
| 5 | §3a.1 Check `z^p − t^(p−1)z = s` | `p` | `#G_0 = p`, `e = 1`, `d = p − 1 = Σ` | consistent (r20) | none |
| 6 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees (r20) | none |
| 7 | same, below `−1` | unramified quadratic | `φ(−2) = −3`, `ψ(−2) = −3/2` | stated on `[−1, ∞)` (r20) | none |
| 8 | same, trivial action | `C_2` on `ℤ_2` | ratio `1`, `φ = id` | agrees (r20) | none |
| 9 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees (r20) | none |
| 10 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs `G_3 = {1, 5}` | wrong model excluded (r20) | none |
| 11 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `ψ_G(1/2) = 1`; `(G/H)^(1/2) = 1` | agrees (r20) | none |
| 12 | Herbrand | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ G/H = (G/H)^2` | agrees (r20) | none |
| 13 | Herbrand | `T6`, `H = A_3`, `v = 0, −1` | `A_3 ↦ 1`; `G ↦ G/H` | agrees (r20) | none |
| 14 | Herbrand, separability dropped | `I2`, `v = 1/2` | order `2` vs `1` | hypothesis needed (r20) | none |
| 15 | tower (Lean 130) | `Z9`, `H = C_3`, `u = 5` | `φ_G(5) = 3/2`; `φ_(G/H)(3) = 3/2` | agrees (r20) | none |
| 16 | tower | `Z8`, `H = {1, 7}`, `u = 7` | `φ_G(7) = 3`; `φ_(G/H)(4) = 3` | agrees (r20) | none |
| 17 | tower below `−1` | any | both `−1 + f(u + 1)` | harmless (r20) | none |
| 18 | tower, separability dropped | `I2`, `u = 1` | `1` vs `1/2` | hypothesis needed (r20) | none |
| 19 | Hasse–Arf (Lean 151) | `Z9` | `6 ∣ 0`, `6 ∣ 6`; non-jump `6 ∤ 3` | agrees (r20) | none |
| 20 | Hasse–Arf | `Z8` | `4 ∣ 4`, `4 ∣ 8`; non-jump `4 ∤ 6` | agrees (r20) | none |
| 21 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed (r20) | none |
| 22 | Hasse–Arf, infinite residue | `AS` over `F̄_p((t))` | `p ∣ p` | agrees (r20) | none |
| 23 | negative control | abstract `C_9` | `9 ∤ 21`, `φ(5) = 7/3` | consistent (r20) | none |
| 24 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees (r20) | none |
| 25 | same, non-henselian | `ℚ`, `ℤ_(5)`, `ℚ(i)` | `D_M = 1` | decomposition groups needed (r20) | none |
| 26 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | `𝔪 = 0`, `G_0 = 1` = inertia | agrees (r20) | none |
| 27 | `_zero` | `W` | `ψ(0) = 0`; inertia `= G_K` | agrees (r20) | none |
| 28 | `_zero` | `ℚ_p`, Frobenius lift | outside both sides | agrees (r20) | none |
| 29 | `_zero`, `q`-power step | `F_p((t))`, `t^(1/p)` | `(σx − x)^p = 0` | sound (r20) | none |
| 30 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G`; `G_2 = {1, 5}` | agrees (r20) | none |
| 31 | same, perfectness dropped | `I2`, `u = 1/2` | `≤ 2` vs `4` | hypothesis needed (r20) | none |
| 32 | `0+` (Lean 239) | `W`, `K(ζ_3)` | `P_K ↦ 1`, `I_K ↦ C_2` | strict inclusion (r20) | none |
| 33 | `0+` | `ℂ((t))` | `G_1 = 1`; both `⊥` | agrees (r20) | none |
| 34 | `0+` | `AS` over `F̄_p((t))` | `G_1 = C_p` for `0 < w ≤ 1` | agrees (r20) | none |
| 35 | subgroup identity (Lean 263) | `S3`, `H = ⟨(12)⟩`, `u = 0, 1/2, 2` | LHS `H, 1, 1` = RHS `H, 1, 1` | agrees (r20) | none |
| 36 | same | `H = G`; `H = ⊥` | `φ_G ∘ ψ_G = id`; `⊤ = ⊤` | agrees (r20) | none |
| 37 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ(1) = 2`, `H^2 = H`; `ψ(3/2) = 5`, `1 = H^3` | agrees (r20) | none |
| 38 | same, `L` not Galois | `L = ℚ_3(∛3)` | `ψ = u` on `[0, 3/2]`, `3u − 3` after; `ψ(2) = 3` | agrees (r20) | none |
| 39 | same, `u = −1` | any | `G_K ↦ G_L` | agrees (r20) | none |
| 40 | same, `hO′` dropped | `W`, trivial `O′` | `G_L` vs `⊥` | hypothesis needed (r20) | none |
| 41 | integral formula | `L = ℚ_3(∛3)` | slopes `1`, then `3` | agrees (r20) | none |
| 42 | integral formula | unramified quadratic | `(1/2)·∫_0^u 2 dt = u` | agrees (r20) | none |
| 43 | §4a.3 base change | `Z9` | `d/e = 9/6 = 3/2`; upper jumps `0, 1` | agrees (r20) | none |
| 44 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; upper `1, 2` | agrees (r20) | none |
| 45 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `ℚ_(p²)`; `X^e − t` | uniformizer kept; splits; `#G_0 = e` | agrees (r20) | none |
| 46 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p` | agrees (r20) | none |
| 47 | sampled: graded norms | `AS`; tame `C_e`; `F_3` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`; kernel `μ_e`; `{0, ±√2}` | agrees (r20) | none |
| 48 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; unbounded degree; `v = 1/2 ∉ ℤ` | agrees (r20) | none |
| 51 | agreement of the two filtrations on a local field | `Z8`, depths `0..3` | `(ℤ/8)ˣ, (ℤ/8)ˣ, {1,5}, {1}` on both sides | agrees (r20) | none |
| 52 | `IsGalois` reason | pin `Herbrand/Basic.lean` | `herbrandOrderIso` at 251 under `[IsGalois K L]` | agrees (r20) | none |
| 53 | Conventions example | `F_p(s)((t))` | `e = 1`, `e = 1`; difference `t^(1/p)`, `v = 1/p` | agrees (r20) | none |
| 54 | `K^ur` over perfect `k` | `F̄_p((t))`, `K(t^(1/p))` | `e = p`, `f = 1` | agrees (r20) | none |
| 55 | Layer-4a-only objects | grep of Layer 3a | 0 occurrences | agrees (r20) | none |
| 56 | `H_i` quantified over subgroups | `ℚ_3 ⊂ ℚ_3(ζ_9)` | no `K′` | agrees (r20) | none |
| 57 | `K̃ = Frac A′` | `k = F_2(s)` | `s^(1/2)` in residue field of `A′` | agrees (r20) | none |
| 58 | `H_i = H ∩ G_i` | `S3`, `H = ⟨(12)⟩` | `H_0 = H`, `H_1 = 1` both sides | agrees (r20) | none |
| 59 | separability inherited | `k ⊆ k_F ⊆ l`; `I2` | both steps separable; `I2` fails at top | agrees (r20) | none |
| 60 | class formula | `Z8`, `H = {1, 7}` | `(4 + 2)/2 = 3 = v(−2√2)` | agrees (r20) | none |
| 61 | Herbrand's lemma | `Z8`, `H = {1, 7}`, `u = 1, 3, 4` | `φ_H = 1, 2, 5/2`; `G_uH/H = G/H, G/H, 1` | agrees (r20) | none |
| 64 | description *Dependencies* | grep of README | `ProfiniteCohomology` 0 hits; §F.3a consumed 0 times (line 99) | contradicts (r20, unchanged) | R02 |
| 65 | description: #879 cites §§3a–4a | `roadmaps grep` | 0 lines from #879; its lines 119–125 send the package to PadicPeriodRings §0.3 | false (r20, unchanged) | R02 |
| 67 | summary 16–17: finite Galois objects are the completed roadmap's | `Z8` | lower jumps `1, 3`; `φ(1) = 1`, `φ(3) = 2`; `ψ(2) = 3` = `inverseHerbrand` | agrees (r20) | none |
| 68 | summary 17: inertia and wild inertia are the completed roadmap's | `ℚ_2`, `Z8` | `G_K^0 ↦ G_0 = (ℤ/8)ˣ` = image of `inertiaSubgroup`; `G_K^(0+) ↦ G_1 = (ℤ/8)ˣ` = image of `wildInertiaSubgroup` | agrees (r20) | none |
| 70 | summary 18: `K′` is `Breve E` | `E = ℚ_p`; `E = F_q((t))` | `K′ = W(F̄_p)[1/p]`, `e(K′/E) = 1`; `K′ = F̄_q((t))`; RG2.0.4 at main 852 | agrees (r20) | none |
| 71 | summary 20–21: non-Galois `ψ` is this roadmap's | `L = ℚ_3(∛3)` via `S3`, `H = ⟨(12)⟩` | `ψ_(M/K)(2) = 3 + 6·(1/2) = 6`; `φ_(M/L)(6) = 3`; Tau Ceti needs `IsGalois` | agrees (r20) | none |
| 72 | 3a scope bullet 50–53: agreement list | §3a.2 bullet; pin | five Herbrand and upper objects; `lowerRamificationGroup`, `differentExponent` definitional | matches targets (r20) | none |
| 73 | old "every one of these objects" (negative control) | a local field; §3a.3's proalgebraic `U_K` | finite residue field, no proalgebraic object | narrowing correct (r20) | none |
| 74 | 3a scope bullet: recovers `hasseArf` | `Z8`; `Z9` | upper jumps `1, 2`; `0, 1`, all integers | agrees (r20) | none |
| 75 | open-subgroup identity on a local field | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `G_K^1 ↦ C_3 = H = H^2`; `G_K^(3/2) ↦ 1 = H^3` | agrees (r20) | none |
| 76 | sole owner of `ψ_(L/K)` | #1215 ClassFieldTheory | 0 hits for `ψ_(L/K)`, `ψ_{L/K}`, open-subgroup identity (re-run at 024927f) | §4a.2 sole owner (r20) | none |
| 77 | summary 19–20: finite images of `G_K^u` are the completed roadmap's upper groups | `Z8`, `u = −1, 3/2, 5/2` | `ψ(3/2) = 1 + (1/2)·2 = 2`, `G_2 = {1, 5}`; `ψ(5/2) = 3 + (1/2)·4 = 5`, `G_5 = 1`; `u = −1`: `G`; the same on the `upperRamificationGroup K M u` side | agrees | none |
| 78 | scope 118–120: the fourth bullet gives the finite-restriction description | `Z9`, `u = 0, 1/2, 2` | `ψ(0) = 0`, `G_0` of order 6 = inertia image; `ψ(1/2) = 1`, `G_1 = C_3 = Gal(K(ζ_9)/K(ζ_3))`; `ψ(2) = 2 + 6·1 = 8`, `G_8 = 1`; stated at README 776–779 | agrees | none |
| 79 | scope 113–115: why the completed roadmap lacks the object | pinned Tau Ceti | `upperRamificationGroup (v : RamificationIndexDomain) : Subgroup (L ≃ₐ[K] L)` at 421, under `[IsGalois K L]` (255); `Set.Ici (−1)`; `absoluteUpper` 0 hits; Mathlib 0 hits | true | none |
| 80 | scope 120–122: "not defined a second time" | #1215 `ClassFieldTheory/Suggested.lean` 109 | `localAbsoluteUpperRamificationGroup K v = ⨅ M, (upperRamificationGroup K M v).comap (restrictNormalHom M)`: the same set | false at #1215 | R01 |
| 81 | downstream 1156–1158: ClassFieldTheory consumes §4a.1 | `gate --depcheck` on #1411's and #1215's ClassFieldTheory README | #1411: `UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#2)` at 507, 538, 1435, 1488; #1215: `0 problem(s)` | upward | R01 |
| 82 | the order behind row 81 | main supplier contracts | ClassFieldTheory layer 9 → ReductiveGroupsPartII (377–381) → §4a.3 (282–288); Layers 5, 10 → SchemeAndStackFoundations (424) → §3a.3 (276–280) | ClassFieldTheory precedes this roadmap | R01 |
| 83 | downstream 1151–1155: FilteredLocalGaloisGroups and FieldOfNorms consume §§4a.1–4a.2 | #1795 at f235b83; #1812 at 5b260a9 | #1795 lines 139–150: projections onto `Gal(M/K)^u`, `G_K^0` inertia, `G_K^(0+)` wild inertia, `ψ`, identity, integral formula; #1812 lines 160–163: projections, `G_K^0` inertia, `ψ`, identity, integral formula | agrees | none |
| 84 | downstream 1157: what ClassFieldTheory takes | #1411 README 1441–1443 | "closedness, finite projections, local-field agreement and term at `0`" vs "finite projections and its term at `0`" | content matches; direction fails (row 81) | R01 |
| 85 | description: "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411" | row 81 | upward edge | false | R01 |
| 86 | negative control: the settlement of R01 | #1215's README (the owner shape) | `0 problem(s)`; `localAbsoluteUpperRamificationGroup ℚ_2 (3/2) ↦ {1, 5}` in `Gal(Z8)` = row 77 | consistent | none |
| 87 | line 68 "owns everything on nonarchimedean local fields" vs line 113 "Two objects … are this roadmap's" | — | the list after line 68's colon omits `G_K^u` and non-Galois `ψ` | wording remark on untouched text | none |

### Lean form and signatures

- **Signatures.** `Suggested.lean` is byte-identical to b6dc85b. I put `#check @name` for all 13 declarations in one scratch copy and elaborated it once (exit 0, nine `sorry` warnings). After whitespace normalisation, every elaborated type is identical to `signatures.md` (13/13), and none lost a binder.
- **Padding and headlines.** These are unchanged from r19 and r20: the one-tactic probe closes none of the 9 theorems, and every headline is stated except §4a.3, which the module docstring names as not statable.

### Library declarations opened at the pins (this round)

All in Tau Ceti `NumberTheory/LocalField/`:
- `Herbrand/Basic.lean` lines 102 (namespace `TauCeti.LocalFieldsRamification`), 255 (`[IsGalois K L]`) and 421 (`upperRamificationGroup`);
- `RamificationGroup.lean` line 86 (`RamificationIndexDomain`);
- `Unramified/Inertia/Basic.lean` line 112 (`inertiaSubgroup`, namespace `TauCeti` at 103);
- `WildInertia.lean` line 251 (`wildInertiaSubgroup`);
- `FiniteExtension/IntermediateField.lean` line 97 (`finiteIntermediateField_isNonarchimedeanLocalField`).

I also searched pinned Mathlib and Tau Ceti for an absolute upper filtration: 0 hits in either.

### Cross-roadmap citations resolved

- **Main** moved from b0fe353 to deebc70; only the ModularForms README and Suggested.lean and the ChevalleyGroups progress files changed; neither roadmap is a supplier.
- **ClassFieldTheory:**
  - main: 0 hits for "absolute upper", and no mention of this roadmap;
  - #1215 at 024927f: README 187–191 and 1188–1199, `Suggested.lean` 109–117;
  - #1411 at 656f837: README 94–95, 136–139, 507, 538–548, 1435–1443 and 1488, `Suggested.lean` 1122–1148.
- **Suppliers on main:** ReductiveGroupsPartII lines 377–381 and 852, SchemeAndStackFoundations lines 424 and 1565, ReductiveGroups 234, AdicSpacesPartII 7793, EtaleCohomologyFoundations 776.
- **Consumers:**
  - #1795 at f235b83 and #1812 at 5b260a9;
  - #940 at 32476ef: line 9 takes the package from this roadmap;
  - #879 at 9856719: lines 119–125 route the package through PadicPeriodRings §0.3.
- **Tools:** `roadmaps overlaps` finds no pull request that changes this folder and no dropped id. `roadmaps resolve` finds nothing unresolved.
- **Ownership against open pull requests:** I checked ClassFieldTheory, FilteredLocalGaloisGroups, FieldOfNorms, PadicPeriodRings, FiniteFlatGroupsAndIntegralPadicHodgeTheory and SmallRamificationAndAbelianVarietyBaseCasesPartII by object ("absolute upper (ramification|filtration)"). The only second owner is #1215 (R01).
- **Remark on untouched text (no change asked):** line 68's "The completed roadmap owns everything on nonarchimedean local fields" reads as unconditional, while the scope paragraph that follows names exceptions. The list after its colon is accurate.

## Not verifiable

- `serre-local-fields` is settled as uncertified, and its locators are cited without the text.
- #1411, #1795, #1812, #879 and #940 have no checkout in this brief. I read them at their indexed heads through `roadmaps show`; the line numbers above are file lines, with the printed header line removed.

## Source issues

- none
