# GATE-AutomorphicPadicLFunctionsPartII~4: answers to the human review of head 35bd100

Review answered: kim-em, 2026-11-19T00:52:52Z. The repairs are one commit, `8e0fa4d` on top of `35bd100`. It changes `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/README.md` and `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/Suggested.lean` only.

**Numbering.** H01–H22 answer the review's numbered requests 1–15 in order, split where a request makes separate points: 4(a)–(d) are H04–H07, 6(a)–(c) are H09–H11, 8 is H13–H14 and 11 is H17–H18. H23–H26 answer the four "Smaller points" in order, and H27 answers the remark on open suppliers in the verdict paragraph. The "Coverage" section raises the same points as items 1, 2, 4, 5 and 6, and points to them by number, so it is answered there. Line numbers below are README lines at `8e0fa4d`.

## H01 (kim-em) — applied

The premise is out of date: at its head e52ac01, ComplexMultiplicationAndExplicitReciprocity §1.2, "Embedding eigenspaces and lifted CM types", now defines the lifted type and proves that a type lifted from a CM subfield K′⊂K is lifted from K. §0.1 (line 41) now consumes that definition and cites it in its *Needs:* line (73), instead of restating Σ={σ | σ|K∈Σ_K}. The scope bullet that names that roadmap as owner of lifted CM types (line 1286) is therefore accurate.

## H02 (kim-em) — applied differently

The maximal CM subfield already has an owner earlier in the merge order. MordellLawrenceVenkatesh §1.4 (open, head 32a0090, merge-order line 173 against 350 for this roadmap) defines the largest totally-real-or-CM subfield E_L and proves that it is CM exactly when L has a CM subfield. So §0.1 cites it rather than asking ComplexMultiplicationAndExplicitReciprocity to plan it again.

- "specified" is removed from the Summary (line 3), the Conventions (line 27) and §0.1 (lines 41, 49).
- The K′⊂K lemma is an API bullet citing ComplexMultiplicationAndExplicitReciprocity §1.2 (line 58).
- The requested Check is line 69. For L=ℚ(ζ₈) only 2 of the 4 CM types are lifted from ℚ(i). The type −2 on {ζ₈↦ζ₈, ζ₈↦ζ₈³} lies in Crit_L(⟨1+√2⟩), and a choice K=ℚ(i) would drop it.
- New supplier contract "From TauCetiRoadmap.MordellLawrenceVenkatesh" (line 1323).

## H03 (kim-em) — applied

Σ_K is now a `TauCetiRoadmap.ShimuraVarieties.CMType` of ShimuraVarieties §5.1, which is on main (line 41 and the *Needs:* line 73). There is a new supplier contract "From TauCetiRoadmap.ShimuraVarieties" (line 1319) and a scope clause (line 1285).

## H04 (kim-em) — applied

§0.1 (line 45) now defines Σ_μ={σ : μ(σ)<0} and the Σ-free set Crit_L(Γ)={μ∈HCI_L(Γ) : Σ_μ is a CM type of L}. The API (lines 55–59) states:

- Σ_μ is lifted from K for μ∈Crit_L(Γ);
- μ∈CI_L(Γ) for Σ exactly when μ∈Crit_L(Γ) and Σ_μ=Σ;
- the pair (a,β) is unique;
- Crit_L(Γ)⊆Crit_L(Γ′) for Γ′⊂Γ.

The new Check on line 66 is a non-example: (−1,−1) on ℚ(i) lies in HCI but not in Crit.

## H05 (kim-em) — applied

§0.1 (line 47) defines criticality of an algebraic Hecke character χ.

- Because L is totally imaginary, χ (Tau Ceti `HeckeCharacter.IsAlgebraic`) has a unique algebraic infinity type n.
- Its ideal exponent is μ_χ=−n, by `TauCeti.GlobalNumberFields.HeckeCharacter.idealCharacter_apply_toPrincipalIdeal_eq_embeddingCharacter_inv`. I read that theorem at the Tau Ceti pin 2fd255d; it gives χ((λ))=(embeddingCharacter n λ)⁻¹, and its total-positivity hypothesis is vacuous here.
- χ is critical when μ_χ∈Crit_L(O_f×), and its CM type is Σ_χ=Σ_(μ_χ).

The sign Check on line 70: for χ((λ))=λ⁻⁴ on ℚ(i), n=+4 at the identity embedding. Reading n as the ideal exponent would make Σ_n empty and reject the character.

## H06 (kim-em) — applied

