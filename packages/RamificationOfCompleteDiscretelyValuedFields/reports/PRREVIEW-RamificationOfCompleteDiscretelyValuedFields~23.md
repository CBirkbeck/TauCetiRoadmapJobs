# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 1dc3055)

**Verdict:** needs changes

This is a full review of the head that the previous review also read: nothing in the folder changed and the pull-request description is unchanged. Four P3 findings, none blocking.

- R01 and R02 are the previous review's two description findings. Neither is repaired.
- R03 and R04 are new README findings. In each, the proof routes use pinned Mathlib or Tau Ceti theorems that the README neither names in a supplier contract nor in a *Needs* line.
  - R03 is a regression: the review of an earlier head, 4afb43d, recorded these citations as added, and that head is no longer in the branch history.
  - R04 has a downstream symptom: ArithmeticGaloisRepresentations restates `|G_0| = e` because it finds no owner for it here.

No `Suggested.lean` change is asked.

**Previous findings.**
- **R01 (r22) — not repaired.** The description's *Merge order* still reads "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411", and the description still does not name #1215. Carried as R01.
- **R02 (r22) — not repaired.** *Dependencies* still lists "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)". *Why* still names #879. The **Summary** still says "every object restricts to the completed roadmap's". Carried as R02.
- No repair report marks either finding as not actionable.

**Mechanical checks at this head.**
- **Gate**, re-run: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. My run prints no build field; the worker's gate at this head reports `build=0`, and my own elaboration passes.
- **Dependency check**: `depcheck: 239 roadmaps, 2324 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration**: `lake env lean` on `Suggested.lean` exits 0 in 7.7 s. The only messages are nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Declared gaps**: none (there is no `design/plan.json`).

## R01 (P3) — The description still makes #1411 a consumer of §4a.1 and does not name #1215

**Location.** Pull-request description:
- *Merge order*: "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411";
- *Why*: "the ClassFieldTheory amendment #1411 consumes the absolute upper filtration".

`TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md` lines 116–118 say the opposite: the local-field filtration "is ClassFieldTheory Layer 7's. ClassFieldTheory precedes this roadmap … it takes no input from this roadmap."

**Claim.** The description contradicts the README.
- The README's assignment to ClassFieldTheory Layer 7 holds only at #1215. On main, ClassFieldTheory Layer 7 has no upper filtration.
- When an id's content exists only in an open revision, that revision has to be named in the description or in its merge-order paragraph. #1215 is named in neither.
- Following #1411's head instead turns ClassFieldTheory, which is on main, into an upward consumer.

**Witness.**
- `gate --depcheck` on ClassFieldTheory at #1411 (656f837): `UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#2) at README lines [507, 538, 1435, 1488]`, 1 problem.
- The same check at #1215 (024927f): 0 problems.
- #1215 defines `localAbsoluteUpperRamificationGroup` in its README at lines 1188–1199 and in its `Suggested.lean` at lines 109–117.

**Repair** (description only):
- Replace *Merge order* with: "ClassFieldTheory's revision #1215, whose Layer 7 defines the absolute upper filtration of a nonarchimedean local field, precedes this pull request; ClassFieldTheory takes no input from this roadmap. #940, #856, #1713, #1795 and #1812 cite §§3a–4a and merge after this pull request."
- In *Why*, delete the #1411 clause.
- In the roadmap-summary block, replace "ClassFieldTheory needs the absolute upper filtration for reciprocity–filtration compatibilities" with "On a nonarchimedean local field its absolute upper filtration agrees with ClassFieldTheory Layer 7's."
- For #1411's own review: its §4a.1 citations, at README lines 95, 136–137, 507, 538–540 and 1390–1392, need to point at #1215's Layer 7 object.

**Tested.**
- With the repaired text, the description and the README give the same order: #1215, then this roadmap, then its consumers.
- On `ℚ_2(ζ_8)` at `u = 3/2`, #1215's definition and §4a.1's fourth bullet both give `{1, 5}` (row 51).

## R02 (P3) — The description lists suppliers and a consumer the README does not have, and its Summary sentence is false

**Location.** Pull-request description:
- *Dependencies*: "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)";
- *Why* and *Merge order*: "#879";
- **Summary**: "On a nonarchimedean local field every object restricts to the completed roadmap's".

**Claim.** Each of these contradicts the README.
- README line 99 says this roadmap "consumes nothing from that section" (§F.3a).
- The README never names ProfiniteCohomology.
- #879 does not cite this roadmap. Its README lines 124–129 route the package through PadicPeriodRings §0.3 and ArithmeticGaloisRepresentations §3.0, and both of those consume this roadmap.
- README lines 16–21 name three local-field objects that are not the completed roadmap's:
  - ClassFieldTheory Layer 7's filtration;
  - `Breve E`;
  - the non-Galois `ψ_(L/K)`.

