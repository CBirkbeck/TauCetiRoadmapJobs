# Review of RigidAnalyticGeometry (pull request #1807 at afdd14a)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RigidAnalyticGeometry/` at `afdd14acfe12ac33fd45878e8a3d0d1ffe30bf50`. The folder changed by 323 lines since `953b278`, the head the previous review read.

- **Gate, build and dependencies.** The worker's gate passes every check. `Suggested.lean` elaborates with twelve `sorry` warnings and nothing else. The dependency check reports 0 problems.
- **Previous findings.** R02, R04 and R05 of the previous review are repaired. R03 is repaired inside this folder; its last step, Part III citing §1.3, is not done and returns as R02 below. R01 is not repaired and returns as R01.
- **Findings of this review.** There are four:
  - Kiehl's formal-functions theorem still has no owner (R01, P1).
  - The complete-field-extension theorem of §1.3 gets a second owner in AdicSpacesPartIII (R02, P2).
  - The reduction of excellence to the two Kiehl inputs uses general criteria that no roadmap or pin provides (R03, P2).
  - A §1.2 Check makes a false claim about the formal-fibre input in one variable (R04, P3).

## Status of the previous review's findings (r55, at 953b278)

- **R01 (§7.5 unowned): not repaired.**
  - README line 74 still maps §7.5 to "AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion*".
  - AdicSpacesPartIII is unchanged on main, and no open pull request changes it: `roadmaps grep` finds the target name only on main and in this roadmap.
  - No repair report marks the finding as not actionable. See R01.
- **R02 (Gerritzen–Grauert not stated): repaired.**
  - `Suggested.lean` lines 158–172 state `exists_eq_iUnion_rationalDomain` under a Layer 4 comment.
  - §4.3 names the theorem (README lines 1259–1264), and so does the docstring's "Stated below" list (lines 43–45).
  - The immersion form is listed as not statable, with the missing carrier named (lines 57–61).
- **R03 (excellence route source): repaired in this folder, with one step outstanding.**
  - [Kiehl-AR] and [Matsumura] are in **References** (lines 2238–2245).
  - The two inputs are stated with locators (lines 647–654), and the char-`p` route is spelled out (lines 658–680).
  - Faithful flatness is now §1.3's own target (lines 741–757).
  - Not done: AdicSpacesPartIII still states that same theorem itself instead of citing §1.3. See R02.
  - [Matsumura] has no entry in the manifest; see **Not verifiable**.
- **R04 (immersions without API or Checks): repaired.**
  - §4.3 (lines 1221–1252) defines closed, locally closed, open and Runge immersions through the stalk maps of §4.2.
  - Six API bullets carry their Bosch locators.
  - Four new Checks (lines 1320–1346) separate the definitions; all four are verified in the table below.
- **R05 (`ϖ` unfixed): repaired.**
  - Convention 1 (lines 100–103) fixes `ϖ` with `0<|ϖ|<1`.
  - §2.3 now uses `t` (lines 1033–1041).

## R01 (P1) — §7.5 (formal functions) still has no owner once this pull request merges

**Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 74 maps "§7.5 | Principal filtrations and formal functions ([Kiehl-E] Theorem 3.4, p. 206, and Theorem 3.7, p. 210) … | AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion*".

**Claim.**
- The table hands §7.5 to a Part III target that proves nothing itself. On main, that target transports this roadmap's §7.5 and lists §7.5 in its *Needs:*.
- After the merge, no roadmap plans the proof of [Kiehl-E] Theorems 3.4 and 3.7.
- The description's ownership-moves bullet says these sections go "into the AdicSpacesPartIII R3.2–R3.7 targets that already state them". For §7.5 the head shows otherwise: the Part III target consumes §7.5 rather than stating it.

**Witness.** `TauCetiRoadmap/AdicSpacesPartIII/README.md` on main:
- line 11031: "transport RigidAnalyticGeometry §7.5's completion theorem";
- line 11042: "*Needs:* RigidAnalyticGeometry §7.5".

Line 604 and its `Suggested.lean` line 51 say the same.

