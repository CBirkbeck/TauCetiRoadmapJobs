# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at b6dc85b)

**Verdict:** needs changes

This is an incremental re-review of the 31 README lines that changed since c948d04. They are in three hunks: the summary (lines 16–22), the 3a scope bullet (lines 47–52) and the downstream-consumers paragraph (lines 1149–1155). `Suggested.lean` is unchanged, and nothing outside the folder changed.

The README repairs of R02 and R03 are correct, and the narrowed 3a scope bullet matches its targets. Both findings that remain are in the pull-request description and in #1411, neither of which changed:
- R01 (P2) is the local-field `G_K^u` that this README and #1411 each hand to the other. The summary (line 18) and the downstream paragraph (line 1152) now add two more citations of a ClassFieldTheory Layer 7 object that only #1215 defines.
- R02 (P3) is the description's list of suppliers and consumers. Its summary sentence now also contradicts the README's repaired summary.

Mechanical checks at this head:
- **Gate:** re-run; every check passes (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`).
- **Dependency check:** `depcheck: 240 roadmaps, 2357 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` exits 0. The only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Declared gaps:** none (no `design/plan.json`).

## R01 (P2) — The description and #1411 still hand the local-field absolute filtration back to §4a.1

**Location.**
- `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`:
  - line 115: "ClassFieldTheory Layer 7's; ClassFieldTheory precedes this roadmap and takes no input from it";
  - line 18, new: "the absolute upper filtration is ClassFieldTheory Layer 7's";
  - line 1152, new: "reading `G_K^u` there as ClassFieldTheory Layer 7's absolute upper filtration".
- The description:
  - *Merge order*: "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411";
  - *Why*: "the ClassFieldTheory amendment #1411 consumes the absolute upper filtration";
  - the roadmap-summary block: "ClassFieldTheory needs the absolute upper filtration for reciprocity–filtration compatibilities".

**Claim.** The previous R01 asked for edits to the description and to #1411. Neither has changed (#1411 is still at 656f837), so:
- This README and #1411 still each hand the local-field absolute upper filtration to the other.
- The description still does not name #1215. ClassFieldTheory on main (b0fe353) has no absolute upper filtration: its Layer 7, at line 1312, is the absolute Artin map, and a grep for "absolute upper" finds 0 lines. The object exists only at #1215 (ClassFieldTheory README lines 187–191 and 1188–1199, unchanged since b9e8822).

This head adds two more citations of that object (lines 18 and 1152), so the README now depends on #1215 in three places.

**Witness.** #1411's ClassFieldTheory README lines 137–139 say the opposite of README line 115:
- "`RamificationOfCompleteDiscretelyValuedFields` owns the absolute upper ramification groups `G_K^u` (§4a.1 …), on nonarchimedean local fields as on every complete discretely valued field … Layer 7 takes them";
- its line 508 lists §4a.1 as the supplier of `G_K^u`.

**Repair.** The README lines stay as they are.
- In the description, replace the *Merge order* paragraph with: "ClassFieldTheory's revision #1215, which defines the absolute upper filtration of a nonarchimedean local field in its Layer 7, precedes this pull request; the summary, the scope section and the downstream paragraph name it as that object's owner. #1411 is rebased on #1215 and takes the local-field `G_K^u` from ClassFieldTheory Layer 7, citing §4a.1 only for the general filtration and its agreement. #940 and #856 cite §§3a.1–3a.3 and §§4a.1–4a.3 and merge after this pull request."
- In *Why*, replace "and the ClassFieldTheory amendment #1411 consumes the absolute upper filtration" with "and ClassFieldTheory Layer 7's local-field filtration agrees with §4a.1's".
- In the roadmap-summary block, replace "ClassFieldTheory needs the absolute upper filtration for reciprocity–filtration compatibilities" with "On a nonarchimedean local field its absolute upper filtration agrees with ClassFieldTheory Layer 7's".
- In #1411 (the same author's pull request), drop the local-field clause of lines 137–139 and the row at line 508.
- If the operators keep #1411's direction instead, §4a.1 becomes the owner again in README lines 18, 112–119 and 1152, and the repair moves to #1215.

**Tested.**
- After the edits, the description names the only revision that defines the object cited at lines 18, 115 and 1152.
- No text in the pull request says that ClassFieldTheory consumes §4a.1's local-field object.
- Line 115 then holds on main, at #1215, and at a #1411 without lines 137–139 and 508.

## R02 (P3) — The description still lists suppliers and a consumer the README does not have, and still has the old summary

**Location.** The pull-request description:
- *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)".
- *Why* and *Merge order*: "FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) consume this package" and "#940, #856 and #879 cite its §§3a.1–3a.3 and §§4a.1–4a.3".
- **Summary**: "On a nonarchimedean local field every object restricts to the completed roadmap's, and that agreement is a target."

**Claim.** The description is unchanged since the previous review. Its R04 is not repaired, and this head's README repair of R03 makes the description's summary sentence wrong as well:
- README line 98 says this roadmap "consumes nothing from that section" (§F.3a).
- The README never names ProfiniteCohomology.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory does not cite this roadmap. README lines 1154–1155 send integral `p`-adic Hodge theory through PadicPeriodRings.
- README lines 16–20 now say that on a local field the absolute upper filtration is ClassFieldTheory's, `Breve E` is ReductiveGroupsPartII's, and `ψ_(L/K)` of a non-Galois extension is this roadmap's. So "every object restricts to the completed roadmap's" is false there.

**Witness.**
- `grep -c ProfiniteCohomology README.md` returns `0`.
- `roadmaps grep RamificationOfCompleteDiscretelyValuedFields` returns no line from FiniteFlatGroupsAndIntegralPadicHodgeTheory.
- For `L = ℚ_3(∛3)`, the pinned `herbrandOrderIso` needs `[IsGalois K L]` (`Herbrand/Basic.lean` line 251). §4a.2 gives `ψ_(L/K)(2) = 3`.

**Repair.**
- Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. EtaleCohomologyFoundations §F.3a and ClassFieldTheory Layer 7 (#1215) are named in the scope as owners and are not suppliers."
- In *Why* and *Merge order*, drop #879 and say that integral `p`-adic Hodge theory reaches the package through PadicPeriodRings.
- In **Summary**, replace the quoted sentence with README lines 16–20's sentence.

**Tested.** Each section named in the edited text resolves on main at b0fe353:
- ReductiveGroups line 234;
- SchemeAndStackFoundations line 1565;
- AdicSpacesPartII line 7793;
- ReductiveGroupsPartII line 852;
- EtaleCohomologyFoundations line 776.

The edited text then names exactly the suppliers of README lines 153–287 and 1122–1133.

## Previous findings

- R01 — not repaired: the description still reads "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411" and does not name #1215. #1411 lines 137–139 and 508 are unchanged at 656f837. Carried as R01.
- R02 — repaired: README lines 1149–1153 now read "consume §4a.2 on nonarchimedean local fields (`ψ_(L/K)` with its tower law, the open-subgroup identity … and the integral formula), reading `G_K^u` there as ClassFieldTheory Layer 7's absolute upper filtration through §4a.1's local-field agreement".
- R03 — repaired: README lines 16–20 now read "the objects of a finite Galois extension and the inertia and wild inertia subgroups are the completed roadmap's, the absolute upper filtration is ClassFieldTheory Layer 7's … `ψ_(L/K)` of a finite separable extension that is not Galois is this roadmap's there".
- R04 — not repaired: the description's *Dependencies* still reads "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)", and *Why* still names #879. Carried as R02. No repair report marks it not actionable.

## Verified sound

### Changed passages (3 hunks, all read in full against the word diff)

**Summary, lines 16–22.** Each clause names a real owner and an agreement target:
- The finite Galois objects: §3a.2's agreement bullet (lines 469–474) covers `herbrandOrderIso`, `herbrand`, `inverseHerbrand`, `psiNat` and `upperRamificationGroup`. The lower groups and the different agree by definition:
  - `lowerRamificationGroup` is the local-ring filtration (README line 229);
  - `TauCeti.differentExponent` is `multiplicity 𝓂[L] (differentIdeal 𝒪[K] 𝒪[L])` (`Different/Basic.lean` line 92).
- Inertia and wild inertia: §4a.1's fourth bullet, lines 774–785.
- ClassFieldTheory's filtration: the same bullet.
- `Breve E`: the §4a.3 agreement target, line 1055.
- `ψ_(L/K)` of a non-Galois extension: scope lines 119–125.

The pinned `TauCeti.inertiaSubgroup` (`Unramified/Inertia/Basic.lean` line 112) and `TauCeti.wildInertiaSubgroup` (`WildInertia.lean` line 251) exist. ReductiveGroupsPartII §RG2.0.4 is at main line 852, with `Breve E` defined at line 860. The citation of ClassFieldTheory Layer 7 is part of R01.

**3a scope bullet, lines 47–52.** The narrowing from "every one of these objects" to "the Herbrand functions and the upper groups" is correct:
- §3a.3's proalgebraic and graded-norm objects need an algebraically closed residue field, which no local field has, so the old wording claimed an agreement no object can have.
- "§3a.3 recovers `hasseArf`" matches lines 257–259 and 707–711.

**Downstream paragraph, lines 1149–1155.**
- Both consumers cite §§4a.1–4a.2 and work only over local fields: #1795 at f235b83 (README lines 52–55 and 140–151) and #1812 at 5b260a9 (lines 70–72 and 161–164).
- ClassFieldTheory at #1215 states no `ψ_(L/K)` and no open-subgroup identity (0 hits), so §4a.2 is their only owner.

### Seeded sample

Where it falls in the changed passages:
- **Agreement with `Breve E` on a local field** (cited by the new summary clause). brinon-conrad Exercise 1.4.4 is at lines 375–386, PDF page 10:
  - part (2), lines 378–381: the unique valuation, and `K^un` incomplete for a non-algebraically-closed residue field;
  - part (3), lines 382–386: the completion has algebraically closed residue field, and the equivalence of finite extensions.

  These are stated for `p`-adic fields, matching the README's "in mixed characteristic" (lines 1067–1070).
- **The perfect-residue Herbrand package** (its "comparisons with the finite-local-field API", line 322, which the narrowed bullet restates). serre1961 n° 3.1 has formula (5) and properties a–d′ at lines 897–922 (printed p. 127). Proposition 3, the paragraph after it on infinite extensions, and Proposition 4 are at lines 931–947 (printed p. 128). This matches §3a.2 and §4a.1.

Untouched by the diff, carried from r19 (rows 44–48, checked at the same locators):
- residue enlargement;
- proalgebraic units;
- graded norms.

### Adversarial table

Notation as before:
- `Z8 = ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`;
- `Z9 = ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`;
- `S3 = ℚ_3(ζ_3, ∛3)/ℚ_3`, with `#G_0..#G_4 = 6, 3, 3, 3, 1`;
- `T6 = ℚ_2(ζ_3, ∛2)/ℚ_2`;
- `AS` is `y^p − y = t⁻¹`;
- `I2` is `F_2(s)((t))` with `M = K(y, w)`;
- `W = Frac W(F̄_p)`.

Rows 1–61 and 64–66 cover statements the diff leaves untouched and are carried from the previous report (r19; rows 1–48 there came from r18). Rows 62–63 of r19 tested the summary and downstream texts that this head rewrote, and are replaced by rows 67–76.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `5 + 2 + 2 = 9`; disc `ℚ(ζ_9) = 3^9` | agrees (r19) | none |
| 2 | Hilbert | `S3` | `Σ = 11`; tower `1 + 2·5 = 11` | agrees (r19) | none |
| 3 | Hilbert | `T6` | `Σ = 3 − 1 = 2 = e − 1` | agrees (r19) | none |
| 4 | Hilbert, separability dropped | `CpCp`, `p = 2` | `d = 2`, `Σ = 3` | hypothesis needed (r19) | none |
| 5 | §3a.1 Check `z^p − t^(p−1)z = s` | `p` | `#G_0 = p`, `e = 1`, `d = p − 1 = Σ` | consistent (r19) | none |
| 6 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees (r19) | none |
| 7 | same, below `−1` | unramified quadratic | `φ(−2) = −3`, `ψ(−2) = −3/2` | stated on `[−1, ∞)` (r19) | none |
| 8 | same, trivial action | `C_2` on `ℤ_2` | ratio `1`, `φ = id` | agrees (r19) | none |
| 9 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees (r19) | none |
| 10 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs `G_3 = {1, 5}` | wrong model excluded (r19) | none |
| 11 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `ψ_G(1/2) = 1`; `(G/H)^(1/2) = 1` | agrees (r19) | none |
| 12 | Herbrand | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ G/H = (G/H)^2` | agrees (r19) | none |
| 13 | Herbrand | `T6`, `H = A_3`, `v = 0, −1` | `A_3 ↦ 1`; `G ↦ G/H` | agrees (r19) | none |
| 14 | Herbrand, separability dropped | `I2`, `v = 1/2` | order `2` vs `1` | hypothesis needed (r19) | none |
| 15 | tower (Lean 130) | `Z9`, `H = C_3`, `u = 5` | `φ_G(5) = 3/2`; `φ_(G/H)(3) = 3/2` | agrees (r19) | none |
| 16 | tower | `Z8`, `H = {1, 7}`, `u = 7` | `φ_G(7) = 3`; `φ_(G/H)(4) = 3` | agrees (r19) | none |
| 17 | tower below `−1` | any | both `−1 + f(u + 1)` | harmless (r19) | none |
| 18 | tower, separability dropped | `I2`, `u = 1` | `1` vs `1/2` | hypothesis needed (r19) | none |
| 19 | Hasse–Arf (Lean 151) | `Z9` | `6 ∣ 0`, `6 ∣ 6`; non-jump `6 ∤ 3` | agrees (r19) | none |
| 20 | Hasse–Arf | `Z8` | `4 ∣ 4`, `4 ∣ 8`; non-jump `4 ∤ 6` | agrees (r19) | none |
| 21 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed (r19) | none |
| 22 | Hasse–Arf, infinite residue | `AS` over `F̄_p((t))` | `p ∣ p` | agrees (r19) | none |
| 23 | negative control | abstract `C_9` | `9 ∤ 21`, `φ(5) = 7/3` | consistent (r19) | none |
| 24 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees (r19) | none |
| 25 | same, non-henselian | `ℚ`, `ℤ_(5)`, `ℚ(i)` | `D_M = 1` | decomposition groups needed (r19) | none |
| 26 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | `𝔪 = 0`, `G_0 = 1` = inertia | agrees (r19) | none |
| 27 | `_zero` | `W` | `ψ(0) = 0`; inertia `= G_K` | agrees (r19) | none |
| 28 | `_zero` | `ℚ_p`, Frobenius lift | outside both sides | agrees (r19) | none |
| 29 | `_zero`, `q`-power step | `F_p((t))`, `t^(1/p)` | `(σx − x)^p = 0` | sound (r19) | none |
| 30 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G`; `G_2 = {1, 5}` | agrees (r19) | none |
| 31 | same, perfectness dropped | `I2`, `u = 1/2` | `≤ 2` vs `4` | hypothesis needed (r19) | none |
| 32 | `0+` (Lean 239) | `W`, `K(ζ_3)` | `P_K ↦ 1`, `I_K ↦ C_2` | strict inclusion (r19) | none |
| 33 | `0+` | `ℂ((t))` | `G_1 = 1`; both `⊥` | agrees (r19) | none |
| 34 | `0+` | `AS` over `F̄_p((t))` | `G_1 = C_p` for `0 < w ≤ 1` | agrees (r19) | none |
| 35 | subgroup identity (Lean 263) | `S3`, `H = ⟨(12)⟩`, `u = 0, 1/2, 2` | LHS `H, 1, 1` = RHS `H, 1, 1` | agrees (r19) | none |
| 36 | same | `H = G`; `H = ⊥` | `φ_G ∘ ψ_G = id`; `⊤ = ⊤` | agrees (r19) | none |
| 37 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ(1) = 2`, `H^2 = H`; `ψ(3/2) = 5`, `1 = H^3` | agrees (r19) | none |
| 38 | same, `L` not Galois | `L = ℚ_3(∛3)` | `ψ = u` on `[0, 3/2]`, `3u − 3` after; `ψ(2) = 3` | agrees (r19) | none |
| 39 | same, `u = −1` | any | `G_K ↦ G_L` | agrees (r19) | none |
| 40 | same, `hO′` dropped | `W`, trivial `O′` | `G_L` vs `⊥` | hypothesis needed (r19) | none |
| 41 | integral formula | `L = ℚ_3(∛3)` | slopes `1`, then `3` | agrees (r19) | none |
| 42 | integral formula | unramified quadratic | `(1/2)·∫_0^u 2 dt = u` | agrees (r19) | none |
| 43 | §4a.3 base change | `Z9` | `d/e = 9/6 = 3/2`; upper jumps `0, 1` | agrees (r19) | none |
| 44 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; upper `1, 2` | agrees (r19) | none |
| 45 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `ℚ_(p²)`; `X^e − t` | uniformizer kept; splits; `#G_0 = e` | agrees (r19) | none |
| 46 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p` | agrees (r19) | none |
| 47 | sampled: graded norms | `AS`; tame `C_e`; `F_3` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`; kernel `μ_e`; `{0, ±√2}` | agrees (r19) | none |
| 48 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; unbounded degree; `v = 1/2 ∉ ℤ` | agrees (r19) | none |
| 49 | ownership of local-field `G_K^u` (scope 112–115) | main; #1215; #1411 | main: 0 hits; #1215 187–191: Layer 7 owns; #1411 137–139, 508: §4a.1 owns | handed back by #1411 (r19) | R01 |
| 50 | "takes no input from it" (115) | the same three texts | #1411 539–545 consumes `absoluteUpperRamificationGroup` | false at #1411 (r19) | R01 |
| 51 | agreement claimed at 116–119 | `Z8`, depths `0..3` | `(ℤ/8)ˣ, (ℤ/8)ˣ, {1,5}, {1}` on both sides | agrees (r19) | none |
| 52 | `IsGalois` reason (119–121) | pin `Herbrand/Basic.lean` | `herbrandOrderIso` at 251 under `[IsGalois K L]` | agrees (r19) | none |
| 53 | Conventions example | `F_p(s)((t))` | `e = 1`, `e = 1`; difference `t^(1/p)`, `v = 1/p` | agrees (r19) | none |
| 54 | `K^ur` over perfect `k` | `F̄_p((t))`, `K(t^(1/p))` | `e = p`, `f = 1` | agrees (r19) | none |
| 55 | Layer-4a-only objects | grep of Layer 3a | 0 occurrences | agrees (r19) | none |
| 56 | `H_i` quantified over subgroups | `ℚ_3 ⊂ ℚ_3(ζ_9)` | no `K′` | agrees (r19) | none |
| 57 | `K̃ = Frac A′` | `k = F_2(s)` | `s^(1/2)` in residue field of `A′` | agrees (r19) | none |
| 58 | `H_i = H ∩ G_i` | `S3`, `H = ⟨(12)⟩` | `H_0 = H`, `H_1 = 1` both sides | agrees (r19) | none |
| 59 | separability inherited | `k ⊆ k_F ⊆ l`; `I2` | both steps separable; `I2` fails at top | agrees (r19) | none |
| 60 | class formula | `Z8`, `H = {1, 7}` | `(4 + 2)/2 = 3 = v(−2√2)` | agrees (r19) | none |
| 61 | Herbrand's lemma | `Z8`, `H = {1, 7}`, `u = 1, 3, 4` | `φ_H = 1, 2, 5/2`; `G_uH/H = G/H, G/H, 1` | agrees (r19) | none |
| 64 | description *Dependencies* | grep of README | `ProfiniteCohomology` 0 hits; §F.3a consumed 0 times | contradicts (r19) | R02 |
| 65 | description: #879 cites §§3a–4a | `roadmaps grep` | 0 lines from FiniteFlatGroupsAndIntegralPadicHodgeTheory | false (r19) | R02 |
| 66 | description: #1411 consumes §4a.1 | README 115 | "takes no input from it" | contradicts (r19) | R01 |
| 67 | summary 16–17: finite Galois objects are the completed roadmap's | `Z8` | lower jumps `1, 3`; `φ(1) = 4/4 = 1`, `φ(3) = (4+2+2)/4 = 2`; `ψ(2) = 3` = `inverseHerbrand` | agrees | none |
| 68 | summary 17: inertia and wild inertia are the completed roadmap's | `ℚ_2`, `Z8` | `G_K^0 ↦ G_0 = (ℤ/8)ˣ` = image of `inertiaSubgroup`; `G_K^(0+) ↦ G_1 = (ℤ/8)ˣ` = image of `wildInertiaSubgroup` | agrees | none |
| 69 | summary 17–18: upper filtration is ClassFieldTheory Layer 7's | main b0fe353; #1215 | main Layer 7 (1312) is the Artin map, 0 hits; #1215 1188: `localAbsoluteUpperRamificationGroup` | only #1215 defines it | R01 |
| 70 | summary 18–19: `K′` is `Breve E` | `E = ℚ_p`; `E = F_q((t))` | `K′ = W(F̄_p)[1/p]`, `e(K′/E) = 1`, residue `F̄_p`; `K′ = F̄_q((t))`; RG2.0.4 at 852/860 | agrees | none |
| 71 | summary 19–20: non-Galois `ψ` is this roadmap's | `L = ℚ_3(∛3)`, via `S3`, `H = ⟨(12)⟩` | `ψ_(M/K)(v) = 2v` to `3/2`, then `3 + 6(v − 3/2)`; `φ_(M/L) = u/2`; `ψ_(L/K)(2) = φ_(M/L)(6) = 3`; Tau Ceti: needs `IsGalois` | agrees | none |
| 72 | 3a bullet 50–51: agreement list | §3a.2 bullet 469–474; pin | five Herbrand and upper objects listed; `lowerRamificationGroup` and `differentExponent` definitional | matches targets | none |
| 73 | old "every one of these objects" (negative control) | a local field and §3a.3's `U_K` proalgebraic | residue field finite, not algebraically closed: no proalgebraic object | old claim vacuous; narrowing correct | none |
| 74 | 3a bullet 51–52: recovers `hasseArf` | `Z8`; `Z9` | upper jumps `1, 2`; `0, 1`, all integers | agrees | none |
| 75 | downstream 1149–1153: open-subgroup identity on a local field | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `G_K^1 ↦ C_3 = H = H^(ψ(1)=2)`; `G_K^(3/2) ↦ 1 = H^3` | agrees | none |
| 76 | downstream: sole owner of `ψ_(L/K)` | #1215 ClassFieldTheory | 0 hits for `ψ_(L/K)` and the open-subgroup identity | §4a.2 sole owner | none |

Row 71 in full: `ψ_(L/K) = φ_(M/L) ∘ ψ_(M/K)`. Then `ψ_(M/K)(2) = 3 + 6·(1/2) = 6` and `φ_(M/L)(6) = 3`, which matches `3·2 − 3 = 3`.

### Lean form and signatures

- **Signatures.** `Suggested.lean` is byte-identical to c948d04. I put `#check @name` for all 13 declarations in one scratch copy and elaborated it once (exit 0). After whitespace normalisation, every elaborated type is identical to `signatures.md` (13/13), and none lost a binder.
- **Padding and headlines.** These are unchanged from r19: the one-tactic probe closes none of the 9 theorems, and every headline is stated except §4a.3, which the module docstring names as not statable.

### Library declarations opened at the pins (this round)

All in Tau Ceti:
- `NumberTheory/LocalField/Different/Basic.lean` 92 (`differentExponent`) and `Different/Hilbert.lean` 93;
- `Unramified/Inertia/Basic.lean` 112 and `Unramified/Inertia/Finite.lean` 57;
- `WildInertia.lean` 251 and 702;
- `Herbrand/Basic.lean` 251 and 255.

### Cross-roadmap citations resolved

- **Main** moved from 19d2a1c to b0fe353. Only the PROGRESS and STATUS files of LFunctions and PositiveScalarCurvature changed, so no supplier README changed.
- **ClassFieldTheory:**
  - main: Layer 7 at line 1312, with 0 hits for "absolute upper";
  - #1215 (head 34c49de; ClassFieldTheory unchanged since b9e8822): lines 187–191 and 1188–1199, and `Suggested.lean` line 109;
  - #1411 at 656f837: lines 96, 137–139, 508 and 539–545.
- **Suppliers on main:** ReductiveGroupsPartII §RG2.0.4 at line 852 and EtaleCohomologyFoundations §F.3a at line 776.
- **Consumers:** #1795 at f235b83 and #1812 at 5b260a9.
- **Tools:** `roadmaps overlaps` finds no pull request that changes this folder and no dropped id. `roadmaps resolve` finds nothing unresolved.
- **Remark on untouched text:** none.

## Not verifiable

- `serre-local-fields` is settled as uncertified, and its locators are cited without the text.
- #1411, #1795 and #1812 have no checkout in this brief. I read them at their indexed heads through `roadmaps show`; the line numbers are those of the printed files.

## Source issues

- none