**Witness.**
- `grep -c ProfiniteCohomology README.md` returns `0`.
- `roadmaps grep --fixed RamificationOfCompleteDiscretelyValuedFields` returns lines from #1215, #1410, #1411, #1713, #617, #856 and #940, and none from #879.
- §4a.2 gives `ψ_(L/K)(2) = 3` for `L = ℚ_3(∛3)`. The pinned Herbrand objects need `[IsGalois K L]`.

**Repair.**
- Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. EtaleCohomologyFoundations §F.3a and ClassFieldTheory Layer 7 (#1215) are named in the scope as owners and are not suppliers."
- Drop #879 from *Why* and *Merge order*.
- Replace the **Summary** sentence with the sentence at README lines 16–21.

**Tested.** Every section named in the new *Dependencies* resolves on main at 28c3fca:
- ReductiveGroups Layer 3, line 234;
- SchemeAndStackFoundations §0.24, line 1565;
- AdicSpacesPartII §R0.19.9, line 7793;
- ReductiveGroupsPartII §RG2.0.4, line 852.

## R03 (P3) — The pinned local-field tower and intersection theorems are restated, not cited

**Location.**
- README lines 228–241 (the LocalFieldsRamification contract's Herbrand bullet). It cites `psiNat_tower` and `map_restrictNormalHom_upperRamificationGroup` only.
- §3a.2, lines 465–471: tower transitivity, and "for the same tower, `Gal(M/L) ∩ Gal(M/K)^v = Gal(M/L)^(ψ_(L/K)(v))`".
- §3a.2's agreement bullet, lines 472–478, which lists objects only.
- §4a.2's second bullet, lines 930–935.
- The scope, lines 121–127, which gives "the finite-level subgroup identity" on local fields to §4a.2.

**Claim.** For a Galois tower of nonarchimedean local fields, the pinned Tau Ceti already proves:
- tower transitivity, in both directions;
- the intersection formula, which is also §4a.2's subgroup identity when `L/K` is Galois.

The README states the general forms but names neither pinned theorem. That contradicts line 76, "it defines nothing a second time on local fields", and the pattern the README follows for `hasseArf` and `differentExponent_eq_finsum_lowerRamificationGroup`.

**Witness.** In `TauCeti/NumberTheory/LocalField/Herbrand/`:
- `UpperQuotient.lean` line 129, `TauCeti.LocalFieldsRamification.comap_restrictScalarsHom_upperRamificationGroup`: `H ∩ G^v = H^(ψ_(L/K)(v))` under `[IsGalois K L] [IsGalois K M]` (line 33);
- `Tower.lean` line 199, `herbrand_tower`;
- `Tower.lean` line 216, `inverseHerbrand_tower`.

`grep restrictScalarsHom README.md` returns 0 lines.

**Repair.**
1. In the Herbrand bullet of the LocalFieldsRamification contract, after `psiNat_tower`, add: "`herbrand_tower` and `inverseHerbrand_tower` (`Herbrand/Tower.lean`), and the intersection formula `TauCeti.LocalFieldsRamification.comap_restrictScalarsHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean`; for `M/L/K` with `L/K` and `M/K` Galois, `Gal(M/L) ∩ Gal(M/K)^v = Gal(M/L)^(ψ_(L/K)(v))`)".
2. Append to §3a.2's agreement bullet: "; through it, tower transitivity and the intersection formula restrict there to `TauCeti.LocalFieldsRamification.herbrand_tower`, `TauCeti.LocalFieldsRamification.inverseHerbrand_tower` and `TauCeti.LocalFieldsRamification.comap_restrictScalarsHom_upperRamificationGroup`, consumed and not restated". Add the three names to §3a.2's *Needs*, for the local-field instance.
3. In §4a.2's second bullet and in the scope at line 125, add: "for Galois `L/K` of nonarchimedean local fields this is the completed roadmap's `comap_restrictScalarsHom_upperRamificationGroup`; §4a.2 owns it for `L/K` not Galois". Add the name to §4a.2's *Needs*.

**Tested.** On `M = ℚ_2(ζ_8)`, `L = ℚ_2(√2)`, `H = {1, 7}`:
- At `v = 3/2`: `G^(3/2) = G_2 = {1, 5}`, and `{1, 5} ∩ H = 1`. On the other side, `ψ_(L/K)(3/2) = 3/2` and `H^(3/2) = H_(ψ_H(3/2)) = H_2 = 1`.
- At `v = 3`: both sides are `1`, since `ψ_(L/K)(3) = 4` and `H^4 = H_7`.
- The pinned theorem gives the same values (row 50).

For `L = ℚ_3(∛3)` the pinned theorem does not apply, since it needs `IsGalois K L`, so §4a.2 stays the owner there (row 52).

## R04 (P3) — Proof routes use `|G_0| = e`, `G ↠ Gal(k_L/k)` and the Eisenstein-generator theorem without naming them

**Location.**
- §3a.3's proof, lines 679–688: "its inertia group `G_0 = Gal(L/K_0)`, where `K_0` is the maximal unramified subextension … `L/K_0` is totally ramified … integer ring `A′[π_L]`".
- §4a.1's proof, lines 822–824: "`Gal(M/K)^0` is the inertia group of `M/K`, whose fixed field is the maximal unramified subextension".
- §4a.3's proof, lines 1037–1039.
- The residue-enlargement target, lines 583–587: "integral closure `R′[π_E]` … the Eisenstein generator remains a uniformizer".
- §3a.1 (lines 350–380) states neither `#G_0 = e` nor the surjection onto `Gal(k_L/k)`.
- The *Needs* of §§3a.3, 4a.1 and 4a.3 cite only Mathlib's `Polynomial.IsEisensteinAt` with its irreducibility criterion.

**Claim.** Every step quoted above rests on a pinned theorem that no contract or *Needs* line names.
- Under separable residue extension, the fixed field `K_0` of `G_0` is the maximal unramified subextension and `L/K_0` is totally ramified. This needs `#G_0 = e` and `G → Aut(k_L/k)` onto with kernel `G_0`.
- `A[π]` is a discrete valuation ring with uniformizer `π` for an Eisenstein root `π`.

Because §3a.1 does not state the first fact, ArithmeticGaloisRepresentations §3.0 (#856, 00e8930) proves `G/G_0 ≅ Gal(k_L/k)` and `|G_0| = e` itself, calling it "the one clause … that the supplier does not state".

**Witness.**
- Mathlib `NumberTheory/RamificationInertia/Galois.lean` line 315, `Ideal.card_inertia_eq_ramificationIdxIn`, under `[Algebra.HasSeparableResidueFieldsAt R S p]`.
- Mathlib `RingTheory/Invariant/Basic.lean` line 365, `Ideal.Quotient.stabilizerHom_surjective`.
- Tau Ceti `RingTheory/DiscreteValuationRing/Eisenstein.lean`:
  - line 144, `Polynomial.IsEisensteinAt.isDiscreteValuationRing_of_adjoin_eq_top`;
  - line 162, `Polynomial.IsEisensteinAt.irreducible_of_adjoin_eq_top`;
  - line 174, `Polynomial.IsEisensteinAt.ramificationIdx_eq_natDegree`.

**Repair.**
1. In §3a.1, after the `Ideal.sum_ramification_inertia_eq_card` sentence (line 354), add: "For separable residue extension, Mathlib's `Ideal.card_inertia_eq_ramificationIdxIn` gives `#G_0 = e`, and `Ideal.Quotient.stabilizerHom_surjective` makes `G → Aut(IsLocalRing.ResidueField B / k)` onto, with kernel `G_0` (`TauCeti.IsLocalRing.ramificationGroup_zero_eq_ker_toRingAut`); so `G/G_0 ≅ Gal(k_L/k)`, the fixed field `K_0` of `G_0` is the maximal unramified subextension and `L/K_0` is totally ramified."
2. Add those two Mathlib names to the Mathlib contract and to the *Needs* of §§3a.1, 3a.3, 4a.1 and 4a.3.
3. Add the three Tau Ceti Eisenstein names to the Tau Ceti contract. Cite them where the residue-enlargement target, §3a.3's proof and §4a.3's proof say that `A[π]` is the integer ring with uniformizer `π`, and add them to the *Needs* of §3a.3 and §4a.3.

**Tested.**
- `ℚ_3(ζ_9)/ℚ_3`: `#G_0 = 6 = e`, and `G/G_0 = 1 = Gal(F_3/F_3)`.
- A finite unramified quadratic extension: `#G_0 = 1 = e`, and `G/G_0 ≅ C_2 = Gal(F_(q²)/F_q)`.
- The README's own Check at lines 424–427, over `F_p(s)((t))`: `#G_0 = p ≠ e = 1`. This is exactly where `HasSeparableResidueFieldsAt` fails.
- `X^e − t` over `κ[[t]]`: `A[x]` is a discrete valuation ring with uniformizer `x` and ramification index `e`, matching the pinned statements (row 43).

## Verified sound

### Dependency check output

```text
depcheck: 239 roadmaps, 2324 edges, 0 problem(s)
```

The roadmap is line 2 of the merge order, right after JacobianChallenge. Every supplier is on main:
- LocalFieldsRamification and ProfiniteProPGroups (completed);
- ReductiveGroups, SchemeAndStackFoundations, AdicSpacesPartII and ReductiveGroupsPartII.

Every consumer comes later or is at the design stage: PadicPeriodRings at line 21, ArithmeticGaloisRepresentations at 58 and PadicExtensionFamilies at 396; FilteredLocalGaloisGroups and FieldOfNorms are not yet in the order.

### Lean form and signatures

- **Signatures.** I put `#check @name` for all 13 declarations in one scratch copy and elaborated it once. After whitespace normalisation the output is identical to `signatures.md` (9409 = 9409 characters). No declaration lost a binder.
- **Comparison with the README.** I compared each elaborated type with its README statement:
  - Hilbert's formula, Herbrand and tower use the same discrete-valuation-ring generality as §§3a.1–3a.2 (lines 376–380 and 460–470), without completeness.
  - Hasse–Arf matches line 559.
  - The §4a.1 statements match lines 760–770.
  - §4a.2 matches lines 930–942.
- **Lean form.**
  - `module` with `public import Mathlib` and one Tau Ceti module, a form 19 `Suggested.lean` files on main also use.
  - No `set_option`; no sorry'd data.
  - All four definitions have real bodies.
  - `theorem` only, a docstring on every declaration, and layer section comments in README order.
- **One-tactic probe.** I replaced each of the 9 `sorry`s with `first | rfl | simp | infer_instance | (ext; simp) | aesop`, and all 9 fail. There is no padding.
- **Headline theorems**, all stated:
  - Hilbert's formula (62);
  - Herbrand (111) and tower (130);
  - Hasse–Arf (151);
  - the term at `0` (197), finite projections (215) and term at `0+` (239);
  - the finite-level identity (263) and the open-subgroup identity (289).

  §4a.3 is named in the module docstring as not statable, since there is no maximal unramified extension beyond local fields at the pins.

### Seeded sample of sources, read at the locators

- **The perfect-residue Herbrand package** (README line 324). serre1961 n° 3.1 runs from line 856 (printed p. 126) to line 950 (p. 128). It is restricted to totally ramified `L/K` with an arbitrary residue field (lines 861–863), and contains:
  - Proposition 1 with Corollaries 1–2 (lines 875–886, p. 126);
  - Proposition 2 (line 889, p. 127);
  - formula (5) and properties a–d′ (lines 903–926, pp. 127–128);
  - formula (8) (line 929);
  - Proposition 3, the infinite-extension paragraph, Proposition 4 and Kawada's Remarque (lines 931–950, p. 128).

  n° 3.4–3.5 is at lines 1091–1246, pp. 132–136. brinon-conrad Exercise 1.4.4(3) is at lines 382–386, p. 10. The locators are correct.
- **Residue enlargement** (line 579). ega3 Chapitre 0 (10.3.1) is at line 637, printed p. 20. (10.3.1.5) and the completion remark are at lines 733–737, and Corollary (10.3.2) at line 739, all on p. 23. These give a flat local `A → B` with `B/𝔪_A B ≅ K`, and completion keeps the conclusions. The target's discrete valuation ring with `𝔪_(R′) = 𝔪_R R′` follows from this, with `gr(B) = gr(A) ⊗ K`. The locators are correct.
- **Proalgebraic units** (line 600).
  - serre1961 §1 starts at line 74 (p. 106), and n° 1.6 ends at line 365 (p. 113).
  - §2: n° 2.1 is at line 557 (p. 118), with the setting and the coefficient lift in characteristic 0. The Corollary to Proposition 1 (norm onto `U_K`) and Proposition 2 with its Corollary (`H⁻¹ ≅ g/g′`, made explicit by `σ(T)/T`) are at lines 598–621 (p. 119). Proposition 3 (`V⁰ = I·U_L`) and its Corollary (`π₀(V) ≅ g/g′`) are at lines 630–639 (p. 120).
  - serre1960:
    - Definition 2, line 162, p. 8;
    - Proposition 10, line 313, p. 11;
    - Propositions 6–7, lines 546 and 575, pp. 17–18;
    - n° 2.5 Proposition 10 with Corollaries 1–2, lines 625–636, p. 19;
    - n° 5.1 Propositions 1–2, lines 1246 and 1260, p. 35.

  The locators are correct.
- **Graded norms** (line 643). serre1961 has:
  - Proposition 6(a)–(b) at lines 1092–1099 (p. 132);
  - `V_n = V_L ∩ U_L^(ψ(n))`, equation (22), at line 1150, with Proposition 7, sequence (23), at lines 1152–1157 (p. 134);
  - Corollaries 1–3 at lines 1158–1184 (pp. 134–135);
  - Proposition 8(i)–(iii) at lines 1187–1212 (p. 135).

  Each clause of the target matches, including "divides" in the bound and the lift by an element of `U^(ψ(n+1))`. The locators are correct.
- **Agreement with `Breve E`** (line 1058). brinon-conrad Exercise 1.4.4(2)–(3) is at lines 375–386 (p. 10), for `p`-adic fields. The proof of Lemma 13.1.6 at lines 8587–8589 (p. 201) uses the exercise to pass to the completion. The README states the mixed-characteristic restriction. The locators are correct.

### Adversarial table

Notation:
- `Z8 = ℚ_2(ζ_8)/ℚ_2`: `#G_0..#G_4 = 4, 4, 2, 2, 1`, since `σ_5` moves `ζ` by `ζ(ζ^4 − 1)` of valuation `4`, and `σ_3`, `σ_7` by valuation `2`.
- `Z9 = ℚ_3(ζ_9)/ℚ_3`: `#G_0..#G_3 = 6, 3, 3, 1`.
- `S3 = ℚ_3(ζ_3, ∛3)/ℚ_3`: `#G_0..#G_4 = 6, 3, 3, 3, 1`, since `τ` moves `π = (ζ_3 − 1)/∛3` by valuation `4`.
- `AS`: `y^p − y = t⁻¹` over `k((t))`.
- `I2`: `F_2(s)((t))` with `M = K(y, w)`.
- `W = Frac W(F̄_p)`.

All rows were computed this round.

| # | Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `Σ = 5 + 2 + 2 = 9`; `disc ℚ(ζ_9) = 3^(3·3) = 3^9`, `f = 1` | agrees | none |
| 2 | Hilbert | `S3` | `Σ = 5 + 2 + 2 + 2 = 11`; tower `d(M/ℚ_3(ζ_3)) + 3·d(ℚ_3(ζ_3)/ℚ_3) = 8 + 3 = 11` | agrees | none |
| 3 | Hilbert | `Z8` | `3 + 3 + 1 + 1 = 8`; `disc ℚ(ζ_8) = 2^8` | agrees | none |
| 4 | Hilbert, `G = 1` | `A = B` | `differentIdeal = ⊤ = 𝔪^0`; `Σ = 0` | agrees | none |
| 5 | Hilbert, separability dropped | `F_2(s,u)((t))`, `C_2 × C_2`, `B = A[z₁, z₂]` | `d = 1 + 1·1 = 2` (each `f′ = −t`); `G_0 = G`, `G_1 = 1`, `Σ = 3` | hypothesis needed | none |
| 6 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = (4+2+2)/4 = 2`, `φ(7) = 2 + 4/4 = 3`, the same integrand as pinned `herbrandReal` (`Herbrand/Basic.lean` 137) | agrees | none |
| 7 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees | none |
| 8 | same, below `−1` | unramified quadratic | integrand `2` on `(−2, −1]`: `φ(−2) = −3`, `ψ(−2) = −3/2` | Check correct | none |
| 9 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs lower `G_3 = {1, 5}` | wrong model excluded | none |
| 10 | Herbrand (Lean 111) | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 H/H = {1,5}H/H = G/H`; `ℚ_2(√2)`: `v(−2√2) = 3`, `(G/H)^2 = (G/H)_2 = G/H` | agrees | none |
| 11 | Herbrand | `S3`, `H = C_3`, `v = 0, 1` | `v = 0`: `S_3 ↦ C_2 = (G/H)_0`; `v = 1`: `G_2 = C_3 ↦ 1 = (G/H)_2` | agrees | none |
| 12 | Herbrand, `H = G`, `H = 1` | any | trivial quotient on `A`; `G/1 ≅ G` on `B^1 = B` | agrees | none |
| 13 | Herbrand, separability dropped | `I2`, `v = 1/2` | `(G/H)^(1/2) = (G/H)_1 = 1` vs `G^(1/2)H/H = G/H` | hypothesis needed | none |
| 14 | tower (Lean 130) | `Z8`, `H = {1, 7}`, `u = 7` | `φ_G(7) = 3`; `φ_H(7) = 1 + 6/2 = 4`; `φ_(G/H)(4) = 2 + 2/2 = 3` | agrees | none |
| 15 | tower | `S3`, `H = C_3`, `u = 5` | `φ_G(5) = 3/2 + 2/6 = 11/6`; `φ_H(5) = 3 + 2/3 = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | none |
| 16 | tower, separability dropped | `I2`, `u = 1` | `φ_(M/K)(1) = 1` vs `φ_(L₁/K)(φ_(M/L₁)(1)) = 1/2` | hypothesis needed | none |
| 17 | Hasse–Arf (Lean 151) | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 3 + 3` | agrees | none |
| 18 | Hasse–Arf | `Z8` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 8`; non-jump `j = 2`: `4 ∤ 6`, not asserted | agrees | none |
| 19 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed | none |
| 20 | Hasse–Arf, infinite residue field | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | none |
| 21 | Hasse–Arf negative control | abstract `C_9` filtration | `j = 5`: `9 ∤ 9 + 3·4 = 21`; `φ(5) = 7/3` | Check consistent | none |
| 22 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `ψ = 1, 3, 7`: `G_1 = G`, `G_3 = {1,5}`, `G_7 = 1` | agrees | none |
| 23 | same, non-henselian | `ℚ`, `O` over `ℤ_(5)`, `M = ℚ(i)` | `5 = (2+i)(2−i)`; conjugation swaps the two primes, `D_M = 1` | decomposition groups needed | none |
| 24 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | `O ∩ M = M`, `G_0 = 1`; inertia of `O` is `1` | agrees | none |
| 25 | `_zero` | `K = F_q` | `F̄_q` algebraic over `F_p`, so `O = F̄_q`; both sides `1` | agrees | none |
| 26 | `_zero` | `W` | `ψ(0) = 0`; `G_K^0 = G_K`; inertia `= G_K` | agrees | none |
| 27 | `_zero` | `ℚ_p`, Frobenius lift | acts as `x ↦ x^p` on `F̄_p`: outside both sides | agrees | none |
| 28 | `_zero`, `q`-power step | `F_p((t))`, `x = t^(1/p)` | `(σx − x)^p = σt − t = 0` | sound | none |
| 29 | projections (Lean 215) | `ℚ_2`, `Z8`, `u = 3/2` | `ψ(3/2) = 1 + 2·(1/2) = 2`, `G_2 = {1, 5}` on both sides | agrees | none |
| 30 | projections, perfectness dropped | `I2`, `u = 1/2` | image `≤ 2` vs `Gal(M/K)^(1/2) = G_1` of order `4` | hypothesis needed | none |
| 31 | `0+` (Lean 239) | `W`, `K(ζ_p)`, `p` odd | `P_K ↦ G_1 = 1`; `I_K ↦ C_(p−1)` | strict inclusion | none |
| 32 | `0+`, pro-`p` | `ℚ_3`, `Z9` | `P_K ↦ {1, 4, 7}` (order `3`); `I_K ↦ (ℤ/9)ˣ` (order `6`) | separates | none |
| 33 | `0+` | `ℂ((t))` | `G_1 = 1` at every level; `P_K = 1` | agrees | none |
| 34 | subgroup identity (Lean 263) | `S3`, `H = ⟨(12)⟩`, `u = 1` | `ψ_G(1) = 2`, `G_2 ∩ H = 1`; `φ_H(2) = 1`, `H^1 = H_2 = 1` | agrees | none |
| 35 | same, `H = ⊥`, `H = G` | any | `⊤ = ⊤`; `φ_G ∘ ψ_G = id` | agrees | none |
| 36 | open subgroups (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ_(M/K)(1) = 2`: `H = H^2`; `ψ_(M/K)(3/2) = 5`: `1 = H^3 = H_5` | agrees | none |
| 37 | same, `L` not Galois | `L = ℚ_3(∛3)` in `S3` | `ψ_(L/K) = u` on `[0, 3/2]`, `3u − 3` after; `ψ(2) = 3`; slopes `[G : G^t H]/f = 1, 3` | agrees | none |
| 38 | same, `u = −1`, `L = K` | any | `G_K ↦ G_L`; `ψ_(K/K) = id` | agrees | none |
| 39 | same, `hO'` dropped | `W`, trivial `O'` | `G_L^0 = 1` vs preimage `G_L` | hypothesis needed | none |
| 40 | integral formula | `ℚ_3(ζ_3)/ℚ_3` in `Z9` | `[G : G^t H] = 2`, `f = 1`, so `ψ = 2u` | agrees | none |
| 41 | §4a.3 base change | `Z9` | `e = 6`, `d = 9`, `d/e = 3/2`, upper jumps `0`, `1` | agrees | none |
| 42 | sample: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; lower `1, 3`, upper `1, 2` | agrees | none |
| 43 | sample: residue enlargement | `κ[[t]] → κ̄[[t]]`; `X^e − t`; unramified quadratic | `t` stays a uniformizer; `#G_0 = e`, `G_1 = 1`; splits | agrees | R04 (cite Eisenstein DVR) |
| 44 | sample: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p = g/g′` | agrees | none |
| 45 | sample: graded norms | `AS`; tame `C_e`; `F_3` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`, kernel `F_p ∋ −1 = θ_1(σ)`; depth-0 kernel `μ_e`; `λ³ − 2λ` acts on `F_3` as `−λ` | agrees | none |
| 46 | sample: `Breve E` | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`, `p` a uniformizer; `F̄_q((t)) ≠ ∪ F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| 47 | Conventions example | `F_p(s)((t))` | `s^(1/p)`, `(s + t)^(1/p)`: `e = 1`, `f = p` each; difference `t^(1/p)`, `e = p` | agrees | none |
| 48 | §3a.1 graded character Check | `AS` | `(σ(y⁻¹) − y⁻¹)/y⁻² = −y/(y + 1) → −1`; `σ(π)/π → 1` | agrees | none |
| 49 | §3a.1 inseparable Check | `z^p − t^(p−1)z = s` | `σz − z = t`, `v = 1`: `G_0 = G`, `G_1 = 1`, `#G_0 = p ≠ e = 1` | agrees | none |
| 50 | intersection formula, local-field case | `Z8 ⊃ ℚ_2(√2)`, `v = 1, 3/2, 3` | `v = 1`: `H = H^1`; `v = 3/2`: `{1,5} ∩ H = 1 = H_2 = H^(3/2)`; `v = 3`: `1 = H^4 = H_7`; same as pinned `comap_restrictScalarsHom_upperRamificationGroup` | not cited | R03 |
| 51 | §4a.1 fourth bullet vs #1215's Layer 7 | `ℚ_2`, `Z8`, `u = −1, 3/2, 5/2` | `G`; `ψ(3/2) = 2`, `{1, 5}`; `ψ(5/2) = 5`, `1`, on both sides | agrees | none |
| 52 | non-Galois `L` stays §4a.2's | `ℚ_3(∛3)` | pinned theorem needs `[IsGalois K L]` (`UpperQuotient.lean` 33) | §4a.2 owner | none |
| 53 | tower, local-field case | `Z8 ⊃ ℚ_2(√2)`, `u = 3` | `ψ_(M/K)(3) = 7 = ψ_(M/L)(ψ_(L/K)(3)) = ψ_(M/L)(4)`; pinned `inverseHerbrand_tower`, uncited | not cited | R03 |
| 54 | `|G_0| = e`, `G/G_0 ≅ Gal(k_L/k)` | `Z9`; unramified quadratic; row 49 | `6 = 6`, `G/G_0 = 1`; `1 = 1`, `C_2`; `p ≠ 1` without separability | used, uncited | R04 |
| 55 | description: #1411 consumes §4a.1 | depcheck at #1411 and #1215 | UPWARD at `[507, 538, 1435, 1488]`; `0` problems | contradicts README 116–118 | R01 |
| 56 | description: *Dependencies*, #879, **Summary** | grep; `roadmaps grep`; `ψ_(L/K)(2) = 3` | `ProfiniteCohomology` `0`; §F.3a consumed `0` times; #879 `0` lines; three non-completed local-field objects | false | R02 |

### Library declarations opened at the pins

- **All names.** A scratch file with `#check @…` for 84 library names cited by the README, under 22 Tau Ceti imports, elaborates with 0 errors. The eight names R03 and R04 ask to add were checked in a second file (after building `TauCeti.RingTheory.DiscreteValuationRing.Eisenstein`), also with 0 errors.
- **Tau Ceti statements read:**
  - `RingTheory/LocalRing/RamificationGroup.lean`:
    - 145 (`ramificationGroup_natCast`);
    - 166;
    - 220;
    - 233;
    - 260 (`ramificationGroup_zero_eq_inertiaSubgroup`, the exact shape Lean 197 needs);
    - 325 (needs `IsNoetherianRing`, `FaithfulSMul`);
    - 351 (`lowerIndex` needs `IsDiscreteValuationRing`);
    - 444, 469, 520, 561;
    - 722 (`ramificationGroupReal`);
    - 750 (`subgroupOf_ramificationGroupReal`).
  - `RingTheory/DiscreteValuationRing/Monogenic.lean` 70 (`Module.Finite`, `FaithfulSMul`, separable residue; no completeness).
  - `RingTheory/DiscreteValuationRing/Eisenstein.lean` 144, 162, 174.
  - `NumberTheory/LocalField/RamificationGroup.lean` 86 and 99 (lower filtration defined as the local-ring one).
  - `NumberTheory/LocalField/Herbrand/`:
    - `Basic.lean` 112, 137, 251, 262, 421 and 511 (all need `[IsGalois K L]`);
    - `Tower.lean` 199, 216, 226;
    - `Quotient.lean` 176;
    - `UpperQuotient.lean` 98, 129;
    - `HasseArf/Abelian.lean` 50 (`IsAbelianGalois`, conclusion `∃ z : ℤ`).
  - `NumberTheory/LocalField/WildInertia.lean` 251, 285, 294 and 520 (`CharP 𝓀[K] p`).
  - `NumberTheory/LocalField/Unramified/Maximal.lean` 97.
  - `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean` 227, 340, 346, and `Map.lean` 187.
  - `Topology/Algebra/Group/Profinite/ProP/Basic.lean` 68. `IsPGroup 0` holds for every group, as README line 271 says.
- **Mathlib statements read:**
  - `Ideal.sum_ramification_inertia_eq_card` (`Module.Flat`, `IsGaloisGroup`);
  - `differentIdeal` (`DedekindDomain/Different.lean` 481);
  - `conductor_mul_differentIdeal`;
  - `IsKrasner.of_completeSpace_of_normal`;
  - `IntermediateField.le_maximalUnramifiedExtension_iff` (`IsSepClosed Ω`);
  - `Field.absoluteGaloisGroup.mapOfAlgebra`;
  - `decompositionSubgroupMulSemiringAction` (`Valuation/RamificationGroup.lean` 39);
  - `Ideal.card_inertia_eq_ramificationIdxIn` (`Galois.lean` 315);
  - `Ideal.Quotient.stabilizerHom_surjective` (`Invariant/Basic.lean` 365).

### Cross-roadmap citations resolved

- **Main** is at 28c3fca. Since a169c04 only the `PROGRESS.md` and `STATUS.md` files of CharacteristicClasses, NumberFieldArithmetic and SuccessiveMinima changed.
- **Suppliers on main:**
  - ReductiveGroups Layer 3, line 234;
  - SchemeAndStackFoundations §0.24, line 1565;
  - AdicSpacesPartII §R0.19.9, line 7793 (`Pro`, `Pro.homEquiv`);
  - ReductiveGroupsPartII §RG2.0.4, line 852: `Breve E`, discreteness, `residueField_isAlgClosed`, `isUniformizer_algebraMap`, Frobenius and `fixedPoints_frobenius`, as the contract at lines 283–289 says;
  - EtaleCohomologyFoundations §F.3a, line 776;
  - LocalGaloisGroups and ProfiniteProPGroups under `Completed/`.
- **ClassFieldTheory precedes this roadmap:** ReductiveGroupsPartII consumes ClassFieldTheory layer 9 (lines 377–380), and SchemeAndStackFoundations consumes ClassFieldTheory Layers 5 and 10 (line 424).
- **Ownership against open pull requests.** I searched by object (`herbrand function|upper numbering|hasse.arf|absolute upper`).
  - #940 §0.3 says it "consumes, and does not construct" the package (its line 76).
  - #856 §3.0 says it "plans none of them" (its line 2556), apart from the clause R04 addresses.
  - #617 gives the general Hasse–Arf to §3a.3 (its lines 38–41).
  - #1215 alone defines the local-field absolute filtration, and the README names it.
  - #1795 and #1812 consume §§4a.1–4a.2.
  - #879 and #1002 attribute the package to other roadmaps but own none of it.
  - No fully qualified name of `Suggested.lean` is declared elsewhere.
- **Tools.** `roadmaps overlaps` finds no pull request changing this folder and no dropped id. `roadmaps resolve` finds nothing unresolved.

## Not verifiable

- `serre-local-fields` is settled as uncertified, so its locators (II §2 Prop. 3, III §6 Prop. 12, IV §1 Props. 1, 2, 4, IV §3 Props. 14–15 and Ex. 3, V §7 Thm. 1) are cited without the text.
- #1411, #856, #879, #940, #1713, #1795, #1812 and #617 have no checkout in this brief. I read them at their indexed heads through `roadmaps show` and `roadmaps grep`, and their line numbers are file lines of that output.

## Source issues

- none
