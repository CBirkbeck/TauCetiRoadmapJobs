# Review of RigidAnalyticGeometry (pull request #1807 at 8d98b44)

**Verdict:** needs changes

This is an incremental re-review of `TauCetiRoadmap/RigidAnalyticGeometry/`, covering the 127 lines that changed since `afdd14a`, the head the previous review read. The change touches §1.2's excellence route and one of its Checks, the §0.21 supplier rows, one sentence of §5.3 and its *Needs:*, the References, and two docstrings in `Suggested.lean`.

- **Gate, build and dependencies.**
  - The gate fails only `outside-folder`, with 26 hits. They are the README and `Suggested.lean` of the 13 sibling folders that the brief names as this pull request's own, so they are not findings.
  - `Suggested.lean` elaborates with twelve `sorry` warnings and nothing else.
  - The dependency check reports 0 problems.
- **Previous findings.**
  - R03 is repaired: the J-2 and G-ring criteria and Matsumura's characteristic-zero criterion are now steps of §1.2, with exact Stacks locators.
  - R04 is repaired: the one-variable Check is corrected.
  - R01 and R02 are not repaired. Both need an edit in AdicSpacesPartIII, which is unchanged on main and in every open pull request. They return as R01 and R02 below.
- **New problems.** None. The repairs introduce no new defect.

## R01 (P1) — §7.5 (formal functions) still has no owner once this pull request merges

**Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 74: "| §7.5 | Principal filtrations and formal functions ([Kiehl-E] Theorem 3.4, p. 206, and Theorem 3.7, p. 210) … | AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion* |".

**Claim.**
- The table hands §7.5 to a Part III target that proves nothing itself: that target transports this roadmap's §7.5 and lists §7.5 in its *Needs:*.
- So after the merge, no roadmap plans the proof of [Kiehl-E] Theorems 3.4 and 3.7.
- The description says it plainly ("This pull request does not change AdicSpacesPartIII, and needs two changes there"), but the change has not been made. No repair report marks this finding as not actionable.

**Witness.**
- `TauCetiRoadmap/AdicSpacesPartIII/README.md` on main (`f4e4eda`):
  - line 11031: "transport RigidAnalyticGeometry §7.5's completion theorem";
  - line 11042: "*Needs:* RigidAnalyticGeometry §7.5".
- `roadmaps grep proper-cohomology-adic-completion` finds the Part III target only on main. No open head, including #1808, #1854 and #1187, changes AdicSpacesPartIII.

**Repair.**
1. Bring `TauCetiRoadmap/AdicSpacesPartIII/` into this pull request, or into one that the merge-order paragraph places directly after it.
2. In that folder, rewrite R3.6 *proper-cohomology-adic-completion* as the proof of [Kiehl-E] Theorems 3.4 and 3.7:
   - its inputs are Part III's own *proper-affinoid-cohomology-finite* and the finiteness over the Rees ring `⊕ₙaⁿA` ([Kiehl-E] pp. 206–208);
   - carry over the statement of this README's line 74.
3. Delete "RigidAnalyticGeometry §7.5" from that folder: README lines 102, 604, 11031 and 11042, and `Suggested.lean` line 51.

**Tested on the instance above.** After this rewrite, the *Needs:* line at Part III line 11042 names only Part III targets. Nothing then points back at §7.5, and line 74 here becomes a true ownership statement.

## R02 (P2) — The complete-field-extension theorem of §1.3 still has two owners

**Location.** README lines 62–65: "Faithfully flat complete extension of the ground field … (§1.3) are owned here, because Kiehl's excellence route in §1.2 uses them; AdicSpacesPartIII R3.6 *affinoid-completed-field-extension*, downstream, states the same theorem."

**Claim.**
- §1.3 owns two statements and has to, because §1.2's characteristic-`p` descent uses them:
  - `A→A_L` is faithfully flat;
  - `A_L⊗_A M≃L⊗̂_K M` for finite `M`.
- AdicSpacesPartIII on main states the same theorem as its own target, without citing this roadmap.
- AdicSpacesPartIV on main cites Part III's copy, at lines 2521 and 2894.
- So the theorem has two owners, and its consumers are split between them.

**Witness.** AdicSpacesPartIII on main, lines 11077–11086: for affinoid `A` and complete `K'/K`, `A→A'` is faithfully flat and `A'⊗_A M→K'⊗̂_K M` is a topological isomorphism. Its *Needs:* names only Part II targets.

