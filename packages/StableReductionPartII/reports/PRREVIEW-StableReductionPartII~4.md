# Review of StableReductionPartII (pull request #1841 at 5f91589)

**Verdict:** needs changes

## R01 (P2) — The change gives Layer 5 a Picard comparison that a roadmap on main already owns, and never states it

**Location:** `TauCetiRoadmap/StableReductionPartII/README.md` lines 104–105: "Layer 5 of this roadmap proves the Picard comparison". Line 6587 (§5.15): "Prove … the codimension-one Picard comparison on this smooth Deligne–Mumford stack". Line 6641 (§5.18): "Section 5.15 gives the injective Pic⊗Q→CH¹⊗Q comparison".

**Claim:** EquivariantIntersectionTheory, which is on main, already proves `c₁ : Pic[X/G] ≅ A¹_G(X)` for smooth X, together with the Edidin–Graham mixed-space Chow groups and their operations, and these cover the presentation M̄_g/C ≅ [U_g/PGL(5g−5)] of §1.11. §5.15 claims this comparison as its own work, yet its statement (line 6585) gives only `c₁(P_g)=f_*(c₁(ω_f)²)`. §5.18 relies on an injectivity statement that no target makes.

**Witness:** EquivariantIntersectionTheory §2.4 (main c9dea9d, added 2026-11-09) proves that `c₁ : Pic^G(X) → A¹_G(X)` is an isomorphism for smooth X, and with §1.4 that `Pic[X/G] ≅ A¹_G(X)`. Its §§2.1–2.2 build the mixed spaces and the equivariant pushforward that the §5.15 route rebuilds.

**Repair:**
1. Replace lines 102–106 with: "VirtualFundamentalClass §§2.1–2.3 supply the rational Chow groups of separated Deligne–Mumford stacks, proper pushforward, Chern classes and the projection formula. EquivariantIntersectionTheory §§2.1–2.2 supply the Edidin–Graham equivariant Chow groups and their operations, and §2.4 supplies `c₁ : Pic[X/G] ≅ A¹_G(X)` for smooth X. Use SchemeAndStackFoundations §§5.1–5.8 for the scheme-level theory. Layer 5 of this roadmap proves the rational comparison of §5.15, the Deligne-pairing comparison, and (§5.16) the codimension-one Grothendieck–Riemann–Roch identity for the universal curve over M̄_g/C."
2. Replace the second sentence of line 6587 with: "Through §1.11, M̄_g/C ≅ [U_g/PGL(5g−5)], and EquivariantIntersectionTheory §2.4 gives `c₁ : Pic(M̄_g/C) ≅ A¹_{PGL(5g−5)}(U_g)`. Prove the pairing Chern comparison, and prove that the Edidin–Graham comparison `A¹_{PGL(5g−5)}(U_g)⊗Q ≅ CH¹(M̄_g/C;Q)` ([mc5-edidingraham1997](#references), Proposition 14, p. 28) makes `c₁ : Pic(M̄_g/C)⊗Q → CH¹(M̄_g/C;Q)` an isomorphism, so in particular injective."
3. In §5.18 (line 6641), replace "Section 5.15 gives the injective Pic⊗Q→CH¹⊗Q comparison on the stack" with "The isomorphism `c₁ : Pic(M̄_g/C)⊗Q → CH¹(M̄_g/C;Q)` of §5.15 is injective".
4. Add "EquivariantIntersectionTheory §§2.1, 2.2, 2.4" to the *Needs:* lines at 6595 and 6649.

The repair was tested on two cases. For Bμ_r over C, EquivariantIntersectionTheory's §2.4 Check gives Pic = A¹_{μ_r} = ℤ/r, which vanishes rationally, so the injective map is 0 → 0. For g = 2, A¹_G(U_2) = A^G_{26}(U_2) corresponds to A_2(M̄_2) = CH¹(M̄_2).

## R02 (P3) — The new supplier has no contract subsection, no scope entry and no Layer 5 dependency

**Location:** `TauCetiRoadmap/StableReductionPartII/README.md` line 102: "VirtualFundamentalClass Layer 2 supplies the rational Chow groups…" sits under `### From TauCetiRoadmap.SchemeAndStackFoundations`. Line 6708 (Layer 5 Dependencies): "SchemeAndStackFoundations §§1.22, 2.18–2.20, 3.4, 5.1–5.8; ComplexComparisonPartII §§C3.2d.1–C3.2d.4".

**Claim:** VirtualFundamentalClass is now a supplier of §§5.15, 5.16 and 5.18. Scope and ownership does not mention it, it has no contract heading of its own, and Layer 5's Dependencies omit it. The *Needs:* lines cite all of its Layer 2, including refined Gysin and bivariant theory (§§2.4–2.5) that these targets never use.

