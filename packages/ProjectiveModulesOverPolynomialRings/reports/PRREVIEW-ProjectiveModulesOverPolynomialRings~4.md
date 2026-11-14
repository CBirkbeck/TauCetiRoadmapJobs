# Review of ProjectiveModulesOverPolynomialRings (pull request #2295 at dd3913d)

**Verdict:** needs changes

## R01 (P3) — The description does not name the second supplier

**Location:** pull request description, Ownership: “It is the only supplier edge.”; Acceptance test: “Placed after PadicDifferentialEquationsAndRigidCohomology, it has one edge and no UPWARD or CYCLE.”
**Claim:** PadicDifferentialEquationsAndRigidCohomology is the roadmap's only supplier.
**Witness:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:168-177` consumes RelativeFarguesFontaine §6.4 (`GlueingPair`) and §6.5 (`beauvilleLaszlo_effective`); line 550 lists both in the *Needs* of 4.4.
**Repair:** Replace the first sentence by: “There are two supplier edges: PadicDifferentialEquationsAndRigidCohomology §RD.0.55–§RD.0.56 (2.1, 5.4) and RelativeFarguesFontaine §6.4–§6.5, whose gluing of finitely generated projective modules over a glueing pair is used in the route of 4.4. Both come earlier in the merge order.” Replace the second by: “Placed after RelativeFarguesFontaine, it has two edges and no UPWARD or CYCLE.” The Layer 4 bullet gains “(route: `Y = 1/X`, gluing over `A[Y]`, affine Horrocks over `A[Y]`)” after Bass's theorem.

## R02 (P3) — The description still counts and numbers an earlier head

**Location:** pull request description: “states 16 headline theorems”; “the formulation of the Quillen ideal (3.2)”; “Quillen patching of the quotient `A[X]ⁿ ⧸ A[X] f` (3.3)”; “Research context (two paragraphs)”.
**Claim:** The description states the head's content and numbering.
**Witness:** `Suggested.lean` has 17 `sorry` theorems (`exists_unit_lift_dilation`, line 106); README lines 333, 361, 390, 407 number the dilation lemma 3.2, the Quillen ideal 3.3, patching 3.4–3.5; Research context has three paragraphs (729, 744, 766).
**Repair:** Write “states 17 headline theorems”; add to the Layer 3 bullet “Quillen's dilation lemma on units of `R_f[X]` for a not necessarily commutative `A`-algebra `R` (3.2)”; in Review write “the Quillen ideal (3.3)” and “(3.4)”; “Research context (three paragraphs)”; drop Lindel 1981 from the works “cited without a locator” (README 749 gives “Theorem, p. 319”); in Sources add “Lemma V.2.10 (p. 253)” to the Lombardi–Quitté list.

## Verified sound

Previous review (at 0a50b4e), finding by finding:

| Previous finding | Passage at this head | Result |
|---|---|---|
| R01 route of 4.4 | README 534–551: “`(A[Y] → A[Y]_h, Y)` is a glueing pair (RelativeFarguesFontaine §6.4), and RelativeFarguesFontaine §6.5 glues …”; contract 168–177 | Repaired; route recomputed below |
| R02 route of Lemma 2 | README 441–450: “by `IsPrincipalIdealRing.of_prime` it suffices that every such prime `Q` of `k[X]` is principal” | Repaired; all five new Mathlib names exist at the pin |
| R03 universe of 2.1 | `Suggested.lean:62` “`(P : Type v)`”; README 238 “(in any universe)”, 242–245 | Repaired |
| R04 API as bullets | README 287–303 (eight bullets), 452–457 | Repaired |
| R05 description | “states 16 headline theorems” unchanged | Not repaired: R02 above |

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Convention 1 | `!![2,1;3,2]` over `ℤ` | det `4−3=1`; column 0 `(2,3)`; transpose row 0 `(2,3)` | Agrees | None |
| 1.1 `r!` theorem | `r=1`, `a=(2,3)`, `m=(1,2)`; `r=0`, `(2)` over `ℚ`; some `mᵢ=0` | Row `(2,9)`, det `10−9=1`; `SL₁={1}≠(2)`; entry `aᵢ⁰=1`, row completable anyway | Holds; `r≠0` needed; positivity harmless | None |
| 2.1 stable freeness | `n=0,1`; `ℤ/2` over `ℤ/6`; `P : Type v`, `k : Type u` | Free; local ranks `(1,0)`, `(s+1,s)` never constant; `Shrink P : Type u`, back by `of_shrink` | Agrees | None |
| 3.1 `IsExtendedFrom`, iff at zero | `A[X]ⁿ`; `A[X]/(X)`; `A[X]/(X−1)`, `A≠0` | `N=Aⁿ`; `M(0)=A`, `X` injective on `A[X]` vs `0`; `M(0)=0≠M` | True, false, false | None |
| 3.1 `IsExtendedAfter`, `IsExtendedAfterMv` | `ℤ[X]/(2,X)` at `ℤ[1/2]`, `ℤ₍₂₎`, `ℤ₍₃₎`; `ℤ[X,Y]/(2,X)` at `ℤ₍₂₎`; `n=0` | `0`; `𝔽₂` with `X=0`; `0`; `𝔽₂[Y]` vs `𝔽₂[X,Y]`; `N=M′` | T, F, T; F; T | None |
| 3.2 dilation lemma | `θ=1+(X/2)E₁₂`, `f=2`; `f=0`; `f` unit | Quotient `1+((g₁−g₂)/2)XE₁₂`; `k=1` lifts, `k=0` fails at `(1,0)`; zero ring, `ψ=1`; `k=0` | Agrees with Quillen1976 lines 56–58 and the Lean form | None |
| 3.3 Quillen ideal | `ℤ[X]/(2,X)`; `a=0`, `1`; `g∈aᵏA`, `1−g∈bᵏA` | `I=2ℤ`; `0∈I`; `1∈I ⇔` extended; pair `(1,g)` differs in `bᵏ`, `(0,g)` in `aᵏ`; `u_aψ_a=u_bψ_b` | Route valid | None |
| 3.4 patching | local `A`; zero ring; `ℤ[X]/(2,X)` | `A_m=A`; no maximal ideal, `M=0`; fails at `(2)` and globally | Agrees with Quillen1976 lines 84–85 | None |
| 3.5 several variables | `n=0,1`; step over `A′=A[X₁..Xₙ₋₁]` | `N=M`; 3.4; `A′_(m′)` localises `A_m[X₁..Xₙ₋₁]` | Agrees with Quillen1976 lines 153–154 | None |
| 4.1 `A⟨X⟩`, Lemma 2 route | `k=ℤ`: `Q=(2)`, `(2X−1)`, `(2,X)`, `(X)`; field; zero ring | `(2)=2ℤ[X]`; `(2X−1)` primitive generator; last two contain monic `X`; `k⟨X⟩=k(X)`; `0` monic iff `A=0` | Route valid on pinned inputs | None |
| 4.1 faithful flatness | `ℤ⟨X⟩` vs `ℚ(X)` | `2ℤ⟨X⟩≠ℤ⟨X⟩` (leading coefficient even); `2ℚ(X)=ℚ(X)` | Agrees | None |
| 4.2 local Horrocks | field; `ℤ₍₂₎[X]/(2,X)`; localised cusp | PID case; `A⟨X⟩⊗P=0` free, `P=𝔽₂` not; rank-one non-free, free over `Frac(A)(X)` | Hypotheses needed; matches LombardiQuitte2015 lines 43170–43172 | None |
| 4.3 affine Horrocks | sphere `R[X]⊗K`; route at `m` | `P(0)=K` not free, extended; `N_m` finite flat, free; `A_m⟨X⟩` localises `A_m⊗A⟨X⟩` | Agrees with line 43263 | None |
| 4.4 Bass, statement | fields; `(2,1+√−5)`; retraction | Dimensions; `a²+5b²=2` unsolvable; `X↦c` sends unit `X−c` to `0` | Agrees with line 43275 | None |
| 4.4 route, determinant | `H=sC`, `C` elementary, size `n`; `H′=YᵈH(1/Y)` | `det H=sⁿ`; `det H′=Y^(n(d−deg s))·(Y^(deg s)s(1/Y))ⁿ`, `d≥deg s`, `h(0)=1` | `r=n(d−deg s)≥0` | None |
| 4.4 route, glueing pair | `(A[Y]→A[Y]_h, Y)`; `H=(X+2)`; `H=(2X+1)` over `ℤ` | `h≡1` mod `Y`, unipotent mod `Yᵐ`; torsion `0=0`; `ℤ[Y]/Y=ℤ` vs `ℤ[Y]_(2+Y)/Y=ℤ[1/2]` | Pair for monic determinant only | None |
| 4.4 route, ends | `M_Y≅A[Y]_Y⊗P`, `M_h≅A[Y]_h⊗Q` | `Y↦1` inverts `Y`: `M(1)=P`; `Y↦0` sends `h↦1`: `M(0)=Q`; 4.3 gives `M(1)≅N≅M(0)` | `P≅Q` | None |
| 4.5 Quillen's Horrocks | zero ring; sphere module | Both sides hold; `P(0)=K` not free, so not free over `R⟨X⟩` | Agrees with Quillen1976 lines 127–128 | None |
| 5.1 unimodular vectors | `n=0,1,2`; `f=(X²,1+X)`; sphere `(x,y,z)`, `d=0` | Empty span forces `0=1`; `g=C(f(0))f⁻¹`; products `(1,0)` then `(0,1)=f(0)`; identity | Agrees with line 43707 (there `n≥2`) | None |
| 5.1 route | `M=A[X]ⁿ/A[X]f` | `M(0)=Aⁿ/Af(0)`; two rank-one free complements; `g=(K≅K′)⊕(f↦f(0))` | Valid | None |
| 5.2 Quillen–Suslin | `n=0`; `n=1`, `k=𝔽₂` | PID base; `B=𝔽₂(T)`; `𝔽₂⊗[k[T]]k⟨T⟩=0` | Agrees with Quillen1976 lines 145–151 | None |
| 5.3 Dedekind | `𝔽₂`; `ℤ[√−5]`; `k[t²,t³]` | `m=0`, `B_m` field; `𝔞[X]` extended, not free; non-seminormal | Agrees with Quillen1976 lines 177–178 | None |
| 5.4 completion | `(2,3)`, `(2,4)`; `m=0`, `a=−1`; `(1+X,X)` | det `1`; span `(2)`; `GL₁∋−1∉SL₁`; det `(1+X)−X=1`; `g=h⁻¹` has column `v` | Agrees with line 43476 (field) | None |
| Layer 5 example | `(1+XY,X²,Y²)` | `(1−XY)(1+XY)+Y²X²=1` | Unimodular | None |

- Source locators checked against the text: 15 in LombardiQuitte2015 (V.2.10 at line 12850; VIII.6.1; XVI.1.1, 3.6, 3.7, 4.2, 4.3, 4.4, 4.6, 4.7, 4.8 with its proof, 5.3, 5.5, 5.14, 5.15), 11 in Quillen1976 (Lemmas 1–2, Theorems 1, 1′, 3, 4, 4′, Comments (1)–(3), pages 167–170), 2 in Cesnavicius2022 (§2.1.2, Theorem 5.2.2), 1 in Kedlaya2004 (line 545); all agree. Every sampled target is supported by a text read; 1.1 is not (Not verifiable).
- Pinned declarations opened: `IsPrincipalIdealRing.of_prime` (`Mathlib/RingTheory/PrincipalIdealDomainOfPrime.lean:52`), `Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map` (`RingTheory/Polynomial/GaussLemma.lean:307`), `IsLocalization.orderIsoOfPrime` (`RingTheory/Localization/Ideal.lean:227`), `IsLocalization.isDomain_localization` (`RingTheory/Localization/Defs.lean:893`), `Polynomial.primPart` (`RingTheory/Polynomial/Content.lean:225`), `Module.Finite.small` (`RingTheory/Finiteness/Small.lean:51`), `Shrink.linearEquiv` (`Algebra/Module/Shrink.lean:30`), `Module.IsStablyFree.of_shrink` (`Algebra/Module/StablyFree/Basic.lean:64`), `Algebra.TensorProduct.includeRight` (`RingTheory/TensorProduct/Basic.lean:273`), `Polynomial.algebra` (`RingTheory/PolynomialAlgebra.lean:207`), and the nine of the previous review at the same lines.
- Cross-roadmap citations resolved at the open heads: RelativeFarguesFontaine §6.4 (`GlueingPair`, three fields: quotients surjective and injective for every `n`, power torsion bijective) and §6.5 (`beauvilleLaszlo_effective`, all carriers in one universe, `IsLocalization.Away (algebraMap R R' f) L`, compatibility with `α`), matching README 168–177; PadicDifferentialEquationsAndRigidCohomology §RD.0.55 (a), (b), (d), §RD.0.56 (a), (b), §RD.3.27; AlgebraicKTheory on main.
- Duplication by object: no monic submonoid, extended-module predicate, Horrocks or Quillen–Suslin statement in the pinned Mathlib or Tau Ceti; `roadmaps grep` over main and the open heads finds no second owner and no roadmap citing this one. The gluing over two comaximal localisations is a case of RelativeFarguesFontaine §6.5 (for comaximal `s`, `t`, `(R → R_t, s)` is a glueing pair) and is not restated here.
- Dependency check: `depcheck: 242 roadmaps, 2194 edges, 0 problem(s)`; two supplier edges, both earlier in the merge order.
- Gate: every check passed. Elaboration of `Suggested.lean` at the pins: 17 `sorry` warnings, nothing else. The 21 elaborated signatures compared with the README; no binder lost.
- One-tactic probe (`infer_instance`, `rfl`, `trivial`, `simp`, `constructor <;> infer_instance`, `exact?`) on a scratch copy: none of the 17 theorems closes. All 17 README headlines are stated; none is a stand-in.
- No change outside the folder; no `set_option`, no sorried data; every layer ends with Examples and Dependencies.

Overlap check: read HomologicalStabilityOfGeneralLinearGroups, PadicDifferentialEquationsAndRigidCohomology, RelativeFarguesFontaine, AlgebraicKTheory; finite free resolutions and the unimodular extension property are PadicDifferentialEquationsAndRigidCohomology's (§RD.0.55–§RD.0.56), glueing pairs and the gluing of finitely generated projective modules RelativeFarguesFontaine's (§6.4–§6.5), `Eₙ`, stable range and Milnor squares AlgebraicKTheory's; nothing else shared.

Source independence: 29 passages compared with 4 sources, none shared (the route of 4.4 keeps the source's letters `F`, `G`, `H`, `H′`, `h` and its formula `det H′ = Yʳh`, which the mathematics forces; the surrounding sentences are the roadmap's); largest share LombardiQuitte2015, about 25 of 72 locators; contents compared with LombardiQuitte2015, Chapter XVI: independent. Layers 1–2 lie outside that chapter, Layer 3 joins its §1 and §3 with Quillen's Lemma 1, Layer 4 adds Quillen's Lemma 2 and Theorem 3 and faithful flatness from Chapter VIII, §2 and §6 are not layers; the order 3 → 4 → 5 is forced by 4.3 → 3.4 and 5.2 → 4.5.

## Not verifiable

- Suslin 1977, Theorem 2, p. 479 (1.1): the DOI request through the sources service failed again on a network timeout; the statement and page stand on the locator alone.
- Suslin 1976 (5.2, 5.4): not retrievable; 5.2 is supported by Quillen1976 lines 145–146, 5.4 over a field by LombardiQuitte2015 line 43476, and over a principal ideal domain by the route (5.2 and §RD.0.56 (b)).
- Horrocks 1964, Theorem 1, and Lang, Theorem XXI.3.4: not read; confirmed only through Quillen1976 lines 121–122 and Kedlaya2004 line 545.
- Fasel–Rao–Swan, Schäppi, Lindel 1981, Swan 1962, Swan–Towber 1975, Bass 1973, Murthy 1966, Mohan Kumar 1985, Popescu 1986/1990, Swan 1998, Swan 1978, Lequain–Simis 1980, Asok–Hoyois–Wendt 2018, Lam 2006: not read in this round; Research context cites them and no target depends on them.

## Source issues

- **Misprint** in Quillen1976 at proof of Theorem 4, printed p. 169 (line 148, read through OCR): the source tensors `A = k[T₁, …, Tₙ₋₁]` with `k(T)` over `k[T]`; it should be `A[T]` in the left factor; affects the proof.
- **Error** in LombardiQuitte2015 at the comment after Theorem XVI.5.15, printed p. 924 (lines 43744–43748): the source concludes, under the head-ideal hypothesis, that the kernel is free and the vector completable; it should conclude only equivalence with the value at zero (the constant sphere vector has unit head ideal and is not completable); affects nothing.

## For the human reviewers

- **Licence.** Quillen1976 lines 22–27: the GDZ scan carries terms restricting reproduction; the README and this report give locators and restatements only.
- **Licence.** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:770-772` cites an unpublished preprint (Schäppi, arXiv:2311.04104v1) for a claimed counterexample in Research context; no target depends on it.
- **Scope.** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:168-177`: target 4.4 now depends on RelativeFarguesFontaine §6.5 (Beauville–Laszlo), a roadmap still in a pull request, for a gluing over two comaximal localisations.