**Repair.**
1. In the same AdicSpacesPartIII edit as R01, replace the body of R3.6 *affinoid-completed-field-extension* (line 11077, and its row at line 607) with a citation of RigidAnalyticGeometry §1.3. Both use the pinned `TauCeti.Huber.CompletedTensor`, so no carrier comparison is needed.
2. Here, change lines 64–65 to "AdicSpacesPartIII R3.6 *affinoid-completed-field-extension* cites it".

**Tested on the instance above.** After the change, the only statement of the theorem is §1.3 (README lines 794–801 at this head). AdicSpacesPartIV's two citations then resolve through Part III to §1.3.

## Previous findings

- R01 — not repaired: line 74 still maps "§7.5 | Principal filtrations and formal functions … | AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion*". On main, Part III line 11042 still reads "*Needs:* RigidAnalyticGeometry §7.5"; no open head changes it.
- R02 — not repaired: lines 64–65 still read "AdicSpacesPartIII R3.6 *affinoid-completed-field-extension*, downstream, states the same theorem"; Part III lines 11077–11086 on main are unchanged.
- R03 — repaired: lines 657–679 state "(a) *J-2 criterion*" ([Stacks] Tag 07PC (4)⇒(1)) and "(b) *G-ring criterion*" (Tags 07PT, 07PN, 07PQ) as "steps of this target"; lines 687–698 make characteristic-zero excellence of `Tₙ` a step via [Matsumura] Theorem 102.
- R04 — repaired: lines 755–765 now say "In one variable it still has content … the input says exactly that `Â_𝔯` is reduced", with the counterexample from [Stacks] Tag 00PB.

## Verified sound

**Gate and build.**
- I ran the gate command myself. Every check is 0 except `outside-folder=26`: the README and `Suggested.lean` of AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, GeneralizedCohomology, LocalPurity, PadicFunctionalAnalysis, PurityOfBranchLocus, ReductiveGroups, SchemeAndStackFoundations and TopologicalKTheory, which the brief names as this pull request's own.
- The worker's gate (`gate.md`) passes every check, with `build=0`.
- `git diff --stat origin/main...HEAD`, excluding the 14 own folders, is empty.
- The three files changed outside this folder since `afdd14a` (BordismFormalGroups, ClassifyingSpaces and TopologicalKTheory READMEs) neither cite this roadmap nor are cited by it.
- `lake env lean` on `Suggested.lean` exits 0 with exactly twelve `declaration uses sorry` warnings, at lines 94, 110, 127, 136, 154, 169, 190, 204, 229, 242, 264 and 282.

**Dependency check (verbatim).** `depcheck: 236 roadmaps, 2142 edges, 0 problem(s)`

**`Suggested.lean`.**
- Only the docstrings of `isGRing_of_isAffinoidAlgebra` (lines 118–126) and `isOpen_regularLocus_of_finiteType` (lines 131–135) changed. Their new text agrees with §1.2:
  - the formal-fibre input, reached through criterion (b);
  - "a nonempty open regular subset for affinoid domains", reached through criterion (a).
- No signature changed, so the `#check @` comparison and the one-tactic padding probe of the previous review (all twelve fail to close) still hold. Since the file is unchanged apart from docstrings, I made no scratch copy.
- There is still no `set_option`, no `lemma`, no definition and no sorry'd data.

**R03 repair, checked against the sources.**
- **Criterion (a)** is [Stacks] More on Algebra Lemma 15.48.6 (Tag 07PC), Stacks line 5647.
  - Its condition (4) asks, for each prime `𝔭` and finite purely inseparable `L/κ(𝔭)`, for a finite `R`-algebra that is a J-0 domain with fraction field `L`.
  - J-0 means "Reg contains a nonempty open" (line 5602).
  - (4)⇒(1) is proved at lines 5662–5674.
  - The README's construction is correct: the subring of `L` generated over `R/𝔮` by integral generators is finite, is a domain, and has fraction field `L`.
- **Criterion (b)** chains three lemmas, each read at its locator:
  - Tag 07PT (Lemma 15.51.7, line 5975: `R` is a G-ring iff each `R_𝔪` has geometrically regular formal fibres);
  - Tag 07PN (Lemma 15.51.2, lines 5892–5898: the formal fibre over `𝔮` is `(R/𝔮)^_𝔭⊗κ(𝔮)`);
  - the product decomposition `R^_𝔭⊗_R R′=∏(R′_{𝔭′ᵢ})^` used in the proof of Tag 07PQ (lines 5925–5930).