**Witness:** In this README, `VirtualFundamentalClass` occurs only at lines 102, 6587, 6589, 6595, 6607 and 6649. In VirtualFundamentalClass, §2.1 covers rational Chow groups, §2.2 pushforward and the projection formula, §2.3 Chern classes, and §§2.4–2.5 Gysin maps and bivariant groups.

**Repair:**
- Put the paragraph of R01 under a new `### From TauCetiRoadmap.VirtualFundamentalClass` heading and a new `### From TauCetiRoadmap.EquivariantIntersectionTheory` heading.
- Add this Scope-and-ownership bullet: "VirtualFundamentalClass §§2.1–2.3 supplies Vistoli's rational Chow groups of separated Deligne–Mumford stacks, with proper pushforward, the projection formula and Chern classes. EquivariantIntersectionTheory §§2.1–2.2 and 2.4 supplies the Edidin–Graham equivariant Chow groups and `Pic[X/G] ≅ A¹_G(X)` for smooth X."
- Change "VirtualFundamentalClass Layer 2" to "VirtualFundamentalClass §§2.1–2.3" at lines 6587, 6589, 6595, 6607 and 6649.
- Append "; VirtualFundamentalClass §§2.1–2.3; EquivariantIntersectionTheory §§2.1, 2.2, 2.4" to line 6708.

## R03 (P3) — "The stack form of Grothendieck–Riemann–Roch" is promised, but no target states it

**Location:** `TauCetiRoadmap/StableReductionPartII/README.md` lines 105–106: "Layer 5 of this roadmap proves … the stack form of Grothendieck–Riemann–Roch used in the Noether computation". Line 6601 (§5.16): "Prove the form of Grothendieck–Riemann–Roch for this universal curve by the equivariant chart comparison of §5.15".

**Claim:** No target says which GRR identity is meant, for which morphism, or in which degrees. §5.16's statement (line 6599) is only the Noether identity, and §5.15 explicitly disclaims a stack GRR.

**Witness:** Line 6591: "The smooth-scheme GRR signature is not advertised as arbitrary singular or stack GRR."

**Repair:**
- At line 6601, replace the GRR sentence with: "Prove, for the universal curve f:M̄_{g,1}→M̄_g over C, `ch(Rf_*ω_f) = f_*(ch(ω_f)·td(T_f))` in `CH^{≤1}(M̄_g/C;Q)`, where `T_f = [T_{M̄_{g,1}}] − f*[T_{M̄_g}]`. Use SchemeAndStackFoundations §5.8 on the mixed spaces of EquivariantIntersectionTheory §2.1 for the presentation of §1.11, and the comparison of §5.15."
- Add "EquivariantIntersectionTheory §2.1, SchemeAndStackFoundations §5.8" to line 6607.
- Use the wording of R01's paragraph at lines 105–106.

The repaired statement was tested on the quartic Lefschetz pencil. Degree 1 gives λ = 3 = f_*td₂(T_f) = (9+27)/12.

## R04 (P3) — The description omits the new supplier and still assigns stack results to SchemeAndStackFoundations

**Location:** Pull-request description, Dependencies paragraph: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite." Summary: "Generic stack, nefness and ampleness results stay with SchemeAndStackFoundations".

**Claim:** At this head, VirtualFundamentalClass is a prerequisite of §§5.15, 5.16 and 5.18. It is an open new roadmap by another author, and the prose dependency list leaves it out. Rational stack Chow theory is no longer SchemeAndStackFoundations'.

**Witness:** README line 6595: "*Needs:* VirtualFundamentalClass Layer 2, …". The description's own generated depends-on block lists "#1996 VirtualFundamentalClass".

**Repair:**
- Append to the Dependencies paragraph: "In an open pull request by another author: #1996 (VirtualFundamentalClass §§2.1–2.3, rational Chow groups of Deligne–Mumford stacks)."
- Replace the summary sentence with: "Generic stack, nefness and ampleness results stay with SchemeAndStackFoundations, rational Chow groups of Deligne–Mumford stacks with VirtualFundamentalClass, and equivariant Chow and Picard groups of quotient stacks with EquivariantIntersectionTheory. This roadmap refines them rather than proving them again."

## Previous findings

