# Review of CyclicHomologyLieHomologyAndQuasiFreeAlgebras (pull request #2037 at 6dd4f41)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/README.md` and `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/Suggested.lean`. Source ids below are those of this review's fetches: `LQ84` is the GDZ scan of Loday–Quillen 1984, read as page images and cited by printed page; `CQ95a` and `CQ95b` are the AMS free-archive texts of Cuntz–Quillen 1995a/b; `Cor06` is arXiv:math/0111096v5; `DHK85` is the AMS free-archive text of Dwyer–Hopkins–Kan.

## R01 (P1) — 4.2: the I-adic completion of a quasi-free algebra is not quasi-free

**Location.** `README.md` lines 561–562: "and that the `I`-adic completion `R̂ = lim R/Iⁿ` of a quasi-free `R` along an ideal `I` is again quasi-free (loc. cit.)". Line 618 relies on it: "independence of the extension uses 3.2 and the quasi-freeness of `R̂` (4.2)".

**Claim.** With the roadmap's own `IsQuasiFree` (lifting along every square-zero surjection of discrete algebras), the claim is false. The cited source does not make it either. CQ95a Prop 6.1 (p. 275, `CQ95apdf` line 1034) says that a quasi-free A lifts maps A → R/I *into* R̂. CQ95b p. 414 (`CQ95b` line 1695) notes that R/Iⁿ need not be quasi-free and works with towers instead.

**Witness.** Take R = ℚ[x], I = (x), so R̂ = ℚ⟦x⟧. Quasi-free implies formally smooth over ℚ, so `Ω[ℚ⟦x⟧⁄ℚ]` would be projective (`Mathlib/RingTheory/Smooth/Basic.lean:71`) and hence free. But its residue fibre has dimension at most 1, while its generic rank is 2^ℵ₀.

**Repair.** In 4.2, replace the completion clause with CQ95a Prop 6.1(1), p. 275: a quasi-free `A` lifts every homomorphism `A → R/I` to `R̂`, for any algebra `R` and ideal `I`. Add the negative Check "ℚ[x] is quasi-free and its x-adic completion ℚ⟦x⟧ is not: `Ω_(ℚ⟦x⟧/ℚ)` is not projective". In 4.4's route, replace "the quasi-freeness of `R̂` (4.2)" with "lifting from the quasi-free `R` into towers `(Sₙ)` (Cuntz–Quillen 1995b, Proposition 9.2 and Theorem 9.3, p. 416)". On the refuting instance, the replacement asks only for lifts ℚ[x] → ℚ⟦x⟧ of maps ℚ[x] → ℚ, and these exist.

## R02 (P2) — 2.1: the Hopf algebra structure drops the source's characteristic-zero hypothesis

**Location.** `README.md` lines 299–302: "For `𝔤𝔩(A) = colim_r 𝔤𝔩_r(A)` over a field `k`, define the product … and prove that they make `H_*(𝔤𝔩(A))` a graded-commutative and cocommutative connected Hopf algebra (Loday–Quillen 1984, §6, p. 584)".

**Claim.** The cited source states this only in characteristic zero. The README gives no argument or source for an arbitrary field. Graded commutativity needs conjugation by permutation matrices to act trivially on `H_*(𝔤𝔩(A))`, and the infinitesimal argument for that divides by factorials.

**Witness.** `LQ84` p. 583, opening of §6, makes k a field of characteristic zero for the whole section. The Hopf-algebra paragraph is on p. 584, inside that section.

**Repair.** Read "over a field `k` of characteristic zero (Loday–Quillen 1984, §6, pp. 583–584)". Its only consumer, 2.4 through Milnor–Moore, is characteristic zero already. Convention 1 (lines 102–104) says all of Layer 2 is over a field of characteristic zero, while 2.1's complex and its `Tor` comparison are stated over a commutative ring. Make Convention 1 say so: the complex and the `Tor` comparison are over a commutative ring, and the Hopf structure and 2.2–2.6 are in characteristic zero.

## R03 (P2) — 3.2: nil-invariance of HP over ℚ is already owned by RefinedTraceMethods

**Location.** `README.md` lines 67–69: "Its §4.17 uses Goodwillie's nil-invariance of periodic cyclic homology as a proof input …; the theorem itself is stated here, 3.2." Downstream consumers, lines 838–840, says the same.