I_L=ℤ[Hom(L,ℂ)] is gone. §0.1 (line 43) and the Tau Ceti contract (line 1311) now use the pinned carriers, with their files:

- `TauCeti.GlobalNumberFields.AlgebraicInfinityType`;
- `…AlgebraicInfinityType.embeddingCharacter`, for "trivial on Γ";
- `…AlgebraicInfinityType.baseChange`, for N*_(L/K). I checked that x^(baseChange μ₀)=(N_(L/K)x)^μ₀.

The names HCI_L/CI_L, which the README uses throughout, are kept, and Crit_L is added for the Σ-free set. The published paper's notation could not be compared because its text is paywalled (H16).

## H07 (kim-em) — disputed

`Suggested.lean` is the acceptance test. It states only headline theorems, plus definitions needed to make a headline statable.

- Crit_L, Σ_μ and the classification are foundational inputs, not headline results.
- No arithmetic headline becomes statable with them: integrality, algebraicity and interpolation all need CM period data and Hecke L-values, which do not exist at the pins.
- Adding them would turn the file into an API catalogue.

The README states them as targets on the named Tau Ceti carriers.

## H08 (kim-em) — applied differently

The premise that Ω∨=2πi q/barΩ is sign-sensitive is wrong when one pairing is used throughout. Negating the A4.3 pairing negates ⟨·,·⟩_top, every ξ_a∨, Ω∨ and q together. §5.1 (line 681) now says so and defines ⟨·,·⟩_top explicitly from A4.3:

- the A-argument comes first;
- η_γ′ is defined by ⟨η_γ′,θ⟩_dR=∫_γ′θ;
- ⟨γ,γ′⟩_top=∫_γη_γ′.

Since A4.3 states only that its pairing is perfect, the 2πiℤ scale is now explicitly part of the §5.1 target. This answers (b) and (c).

(a) No roadmap on main or earlier in the order defines an algebraic de Rham c₁ over a characteristic-zero base. CrystallineCohomology CR.3.3 defines it on the crystalline site (p locally nilpotent) and over perfect fields of characteristic p. ComplexComparisonPartII C5.4 has only the analytic Chern form. The repaired text therefore no longer appeals to c₁^dR.

(d) The new Check (line 710) on ℂ/ℤ[i] takes ⟨η,θ⟩_dR=(t/2πi)∫η∧θ with t=±1 and computes:

- q=t/π;
- ⟨γ,γ′⟩_top=2πit·Im(γ′barγ);
- ξ∨(y)=2ti·bary, onto ℤ[i] from d_L⁻¹;
- Ω∨=2ti=2πi q/barΩ, for both values of t.

If ⟨·,·⟩_top were taken from the opposite sign, the result would be −2πi q/barΩ. This replaces the 4πi Check, which only restated the definition.

## H09 (kim-em) — applied

§5.1 (line 683) adds the unit change: ξ∘ε replaces ξ∨ by ξ∨∘ε⁻¹, multiplies Ω(σ) by σ(ε) and Ω∨(τ) by τ(ε)⁻¹, and multiplies Ω^α(Ω∨)^β by the inverse of the value at ε of the monomial of β−α. An API bullet and a Check (line 711) go with it: on ℚ(i), ε=i fixes Ω⁴ and preserves the period relation.

## H10 (kim-em) — applied

§5.1 (line 683) now proves that Ω(σ) and Ω∨(τ) are nonzero. The σ-coordinate of ξ(x) is Ω(σ)σ(x), so a zero period would contradict the full lattice of A5.1. §5.2 no longer assumes nonvanishing: line 718 now reads "where every period coordinate is nonzero by §5.1", and its Assume line points to §5.1.

## H11 (kim-em) — applied

ComplexMultiplicationAndExplicitReciprocity §1.2 already states, in the last bullet of its basic API at head e52ac01, that H₁(A(ℂ),ℤ) is an invertible O_L-module. §5.1 (line 679) consumes it: an a-structure exists exactly for a in that ideal class and is unique up to O_L×. The vague Check is replaced by line 704: for ℚ(√−5) and A=ℂ/(2,1+√−5) there is no O_L-structure, and the a-structures are ±id.

## H12 (kim-em) — applied

The sentence "Prove that these are precisely the algebraic Hecke types whose Γ-invariant coefficient lines occur below" is deleted from §0.1. §0.3 already states the invariants assertion and now cites "Weil's classification of §0.1". The comodule declarations are removed from §0.1's *Needs:* line; they remain in §0.3's.

## H13 (kim-em) — applied