- None. The review of 64895ca raised no finding of its own. The two repairs it confirmed (§2.146 Check 2, and the Ile §7 range pp. 25–26) are outside this diff and unchanged at 5f91589.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Contract lines 102–104: what VirtualFundamentalClass supplies | its §§2.1–2.5 at head 676f128; M̄_g/C | §2.1 Vistoli rational Chow of separated DM stacks; §2.2 pushforward and projection formula with c₁; §2.3 Chern classes; M̄_g/C is separated, smooth, finite type over C | Supplied; citing all of "Layer 2" is too broad (R02) |
| §5.15 / §5.18 Picard comparison | Bμ_r/C; g = 2 dimensions; M̄_3 | Pic Bμ_r = ℤ/r = A¹_{μ_r}, ⊗Q gives 0→0; dim U_2 = 27, dim PGL(5) = 24, A^G_{26}(U_2) ↔ A_2(M̄_2) = CH¹; M̄_3 has rank 3 (λ, δ₀, δ₁) on both sides | True, but owned by EquivariantIntersectionTheory §2.4 and not stated (R01) |
| §5.15 `c₁(P_g)=f_*(c₁(ω_f)²)` | isotrivial C×B; quartic Lefschetz pencil S = Bl₁₆ℙ², g = 3 | 0 = 0; κ = (K_S+2F)² = −7+16+0 = 9 | Consistent; statement unchanged |
| §5.16 rational Noether `12λ = κ+δ` | quartic pencil; isotrivial family | 12·deg λ = 12·(1+2) = 36; δ = 19 − 2·(−4) = 27; κ+δ = 9+27 = 36; isotrivial: 0 = 0+0 | Holds, with coefficient +1 on δ |
| §5.16 GRR step (repair of R03) | quartic pencil, degrees 0 and 1 | ch₀: g−1 = 2 = f_*(½c₁ω); ch₁: λ = 3; c₂(T_f) = 19+8 = 27, f_*td₂ = (9+27)/12 = 3 | Repaired statement holds; the original states none |
| §5.18 torsion defect | quartic pencil; torsion character line on Bμ_r | c₁(N) = 36−9−27 = 0; on Bμ_r, c₁ = 0 in CH¹_Q but the class has order r in Pic | Agrees with the existential exponent |
| Edidin–Graham locators used in the R01 repair | Corollary 1; Proposition 14 | `mc5-edidingraham1997 line 322` (p. 9): c₁:Pic^G(X)≅A¹_G(X) for smooth X; `line 1059` (p. 28): A^G_i(X)⊗Q = A_{i−g}([X/G])⊗Q | Locators correct |

Rows for statements the diff does not touch (§§2.146, 2.147, 2.237, the five Lean headlines and the rest) stand as in the previous review, of 64895ca.

- **Gate:** re-run at 5f91589, every check 0, OK. The worker's `gate.md` also records build=0. The diff since 64895ca touches only `README.md` (12+/8−), and the outside-folder diff is empty.
- **Dependency check:** `depcheck: 228 roadmaps, 2056 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. VirtualFundamentalClass is not in ORDER.txt. Its suppliers are on main, apart from DerivedDeRhamCohomology at ORDER line 23, so it falls before this roadmap (line 319). It names this roadmap only as a consumer.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/StableReductionPartII/Suggested.lean` took 29 s and printed exactly five `declaration uses sorry` warnings (lines 122, 139, 148, 155, 171). The file is byte-identical to 64895ca, so the signature comparison and the padding probe stand.
- **Source locators:** 6 checked in `mc5-edidingraham1997`: Corollary 1 (line 322), Theorem 3 (line 662), and Propositions 14, 15, 16 and 18 (lines 1059, 1069, 1081, 1122).
- **Cross-roadmap citations:** 13 resolved. VirtualFundamentalClass §§2.1–2.5 and its scope (lines 214–226 of its README at 676f128). EquivariantIntersectionTheory §§1.4, 2.1, 2.2, 2.4 and Convention 5 (main). SchemeAndStackFoundations §§5.1–5.10 and §5.8 GRR (main). `citations.md` still has its single lead, an AlgebraicModuliForArithmeticGeometry §3.5 target name.
- **Seeded sample:** none of the 15 seeded targets (2.21 … 7.2) lies in or depends on the changed passages. §5.12's *Needs:* cites neither §5.15 nor §5.16.
- **Remark (no change asked here):** `design/plan.json` still declares gap:stack-chow-grr (SchemeAndStackFoundations §§5.1–5.8). The README at this head states 27 of the 28 declared gaps, so the intake's announcement of that gap is now stale.
- **Remark on untouched text:** §5.16's "Use Pic≅CH¹ on the regular stack" is integral, while §5.18 uses the rational form.

## Not verifiable

- Ownership against open pull requests: checked only through `overlaps.md`, `citations.md`, `roadmaps grep` for stack, equivariant and Vistoli Chow, and VirtualFundamentalClass at its head (index of 2026-11-11T12:04:54Z).
- `blr-relative-picard-LwkQQl` and `mc6-fc1990`: settled as uncertified and outside the changed passages.

## Source issues

- **Misprint** in mc5-edidingraham1997 at Proposition 16, proof, p. 28: the source defines the second mixed space as X ×^H U₂; it should be Y ×^H U₂; affects nothing.