- The step "test geometric regularity on finite purely inseparable `L`" holds by definition at the pin. SchemeAndStackFoundations §0.21 (line 1475) records Tau Ceti's `GeometricallyRegular` as regularity of `L⊗_k B` for every finite purely inseparable `L`. `TauCeti.Excellence.IsGRing` is at `RingTheory/RegularLocalRing/GRing.lean:57`.
- Localising `Ŝ_𝔫` at `S∖0` gives exactly the `(Ŝ_𝔫)_𝔭` with `𝔭∩S=0`.
- The application to `Tₙ` matches both inputs, since finite domains over `Tₙ` are affinoid domains (§1.1, pinned `IsAffinoidAlgebra.of_finite`).
- Quotients are handled by SchemeAndStackFoundations §0.21 *IsGRing.of_finiteType* (that README, line 1488).
- **Characteristic-zero step.** Its inputs match [Conrad] lines 131–134 (Thm 102 of [Mat1] applied to Tate algebras; all maximal ideals of `Tₙ` have height `n`). Each input is pinned:
  - `TauCeti.isRegularRing_of_isRegularLocalRing` (`RegularLocalRing/ProjectiveDimension.lean:441`, an instance: a regular local ring is a regular ring);
  - `TauCeti.IsAffinoidAlgebra.height_eq_ringKrullDim_of_isDomain` (`Affinoid/KrullDimension.lean:97`);
  - `IsAffinoidAlgebra.finite_quotient_of_isMaximal` (`Affinoid/MaximalSpectrum.lean:46`).
- Mathlib `Derivation` (`RingTheory/Derivation/Basic.lean:46`) and `AdicCompletion` (`RingTheory/AdicCompletion/Basic.lean:172`) exist at the pin.
- The *Needs:* at lines 724–735 now names only targets of this roadmap, SchemeAndStackFoundations §0.21, and pinned declarations.
- The claim "§0.21 … states neither criterion" holds at this head (that README, lines 1470–1537). §0.21 has `IsJ2`, *IsGRing.of_finiteType*, `regular_map_completion` and the complete-local and Dedekind excellence theorems, and nothing else on this point.

**R04 repair, checked.**
- [Stacks] Commutative Algebra Example 10.119.5 (Tag 00PB, Stacks Algebra line 13382) gives the discrete valuation ring of series whose coefficients generate a finite extension of `k^p`, with completion `k⟦x⟧`. It shows that adjoining any `f∉A` gives a one-dimensional local domain with nonreduced completion (lines 13388–13391).
- The README's added claims are correct:
  - `b^p∈k^p⟦x^p⟧⊂R`;
  - `b∉Frac R`, because `k⟦x⟧∩Frac R=R` for a discrete valuation ring;
  - `y^p−b^p` is irreducible over `Frac R`;
  - the completion is `k⟦x⟧[y]/((y−b)^p)`.
- The reduction "input ⟺ `Â_𝔯` reduced" is correct: going-down makes the primes with `𝔭∩A=0` exactly the minimal primes, and a one-dimensional local domain is Cohen–Macaulay, so `S₁` holds and `R₀` is equivalent to reducedness.

**§5.3.** The new clause "as in the route of §1.2's G-ring criterion (b)" matches [Conrad] pp. 5–6. Criterion (b) holds for every noetherian `R`, so it applies to `𝒪_{Sp A,x}`, and on the cusp it gives the Check's value `K((t))`.