**Claim.** RefinedTraceMethods comes earlier in the merge order. It states, as its own targets, that `HP(−⊗ℚ/ℚ)` is truncating and that truncating invariants are nil-invariant. So for k = ℚ, 3.2 has two owners, and the Scope sentence misdescribes the supplier.

**Witness.** RefinedTraceMethods README (open head): line 1903 (§4.9), "HP(−⊗ℚ/ℚ) is truncating (Goodwillie; §4.17 …)"; line 2349 (§4.18), "Every truncating invariant E is nil-invariant"; line 2287 (§4.17), whose statement includes "HP(R⊗ℚ, I⊗ℚ) = 0".

**Repair.** In the Scope, write: "RefinedTraceMethods §4.9 states that `HP(−⊗ℚ/ℚ)` is truncating, hence nil-invariant by its §4.18. 3.2 cites it for `k = ℚ` and keeps the form for `HP` relative to an arbitrary field `k` of characteristic zero." Add RefinedTraceMethods §4.9 and §4.18 to 3.2's *Needs*, and correct lines 838–840. On the instance k = ℚ, A = ℚ[ε], I = (ε), both owners assert HP(ℚ[ε]) ≅ HP(ℚ).

## R04 (P3) — SmoothRepresentationsOfLocalGroups does not cite 5.4

**Location.** `README.md` lines 50–52: "…an instance; that roadmap cites 5.4." Line 834: "SmoothRepresentationsOfLocalGroups consumes 5.4".

**Claim.** This is false, and it describes a supply edge in the wrong direction. SmoothRepresentationsOfLocalGroups is earlier in the merge order, so a citation of 5.4 there would point upward.

**Witness.** SmoothRepresentationsOfLocalGroups README (open head) lines 81–84 say that firm modules and xst rings belong to this roadmap's §5.4, "and this roadmap cites no section of it".

**Repair.** Replace both passages with: "SmoothRepresentationsOfLocalGroups SR.1.3 (*locally-unital-algebra*) states the idempotented-algebra case independently and cites nothing here. 5.4 records it as an instance." Drop SR from Downstream consumers.

## R05 (P3) — 2.5 and 3.1 are narrower than their sources, and 3.1's Check misattributes the route

**Location.** Line 408–409 (2.5): "Prove: over a field of characteristic zero, `H₂(𝔰𝔩(A); k) ≅ HC₁(A)`". Lines 460–464 (3.1), "over a field `k` of characteristic zero". Check 3.1 #3, lines 475–477: "The route divides by weights … the statement is made in characteristic zero only."

**Claim.** (a) The source of 2.5 states that the isomorphism holds in every characteristic. (b) 3.1's route is the Cartan homotopy formula `L_D = [b + uB, e_D + E_D]`, whose identities `[b, e_D] = 0`, `[B, E_D] = 0` and `[b, E_D] + [B, e_D] = L_D` have integer coefficients. The weight division in Check #3 is 3.2's route, not 3.1's.

**Witness.** (a) `LQ84` p. 587, Remark after Corollary 6.7: the first isomorphism holds with no hypothesis on the characteristic (its [7], Kassel–Loday). (b) Over 𝔽_p, `x d/dx` acts on weight m of H̄C_n(𝔽_p[x]), n ≥ 1, by m. By 1.4 this weight is nonzero only for p | m, where m = 0.

**Repair.** State 2.5 over an arbitrary field, citing the `LQ84` Remark on p. 587 and Kassel–Loday 1982 (add it to the References). For 3.1, either state it over a commutative ring with Goodwillie's exact theorem number, or name the step that needs characteristic zero. Move Check 3.1 #3 to 3.2, where the weight argument belongs.

## R06 (P3) — existing owners at the pin and in earlier roadmaps are not cited