**Repair.** Add `TauCetiRoadmap/AdicSpacesPartIII/` to this pull request, or to one that the merge-order paragraph places directly after it. In that folder:
- Rewrite R3.6 *proper-cohomology-adic-completion* as the proof of [Kiehl-E] Theorems 3.4 and 3.7. Its inputs are Part III's own *proper-affinoid-cohomology-finite* and the finiteness over the Rees ring `⊕ₙaⁿA` (Kiehl-E pp. 206–208). Carry over the statement in this README's table row.
- Delete "RigidAnalyticGeometry §7.5" at Part III README lines 102, 604, 11031 and 11042, and at its `Suggested.lean` line 51.

Checked on the instance above: after the rewrite, the *Needs:* line of the target names only Part III targets, so nothing points back at §7.5. The same Part III edit also repairs R02.

## R02 (P2) — The complete-field-extension theorem of §1.3 has two owners after the merge

**Location.**
- README lines 62–65: "Faithfully flat complete extension … (§1.3) are owned here, because Kiehl's excellence route in §1.2 uses them; AdicSpacesPartIII R3.6 *affinoid-completed-field-extension*, downstream, states the same theorem."
- The statement is at lines 741–748.

**Claim.**
- §1.3 now owns two statements, and must own them because §1.2 uses them:
  - `A→A_L` is faithfully flat;
  - `A_L⊗_A M≃L⊗̂_K M` is a topological isomorphism for finite `M`.