§0.2 (line 77) now defines a based CM abelian scheme (R, A of lifted type Σ, ω_A, ω_A∨). A standard datum is a based CM abelian scheme plus an f-torsion section x fixed by Γ. §5.1's Assume line (685) and §0.3's (106) now require only the based scheme.

## H14 (kim-em) — applied

§0.2 (line 77) now states the convention once: pullback ι(ℓ)^* acts on ω_A,σ by σ(ℓ); the Γ-action is its inverse σ(γ)⁻¹, which ComplexMultiplicationAndExplicitReciprocity §1.2 labels ω_A(−σ); and on ω_A∨,barσ the action barσ(γ) is pullback along ι(γ)∨.

## H15 (kim-em) — applied

GlobalNumberFields is under `Completed/` on main, so both "What GlobalNumberFields must provide" paragraphs are deleted.

- **gap:unit-type-classification** is now a target here: Weil's classification in §0.1 (line 43), with its proof route on line 61.
  - The route uses Dirichlet's unit theorem through Mathlib `NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top` and Galois conjugation to get the conjugate-sum relation for every complex conjugation.
  - MordellLawrenceVenkatesh §1.6 then factors the type through E_L.
  - The converse runs through N_(F/ℚ)(u)^w=±1.
- **gap:hecke-padic-avatar** goes to an owner on main: AutomorphicGaloisRepresentationsPartII AG2.0, "The `l`-adic character `r_{l,ι}(χ)` of an algebraic Hecke character". The new contract (line 1327) converts its geometric Artin normalization: the character used here is r_(p,ι)(χ)⁻¹, and the conversion reproduces §8.3's χ(q_f(u))=χ_fin(u)u^(β−α).
- §5.3 used no p-adic character, so its gap citation was dropped.

## H16 (kim-em) — applied differently

The Annals version (202 (2025), no. 1, 1–109) is behind a paywall, and the manifest records KS-v4 as waived. So neither text is open to this job, and no published locators can be added.

What changed instead:

- The KS-v4 reference entry (line 1401) now gives the published citation with DOI 10.4007/annals.2025.202.1.1 and says that the locators are arXiv v4.
- The Summary's claim (line 15) is scoped to "the formula of the arXiv version".

The §8.5 sign does not rest on the version: the README derives it from the derivative sign of §4.3, checks it at d=1 against BK-2010, and records the parity factor in HT-1993. Whether to ask the authors to confirm the sign before merge is a decision for the maintainers.

In the same entry, "The construction follows §§2–3 …" became "Cited for …", and the Summary's "Following Kings and Sprang" became "due to Kings and Sprang", because a roadmap must not describe itself as following a source.

## H17 (kim-em) — applied

Every "KS-v4 line N", "HT-1993 line N", "BK-2010 line N", "Sch-2014 line N", "HK-2018 line N" and "BKO-2021 line N" locator is removed: 74 by pattern and 7 rewritten by hand into page, theorem or proof locators. For example, "the class sign at KS-v4 line 3514" became "where that proof applies Theorem 3.27". The References sentence about the line-numbered extraction is deleted.

## H18 (kim-em) — applied

All `file.lean:NNN` suffixes and "line 98" are removed from the Mathlib and Tau Ceti contracts (lines 1297–1311). Each file named there exists at the pins: Mathlib in this repository's manifest and Tau Ceti 2fd255d.

## H19 (kim-em) — applied

The 14 bold items (1.3, 1.4, 2.2, 2.4, 2.5, 2.8, 3.6, 4.3, 5.3, 5.6, 6.2, 6.4, 7.3, 8.2) are now `### k.n` headings. The 12 parent sections get back their own titles: for example, §1.2 is "Equivariant residue and inverse-limit comparison" again, not "…classes and their flat derivatives". The "This section … consumes …" paragraphs, which described the merged sections, are removed. Every one of the 46 numbered targets now has its own heading.

## H20 (kim-em) — applied differently

The title (line 1) is now "critical Hecke values and their p-adic measures over totally imaginary fields". The Scope no longer says "This Part II" or that no part I precedes it (line 1280). The `Suggested.lean` docstring title matches.

Renaming the folder and Lean namespace from `AutomorphicPadicLFunctionsPartII` is outside the two files this job edits. Two open roadmaps cite the present name for §8.5: AutomorphicCongruences, which has a supplier row and gap:katz-ht93-normalization, and NonordinaryCMSpecialValues. The rename has to be coordinated with their citations.

## H21 (kim-em) — applied