**Location.** `README.md` lines 54–58 ("Left to Tau Ceti", which lists only the permutation action) and 152–159 (From Tau Ceti). Line 206–207 (1.1's dual "`HC^n(A) ≅ Ext^n…`") and 224–228 (1.2, whose *Needs* name only RefinedTraceMethods §1.4). Lines 43–48: "A search … for … Chevalley–Eilenberg homology … finds no other owner".

**Claim.** The pinned Tau Ceti already has the following, and the README neither cites them nor says how its own objects differ:

- cyclic cohomology, periodic cyclic cohomology and relative cyclic cohomology of nonunital algebras;
- the forced-unitisation universal forms, which are the objects behind 4.1's `Ω¹A` and 4.3's `ΩR`;
- `A/[A,A]`.

Cyclic cohomology is used by 1.1's dual and 1.2 with no supplier named. Two earlier roadmaps own all-degree Chevalley–Eilenberg cochain complexes, so "finds no other owner" is inaccurate.

**Witness.** `TauCeti.cyclicCohomology` (`TauCeti/RingTheory/CyclicCohomology/Cohomology.lean:273`), `TauCeti.periodicCyclicCohomology`, `TauCeti.relativeCyclicCohomology`, `TauCeti.UniversalForms` (`TauCeti/NoncommutativeGeometry/UniversalDifferential/Complex.lean:45`), `TauCeti.cyclicQuotient`. Cochain complexes: ArithmeticLocallySymmetricSpaces ALS.F.5; LieGroupoidsPoisson §G1.3 (main).

**Repair.**

- Under "From Tau Ceti", list these declarations with their files:
  - `TauCeti.cyclicCohomology`, in `TauCeti/RingTheory/CyclicCohomology/Cohomology.lean:273`;
  - `TauCeti.periodicCyclicCohomology`, in `TauCeti/RingTheory/CyclicCohomology/PeriodicCohomology.lean:119`;
  - `TauCeti.relativeCyclicCohomology`, in `TauCeti/RingTheory/CyclicCohomology/Relative.lean:284`;
  - `TauCeti.UniversalForms`, in `TauCeti/NoncommutativeGeometry/UniversalDifferential/Complex.lean:45`;
  - `TauCeti.UniversalOneForms`, in `TauCeti/NoncommutativeGeometry/UniversalDifferential/OneForms.lean:45`;
  - `TauCeti.cyclicQuotient`, in `TauCeti/Algebra/Algebra/CyclicQuotient.lean:151`.
- Add `TauCeti.cyclicCohomology` to the *Needs* of 1.1 and 1.2.
- In 4.1 and 4.3, say in one clause that `Ω¹A = ker(A ⊗ A → A)` and `ΩR = R ⊗ R̄^⊗n` are the unital (normalised) forms, a quotient of Tau Ceti's forced-unitisation `UniversalForms`. In 4.6, cite `TauCeti.relativeCyclicCohomology` for the unitisation convention.
- In the Scope, cite ALS.F.5 and LieGroupoidsPoisson §G1.3 for Chevalley–Eilenberg cochains, and say that 2.1 owns the chain complex `(⋀^• 𝔤, d)` with trivial coefficients over a commutative ring.

## R07 (P3) — wrong locators

**Location.**

- Line 595 (4.3): "(Cuntz–Quillen 1995b, §§1–2)".
- Line 125 (Convention 6): "(Cuntz–Quillen 1995b, §1)".
- Line 725 (5.3): "(Cortiñas 2006, Theorem 0.1)", cited for the shift by one into cyclic homology.
- Lines 727–729 attribute the whole "if and only if" to Suslin–Wodzicki 1992.

**Claim.** In CQ95b, §§1–2 cover towers and bivariant cohomology, not the operators. Cortiñas' Theorem 0.1 is the HN statement, not the HC one. Suslin–Wodzicki prove only one direction of the equivalence.

**Witness.** CQ95b: b, κ and B are §3, p. 388 (`CQ95b` line 638); X(R) is §4, p. 392 (line 834). `Cor06`: line 33 (Theorem 0.1, HN) and line 47 (Corollary 0.2, HC). `Cor06` lines 119–123: Suslin–Wodzicki Theorem A, with the converse from Wodzicki (4).

**Repair.** Use these locators: CQ95b §3, p. 388 and §4, p. 392; Cortiñas Corollary 0.2, p. 2; Suslin–Wodzicki 1992, Theorem A, together with Wodzicki 1989, (4).

## R08 (P3) — targets without numbered locators

**Location.** 1.2 and 1.3 (Connes 1983, Dwyer–Hopkins–Kan 1985); 3.1 and 3.2 (Goodwillie 1985, "Part II"); 4.1, 4.2, 4.4 and 4.5 ("Cuntz–Quillen 1995a/b", "loc. cit."); 4.6 (Cuntz–Quillen 1997/1993); 5.1–5.6 (Wodzicki 1989, Suslin–Wodzicki 1992, Marín 1998, González-Férez–Marín 2007 "main theorem", Quillen 1996).

**Claim.** The README style rule asks for a locator at each claim. These give only a work.

**Witness.** CQ95a Prop 3.3, p. 267 (`CQ95apdf` line 694), Prop 3.4, p. 268 (line 750) and Prop 5.3, p. 273 (line 946). Goodwillie Theorem II.5.1, as cited at `Cor06` line 94. `DHK85` line 252 (p. 287).

**Repair, for the targets checked in this review.**

| Target | Locator to use |
|---|---|
| 4.1 characterisations | CQ95a Prop 3.3, p. 267 (`CQ95apdf` line 694) |
| 4.1 right connection | CQ95a Prop 3.4(4), p. 268 (`CQ95apdf` line 750) |
| 4.1 nilpotent lifting | CQ95a §6, p. 275 |
| 4.2 free and separable algebras | CQ95a p. 267 |
| 4.2 products, free products, matrix algebras, localisations | CQ95a Prop 5.3, p. 273 (`CQ95apdf` line 946) |
| 4.2 `K[x, y]` | CQ95a §5, p. 273 |
| 4.4 | CQ95b (2) p. 373, Theorem 6.2 p. 403, Corollary 9.4 p. 417 |
| 4.5 | CQ95a Prop 1.2, p. 255 |
| 3.2 | Goodwillie 1985, Theorem II.5.1, as cited at `Cor06` line 94 |
| 1.3 | DHK85 §5, p. 287 (`DHK85` line 252), which records BΛ ≃ K(ℤ,2) from Connes |

Give theorem numbers for the rest when their texts are read.

## R09 (P3) — two Checks are false as written

**Location.** Check 2.1 #4, lines 316–317: "on `H₁` it is addition `A/[A, A] × A/[A, A] → A/[A, A]` through the trace". Check 5.3 #3, lines 740–741: "`K₁` excision fails for the ideal `ℤε ⊂ ℤ[ε]/(ε²)`".

**Claim.** (a) The Hopf product sends H₁ ⊗ H₁ to H₂. What is additive is the map that the block sum 𝔤𝔩_r ⊕ 𝔤𝔩_s → 𝔤𝔩_{r+s} induces on H₁. (b) ℤ[ε]/(ε²) is the Dorroh unitisation ℤ ⋉ ℤε itself. There the excision map `K_n(ℤ⋉I, I) → K_n(R, I)` is the identity (GeneralAlgebraicKTheory §8.10's definition), so excision holds.

**Witness.** (a) The degree count: H₁ ⊗ H₁ lands in degree 2. (b) For R = ℤ⋉I, the map K₁(ℤ⋉I, I) → K₁(R, I) is the identity.

**Repair.** (a) Write: "on `H₁`, the map induced by the block sum is `(a, b) ↦ a + b` under the trace". (b) Write: "`A ⊗ ℚ` is not H-unital, so by 5.3 some unital ring containing `A` violates rational excision. The Dorroh unitisation `ℤ[ε]/(ε²)` itself never does."

## R10 (P3) — the `Suggested.lean` docstring omits headlines that are not stated

**Location.** `Suggested.lean` lines 25–44, the list "Headlines not stated".

**Claim.** The README Summary (lines 21–22) names 4.1's characterisations (Hochschild dimension at most one, projectivity of `Ω¹A`) as headlines, and 2.2 states the coinvariant form `(𝔤𝔩_r^⊗p)_𝔤𝔩_r ≅ k[Σ_p]`. Neither is stated, and the docstring names neither, nor the carrier each lacks.

**Witness.** In a scratch copy elaborated against the pins, `#synth Module (A ⊗[K] Aᵐᵒᵖ) (A ⊗[K] A)` fails. So the bimodule `Ω¹A` has no `A^e`-module structure at the pins, and the right connection needs `Ω¹A ⊗_A Ω¹A`.

**Repair.** Add a bullet: "4.1's characterisations (`Ext²_(A^e)(A, −) = 0`, `Ω¹A` projective over `A^e`, right connections): Mathlib has no `A ⊗ Aᵐᵒᵖ`-module structure on `A ⊗ A` and no tensor product over a noncommutative ring." Add the analogous bullet for 2.2's coinvariant form.

## R11 (P3) — definitions have no API bullet lists

**Location.** The definitions in 2.1 (Chevalley–Eilenberg complex), 4.1 (`IsQuasiFree`), 4.3 (`ΩR`, `X(R)`, `X̂(R, I)`), 5.1 (H-unital), 5.4 (unitary and firm modules), 5.5 (Morita context) and 5.6 (`K₀′`).

**Claim.** The README form requires each definition to list its API as bullets, one fact each, with hypotheses and conclusion. These sections give the facts only inside running prose.

**Witness.** For example, 4.1 states its lifting property, the nilpotent lift and four equivalences in one paragraph.

**Repair.** Under each definition, add an API bullet list: one bullet per fact the target proves, with its hypotheses. For example, 4.1: lifting along square-zero surjections; lifting along nilpotent kernels; quasi-free ⟺ `Ω¹A` projective; quasi-free ⟺ right connection.

## Verified sound

**Gate and build.**

- My run of the gate fails only on `depcheck: NOT IN ORDER: CyclicHomologyLieHomologyAndQuasiFreeAlgebras (insert it after its last supplier)`. That is the placement of a new roadmap and not a finding. Every other check is 0.
- The worker's gate passes all checks.
- `gate --depcheck … --order merge-order-candidate.txt --movable` prints `depcheck: 236 roadmaps, 2266 edges, 0 problem(s)`: no UPWARD or CYCLE line.
- No file in the pull request lies outside the folder.
- `lake env lean` on `Suggested.lean` gives exactly four warnings, `declaration uses 'sorry'`, at lines 71, 97, 106 and 111.

**Signatures.** I elaborated `#check @` for all 6 declarations in one scratch file. Each elaborated type matches its README statement:

- the 2.2 theorem takes `[Field K] [CharZero K]`;
- `isQuasiFree_freeAlgebra` takes any `CommRing k`;
- `not_isQuasiFree_mvPolynomial_fin_two` takes `[Field K]`;
- `IsQuasiFree` quantifies over `R S : Type u`, the universe of `A`, as the README says.

No section binder is lost.

**Padding probe.** `simp [IsQuasiFree]` and `aesop` leave all three quasi-free statements open, and `simpa using hf` and `aesop` fail on the 2.2 theorem. So no declaration closes in one tactic, none restates a definition or mirrors a Check, and there is no padding. As a sanity check, `glAction k r 0 x = 0` closes by `simp`.

**Library declarations opened at the pins.**

- Tau Ceti: `TauCeti.permTensorAction` and `TauCeti.permTensorActionAlgHom` (`TauCeti/RepresentationTheory/Symmetric/TensorAction/Basic.lean:142,161`); `TauCeti.permTensorActionAlgHom_injective_iff` (`Faithful.lean:167`, `[Nontrivial R]`, iff `d ≤ n`); `TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute` (`SchurWeyl.lean:137`, `[Field k] [NeZero (d ! : k)]`, commutation with every `map fun _ => f`). The README's Tau Ceti contract quotes these correctly, and 2.2's Lie-algebra form is not already at the pin.
- Mathlib: `LieModule.Cohomology.twoCochain` (`Mathlib/Algebra/Lie/Cochain.lean:46`, whose TODO lists the comparison with the Chevalley–Eilenberg complex), `LieAlgebra.SpecialLinear.sl` (`Classical.lean:92`), `UniversalEnvelopingAlgebra`, `TwoSidedIdeal`, `CategoryTheory.Abelian.Ext`, `nerve`, `SSet.toTop`, `HomotopyGroup` and `Algebra.FormallySmooth` all exist.

**Cross-roadmap citations resolved.**

- RefinedTraceMethods §1.1 (Λ, `Λ_∞`, cyclic objects), §1.2 (signed `t`, `B = (1 − t)sN`, normalised mixed complex), §1.4 (HC, HC⁻, HP, SBI, Connes' complex for ℚ ⊆ k, `HC_n(k[x]) = HC_n(k)` for n ≥ 1), §1.6 (Morita invariance, `HC_*(M₂(k)) ≅ HC_*(k)`), §4.17 and §4.18 (the KABI form).
- KTheoryFiniteLocalFields §4.0 `cyclicHomologyModel`.
- AlgebraicKTheory §3.4 (reduced `K₀(J) = ker(K₀(J⁺) → K₀(ℤ))`).
- GeneralAlgebraicKTheory §8.3, and §8.10 (degree-one excision ⟺ `I = I²`).
- TopologicalKTheory T3 item 2 (complexes exact on Y).
- NoncommutativeGeometry N1 (normalised form quotient for unital complex algebras).
- PerfectoidSpaces P0.4 (firm modules for `m̃`).

All are at the cited places, and all suppliers are earlier in the merge order.

**Overlaps.** No open pull request drops an id this roadmap cites, and none changes this roadmap. I compared ownership with RefinedTraceMethods (R03), K2SymbolsBrauer and HomologicalStabilityOfGeneralLinearGroups (no Lie-algebra or `H₂(𝔰𝔩)` overlap), NoncommutativeGeometry and GeneralAlgebraicKTheory. H-unitality, Wodzicki excision, quasi-free algebras, the X-complex and Loday–Quillen–Tsygan have no other owner.

**Sample locators verified against the text.**

- 2.1, 2.2, 2.3 and 2.6 against `LQ84` (GDZ scan): the Chevalley–Eilenberg differential, p. 583, equals Convention 3; Lemma 6.1, p. 584, has the sign `(−1)ⁿ` of Convention 4; Theorem 6.2, p. 584; §6.3, pp. 584–585, the commutant and the coinvariants `(𝔤ⁿ)_𝔤 ≅ k[Σₙ]` for r ≥ n; Propositions 6.4 and 6.6, p. 585; Corollary 6.7, p. 586, with trace in `A/[A, A]`; Theorem 6.9, p. 587, matching 2.6 verbatim.
- 1.4: Proposition 5.4, p. 583, with σ unsigned (p. 582).
- 4.1 and 4.2 against CQ95a Props 3.3, 3.4 and 5.3, and p. 273; R01 is the exception. CQ95a works over ℂ, and Prop 3.3's proof uses only that k is a field.
- 4.3 and 4.4 against CQ95b §3 (`b(ω da) = (−1)^|ω| [ω, a]`, `bd + db = 1 − κ`), §4 (X(R)) and (2) on p. 373 (`HP_*A = H_*(lim X(R/Iⁿ))`). Locator corrections are in R07.
- 1.3 against DHK §5, p. 287.
- 5.3 against Cortiñas, Theorem 0.1 and Corollary 0.2.

**Adversarial table** (values computed on each side):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. 2 (signed `t`) | `a ⊗ a`, n = 1 | `(1−t)(a⊗a) = 2a⊗a`, so `2(a⊗a) = 0` in `C^λ₁`; unsigned `(1−τ)(a⊗a) = 0` | holds | — |
| Conv. 3 (CE `d`) | `[x,y] = y` | `d(x∧y) = −y`; `H₁ = 𝔤/ky = k·x̄` | holds, equals LQ p. 583 | — |
| Conv. 4 (`λ` sign) | n = 1, 2 | n=1: `bλ = λd = −[x₀,x₁]`; n=2: both `= ([x₀,x₁],x₂) − ([x₀,x₂],x₁) − (x₀,[x₁,x₂])` | holds | — |
| Conv. 8 | `A = 2ℤ`, `M = ℤ/2` trivial | `2ℤ⊗ℤ/2 = ℤ/2`; relation `4⊗1 = 2⊗2 = 0`; so `A⊗_A M = ℤ/2`, `AM = 0` | holds | — |
| 1.1 | `X = k♮`; `A♮` in degree 0; `k → M₂(k)` | `Tor_n = k` (n even), 0 (n odd), `= HC_n(k)`; `Tor₀ = A/[A,A]`; `1 ↦ tr I₂ = 2` | holds | R06 (HC^n supplier) |
| 1.2 | degrees 0, 1, `uᵐ` | `Ext⁰ = k`; `Ext¹ = HC¹(k) = 0`; `Sᵐ: k ≅ k` | holds | R06, R08 |
| 1.3 | Δ vs Λ | `|Λ([n],[0])| = n+1`, so `[0]` is not terminal in Λ but is in Δ (BΔ ≃ *); DHK p. 287: `BΛ ≃ K(ℤ,2)` | holds | R08 |
| 1.4 | `V = k` over ℚ and 𝔽₂; `V = k²`, m = 2 | ℚ: `H̄C₀ = ⊕ kxᵐ`, `H̄C_{n>0} = 0`; 𝔽₂: `H_n(ℤ/2, 𝔽₂) = 𝔽₂` for all n; `dim Sym²k² = 3` | holds | — |
| 2.1 Checks | 𝔰𝔩₂(ℚ) | `d(e∧f∧h) = −2e∧f + 2e∧f = 0`; unsigned square `−2[[f,h],e] = 4h ≠ 0` | holds | — |
| 2.1 Hopf structure | LQ hypotheses | LQ §6, p. 583: char 0; README: any field | hypothesis dropped | R02 |
| 2.1 Check #4 | degrees | `H₁ ⊗ H₁ → H₂` | false as worded | R09 |
| 2.2 `glAction` / Weyl | p = 0; r = p = 2 on `e₂⊗e₂`; r = 2, p = 3 | `glAction k r 0 x = 0`, range `= End(K)`; `[gA E₁₂, gA E₂₁] = −2e₂⊗e₂ = gA(E₁₁−E₂₂)`; diagonal operators: `−e₂⊗e₂` vs `+e₂⊗e₂`; `(x⊗1+1⊗x)² − (x²⊗1+1⊗x²) = 2x⊗x` | holds | — |
| 2.2 coinvariant form, r ≥ p | r = 1, p = 2 | `id − swap ↦ 0`, as `injective_iff` with ¬(2 ≤ 1) predicts | holds | R10 |
| 2.3 Prop 6.4 | `[x,y] = y`, 𝔤 = ky vs 𝔤 = kx | ky: coinvariant `H₂ = k ≠ 0 = H₂(𝔤′)`; kx (semisimple): coinvariant homology `(k, kx̄, 0) = H(𝔤′)` | holds both ways | — |
| 2.4 LQT | `k`; `k×k`; `k[ε]` | exterior algebra on degrees 1, 3, 5, …; primitives double; `dim HC₀(k[ε]) = 2 = dim H₁` | holds | — |
| 2.5 | `k`; `k[x^±]`; char p | `H₂(𝔰𝔩(k)) = 0 = HC₁(k)`; `HC₁(k[x^±]) = k[x⁻¹dx]`; LQ p. 587: any characteristic | narrower than source | R05 |
| 2.6 | `A = k`, n = 2, i = 0, 1, 2; `k[x]` | `H₁(𝔤𝔩₁) = k ≅ H₁(𝔤𝔩₂)`; `H₂(𝔤𝔩₂(k)) = 0`; `Ω¹/dΩ⁰(ℚ[x]) = 0`; `x^(p−1)dx` survives over 𝔽_p | holds, equals Thm 6.9 | — |
| 3.1 | ℚ[x] and 𝔽_p[x], `D = x d/dx` | ℚ: `L_D xᵐ = m xᵐ` on HC₀, `HP₀ = k` with `L_D = 0`; 𝔽_p: weight m of `H̄C_{n≥1}` is nonzero only when p ∣ m, where `L_D = m = 0` | holds in char p as well | R05 |
| 3.2 | `ℚ[ε]`; `k[x^±] → k`; `T₂(k)` | weight w: even → `bx = 2y`, odd → `By = wx`, each acyclic; `HP₁(k[x^±]) = k ≠ 0`; `HP₀(T₂) = k²`; char p: odd w with p ∣ w has zero differential | holds | R03 |
| 4.1 `IsQuasiFree` and nilpotent lift | n = 0, 1; `k[t]/t³ → k[t]/t²`; `k⟨x,y⟩/J² → k[x,y]` | n=0: `[].prod = 1` forces R = 0; n=1: π injective; `x ↦ t` lifts; with `J/J² ≅ A⊗A`, a lift needs `1 ∈ (x₁−x₂, y₁−y₂)`, impossible | holds | — |
| 4.2 examples | `FreeAlgebra k Empty`; `K[ε]`; `M₂(K)` | `π 1 = 1`; `(t+ct²)² = t² ≠ 0` in `K[t]/t³`; M₂ separable | holds | — |
| 4.2 completion | `ℚ[x]`, `I = (x)` | `Ω⊗ℚ` has dim ≤ 1, `Ω⊗ℚ((x))` has dim `2^ℵ₀`, so not projective | **false** | R01 |
| 4.3 | `♮d∘b`; κ on Ω¹ | `♮d(yz) = ♮(z dy + y dz)` is symmetric; `(db+bd)(a₀da₁) = a₀da₁ − da₁a₀`, so `κ(a₀da₁) = da₁a₀` | holds; conventions equal CQ95b p. 388 | R07 |
| 4.4 | `k[x]`, `I = 0`; `k[x]`, `I = (x²)`; `k[x,y]` | `X(k[x]/xᵐ)`: `H₀ = k`, `H₁ = 0` for every m; `[x dy] ≠ 0` since `d(x dy) = dx∧dy`, while `HP₁(k[x,y]) = 0` | holds | route: R01 |
| 4.5 Fedosov | `a∘1`; `A = k`; `(da db)∘(dc de)` | `a − da d1 = a`; `RA = k`; `= da db dc de`; equals CQ95a Prop 1.2 | holds | R08 |
| 4.6 | `k[x^±]`, `J = (x−1)` | `HP₀(J) = 0`, `HP₁(J) ≅ HP₁(A) = k` from exactness | holds | — |
| 5.1 | zero multiplication on k; `⊕k`; `xk[x]` | `H₁ = A/A² = k`; local homotopy `e ⊗ −`; `A² = x²k[x] ≠ A` | holds | — |
| 5.2 Check | `pℤ ⊂ ℤ` | `pℤ⊗ℤ/p → ℤ⊗ℤ/p` is 0 on ℤ/p, so not pure; `A/A² = ℤ/p` | holds | — |
| 5.3 Check #3 | `ℤε ⊂ ℤ⋉ℤε` | excision map is the identity | false as worded | R09 |
| 5.4–5.5 | `2ℤ`, `ℤ/2`; `εℤ[ε]` with φ = ψ = 0 | `A⊗_A M → M` is 0 on ℤ/2; firm M = `AM = A²M = 0` | consistent | — |
| 5.6 Check #2 | `[[1,1],[0,0]]` vs `diag(1,0)`; `diag(1,0)` vs 0 | `(P−Q)³ = 0`, `trP − trQ = 0`; `(P−Q)³ = P`, trace 1 | holds | — |

The pull-request description, which is outside the folder, lists `permOperators`, `injective_permOperators_iff` and "seven headlines". The head has neither. Updating it would help the human approver.

## Not verifiable

These items were not certified. I record them here and did not open a manifest request.

- **Paywalled (DOI prefix 10.1016, never fetched):** Goodwillie 1985, Topology 24, for the generality and theorem number of 3.1; Marín 1998, JPAA 133 (5.5); González-Férez–Marín 2007, J. Algebra 318 (5.4's xst characterisation, the monomial-algebra example, and the left/right asymmetry of Check 5.4 #3). The University of Murcia repository copy of the related thesis returned HTTP 403.
- **No legal copy located:** Wodzicki 1989, Ann. of Math. (5.1, 5.2, including the purity hypothesis); Suslin–Wodzicki 1992 (5.3, the statement that C*-algebras are H-unital); Quillen 1996, Crelle 472 (the definition of `K₀′` and the hypotheses of its Morita invariance in 5.6); Cuntz–Quillen 1997 (Invent. Math.) and 1993 (CRAS), including "the approximately H-unital case" in 4.6; Connes 1983 (CRAS); Loday, *Cyclic Homology* (§6.2, Chapter 7); Tsygan 1983; Milnor–Moore 1965; Cartan–Eilenberg.
- 1.1's Tor theorem over an arbitrary commutative ring is cited to Loday §6.2, which I could not read. I checked it mathematically in the table.

## Source issues

- none