- AdicSpacesPartIII on main states the same theorem as its own target and does not cite this roadmap.
- AdicSpacesPartIV on main cites Part III's copy.
- AdicSpacesPartV (open, #2133, line 290) cites §1.3.
- The theorem therefore has two owners, and consumers already split between them.

**Witness.** AdicSpacesPartIII on main, lines 11077–11086: for affinoid `A` and complete `K'/K`, `A→A'` is faithfully flat and `A'⊗_A M→K'⊗̂_K M` is a topological isomorphism. Its *Needs:* names only Part II carriers.

**Repair.**
- In the same AdicSpacesPartIII edit as R01, replace the body of R3.6 *affinoid-completed-field-extension* (line 11077 and its row at line 607) with a citation of RigidAnalyticGeometry §1.3. Both use the pinned `TauCeti.Huber.CompletedTensor`, so no carrier comparison is needed. AdicSpacesPartIV's citations (lines 2521, 2894) then resolve through Part III to §1.3.
- Here, change lines 64–65 to "AdicSpacesPartIII R3.6 *affinoid-completed-field-extension* cites it".

Checked on the instance above: after the change, the only statement of the theorem is §1.3 lines 741–748.

## R03 (P2) — The reduction of affinoid excellence to Kiehl's two inputs uses general criteria that no supplier owns

**Location.**
- README lines 643–645: "by the general criteria [Conrad] p. 3 applies, the two halves therefore follow from two inputs".
- Lines 656–658: char 0 "follows from the excellence criterion of [Matsumura] Theorem 102".
- *Needs:* lines 685–690.

**Claim.** The route of the headlines `isGRing_of_isAffinoidAlgebra` and `isOpen_regularLocus_of_finiteType` uses three general theorems:
- (a) the J-2 criterion: a noetherian ring is J-2 once every finite domain over it has a nonempty open set of regular primes;
- (b) the G-ring criterion: the condition at maximal ideals, reduced to regular generic formal fibres of finite domains ([Conrad] p. 4, "a close look at the proof of [Mat2, Thm 32.5]");
- (c) Matsumura's derivation criterion (Theorem 102) for characteristic 0.

None of these is a target here, a supplier section or a pinned declaration.
- *Needs:* attributes them to SchemeAndStackFoundations §0.21 "(excellent rings, G-rings, J-2 rings and their permanence)". That section states definitions and permanence only.
- *Needs:* also lists the bare citations [Conrad] §1.1 and [Matsumura] Theorem 102. A citation is not a supplier.

**Witness.**
- SchemeAndStackFoundations §0.21 at this head (lines 1470–1505): only `of_finiteType` permanence and the complete-local and Dedekind cases; no criterion.
- Tau Ceti `RegularLocalRing/GRing.lean:71–92`: only `isGRing_iff`, `of_ringEquiv`, `of_isLocalization`.

**Repair.** SchemeAndStackFoundations is upstream and in this pull request, so add (a), (b) and (c) to its §0.21 as targets. Use the locators [Conrad] gives (lines 131, 145–153):
- EGA IV₂ 7.8.2(iii);
- Matsumura, *Commutative Ring Theory*, Theorems 24.4 and 32.4 and the proof of Theorem 32.5;
- Matsumura, *Commutative Algebra*, Theorem 102.

Then cite them in §1.2's *Needs:* in place of "[Conrad] p. 3" and "[Matsumura] Theorem 102". Alternatively, state the three in §1.2 as steps that are part of this target, as §8.2 does for quantifier elimination.

Checked on the instance above: with either change, every item of lines 681–691 names a target, a supplier section or a pinned declaration.

## R04 (P3) — A §1.2 Check says the formal-fibre input has content only from two variables on, which is false

**Location.** README lines 708–712: "the formal-fibre input holds here with nothing to prove, and it has content only from two variables on."

**Claim.**
- Take a domain `A` finite over `T₁` and a maximal ideal `𝔯`. The primes `𝔭` of `Â_𝔯` with `𝔭∩A=0` are exactly the minimal primes: `Â_𝔯` is one-dimensional, `𝔯∩A≠0`, and flatness gives going-down.
- So in one variable the input says that `Â_𝔯` is reduced.
- That is not automatic for one-dimensional noetherian domains. In one variable the input still needs proof; only `A=K⟨T⟩` itself is free.

**Witness.** Take the non-Japanese DVR `R` of SchemeAndStackFoundations §0.22, with `b∈R̂∖Frac R` and `b^p∈R`. Then `A=R[y]/(y^p−b^p)` is a finite domain, `Â=R̂[y]/((y−b)^p)`, and its localisation at the minimal prime `(y−b)` is nonreduced, hence not regular.

**Repair.** Replace the clause with:

> for one-variable affinoid domains the input says exactly that `Â_𝔯` is reduced, which fails for one-dimensional noetherian domains in general (a finite extension of the discrete valuation ring of SchemeAndStackFoundations §0.22), so it has content already for `n=1`.

The computation for `A=K⟨T⟩` stays as it is.

## Verified sound

**Gate and build.**
- The worker's gate passes every check (`build=0`, `depcheck=0`, `statement-hygiene=0`, `stray-files=0`).
- My own run of the gate command matches, except for `outside-folder=26`. Those are the README and `Suggested.lean` of the 13 other folders that the brief names as this pull request's own, so they are not findings.
- `git diff --stat origin/main...HEAD`, excluding the 14 own folders, is empty.
- `lake env lean` on `Suggested.lean` exits 0. It prints exactly twelve `declaration uses sorry` warnings, at lines 94, 110, 126, 134, 152, 167, 188, 202, 227, 240, 262 and 280.
- The file has no `set_option`, no `lemma`, no `#eval`, no sorry'd data and no definitions. Its imports are `Mathlib` plus twelve pinned `TauCeti.*` modules.

**Dependency check (verbatim).** `depcheck: 236 roadmaps, 2142 edges, 0 problem(s)`

**Signatures.**
- I elaborated `#check @` for all twelve declarations in one scratch file.
- Each type carries the binders its README statement needs:
  - `[IsDomain A]` (Japanese);
  - `[IsUltrametricDist A] [CompleteSpace A] [IsReduced A]` (Banach function algebra);
  - `[Fact (IsAffinoidAlgebra K A)]` (Gerritzen–Grauert, sheaf, Čech, stalks);
  - `[Finite ι]`, `hU` and `0<n` (Čech);
  - `[Algebra.FiniteType A B]` (J-2).
- The new `exists_eq_iUnion_rationalDomain` has the README's generality, lines 1259–1264.
- Nothing is lost and I changed nothing.

**Padding.** On a scratch copy I replaced every `sorry` with `first | (simp; done) | rfl | infer_instance | exact?`. All twelve fail with "`exact?` could not close the goal".

**Headlines.**
- The Summary milestones that can be stated at the pins are all stated:
  - weak stability of the Gauss fraction field;
  - finite normalisation;
  - the G-ring and J-2 halves of excellence;
  - the Banach function algebra theorem;
  - the finite-union Gerritzen–Grauert theorem;
  - Tate acyclicity in sheaf and Čech form;
  - stalk excellence;
  - Huber 4.1 and 4.2.
- The not-statable list is correct:
  - The immersion form needs a stalk map of a morphism. The pinned `TauCeti.GTopology.stalkMap` (`Topology/GTopology/StalkMap.lean:108`) takes a presheaf map as input, and `TauCeti/AlgebraicGeometry/Rigid/Affinoid/` holds only `Presheaf.lean` and `Site.lean`.
  - Rigid spaces, properness, the identity principle, analytification and the rigid–adic equivalence have no carrier at the pin.
  - ACVF is not at the pin.

**Library declarations opened at the pins.**
- All 111 qualified Tau Ceti names of the README resolve with their namespace. Among them:
  - `rationalDomain` (`RingTheory/Affinoid/Subdomain/Rational.lean:79`; `pointNorm g ≠ 0` and `pointNorm fᵢ ≤ pointNorm g`);
  - `AffinoidSubdomain` (`AlgebraicGeometry/Rigid/Affinoid/Presheaf.lean:45`; representation in the universe of `A`);
  - `Huber.BanachModule.CompletedTensor` (`RingTheory/Huber/BanachModule/CompletedTensor.lean:201`);
  - `exists_continuousLinearEquiv_prod_of_countableType` (`Analysis/Normed/Module/Bases/Splitting.lean:87`);
  - `IsAffinoidAlgebra.finite_quotient_of_isMaximal` (`RingTheory/Affinoid/MaximalSpectrum.lean:46`);
  - `isRegularLocalRing_localization_atPrime_of_isMaximal_isRestricted_subring` (`TateAlgebra/Regular.lean:144`);
  - `IsGRing` (`GRing.lean:57`);
  - `regularLocus` (`Locus.lean:61`);
  - `GTopology.point` and `isColimitNhdsCocone` (`Points.lean:44, 103`).
- The module path `TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic` exists.
- Mathlib at the pin:
  - `IsRegularLocalRing` (`RegularLocalRing/Defs.lean:52`);
  - `KaehlerDifferential`;
  - `Module.FaithfullyFlat` (`Flat/FaithfullyFlat/Basic.lean:64`);
  - `cechComplexFunctor` (`Sites/SheafCohomology/Cech.lean:65`);
  - `presheafFiber` (`Sites/Point/Basic.lean:97`);
  - `constructibleTopology` and `compactSpace_withConstructibleTopology` (`Spectral/ConstructibleTopology.lean:43, 161`);
  - `LocalSubring.exists_le_valuationSubring` (`Valuation/LocalSubring.lean:117`);
  - `Algebra.IsInvariant.exists_smul_of_under_eq_of_profinite` (`Invariant/Profinite.lean:61`);
  - `IsAlgClosed.lift` (`IsAlgClosed/Basic.lean:366`);
  - `BoundedFormula.IsQF` (`ModelTheory/Complexity.lean:72`);
  - `isSatisfiable_iff_isFinitelySatisfiable` (`Satisfiability.lean:101`);
  - `elementaryDiagram` (`ElementaryMaps.lean:217`).

**Cross-roadmap citations resolved.**
- RestrictedPowerSeries on main: §§0.1, 1.1, 2.1, 2.2, 2.4, 3.3, Layer 4, §§5.1–5.4 and §6.2, at lines 193, 247, 306, 324, 364, 424, 452, 524, 541, 567, 587 and 630. §3.3 gives `T_n°/T_n°°≃K̃[X]`, as cited.
- PadicFunctionalAnalysis at this head: Layer 1 (398), §1.4 (461) and §2.4 (571). §2.4 states strict exactness of `K'⊗̂_K(−)` on the pinned `BanachModule.CompletedTensor`, which is exactly §1.3's input.
- SchemeAndStackFoundations §0.21 at this head (1470).
- AdicSpaces (`Completed/`): Layers 1–3 and §§2.3, 2.4, 3.1 (272, 360, 413, 440, 456, 461).
- AdicSpacesPartII on main:
  - R0.3 (1769), R0.4 (2270), R0.5 (2759), R0.9 (4071), R1.1 (8427), R1.7 (9806) and R1.9 (10509);
  - *gerritzen-grauert* (357) and *classical-points-constructible-density* (371) are listed as supplied by this roadmap.
- AdicSpacesPartIII on main: the 16 targets named in Scope and the table.
- AdicSpacesPartIV on main: F1.1 (2998) and R5.7 (2165).
- LocallyAnalyticDistributions §4.16 at its open head (#854, line 3035; it consumes §7.2 at lines 253 and 860–862).

**Overlaps and ownership.**
- `overlaps.md` lists no dropped ids and no ids that only an open revision defines.
- #1808 and #1854 also change this folder, and the description orders them after this one ("`RigidAnalyticGeometry`: **this pull request** → #1808 → #1854").
- AdicSpacesPartV (#2133) consumes §§1.1–1.3, 6.2, 7.3 and 8.1–8.3 (its lines 14, 77, 290, 387, 421) and owns nothing of this roadmap's. Its line 15 citation of §§7.3–7.4 follows through the table "Former section of this roadmap".
- Ownership against ClassicalAdicEtaleCohomology (#875) was not checked; the brief gives no path for it.

**Source sample, read at the locators.**

| Target | Locator | Read at | Verdict |
| --- | --- | --- | --- |
| 0.1 | RestrictedPowerSeries §§1.1, 2.1–2.2, 2.4, 3.3, Layer 4, §§5.1–5.3 | that README, lines 247–600 | present as cited |
| 0.2 | [BGR] 2.3.2/7, 3.5.1–3.5.3, 4.1/3–4, 4.4/2, 5.3.1/1; pinned criteria | `Japanese.lean`, `WeaklyStable.lean`, `SpectralNorm/Basis.lean` | pinned parts match; BGR uncertified |
| 1.2 | [Kiehl-AR] Thm 3.3 p. 94; 3.2.1′ p. 94; pp. 96–97; Satz 3.10 p. 97; Hilfssätze 3.4, 3.4′, 3.11, Def 3.5, Folg. 3.6; Satz 1.4 p. 91; Hilfssatz 3.9, Folg. 3.8 p. 96; Satz 2.4 p. 93; Satz 2.2, Folg. 2.3 pp. 92–93; faithful flatness pp. 95, 97; [Conrad] pp. 3–5 | KiehlAR lines 145, 194–209, 213, 258–265, 270–308, 332–386, 392, 403; Conrad lines 129–159, 193–199 | every Kiehl-AR locator matches (scan page = journal page − 87); route inputs unowned (R03); Check false (R04) |
| 1.3 | [Conrad] Lemma 1.1.5(1) pp. 6–7; [BGR] 6.1.1/12 | Conrad lines 267–303 | statement and route (fibre over `𝔪`, countable type, section, injectivity) match; second owner (R02) |
| 1.5 | [BGR] 6.1.5; pinned names | `isAffinoidAlgebra_isRestricted_iff_pow_eq_norm` and its two halves resolved | match; BGR uncertified |
| 2.2 | [BGR] 3.8, 6.2.1–6.2.4; pinned names | signatures resolved | match; BGR uncertified |
| 2.3 | [FK] B.1.3(1), p. 236 of v5; [BGR] 6.3 | FK lines 10016–10036 | p. 236, stated without proof, as the README says |
| 3.1 | [BGR] Ch. 7; pinned site | `Presheaf.lean:45–66` | match |
| 4.3 | [Bosch] §4.1 pp. 65–66; §4.2 Def 1 and p. 69, Rem 2 pp. 69–70, Prop 3 pp. 70–71, Prop 4 p. 71, Def 5 p. 71, Rem 6 and Prop 7 p. 72, Thm 10 p. 76, Cors 11–12 pp. 76–77; §3.3 Thm 20 p. 60; §4.3 Lemma 4 p. 84; [Conrad] Lemma 1.1.4 p. 6 | Bosch lines 2530–2548, 2661–2783, 2924–2944, 2385–2386, 3256; Conrad lines 263–266 | every locator and API bullet matches (scan page = printed page + 5) |
| 5.1 | [Kiehl-AB] §1 p. 258; Hilfssatz 1.3 p. 260 | KiehlAB lines 152–154, 209–212 | match |
| 6.2 | [BGR] §9.3, 9.3.6; [Bosch] §5.3; [Conrad] §3.1 | Conrad lines 85, 821–822 | 9.3.6 as Conrad records it; BGR uncertified |
| 6.3 | [Bosch] §6.3 Defs 6, 8, Lemma 7 p. 131; [Kiehl-E] Defs 2.1–2.3 p. 202; [Lütkebohmert] Thm 3.1, Cor 3.2 p. 350; [Temkin] Cors 4.5–4.6 | Bosch lines 4933–4968; KiehlE lines 475–504; Lutkebohmert lines 409–414; Temkin lines 792, 806 | match |
| 8.1 | [Conrad] App. A; [Conrad-RA] Ex. 2.2.11 | Conrad line 1500; ConradRA lines 854–899 | final object, points, flat comparison, field extension: match |
| 8.2 | [Huber-CV] Thm 4.1 p. 472, Cors 4.2–4.3 p. 473, Rem 4.7 pp. 474–476, [11, 4.17] p. 472 | HuberCV lines 766–826, 889 | `L_A` (766), induction (776–815), QE input (797–804): match |
| 8.3 | [Huber-FR] Prop 4.5 | HuberFR lines 1436–1453 | (i)–(v) match the five clauses |

**Adversarial table.** Values were computed by hand, with `0<|ϖ|<1` (Convention 1).

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `isWeaklyStable_gaussFractionField` | `n=0`; char `p`, `n=1`, `L=Frac(T₁)(S)`, `S^p=T`, `φ`= coefficient of `1` | `Frac(T₀)=K`, complete case; `y=Σ_{i<p}aᵢSⁱ`, `y^p=Σaᵢ^pTⁱ`, spectral norm `maxᵢ|aᵢ|≥|a₀|=|φy|`, `C=1` | true | none |
| `isJapanese_of_isAffinoidAlgebra` | `K⟨T⟩` char `p`; `K`; `K⟨T⟩×K` | closure `K⟨S⟩`, free on `1,…,S^{p−1}`; a field; excluded by `[IsDomain A]` | true | none |
| `isGRing_of_isAffinoidAlgebra` | `A=0`; `A=K`; `K⟨T⟩` at `(T)` | no primes; `K→K̂=K`; formal fibre over `(0)` is `K((T))`, a field, whose separability over `Frac K⟨T⟩` is the char-`p` content | true; route inputs unowned | R03 |
| `isOpen_regularLocus_of_finiteType` | `B=K[x,y]/(y²−x³)` in char 2, 3, other; `B=0` | Jacobians `(x²,0)`, `(0,2y)`, `(−3x²,2y)` vanish on the curve only at the origin, so the locus is `Spec B∖{(x,y)}`, open; `∅` | true | R03 |
| `exists_norm_le_mul_supSeminorm` | `K⟨T⟩/(T²)`; `K⟨T⟩` with twice the Gauss norm; `A=0` | `‖T‖=1`, `|T|sup=0`, excluded by reducedness; `C=2` forced; `0≤C·0` | true | none |
| `exists_eq_iUnion_rationalDomain` | `A=0`; `U=Sp A`; `U=∅`; annulus; data `g=T` with no `f` | `n=0`; `n=1`, `g=1`, `pointNorm 1=1≠0`; `n=0`; `R(T;ϖ)={|ϖ|≤|T(x)|≠0}`, unit ideal since `ϖ∈K×`; `{T≠0}` would need `|T|≥minᵢ|T⁻¹|sup⁻¹>0` but `|ϖᴺ|→0` | true; unit-ideal clause needed | none |
| `isSheaf_affinoidSubdomain_presheaf` | Laurent cover; `A=0` | `u=Σ_{n≥0}uₙTⁿ`, `v=Σ_{n∈ℤ}vₙTⁿ` equal on `|T|=|ϖ|` force `vₙ=0` for `n<0` and `|uₙ|→0`, so they glue in `K⟨T⟩`; `F(∅)=0` | true | none |
| `exactAt_cechComplex_of_cover` | one-member cover; `ι=∅` | ordered tuples: `d⁰=0`, `d¹=id`, `d²=0`, so `H⁰=A` and `Hⁿ=0` for `n≥1`; `ι=∅` forces `Max A=∅` | true; `0<n` needed | none |
| `isGRing_stalk` | cusp origin; `A=0` | completion `K⟦t²,t³⟧`; inverting `t²` gives `K((t))`; `Max 0=∅` | true | none |
| `isUniversallyCatenary_stalk` | origin of `(XY,XZ)` | minimal primes `(X)`, `(Y,Z)` of coheights 2 and 1; a quotient of the regular stalk of the 3-ball | true | none |
| `closure_range_maximalSpectrumToSpa` | `A=K`; `A=0`; `v(ΣaₙTⁿ)=|a_k|εᵏ` | `L_K={|·|}`; `Spv 0=∅`; `v≤1` on `A°`, `<1` on `A°°`, `v(T)=ε<|ϖ|ⁿ` for all `n`, so `v∈L_A∖Spa` | true | none |
| `dense_range_maximalSpectrumToSpa` | `A=K`; rank-two point below Gauss | one point; that singleton is proconstructible, not constructible, and has no classical point | true | none |
| §0.1 Checks | `(X₁+ϖX₂)²`; `p+T²`; `p+T+pT²` | coefficients `1,2ϖ,ϖ²` (char 2: `1,0,ϖ²`), Gauss norm 1; `|1+p|=1` at `T=1` against `|p|` at `0`; reduction `T` | true | none |
| §1.2 inputs and Kiehl route | Kiehl-AR 3.2.1′, Satz 3.10 | first input is 3.2.1′. Satz 3.10's `Â` over `𝔪⊂Tₙ` is `∏_{𝔯∣𝔪}Â_𝔯`, giving the second input | locators true | R03 |
| §1.2 Check `A=K⟨T⟩`, `𝔯=(T)` | one-variable domains `A` finite over `T₁` | primes with `𝔭∩A=0` are the minimal primes of `Â_𝔯`, so the input is "`Â_𝔯` reduced"; it fails for `R[y]/(y^p−b^p)` over the §0.22 DVR | clause false | R04 |
| §1.2 Check `[K:K^p]=∞` | `κ=𝔽_p(t₁,t₂,…)`, `K=κ((s))` | a relation over `κ^p((s^p))` gives, at each `s^{pk}`, one over `κ^p`; the `tⱼ` are `p`-independent | true | none |
| §1.3 | `A=K⟨T⟩`, `M=A/(T)`; `A=K⟨T⟩/(T²)`, `[L:K]=∞`; `ℚ_p⟨T⟩/(T²−p)`, `L=ℚ_p(√p)` | both sides `L`, `T·L⟨T⟩≠A_L`; `A_L=L[T]/(T²)`, free of rank `[L:K]`, not finite; `T±√p` comaximal (`2√p∈L×`), `A_L=L×L` | true | R02 (ownership) |
| §1.5 | radius `p^{−1/2}`; `n=0` | `T²/p` has weighted norm `ρ²/|p|=1`; `K` affinoid | true | none |
| §2.2 Checks | `K⟨X,Y⟩/(XY−c)`, `0<|c|<1`; `A=0` | on points `|c|≤|x|≤1`, so `|X|sup=1`, `|XY|sup=|c|`; `|1|sup=0`, so `n≥1` | true | none |
| §2.3 Check | `ℚ_p⟨T,S⟩/(S²−p²T)` | `(S/p)²=T`; `S/p∉B=ℤ_p⟨T⟩⊕ℤ_p⟨T⟩S`; `B/pB=𝔽_p[T][s]/(s²)` | true | none |
| §3.1 Checks | `Sp 0`; `Sp K⟨T⟩/(T²)`; `Sp(K⟨T⟩×K)` | `∅` with the empty cover; one point, `dim_K=2`; two components | true | none |
| §4.3 immersions | cusp normalisation; `Sp(K×K)→Sp K`; origin; annulus | `σ(a²,a³)=(b²,b³)⇒σa=b`; image `⊆K+t²𝒪∌t`; bijective stalks but two points to one; stalk map kills `T`; `‖ϖ/T−g‖≥|ϖ||ϖ|⁻¹=1` | true | none |
| §4.3 Kisin | `I=A`; `I=0` (no generators); `I=(T)`, `W₁={|T|≤|ϖ|}` | `Σaₖfₖ=1` gives `1≤maxₖ|aₖ|sup|ϖ|ⁿ<1` for large `n`, so the set is empty; the whole space, covered as `V(0)`; `n=1` | true | none |
| §6.2 `ℙ¹` Check | `f(T)=g(T⁻¹)` in `K⟨T,T⁻¹⟩` | `Tⁿ`, `n>0`, gives `fₙ=0`; `T⁻ⁿ` gives `gₙ=0`; so `𝒪(ℙ¹)=K`. With `S↦T` instead, all of `K⟨T⟩` would be global | true | none |
| §6.3 Checks | unit disc in itself; punctured disc; `ℙ¹` | generators with `sup<1` make `K̃[T]` integral over `K̃`, which fails; `T=ϖ^{N+1}` misses the first `N` annuli; discs of radius `|ϖ|⁻¹` | true | none |
| §8.1 Checks | cusp; node | `t=y/x`, `t²=x³/x²=x`, `t∉K⟦t²,t³⟧`; `√(1+x)` converges on a small disc | true | none |
| §8.2 QE Checks | `∃y(y²=x∧1∣y)`; `ℚ̄` trivial against `ℚ((t))^alg` | `v(y)²=v(x)`, and over `ℚ_p` `x=p` has no root; same quantifier-free sentences, they differ on `∃x¬(1∣x)` | true | none |
| §8.3 Check | `⋃{|T|ⁿ≤|ϖ|}`, `|c|^{n+1}=|ϖ|` | `|c|ⁿ=|ϖ|^{n/(n+1)}>|ϖ|`: in member `n+1`, not in member `n` | true | none |
| table row §7.5 → Part III | Part III lines 604, 11031, 11042 | the target transports §7.5 and needs it; the table maps §7.5 to the target | unowned | R01 |

## Not verifiable

- **[BGR]** is recorded as `uncertified` (paywalled) and is settled. I took its locators at their numbers without the text: 2.3.2/7, 3.5.1–3.5.3, 3.7.5, 3.8.1/7, 3.8.3/7, 4.1/3–4, 4.4/2, 5.3.1/1, 6.1.1–6.1.5, 6.1.1/12, 6.2.1–6.2.4, 6.3.1/4–6, 6.3.4–6.3.5, Chapters 7–8, 8.2.1/1 and 9.1–9.3. Where a result is pinned, I checked the statement against the declaration instead.
- **[Prestel]** 4.17 is `uncertified` and settled. The route of §8.2 is checked step by step in the table.
- **[Matsumura]** *Commutative Algebra*, Theorem 102:
  - The book has no entry in the roadmap's manifest, and I did not read it.
  - Its identity with Conrad's `[Mat1, Thm 102]` rests on Conrad lines 131 and 1835.
  - The manifest lies outside this pull request; the worker should record the book there, presumably as `uncertified`.
- **OCR scans.** [Kiehl-AR], [Kiehl-AB], [Kiehl-E] and [Lütkebohmert] are OCR scans. The passages used (Kiehl-AR lines 145–148, 194–200, 213–222, 258–308, 332–386, 392, 403; Kiehl-AB 152–154, 209–212; Kiehl-E 475–504; Lütkebohmert 409–414) are legible enough to confirm the statements and numbering.

## Source issues

- **Misprint** in Conrad at §1.1, p. 3: the source credits the finite-`[k:k^p]` case to Theorem 108 of [Mat2], which numbers its theorems by section (17.8, 32.5 nearby); it should refer to [Mat1], numbered consecutively; affects nothing.
- **Misprint** in Conrad at the proof of Theorem 1.1.1, p. 4: the source writes the differential module of the local ring at `q` as `Ω¹_{R_q/T}`; it should be `Ω¹_{C_q/T}`, since no ring `R` occurs in the statement; affects nothing.