**Ownership and duplication of the new steps.**
- `roadmaps grep '07PC|07PT|07PQ|07PN|07PV'` finds only citations of 07PV: SchemeAndStackFoundations §0.21, and AlgebraicModuliForArithmeticGeometry (open, #853), README line 8779, which cites *IsGRing.of_finiteType*.
- `roadmaps grep` for "Theorem 102", "J-2 criterion", "G-ring criterion" and "derivation criterion" finds no other owner.
- The pinned Tau Ceti `GRing.lean` has only `isGRing_iff`, `of_ringEquiv` and `of_isLocalization`, and Mathlib has no J-2 notion.
- So §1.2 is the only place that states these criteria.
- Remark, no change requested: Stacks' proof of 15.51.10 (Tag 07PV, Stacks line 6047) uses Lemma 15.51.7. §0.21's route to *IsGRing.of_finiteType* will therefore meet 07PT internally, but §0.21 does not state it.

**Overlaps.**
- `overlaps.md` lists no dropped ids and no ids that only an open revision defines.
- #1808 and #1854 also change this folder, and the description orders them: "`RigidAnalyticGeometry`: **this pull request** → #1808 → #1854".
- No section id of this roadmap changed in this round.
- The only open pull request among the closest-vocabulary roadmaps that consumes this one is AdicSpacesPartV (#2133). It cites §§1.1–1.3, which keep their numbers.

**Cross-roadmap citations resolved this round.**
- SchemeAndStackFoundations §0.21 at this head (lines 1470–1537, *IsGRing.of_finiteType* at 1488).
- AdicSpacesPartIII on main: lines 102, 604, 607, 11029–11044 and 11077–11086.
- AdicSpacesPartIV on main: lines 2521 and 2894.
- AlgebraicModuliForArithmeticGeometry (#853), line 8779.
- All other citations are unchanged since the previous review, which resolved them.

**Sample targets in the changed passages.**
- §1.2: the new Stacks locators above; [Conrad] pp. 3–4 (lines 142–153); the [Kiehl-AR] results now listed as steps (Satz 1.4, 2.2, 2.4, Folgerungen 2.3, 3.6, 3.8, Hilfssätze 3.4, 3.4′, 3.9, 3.11), whose locators the previous review matched at KiehlAR lines 145–403.
- §5.3: [Conrad] Theorem 1.1.3, p. 5. Unchanged and matched before.

**Adversarial table.** Rows marked "r56" are carried forward unchanged from the previous review (`PRREVIEW-RigidAnalyticGeometry~56`), for statements the diff leaves untouched. The other rows are new, computed with `0<|ϖ|<1`.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| (a) J-2 criterion | `R=0`; `R=K`; `R=` DVR `A` of Tag 00PB | vacuous, and `Reg(0)=∅` is open; finite domains are `L/K` with `Reg=Spec L`, so `K` is J-2 and `Reg(K[x,y]/(y²−x³))=Spec∖{(x,y)}` is open; finite domains are semilocal of dimension ≤1 with generic point `D(f)`, `0≠f∈` Jacobson radical, so `A` is J-2, agreeing with Tag 07PJ(4) (Stacks line 5775) | true | none |
| (a) construction of `S` | `R=𝔽_p[t]`, `𝔮=0`, `L=𝔽_p(t^{1/p})` | `t^{1/p}` is a root of `y^p−t`, so `S=𝔽_p[t^{1/p}]` is free of rank `p`, a domain, with `Frac S=L` | true | none |
| (b) G-ring criterion | `R=K`; `R=K⟨T⟩`, `S=R`, `𝔫=(T)`; `R=A` of Tag 00PB, `S=A[b]` | `Ŝ=L`, regular; `Ŝ=K⟦T⟧`, only `𝔭=0`, with `K((T))` a field; `Ŝ=k⟦x⟧[y]/((y−b)^p)`, `𝔭=(y−b)` minimal so `𝔭∩S=0`, `(Ŝ)_𝔭` has the nilpotent `y−b≠0`, so the hypothesis fails, matching that `A` is not a G-ring | true; sharp on `A` | none |
| (b) product step | char `p`, `R=K⟨T⟩`, `𝔮=0`, `𝔪=(T)`, `L=Frac(R)(T^{1/p})` | `S=R[U]/(U^p−T)≅K⟨U⟩`; one `𝔫=(U)` above `(T)`; `Ŝ_𝔫⊗_S L=K((U))`, a field | true | none |
| char-0 step (Matsumura 102 at `Tₙ`) | `n=0`; `n=1`, `K=ℚ_p` | `T₀=K`, height 0, no derivations needed; maximal ideals `(T−a)`, `(T²−p)` of height 1, residue fields `ℚ_p`, `ℚ_p(√p)`; `d/dT(Σa_kT^k)=Σk·a_kT^{k−1}` with `|k·a_k|≤|a_k|→0`, `dT/dT=1` | true | none |
| §1.2 Check, one variable | `A=K⟨T⟩`, `𝔯=(T)`; `A[b]` over `A` of Tag 00PB | `Â=K⟦T⟧` reduced, minimal prime `0`; `b^p∈k^p⟦x^p⟧⊂A`, `b∉Frac A` (`k⟦x⟧∩Frac A=A`), `A[y]/(y^p−b^p)` a domain, completion `k⟦x⟧[y]/((y−b)^p)` with `(y−b)^p=0≠y−b` | true | none (R04 repaired) |
| §5.3 route via (b) | cusp stalk at origin | `Ŝ=K⟦t²,t³⟧`, a one-dimensional complete domain; only `𝔭=0` meets `S` in 0; localisation `K((t))`, regular, the Check's value | true | none |
| §0.21 row and contract (lines 141, 352–355) | SchemeAndStackFoundations §0.21 at this head | `IsJ2`, *IsGRing.of_finiteType*, `regular_map_completion`, complete-local and Dedekind excellence; no J-2, G-ring or derivation criterion | true | none |
| `isGRing_of_isAffinoidAlgebra` | r56: `A=0`; `A=K`; `K⟨T⟩` at `(T)` | no primes; `K→K̂=K`; formal fibre over `(0)` is `K((T))` | true; route now owned | none |
| `isOpen_regularLocus_of_finiteType` | r56: cusp in char 2, 3 and other; `B=0` | Jacobians `(x²,0)`, `(0,2y)`, `(−3x²,2y)` vanish on the curve only at the origin; `∅` | true; route now owned | none |
| `isWeaklyStable_gaussFractionField` | r56: `n=0`; char `p`, `L=Frac(T₁)(S)`, `S^p=T` | `Frac(T₀)=K`; spectral norm `maxᵢ|aᵢ|≥|a₀|`, `C=1` | true | none |
| `isJapanese_of_isAffinoidAlgebra` | r56: `K⟨T⟩` char `p`; `K⟨T⟩×K` | closure `K⟨S⟩` free on `1,…,S^{p−1}`; excluded by `[IsDomain A]` | true | none |
| `exists_norm_le_mul_supSeminorm` | r56: `K⟨T⟩/(T²)`; doubled Gauss norm | `‖T‖=1`, `|T|sup=0` excluded by reducedness; `C=2` | true | none |
| `exists_eq_iUnion_rationalDomain` | r56: `A=0`; `U=Sp A`; annulus; `g=T` with no `f` | `n=0`; `g=1`; `R(T;ϖ)`; `{T≠0}` excluded by the unit-ideal clause | true | none |
| `isSheaf_affinoidSubdomain_presheaf` | r56: Laurent cover; `A=0` | `vₙ=0` for `n<0`, glue in `K⟨T⟩`; `F(∅)=0` | true | none |
| `exactAt_cechComplex_of_cover` | r56: one-member cover; `ι=∅` | `d⁰=0`, `d¹=id`, `Hⁿ=0` for `n≥1`; `Max A=∅` | true | none |
| `isGRing_stalk`, `isUniversallyCatenary_stalk` | r56: cusp; origin of `(XY,XZ)` | `K⟦t²,t³⟧`, fibre `K((t))`; minimal primes of coheight 2 and 1, quotient of a regular stalk | true | none |
| `closure_range_…`, `dense_range_maximalSpectrumToSpa` | r56: `A=K`; `v(ΣaₙTⁿ)=|a_k|εᵏ`; rank-two point | `L_K={|·|}`; `v∈L_A∖Spa`; proconstructible singleton without classical point | true | none |
| §0.1, §1.2 `[K:K^p]=∞`, §1.5, §2.2, §2.3, §3.1, §4.3, Kisin, §6.2, §6.3, §8.1, §8.2 QE, §8.3 Checks | r56 values | as computed in r56 | true | none |
| §1.3 | r56: `A=K⟨T⟩/(T²)`, `[L:K]=∞`; `ℚ_p⟨T⟩/(T²−p)`, `L=ℚ_p(√p)` | `A_L=L[T]/(T²)`; `A_L=L×L` | true | R02 (ownership) |
| table row §7.5 → Part III | Part III lines 604, 11031, 11042 on main | the target transports §7.5 and needs it | unowned | R01 |

## Not verifiable

- **[BGR]** and **[Prestel]** are recorded as `uncertified` and are settled. This round touches none of their locators.
- **[Matsumura]** *Commutative Algebra*, Theorem 102:
  - The roadmap's manifest still has no entry for it, and I did not read it.
  - The inputs the README lists match what [Conrad] lines 131–134 says the theorem needs at `Tₙ`, and [Mat1] is identified at Conrad line 1835.
  - The manifest is outside this pull request. The worker should record the book there, presumably as `uncertified`.
- **Ownership against open pull requests** was checked only against those whose files the brief provides. ClassicalAdicEtaleCohomology (#875) and AdicSpacesPartII/IV (#1187), from the overlap list, were searched through `roadmaps grep`, not read in full.

## Source issues

- **Misprint** in Conrad at §1.1, p. 3: the source credits the finite-`[k:k^p]` case to Theorem 108 of [Mat2], which numbers its theorems by section; it should refer to [Mat1], numbered consecutively; affects nothing.
- **Misprint** in Conrad at the proof of Theorem 1.1.1, p. 4: the source writes the differential module of the local ring at `q` as `Ω¹_{R_q/T}`; it should be `Ω¹_{C_q/T}`, since no ring `R` occurs in the statement; affects nothing.