The Betti duality stays here; AbelianSchemesAndArithmeticModuliPartII at head d315ffb has no such target in its P, B or F layers. The pointer moves from the ComplexMultiplicationAndExplicitReciprocity bullet to the AbelianSchemesAndArithmeticModuli bullet of the Scope (line 1286), where readers of that roadmap will look: "the comparison of the A4.3 duality with the integral Betti duality between H₁(A(ℂ),ℤ) and H₁(A∨(ℂ),ℤ), with its 2πi normalization, is §5.1 here".

## H22 (kim-em) — applied differently

Section citations now use the headings of AutomorphicLFunctionsAndLocalFactors on main.

- "Local epsilon factors and Gauss sums" → AL.1.3, in §8.1, §8.5, the Layer 8 dependencies and the contract.
- "Global distributions …" → AL.1.5.
- Hecke continuation and the rank-one comparison: AL itself refers AL.1.5.2–AL.1.5.3 and AL.1.6.2 to AnalyticNumberTheoryPartI §2.3a, so §5.3 cites §2.3a directly, under a new contract (line 1385).
- Finite Fourier orthogonality and inversion (§7.3) → AL.0.1, "Annihilators and compact-open Fourier identities" (AL.0.1.7 and AL.0.1.13, with counting measures). AL.0.3, which the review proposes, treats distributions on Schwartz–Bruhat spaces and has no finite-group orthogonality.

## H23 (kim-em) — applied

`kronecker_functional_equation` now also asserts `MeromorphicOn F Set.univ ∧ MeromorphicOn G Set.univ` (`Suggested.lean` line 98), and its docstring says so. §3.4 (line 528) now says "meromorphic continuations". The added conjuncts are true: F and G are fixed on ℂ∖{d} by their series and analyticity, so they agree with the continuations of `kronecker_meromorphic_continuation` applied to Λ and to Λd.

## H24 (kim-em) — answered

No change: the worked example (X⁴−2X²+2, √2∉L, maximal CM subfield ℚ(i), α=(1,2) rejected) is confirmed.

## H25 (kim-em) — applied differently

The premise "triviality on Γ depends on [Σ]" does not hold. For every CM type Σ of ℚ(ζ₈), lifted from ℚ(i) or not, the two embeddings restrict to the two real embeddings of ℚ(√2), so ∏_(σ∈Σ)σ(1+√2)=N(1+√2)=−1 and the type −6 on Σ has value 1. For example, for Σ={ζ₈↦ζ₈, ζ₈↦ζ₈³}, σ₃(√2)=−√2. The Check (line 625) now gives this type-independent reason instead of N_(L/ℚ(i)).

## H26 (kim-em) — applied

The published citation is added to the KS-v4 entry of the References (line 1401): Annals of Mathematics 202 (2025), no. 1, 1–109, doi:10.4007/annals.2025.202.1.1, which I checked on the journal's article page. The entry states that all locators are those of arXiv v4 (see H16).

## H27 (kim-em) — answered

The README names suppliers by roadmap and section, never by pull request, so it needs no change for the merge order. This repair adds one open supplier, MordellLawrenceVenkatesh, which is earlier in the merge order; the worker should add it to the merge-order paragraph alongside ComplexMultiplicationAndExplicitReciprocity, AbelianSchemesAndArithmeticModuliPartII and PeriodsAndSpecialValues. The other new suppliers are all on main: ShimuraVarieties, AutomorphicGaloisRepresentationsPartII and AnalyticNumberTheoryPartI.

## Ownership and library checks

- **Weil's classification** has no owner. `roadmaps grep` over main and every open head found no target classifying infinity types trivial on finite-index units. At the Tau Ceti pin, `HeckeCharacter.finiteIndex_embeddingCharacter_units_ker` (the unit kernel of a Hecke character's type has finite index) and `HeckeCharacter.add_conjugate_eq_add_conjugate` (purity for the fixed conjugation) start from a Hecke character and are weaker. So §0.1 owns the classification.
- **Maximal CM subfield.** Mathlib has `IsCMField` and `maximalRealSubfield` and nothing more; Tau Ceti's `ComplexConjugation/*` has no maximal CM subfield. MordellLawrenceVenkatesh §1.4 owns it.
- **Open roadmaps read.** ComplexMultiplicationAndExplicitReciprocity and MordellLawrenceVenkatesh are not among the checkouts in `open-pull-requests.md`, so I read them at their heads with `roadmaps show`. I read AbelianSchemesAndArithmeticModuliPartII in its listed checkout.
- **Sources.** Nothing was fetched and `needs-references.toml` is not written: the paywalled Annals version is the same work as the waived KS-v4 key.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Weil (⇒): trivial on finite-index Γ ⇒ conjugate sums constant | ℚ(i,√(1+i)), α=(1,2); d=1 ℚ(i) | sums −1 ≠ −2, so not trivial; at d=1 the unit rank is 0, every type is trivial on {1}, and there is one pair, so the sum is constant | holds | Check line 67 |
| Weil (⇐): pullback with parallel sum is trivial on finite index | ℚ(ζ₈), F=ℚ(√2), u=1+√2, w=−2 | u^μ₀=N(u)^w=(−1)^(−2)=1 | holds | proof route line 61 |
| No CM subfield ⇒ constant types, Crit empty | any totally imaginary L | units have N=+1, so constants are trivial; Σ_μ is ∅ or all | holds | line 45 |
| Crit_L/Σ_μ API | μ=0; (−1,−1) on ℚ(i); (−2,1) on ℚ(i) | Σ_0=∅ (not CM); both embeddings (not CM); {id}, a=1, β=1 | holds both directions | Check line 66 |
| Crit_L(Γ)⊆Crit_L(Γ′) | ℚ(i), Γ=μ₄, Γ′=1, μ=(−2,1) | i^(−2)(−i)=i≠1, so μ∉HCI(μ₄) but μ∈HCI(1) | inclusion strict | none |
| μ_χ=−n | χ((λ))=λ⁻⁴ on ℚ(i) | n=+4 at id, μ=−4; Σ_n=∅ would reject | holds | Check line 70 |
| Lifted from K′ ⇒ from K; types lost with K′ | ℚ(ζ₈) ⊃ ℚ(i) | 2 of 4 CM types lifted from ℚ(i); {1,3} not | holds | Check line 69 |
| ⟨·,·⟩_top scale and sign | ℂ/ℤ[i], t=±1 | q=t/π, ⟨γ,γ′⟩=2πit·Im(γ′barγ), Ω∨=2ti=2πiq/barΩ; mixed signs give −2πiq/barΩ | sign-free | Check line 710 |
| ξ∨ isomorphism onto H₁(A∨) | same | ξ∨(1/(2i))=−t; ξ∨(ℤ[i])=2ℤ[i], index 4 | holds | Check line 710 |
| Ω(σ), Ω∨(τ) ≠ 0 | d=1 | Ω=0 ⇒ lattice 0, contradicting rank 2 | holds | line 683 |
| Unit change law | ℚ(i), ε=i | Ω→iΩ, Ω∨→iΩ∨, Ω⁴ fixed, Ω not; 2πiq/(−i·barΩ)=i·Ω∨ | consistent | Check line 711 |
| a-structures: existence and uniqueness | ℚ(√−5), a=(2,1+√−5) | no O_L-structure; Aut_(O_L)(a)=±1 | holds | Check line 704 |
| Pullback convention | ℚ(i), γ=i | pullback i, Γ-action −i, Lie i (matches §0.2 Check) | consistent | line 77 |
| Avatar conversion r_(p,ι)(χ)⁻¹ | ℚ(i), p=5, f=(3), χ=λ⁻⁴, u=7 | χ_fin=1, ψ(q_f(7))=7⁻⁴=1/2401, as in the §8.3 Check | consistent | contract line 1327 |
| §4.1 Check, triviality on ⟨1+√2⟩ | Σ={1,5} and {1,3} on ℚ(ζ₈) | σ₁σ₅(1+√2)=σ₁σ₃(1+√2)=−1; (−1)^(−6)=1 | holds for every Σ | line 625 |
| MeromorphicOn F, G | Λ, and Λd as a full lattice | equal to theorem-1 continuations on ℂ∖{d} by the identity theorem | true | Suggested.lean line 98 |

**Binders.** `Suggested.lean` has no section `variable` block, and its only change adds two conjuncts to the conclusion of `kronecker_functional_equation`. So no binder can be lost, and the other elaborated types are those in `signatures.md`. I did not elaborate a separate `#check @name` file, because this job may run only the module build and the gate; the build below elaborates the changed file.

## Build and gate

- `lake build TauCetiRoadmap.AutomorphicPadicLFunctionsPartII.Suggested`: Build completed successfully (8976 jobs). The only warnings are `declaration uses sorry` at `Suggested.lean` lines 67 and 91.
- Gate: `gate AutomorphicPadicLFunctionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
